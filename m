Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CBCC021B8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 02:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asuupEkIPt7RCkqsbwIcHT0ZpNmU94lcmEM+HI4UIAo=; b=R0qOflFKJ0Y4LH
	KkfbHnR4OKBZHJLna2Jb8YwD4c6/UfNKUue4WGWV5BXAYQHTlmOdHIjkpoJurOHSJqCHutg2EVTyH
	JBzrMqtPlZBUhq2jFZQhIl6Ny99sQNb80Mt+fWvTOhKRUCROe8cBg62yQ3n20mnQ2K1KY+B+fvhSt
	80u7uBWzoWgNfBMBnxMwlpUJSy7BXCcIe3Z5AsP3nvSwZFA12CFdDyug5uP+McPQug5MrkZj1JX+E
	3gqpJ9UfMITdM7IvUPHuAxuYiUpv9wZt447EnX8cr6Pt6i5rCsBFzMeU2RvrhDH9qP6B3vWkfTSyv
	H79Rm5tmnPKtHIDT89/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTOI-000000063Km-3hfZ;
	Thu, 27 Feb 2025 02:12:46 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTOH-000000063KL-1efr
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 02:12:46 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ED35D34315C;
	Thu, 27 Feb 2025 02:12:41 +0000 (UTC)
Date: Thu, 27 Feb 2025 02:12:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
Message-ID: <20250227021231-GYA46699@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226010108-GYA44567@gentoo>
 <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
 <20250226115957-GYA45508@gentoo>
 <20250226135635-GYA45740@gentoo>
 <87tt8gemm4.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tt8gemm4.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_181245_459454_C410D8C5 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas Gleixner:

On 16:45 Wed 26 Feb     , Thomas Gleixner wrote:
> On Wed, Feb 26 2025 at 13:56, Yixun Lan wrote:
> > sounds we need to implement .select() or .match() in irq_domain_ops,
> > then find the irq_domain.. here is a prototype version 
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index 995e5e0ec2db..c4d18267e86e 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -553,7 +553,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
> >  	 */
> >  	mutex_lock(&irq_domain_mutex);
> >  	list_for_each_entry(h, &irq_domain_list, link) {
> > -		if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> > +		if (h->ops->select /* && bus_token != DOMAIN_BUS_ANY */)
> 
> This breaks existing usage and reintroduces the regression, which was
> fixed with the commit which added the bus token check....
> 
right, I shouldn't change it.

would setting a bus token explicitly for spacemit gpio be a good idea?
in drivers/gpio/gpio-spacemit-k1.c, something like:

irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
