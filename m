From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:40:10 -0700
Subject: [PATCH 3/8] RISC-V: Rename riscv_of_processor_hart to
 riscv_of_processor_hartid
In-Reply-To: <20180827184243.25344-4-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-4-palmer@sifive.com>
Message-ID: <20180830144010.GE11544@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> +/* Returns the hart ID of the given device tree node, or -1 if the device tree
> + * node isn't a RISC-V hart. */

In addition to the comment formatting: we usually keep the description
near the implementation, not the header.  It could also become a
kerneldoc comment for added clarity.

> +extern int riscv_of_processor_hartid(struct device_node *node);

No need to declare function prototypes in headers with the extern
attribute, btw.
