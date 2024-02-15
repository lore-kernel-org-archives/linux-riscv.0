Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6DDC48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZNpicftcX0JRs+Py9yuY+O56+yuTfZSPomXPZFcTDc=; b=HQwQz9VcT7gS89
	h8DpPJWo6dfqEIQ46XDTiKHCphNjTVYye/ryh1fFhN8+PlIT2CCs9Qe65sJKo4pFmSNfj0I0orZZj
	Iar15lL+KWDo40mhq43wHYR0Uqe6aoeZjrk+QuHmlrEgF716FXgmvvUKoEYI/8dSdFycjou4iD83K
	X7KnTO49ZW+9aRXSqK23zJlxpMGoDzAGw9BUN9Z4hpsvtdlMEtkwp+88hZuNj1RP+GLIRJ+gHoXb+
	8/pTClLt+fUPy1IvLwPv1wA1sZRUXcB+kVBSrg4Gcm/IcitRSFRk+eR19XdYzRkixPXWka/Mlhj4u
	0zo+4YOtEGYZC0w3lhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radEl-0000000GeSk-2qP4;
	Thu, 15 Feb 2024 15:01:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radEf-0000000GeLO-0ee4;
	Thu, 15 Feb 2024 15:01:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708009264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7jurcXevAzLq5b3XNHkngyd9aG7HXv/ajp+hOIdurHE=;
	b=ACCFDxP4M6h+kPZxC8n5YjerDJytE7XIB0xzvUQXXsvsgxPRymDCIwAOCzBTMwjF/tAC6G
	5DClIsEIgMg8ovLCONa+WB3EEhNaR0do2/BXAHLP/kwTJWohwek+I2LO/AhhBv4naEVE0e
	aHQgbFkMm4aV/a+ICweO1zbPNB9N6AaJDpzcUIWsYMFaaN5tq4TzG4KtRQiOI3ZH5zRyML
	a3IJasqR/LwhLRPH+XRe6Jqq5lcpAy4rh9jyXmQL4Rc0PsGK3z88opG/4JIKCQLL2Mssf8
	aa1w9c8EObkVpg4klvWcgi5NpujCCu6uXwJBtrkci69IOAL7y7ahvCT+XVT0PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708009264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7jurcXevAzLq5b3XNHkngyd9aG7HXv/ajp+hOIdurHE=;
	b=KXqXpqo8rLP9B7h0qdTcwSs6/WBr1zOrw9q92FTDKvwl3twYREKP5rQvKTif3BtifKxCaI
	TvV5B162CoS6pGDQ==
To: Marc Zyngier <maz@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v12 04/25] genirq/irqdomain: Add DOMAIN_BUS_DEVICE_IMS
In-Reply-To: <86o7ci3puk.wl-maz@kernel.org>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-5-apatel@ventanamicro.com>
 <86o7ci3puk.wl-maz@kernel.org>
Date: Thu, 15 Feb 2024 16:01:03 +0100
Message-ID: <87h6i9epqo.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_070113_356950_7369D62F 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 15 2024 at 11:54, Marc Zyngier wrote:
> On Sat, 27 Jan 2024 16:17:32 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
>>  	DOMAIN_BUS_PCI_DEVICE_IMS,
>> +	DOMAIN_BUS_DEVICE_IMS,
>
> Only a personal taste, but since we keep calling it "device MSI",
> which it really is, I find it slightly odd to name the token
> "DEVICE_IMS".
>
> From what I understand, IMS is PCIe specific. Platform (and by
> extension device) MSI extends far beyond PCIe. So here, DEVICE_MSI
> would make a lot more sense and avoid confusion.

That's true, but I chose it intentionally because Interrupt Message
Store (IMS) is a (PCI) device specific way to store the message contrary
to PCI/MSI[-X] which has standardized storage.

So my thought was that this exactly reflects what the platform device
requires: device specific message store, aka DMS or DSMS :)

> But hey, I don't have much skin in this game, and I can probably
> mentally rotate the acronym...

I have no strong opinion about it though.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
