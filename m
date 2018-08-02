From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 2 Aug 2018 04:37:27 -0700
Subject: [PATCH v3 2/4] Refactor FPU codes in signal setup/return
 procedures
In-Reply-To: <1533188391-5932-3-git-send-email-alankao@andestech.com>
References: <1533188391-5932-1-git-send-email-alankao@andestech.com>
 <1533188391-5932-3-git-send-email-alankao@andestech.com>
Message-ID: <20180802113727.GB17108@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

s/codes/code/ in the subject.  Also a little explanation of why
you refactor it in the patch description would be helpful.

> +static long restore_fp_state(struct pt_regs *regs,
> +	union __riscv_fp_state *sc_fpregs)

Please add another tab for the indentation here even if the original
code got it wrong.

> +static long save_fp_state(struct pt_regs *regs,
> +	union __riscv_fp_state *sc_fpregs)

Same here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
