Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC547C77B7C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 03:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2+jFlfcujhoA5HOFOBt+nmXWPvNz1GctcLfhzekVqM=; b=KphG3mYV6ff7eL
	APQzvbNb6jIseLG6YMedjhHKZD5EPfjNVNSckYryqU62VCStWgavceVGA48unv/CQ98AL7nlA32L/
	8l9Vk5QJhOngdetfI6eOT+5uWSkyzLbg/ulis6h33+D4sG59lxatBr6/1zD2pEclBZ627Jn7O3WQ+
	YUihIZw7rGyvMFXxFlTW9Y0mOR9qcecHTaXWZXhtDBu8yrotBkW7OB3uDq9HOcehMnrwjPkKYNeRy
	gtagChAKJlAu0c5oICqBAufLc/8PcHOiKnXuJDG1c3bq9WP+hQBYB0FPtP3Yhv5+fDlMmyOogVVud
	pXkaUAs4gb3gzR45GW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvrL2-00H6KD-1d;
	Mon, 08 May 2023 03:15:00 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvrKz-00H6JQ-05
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 03:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1683515679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9Yk2ZpIGQ75skWpiIgtduLusGE0oPB3mXGTsifKZOd4htya3Lqri6vqKzS+RAv0h8tGa6qEoIzSUPoHrga+izsHhKMJAhvntlkmkHzigs8jpJwMJ8NioaVFqypgoLjUA6GSxNGvaR6aa7OE90VOs0bfyVuOYACp6DntwGfvxsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683515679; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qnDzkRSag6SxflxnrB+gJTuVsWsOkNdIPE1k2QWE8XE=; 
	b=RUnwG9k5DIpDNtpbg3Bo0K5nvSIveaan3d38/FCtTLP4mdnPLHeUOrJ7MLyOAiPSgdnJKxKfQkiHuadbVtXbg059Vy2H5ImNegQZwQkMxUx8QJCmuu1rKZFBgJzS5SkWqDAZ6md27ajQirnwbmN66nnfamsAcsLCj4yYoCCWliU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683515679;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qnDzkRSag6SxflxnrB+gJTuVsWsOkNdIPE1k2QWE8XE=;
	b=TzPxT1lMzDl+M0OheL8u2UY+r17jtv5k9D2Ui8pLXoO6w0j+soRqNs2YdOAYiXsE
	6qCNPWUjcfS/lE7tROLVaGJYcWNlWKc6yn5m5128QFJatuU/Ei+0jx7MDktcY8Rd9Ld
	lQTTX2V3CI6y7FFBdMs7qDn9qLnUQgOTXw/hzWuk=
Received: from edelgard.fodlan.icenowy.me (120.85.98.36 [120.85.98.36]) by mx.zohomail.com
	with SMTPS id 1683515678721325.31977442907953; Sun, 7 May 2023 20:14:38 -0700 (PDT)
Message-ID: <56489d3f1b23a90baf3ef024da09b4c8c02a2204.camel@icenowy.me>
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
From: Icenowy Zheng <uwu@icenowy.me>
To: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Date: Mon, 08 May 2023 11:14:32 +0800
In-Reply-To: <20230507182304.2934-2-jszhang@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
	 <20230507182304.2934-2-jszhang@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_201457_143460_6A6823DF 
X-CRM114-Status: GOOD (  11.17  )
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

5ZyoIDIwMjMtMDUtMDjmmJ/mnJ/kuIDnmoQgMDI6MjMgKzA4MDDvvIxKaXNoZW5nIFpoYW5n5YaZ
6YGT77yaCj4gVGhlIFQtSEVBRCdzIEM5MTAgUExJQyBzdGlsbCBuZWVkcyB0aGUgZGVsZWdhdGlv
biBiaXQgc2V0dGluZ3RvIGFsbG93Cj4gYWNjZXNzIGZyb20gUy1tb2RlLCBidXQgaXQgZG9lc24n
dCBuZWVkIHRoZSBlZGdlIHF1aXJrLgoKTm8sIHRoZSBQTElDIGNvbnRyb2xsZXIgc2VlbXMgdG8g
YmUgdGhlIHNhbWUgYmV0d2VlbiBDOTA2IGFuZCBDOTEwLAp3aGljaCBoYXMgbGV2ZWwvZWRnZSBz
ZWxlY3RhYmxlIHZpYSBleHRlcm5hbCBzaWduYWwuCgpTZWUgb3BlbmM5MDYgYW5kIG9wZW5jOTEw
IHJlcG9zaXRvcmllcywgZXNwZWNpYWxseSB0aGUgZG9jdW1lbnRzIHdpdGgKaXQ6IOeOhOmTgUM5
ezA2LDEwfembhuaIkOaJi+WGjC5wZGYgLgoKSW4gYWRkaXRpb24sIHN1Y2ggcHJvYmxlbSB3b24n
dCBhcmlzZSB3aGVuIHRoZSBzeXN0ZW0gdXNlcyBvbmx5IGxldmVsLQp0cmlnZ2VyZWQgaW50ZXJy
dXB0cy4KCj4gCj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwu
b3JnPgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxw
bGljLTEuMC4wLnlhbWzCoMKgwqDCoMKgIHwgNAo+ICsrKysKPiDCoGRyaXZlcnMvaXJxY2hpcC9p
cnEtc2lmaXZlLXBsaWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50
ZXJydXB0LQo+IGNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LQo+IDEuMC4wLnlhbWwKPiBpbmRleCBmNzU3MzZhMDYxYWYuLjY0YjQzYTNjMzc0OCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LQo+IGNv
bnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtCj4gY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAu
MC55YW1sCj4gQEAgLTYyLDYgKzYyLDEwIEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIHN0YXJmaXZlLGpoNzExMC1wbGljCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNhbmFhbixrMjEwLXBsaWMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNv
bnN0OiBzaWZpdmUscGxpYy0xLjAuMAo+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdGhlYWQs
bGlnaHQtcGxpYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogdGhlYWQsYzkxMC1wbGlj
Cj4gwqDCoMKgwqDCoMKgIC0gaXRlbXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLXBsaWMK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS0KPiBzaWZpdmUtcGxpYy5jCj4gaW5kZXggZTE0ODQ5MDViN2JkLi43MWFm
YTJhNTg0ZDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5j
Cj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTU2OSw2ICs1
NjksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwbGljX2luaXQoc3RydWN0IGRldmljZV9ub2RlCj4g
Km5vZGUsCj4gwqB9Cj4gwqAKPiDCoElSUUNISVBfREVDTEFSRShzaWZpdmVfcGxpYywgInNpZml2
ZSxwbGljLTEuMC4wIiwgcGxpY19pbml0KTsKPiArSVJRQ0hJUF9ERUNMQVJFKHRoZWFkX2M5MTBf
cGxpYywgInRoZWFkLGM5MTAtcGxpYyIsIHBsaWNfaW5pdCk7Cj4gwqBJUlFDSElQX0RFQ0xBUkUo
cmlzY3ZfcGxpYzAsICJyaXNjdixwbGljMCIsIHBsaWNfaW5pdCk7IC8qIGZvcgo+IGxlZ2FjeSBz
eXN0ZW1zICovCj4gwqAKPiDCoHN0YXRpYyBpbnQgX19pbml0IHBsaWNfZWRnZV9pbml0KHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
