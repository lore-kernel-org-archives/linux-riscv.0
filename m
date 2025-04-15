Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BF2C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7e9TzJ2s2k92ntonnNbE2UsBZLQ4dq3D5WvIiarjNE=; b=ELMtc2T3IXQGkj
	nGrklF+KGHPcRPkVsYyHa0qNxNg7VInf9Zg1eJWYmg4WK3GHyM0imRthxOUa2FM6CnzM4dx0+cSpW
	Lb59oX/LO4SENWf5ucwK2a8nL/fY+2pfJhHEA/clBbqx1J5bv8a9Cbu8RrlkH1U6nDYKCDKEK77Cw
	cI2wizm45ECQKIhBV5ngM1+HKKPqYP50G+2wHrpGR6P7Nfqw2DbQzedngn4lv1f/UVMq9bXhMn71u
	uOHh/k38wrxBIYyOzCPpQHSYul3ZDinyXAKdLuhq2RjMcar8ShPJDWZV3q0RuXFRz7n6io6/bOSvb
	GXkJK3hV4r1X6oy5X+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fW8-00000005lc8-2dHF;
	Tue, 15 Apr 2025 12:35:56 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fOf-00000005jte-1T7G
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:28:14 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B8113335DE9;
	Tue, 15 Apr 2025 12:28:11 +0000 (UTC)
Date: Tue, 15 Apr 2025 12:28:07 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Guodong Xu <guodong@riscstar.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, ukleinek@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, drew@pdp7.com, inochiama@gmail.com,
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de,
	hal.feng@starfivetech.com, unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
Message-ID: <20250415122807-GYA30943@gentoo>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_052813_415273_7D1FDFB3 
X-CRM114-Status: GOOD (  26.41  )
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

SGkgQWxleCwKCk9uIDA3OjExIFR1ZSAxNSBBcHIgICAgICwgQWxleCBFbGRlciB3cm90ZToKPiBP
biA0LzE1LzI1IDU6MTIgQU0sIFlpeHVuIExhbiB3cm90ZToKPiA+IEhpIFBoaWxpcHAsCj4gPiAK
PiA+IE9uIDE3OjU0IFR1ZSAxNSBBcHIgICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+PiBPbiBU
dWUsIEFwciAxNSwgMjAyNSBhdCA0OjUz4oCvUE0gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IE9uIEZyLCAyMDI1LTA0LTExIGF0IDE3OjQ0
ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPj4+PiBPbiBGcmksIEFwciAxMSwgMjAyNSBh
dCAwOToxNDoxNVBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4+Pj4+IEFkZCBhbiBvcHRp
b25hbCByZXNldHMgcHJvcGVydHkgZm9yIHRoZSBNYXJ2ZWxsIFBXTSBQWEEgYmluZGluZy4KPiA+
Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIu
Y29tPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbCB8IDMgKysrCj4gPj4+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdtLnlhbWwK
PiA+Pj4+PiBpbmRleCA5ZWUxOTQ2ZGMyZTEuLjk2NDBkNGI2MjdjMiAxMDA2NDQKPiA+Pj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3
bS55YW1sCj4gPj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbAo+ID4+Pj4+IEBAIC0zMSw2ICszMSw5IEBAIHByb3BlcnRp
ZXM6Cj4gPj4+Pj4gICAgIGNsb2NrczoKPiA+Pj4+PiAgICAgICBtYXhJdGVtczogMQo+ID4+Pj4+
Cj4gPj4+Pj4gKyAgcmVzZXRzOgo+ID4+Pj4+ICsgICAgbWF4SXRlbXM6IDEKPiA+Pj4+Cj4gPj4+
PiBEbyBhbnkgb2YgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgZGV2aWNlcyB1c2UgYSByZXNldD8g
SWYgbm90LCB0aGVuIGFkZAo+ID4+Pj4gdGhpcyBpbiB0YW5kZW0gd2l0aCB0aGUgbmV3IGNvbXBh
dGlibGUgYW5kIG9ubHkgYWxsb3cgaXQgdGhlcmUgcGxlYXNlLgo+ID4+Pgo+ID4+PiBBbHNvLCBp
ZiBzcGFjZW1pdCxrMS1wd20gY2FuIG5vdCB3b3JrIHdpdGhvdXQgdGhlIHJlc2V0IGJlaW5nCj4g
Pj4+IGRlYXNzZXJ0ZWQsIG1hcmsgaXQgYXMgcmVxdWlyZWQuCj4gPiAKPiA+IElmIEkgaW5lcnBy
ZXQgY29ycmVjdGx5LCBvbmx5IHJlc2V0IHJlcXVpcmVzIGV4cGxpY2l0bHkgYmVpbmcgZGUtYXNz
ZXJ0ZWQsCj4gPiBuZWVkIHRvIG1hcmsgYXMgcmVxdWlyZWQ/IHRoYXQncyBiZWluZyBzYWlkLCBp
ZiByZXNldCBjb21lcyBvdXQgYXMgZGUtYXNzZXJ0ZWQKPiA+ICAgYnkgZGVmYXVsdCBhZnRlciBw
b3dlciByZXNldCwgdGhlbiBub3QgbmVjZXNzYXJ5Pwo+ID4gKGluIG90aGVyIGNhc2VzLCBzb21l
IGRldmljZSBibG9jayBpcyBpbiBhc3NlcnRlZCBzdGF0ZSBieSBkZWZhdWx0KQo+IAo+IFdlIGNh
biBvZnRlbiBiZW5lZml0IGZyb20gdGhlIHN0YXRlIHRoYXQgdGhlIGJvb3QgbG9hZGVyIGhhcyBs
ZWZ0Cj4gdGhpbmdzIGluLCBidXQgSSB0aGluayBpdCdzIGJldHRlciBub3QgdG8gYXNzdW1lIGl0
IGlmIHBvc3NpYmxlLgpyaWdodCwgSSBhZ3JlZSBtb3N0bHkKCj4gSSBzdXBwb3NlIGl0IG1pZ2h0
IG5vdCBiZSByZXF1aXJlZCB0aG91Z2guCj4gCj4gQW55d2F5LCB0aGUgcmVzZXQgbGluZSBpcyBh
dmFpbGFibGUgdG8gdXNlOyB3aHkgbm90IHJlcXVpcmUgaXQ/Cj4gCm1heWJlIHRoZXJlIGFyZSBj
YXNlcyB0aGF0IHVzZXJzIGRvbid0IHdhbnQgdG8gaXNzdWUgYSByZXNldC4uCnNvLCB3YW50IHRv
IG1ha2UgaXQgb3B0aW9uYWwuLiBJIGNhbiB0aGluayBvbmUgZXhhbXBsZSB0aGF0LApkaXNwbGF5
IGNvbnRyb2xsZXIgaXMgdXAgYW5kIHdvcmtpbmcgZnJvbSBib290bG9hZGVyIHRvIGxpbnV4LApy
ZXNldCBpdCB3aWxsIGdvdCBhIGZsaWNrZXIgcGljdHVyZS4uCgphbnl3YXksIG15IHF1ZXN0aW9u
IHdhcyB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgcG9saWN5IG9mCndyaXR0aW5nIERUUyBoZWhp
bmQuLgoKPiAKPiA+IHRoYW5rcwo+ID4+Pgo+ID4+Cj4gPj4gVGhhbmsgeW91IFBoaWxpcHAuIHNw
YWNlbWl0LGsxLXB3bSBjYW4gbm90IHdvcmsgd2l0aG91dCB0aGUgcmVzZXQuCj4gPj4gSSB3aWxs
IGFkZCB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4gPj4KPiA+PiAtR3VvZG9uZwo+ID4+Cj4g
Pj4+IFRoZSBkcml2ZXIgY2FuIHN0aWxsIHVzZSByZXNldF9jb250cm9sX2dldF9vcHRpb25hbC4K
PiA+Pj4KPiA+Pj4gcmVnYXJkcwo+ID4+PiBQaGlsaXBwCj4gPiAKPiAKCi0tIApZaXh1biBMYW4g
KGRsYW4pCkdlbnRvbyBMaW51eCBEZXZlbG9wZXIKR1BHIEtleSBJRCBBQUJFRkQ1NQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
