From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 18 May 2018 17:37:40 -0700 (PDT)
Subject: [PATCH v2 0/2] Fix timer initialization and Add support hotplug.
In-Reply-To: <1525903342-191948-1-git-send-email-atish.patra@wdc.com>
Message-ID: <mhng-bca33b19-024e-4906-9dfe-2dc542d4d98c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 09 May 2018 15:02:20 PDT (-0700), atish.patra at wdc.com wrote:
> The patch (1/2)fixes issues around timer initialization. This fix is
> required for CPU hotplug to work. That's why they are clubbed into one
> series. I can separate them if required.
>
> Changes from v1 to v2:
> 1. Removed compiler warnings about unused variables.
>
> Atish Patra (2):
>   RISCV: Register clocksource and events correctly
>   RISCV: Support cpu hotplug.
>
>  arch/riscv/Kconfig                | 11 ++++++-
>  arch/riscv/include/asm/csr.h      |  1 +
>  arch/riscv/include/asm/smp.h      |  9 ++++--
>  arch/riscv/kernel/head.S          | 12 +++++++
>  arch/riscv/kernel/process.c       |  7 +++++
>  arch/riscv/kernel/setup.c         | 17 ++++++++++
>  arch/riscv/kernel/smpboot.c       | 66 +++++++++++++++++++++++++++++++++++++--
>  arch/riscv/kernel/time.c          |  9 +-----
>  arch/riscv/kernel/traps.c         |  6 ++--
>  drivers/clocksource/riscv_timer.c | 44 +++++++++++++++++---------
>  include/linux/cpuhotplug.h        |  1 +
>  11 files changed, 150 insertions(+), 33 deletions(-)

Sorry I'm a bit slow here: I was meaning to fix this up.  I think this patch 
set was made against something like riscv-all, which has a bunch of additional 
cruft in it.  Do you mind updating it to be against Linus' master?
