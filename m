From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 10 Sep 2018 07:53:33 +0200
Subject: [GIT PULL] RISC-V: A single fix for 4.19-rc3
In-Reply-To: <mhng-bcd3f712-980c-425d-ac55-a322d54dd8bb@palmer-si-x1c4>
References: <mhng-bcd3f712-980c-425d-ac55-a322d54dd8bb@palmer-si-x1c4>
Message-ID: <CAEn-LTrXFsJJ1iQFrCFZQ_UdFwT96VpYSVhUHYDCh1ns=eSODA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 2:13 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 57361846b52bc686112da6ca5368d11210796804:
>
>   Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-rc3
>
> for you to fetch changes up to e866d3e84eb7c9588afb77604d417e8cc49fe216:
>
>   riscv: Do not overwrite initrd_start and initrd_end (2018-09-04 17:04:50 -0700)
>
> ----------------------------------------------------------------
> RISC-V: A single fix for 4.19-rc3
>
> This tag contains what I hope to be the last RISC-V patch for 4.19.  It
> fixes a bug in our initramfs support by removing some broken and
> obselete code.
>
> ----------------------------------------------------------------
> Guenter Roeck (1):
>       riscv: Do not overwrite initrd_start and initrd_end
>
>  arch/riscv/kernel/setup.c | 7 -------
>  1 file changed, 7 deletions(-)
>

Hi,

Was this sent only to linux-riscv mailing-list? I don't see anyone
else in CC field.

I checked -rc3 today, and I don't see this patch there.

david
