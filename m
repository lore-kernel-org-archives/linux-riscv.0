Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C305C982DA
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 03:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBzlTRu2wmgkY2I+B6ka6QA2x48sELoNxX0HoTtp7nY=; b=mBFoUTm5pNj0Qr
	HhbxmqzzKkW/w8GUSbg/Fe9/Boz35mVDiEThzWeuJIguUczBHq7sL0dfQko39zYa+L6hs1GeRG7/k
	8XK7YdrpKq1lxK81CYShLKisro4zerxrprERqxdS17PB1istgAGIavWyAannce4YUGm5eFfCTY62M
	gdauDsk/dIFl738ogPKPHF5EHQpzLKks9T5awn6YxoxV8oVZ0kEnDMlYVzycD/uBs//b+SLkwmzaj
	UykGWaQWtNnqr3SlUxML7SMmFKwK5TE6LfB07GwbrodblqDfJOjoEThGriKn22qz0BwpB6oKgeKYb
	sEtEZ/31CGezJ2zcriWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UuN-00000000mev-1EhW;
	Mon, 21 Sep 2026 03:41:35 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UuL-00000000mea-1Bqv
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 03:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789962091; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eUpZbo6UGPiXN2S6WVP1wk0hx+PmToMYHyOYTTguBgJ4H9sVslZFlrxBnfQT4mM3Z5AZ7UOy3rZNvo17i3UdqfpsEgNaqu68X0/0JwomkhLkf2qjtxxXiGRxn37yIBJqRx2YqxUALC17XGIE2yqpJRIJ5jxeOc4Nu3E1+uny24o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789962091; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ct1Y8laxYTB/3w6Vg9zeWZ4IUgz1j3gsDtqDeWDoQhE=; 
	b=LlH1IOfz33DnRYAxx9I6GoXSqRBEmqI9o/RsJEmtsUKDnGaWqGJBG906d7dSp2Dj+BzNXlBX47SKvktceUb4Bzku5DCFlQn9RA02jMAwb8sNqFnlQdzNyNDPMBI4QM4pNsCCRKnx6aiBFxkdKiwrp0sPigjFXChVV/AedprbU9Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789962091;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ct1Y8laxYTB/3w6Vg9zeWZ4IUgz1j3gsDtqDeWDoQhE=;
	b=KKyxMWkr1Oqh8lrvqaWs7m1N6FzlBaoLhknnkzLltncc3AkkgB5WY2M96m6WIter
	mYQMF5NjtFKuGpzN60dP7oDOTxsApCfGkLIJqLFG1nRZk/hDxeqtXJS8ZiYTSCdTslQ
	m2rNeSh56U+5rJfMkxZpQnKZOzu83HvQDklD0/IPXjBGk/xm99NGA3HMl7CWXzC5B3R
	wbMoy4euTn/gbWJYViQdBwhypOZCc/k9a3XHxwL/gWYQUQCAwZNFDLOtFKGmGyb7yHY
	WpJKF0cvTBInpl0ITZfI6jSAncFGxZ+qI7g3Y+FaCzxwtFsWE0MUm995EQvAbc7AlWr
	545ZoCVD/w==
Received: by smtp.zohomail.com with SMTPS id 1789962090652102.41171456130746;
	Sun, 20 Sep 2026 20:41:30 -0700 (PDT)
Message-ID: <e96ddd73ca83f0d8b6f08ff63a14b5f0d1bcee57.camel@icenowy.me>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Date: Mon, 21 Sep 2026 11:41:25 +0800
In-Reply-To: <20260921033540-GKG297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
	 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
	 <56e5f32102c67575ded8af9e81a06dc9f1dcf0ee.camel@icenowy.me>
	 <20260921033540-GKG297024@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_204133_381997_630209E9 
X-CRM114-Status: GOOD (  20.08  )
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

5ZyoIDIwMjYtMDktMjHkuIDnmoQgMDM6MzUgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiBI
aSBJY2Vub3d5LAo+IAo+IE9uIDIwOjU2IFN1biAyMCBTZXDCoMKgwqDCoCAsIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gPiDlnKggMjAyNi0wOS0xOOS6lOeahCAwMjo0MCArMDAwMO+8jFlpeHVuIExh
buWGmemBk++8mgo+ID4gPiDCoCBTcGFjZW1pVCdzIFBNVSAoUG93ZXIgTWFuYWdlbWVudCBVbml0
KSBjb25zaXN0IG9mIHNldmVyYWwgcG93ZXIKPiA+ID4gZG9tYWlucwo+ID4gPiB3aGljaCBjYW4g
YmUgbWFuYWdlZCBpbmRlcGVuZGVudGx5LCBkZXBlbmRpbmcgb24gZGlmZmVyZW50Cj4gPiA+IGFw
cGxpY2F0aW9uCj4gPiA+IHNjZW5hcmlvLCBlYWNoIGRvbWFpbiBjYW4gYmUgcG93ZXJlZCBvbi9v
ZmYgZm9yIHNhdmluZyBwb3dlci4KPiA+ID4gCj4gPiA+IMKgIFRoZSBkcml2ZXIgaXMgaW1wbGVt
ZW50ZWQgYmFzZWQgb24gTGludXggR2VuZXJpYyBQTSBEb21haW4KPiA+ID4gZnJhbWV3b3JrLgo+
ID4gPiBGcm9tIGEgaGFyZHdhcmUgcGVyc3BlY3RpdmUsIGVpdGhlciBvZiB0d28gZGlzdGluY3Qg
cG93ZXItb24KPiA+ID4gc2VxdWVuY2VzCj4gPiA+IGFyZSBzdXBwb3J0ZWQsIGluIHNvZnR3YXJl
IG1vZGUgKFNXIG1vZGUpLCB0aGUgZHJpdmVyIGlzCj4gPiA+IHJlc3BvbnNpYmxlCj4gPiA+IGZv
cgo+ID4gPiBjb250cm9sbGluZyB0aGUgc3RhdGVzIG9mIGJpdHMgc3VjaCBhcyBzbGVlcDEsIHNs
ZWVwMiwgaXNvbGF0aW9uCj4gPiA+IGFuZAo+ID4gPiBwd3Jfc3RhdGUsIHdoaWxlIGluIGhhcmR3
YXJlIG1vZGUgKEhXIG1vZGUpLCB0aGUgUE1VIGhhcmR3YXJlCj4gPiA+IHdpbGwKPiA+ID4gY29t
cGxldGUKPiA+ID4gdGhlIHNlcXVlbmNlIGF1dG9tYXRpY2FsbHkgd2l0aG91dCByZXF1aXJpbmcg
c29mdHdhcmUKPiA+ID4gaW50ZXJ2ZW50aW9uLgo+ID4gCj4gPiBUaGlzIGRyaXZlciBpcyB0ZXN0
ZWQgdG8gYmUgYWJsZSB0byBwb3dlciB1cCB0aGUgR1BVIG9uIFNwYWNlbWlUCj4gPiBLMywKPiA+
IGhvd2V2ZXIgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGFwcGVhcnMgaW4gdGhlIGtlcm5lbCBsb2c6
Cj4gPiAKPiA+IGBgYAo+ID4gZ2VucGRfcHJvdmlkZXIgYXVkaW86IEZhaWwgdG8gcG93ZXItb2Zm
IGRvbWFpbjogMgo+ID4gYGBgCj4gPiAKPiBUaGlzIGlzIGtpbmQgb2YgYW4gZXhwZWN0ZWQgaXNz
dWUsIGR1ZSB0byBoYXJkd2FyZSBkZXNpZ24sIHRoZSBhdWRpbwo+IHBvd2VyIHN3aXRjaCBpcyBj
b3VwbGVkIHdpdGggcmNwdSBjb3JlLCB3aGljaCBtZWFucyBwb3dlciBvZmYgaXQgd2lsbAo+IGFs
c28gc2h1dCBkb3duIHRoZSByY3B1LCBzbyB0aGUgcG93ZXIgc3dpdGNoIGN1cnJlbnRseSBpcyBj
b25maWd1cmVkCj4gYXMgYWx3YXlzIG9uIGZyb20gc29mdHdhcmUgcGVyc3BlY3RpdmUsIGl0J3Mg
dW5hYmxlIHRvIHBvd2VyLW9mZiBldmVuCj4gaW4gTGludXggb3IgcmNwdSBvbmNlIHN5c3RlbSB1
cC4KPiAKPiBJIHdpbGwgZHJvcCBhdWRpbyBwb3dlciBkb21haW4gY29udHJvbCBpbiBuZXh0IHZl
cnNpb24KPiAKPiA+IChCVFcgSSBidWlsdCBpdCBhcyBhIG1vZHVsZSB0byBwcmV2ZW50IHdob2xl
IGtlcm5lbCBiZWluZyByZWJ1aWx0KQo+ID4gCj4gdGhhdCdzIGZpbmUKCkluIHRoaXMgY2FzZSwg
ZG8geW91IGNvbnNpZGVyIHRvIG1ha2UgdGhlIEtjb25maWcgb3B0aW9uIGluIHlvdXIgcGF0Y2gK
dHJpc3RhdGUgaW5zdGVhZCBvZiBib29sPwoKVGhhbmtzLApJY2Vub3d5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
