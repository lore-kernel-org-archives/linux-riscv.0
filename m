Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF310C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4AaA1uBwJyu4uxYuKCAZ8YbgZ84esEq0vx8cZyh6pc=; b=UXEIFOO5FoHWHt
	AUo9eeweTLiyuz5IrArGm/tIm5XdiQvOFHLhuP+ASsBEF4vxqRbFHlbDtYBi9zeUejPyFYH8WZRQV
	X5k+fUC+4a+LVKSRLh+JtAlCL1BRfDKZCflQ7kW3pVbnYy0gBNzkvUZ4yHuKsfYwLi7mrbr/fh8NZ
	PPpnXLerJUlWuoqfVl+I3nORZZNjU9ls6cKS/diHY097Qve7DONoqbtqBi4uYdHDj2w1WSDHxa2Ag
	Ir8bEaa1RbRG2s7HdJFOf+/Y2wjmJVcl8LetQRIiSwWfAuU3YkgnQzJc4t3B+23R+Y/DVeSmrsqNg
	cWYa/QVWDDaqCoBwUhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNt-00000005Inm-3wLC;
	Tue, 15 Apr 2025 10:19:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dHq-00000005Hsy-3A4k
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 10:13:03 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7E184342FEB;
	Tue, 15 Apr 2025 10:13:00 +0000 (UTC)
Date: Tue, 15 Apr 2025 10:12:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com,
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
	tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	elder@riscstar.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
Message-ID: <20250415101249-GYA30674@gentoo>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031302_814977_8CAAC392 
X-CRM114-Status: GOOD (  20.99  )
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

SGkgUGhpbGlwcCwKCk9uIDE3OjU0IFR1ZSAxNSBBcHIgICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBUdWUsIEFwciAxNSwgMjAyNSBhdCA0OjUz4oCvUE0gUGhpbGlwcCBaYWJlbCA8cC56YWJl
bEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gRnIsIDIwMjUtMDQtMTEgYXQgMTc6
NDQgKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gRnJpLCBBcHIgMTEsIDIwMjUg
YXQgMDk6MTQ6MTVQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4gPiBBZGQgYW4gb3B0
aW9uYWwgcmVzZXRzIHByb3BlcnR5IGZvciB0aGUgTWFydmVsbCBQV00gUFhBIGJpbmRpbmcuCj4g
PiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFy
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbCB8IDMgKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbAo+
ID4gPiA+IGluZGV4IDllZTE5NDZkYzJlMS4uOTY0MGQ0YjYyN2MyIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdt
LnlhbWwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdt
L21hcnZlbGwscHhhLXB3bS55YW1sCj4gPiA+ID4gQEAgLTMxLDYgKzMxLDkgQEAgcHJvcGVydGll
czoKPiA+ID4gPiAgICBjbG9ja3M6Cj4gPiA+ID4gICAgICBtYXhJdGVtczogMQo+ID4gPiA+Cj4g
PiA+ID4gKyAgcmVzZXRzOgo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4KPiA+ID4gRG8g
YW55IG9mIHRoZSBjdXJyZW50bHkgc3VwcG9ydGVkIGRldmljZXMgdXNlIGEgcmVzZXQ/IElmIG5v
dCwgdGhlbiBhZGQKPiA+ID4gdGhpcyBpbiB0YW5kZW0gd2l0aCB0aGUgbmV3IGNvbXBhdGlibGUg
YW5kIG9ubHkgYWxsb3cgaXQgdGhlcmUgcGxlYXNlLgo+ID4KPiA+IEFsc28sIGlmIHNwYWNlbWl0
LGsxLXB3bSBjYW4gbm90IHdvcmsgd2l0aG91dCB0aGUgcmVzZXQgYmVpbmcKPiA+IGRlYXNzZXJ0
ZWQsIG1hcmsgaXQgYXMgcmVxdWlyZWQuCgpJZiBJIGluZXJwcmV0IGNvcnJlY3RseSwgb25seSBy
ZXNldCByZXF1aXJlcyBleHBsaWNpdGx5IGJlaW5nIGRlLWFzc2VydGVkLApuZWVkIHRvIG1hcmsg
YXMgcmVxdWlyZWQ/IHRoYXQncyBiZWluZyBzYWlkLCBpZiByZXNldCBjb21lcyBvdXQgYXMgZGUt
YXNzZXJ0ZWQKIGJ5IGRlZmF1bHQgYWZ0ZXIgcG93ZXIgcmVzZXQsIHRoZW4gbm90IG5lY2Vzc2Fy
eT8KKGluIG90aGVyIGNhc2VzLCBzb21lIGRldmljZSBibG9jayBpcyBpbiBhc3NlcnRlZCBzdGF0
ZSBieSBkZWZhdWx0KQoKdGhhbmtzCj4gPgo+IAo+IFRoYW5rIHlvdSBQaGlsaXBwLiBzcGFjZW1p
dCxrMS1wd20gY2FuIG5vdCB3b3JrIHdpdGhvdXQgdGhlIHJlc2V0Lgo+IEkgd2lsbCBhZGQgdGhh
dCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+IC1HdW9kb25nCj4gCj4gPiBUaGUgZHJpdmVyIGNh
biBzdGlsbCB1c2UgcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWwuCj4gPgo+ID4gcmVnYXJkcwo+
ID4gUGhpbGlwcAoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExpbnV4IERldmVsb3BlcgpH
UEcgS2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
