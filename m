Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB88C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Qi5vbk31sSC+Q5Cj1Q657VsH9xjlmrxeUc1SiQgUek=; b=2M6icvxwc+wzyD
	6jmkfZx6QSWUN5kO/fS2vRfu7DDfpwu6kFLx48/ZCJgo3nQXdJN2dhTOISExCy+i7g39AYnbkIzCg
	vAW2hU9Klgb+gBoHS/ZyVxTDYi8oofValt0N3IkRWiR+eofRkbC4uI4e34YNSJFKi3oWOgXiOjTTm
	SUCb/eJQsoGaLvNb9S/jkR6zrheMJ8nw+LIGSfbr/ArXMeiIKlrJ7Ok5qg7KhHsS70A8/LKDrRbkP
	nLwwgmT9gBMuLB3OwXF0ermeaIur8NInmzXMgBnDxPODUpPQCHDaW7Jmm4UHAiCTjiUsngRJa+nCw
	MC02/xI3gUWS+YCmJSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZarV-00000006RuG-2xys;
	Thu, 01 Aug 2024 18:49:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZarQ-00000006Rse-4BIs
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:49:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722538149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zy4QAbBchws8wpEd632QvvKsWpoM4onCh56dsKjIHlQ=;
	b=V/R18hQLq+jyQoLBzyEA/jn4Fzajd35TRSiGYLRaN/IJiictIcX6L3AmjSn/d3co88iSHu
	bubzfHPnaZfsdZV+n9L6x0BH+0IDUzw4uWIiBLHtgmyyZRkKUc3z2lbAE7MFUFieOJQtr6
	/K2h2pJ1GL5UKwSIn6qNY7EqGmRnc7NfuLvUYsEbgz315JLujAFOuyuCsxlfhcCkjCj1rw
	9DAtO6VQGNm9NaCdKm+7p8mHC22oedrL3kc89L3/FE/HF+TkVc/1a8BEn4v4VvUc8p9cZd
	F33M1ajTN9rT2zJyvvJgW1OyXO6NdrO66oFuFxLBUtr01FKDFp6spDwVwNwiBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722538149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zy4QAbBchws8wpEd632QvvKsWpoM4onCh56dsKjIHlQ=;
	b=TB16bH+7FY9c5h6o6aIywattKgBHBOAnvaRdWLpcsYODy3h8ds9MT5TvjCSdJWS3Y5wMeK
	KUR0S+I/dHQsuzAw==
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daire McNamara
 <daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
In-Reply-To: <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy> <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
Date: Thu, 01 Aug 2024 20:49:08 +0200
Message-ID: <87r0b82i57.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_114913_201565_46D8CA61 
X-CRM114-Status: GOOD (  20.67  )
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

On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
> On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
>> > +	/*
>> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
>> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>> 
>> This is not a coherent sentence.
>
> It should read "controller 0 or 1;s interrupt is muxed". Does that make
> more sense to you?

No: If a bit is set in the mux, GPIO the corresponding...

I'm already failing at 'GPIO'. My parser expects a verb there :)

>> > +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,
>> 
>> Why does this use handle_untracked_irq()?
>
> I'll have to go and dig back in my notes as to why it is untracked. It
> was probably something like irqd_set() in handle_irq_event() blowing up
> on the irq_data being invalid (which I figure could relate back to my
> questions in the cover letter about issues with irqd_to_hwirq()) - but
> I'll double check what exactly prompted it when I get back from my
> holidays, but...
>
>> This sets up a chained handler
>> but handle_untracked_irq() is a regular interrupt handler.
>
> ...what I was likely using before was handle_simple_irq() which isn't
> chained either. You're expecting to see mpfs_irq_mux_nondirect_handler()
> here I suppose?

Yes or some other proper chained handler.

> Given you've only commented on one significant issue and two minor items,
> is it safe to conclude that the overall approach doesn't have you
> screaming and running for the hills?

I don't love it, but I don't have a better approach to deal with this.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
