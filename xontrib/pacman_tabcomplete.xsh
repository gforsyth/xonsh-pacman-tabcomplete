def _search_pacman(query, installed=True, remote=False):
    results = set()
    if installed is True:
        #use -q quiet flag to list only package names
        package_list = $(pacman -Qq).split()
    elif remote is False:
        package_list = _full_list(remote=False)
    else:
        package_list = _full_list(remote)
    for package_name in package_list:
        if package_name.startswith(query):
            results.add(package_name)

    return results


def _full_list(remote=False):
    if remote:
        package_list = $(pacman -Ssq).split()
    else:
        package_list = $(pacman -Qsq).split()
    return package_list


def _pacman_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes pacman remove command with installed package names
    """
    if 'pacman' in line and '-R' in line:
        return _search_pacman(prefix)
    elif 'pacman' in line and '-Ss' in line:
        return _search_pacman(prefix, installed=False, remote=True)
    elif 'pacman' in line and '-Qs' in line:
        return _search_pacman(prefix, installed=False, remote=False)

#add to list of completers
__xonsh_completers__['pacman'] = _pacman_completer
#bump to top of list (otherwise bash completion interferes)
__xonsh_completers__.move_to_end('pacman', last=False)
