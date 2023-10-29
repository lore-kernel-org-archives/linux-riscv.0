Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C3C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB/zKB8V0J+ZuU2QF/pE1U++gRdnsrAZE/Mwn+n6NOY=; b=eF2EwFeJUAn2Sz
	hQa2VrJmjNzXF2LiCKZ+meRRUfm0TgoULfMQA/f9UwEwUFbpn+Va+T4j0ijD+LIQLSa9SZ1zRkjP+
	bMzDewPmj+q7Yc061zKptfzl12ehb4lDWRQlYIlDG2faeL79x2AxfHoFzDc0yQu/O9sAErAiRkEyW
	0jTBaH/TSoCJChp87RSFg+vi2m8+Vvd1Je07fbJlktKz85U7E1M7WKl8oJbyFgEG+jfVPAwkp6q5n
	hVmrd1+cm4v61iGCcQkBEWRQgFadSO51hQNKIp/AtrQo1ix5NNB5lSlAeFnckztw8WyLcvo3C6iux
	7hCk/yAMC6uTBX7f93kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxBqp-0024XL-10;
	Sun, 29 Oct 2023 19:53:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxBqm-0024Wb-1w
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 19:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 49E38B80905;
	Sun, 29 Oct 2023 19:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46471C433C8;
	Sun, 29 Oct 2023 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698609208;
	bh=lmudrSFAHZUzHPWgKrth9d+IMU9R0eRDc3eGd1MXJC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BYRXQ30H7zG0VuXvZAImgIlhy7I8o0cO6u74yfM2MHH0xc7shZ1zPeV2NrW/FjYxm
	 i4M3G+IwBNXrgeZp3ir7RiYdAXCQ21w9+g2mLWKgb4yZLNGvf15tGfJJ8JL5yaPcEq
	 qBB0vaSNa3IHDUzD7YZPYbnbbfWpmSVIikUNp0bt+QECZyY+Cvos8qOifeaL0DKm8V
	 B8G6oz2+1L1rKMk4wfU5chSopqlaNhyqJQrmmQ6EM1kahfNdN2MaPEIqrYWIKZinDD
	 UXmf+XJb9cuLyPTCuIg838uJhSmMdiQHs5+J8kT0pLfy4AXYne4Dm49zDSNV8mDFwo
	 9nksLDpGRohlw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI
 irqdomain
In-Reply-To: <87y1fmzja1.ffs@tglx>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com>
 <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UVgTd-a0671Lab_ZeOPWP3=wHY+pydKHqaR-Yg65YhrA@mail.gmail.com>
 <87jzrbf5cw.fsf@all.your.base.are.belong.to.us> <87y1fmzja1.ffs@tglx>
Date: Sun, 29 Oct 2023 20:53:25 +0100
Message-ID: <87bkchfbnu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_125332_810050_5613D71E 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gT24gV2VkLCBP
Y3QgMjUgMjAyMyBhdCAxMDo1NSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4+IE5vdyBmb3IgSU1T
SUMtUENJIGRvbWFpbiwgdGhlIFBDSSBmcmFtZXdvcmsgZXhwZWN0cyB0aGUKPj4+IHBjaV9tc2lf
bWFzay91bm1hc2tfaXJxKCkgZnVuY3Rpb25zIHRvIGJlIGNhbGxlZCBidXQgaWYKPj4+IHdlIGRp
cmVjdGx5IHBvaW50IHBjaV9tc2lfbWFzay91bm1hc2tfaXJxKCkgaW4gdGhlIElNU0lDLVBDSQo+
Pj4gaXJxY2hpcCB0aGVuIElNU0lDLUJBU0UgKHBhcmVudCBkb21haW4pIGlycV9tYXNrL3VtYXNr
Cj4+PiB3b24ndCBiZSBjYWxsZWQgaGVuY2UgdGhlIElSUSB3b24ndCBiZSBtYXNrZWQvdW5tYXNr
Lgo+Pj4gRHVlIHRvIHRoaXMsIHdlIGNhbGwgYm90aCBwY2lfbXNpX21hc2svdW5tYXNrX2lycSgp
IGFuZAo+Pj4gaXJxX2NoaXBfbWFzay91bm1hc2tfcGFyZW50KCkgZm9yIElNU0lDLVBDSSBkb21h
aW4uCj4+Cj4+IE9rLiBJIHdvbnQgZGlnIG1vcmUgaW50byBpdCBmb3Igbm93ISBJZiB0aGUgaW50
ZXJydXB0IGlzIGRpc2FibGVkIGF0Cj4+IFBDSSwgaXQgc2VlbXMgYSBiaXQgb3ZlcmtpbGwgdG8g
KmFsc28qIG1hc2sgaXQgYXQgdGhlIElNU0lDIGxldmVsLi4uCj4KPiBPbmx5IF9pZl8gdGhlIGRl
dmljZSBwcm92aWRlcyBNU0kgbWFza2luZywgYnV0IHRoYXQgZXh0cmEgbWFzay91bm1hc2sgaXMK
PiBub3QgdGhlIGVuZCBvZiB0aGUgd29ybGQuCgpZaWtlcyAtLSBzbyBNU0kgbWFza2luZyBpcyBv
cHRpb25hbC4gSWNrLiA6LSggVGhhbmtzIGZvciB0aGUgZXhjZWxsZW50Ck1TSSB2cyBNU0ktWCBw
b3N0IGluIHRoZSBvdGhlciB0aHJlYWQsIEJUVy4gR3JlYXQgc3R1ZmYhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
