Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8793EF44872
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmJzXnbfR+S+cCPixjX3+MvlBBl0r9gxlYNU800U7vw=; b=Dk+OGpvbuPZfqa
	3RdRq4IDS3xOCBz3+9II69oR6DryqHAEA2SKzcIqpKlx/aSyaOVO/wkZgjJnHRYCr92Bw7A0ubfbE
	6s4jZTmdRNHK5Ahkin0jCUDgBxYay7ySpkFpBJoEFrbkE+Mnfoo0pyrnNSff/YuyWkFKHwcBL1TIF
	ah2xghJz+3PFDgxfq7vZLDrVJvNuPpBagvpPV8x3GoHzBsvZKAgm6DWR1puaRGzXPcr0ZuA/8yJgM
	5SWMsxAAVcEQXBZ7DoPAFnxZTS26VDu9b8OnqGQglhKkjaHps4+JkGBDRLHrLGIU8ncbsGcXV/YSB
	4N3P3eq5wtWDrlGsCvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCyq-0000000COLe-3Hbx;
	Fri, 10 Apr 2026 14:37:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCyo-0000000COKq-25QZ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 14:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C864344466;
	Fri, 10 Apr 2026 14:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D06C2BC87;
	Fri, 10 Apr 2026 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831825;
	bh=lIPy10seU4u6dXsty190ZSW7/g5QTmitfsih214NoVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UyKzbjNn66GEdbJqVrbPMv7CyLVNPazndTrSz+P4e0qN6uRb4EHUnrKH9qEYBTURK
	 whoeDOK8e/ItAp/cFxz5jn+8fMaRPD0yfdN5QZLTVV6sCgzzkAKtQrt8HyhLpaRfmS
	 8KOULMvM6l88OtOcunsXZNdVdaT6flJZ1GQYxCVI3x34zAfusBnUH62WhVrB3QksyD
	 AsvW21nshwfq7VJyTaUKD0K3CyHDKCA2vzyeGOI0Ur3ZCUdq0dKQjhdLziz4kcmJWQ
	 eYWdyxeFFz0Lz8BvhjDAAiTiwsamKku9/YuyEVNK+9zqiDIAkTh15zrDH0OUjdf5nB
	 CvDUqRl7Yi3zA==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 4/5] irqchip: starfive: Increase the interrupt source
 number up to 64
In-Reply-To: <20260410090106.622781-5-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-5-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:37:02 +0200
Message-ID: <877bqe286p.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_073706_587229_558851C3 
X-CRM114-Status: GOOD (  16.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:

> From: Mason Huo <mason.huo@starfivetech.com>
>
> StarFive JHB100 SoC interrupt controller actually supports 64 interrupt
> sources, the original code only supported up to 32. now it is extended
> to 64.
>
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/irqchip/irq-starfive-jhb100-intc.c | 43 ++++++++++++++--------
>  1 file changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
> index 312a4634870a..d5ecbb603a58 100644
> --- a/drivers/irqchip/irq-starfive-jhb100-intc.c
> +++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
> @@ -18,10 +18,11 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>  
> -#define STARFIVE_INTC_SRC0_CLEAR	0x10
> -#define STARFIVE_INTC_SRC0_MASK		0x14
> -#define STARFIVE_INTC_SRC0_INT		0x1c
> +#define STARFIVE_INTC_SRC_CLEAR(n)	(0x10 + ((n) * 0x20))
> +#define STARFIVE_INTC_SRC_MASK(n)	(0x14 + ((n) * 0x20))
> +#define STARFIVE_INTC_SRC_INT(n)	(0x1c + ((n) * 0x20))
>  
> +#define STARFIVE_INTC_NUM		2
>  #define STARFIVE_INTC_SRC_IRQ_NUM	32
>  
>  struct starfive_irq_chip {
> @@ -53,18 +54,26 @@ static void starfive_intc_bit_clear(struct starfive_irq_chip *irqc,
>  static void starfive_intc_unmask(struct irq_data *d)
>  {
>  	struct starfive_irq_chip *irqc = irq_data_get_irq_chip_data(d);
> +	int i, bitpos;
> +
> +	i = d->hwirq / STARFIVE_INTC_SRC_IRQ_NUM;
> +	bitpos = d->hwirq % STARFIVE_INTC_SRC_IRQ_NUM;
>  
>  	raw_spin_lock(&irqc->lock);
> -	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));
> +	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC_MASK(i), BIT(bitpos));
>  	raw_spin_unlock(&irqc->lock);
>  }

As you are touching this code, please convert the locking to guard()

  	guard(raw_spinlock)(&irqc->lock);
	starfive_intc_bit_clear(irqc, STARFIVE_INTC_SRC0_MASK, BIT(d->hwirq));


> +	for (i = 0; i < STARFIVE_INTC_NUM; i++) {

  for (int i = 0; ...)

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
