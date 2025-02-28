Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4A4C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CSJBPcG56cqyiGeF98le5S2ScHGIA4xMt/a7giBGso=; b=pf5KqnVQuChJxq
	cs4KPVKDPJ4fi1InyCznGbAES0uxPm0OY+jdDGA7AMUCtSzO5Cd/3B0/XdTFJLZKdbTVIgLm4OT+u
	1oHdrw8/dYijVAnwCQ2y721yH8iiviBGLSatHZjMLlQxs4GVPAPBeuZMMgYBf5VoPnjPXa9A3o0st
	92EznpIwoEBjC13CWTn6bJhqWH89sSGVHyOv94o/QMFoGN8+lgI9usrlvzEz4FUz1FKmCifiP+0Go
	1TylwVunNNZ44Dy/F3YaCpYZaOltTf96SuSW9JEnibqOqNU8hJ6TsAb48dfZqzWxt6C8k1E0tS5ZI
	ir6GO0RAKxcywWZvxEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0gT-0000000B7Gh-1xrS;
	Fri, 28 Feb 2025 13:45:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0fS-0000000B72z-1Gq8
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 13:44:43 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740750277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xT5+WG3VHi4NewtOLqTVlQbqf36jSOz2HnCAsZWMVDY=;
	b=qVYTqV+aE6XVgHtMV0wbBmT0Pkl0w2415c+t42gYFc7tG0aiHNwqp0dWW3yNctqBUnqjhn
	gfcoLyz/UcQgNqB38YM45iZIhoa0VLV+6/TRT7K/IqVRfmOBoUaSQ/50Q59fPNh/TflxzG
	JKJvHLL2sU7aTLp0oXMz1AOYkZOKbKGQAtTZYmy4FBP4J0N4sKCHYefMcMo1Qhro1521H7
	qy2O8f4MMD25J6XCX8IM7TmWX4gQkcl3inQi7ia7essMeIP/oJzuezaN8H+iiRN+Ym3HKZ
	HWN77mrN63cZ9Y73NZNespXKdk3gd0lPYwMdwduqeM53am1IZ5LNiFyDBUnJAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740750277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xT5+WG3VHi4NewtOLqTVlQbqf36jSOz2HnCAsZWMVDY=;
	b=yLCrTvGTYw0fg8jZFBrxswcSZsKpYPj5EIvwiPDBktdjbvuloIxsOxgz6j+lA5hS2qt8uv
	3QRdstTL3J/NrkBA==
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
In-Reply-To: <20250227204155-GYA51171@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
 <20250227204155-GYA51171@gentoo>
Date: Fri, 28 Feb 2025 14:44:36 +0100
Message-ID: <871pvidvzv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_054442_482882_7B5808CB 
X-CRM114-Status: GOOD (  21.54  )
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

On Thu, Feb 27 2025 at 20:41, Yixun Lan wrote:
> On 10:12 Thu 27 Feb     , Alex Elder wrote:
>> On 2/27/25 5:24 AM, Yixun Lan wrote:
>> > 
>> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> > index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
>> > --- a/kernel/irq/irqdomain.c
>> > +++ b/kernel/irq/irqdomain.c
>> > @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
>> >   				 unsigned long *out_hwirq,
>> >   				 unsigned int *out_type)
>> >   {
>> 
>> This function is meant for "twocell".  There is also another function
>> irq_domain_translate_onecell().  Why don't you just create
>> irq_domain_translate_threecell" instead?
>> 
> good question!
>
> it's too many changes for adding "threecell" which I thought not worth
> the effort, or maybe we can rename the function to *twothreecell()?
>
> I'm not sure which way to go is the best, ideas from maintainer are
> welcome

We really want to have explicit functions for two and three cells.
 
>> > +	u32 irq, type;
>> > +
>> >   	if (WARN_ON(fwspec->param_count < 2))
>> >   		return -EINVAL;
>> > -	*out_hwirq = fwspec->param[0];
>> > -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
>> > +
>> > +	irq = fwspec->param_count - 2;
>> > +	type = fwspec->param_count - 1;
> no matter two or three cell, it's always parse the last two cells,
> virtually they are same syntax, which can reuse the *_translate_twocell()
> function perfectly..

Yes, that works but the code is completely non-obvious. So what you
really want is something like this:

int irq_domain_translate_cells(struct irq_domain *d, unsigned long *hwirq,
			       unsigned int *type)
{
        unsigned int cells = fwspec->param_count;

        switch (cells) {
       	case 1:
                *hwirq = fwspec->param[0];
                *type = IRQ_TYPE_NONE;
                return 0;
       	case 2..3:
	        /*
        	 * For multi cell translations the hardware interrupt number and type
	         * are in the last two cells.
	         */
		*hwirq = fwspec->param[cells - 2];
        	*type = fwspec->param[cells - 1] & IRQ_TYPE_SENSE_MASK;
                return 0;
        default:
   		return -EINVAL;
        }
}

Then have inline helpers:

static inline int irq_domain_translate_XXXcell(struct irq_domain *d, unsigned long *hwirq,
					       unsigned int *type)
{
        return irq_domain_translate_cells(d, hwirq, type);
}

That avoids changing all call sites at once and merges the one cell
translation into it.

You get the idea....

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
