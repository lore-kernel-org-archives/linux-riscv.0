Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34B3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rq73D+8D4/tOGJaIrRCHrTkFzFZrzYTgxAaOU1r871g=; b=khpde2HgSKb0A5
	2AwoaP7Kul8EQ56vW1rP7Eti+x+5VMeRHQU/E+SNhBERVsKuzkVuFXUsyQs+FzbrIJmP50FW5E4H2
	SCyNr+6scXGzt8TBUUixljMfNYPFCsQxD/rJ+wMepjQ0PUqVC93NnWT882AOy3FKt+0S6KcI7PSni
	3ESB9Ci7vUkRyxN7Du+ovCRnHBwFojppk77Iie/W1lrb33tCnL7y6ja5XfJ1gKTsnN8kn8E9jGjmE
	93X49sdnPBOMG9A7WjSEnvRAO2Ha1kReR+SgJ1lGU3knMHb5Qz7kxwTwN6AsihuSdf6UaBug6o5EK
	OPwQ/gnPJnARq0I57Olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpiQ-00000008VzC-2Vqx;
	Fri, 02 Aug 2024 10:40:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpiI-00000008VxA-0B2q
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 10:40:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722595238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5vcAD1A0hzoKaR1+uEiFQRM12R8jXW3cvyQsxzJHwU=;
	b=AzSP5L4PVK1Psz6ROzsn/+qgcr5czSeOz9pJT3SZNRVlFsfBf4l7hlmVxgJdAuppfu9MP1
	fWfIAt8VkRfgypz9+3U0/bphlE1tsR7CXYISZorUhWhqIWYgbP0FwLIkC9FgfhOOjyydqe
	Smhem1Q6SPLtS5lUb7OkW8yVzcD7IEZbnPsc+bhm34U6r2XfQ2/w+1z3w+NxXo0R48h2cN
	BUN3C+kd2/R+qOMYe8HccK6xc2zJ829pTwiQ4RNyetGcT44NmiNby3eJp8l7AAQMUF6Vej
	GLsLZ2fFqkjxucGl9KMntUWod7u1yHeGpwDMhq/ChJbhOx7FTXT2Diuw+7vUCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722595238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5vcAD1A0hzoKaR1+uEiFQRM12R8jXW3cvyQsxzJHwU=;
	b=ptkKcq9E4q4meolmKHP98h7IiQ4UpvvwtTr/CKaxtp505Ffy4MUlxuPJrTh1NcBCvi7JsW
	E3K8GdMmxoeIkpBw==
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
In-Reply-To: <20240802-rippling-clubbing-5318f914f16a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy> <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud> <87r0b82i57.ffs@tglx>
 <20240802-rippling-clubbing-5318f914f16a@spud>
Date: Fri, 02 Aug 2024 12:40:38 +0200
Message-ID: <87sevn1a3d.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_034046_245783_F75275EB 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Aug 02 2024 at 09:08, Conor Dooley wrote:
> On Thu, Aug 01, 2024 at 08:49:08PM +0200, Thomas Gleixner wrote:
>> On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
>> > On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
>> >> > +	/*
>> >> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
>> >> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>> >> 
>> >> This is not a coherent sentence.
>> >
>> > It should read "controller 0 or 1;s interrupt is muxed". Does that make
>
> Heh, I even typoed here, the ; should be a '.
>
>> > more sense to you?
>> 
>> No: If a bit is set in the mux, GPIO the corresponding...
>> 
>> I'm already failing at 'GPIO'. My parser expects a verb there :)
>
> Ah, so double mistake in the sentence. s/GPIO// I suppose. An updated
> comment could be:
>
> "If a bit is set in the mux, the corresponding interrupt from GPIO
> controller 2 is direct and controller 0 or 1's interrupt is muxed"

That's actually understandable for mere mortals :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
