Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEC2C19F32
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 20:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJYfiyddPlV9ZQzFh2NYYQFK9+sdwm+d/oCZ61rE3NI=; b=s56zFhiwmDYyA6
	S3RyubzQCwQ2I/dpvJErisotMEor+H7oMvNi5gsxGpYO8nCPEE0V8lLq9PLrcpv0VpKdfbdbF3aOz
	OvOq1mpn9mmotHvoRVEXR3pybs/80cFQnBJ/30P2wCHHNcI4mw3rTovNSAzlIKb2lMA3AxxFh7B+u
	7DBWudhwCsUf54lZ0xt4a5bf6ZiONbgu/kdl6zag9JQRcHmcFodb5PQRzkKBKVS6HDNcN9uclBEQr
	gAIv1hdw8YOUZxlL5YSgbhFveRQN9YenfuJeUF8Rr23nWZqPfG7cvqSU9dbYFKs5tnw9Dfduxv3xu
	Gjx5xoELq0FBz4fN+uJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkmI-00000008odg-3gRu;
	Thu, 27 Feb 2025 20:46:42 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkhm-00000008nvg-2NWB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 20:42:03 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 068D9343018;
	Thu, 27 Feb 2025 20:42:00 +0000 (UTC)
Date: Thu, 27 Feb 2025 20:41:55 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250227204155-GYA51171@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124202_631410_4E14E30B 
X-CRM114-Status: GOOD (  22.16  )
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


On 10:12 Thu 27 Feb     , Alex Elder wrote:
> On 2/27/25 5:24 AM, Yixun Lan wrote:
> > The is a prerequisite patch to support parsing three-cell
> > interrupts which encoded as <instance hwirq irqflag>,
> > the translate function will always retrieve irq number and
> > flag from last two cells.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   kernel/irq/irqdomain.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
> >   				 unsigned long *out_hwirq,
> >   				 unsigned int *out_type)
> >   {
> 
> This function is meant for "twocell".  There is also another function
> irq_domain_translate_onecell().  Why don't you just create
> irq_domain_translate_threecell" instead?
> 
good question!

it's too many changes for adding "threecell" which I thought not worth
the effort, or maybe we can rename the function to *twothreecell()?

I'm not sure which way to go is the best, ideas from maintainer are
welcome

> 
> > +	u32 irq, type;
> > +
> >   	if (WARN_ON(fwspec->param_count < 2))
> >   		return -EINVAL;
> > -	*out_hwirq = fwspec->param[0];
> > -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> > +
> > +	irq = fwspec->param_count - 2;
> > +	type = fwspec->param_count - 1;
no matter two or three cell, it's always parse the last two cells,
virtually they are same syntax, which can reuse the *_translate_twocell()
function perfectly..

> > +
> > +	*out_hwirq = fwspec->param[irq];
> > +	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
> > +
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
> > 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
