Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA76C433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 13:42:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B322076A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 13:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yo6XWNFk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LJz8u0pL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p6ALofZG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B322076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bwgG59J4RwNnZA+Et+XglUbf/kOVBgmG1YWlH6LL7Pg=; b=Yo6XWNFkwe5tlxw9SI/w7M5y8
	bpIF0o/FzFlvIK/IlSylu1VTSO485yKu01tfntlHwZvx3KoFfwZvqVgXudTQQs9c04pttftYMXg5q
	c5F0Xwr6ZOZ4VV6RCEkE+e47dUYIUuWwSIBQ7R7YSRwAIDtbIuc4g/SexYRKOOtnBbz8Js+9dU2bb
	VhxhyWJZZAUh2uN3Y/7lqMkKk1RkZRTI82Jg20J6BApjdZp56DDlIVZgpL02ZXwo9PbIBv0D/vW1T
	+Bc470uRuVgxvtixw8L2rj6OJhxTCG9k7o1fHgUIgWiZB/BRnYXRkup4pQQTYjAbdi30JwGM0z+mn
	5SmxGZhIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTQ07-0002QI-UD; Fri, 16 Oct 2020 13:42:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQ04-0002PP-L7
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 13:42:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1602855747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qZ3wBDxLlc4y2LdirJcgerLsIDb2RZnNo4XttMjq30=;
 b=LJz8u0pLozePlNZYgZvvpyj/qhL5C+MTWzbqD1eu+aQX3xvB+nIhmh51tGKAbVFdSMSXXn
 bgOI8oFYUBzoQV2R+l6uLsM9+2lhxK6DweO9H6eQGNE7z5ectfb0823f66a9pezbNcg2zO
 enw/POzOO9vGilP73TJDT0qmYRyID39Q0DeUpXBnADcGpy+rnJg6Yoye+HPQbOb/NaLP/Q
 cHlwZKPmNQVKIZfJlA/5XDTOC9Y6Fz86kLHgzEhFatJ70/ZzqEeSjO6FOBmow5gvGXsXbB
 9G7vek0DpCNRR1WoZ3IQk67AHjNsdE8YTrr/1rKFVFQh7COU+hNuvn5Ug2trCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1602855747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3qZ3wBDxLlc4y2LdirJcgerLsIDb2RZnNo4XttMjq30=;
 b=p6ALofZGtMZBBzMf1J4rWNqTtXAgvjanZlwcjpEBhrQUzIw/w2upgOl64RezJ32xRpQ8Tn
 9sxasXqA3HsrFyAQ==
To: Marc Zyngier <maz@kernel.org>, Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH 2/2] irqchip/sifive-plic: Fix the interrupt was enabled
 accidentally issue.
In-Reply-To: <5bedfbc723665c979eb73eefadb21970@kernel.org>
References: <20201012135724.110579-1-greentime.hu@sifive.com>
 <20201012135724.110579-2-greentime.hu@sifive.com>
 <5bedfbc723665c979eb73eefadb21970@kernel.org>
Date: Fri, 16 Oct 2020 15:42:27 +0200
Message-ID: <87ft6ethh8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_094228_812695_455A1270 
X-CRM114-Status: GOOD (  15.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, jason@lakedaemon.net, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15 2020 at 22:23, Marc Zyngier wrote:
> On 2020-10-12 14:57, Greentime Hu wrote:
>> In commit 2ca0b460bbcb ("genirq/affinity: Make affinity setting if
>> activated opt-in"),

This commit sha does not exist in mainline. Referencing a random stable
kernel tree is useless.

>> it added irqd_affinity_on_activate() checking in the function
>> irq_set_affinity_deactivated() so it will return false here.
>> In that case, it will call irq_try_set_affinity() -> plic_irq_toggle()
>> which will enable the interrupt to cause the CPU hang.
>> @@ -183,10 +183,14 @@ static int plic_irqdomain_map(struct irq_domain
>> *d, unsigned int irq,
>>  			      irq_hw_number_t hwirq)
>>  {
>>  	struct plic_priv *priv = d->host_data;
>> +	struct irq_data *irqd;
>> 
>>  	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>>  			    handle_fasteoi_irq, NULL, NULL);
>>  	irq_set_noprobe(irq);
>> +	irqd = irq_get_irq_data(irq);
>> +	irqd_set_single_target(irqd);
>> +	irqd_set_affinity_on_activate(irqd);
>>  	irq_set_affinity(irq, &priv->lmask);
>>  	return 0;
>>  }
>
> How does this fix anything? The plic driver doesn't have an activate
> callback, so how does it make any difference? I get the feeling this
> papers over another issue.

The existence of the activate callback is not really the interesting
part. And of course the analysis is completely bogus.

The referenced commit is a follow up to:

baedb87d1b53 ("genirq/affinity: Handle affinity setting on inactive interrupts correctly")

which was added on Jul 17 and the fix was added on Jul 24:

f0c7baca1800 ("genirq/affinity: Make affinity setting if activated opt-in")

The latter restored the original behaviour within 7 days, except for
x86. And the original behaviour was that the core did not care about the
activated state at all. It just invoked irqchip->irq_set_affinity()
unconditionally, which is still does except when the interrupt is marked
with irqd_set_affinity_on_activate().

So the plic code had this problem before that change already:

 	irq_set_noprobe(irq);
 	irq_set_affinity(irq, &priv->lmask);

Mapping happens way before anything else, so Hu is definitely barking up
the wrong tree.

What the patch works around is the irq_set_affinity() callback which is
completely bogus and still broken even after that duct tape which"
fixes" the boot fail.

irq_set_affinity() can be called on masked interrupts so this:

        plic_irq_toggle(&priv->lmask, d, 0);
        plic_irq_toggle(cpumask_of(cpu), d, 1);

will always unconditionally unmask the interrupt when affinity is
changed.

        plic_irq_toggle(cpumask_of(cpu), d, !irqd_irq_masked(d));

is all it needs to work everywhere. Obvious, right?

The changelog wants to be "...: Fix broken irq_set_affinity() callback"
and the Fixes: tag referencing the commit which introduced that
unconditional unmask. Oh well.

Thanks,

        tglx









_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
