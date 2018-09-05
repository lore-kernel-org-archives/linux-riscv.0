From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 5 Sep 2018 22:46:44 +0200
Subject: [PATCH -next] RISC-V: Request newstat syscalls
In-Reply-To: <1536158166-3397-1-git-send-email-linux@roeck-us.net>
References: <1536158166-3397-1-git-send-email-linux@roeck-us.net>
Message-ID: <CAK8P3a1cM_StS=mrUCu=-3vahUX=oBa-4t=qvuvjRiC37+Tm=Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 4:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Since commit 82b355d161c9 ("y2038: Remove newstat family from default
> syscall set"), riscv images fail to boot with the following error.
>
> /sbin/init: error while loading shared libraries: libc.so.6:
>         cannot stat shared object: Error 38
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
>
> Explicitly request newstat syscalls to fix the problem.
>
> Fixes: 82b355d161c9 ("y2038: Remove newstat family from default syscall set")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I would suggest to merge this patch with the offending patch.

Looks good, thanks for the fix!

Sorry about taking too long to respond to your original bug report. I
applied the patch on top of the rest of the series  and pushed it out
to my public tree for tomorrow's linux-next.

       Arnd
