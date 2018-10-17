From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 17 Oct 2018 12:54:29 -0700 (PDT)
Subject: [PATCH, v2] RISC-V: Add futex support.
In-Reply-To: <20181017171528.GA5834@infradead.org>
Message-ID: <mhng-8d09cde3-412a-47f1-b964-ad6c70af26a3@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 17 Oct 2018 10:15:28 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Oct 16, 2018 at 02:42:59PM -0700, Jim Wilson wrote:
>> Updated as per sugestions from Christoph Hellwig.
>
> This tends to go under the ---, but I guess Palmer can just snip it
> when applying.
>
>> +/* Copyright (c) 2006  Ralf Baechle (ralf at linux-mips.org)
>> + * Copyright (c) 2018  Jim Wilson (jimw at sifive.com)
>> + */
>
> Nipick: the /* should be on a line of its own.
>
> Except for that this looks fine to me:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

I fixed the comment, cleaned up the commit message a bit, and added this to 
for-next.
