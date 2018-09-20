From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 19 Sep 2018 22:26:29 -0700 (PDT)
Subject: Memory allocation failure using GFP_DMA32 in 4.19-rc2
In-Reply-To: <20180911061619.GA15060@infradead.org>
Message-ID: <mhng-eb0d2263-4a87-4746-9a15-00d6c81d39e6@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 10 Sep 2018 23:16:19 PDT (-0700), Christoph Hellwig wrote:
> On Mon, Sep 10, 2018 at 06:13:07PM -0700, Atish Patra wrote:
>> The above issue can be fixed by your patch which was present in one of the
>> wip-dma branch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=wip-dma&id=004baee3b83c7ce1c70ff0b7a15fbc3946278af4
>
> Hmm. I'm not even sure I wrote it that way, it might have been a fixup
> from Palmer.  Either way we should get it into 4.19-rc.

Hm, odd, I don't remember writing that either.  I might just have been pattern 
matching everyone else's setup code, though, as I do remember having touched 
this at some point.

Atish: can you pull this patch out, make sure it's sane, and then submit it to 
the mailing list?  I'll slurp it up in a bit...
