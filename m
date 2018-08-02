From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 2 Aug 2018 04:38:42 -0700
Subject: [PATCH v3 3/4] Cleanup ISA string setting
In-Reply-To: <1533188391-5932-4-git-send-email-alankao@andestech.com>
References: <1533188391-5932-1-git-send-email-alankao@andestech.com>
 <1533188391-5932-4-git-send-email-alankao@andestech.com>
Message-ID: <20180802113842.GC17108@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org



On Thu, Aug 02, 2018 at 01:39:50PM +0800, Alan Kao wrote:
> The reason that we cannot follow the review's suggestion in
> https://lkml.org/lkml/2018/6/21/39 is because using "+=" as the
> connector in Makefile introduces blanks bewteen the left-hand
> side alphabets.

That normally goes into the reply to the suggestion, not into the
changelog, so please drop it.

> 
> Note: (Assume that atomic and compressed is on)
> 
> Before this patch, assembler was always given the riscv64imafdc
> MARCH string because there are fld/fsd's in entry.S; compiler was
> always given riscv64imac because kernel doesn't need floating point
> code generation.  After this, the MARCH string in AFLAGS and CFLAGS
> become the same.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
