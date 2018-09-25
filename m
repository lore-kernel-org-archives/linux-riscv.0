From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 25 Sep 2018 10:03:43 -0700 (PDT)
Subject: [PATCH] RISCV: Fix end PFN for low memory
In-Reply-To: <50f35396-9e2b-c177-6a96-9c450c7abdde@wdc.com>
Message-ID: <mhng-133e3d9b-f580-40d4-bb7a-9cafa72fbb93@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 24 Sep 2018 13:55:04 PDT (-0700), atish.patra at wdc.com wrote:
> On 9/17/18 7:08 AM, Christoph Hellwig wrote:
>> On Tue, Sep 11, 2018 at 11:30:18AM -0700, Atish Patra wrote:
>>> Use memblock_end_of_DRAM which provides correct last low memory
>>> PFN. Without that, DMA32 region becomes empty resulting in zero
>>> pages being allocated for DMA32.
>>>
>>> This patch is based on earlier patch from palmer which never
>>> merged into 4.19. I just edited the commit text to make more
>>> sense.
>>
>> Looks good,
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Palmer, can you queue this up for 4.19?
>>
> Hi Palmer,
> I did not see this one pulled into your rc6 PR.
> Not sure if it was intentional or just lost in heap of emails.

Looks like it got lost, sorry.  It's in my branch now, I might re-spin the rc6 
PR because it looks like I may have screwed it up, if not I'll put it in rc7.

Thanks for the ping!
