Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044ADC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 17:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQZ1p1ZnjyGiLPTPnkQYkWEGJVPAV+sKgFQBpwnqXUc=; b=uu+DiNEelC6x1B
	HGdaiJNAnoj4gI9g22LGfMgvO9DuZcVzzE3lRvKNlsYhtu+3NxwI7JYdrjC4pnk+Y1dWpnLFcP33Q
	gh7zeF5jdJRfoBMayTVWw3X3YU4JaEuF0PfZ1GeJrMEd1BQfdxr8bmwLHkbVJIrOix9oQcGc5lOAw
	6xwOogYyeTEcPin6TcaBSeGlumPqrkR43Q/4wGQC+HbYMhXOA9vGsQZo7fNNkjSFmtU0c1A16zZmU
	T+mV0UOLeEO2rEHHtdan+T3dRLK6GMvPVRLLZVRMvu4nwrpOtUuk8/v+U/1EA+ekQCC0isEnsXHFD
	lmQQlgK3dHOZ+MLNHlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHQQ-00Ba5b-AA; Fri, 17 Dec 2021 17:53:46 +0000
Received: from mail-4022.proton.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myG3z-00B9yq-Hl
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 16:26:33 +0000
Date: Fri, 17 Dec 2021 16:26:24 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
From: conor dooley <mail@conchuod.ie>
Cc: Conor.Dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, Lewis.Hanly@microchip.com,
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Message-ID: <r3tVOER8Xt_7UX5NRWualG_an6bcx-_uljhXh9_GUny45ZcO_G-dpv98jWXwKpuvSp-uTvNFSdqsLHFbYGl0Qdv_q7ZqegBHWWcgnAZUA5A=@conchuod.ie>
In-Reply-To: <2e7588e5-9dc5-571f-d7e9-0ee5c89ab39e@canonical.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
 <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
 <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
 <422126ac-ce26-2940-5b4d-fe79a1fa89c5@microchip.com>
 <2e7588e5-9dc5-571f-d7e9-0ee5c89ab39e@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_082631_818283_61CB0C2F 
X-CRM114-Status: GOOD (  16.35  )
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
Reply-To: conor dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCgpPbiBGcmlkYXksIERlY2VtYmVyIDE3dGgsIDIwMjEgYXQgMTU6NDcsIEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cgo+IE9u
IDE3LzEyLzIwMjEgMTY6MjIsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Cj4g
PiBPbiAxNy8xMi8yMDIxIDE1OjA3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4KPiA+
ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPiA+Cj4gPiA+IE9uIDE3LzEy
LzIwMjEgMTU6NTMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gT24g
MTcvMTIvMjAyMSAxMDozMywgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiA+IEZyb206IENvbm9yIERvb2xleSBjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bQo+ID4gPiA+ID4KPiA+ID4gPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIGhh
cmR3YXJlIHJuZyBkZXZpY2UgYWNjZXNzZWQgdmlhCj4gPiA+ID4gPgo+ID4gPiA+ID4gdGhlIHN5
c3RlbSBzZXJ2aWNlcyBvbiB0aGUgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tCj4gPiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ID4gPgo+ID4gPiA+IFRocmVlIHRvcGljczoKPiA+ID4gPgo+ID4g
PiA+IDEuICBOb2RlIG5hbWUgKGFzIG1vc3Qgb2Ygb3RoZXJzIGFyZSB1c2luZyk6IHJuZwo+ID4g
PiA+IDIuICBza2lwIHRoZSBsYWJlbCwgbm90IGhlbHBpbmcgaW4gZXhhbXBsZS4KPiA+ID4gPiAz
LiAgVGhpcyBsb29rcyB2ZXJ5IHNpbXBsZSwgc28gSSB3b25kZXIgaWYgdGhlIGJpbmRpbmdzIGFy
ZSBjb21wbGV0ZS4gTm8KPiA+ID4gPgo+ID4gPiA+ICAgICBJTyBzcGFjZS9hZGRyZXNzLi4uIEhv
dyBpcyBpdCBnb2luZyB0byBiZSBpbnN0YW50aWF0ZWQ/Cj4gPiA+IE9LLCBub3cgSSBzYXcgdGhl
IHVzYWdlIGluIERUUy4gSSBoYXZlIGRvdWJ0cyB0aGlzIG1ha2VzIHNlbnNlIGFzCj4gPiA+IHNl
cGFyYXRlIGJpbmRpbmdzLiBJdCBsb29rcyBsaWtlIGludGVncmF0ZWQgcGFydCBvZiBzeXNjb250
cm9sbGVyLCBzbwo+ID4gPiBtYXliZSBtYWtlIGl0IHBhcnQgb2YgdGhhdCBiaW5kaW5nPyBPciBh
dCBsZWFzdCBhZGQgcmVmIHRvIHN5c2NvbnRyb2xsZXIKPiA+ID4gYmluZGluZ3MgdGhhdCBzdWNo
IGNoaWxkIGlzIGV4cGVjdGVkLgo+ID4gQWNraW5nIHRoZSByZXN0IG9mIHRoaXMsIHJlOiBhZGRp
bmcgdGhlIHJlZjogaXMgd2hhdCBpcyBiZWluZyBkb25lIGluCj4gPiBwYXRjaCAwMy8xNyBpbnN1
ZmZpY2llbnQ/Cj4gT3BzLCBJIG1pc3NlZCB0aGUgMDMvMTcuIFllYWgsIGl0IGxvb2tzIGl0IGlz
IHN1ZmZpY2llbnQgYW5kIGluIHN1Y2gKPiBjYXNlIEkgdGhpbmsgeW91IGRvIG5vdCBuZWVkIHRo
aXMgcGF0Y2guIFRoZSBjb21wYXRpYmxlIGlzIGRvY3VtZW50ZWQgaW4KPiAwMy8xNy4gVGhlIHNh
bWUgZm9yIHN5c3NlcnYuCkdyYW5kLCB0aGF0IG1ha2VzIHRoaW5ncyBlYXNpZXIuCkNvbm9yLgo+
Cj4gQmVzdCByZWdhcmRzLAo+Cj4gS3J6eXN6dG9mCj4KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPgo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPgo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
