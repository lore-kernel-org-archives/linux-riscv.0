Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ECDC636D3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xco6PxHWSadaNEsxvJYC4fTPBT5i4tIzbR6OMQFZ7dg=; b=cRYP5KbCBzETm9
	jy+XZKM7FjP2r21xsjMxR7wnpyOblF6cuQOFACun+k8EXFMo1rGiefggj4bLb1RR5BchQhrE/5vKi
	HdxCuL8LQjukmf6WLatsN/JWAk845WzYxoqQS7A876HaS/WwRvyyV1ca41VJer0raVRqB8VzDR4aC
	K8sAIgdpZSpHi075wTkIZT8gvMcPsJtdUV0iHUQFgIuLJZWPSR0MLk8pljbfK8/ie2yEfv9KImqy9
	OJjBi3sDiRXRuBQaf5iPkN2Ku23Xw2Zbrnc3OmjGuH0aPIBQGbTqJxvx3tsBS0pYI1YEKaTfiMyHy
	kVOSYr9cfUH3R0/bQOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPF0g-00Afx8-2b; Tue, 07 Feb 2023 03:51:10 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPF0Z-00AfvY-Pw
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 03:51:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1E13024E15C;
	Tue,  7 Feb 2023 11:50:37 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 11:50:37 +0800
Received: from [192.168.125.89] (183.27.96.33) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 11:50:36 +0800
Message-ID: <21d774af-76bb-538e-b0f6-f52295116fa7@starfivetech.com>
Date: Tue, 7 Feb 2023 11:50:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1] irqchip/irq-sifive-plic: Add syscore callbacks for
 hibernation
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>
References: <20230113094216.116036-1-mason.huo@starfivetech.com>
 <864js01j26.wl-maz@kernel.org>
 <c851138c-148a-bc5f-219b-1573d7e7e318@starfivetech.com>
 <86v8kfyn62.wl-maz@kernel.org>
Content-Language: en-US
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <86v8kfyn62.wl-maz@kernel.org>
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_195104_189401_D82A4274 
X-CRM114-Status: GOOD (  29.12  )
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



On 2023/2/6 20:48, Marc Zyngier wrote:
> On Mon, 06 Feb 2023 06:13:11 +0000,
> Mason Huo <mason.huo@starfivetech.com> wrote:
>> 
>> 
>> 
>> On 2023/2/5 18:51, Marc Zyngier wrote:
>> > On Fri, 13 Jan 2023 09:42:16 +0000,
>> > Mason Huo <mason.huo@starfivetech.com> wrote:
>> >> 
>> >> The priority and enable registers of plic will be reset
>> >> during hibernation power cycle in poweroff mode,
>> >> add the syscore callbacks to save/restore those registers.
>> >> 
>> >> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
>> >> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>> >> Reviewed-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>> >> ---
>> >>  drivers/irqchip/irq-sifive-plic.c | 93 ++++++++++++++++++++++++++++++-
>> >>  1 file changed, 91 insertions(+), 2 deletions(-)
>> >> 
>> >> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>> >> index ff47bd0dec45..80306de45d2b 100644
>> >> --- a/drivers/irqchip/irq-sifive-plic.c
>> >> +++ b/drivers/irqchip/irq-sifive-plic.c
>> >> @@ -17,6 +17,7 @@
>> >>  #include <linux/of_irq.h>
>> >>  #include <linux/platform_device.h>
>> >>  #include <linux/spinlock.h>
>> >> +#include <linux/syscore_ops.h>
>> >>  #include <asm/smp.h>
>> >>  
>> >>  /*
>> >> @@ -67,6 +68,8 @@ struct plic_priv {
>> >>  	struct irq_domain *irqdomain;
>> >>  	void __iomem *regs;
>> >>  	unsigned long plic_quirks;
>> >> +	unsigned int nr_irqs;
>> >> +	u32 *priority_reg;
>> >>  };
>> >>  
>> >>  struct plic_handler {
>> >> @@ -79,10 +82,13 @@ struct plic_handler {
>> >>  	raw_spinlock_t		enable_lock;
>> >>  	void __iomem		*enable_base;
>> >>  	struct plic_priv	*priv;
>> >> +	/* To record interrupts that are enabled before suspend. */
>> >> +	u32 enable_reg[MAX_DEVICES / 32];
>> > 
>> > What does MAX_DEVICES represent here? How is it related to the number
>> > of interrupts you're trying to save? It seems to be related to the
>> > number of CPUs, so it hardly makes any sense so far.
>> > 
>> The comment of this macro describes that "The largest number supported
>> by devices marked as 'sifive,plic-1.0.0', is 1024, of which
>> device 0 is defined as non-existent by the RISC-V Privileged Spec."
>> As far as I understand, the *device* here means HW IRQ source,
>> and the HW IRQ 0 is non-existent.
> 
> So why is it sized to that maximum value? The binding gives you the
> *real* value that the HW implements.
> 
OK, will change to use binding value.

>> 
>> >>  };
>> >>  static int plic_parent_irq __ro_after_init;
>> >>  static bool plic_cpuhp_setup_done __ro_after_init;
>> >>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>> >> +static struct plic_priv *priv_data;
>> >>  
>> >>  static int plic_irq_set_type(struct irq_data *d, unsigned int type);
>> >>  
>> >> @@ -229,6 +235,78 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
>> >>  	return IRQ_SET_MASK_OK;
>> >>  }
>> >>  
>> >> +static void plic_irq_resume(void)
>> >> +{
>> >> +	unsigned int i, cpu;
>> >> +	u32 __iomem *reg;
>> >> +
>> >> +	for (i = 0; i < priv_data->nr_irqs; i++)
>> >> +		writel(priv_data->priority_reg[i],
>> >> +				priv_data->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
>> > 
>> > From what I can tell, this driver uses exactly 2 priorities: 0 and 1.
>> > And yet you use a full 32bit to encode those. Does it seem like a good
>> > idea?
>> > 
>> Yes, currently this driver uses oly 2 priorities.
>> But, according to the sifive spec, the priority register is a 32bit register,
>> and it supports 7 levels of priority.
> 
> And? This is a Linux driver, not an implementation validation
> tool. What is the point of saving/restoring stuff that is *never*
> used? :-(
> 
> 	M.
> OK, will save/restore the priority in 1 bit. 

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
