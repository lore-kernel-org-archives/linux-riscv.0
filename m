From: palmer@dabbelt.com (Palmer Dabbelt)
Date: Wed, 21 Feb 2018 09:11:25 -0800 (PST)
Subject: [palmer:riscv-all 12/17]
 ./arch/riscv/include/generated/asm/handle_irq.h:1:10: fatal error:
 asm-generic/handle_irq.h: No such file or directory
In-Reply-To: <201802131408.nypZx7W2%fengguang.wu@intel.com>
Message-ID: <mhng-08e6ff1c-dcc7-4887-a96e-59dd5f6f58a6@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Sorry this took a while, but this should be fixed as of the latest riscv-all 
(which I'm just generating now).

On Mon, 12 Feb 2018 22:07:09 PST (-0800), fengguang.wu at intel.com wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux riscv-all
> head:   f28d76531b90c6269c90637a588c357cfaccf1ae
> commit: 4a054d01516e4635a6b9db44579203a601bd0c46 [12/17] automerging branch "kernel.org-palmer-linux/wip-irq-2-hlic" into "riscv-all"
> config: riscv-defconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 4a054d01516e4635a6b9db44579203a601bd0c46
>         # save the attached .config to linux build tree
>         make.cross ARCH=riscv
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/irqchip/irq-riscv-intc.c:26:0:
>>> ./arch/riscv/include/generated/asm/handle_irq.h:1:10: fatal error: asm-generic/handle_irq.h: No such file or directory
>     #include <asm-generic/handle_irq.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
