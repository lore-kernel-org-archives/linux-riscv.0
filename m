From: merker@debian.org (Karsten Merker)
Date: Mon, 13 Aug 2018 22:52:57 +0200
Subject: [PULL RFC] RISC-V Updates for the 4.19 Merge Window
In-Reply-To: <mhng-f26c6ad4-70c0-466b-ae53-e504ae8088c4@palmer-si-x1c4>
References: <mhng-f26c6ad4-70c0-466b-ae53-e504ae8088c4@palmer-si-x1c4>
Message-ID: <20180813205257.jy73sthu6l6rmlyn@excalibur.cnev.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 13, 2018 at 01:12:24PM -0700, Palmer Dabbelt wrote:

> Below is the pull request I plan to submit on Wednesday morning.  I'm planning
> on using it as the basis of a riscv-linux-4.18 branch that consists of only
> backports from the upstream kernel, which should make the RISC-V Linux
> ecosystem a whole lot more stable.
[...]
>   git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-mw0

Hello Palmer,

I've just taken a look at the pull request and I'm wondering about
the order of the compatible entries in 

  https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt?id=627672cf431b0379c07cc8d146f907cda6797222#n48
  (containing 'compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";')

and

  https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt?id=b67bc7cb408816b94224a74dff9868d2a38bf30c#n41
  (containing 'compatible = "riscv,cpu-intc", "sifive,fu540-c000-cpu-intc";')

AIUI, the kernel always binds a driver to the first matching
compatible in the list, so if I am not mistaken, the most
specific compatible should be the first in the list, with generic
compatibles following afterwards as fallbacks.  Wouldn't the
order in the above examples therefore have to be the other way
round, i.e.

  compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";

respectively

  compatible = "sifive,fu540-c000-cpu-intc", "riscv,cpu-intc";

?

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten f?r Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
