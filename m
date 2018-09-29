From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 28 Sep 2018 17:20:45 -0700 (PDT)
Subject: [RFC 2/3] RISC-V:Support per-hart timebase-frequency
In-Reply-To: <20180917142308.GB15588@infradead.org>
Message-ID: <mhng-54e4fe3d-12d8-48c7-b1ea-df317fb3ff3a@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 17 Sep 2018 07:23:08 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Sep 14, 2018 at 02:54:55PM -0700, Atish Patra wrote:
>> Follow the updated DT specs and read the timebase-frequency
>> from the boot cpu. Keep the old DT reading as well for backward
>> compatibility. This patch is rework of old patch from Palmer.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> This setup looks a bit odd because it keeps blindly overwriting
> riscv_timebase for every cpu found.  Shouldn't we at least check that
> they all match for now as the rest of the port assumes that?

I agree.  There should be at least a warning if they don't match, but ideally 
we'd just support per-CPU timebases.  We have those systems already, they just 
don't boot Linux (at least, not yet :)).
