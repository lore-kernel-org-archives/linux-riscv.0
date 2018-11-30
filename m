Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D976C64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 01:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86C320863
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 01:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMf2bud0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EQLdEsgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86C320863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7KoqdSfFBESj3EiE1sZgTIMZk7yVzdq9ntAd1DnATvc=; b=IMf2bud0+FDAtym/AOx+wnM6M
	rC7DOwxkDDI5r97g9tbDu3WIRRhPKTUOuH6A8MDl5dFb85i3ebj9mqZSqyM8xUK43L2BMhEIIfOTX
	NS06jUQ/R3mWzUf9MCV4Gkpo6m5YLQQXFU5n4FX6UVlhx6WihFZEe88GDwbphZFyG0Vxg0SSZzTL5
	NwBR1rdjSt3jiRNQfVD3ztqlOW4Fyt6f5biG700+QyX71KUwWEtYEQQnVZXd+DzUBbPwBHaY/hzIb
	jFlystKYqZrF6InCHyd8GTPKdZJTsHySknpI+lOxnlngOuQKWhxoTZTN1avO8PnlPFvkZ1XG7OwGG
	xmo+356mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSY3y-0002b9-9T; Fri, 30 Nov 2018 01:57:50 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSY3v-0002aM-Ls
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 01:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543543100; x=1575079100;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FUgCmVQ2VKNgaCsb1HVvTlj5dWNTY50OFk8kPVfHZIc=;
 b=EQLdEsgjuI4xyPugjfO6x+8i/GUWDu1BPQULMBAg9qT7imIlj9VIjleA
 u/V3sLNEG6wJ79ZXTIQ/iKLgxYsYpwsnPWC8RDGX3kO3ZLNw4sxWmkcbq
 KYrWDlwPY0lrWQ9JebOxXvR2SSfop6NC/zfu4ezTEZ+OLa44U8i8j1dx3
 sb0wr5/Hh2v4ZZgfSxK1DkaQhrcN7fK2ONOfUUfACXDMD/Z1kTJtPuOwO
 i5fDRSQa98pbICw5xf8nX4JdyVEotEU4Z7KtgOPLhzrtKzo1a9bZRr4f5
 ftHunvj2T9Oatc1kAjjlLB8YvN0Wy4RYk/EHN60feeffaVUFQVv1Vi/NN Q==;
X-IronPort-AV: E=Sophos;i="5.56,297,1539619200"; d="scan'208";a="193279985"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2018 09:58:05 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 Nov 2018 17:40:33 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.72.98])
 ([10.111.72.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Nov 2018 17:57:38 -0800
Subject: Re: [PATCH v2 3/4] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
References: <20181127100317.12809-1-anup@brainfault.org>
 <20181127100317.12809-4-anup@brainfault.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <93356e4f-ccd9-39ba-6afe-88dcdc72945d@wdc.com>
Date: Thu, 29 Nov 2018 17:57:36 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181127100317.12809-4-anup@brainfault.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_175747_749330_D527871D 
X-CRM114-Status: GOOD (  20.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/27/18 2:04 AM, Anup Patel wrote:
> We explicitly differentiate between PLIC handler and context because
> PLIC context is for given mode of HART whereas PLIC handler is per-CPU
> software construct meant for handling interrupts from a particular
> PLIC context.
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>   drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 95b4b92ca9b8..ffd4deaca057 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -66,8 +66,8 @@ static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>   
>   struct plic_hw {
>   	u32			nr_irqs;
> +	u32			nr_contexts;
>   	u32			nr_handlers;
> -	u32			nr_mapped;
>   	void __iomem		*regs;
>   	struct irq_domain	*irqdomain;
>   };
> @@ -191,10 +191,10 @@ static int __init plic_init(struct device_node *node,
>   	if (WARN_ON(!plic.nr_irqs))
>   		goto out_iounmap;
>   
> -	plic.nr_handlers = of_irq_count(node);
> -	if (WARN_ON(!plic.nr_handlers))
> +	plic.nr_contexts = of_irq_count(node);
> +	if (WARN_ON(!plic.nr_contexts))
>   		goto out_iounmap;
> -	if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
> +	if (WARN_ON(plic.nr_contexts < num_possible_cpus()))
>   		goto out_iounmap;
>   
>   	plic.irqdomain = irq_domain_add_linear(node, plic.nr_irqs + 1,
> @@ -202,7 +202,7 @@ static int __init plic_init(struct device_node *node,
>   	if (WARN_ON(!plic.irqdomain))
>   		goto out_iounmap;
>   
> -	for (i = 0; i < plic.nr_handlers; i++) {
> +	for (i = 0; i < plic.nr_contexts; i++) {
>   		struct of_phandle_args parent;
>   		struct plic_handler *handler;
>   		irq_hw_number_t hwirq;
> @@ -225,6 +225,11 @@ static int __init plic_init(struct device_node *node,
>   
>   		cpu = riscv_hartid_to_cpuid(hartid);
>   		handler = per_cpu_ptr(&plic_handlers, cpu);
> +		if (handler->present) {
> +			pr_warn("handler not available for context %d.\n", i);
> +			continue;
> +		}
> +

Ahh you have the handler->present check here in this patch. This should 
be in the 2nd patch. This change doesn't match the commit text anyways.

Everything else just variable renaming which can be separated.
nr_handlers->nr_contexts
nr_mapped->nr_handlers


Regards,
Atish
>   		handler->present = true;
>   		handler->hart_base =
>   			plic.regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> @@ -237,11 +242,11 @@ static int __init plic_init(struct device_node *node,
>   		for (hwirq = 1; hwirq <= plic.nr_irqs; hwirq++)
>   			plic_toggle(handler, hwirq, 0);
>   
> -		plic.nr_mapped++;
> +		plic.nr_handlers++;
>   	}
>   
> -	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
> -		plic.nr_irqs, plic.nr_mapped, plic.nr_handlers);
> +	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
> +		plic.nr_irqs, plic.nr_handlers, plic.nr_contexts);
>   	set_handle_irq(plic_handle_irq);
>   	return 0;
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
