Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C479105F7B3
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGqSGvOxBS6fBtKAoz4jGLnb84hes+Lk9fUY6xKZnlE=; b=AD8d2dkckN+21m
	DK/ouV6ZzSLtmL6yT6BvYpuANGw31/1fO4o1Pp0qWNlPdWsh9pVfLf5MelRpQ+7OSYCE+PkqAkYxr
	Gn64f5rZWf8Q7fKFP/tsFfWOMBTm2onHGpFXzeW3cnQD2ZiTs+egmtP1LIhl+aZ8rZX7ulZUn7pNC
	gZmpfrCNdBQDvEAHpHYazHx5DRVJBQyKE/h3GbGE8EP8tXNOblN6C8XOZuzQqs8rw2YyPJYCfKleF
	yztV0Nyb5WnZyUuQsbNRfV+TstyivpsxKRy4NmbA7x4zLmMUyorwD3NM2qI85Lsp3jXVPQPnPyX4f
	g4tlzASyBRdNB9Ap0itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w148B-00000000VM0-2GE7;
	Fri, 13 Mar 2026 15:08:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1489-00000000VLQ-371b
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 15:08:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147y-0004k8-ID; Fri, 13 Mar 2026 16:08:38 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147x-00068r-1l;
	Fri, 13 Mar 2026 16:08:37 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w147s-00000000EEN-1tEc;
	Fri, 13 Mar 2026 16:08:32 +0100
Message-ID: <f23191e03d9f77e0288d6d660b8c45cd6389a533.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Junzhong Pan
 <junzhong.pan@spacemit.com>, Guodong Xu	 <guodong@riscstar.com>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 16:08:32 +0100
In-Reply-To: <20260312112858-GKH302167@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
	 <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
	 <20260312112858-GKH302167@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_080849_780187_8E0D8BC1 
X-CRM114-Status: GOOD (  23.66  )
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

T24gRG8sIDIwMjYtMDMtMTIgYXQgMTk6MjggKzA4MDAsIFlpeHVuIExhbiB3cm90ZToKPiBIaSBQ
aGlsaXBwLAo+IAo+IE9uIDEyOjA5IFRodSAxMiBNYXIgICAgICwgUGhpbGlwcCBaYWJlbCB3cm90
ZToKPiA+IE9uIERvLCAyMDI2LTAzLTEyIGF0IDEwOjM0ICswMDAwLCBZaXh1biBMYW4gd3JvdGU6
Cj4gPiA+IEluc3RlYWQgb2YgZ3JvdXBpbmcgc2V2ZXJhbCBkaWZmZXJlbnQgcmVzZXQgbGluZXMg
aW50byBvbmUgY29tcG9zaXRlCj4gPiA+IHJlc2V0LCBkZWNvdXBsZSB0aGVtIHRvIGluZGl2aWR1
YWwgb25lcyB3aGljaCBtYWtlIGl0IG1vcmUgYWxpZ25lZAo+ID4gPiB3aXRoIHVuZGVybHlpbmcg
aGFyZHdhcmUuCj4gPiA+IAo+ID4gPiBUaGUgRFdDMyBVU0IgaG9zdCBjb250cm9sbGVyIGluIEsz
IFNvQyBoYXMgdGhyZWUgcmVzZXQgbGluZXMgLSBBSEIsIFZDQywKPiA+ID4gUEhZLiBUaGUgUENJ
ZSBjb250cm9sbGVyIGFsc28gaGFzIHRocmVlIHJlc2V0IGxpbmVzIC0gREJJLCBTbGF2ZSwgTWFz
dGVyLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5v
cmc+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zcGFjZW1pdCxr
My1yZXNldHMuaCB8IDQyICsrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zcGFjZW1pdCxrMy1yZXNldHMu
aCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3BhY2VtaXQsazMtcmVzZXRzLmgKPiA+ID4g
aW5kZXggNzlhYzFjMjJiN2I1Li5jMTJmOGJkMzIwNDcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3BhY2VtaXQsazMtcmVzZXRzLmgKPiA+ID4gKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zcGFjZW1pdCxrMy1yZXNldHMuaAo+ID4gPiBAQCAtOTcs
MTEgKzk3LDcgQEAKPiA+ID4gICNkZWZpbmUgUkVTRVRfQVBNVV9TREgwICAgICAgICAgIDEzCj4g
PiA+ICAjZGVmaW5lIFJFU0VUX0FQTVVfU0RIMSAgICAgICAgICAxNAo+ID4gPiAgI2RlZmluZSBS
RVNFVF9BUE1VX1NESDIgICAgICAgICAgMTUKPiA+ID4gLSNkZWZpbmUgUkVTRVRfQVBNVV9VU0Iy
ICAgICAgICAgIDE2Cj4gPiA+IC0jZGVmaW5lIFJFU0VUX0FQTVVfVVNCM19QT1JUQSAgICAxNwo+
ID4gPiAtI2RlZmluZSBSRVNFVF9BUE1VX1VTQjNfUE9SVEIgICAgMTgKPiA+ID4gLSNkZWZpbmUg
UkVTRVRfQVBNVV9VU0IzX1BPUlRDICAgIDE5Cj4gPiA+IC0jZGVmaW5lIFJFU0VUX0FQTVVfVVNC
M19QT1JURCAgICAyMAo+ID4gCj4gPiBUaGlzIGlzIGJhY2t3YXJkcyBpbmNvbXBhdGlibGUuCj4g
PiBBcmUgdGhlcmUgYW55IGRldmljZSB0cmVlcyB1c2luZyB0aGUgQVBNVSByZXNldHMgeWV0Pwo+
ID4gSWYgbm90LCBJIHdvbmRlciBpZiB3ZSBzaG91bGQganVzdCByZW51bWJlciBhbGwgQVBNVSBy
ZXNldHMgaW50byBhCj4gPiBjb250aWd1b3VzIHJhbmdlIGFuZCB0cnkgdG8gZ2V0IGl0IGludG8g
djcuMCBhcyBhIGZpeC4KPiA+IAo+IE5vLCB0aGVyZSBpcyBjdXJyZW50bHkgbm8gY29uc3VtZXJz
LAoKR29vZCwgdGhhdCB3aWxsIG1ha2UgdGhpbmdzIGVhc2llci4KCj4gc28gSSBjb3VsZCByZXdv
cmsgdGhlbSBpbnRvIGEgY29udGlndW91cyB2ZXJzaW9uLCB0aGFua3MgZm9yIHRoZSBzdWdnZXN0
aW9uCj4gCj4gPiBBbHNvLCB0aGlzIGJyZWFrcyBiaXNlY3RhYmlsaXR5Lgo+ID4gcmVzZXQtc3Bh
Y2VtaXQtazMuYyB3aWxsIGZhaWwgdG8gY29tcGlsZSBiZXR3ZWVuIHBhdGNoZXMgMSBhbmQgMi4K
PiA+IAo+IEkndmUgdHJpZWQgYSBmaXJzdCB2ZXJzaW9uIHRvIHNxdWFzaCB0aGUgdHdvIHBhdGNo
ZXMsIGJ1dCBnb3QgYSBjaGVja3BhdGNoLnBsIGNvbXBsYWl0Cj4gZm9yIGJpbmRpbmcgc2hvdWxk
IGZvbGxvdyBpbnRvIGEgc2VwYXJhdGUgcGF0Y2guCj4gCj4gSSBjYW4gY29tYmluZSB0aGVzZSB0
d28gcGF0Y2hlcyBpbnRvIG9uZSwgaXMgdGhpcyBPayBmb3IgeW91PwoKSSdtIGluIGZhdm9yIG9m
IGZpeGluZyBib3RoIHRoZSBBUE1VIGRlZmluZXMgYW5kIHRoZSBvbmx5IGV4aXN0aW5nCnVzZXIs
IHRoZSByZXNldCBkcml2ZXIsIGluIGEgc2luZ2xlIHBhdGNoLiBFeHBsYWluIGl0IHdlbGwswqBh
ZGQgRml4ZXM6CjIxNmUwYTVlOThlNSBhbmQgOTM4Y2UzYjE2NTgyIHRhZ3MsIGFuZCB0aGVuIEkg
Y2FuIGFwcGx5IGl0IG9uIHRoZQpyZXNldC9maXhlcyBicmFuY2ggaW4gdGltZSBmb3IgdjcuMC4K
CnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
