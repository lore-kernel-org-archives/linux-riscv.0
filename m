Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54734E8B399
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 04:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB9tMEMKq4JasH9KoMoMru3ng8mw0NryzwOPDEiQAYM=; b=x+fxVYChfRzMtg
	j8WLMBGW2kfbcw2Ee/4dDoXZo11LAU8pCXNvuwXnTEE0vj+q3/dv+Stl72n71rFaEzczMhODpkcNI
	Gbt5ltPxLOWwGkDW7my3BiGC3mPF6U6LSJrDGPOrP6EPCC5Wp71WPsz1fTaYwsPKcrouBZiRJOWCt
	ylzsVi+LcZ/PpFQcuKCDRmGcOwY8P8CPieKoDRhuOYh+8w/AiStM1J4aHgQLTRvNhZyddR+PA6iN+
	6y6XisFpcnee7LgdwrHIvs7ZHnO16uiWGE9gdT3+zSTO65Y66FTuOO0i3W6+4cS9aoXDsRIEGv8dL
	A7Ic/eMYkOcbiikzPyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUh8-00000007u47-3rWk;
	Wed, 04 Feb 2026 04:40:50 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnUh3-00000007u3I-0NWq
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 04:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1770180039; bh=0k4sYxdy33SWHFV5embihYwhqgjBn6q4PcG3Km5h0l8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Db2cjSqqJ8Kra25YDz51iCjGEOUxGkRiLt7DtnFFRkeoQL+ZoKFj+BrDHHEoFxZAI
	 RZ5WqviIAvA+UkfPCbvq1uW09psZWnkjPYXf+4ynHmaTVAtAm6qCHSv4f/CeTDccss
	 e3jtxwbnqYtC6K924oZJuVKBvepHp+QlZjmt5wd4=
Received: from [IPV6:240e:379:2263:bd00:8442:9387:e12:ac10] ([240e:379:2263:bd00:8442:9387:e12:ac10])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id A228EAFA; Wed, 04 Feb 2026 12:40:34 +0800
X-QQ-mid: xmsmtpt1770180034tikn0wn9u
Message-ID: <tencent_C92E750C550867E30E5FB6E09976A6632A06@qq.com>
X-QQ-XMAILINFO: OATpkVjS499ugQA5an6hXBP00H8t1gMfSqPIr+x+fRrGP4Dy597MJ5eex0Y2+a
	 HTw3RmD5NgHYdFVJr5rnoRGz5XkplJfTq1py9xYn4ENxg6TeuDOEMQ9fT/K03NqC++ElWAGJu6Rc
	 QOU8I3m9N95CO31Tw05qgcL5uTjfv8oHYTHmKfDcw7MuvJFWk6R+QgBH8BiCgzW6zKrUyes22DOC
	 4/c0CiR3XZsqiZ6/3+L0GIfBIzgVDd7eb4vxcX9M5tLCy0r0vFg1WU8qaSDX7gfZOaB97S53EYvq
	 tKQOouYZKkEeGIxcAK1yKju0oEWB3Nq7qo7fjZy6Uizfa9D9Qbmu7mCvYiGedWdudm6CmtfjgQdo
	 JGvc16ea7MFViopOcy0BboOYaAOWtCqdngcLDlgObxKB5MFyi3tn7G7kab8URLJYTy6GU6ynom8h
	 aAdqqOtYePYjhm2IZ0OtWeca3n7RkOPPO7+BJYksjzh6zJ+Wn+JT1uD6bLex0z6yco6d4g7mMinY
	 nR87JyvNHFzKeMK17qKnjHKsQVxysjHXticNYC6CUAPP3hBu4il+YdiTMuGGZErdhgi3w8BdgJ/e
	 RLqCD9JjfvrDOPUS5U2uJef6NHSo7eYyZAErhtPAz9TRgaEbZ0pxadx1LC7fNh7QeuFy9i5IaUSY
	 /mcDYAZVtPLkyoOY7LmynO3KyMCrHB8Orh6xCfFQp95LSCKrv7q+bVTF5IpDIHLG4qpVMdsyalms
	 0x3n4rhZrQe+PLDAu5UllkGcVeUGGDJ4ghxqVSHPOVsA2TATggj7AGehtnjPmXl/AlR0sx1VlLHP
	 hq+zHLVmD26SiacVdmR2HAn1R+rXVOvcAktuRDww5IwZblGl/h9tux4AZOPq1cnjoHEi58RjgL+d
	 mHQLcHBdR63LH5VXRUJWTTGWZAvITLWKL7oNhJ7YzKtKahiflyoUepK1T9+1S8bW7y8ZYiZLEuOt
	 b3eopWL4gQQ/gEZ8OhXTAC/bMHTbYEENzOT/wSenMg9Asr628ZWeYtRAaLbbgLc/z3aaD5D11CI4
	 1u3y53Y9TCqE4fZikg29OiR6kb6baAIexB7tAdGv+7SaTWAJ4097zeTsuo86xc7yLWjUMMzw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <401d0d0c-9f09-4202-a8df-acb315d1f6d0@cyyself.name>
Date: Wed, 4 Feb 2026 12:40:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
To: Thomas Gleixner <tglx@kernel.org>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Charles Mirabile <cmirabil@redhat.com>, Lucas Zampieri
 <lzampier@redhat.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mason Huo <mason.huo@starfivetech.com>,
 Zhang Xincheng <zhangxincheng@ultrarisc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Marc Zyngier <maz@kernel.org>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
 <tencent_3927462924B7319F8F4F90447BDC110FB705@qq.com> <87ikcd36i9.ffs@tglx>
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <87ikcd36i9.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_204045_474451_D87A847F 
X-CRM114-Status: GOOD (  47.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/2/2026 04:40, Thomas Gleixner wrote:
> On Wed, Feb 04 2026 at 01:21, Yangyu Chen wrote:
>> @@ -351,7 +351,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>   	if (ret)
>>   		return ret;
>>   
>> -	for (i = 0; i < nr_irqs; i++) {
>> +	for (i = 1; i <= nr_irqs; i++) {
>>   		ret = plic_irqdomain_map(domain, virq + i, hwirq + i);
> 
> That's just wrong and clearly untested.
> 
> @virq and @nr_irqs are provided by the core code and you cannot
> manipulate them just because.
> 
> This instance of nr_irqs has absolutely nothing to do with the problem
> you are trying to solve. The core invokes this to map
> 
>      $N (@nr_irqs) Linux interrupt numbers starting from @virq to
>      hardware interrupt numbers.
> 
> The fwspec argument (@arg) is used to retrieve the hardware interrupt
> number from the device tree:
> 
>      plic_irq_domain_translate(....);
> 
> The device tree better contains the real hardware interrupt number and
> not a 0 based enumeration.
> 
>>   static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
>>   {
>> -	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
>> +	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs + 1, 32);
> 
> Requiring this '+1' muck all over the place is a guarantee for more
> disaster.
> 
> It's not really hard to sit back and think about it instead of
> mindlessly changing things until it looks about right. I'm tired of
> wasting my time with reviewing botched up stuff like that.
> 

Sorry for that. I haven't tested that on QEMU with interrupt enabled at 
the time of submission, only tested on XiangShan's NEMU [1] without 
interrupt (serial console is handled by sbi hvc pull) to see if the 
memory corruption bug is being resolved. Sorry for the missed coverage. 
And also sorry for my misunderstanding of irq_domain. I have tested it 
today on QEMU, and it even breaks serial interrupts.

[1] https://github.com/OpenXiangShan/NEMU

> Untested, but defintely correct patch below. If you find a bug, I owe
> you a beer at the next conference.
> 
> Thanks,
> 
>          tglx
> ---
> Subject: irqchip/sifive-plic: Handle number of hardware interrupts correctly
> From: Thomas Gleixner <tglx@kernel.org>
> Date: Tue, 03 Feb 2026 20:16:12 +0100
> 
> The driver is inconsistently handling the number of hardware interrupts.
> 
> The reason is that the firmware enumerates the maximum number of device
> interrupts, but the actual number of hardware interrupts is one more
> because hardware interrupt 0 is reserved.
> 
> There are two loop variants where this matters:
> 
>    1) Iterating over the device interrupts
> 
>       for (irq = 1; irq < total_irqs; irq++)
> 
>    2) Iterating over the number of interrupt register groups
> 
>       for (grp = 0; grp < irq_groups; grp++)
> 
> The current code stores the number of device interrupts and that requires
> to write the loops as:
> 
>    1) for (irq = 1; irq <= device_irqs; irq++)
> 
>    2) for (grp = 0; grp < DIV_ROUND_UP(device_irqs + 1); grp++)
> 
> But the code gets it wrong all over the place. Just fixing up the
> conditions and off by ones is not a sustainable solution as the next changes
> will reintroduce the same bugs over and over.
> 
> Sanitize it by storing the total number of hardware interrupts during probe
> and precalculating the number of groups. To future proof it mark
> priv::total_irqs __private, provide a correct iterator macro and adjust the
> code to this.
> 

Your idea is great to prevent future bugs from being produced. Thanks!

> Marking it private allows sparse (C=1 build) to catch direct access to this
> member:
> 
>    drivers/irqchip/irq-sifive-plic.c:270:9: warning: dereference of noderef expression
> 
> That should prevent at least the most obvious future damage in that area.
> 
> Fixes: e80f0b6a2cf3 ("irqchip/irq-sifive-plic: Add syscore callbacks for hibernation")
> Reported-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   drivers/irqchip/irq-sifive-plic.c |   82 ++++++++++++++++++++------------------
>   1 file changed, 45 insertions(+), 37 deletions(-)
> 
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -68,15 +68,17 @@
>   #define PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM	1
>   
>   struct plic_priv {
> -	struct fwnode_handle *fwnode;
> -	struct cpumask lmask;
> -	struct irq_domain *irqdomain;
> -	void __iomem *regs;
> -	unsigned long plic_quirks;
> -	unsigned int nr_irqs;
> -	unsigned long *prio_save;
> -	u32 gsi_base;
> -	int acpi_plic_id;
> +	struct fwnode_handle	*fwnode;
> +	struct cpumask		lmask;
> +	struct irq_domain	*irqdomain;
> +	void __iomem		*regs;
> +	unsigned long		plic_quirks;
> +	/* @device_irqs + 1 to compensate for the reserved hwirq 0 */
> +	unsigned int __private	total_irqs;
> +	unsigned int		irq_groups;
> +	unsigned long		*prio_save;
> +	u32			gsi_base;
> +	int			acpi_plic_id;
>   };
>   
>   struct plic_handler {
> @@ -91,6 +93,12 @@ struct plic_handler {
>   	u32			*enable_save;
>   	struct plic_priv	*priv;
>   };
> +
> +/*
> + * Macro to deal with the insanity of hardware interrupt 0 being reserved */
> +#define for_each_device_irq(iter, priv)	\
> +	for (unsigned int iter = 1; iter < ACCESS_PRIVATE(priv, total_irqs); iter++)
> +
>   static int plic_parent_irq __ro_after_init;
>   static bool plic_global_setup_done __ro_after_init;
>   static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> @@ -257,14 +265,11 @@ static int plic_irq_set_type(struct irq_
>   
>   static int plic_irq_suspend(void *data)
>   {
> -	struct plic_priv *priv;
> -
> -	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
> +	struct plic_priv *priv = this_cpu_ptr(&plic_handlers)->priv;
>   
> -	/* irq ID 0 is reserved */
> -	for (unsigned int i = 1; i < priv->nr_irqs; i++) {
> -		__assign_bit(i, priv->prio_save,
> -			     readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
> +	for_each_device_irq(irq, priv) {
> +		__assign_bit(irq, priv->prio_save,
> +			     readl(priv->regs + PRIORITY_BASE + irq * PRIORITY_PER_ID));
>   	}
>   
>   	return 0;
> @@ -272,18 +277,15 @@ static int plic_irq_suspend(void *data)
>   
>   static void plic_irq_resume(void *data)
>   {
> -	unsigned int i, index, cpu;
> +	struct plic_priv *priv = this_cpu_ptr(&plic_handlers)->priv;
> +	unsigned int index, cpu;
>   	unsigned long flags;
>   	u32 __iomem *reg;
> -	struct plic_priv *priv;
> -
> -	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
>   
> -	/* irq ID 0 is reserved */
> -	for (i = 1; i < priv->nr_irqs; i++) {
> -		index = BIT_WORD(i);
> -		writel((priv->prio_save[index] & BIT_MASK(i)) ? 1 : 0,
> -		       priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
> +	for_each_device_irq(irq, priv) {
> +		index = BIT_WORD(irq);
> +		writel((priv->prio_save[index] & BIT_MASK(irq)) ? 1 : 0,
> +		       priv->regs + PRIORITY_BASE + irq * PRIORITY_PER_ID);
>   	}
>   
>   	for_each_present_cpu(cpu) {
> @@ -293,7 +295,7 @@ static void plic_irq_resume(void *data)
>   			continue;
>   
>   		raw_spin_lock_irqsave(&handler->enable_lock, flags);
> -		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
> +		for (unsigned int i = 0; i < priv->irq_groups; i++) {
>   			reg = handler->enable_base + i * sizeof(u32);
>   			writel(handler->enable_save[i], reg);
>   		}
> @@ -431,7 +433,7 @@ static u32 cp100_isolate_pending_irq(int
>   
>   static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
>   {
> -	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
> +	int nr_irq_groups = handler->priv->irq_groups;
>   	u32 __iomem *enable = handler->enable_base;
>   	irq_hw_number_t hwirq = 0;
>   	u32 iso_mask;
> @@ -614,7 +616,6 @@ static int plic_probe(struct fwnode_hand
>   	struct plic_handler *handler;
>   	u32 nr_irqs, parent_hwirq;
>   	struct plic_priv *priv;
> -	irq_hw_number_t hwirq;
>   	void __iomem *regs;
>   	int id, context_id;
>   	u32 gsi_base;
> @@ -647,7 +648,16 @@ static int plic_probe(struct fwnode_hand
>   
>   	priv->fwnode = fwnode;
>   	priv->plic_quirks = plic_quirks;
> -	priv->nr_irqs = nr_irqs;
> +	/*
> +	 * The firmware provides the number of device interrupts. As
> +	 * hardware interrupt 0 is reserved, the number of total interrupts
> +	 * is nr_irqs + 1.
> +	 */
> +	nr_irqs++;
> +	ACCESS_PRIVATE(priv, total_irqs) = nr_irqs;
> +	/* Precalculate the number of register groups */
> +	priv->irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> +
>   	priv->regs = regs;
>   	priv->gsi_base = gsi_base;
>   	priv->acpi_plic_id = id;
> @@ -686,7 +696,7 @@ static int plic_probe(struct fwnode_hand
>   				u32 __iomem *enable_base = priv->regs +	CONTEXT_ENABLE_BASE +
>   							   i * CONTEXT_ENABLE_SIZE;
>   
> -				for (int j = 0; j <= nr_irqs / 32; j++)
> +				for (int j = 0; j < priv->irq_groups; j++)
>   					writel(0, enable_base + j);
>   			}
>   			continue;
> @@ -718,23 +728,21 @@ static int plic_probe(struct fwnode_hand
>   			context_id * CONTEXT_ENABLE_SIZE;
>   		handler->priv = priv;
>   
> -		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
> -					       sizeof(*handler->enable_save), GFP_KERNEL);
> +		handler->enable_save = kcalloc(priv->irq_groups, sizeof(*handler->enable_save),
> +					       GFP_KERNEL);
>   		if (!handler->enable_save) {
>   			error = -ENOMEM;
>   			goto fail_cleanup_contexts;
>   		}
>   done:
> -		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
> +		for_each_device_irq(hwirq, priv) {
>   			plic_toggle(handler, hwirq, 0);
> -			writel(1, priv->regs + PRIORITY_BASE +
> -				  hwirq * PRIORITY_PER_ID);
> +			writel(1, priv->regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
>   		}
>   		nr_handlers++;
>   	}
>   
> -	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,
> -						   &plic_irqdomain_ops, priv);
> +	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdomain_ops, priv);
>   	if (WARN_ON(!priv->irqdomain)) {
>   		error = -ENOMEM;
>   		goto fail_cleanup_contexts;

Tested-by: Yangyu Chen <cyy@cyyself.name>

Tested on both QEMU and NEMU, and it works great!

Maybe we can merge this along with the dt-binding updates.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
