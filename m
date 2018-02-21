From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 21 Feb 2018 13:25:39 -0800 (PST)
Subject: [palmer:riscv-all 16/19] u54-prci.c:undefined reference to
 `__udivdi3'
In-Reply-To: <201802151015.3sKQF3sb%fengguang.wu@intel.com>
Message-ID: <mhng-424a88a7-444e-4431-8f25-868d3eb724de@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 14 Feb 2018 18:01:18 PST (-0800), fengguang.wu at intel.com wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux riscv-all
> head:   a5d2261cffae7dcd71f5c461bb3720de9701d58d
> commit: eacdf805201efc688d056aeb9c82947943ddc240 [16/19] automerging branch "kernel.org-palmer-linux/wip-prci_clock" into "riscv-all"
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout eacdf805201efc688d056aeb9c82947943ddc240
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    drivers/clk/sifive/u54-prci.o: In function `sifive_u54_pll_configure':
>>> u54-prci.c:(.text+0x12a): undefined reference to `__udivdi3'
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

This should be fixed as of the latest riscv-all, which is generating now.
