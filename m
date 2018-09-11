From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 11 Sep 2018 11:31:33 -0700
Subject: Memory allocation failure using GFP_DMA32 in 4.19-rc2
In-Reply-To: <20180911061619.GA15060@infradead.org>
References: <3aa15803-e86a-7aa2-e57c-93e43c3d046f@wdc.com>
 <20180910135231.GA19320@infradead.org>
 <de897a8b-4961-247e-e90c-c5132bddf125@wdc.com>
 <20180911061619.GA15060@infradead.org>
Message-ID: <d7fbf697-1d2a-3c41-b20d-d1037e623730@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/10/18 11:16 PM, Christoph Hellwig wrote:
> On Mon, Sep 10, 2018 at 06:13:07PM -0700, Atish Patra wrote:
>> The above issue can be fixed by your patch which was present in one of the
>> wip-dma branch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=wip-dma&id=004baee3b83c7ce1c70ff0b7a15fbc3946278af4
> 
> Hmm. I'm not even sure I wrote it that way, it might have been a fixup
> from Palmer.  Either way we should get it into 4.19-rc.
> 

Sent the patch.

Regards,
Atish
