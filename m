Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D6BC71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPBFkCWifhcwZhqEhms+S81MHApbqMka7gHPFDhaAM8=; b=zC2cnLWAQ+fyPB
	e/AZq8cU8BhqBIEkWxSE5bvPD69A2HLMZ9NKdHYE1K/OAlDbcN6U9pJBGR0UgcmeTrAblMfFzpX5d
	svdNq+DVAt1ExnzcS4vUYM3J2cYzeguffLOdVy2Ss/NY/ONzl0bb7ZFyBtAddJJnmGiO5LmwXjNwq
	2mx4TiSCMIS9BXCuaoeKans29MwpJJglC/M/24hLIVDKUUin4bJSh7t4NwzCZEuobAvjRx0YGCNIa
	W8uMBqMgOS7bY8l1BstCk4mL4Xgfy0TCy3GGZfV+08OvoXCt1yKmU0crm9YpUUHxhrzWs+sukiD4t
	EeX4Y4T8r0Ki13Vp2GLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWA-0000000B0qN-1cS9;
	Wed, 11 Jun 2025 19:53:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMyK-0000000AJuA-14ih
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 15:02:37 +0000
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BBBDC340D21;
	Wed, 11 Jun 2025 15:02:34 +0000 (UTC)
Date: Wed, 11 Jun 2025 15:02:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, emil.renner.berthing@canonical.com,
	inochiama@gmail.com, geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
Message-ID: <20250611150227-GYA127466@gentoo>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo>
 <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_080236_313390_7A0CE66B 
X-CRM114-Status: GOOD (  15.44  )
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

SGkgR3VvZG9uZywKCk9uIDIyOjMyIFdlZCAxMSBKdW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBXZWQsIEp1biAxMSwgMjAyNSBhdCA5OjU44oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRv
by5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEd1b2RvbmcsCj4gPgo+ID4gT24gMjA6NTcgV2VkIDEx
IEp1biAgICAgLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBFbmFibGUgdGhlIFBlcmlwaGVyYWwg
RE1BIGNvbnRyb2xsZXIgKFBETUEwKSBvbiB0aGUgU3BhY2VtaVQgSzEtYmFzZWQKPiA+ID4gQmFu
YW5hIFBpIEYzIGJvYXJkIGJ5IHNldHRpbmcgaXRzIHN0YXR1cyB0byAib2theSIuIFRoaXMgYm9h
cmQtc3BlY2lmaWMKPiA+ID4gY29uZmlndXJhdGlvbiBhY3RpdmF0ZXMgdGhlIFBETUEgY29udHJv
bGxlciBkZWZpbmVkIGluIHRoZSBTb0MncyBiYXNlCj4gPiA+IGRldmljZSB0cmVlLgo+ID4gPgo+
ID4gICBBbHRob3VnaCB0aGlzIHNlcmllcyBpcyBhY3RpdmVseSBkZXZlbG9wZWQgdW5kZXIgQmFu
YW5hcGktZjMgYm9hcmQKPiA+IGJ1dCBpdCBzaG91bGQgd29yayBmaW5lIHdpdGgganVwaXRlciBi
b2FyZCwgc28gSSdkIHN1Z2dlc3QgdG8gZW5hYmxlCj4gPiBpdCB0b28sIHRoYW5rcwo+ID4KPiAK
PiBJJ2QgYmUgZ2xhZCB0byBpbmNsdWRlIHRoZSBKdXBpdGVyIGJvYXJkIGFzIHdlbGwuIFNpbmNl
IEkgZG9uJ3QgaGF2ZSBKdXBpdGVyCj4gaGFyZHdhcmUgZm9yIHRlc3RpbmcsIGNvdWxkIHNvbWVv
bmUgd2l0aCBhY2Nlc3MgdmVyaWZ5IGl0IHdvcmtzIGJlZm9yZSBJCj4gYWRkIGl0IHRvIHRoZSBz
ZXJpZXM/Cj4gCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGhvdyB0byB0ZXN0PyBsaWtlIGlm
IGFueSB0ZXN0IGNhc2VzIHRoZXJlPwoKSSB3b3VsZCBhc3N1bWUgaXQgd29yayBmaW5lIG9uIGp1
cGl0ZXIgc2luY2UgaXQncyBhIFNvQyBsZXZlbCBmZWF0dXJlPwppbnN0ZWFkIG9mIGJvYXJkIHNw
ZWNpZmljLi4KCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
