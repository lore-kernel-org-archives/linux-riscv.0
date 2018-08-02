From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 2 Aug 2018 03:05:18 -0700
Subject: [PATCH] RISC-V: Add the directive for alignment of stvec's value
In-Reply-To: <1529545207-26999-1-git-send-email-zong@andestech.com>
References: <1529545207-26999-1-git-send-email-zong@andestech.com>
Message-ID: <20180802100518.GA4144@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 09:40:07AM +0800, Zong Li wrote:
> The stvec's value must be 4 byte alignment by specification definition.
> This directive avoids to stvec be set the non-alignment value by the
> following code in head.S
> 
>  /* Point stvec to virtual address of intruction after satp write */
> la a0, 1f
> add a0, a0, a1
> csrw stvec, a0
> 
> Signed-off-by: Zong Li <zong@andestech.com>

Just noticed this didn't get picked up yet, so:

Reviewed-by: Christoph Hellwig <hch@lst.de>
