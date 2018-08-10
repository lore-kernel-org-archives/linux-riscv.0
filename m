From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 10 Aug 2018 11:31:08 -0700
Subject: [RFC] RISC-V: Fix !CONFIG_SMP compilation error
In-Reply-To: <1533597456-245169-1-git-send-email-atish.patra@wdc.com>
References: <1533597456-245169-1-git-send-email-atish.patra@wdc.com>
Message-ID: <b77401db-2bd5-3290-86b3-b173b06f964d@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 8/6/18 4:17 PM, Atish Patra wrote:
> Enabling both CONFIG_PERF_EVENTS without !CONFIG_SMP
> generates following compilation error.
> 
> arch/riscv/include/asm/perf_event.h:80:2: error: expected
> specifier-qualifier-list before 'irqreturn_t'
> 
>    irqreturn_t (*handle_irq)(int irq_num, void *dev);
>    ^~~~~~~~~~~
> 
> Include interrupt.h in proper place to avoid compilation
> error.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/include/asm/perf_event.h | 1 +
>   arch/riscv/kernel/perf_event.c      | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
> index 0e638a0c..aefbfaa6 100644
> --- a/arch/riscv/include/asm/perf_event.h
> +++ b/arch/riscv/include/asm/perf_event.h
> @@ -10,6 +10,7 @@
>   
>   #include <linux/perf_event.h>
>   #include <linux/ptrace.h>
> +#include <linux/interrupt.h>
>   
>   #define RISCV_BASE_COUNTERS	2
>   
> diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
> index b0e10c4e..a243fae1 100644
> --- a/arch/riscv/kernel/perf_event.c
> +++ b/arch/riscv/kernel/perf_event.c
> @@ -27,7 +27,6 @@
>   #include <linux/mutex.h>
>   #include <linux/bitmap.h>
>   #include <linux/irq.h>
> -#include <linux/interrupt.h>
>   #include <linux/perf_event.h>
>   #include <linux/atomic.h>
>   #include <linux/of.h>
> 
ping ?

Regards,
Atish
