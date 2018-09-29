From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 28 Sep 2018 17:13:34 -0700 (PDT)
Subject: [PATCH v5 00/12] SMP cleanup and new features
In-Reply-To: <1536863825-66808-1-git-send-email-atish.patra@wdc.com>
Message-ID: <mhng-206c9841-0e02-4d09-8860-160c0d917c94@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 13 Sep 2018 11:36:53 PDT (-0700), atish.patra at wdc.com wrote:
> This patch series has updated the assorted cleanup series by palmer.
> The original cleanup patch series can be found here.
> http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html
>
> It also implemented decoupling linux logical CPU ids from hart id.
> Some of the work has been inspired from ARM64.
> Tested on QEMU & HighFive Unleashed board with/without SMP enabled.
>
> Both the patch series have been combined to avoid conflicts as a lot
> of common code is changed in both the series. I have mostly addressed
> review comments and fixed checkpatch errors from palmer's series.
>
> v1->v2:
>
> 1. Dropped cpu_ops patch.
> 2. Moved back IRQ cause definitions to irq.h
> 3. Keep boot CPU hart id and assign zero as the CPU id for boot CPU.
> 4. Renamed CPU id and hart id correctly.
>
> v2-v3:
>
> 1. Added cleanup patches from palmer.
> 2. Moved the hotplug related functions to it's own file.
> 3. Updated stub functions as per coding guidelines.
> 4. Renamed __cpu_logical_map to a more coherent name.
>
> v3-v4:
>
> 1. Addressed minor typos in commit text and code.
> 2. Included Anup's do_IRQ patch.
> 3. Dropped CPU hotplug patch. As there are some concerns
>    about approach, I will submit it separately.
>
> v4->v5:
>
> 1. Minor typo fixes in commit text.
>
> Anup Patel (1):
>   RISC-V: No need to pass scause as arg to do_IRQ()
>
> Atish Patra (4):
>   RISC-V: Disable preemption before enabling interrupts
>   RISC-V: Use WRITE_ONCE instead of direct access
>   RISC-V: Add logical CPU indexing for RISC-V
>   RISC-V: Use Linux logical CPU number instead of hartid
>
> Palmer Dabbelt (7):
>   RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
>   RISC-V: Filter ISA and MMU values in cpuinfo
>   RISC-V: Comment on the TLB flush in smp_callin()
>   RISC-V: Provide a cleaner raw_smp_processor_id()
>   RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
>   RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
>   RISC-V: Use mmgrab()
>
>  arch/riscv/include/asm/processor.h |  2 +-
>  arch/riscv/include/asm/smp.h       | 38 ++++++++++++-----
>  arch/riscv/include/asm/tlbflush.h  | 16 ++++++--
>  arch/riscv/kernel/cacheinfo.c      |  7 ----
>  arch/riscv/kernel/cpu.c            | 83 ++++++++++++++++++++++++++++++++------
>  arch/riscv/kernel/entry.S          |  1 -
>  arch/riscv/kernel/head.S           |  4 +-
>  arch/riscv/kernel/irq.c            |  4 +-
>  arch/riscv/kernel/setup.c          | 10 +++++
>  arch/riscv/kernel/smp.c            | 43 +++++++++++++++-----
>  arch/riscv/kernel/smpboot.c        | 46 ++++++++++++++-------
>  drivers/clocksource/riscv_timer.c  | 12 ++++--
>  drivers/irqchip/irq-sifive-plic.c  | 10 +++--
>  13 files changed, 207 insertions(+), 69 deletions(-)

I didn't look closely because I assume your cleanups are better than mine, and 
than you at least gave this a boot test to ensure I didn't do anything too 
stupid :)

I'm preparing our first meaningful for-next now, I'll drop this one in.

Thanks for taking this over!
