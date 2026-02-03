Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5134CE8B363
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bde9mxEer/lrsR9t1316ijnUwpHXJKxAj8r1eJA67d4=; b=Km+yWtrikstYB5
	n8qJZXe6JZ4xuzTbnUbVS0malApYDsX5tVx9SNrUPdQu/iUpV6Y3WCs7+UFggp4La2y3v6Em55lTF
	GvjSCRa72DU9UUbn9BTU75Lpumo7h+lNlHdMCRc5ux6JuXKwKbRw2q2B3/S0F9Ujq0vDhdrQhPxdQ
	5I9mVtIsqmyX9TTEdSn8ZmfhqK/aUAcQrHhlhkq4W/aNOvEyo9MdfnM+pzX1X4fQK51zDWel4rS70
	lyo0HInyNcodGEWmdknztNyVW9T0zIqfMYIY26As+aQl67fTxiDJMSwW9tCdHmrWz0wGnzxoTHZ0/
	1+9DcqfL0I8U2CbW2wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNCf-00000007LLa-3VUZ;
	Tue, 03 Feb 2026 20:40:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNCd-00000007LK3-0JIx
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 20:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C048343491;
	Tue,  3 Feb 2026 20:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE49C116D0;
	Tue,  3 Feb 2026 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770151250;
	bh=WtHWhesjW/7AQMhd0EcPVr+rtp8ksekBPqv0g1ETa3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D/gE3uz/BpckJBJznUVybL13plg0F00fwqbUKVR9DSEJd1M35BU5CosJbLRhVook1
	 e6nI9ItZXg3MD5eLCVH78lpTy9NtsfIjyXsLHYk0oSTFzMPbza3h2voOwmzgb1dL80
	 EPXxBNbWwqnzVyDPkPqU99fezsZVf2RcMbUAJppeaPqlTKVuFnVGj7PTBv0FIT+J6x
	 oFrbgPIotL+1oHywiex5jbgzhAgiL+yX9mf/70X2PK91geINzPDuC3mfLEbxiTqsTT
	 V81et+wzjvQAJsLXjYyoDzvUCuWWuRO3Pg9gGlDUnrGk/y8gI5gZeMtKlQLig5ktS8
	 rbov/4Gfk4ZOA==
From: Thomas Gleixner <tglx@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>, Charles Mirabile
 <cmirabil@redhat.com>, Lucas Zampieri <lzampier@redhat.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Mason Huo
 <mason.huo@starfivetech.com>, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 Marc Zyngier <maz@kernel.org>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Jia Wang
 <wangjia@ultrarisc.com>, Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v3 1/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
In-Reply-To: <tencent_3927462924B7319F8F4F90447BDC110FB705@qq.com>
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
 <tencent_3927462924B7319F8F4F90447BDC110FB705@qq.com>
Date: Tue, 03 Feb 2026 21:40:46 +0100
Message-ID: <87ikcd36i9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_124051_152749_72C15652 
X-CRM114-Status: GOOD (  27.80  )
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

On Wed, Feb 04 2026 at 01:21, Yangyu Chen wrote:
> @@ -351,7 +351,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  	if (ret)
>  		return ret;
>  
> -	for (i = 0; i < nr_irqs; i++) {
> +	for (i = 1; i <= nr_irqs; i++) {
>  		ret = plic_irqdomain_map(domain, virq + i, hwirq + i);

That's just wrong and clearly untested.

@virq and @nr_irqs are provided by the core code and you cannot
manipulate them just because.

This instance of nr_irqs has absolutely nothing to do with the problem
you are trying to solve. The core invokes this to map

    $N (@nr_irqs) Linux interrupt numbers starting from @virq to
    hardware interrupt numbers.

The fwspec argument (@arg) is used to retrieve the hardware interrupt
number from the device tree:

    plic_irq_domain_translate(....);

The device tree better contains the real hardware interrupt number and
not a 0 based enumeration.

>  static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
>  {
> -	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
> +	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs + 1, 32);

Requiring this '+1' muck all over the place is a guarantee for more
disaster.

It's not really hard to sit back and think about it instead of
mindlessly changing things until it looks about right. I'm tired of
wasting my time with reviewing botched up stuff like that.

Untested, but defintely correct patch below. If you find a bug, I owe
you a beer at the next conference.

Thanks,

        tglx
---
Subject: irqchip/sifive-plic: Handle number of hardware interrupts correctly
From: Thomas Gleixner <tglx@kernel.org>
Date: Tue, 03 Feb 2026 20:16:12 +0100

The driver is inconsistently handling the number of hardware interrupts.

The reason is that the firmware enumerates the maximum number of device
interrupts, but the actual number of hardware interrupts is one more
because hardware interrupt 0 is reserved.

There are two loop variants where this matters:

  1) Iterating over the device interrupts

     for (irq = 1; irq < total_irqs; irq++)

  2) Iterating over the number of interrupt register groups

     for (grp = 0; grp < irq_groups; grp++)

The current code stores the number of device interrupts and that requires
to write the loops as:

  1) for (irq = 1; irq <= device_irqs; irq++)

  2) for (grp = 0; grp < DIV_ROUND_UP(device_irqs + 1); grp++)

But the code gets it wrong all over the place. Just fixing up the
conditions and off by ones is not a sustainable solution as the next changes
will reintroduce the same bugs over and over.

Sanitize it by storing the total number of hardware interrupts during probe
and precalculating the number of groups. To future proof it mark
priv::total_irqs __private, provide a correct iterator macro and adjust the
code to this.

Marking it private allows sparse (C=1 build) to catch direct access to this
member:

  drivers/irqchip/irq-sifive-plic.c:270:9: warning: dereference of noderef expression

That should prevent at least the most obvious future damage in that area.

Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
Reported-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 drivers/irqchip/irq-sifive-plic.c |   82 ++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -68,15 +68,17 @@
 #define PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM	1
 
 struct plic_priv {
-	struct fwnode_handle *fwnode;
-	struct cpumask lmask;
-	struct irq_domain *irqdomain;
-	void __iomem *regs;
-	unsigned long plic_quirks;
-	unsigned int nr_irqs;
-	unsigned long *prio_save;
-	u32 gsi_base;
-	int acpi_plic_id;
+	struct fwnode_handle	*fwnode;
+	struct cpumask		lmask;
+	struct irq_domain	*irqdomain;
+	void __iomem		*regs;
+	unsigned long		plic_quirks;
+	/* @device_irqs + 1 to compensate for the reserved hwirq 0 */
+	unsigned int __private	total_irqs;
+	unsigned int		irq_groups;
+	unsigned long		*prio_save;
+	u32			gsi_base;
+	int			acpi_plic_id;
 };
 
 struct plic_handler {
@@ -91,6 +93,12 @@ struct plic_handler {
 	u32			*enable_save;
 	struct plic_priv	*priv;
 };
+
+/*
+ * Macro to deal with the insanity of hardware interrupt 0 being reserved */
+#define for_each_device_irq(iter, priv)	\
+	for (unsigned int iter = 1; iter < ACCESS_PRIVATE(priv, total_irqs); iter++)
+
 static int plic_parent_irq __ro_after_init;
 static bool plic_global_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
@@ -257,14 +265,11 @@ static int plic_irq_set_type(struct irq_
 
 static int plic_irq_suspend(void *data)
 {
-	struct plic_priv *priv;
-
-	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
+	struct plic_priv *priv = this_cpu_ptr(&plic_handlers)->priv;
 
-	/* irq ID 0 is reserved */
-	for (unsigned int i = 1; i < priv->nr_irqs; i++) {
-		__assign_bit(i, priv->prio_save,
-			     readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
+	for_each_device_irq(irq, priv) {
+		__assign_bit(irq, priv->prio_save,
+			     readl(priv->regs + PRIORITY_BASE + irq * PRIORITY_PER_ID));
 	}
 
 	return 0;
@@ -272,18 +277,15 @@ static int plic_irq_suspend(void *data)
 
 static void plic_irq_resume(void *data)
 {
-	unsigned int i, index, cpu;
+	struct plic_priv *priv = this_cpu_ptr(&plic_handlers)->priv;
+	unsigned int index, cpu;
 	unsigned long flags;
 	u32 __iomem *reg;
-	struct plic_priv *priv;
-
-	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
 
-	/* irq ID 0 is reserved */
-	for (i = 1; i < priv->nr_irqs; i++) {
-		index = BIT_WORD(i);
-		writel((priv->prio_save[index] & BIT_MASK(i)) ? 1 : 0,
-		       priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
+	for_each_device_irq(irq, priv) {
+		index = BIT_WORD(irq);
+		writel((priv->prio_save[index] & BIT_MASK(irq)) ? 1 : 0,
+		       priv->regs + PRIORITY_BASE + irq * PRIORITY_PER_ID);
 	}
 
 	for_each_present_cpu(cpu) {
@@ -293,7 +295,7 @@ static void plic_irq_resume(void *data)
 			continue;
 
 		raw_spin_lock_irqsave(&handler->enable_lock, flags);
-		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
+		for (unsigned int i = 0; i < priv->irq_groups; i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			writel(handler->enable_save[i], reg);
 		}
@@ -431,7 +433,7 @@ static u32 cp100_isolate_pending_irq(int
 
 static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
 {
-	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
+	int nr_irq_groups = handler->priv->irq_groups;
 	u32 __iomem *enable = handler->enable_base;
 	irq_hw_number_t hwirq = 0;
 	u32 iso_mask;
@@ -614,7 +616,6 @@ static int plic_probe(struct fwnode_hand
 	struct plic_handler *handler;
 	u32 nr_irqs, parent_hwirq;
 	struct plic_priv *priv;
-	irq_hw_number_t hwirq;
 	void __iomem *regs;
 	int id, context_id;
 	u32 gsi_base;
@@ -647,7 +648,16 @@ static int plic_probe(struct fwnode_hand
 
 	priv->fwnode = fwnode;
 	priv->plic_quirks = plic_quirks;
-	priv->nr_irqs = nr_irqs;
+	/*
+	 * The firmware provides the number of device interrupts. As
+	 * hardware interrupt 0 is reserved, the number of total interrupts
+	 * is nr_irqs + 1.
+	 */
+	nr_irqs++;
+	ACCESS_PRIVATE(priv, total_irqs) = nr_irqs;
+	/* Precalculate the number of register groups */
+	priv->irq_groups = DIV_ROUND_UP(nr_irqs, 32);
+
 	priv->regs = regs;
 	priv->gsi_base = gsi_base;
 	priv->acpi_plic_id = id;
@@ -686,7 +696,7 @@ static int plic_probe(struct fwnode_hand
 				u32 __iomem *enable_base = priv->regs +	CONTEXT_ENABLE_BASE +
 							   i * CONTEXT_ENABLE_SIZE;
 
-				for (int j = 0; j <= nr_irqs / 32; j++)
+				for (int j = 0; j < priv->irq_groups; j++)
 					writel(0, enable_base + j);
 			}
 			continue;
@@ -718,23 +728,21 @@ static int plic_probe(struct fwnode_hand
 			context_id * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
-					       sizeof(*handler->enable_save), GFP_KERNEL);
+		handler->enable_save = kcalloc(priv->irq_groups, sizeof(*handler->enable_save),
+					       GFP_KERNEL);
 		if (!handler->enable_save) {
 			error = -ENOMEM;
 			goto fail_cleanup_contexts;
 		}
 done:
-		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
+		for_each_device_irq(hwirq, priv) {
 			plic_toggle(handler, hwirq, 0);
-			writel(1, priv->regs + PRIORITY_BASE +
-				  hwirq * PRIORITY_PER_ID);
+			writel(1, priv->regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
 		}
 		nr_handlers++;
 	}
 
-	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,
-						   &plic_irqdomain_ops, priv);
+	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain)) {
 		error = -ENOMEM;
 		goto fail_cleanup_contexts;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
