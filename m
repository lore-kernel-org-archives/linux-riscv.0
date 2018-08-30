From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:31:15 -0700
Subject: [PATCH 3/5] Cleanup ISA string setting
In-Reply-To: <1535332075-5727-4-git-send-email-alankao@andestech.com>
References: <1535332075-5727-1-git-send-email-alankao@andestech.com>
 <1535332075-5727-4-git-send-email-alankao@andestech.com>
Message-ID: <20180830143115.GA11544@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 27, 2018 at 09:07:53AM +0800, Alan Kao wrote:
> This patch cleanup the MARCH string passing to both compiler and
> assembler.  Note that the CFLAGS should not contain "fd" before we
> have mechnisms like kernel_fpu_begin/end in other architectures.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
