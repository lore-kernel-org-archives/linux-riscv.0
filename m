From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 18 May 2018 10:30:20 -0700 (PDT)
Subject: correct Device tree entry for HighFive Unleashed Board ?
In-Reply-To: <65e845f9-eaae-4605-8722-2eefbb1fedf0@wdc.com>
Message-ID: <mhng-80af8220-f9aa-484c-8345-5bcc1b5584cc@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 01 May 2018 18:40:07 PDT (-0700), atish.patra at wdc.com wrote:
> Hi Palmer,
> I was going through the device tree entries for HighFive Unleashed
> board. Here are some of the inconsistencies I found as per the device
> tree standard. I was not sure about the original intention of the
> changes. Hence the questions instead of the patch :) :).
>
> As per the device tree documentation, next-level-cache should point to a
> <phandle> to the next level cache only.
>
> 1. The current entry seems incorrect considering two entries. While 0x2
> phandle points to L2 cache controller correctly, 0x1 phandle points to
> "error-device at 18000000" which did not make any sense to me.
> .....
>                   cpu at 1 {
>
>
>
>                          clock-frequency = <0x0>;
>
>
>
>                          compatible = "sifive,rocket0", "riscv";
>
>
>
>                          d-cache-block-size = <0x40>;
>
>
>
>                          ....
> 			mmu-type = "riscv,sv39";
>
>
>
>                          next-level-cache = <0x1 0x2>;
> .....
>
> In my opinion, it should only point to phandle of L2 cache controller.

I buy that.  My copy of the DT spec says

    next-level-cache
    SD
    <phandle>
    If present, indicates that another level of cache exists. The value is the 
    phandle of the next level of cache. The phandle value type is fully 
    described in section 2.3.3.

which makes it seem like there should only be one phandle here, and the L2 
cache is the more reasonable one to pick.  I think we probably have two because 
these caches can probably cache from either of those, but it doesn't make a 
whole lot of sense to bother with the error device.

> 2. The L2 cache controller contains 3 entries in next-level-cache.
> The phandles belong to rom at a000000, chiplink at 40000000, memory at 80000000.
>
>       cache-controller at 2010000 {
>
>
>
>                          cache-block-size = <0x40>;
>
>
>
>                          cache-level = <0x2>;
>
>
>
>                          cache-sets = <0x800>;
>
>
>
>                          cache-size = <0x200000>;
>
>
>
>                          cache-unified;
>
>
>
>                          compatible = "sifive,ccache0", "cache";
>
>
>
>                          interrupt-parent = <0xb>;
>
>
>
>                          interrupts = <0x1 0x2 0x3>;
>
>
>
>                          next-level-cache = <0xc 0xd 0xe>;
>
>
>
>                          reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000
> 0x0 0x2000000>;
>
>
>                          reg-names = "control", "sideband";
>
>
>
>                          linux,phandle = <0x2>;
>
>
>
>                          phandle = <0x2>;
>
>
>
>                  };
>
>
>
>
> In my opinion, there shouldn't be any next-level-cache as there is no L3
> cache in the board.
>
> Moreover, cache-controller entry should be inside "cpus" instead of "soc".

That matches my reading of the spec as well.

> Please let me know if I am wrong in either my understandings of cache
> hierarchy or specific device tree entry purpose. I will send a patch
> if suggested changes looks good.

Ya, I think in this case we're just generating "next-level-cache" from "what's 
on the other side of this cache", even if that other thing isn't actually a 
cache.

We should fix these in the actual device tree in the FSBL.
