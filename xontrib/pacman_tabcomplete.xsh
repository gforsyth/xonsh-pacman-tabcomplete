def search_pacman(query):
    results = set()
    #splitting leaves every other line with package version info
    package_list = $(pacman -Q).split()[::2]
    for package_name in package_list:
        if package_name.startswith(query):
            results.add(package_name)

    return results

def pacman_completer(prefix, line, begidx, endidx, ctx):
    """
    Completes pacman remove command with installed package names
    """
    if "pacman" in line:
        return search_pacman(prefix)

__xonsh_completers__['auto_pacman'] = pacman_completer
