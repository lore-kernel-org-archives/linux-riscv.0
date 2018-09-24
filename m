From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 24 Sep 2018 13:55:04 -0700
Subject: [PATCH] RISCV: Fix end PFN for low memory
In-Reply-To: <20180917140816.GA28689@infradead.org>
References: <1536690618-9157-1-git-send-email-atish.patra@wdc.com>
 <20180917140816.GA28689@infradead.org>
Message-ID: <50f35396-9e2b-c177-6a96-9c450c7abdde@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/17/18 7:08 AM, Christoph Hellwig wrote:
> On Tue, Sep 11, 2018 at 11:30:18AM -0700, Atish Patra wrote:
>> Use memblock_end_of_DRAM which provides correct last low memory
>> PFN. Without that, DMA32 region becomes empty resulting in zero
>> pages being allocated for DMA32.
>>
>> This patch is based on earlier patch from palmer which never
>> merged into 4.19. I just edited the commit text to make more
>> sense.
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Palmer, can you queue this up for 4.19?
> 
Hi Palmer,
I did not see this one pulled into your rc6 PR.
Not sure if it was intentional or just lost in heap of emails.


Regards,
Atish
