From: hch@lst.de (Christoph Hellwig)
Date: Fri, 3 Aug 2018 14:33:57 +0200
Subject: [PATCH 09/11] RISC-V: Support per-hart timebase-frequency
In-Reply-To: <fef973e1-6efc-0eff-2789-4a4b5b01900b@wdc.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-10-hch@lst.de>
 <fef973e1-6efc-0eff-2789-4a4b5b01900b@wdc.com>
Message-ID: <20180803123357.GC18301@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 02, 2018 at 03:19:49PM -0700, Atish Patra wrote:
> On 8/2/18 4:50 AM, Christoph Hellwig wrote:
>> From: Palmer Dabbelt <palmer@sifive.com>
>>
>> Follow the updated DT specs and read the timebase-frequency from the
>> CPU 0 node.
>>
>
> However, the DT in the HighFive Unleashed has the entry at the wrong place.
>
> Even the example in github also at wrong place.
> https://github.com/riscv/riscv-device-tree-doc/pull/8/commits/2461d481329c55005fcbe684f0d6bdb3b7f0a432
>
> DT should be consistent between Documentation and the one in the hardware. 
> I can fix them in bbl & submit a bbl patch. But I am not sure if that's an 
> acceptable way to do it.

I'll need to have comments from Palmer and/or someone else at SiFive
here.  Personally I really don't care where we document the timebase,
as this patch supports both locations anywhere.  For now I'll just update
the commit log to state that more explicitly.
