From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 2 Aug 2018 04:41:48 -0700
Subject: [PATCH v3 4/4] Add an option to support no-FPU systems
In-Reply-To: <1533188391-5932-5-git-send-email-alankao@andestech.com>
References: <1533188391-5932-1-git-send-email-alankao@andestech.com>
 <1533188391-5932-5-git-send-email-alankao@andestech.com>
Message-ID: <20180802114148.GD17108@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 01:39:51PM +0800, Alan Kao wrote:
> FP codes have been separated from common part in previous patches.
> This patch add the CONFIG_FPU option and some stubs to support
> no-FPU systems.

I think the subject should be 'allow to disable FPU support'.

As discussed in the other thread we should be able to detect
systems without FPU and handle them fine even with FPU support built
in.  Even with that I think this patch is otherwise fine and the
detection can be layered on top.  One more nitpick below:

> +#else
> +#define save_fp_state(task, regs) (0)
> +#define restore_fp_state(task, regs) (0)
> +#define fstate_save(task, regs) do { } while (0)
> +#define fstate_restore(task, regs) do { } while (0)
> +#define __switch_to_aux(__prev, __next) do { } while (0)
> +#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_OFF)
> +#endif

Please move the stubs for functions that are static in signal.c
into signal.c as well - you already have a CONFIG_FPU ifdef block
in that file anyway.
