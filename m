Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC0C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SCzSOu4wFi2w/z14PnPM9n/6SYS8O9P3Z+wGitIZl0=; b=RexOI87H/avwDg
	24eQrlkI0wlyY6DJ9Nk57BSELXDrZsLTEkSDmVhz2wN3aVBKpcRDb4vrTR1IEdm0fWJFooA2g6DW9
	3uLtAdfbcHTlnKifQ3yKs8SZMl43o+O+I3egP6vzX/Yz+D4D9WnX0bHS00L7vwzuUJKp/mzrIzTLO
	Z1mkcGlrV1R1r5NOSQiS1JuxRJGhVsh8otfHrYPAKkuIR9tDlWgWQ1zNAS8axBynfGJoviGyaI9wc
	X6ksu6cBdU351m8xxdq7SOyaBbpfYzBg5W3X4oZYJvjgMpTQkpi6wqoHarrKEUcWNH0pFuz2qVv5q
	67III6ASuI8QBFNZB6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozC2V-00AGoH-7K; Sun, 27 Nov 2022 07:25:23 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozC2R-00AGlh-Gz
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 07:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669533911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ggkzAtIy/l7f7YyyN6D1bmSEmSuAKIP4IsOJAVoA7ofakj2KB1Rpwuver6SPS7+mlQKlysKAdlfyBruF5KfMDQHpomomIMF84JG903es5X009QcNK0HKg7+aUvNklVxCmkBRnBIQq/xfyGwmpNOmfh9y8JSCCHmIchVMtLtGJck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669533911; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=0tSszAfeU3Hw+SM3zet0uKTU2t0DxmRUwULjrITFJWs=; 
	b=ccgAGlirkStYdnvC6zgpmD21QG1w3R568sbHzY4hqYJNVCl/1ZyAvJF1EUSZBEfKFIfCUt4+BYFqQ4V5m7uLhU43B+e/jfTSo/xU5r1MJIRohH5XhdbvJA7kHRvFuzOzemq3BlDxv85iU49T22vIrVk+eORzB4V/vv1r5ivuwT4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669533911;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=0tSszAfeU3Hw+SM3zet0uKTU2t0DxmRUwULjrITFJWs=;
	b=KXV25JHEwreVFY60L/OefRyezdQqH7oK2TLu79SepeUo7fiBgsgnWeWJg/raHOFx
	TdqT0pkzUHGsxHWLdwr8ed752oDRTp12wHQq2wcWydlfndM53EZ+BicCA3ECTYIx7qw
	Ll37ZhEvPQL2uEroCGgA/sgmZY7tDebTBqk0ckiY=
Received: from edelgard.fodlan.icenowy.me (112.94.100.108 [112.94.100.108]) by mx.zohomail.com
	with SMTPS id 1669533910659843.6717300057095; Sat, 26 Nov 2022 23:25:10 -0800 (PST)
Message-ID: <3276634843dcd7288ea5329d7803466bf8992d66.camel@icenowy.me>
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add comaptibles
 for T-Head's C9xx
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>,  Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 27 Nov 2022 15:25:04 +0800
In-Reply-To: <20221121041757.418645-2-uwu@icenowy.me>
References: <20221121041757.418645-1-uwu@icenowy.me>
	 <20221121041757.418645-2-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_232519_657772_3278C5FE 
X-CRM114-Status: GOOD (  13.00  )
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

5ZyoIDIwMjItMTEtMjHmmJ/mnJ/kuIDnmoQgMTI6MTcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVC1IZWFkIEM5MDYvQzkxMCBDTElOVCBpcyBub3QgY29tcGxpYW50IHRvIFNpRml2
ZSBvbmVzIChhbmQgZXZlbiBub3QKPiBjb21wbGlhbnQgdG8gdGhlIG5ld2NvbWluZyBBQ0xJTlQg
c3BlYykgYmVjYXVzZSBvZiBsYWNrIG9mIG10aW1lCj4gcmVnaXN0ZXIuCj4gCj4gQWRkIGEgY29t
cGF0aWJsZSBzdHJpbmcgZm9ybWF0dGVkIGxpa2UgdGhlIEM5eHgtc3BlY2lmaWMgUExJQwo+IGNv
bXBhdGlibGUsIGFuZCBkbyBub3QgYWxsb3cgYSBTaUZpdmUgb25lIGFzIGZhbGxiYWNrIGJlY2F1
c2UgdGhleSdyZQo+IG5vdCByZWFsbHkgY29tcGxpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgoKQ291bGQgdGhpcyBwYXRjaCBnZXQgYXBwbGll
ZCBpbmRpdmlkdWFsbHk/CgpJIHdhbnQgdG8gZHJvcCB0aGUgcHJhY3RpY2Ugb2YgdGhlIGxhdHRl
ciB0d28gcGF0Y2hlcyBhbmQgc2VuZCBuZXcKUkZDcywgYW5kIHRoaXMgcGF0Y2ggaXMgYSBkZXBl
bmRlbmN5IG9mIHNvbWUgT3BlblNCSSBwYXRjaC4KCj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCA4Cj4gKysrKysrKysK
PiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0Cj4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwK
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQu
eWFtbAo+IGluZGV4IGJiYWQyNDE2NTgzNy4uYWFkYTY5NTcyMTZjIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xp
bnQueWFtbAo+IEBAIC0yMCw2ICsyMCwxMCBAQCBkZXNjcmlwdGlvbjoKPiDCoMKgIHByb3BlcnR5
IG9mICIvY3B1cyIgRFQgbm9kZS4gVGhlICJ0aW1lYmFzZS1mcmVxdWVuY3kiIERUIHByb3BlcnR5
Cj4gaXMKPiDCoMKgIGRlc2NyaWJlZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvY3B1cy55YW1sCj4gwqAKPiArwqAgVC1IZWFkIEM5MDYvQzkxMCBDUFUgY29yZXMg
aW5jbHVkZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiBDTElOVCB0b28sCj4gaG93ZXZlcgo+ICvCoCB0
aGVpciBpbXBsZW1lbnRhdGlvbiBsYWNrcyBhIG1lbW9yeS1tYXBwZWQgTVRJTUUgcmVnaXN0ZXIs
IHRodXMKPiBub3QKPiArwqAgY29tcGF0aWJsZSB3aXRoIFNpRml2ZSBvbmVzLgo+ICsKPiDCoHBy
b3BlcnRpZXM6Cj4gwqDCoCBjb21wYXRpYmxlOgo+IMKgwqDCoMKgIG9uZU9mOgo+IEBAIC0yOSw2
ICszMywxMCBAQCBwcm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBz
dGFyZml2ZSxqaDcxMDAtY2xpbnQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY2Fu
YWFuLGsyMTAtY2xpbnQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzaWZpdmUsY2xp
bnQwCj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLWNsaW50
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVhZCxjOTAwLWNsaW50Cj4gwqDCoMKg
wqDCoMKgIC0gaXRlbXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc2lmaXZlLGNs
aW50MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHJpc2N2LGNsaW50MAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
