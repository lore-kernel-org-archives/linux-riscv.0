Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73BFC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52sNEPLOwh074BgKU+XozibYNDl8NfEAAtU1X6Rpsxs=; b=sOd9G9fBo/Ojwv
	bAxnI5oQyjKVjVuR0PL8qaHQ3m+whMEmU+Ph1wJeLnHLu5JzSxxmVj5X1+HsKtVxO//y3EmTXF7Ta
	YXIL4x1hW6y6gV5hBadDCggB/y9spjsW+hJrtb28vb5kTD1qn3GJxHpq2gtVesZSEH/RbY3bvTM48
	4scxznzox5bk6v7CbLj+FjAGDdR3oegwbQs773Vr54P5zLF9Fq5zZBunE2atxhW8wovFxXgehBj6B
	qsWO2FD6SgkDTEfvmV/1RepHL0IZJM5v+vSMoqyvatHbLP24hVr2TPnbLAChl3QGWd7z/1T5V3Lyg
	xsbwTzXe0rk/Aim656xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXTZd-0000r7-PE; Wed, 01 Mar 2023 21:01:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXTZO-0000m7-U5; Wed, 01 Mar 2023 21:01:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F139DB81135;
	Wed,  1 Mar 2023 21:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BD2C433A0;
	Wed,  1 Mar 2023 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704458;
	bh=Ijy28NfIAolHq1kijXKPv1A9Prn6Z4PgPnz0SF2ZvmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwnNOgDopWNiUb4dKzA0Y6sT0gASegFoNl0l1oHhxaeFwidRVACqKvo9Zw4Lq2uLa
	 DkRPAf51+Vr8EEyQ7IwC/Bj5H1tJVAjANsJyJLagfb6dQBIR+9OsGjhNPWRat2SOtH
	 5jiteysKnyeBDdmsXExcQfoBUuLwKJRarM2/PpsDCzlFSlDaYiuiIN6Yn50f7C1yat
	 Kl5hMVdu4kXvgesUhxebkvb/oOudYsbAKXyirkpGD3xB/LvTXAtTlhB/h40wU7a9WI
	 X+6tPt1WSw58XL3OkDSeUjRPC3OEETL51n26pr7wfG3C7UJmYklBJjZHN6oNtzMzrG
	 H1pgP6Xi9fu0w==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536c02c9dfbso387844087b3.11;
        Wed, 01 Mar 2023 13:00:58 -0800 (PST)
X-Gm-Message-State: AO0yUKWIHQnKcgyDBdm+h5rV3UbzccIvpdQN12SVh8XMDjDdz+13AmAb
	1aYkVslmF4TZl0hy8vaiHrBNQkkVEhsHmJPMsQ==
X-Google-Smtp-Source: AK7set/B7w4SIUVUY+fuTrfn39/aDxu+LSL+nDi5aDHHQnm81UFIS2ScAXvxaj+SUvgnwt845OQ2PIVb1st0BjISJs0=
X-Received: by 2002:a05:6102:3ca9:b0:41e:bccf:5669 with SMTP id
 c41-20020a0561023ca900b0041ebccf5669mr6637793vsv.2.1677704437053; Wed, 01 Mar
 2023 13:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com> <20230301185209.274134-4-jjhiblot@traphandler.com>
In-Reply-To: <20230301185209.274134-4-jjhiblot@traphandler.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Mar 2023 15:00:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJvYnBtaOwaRbNo5Eqp51yxhJpnSYQWEGfKjtZKjm7R4g@mail.gmail.com>
Message-ID: <CAL_JsqJvYnBtaOwaRbNo5Eqp51yxhJpnSYQWEGfKjtZKjm7R4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] of: irq: release the node after looking up for "interrupts-extended"
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: saravanak@google.com, clement.leger@bootlin.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, zajec5@gmail.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Marc Zyngier <maz@kernel.org>, afaerber@suse.de, 
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Rowand <frowand.list@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Nishanth Menon <nm@ti.com>, 
	ssantosh@kernel.org, mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-wireless@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_130103_290416_A7811ADC 
X-CRM114-Status: GOOD (  15.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCAxMjo1M+KAr1BNIEplYW4tSmFjcXVlcyBIaWJsb3QKPGpq
aGlibG90QHRyYXBoYW5kbGVyLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIG9mX3BhcnNlX3BoYW5kbGVf
d2l0aF9hcmdzKCkgc3VjY2VlZHMsIGEgZ2V0KCkgaXMgcGVyZm9ybWVkIG9uCj4gb3V0X2lycS0+
bnAuIEFuZCBhbm90aGVyIGdldCgpIGlzIHBlcmZvcm1lZCBpbiBvZl9pcnFfcGFyc2VfcmF3KCks
Cj4gcmVzdWx0aW5nIGluIHRoZSByZWZjb3VudCBiZWluZyBpbmNyZW1lbnRlZCB0d2ljZS4KPiBG
aXhpbmcgdGhpcyBieSBjYWxsaW5nIHB1dCgpIGFmdGVyIG9mX2lycV9wYXJzZV9yYXcoKS4KClRo
aXMgbG9va3MgbGlrZSBhIGJhbmQtYWlkIHRvIG1lLiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRoYXQg
dGhlIGNhbGxlcgpvZiBvZl9pcnFfcGFyc2VfcmF3KCkgYWxyZWFkeSBob2xkcyBhIHJlZiB0byBv
dXRfaXJxLT5ucC4gU28gdGhlIGZpcnN0Cm9mX25vZGVfZ2V0KCkgaW4gaXQgbG9va3Mgd3Jvbmcu
IEl0IGxvb2tzIGxpa2UgdGhlIHJlZmNvdW50aW5nIHdhcwpvcmlnaW5hbGx5IGJhbGFuY2VkLCBi
dXQgY29tbWl0IDJmNTNhNzEzYzRiNiAoIm9mL2lycTogRml4IGRldmljZV9ub2RlCnJlZmNvdW50
IGluIG9mX2lycV9wYXJzZV9yYXcoKSIpIGRyb3BwZWQgdGhlIHB1dCBvbiBleGl0IGFmdGVyICdn
b3QKaXQhJy4gSSdtIG5vdCBzdXJlIGlmIGp1c3QgYWRkaW5nIGl0IGJhY2sgd291bGQgYmUgY29y
cmVjdCBvciBub3QKdGhvdWdoLgoKQWxsIHRoaXMgbmVlZHMgc29tZSB0ZXN0IGNhc2VzIHRvIGJl
IHN1cmUgd2UgZ2V0IHRoaW5ncyByaWdodC4uLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
