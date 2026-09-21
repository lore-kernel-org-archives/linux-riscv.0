Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC95C982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 03:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EMrOP2AUwpxON1s+HZCBXZZ4g7deh/q9xhtgSKjngY=; b=wPeYIvgN64kvjR
	w5g7EAvFVzet7oLJ0MicHpsbRZtX3OZK5AVgvqxLvRKDEBrAM9S3bva8pLnGriBRG2hDlR2QhBHkU
	DQ/CMrDdqSDgkRLmvwRSn/kBd+SXn+bj2mSon3J9MNyb3eVdd78cNE2HYBWDyZFvLQVGDlh7Hv3ci
	AUeQ7iejrEEENZ8INEOny70DzUT/ExeMwLIWYmpBdDTN2woV9Dsjsv1vFl64MR13PGDLbHDKOu0Gy
	jluZrl8OYnCZe0hPyERSFIs/Swlw6Jdyf6Qcpx1i3Qfopq3ycF4ZH9DvY1jvYcme2iPleU8OAMkdf
	045j0rSl38E7XdGFu1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Usq-00000000mXT-0QRn;
	Mon, 21 Sep 2026 03:40:00 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Usn-00000000mX6-3Pk7
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 03:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789961995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X5pwW2IjnPHpzmr5K7OAGIATf4tr1RmrHZShCHmkRnFB80eb0og99S3ptID2GyBSbzyK50lRChsuR19Or95NULFeQDe9NQCur4D69JIHRsBhvk2b6Glao7gcFhr5uKFS/KvyKbAGadw/NpVtvvwYgp035iHibnjJuh4p0CJAH9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789961995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4w6Ld7u1Q8BK4R3B8dFoO9XD4j47BYZ7ETJ2PULMJOo=; 
	b=jrPzwenixC18SQEbj/hawwd2Ab/GR2YJ4aN9WSpVlxJl6MQSEi1UIu935TXYXnnofGOQQxzq+AhuKZbm2O7rWZ6sYeH9VUrZ90j49X2NhFngYAIfOKslUIWQwc0Q8QzWTyWWoUUubdWr8RDX0dFrx2u/AGEc8EvsnP2TLeX4YLM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789961995;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=4w6Ld7u1Q8BK4R3B8dFoO9XD4j47BYZ7ETJ2PULMJOo=;
	b=HLTiSKnRBxDG+DPoUe3cXgKegVFcNOD0rXriszZDzV1/F8Q+FYh0Lq2R2pUHcb9Y
	9HRcudk/GGPCRYxoArQ6deKisimm35MVSCMzGl8zVIa8o1Up0Gj0sNp2eqBpj8Ezxni
	rxpwU46CgPRFJekJUgUrLvG8MJWm6gw1sNLPv51gORVjhjVfocygjLSwS5towg0HB3/
	9qC9vaRbzWwaAFps2Kk2dNQUhskGeiCFFG5yzdHrSE2mI+RtR6S2PZEmv/dO26UU3ao
	OATfGI2Xfc/CboFvOf3pwIRJ2yDLcnU6Vl7ukFXtXfPoldSOlngD64qK1vak5j+s/89
	MzIRisP3Jw==
Received: by smtp.zohomail.com with SMTPS id 1789961993543581.7356580542081;
	Sun, 20 Sep 2026 20:39:53 -0700 (PDT)
Message-ID: <8ac3815961bebc5065ecabbbaed3e9920d5cbba7.camel@icenowy.me>
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
Date: Mon, 21 Sep 2026 11:39:47 +0800
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
X-CRM114-CacheID: sfid-20260920_203957_930255_19F064EF 
X-CRM114-Status: GOOD (  20.09  )
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
cC4KClNob3VsZCB0aGUgR0VOUERfRkxBR19BTFdBWVNfT04gZmxhZyBiZSBhcHBsaWVkIG9udG8g
dGhpcyBwb3dlciBkb21haW4KaWYgaXQncyBub3QgbWVhbnQgdG8gYmUgc2h1dCBkb3duPwoKVGhh
bmtzLApJY2Vub3d5Cgo+IAo+IEkgd2lsbCBkcm9wIGF1ZGlvIHBvd2VyIGRvbWFpbiBjb250cm9s
IGluIG5leHQgdmVyc2lvbgo+IAo+ID4gKEJUVyBJIGJ1aWx0IGl0IGFzIGEgbW9kdWxlIHRvIHBy
ZXZlbnQgd2hvbGUga2VybmVsIGJlaW5nIHJlYnVpbHQpCj4gPiAKPiB0aGF0J3MgZmluZQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
