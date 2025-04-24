Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFCC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG6mgeWIWgV/uMkX0JsvOU3Pe8CII7hsKFPZZkESGvc=; b=QNuyEH2JH4qzhJ
	Wf6cMR8j3UeB6aKYB62MEGfbq5zzp8UJNSpYE8mKW0iP3iXZK1dsGvkkE1iyHytUb5ARRHI9w8amp
	HT7Jb/gjEHv240/AAERPgtOTIZZ4InknKqY99blWEUvL67vNfJfV8cykSI1ZOL0xAl54ldqMLcvyt
	cm0pVLkdT+l0KCrDohxJD3Q9g5nrs2xUOb3yew8jhyHWDFxBAPYCqYJjuBqSIbIwBSGjp7CLov3Hd
	xmg0hzLYYuJfkaEc3ApP3yz1YlH3tie/V5SWTAUncH3pRseN/rx+T7QG6IAaNhWkYrYqHEQn8DT+j
	gLXwNPEorBebcmbZDzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7utN-0000000DsrA-1WYW;
	Thu, 24 Apr 2025 11:37:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t2Z-0000000DXLX-178g
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=; b=OFkAw+o3gU4CTq3SSsrJjGTvjw
	v1waYoDUa1Rx+ijPziGTnbClllh7MA//xYCZLvMgQniKf2ZhPE4UlK4X6ucWEa70dT1QkyCtB8cop
	RdIGEfHm7bho02TnyRChJ7o53CRoUxlDrF91Zx0W+Lo8oESMvvKMVRY9jfIT9+SBw/0/gyo4WzQWa
	MH3/yr/5PSiz1uZrs6jU0IA3upX+KqXK3hK4AHdcTlz98okAHWtBn6l4J7gTs5xCNvnZfGKTRHHkv
	fWEF2gg22y7GbbWshq5M6GYIgNQW2s4XNdnDoXiSU67e+Rkc9CEwiwDJvm/NEnq/HQqmY6pDiWvH8
	2uUMYtWA==;
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t2V-0000000Bgnd-2cJW
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 09:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745487507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eWHXAzgrAP0yaKWz/ozs7h3vD4xkghAbBCljuFxWvbfTHCg8bB7O20Wj5Cey7zbwD83bKeATVCQmrgXoymM6Lya2UtsQN7MVx4CMPE2jlMOq7qxFfYhlsV1o2l6RCHhvsRBHLBCJ0YL+0XggR/jwNUTdVAwcSBp5SQRIQEIOGPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745487507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=; 
	b=DHSi6PJJSSdsBNx8Q6gcPlWkCrtC3eJ270kQ1qKiOVODN/qZtPTjqsNtaLHCu1bespcQIaemquGNuv6PKmes98e9jPAOOG1Sgb/ASy2rlDQS0Ubm47nHswRiTtaTHOkv6sUDhR4nh7WSmK9T9NmvTnPXoGtJ8y2MVKmPH9s7E7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745487507;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=;
	b=qfXoCEr7FQ9msjMMk+80tOQFcRYAJOkVcDSabeIUZoB/V4FpBb26CTdSda4LE0yK
	fo9HylKuV1bD8f3fcPUrREMovKRdpXoD0SZQvglA489xMwzcX53UPrSxIX0CFg6WP0R
	InG3nz1h5fZPfi7kHS7WEdueULDPnUm1RVrr3hVHIRicF9XBKTIBdgEAEexu1nBDC27
	aJ0P7cJfdzmwXm1ETWv9rcb/Vsd9WbLzUiT55gu9M7m7ZUzDuF9bZCPvg5oITGjvRnx
	k2U+NrEc1kWJKSqgl+ClkD2WXgVaPMyEPvMhSNqNQaQxHZs07iRaqH3R3Wo9/4iOHTA
	G6TModPKfA==
Received: by mx.zohomail.com with SMTPS id 1745487504141154.190763735755;
	Thu, 24 Apr 2025 02:38:24 -0700 (PDT)
Message-ID: <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 24 Apr 2025 17:38:16 +0800
In-Reply-To: <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103840_079750_1AC61EE9 
X-CRM114-Status: GOOD (  18.59  )
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

5ZyoIDIwMjUtMDQtMjTmmJ/mnJ/lm5vnmoQgMTA6NTEgKzAyMDDvvIxMaW51cyBXYWxsZWlq5YaZ
6YGT77yaCj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgODoyMOKAr0FNIEljZW5vd3kgWmhlbmcg
PHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiAKPiA+IFRoZSBKSDcxMTAgU29DIGNvdWxkIHN1cHBv
cnQgaW50ZXJuYWwgR1BJIHNpZ25hbHMgdG8gYmUgcm91dGVkIHRvCj4gPiBub3QKPiA+IGV4dGVy
bmFsIEdQSU8gYnV0IGludGVybmFsIGxvdy9oaWdoIGxldmVscy4KPiA+IAo+ID4gQWRkIHR3byBt
YWNyb3MsIFBBRF9JTlRFUk5BTF9MT1cgYW5kIFBBRF9JTlRFUk5BTF9ISUdILCBhcyB0d28KPiA+
IHZpcnR1YWwKPiA+ICJwYWRzIiB0byByZXByZXNlbnQgaW50ZXJuYWwgR1BJIHNvdXJjZXMgd2l0
aCBmaXhlZCBsb3cvaGlnaAo+ID4gbGV2ZWxzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vu
b3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiAKPiBBcyBwZXIgbXkgb3RoZXIgcmVwbHkgaW4g
dGhlIHByZXZpb3VzIHBvc3QsIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUKPiBoYW5kbGVkIGludGVy
bmFsIGluIHRoZSBrZXJuZWwgaW5zdGVhZCB1c2luZyBhIHRpZ2h0ZXIgaW50ZWdyYXRpb24KPiBi
ZXR3ZWVuCj4gdGhlIEdQSU8gYW5kIHBpbiBjb250cm9sIHBhcnRzIG9mIHRoZSBkcml2ZXIgYW5k
IHV0aWxpemluZyB0aGUKPiBncGlvLXNwZWNpZmljIHN0cnVjdCBwaW5tdXhfb3BzIGNhbGxiYWNr
cy4KCldlbGwgSSBjYW5ub3QgdW5kZXJzdGFuZCB0aGlzIC0tIHRoZXNlIHNpZ25hbHMgYXJlIG5v
dCBHUElPcywgdG90YWxseQpub3QgcmVsYXRlZCB0byB0aGUgR1BJTyBzdWJzeXN0ZW0gKGJlY2F1
c2UgdGhleSdyZSBvbmx5IHBpbm11eCwgbm90CnJlbGF0ZWQgdG8gR1BJT3MpLiBUaGlzIGlzIGRl
c2NyaWJlZCBpbiBteSBwcmV2aW91cyBtYWlsLgoKVGhlIHBpbiBtdXggb2YgSkg3MTEwIHN0cmlj
dGx5IHJvdXRlIGl0cyBpbnB1dHMgdG8gaXRzIG91dHB1dHMuIEZvcgpzaWduYWxzIGZyb20gb3Ro
ZXIgU29DIGJsb2NrcyAodG8gZXh0ZXJuYWwgcGlucyksIHRoZSByZWdpc3RlcnMgZGVmaW5lCmhv
dyBPVVQvT0VuIG9mIElPIGJ1ZmZlcnMgKmFyZSBkcml2ZW4gYnkqIHRoZSBzaWduYWxzOyBob3dl
dmVyIGZvcgpzaWduYWxzIHRvIG90aGVyIFNvQyBibG9ja3MgKGZyb20gZXh0ZXJuYWwgcGlucyks
IHRoZSByZWdpc3RlcnMgZGVmaW5lCmhvdyBJTiBvZiBJTyBidWZmZXJzICpkcml2ZSogdGhlIHNp
Z25hbHMuIChUaGlzIGZvbGxvd3MgdGhlIGdlbmVyaWMKc2lnbmFsLWRyaXZpbmcgcnVsZSB0aGF0
IG9uZSBzaWduYWwgY2FuIGRyaXZlIG11bHRpcGxlIHNpZ25hbHMgYnV0CmNhbm5vdCBiZSBtdWx0
aS1kcml2ZW4pLgoKSW4gYWRkaXRpb24gdGhlIHNpdHVhdGlvbiBJIGFtIHRyeWluZyB0byBoYW5k
bGUgaGVyZSBpcyBhbiBhZGRpdGlvbiB0bwp0aGUgbGF0dGVyIHBhcnQgb2YgdGhlIHByZXZpb3Vz
IHBhcmFncmFwaCAtLSBpbiBhZGRpdGlvbiB0byA2NCBpbnB1dHMKY29ycmVzcG9uZGluZyB0byA2
NCBHUElPcywgdHdvIGV4dHJhIGlucHV0cywgb25lIGFsd2F5cyAwIGFuZCBhbm90aGVyCmFsd2F5
cyAxIGFyZSBhdmFpbGFibGUgdG8gdGhlIHBpbiBjb250cm9sbGVyIGZvciBkcml2aW5nIG90aGVy
IFNvQwpibG9ja3MnIGlucHV0IChhcyBvdXRwdXQgb2YgcGluIGNvbnRyb2xsZXIpLgoKSW4gZmFj
dCB0aGlzIGlzIHdoeSB0aGVyZSBpcyBgICsgMmAgd2hlbiBjYWxjdWxhdGluZyBpdmFsIGluCmpo
NzExMF9zZXRfZ3Bpb211eCgpIC0tIHRoZSBmaXJzdCB0d28gcG9zc2libGUgdmFsdWVzIGFyZSBm
b3IgYWx3YXlzIDAKYW5kIGFsd2F5cyAxLCAzIHJlcHJlc2VudHMgdGhlIElOIG9mIEdQSU8wLCBl
dGMuCgo+IAo+IFRoaXMgc29sdXRpb24gbG9va3MgbGlrZSBzb2Z0d2FyZSBjb25maWd1cmF0aW9u
IGRpc2d1aXNlZCBhcyBoYXJkd2FyZQo+IGNvbmZpZ3VyYXRpb24uCgpXZWxsIHRoaXMgc29sdXRp
b24gaGFuZGxlcyB0aGVzZSBpbnRlcm5hbCB3aXJlcyBpbiB0aGUgc2FtZSB3YXkgYXMKc2lnbmFs
cyBmcm9tIGV4dGVybmFsIEdQSU9zLCBleGNlcHRpbmcgc3BlY2lmeWluZyBzcGVjaWFsIEdQSU8g
bnVtYmVycy4KSWYgeW91IGFyZSBhZ2FpbnN0IHRoZSBwcmluY2lwbGUsIG1heWJlIHRoZSBjdXJy
ZW50IGFscmVhZHktaW5jbHVkZWQKR1BJT01VWCBzeXN0ZW0gb2YgdGhlIFN0YXJGaXZlIHBpbmN0
cmwgaXMgdG8gYmUgYmxhbWVkIGluc3RlYWQgb2YgbXkKc21hbGwgZXh0ZW5zaW9uIHRvIGl0LgoK
SSBtdXN0IGFkbWl0IHRoYXQgdGhlIGN1cnJlbnQgR1BJT01VWCBzeXN0ZW0gaXNuJ3QgYSBmYWl0
aGZ1bApyZXByZXNlbnRhdGlvbiBvZiB0aGUgaGFyZHdhcmUgYmVjYXVzZSBpdCdzIGEgcGFkLWNl
bnRyaWMgc2V0dXAgaW5zdGVhZApvZiBhIHJlZ2lzdGVyLWZpZWxkLWNlbnRyaWMgb25lLCB3aGlj
aCBpc24ndCB2ZXJ5IG5hdHVyYWwgZm9yIGlucHV0CnNpZ25hbHMuIEhvd2V2ZXIgY29uZmlndXJh
dGluZyB0aGUgbXV4IGluIHN1Y2ggYSB3YXkgaXMgYWdhaW5zdCBwZW9wbGUKcmVhZGluZywgYW5k
IHdlJ3JlIG5vdCBhYmxlIHRvIGJyZWFrIHRoZSBzeXN0ZW0gYmVjYXVzZSBpdCdzIGFscmVhZHkK
dGhlcmUuCgpXZWxsIGluIHRoZSBzaXR1YXRpb24gdGhhdCBvbmUgR1BJTyB1c2VkIGFzIGlucHV0
IGRyaXZlcyBtdWx0aXBsZQppbnRlcm5hbCBzaWduYWxzIHRoZSBwaW5tdXggbG9va3MgYSBsaXR0
bGUgY29uZnVzaW5nIHRvbywgZS5nLiB0aGUgSTJTCmNsb2NrIHNpdHVhdGlvbiBJIG1lbnRpb25l
ZCBpbiBteSByZXBseSBpbiB0aGUgcHJldmlvdXMgcmV2aXNpb24gb2YgdGhlCnBhdGNoc2V0LgoK
PiAKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
