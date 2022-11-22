Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D102C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnnZ5PqdTy3C14z/rGCgmsCKF/jjz5iI2stA4WFSGhM=; b=Zb9wF9LGUKtMIB
	wkcZM3pmOyrcwuXJ6YJoFxDttpb+KZwIXG+f+4aigcMDvh3sfH/oDzUOcljJV/w3BNRhWjFqVHReR
	iFZScJ0+BXNCrhnd1yg7ufXMAAobyGDZpzOphkBSYFTg9EzOWzwGMrsViJroSVjmDzssb7y+ZzGW2
	H1l5MKwU40iq++aY8vke4cf8sy/pQstU0EMERsxxvSCeFPvVNyb5I+NORRDJs3LAoLGz7YL6VjDAh
	PuMdNJHNWz9Gr7JunZV8Y8eeUOXgz9Pc2Sh9yT6ttYTZPbACiKIs2dw0/MY+kPm087zyCXDrSI26A
	pycxxTv6FmwEU8YY95YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNYJ-005ULc-NY; Tue, 22 Nov 2022 07:18:43 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNYH-005UFH-2j
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669101514; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JJyCwxsJ/i+ixev69VwzYTiV2wuJNJgtT9F6BL9qltFU7wJVa5wR7HW4ZVlJli/gNzaBboU8/Ru7AGRwZKtgKOO0aOTqYxAiF9oFMyEcX/vEFBNzSZyO3NdXyamWzL2Px7hJAPT6Mk+pKb3r8vq5+Gq6dsuUWWgszGu8rCxIf1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669101514; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=81+xlIqsl8cG7bxBR3sGfI5lOeqiGbfvoGg16RAnG2s=; 
	b=eguW4huBwt6/N2Z1PQbnRf3Yo91Bt7nQcBQZSRrrFb418mZsL7/yxDCKc1vMJPLQ8Vfe0+3Dy8mAHrbjX+82HY8G83th0xlBJ+TxrkW34AZn9f6ikCJn38m2uq+E/pEVnCFPW3X6SRq1xouUSdcIV7Ne/50OA/TbWf7/JbFKGz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669101514;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=81+xlIqsl8cG7bxBR3sGfI5lOeqiGbfvoGg16RAnG2s=;
	b=TKklBAFP9bWoQfIdfM5vWo5gJ/CCV03rQBLVxX9Zoz0Kp3tcs5laeWU5lT709bgu
	bgDlofypXi71ALPVQMbFDSKSwlYa0hrzARem+Dhx9ZIRceQcMxMjcU3CTkNLhDRrEFf
	mNZVrkQ8aiK/1Ozcaoh+8mNLJVKcsAgbTamcx9V8=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1669101513524595.8333664570052; Mon, 21 Nov 2022 23:18:33 -0800 (PST)
Message-ID: <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible
 for OpenC906
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Samuel
 Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 22 Nov 2022 15:18:28 +0800
In-Reply-To: <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
References: <20221121041757.418645-1-uwu@icenowy.me>
	 <20221121041757.418645-3-uwu@icenowy.me>
	 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_231841_221626_9E634283 
X-CRM114-Status: GOOD (  16.23  )
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

5ZyoIDIwMjItMTEtMjHmmJ/mnJ/kuIDnmoQgMTE6MDYgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjEvMTEvMjAyMiAwNToxNywgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IFQtSGVhZCBPcGVuQzkwNiBpcyBhIG9wZW4tc291cmNlLWxpY2Vuc2VkIGZpeGVkLWNvbmZp
Z3VyYXRpb24gb2YKPiA+IEM5MDYsCj4gPiB3aGljaCBpcyBub3cgcHVibGljIGFuZCBhYmxlIHRv
IGJlIGludGVncmF0ZWQuCj4gPiAKPiA+IEFkZCBhIGNvbXBhdGlibGUgZm9yIHRoZSBDTElOVCBz
aGlwcGVkIGFzIHBhcnQgb2YgT3BlbkM5MDYsIHdoaWNoCj4gPiBzaG91bGQKPiA+IGp1c3QgYmUg
b3JkaW5hcnkgQzl4eCBDTElOVC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8dXd1QGljZW5vd3kubWU+Cj4gPiAtLS0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sIHwgMSArCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0Cj4gPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+ID4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+
IGluZGV4IGFhZGE2OTU3MjE2Yy4uODY3MDNlOTk1ZTMxIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50
LnlhbWwKPiA+IEBAIC0zNSw2ICszNSw3IEBAIHByb3BlcnRpZXM6Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBzaWZpdmUsY2xpbnQwCj4gPiDCoMKgwqDCoMKgwqAgLSBpdGVtczoK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIHRoZWFkLG9wZW5jOTA2LWNsaW50Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1jbGludAo+IAo+IEFkZCBlbnRyaWVzIHNvcnRl
ZCBhbHBoYWJldGljYWxseS4gVGhpcyBzaG91bGQgYmUgc3F1YXNoZWQgd2l0aAo+IHByZXZpb3Vz
Cj4gcGF0Y2guCgpJIG1ha2UgaXQgYSBzZXBlcmF0ZWQgcGF0Y2ggYmVjYXVzZSBJIHRoaW5rIGl0
J3MgYSBxdWVzdGlvbmFibGUKYXBwcm9hY2guCgpJZiB5b3UgdGhpbmsgaXQncyBva2F5LCBJIHdp
bGwganVzdCBzcXVhc2ggaXQgYW5kIHB1dCBpdCBhcyB0aGUgc2Vjb25kCnBhdGNoIGluIHRoZSBu
ZXh0IGl0ZXJhdGlvbiwgd2l0aCBhZGRpbmcgb3BlbmM5MDYtcGxpYyBhcyB0aGUgZmlyc3QKb25l
LgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
