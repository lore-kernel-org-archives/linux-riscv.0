From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 17 Oct 2018 10:15:28 -0700
Subject: [PATCH, v2] RISC-V: Add futex support.
In-Reply-To: <20181016214259.12063-1-jimw@sifive.com>
References: <20181016214259.12063-1-jimw@sifive.com>
Message-ID: <20181017171528.GA5834@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 16, 2018 at 02:42:59PM -0700, Jim Wilson wrote:
> Updated as per sugestions from Christoph Hellwig. 

This tends to go under the ---, but I guess Palmer can just snip it
when applying.

> +/* Copyright (c) 2006  Ralf Baechle (ralf at linux-mips.org)
> + * Copyright (c) 2018  Jim Wilson (jimw at sifive.com)
> + */

Nipick: the /* should be on a line of its own.

Except for that this looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>
