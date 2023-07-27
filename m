Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC94C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 00:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFEZRjp+a1BYQFXF6GrEZxq1GR4MhU3yxaNPzk6E/jo=; b=3N4t8iSJ32SxaY
	T915Rug6bdEFha0+jj3uUYFLSswIAjeamT8K7kHU6Gz0U7JnMvxKCxN1Y0vzLQPdOI0YLaYxz+G7c
	T7ukECPFFg9/iyrIYMFMEzC0HBwboRfS0WVBUTdjTkTjIKOCAPYgD2d+3PXymnT6uCIc/rZL77+Ht
	eAdVZ5csomqgtm2GYV/8ny60NgsLwcTq2t8QSkI3cXjIXO3T493VAZ6YO4NxikPzrs6oXfIz4obcc
	8GEwY10AmPMJmojZM3ppmOkY1uRnPcrZ7zcaT65hAgfnD2WO/HMcZHExD3svJkzNrqMZNOzRWyPg9
	zI6anrTLa+AgW8ZX3Vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOpHe-00BpA2-0K;
	Thu, 27 Jul 2023 00:55:14 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOpHa-00Bp8d-3A
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 00:55:12 +0000
Received: from localhost.localdomain (xry111.site [89.208.246.23])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 402161C1E1F;
	Thu, 27 Jul 2023 00:55:02 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690419305;
	bh=EGiODkWN+sI4nD/FFSATqvkp1/ldo4EJzoi1AC4wIA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Kh/eQ+OxKl2JWIeZfu0JsJd/LcrQINOI2JVHgm+QQGNOSnPJ7QTLDlNz5IqwOCPRb
	 lQdXOMt32fYhpHUsKRiKv5mLIOu4zVyJS0bx+ZxmTB1iMBSTnYWocyg79ealOaxOOk
	 FQn3XI2S2WtGvW8WGzvC3wEMnyNU+J7H7tJ4pQZCkSL6/vMjFtlc4SDGupIWJIyXyX
	 6FziEQESVxgrtRYr+ZCGxu7Bg09tqPf7MTq2vJ8agLtr1HykWFcwVnr2hL5Y5LdVcB
	 h2d+hAx2qSHs6PCHgX4Ycr74d7JAYT4jHcQ4g92fWiJ0fjclgdo9LaU3NGVikHZyvs
	 VXaXme01rZI+w==
Message-ID: <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Thu, 27 Jul 2023 08:54:59 +0800
In-Reply-To: <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
	 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
	 <20230725-unheard-dingy-42f0fafe7216@wendy> <ZL/jMYL3akl78ZZN@xhacker>
	 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
	 <ZME1J4mpVf5yth32@xhacker>
	 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_175511_211718_85C15437 
X-CRM114-Status: GOOD (  12.07  )
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

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDA4OjE0ICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4gT24g
V2VkLCAyMDIzLTA3LTI2IGF0IDIzOjAwICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4g
d2hpY2ggZHRzIHIgdSB1c2luZz8gc2VlIGJlbG93Lgo+ID4gCj4gPiA+IAo+ID4gPiBPciBtYXli
ZSBteSB0b29sY2hhaW4gKEdDQyAxMy4xLjAsIEJpbnV0aWxzLTIuNDAsIHdpdGggbm8gcGF0Y2hl
cykgY2FuCj4gPiA+IG1pc2NvbXBpbGUgdGhlIGtlcm5lbD8KPiAKPiAvKiBzbmlwICovCj4gCj4g
PiA+IEJvb3QgSEFSVCBJRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogMAo+ID4gPiBCb290
IEhBUlQgRG9tYWluwqDCoMKgwqDCoMKgwqDCoMKgIDogcm9vdAo+ID4gPiBCb290IEhBUlQgUHJp
diBWZXJzaW9uwqDCoMKgIDogdjEuMTEKPiA+ID4gQm9vdCBIQVJUIEJhc2UgSVNBwqDCoMKgwqDC
oMKgwqAgOiBydjY0aW1hZmRjdngKPiA+IAo+ID4gd2hhdD8gSSBkb24ndCB0aGluayB0aGUgbWFp
bmxpbmUgZHRzIHByb3ZpZGUgdiBhbmQgeC4gCj4gCj4gSSBjb3BpZWQgdGhlIGNvbXBpbGVkIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdGIKPiBpbnRvIC9i
b290IGFuZCBsb2FkZWQgaXQgd2l0aCB1LWJvb3QgImxvYWQiIGNvbW1hbmQgb250byAweDQ2MDAw
MDAwLCBhbmQKPiBwYXNzZWQgdGhpcyBhZGRyZXNzIHRvIHRoZSBib290aSBjb21tYW5kLgo+IAo+
IEJ1dCBtYXliZSBJJ3ZlIGNvcGllZCB0aGUgd3JvbmcgZmlsZSBvciBtYWRlIHNvbWUgb3RoZXIg
bWlzdGFrZS4uLiBJJ2xsCj4gcmVjaGVjay4KCkhtbSwgYW5kIGlmIEkgcmVhZCBPcGVuU0JJIGNv
ZGUgY29ycmVjdGx5LCB0aGlzIGxpbmUgcmVmbGVjdHMgdGhlCmNvbnRlbnQgb2YgdGhlIG1pc2Eg
Q1NSLCBub3QgdGhlIERUIHJpc2N2LGlzYSB2YWx1ZS4KClRoZSBsb2cgb2Ygc3VjY2Vzc2Z1bCBi
b290IHByb3ZpZGVkIGJ5IERyZXcgYWxzbyBjb250YWlucwoicnY2NGltYWZkY3Z4IjoKCmh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL3BkcDcvMjMyNTk1OTVhNzU3MGYxZjExMDg2ZDI4NmUxNmRmYjYK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
