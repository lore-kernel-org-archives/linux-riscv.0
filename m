Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB39DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zfCrMIkhG4oxEYGkJiop5dDxQLrwaHMEA9Bmwa359Y=; b=TK9JzFuhbfCt0o
	eaB5QFNNA8i4WDrbwe4ZxUNheCMiSFg4xo+EBAEIJmqR3JsuLgYp+bmJnLZJGRQMfGFrijFUrrD5L
	CKXDcPcqfp4RVnqzDrjeowRyp87wYfyEKynGn3VbModVzBseS8KRx/IT+DeVtEMh7TqcvYmVvnsy2
	E+mXrqUomnX9aoXwY5Mse0kSjZqkd2skIEWwdui4ydY79is4lnhWT7dzPI2QvY2/og+6SDrI6a3lW
	Zn2S1rI4XCkBmAqJXts8Ki56nJybf+KevkP57ccyxMB53ZHDzIzyf7Ha01/1pVDEPVNZnGEu9nQ7K
	1Efcla2bsOAs9nn33PeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0ZcF-002tQD-32;
	Wed, 08 Nov 2023 03:52:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0ZcB-002tOO-1A
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 03:52:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2BE3C807C;
	Wed,  8 Nov 2023 11:51:37 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Nov
 2023 11:51:37 +0800
Received: from [192.168.125.131] (113.72.147.118) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Nov
 2023 11:51:35 +0800
Message-ID: <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
Date: Wed, 8 Nov 2023 11:45:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
X-Originating-IP: [113.72.147.118]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_195227_708246_FD1D3C9B 
X-CRM114-Status: GOOD (  23.76  )
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

T24gMjAyMy8xMS8yIDIyOjI5LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiAKPiBIaSBYaW5neXUs
Cj4gCj4gT24gMDIvMTEvMjAyMyAxNDoxNSwgWGluZ3l1IFd1IHdyb3RlOgo+IAo+IFsgLi4uIF0K
PiAKPj4+Pj4+Pj4gK3N0cnVjdCBqaDcxMTBfY2xrZXZ0IHsgK8KgwqDCoCBzdHJ1Y3QgY2xvY2tf
ZXZlbnRfZGV2aWNlCj4+Pj4+Pj4+IGV2dDsgKyBzdHJ1Y3QgY2xvY2tzb3VyY2UgY3M7ICvCoMKg
wqAgYm9vbCBjc19pc192YWxpZDsgKwo+Pj4+Pj4+PiBzdHJ1Y3QgY2xrICpjbGs7ICvCoMKgwqAg
c3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsgK8KgwqDCoCB1MzIKPj4+Pj4+Pj4gcmF0ZTsgK8Kg
wqDCoCB1MzIgcmVsb2FkX3ZhbDsgK8KgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7ICsKPj4+Pj4+
Pj4gY2hhciBuYW1lW3NpemVvZigiamg3MTEwLXRpbWVyLmNoWCIpXTsgK307ICsgK3N0cnVjdCBq
aDcxMTBfdGltZXJfcHJpdiB7ICvCoMKgwqAgc3RydWN0IGNsayAqcGNsazsgK8KgwqDCoCBzdHJ1
Y3QgcmVzZXRfY29udHJvbCAqcHJzdDsgK8KgwqDCoCBzdHJ1Y3Qgamg3MTEwX2Nsa2V2dCBjbGtl
dnRbSkg3MTEwX1RJTUVSX0NIX01BWF07Cj4+Pj4+Pj4KPj4+Pj4+PiBXaHkgZG8geW91IG5lZWQg
c2V2ZXJhbCBjbG9jayBldmVudHMgYW5kIGNsb2NrIHNvdXJjZXMgPwo+Pj4+Pj4KPj4+Pj4+IFRo
aXMgdGltZXIgaGFzIGZvdXIgY291bnRlcnMgKGNoYW5uZWxzKSB3aGljaCBydW4KPj4+Pj4+IGlu
ZGVwZW5kZW50bHkuIFNvIGVhY2ggY291bnRlciBjYW4gaGF2ZSBpdHMgb3duIGNsb2NrIGV2ZW50
Cj4+Pj4+PiBhbmQgY2xvY2sgc291cmNlIHRvIGNvbmZpZ3VyZSBkaWZmZXJlbnQgc2V0dGluZ3Mu
Cj4+Pj4+Cj4+Pj4+IFRoZSBrZXJuZWwgb25seSBuZWVkcyBvbmUgY2xvY2tzb3VyY2UuIFVzdWFs
bHkgbXVsdGlwbGUKPj4+Pj4gY2xvY2tldmVudHMgYXJlIHBlci1jcHUgYmFzZWQgc3lzdGVtLgo+
Pj4+Pgo+Pj4+PiBUaGUgZHJpdmVyIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBhIHBlciBjcHUgdGlt
ZXIgYnV0IGp1c3QgaW5pdGlhbGl6aW5nIG11bHRpcGxlIGNsb2NrZXZlbnRzIHdoaWNoIHdpbGwg
ZW5kIHVwIHVudXNlZCwKPj4+Pj4gd2FzdGluZyBlbmVyZ3kuCj4+Pj4+Cj4+Pj4+Cj4+Pj4KPj4+
PiBUaGUgYm9hcmQgb2YgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MgaGFzIHR3byB0eXBlcyBvZiB0
aW1lciA6IHJpc2N2LXRpbWVyIGFuZCBqaDcxMTAtdGltZXIuIEl0IGJvb3RzIGJ5Cj4+Pj4gcmlz
Y3YtdGltZXIoY2xvY2tzb3VyY2UpIGFuZCB0aGUgamg3MTEwLXRpbWVyIGlzIG9wdGlvbmFsIGFu
ZAo+Pj4+IGFkZGl0aW9uYWwuIEkgdGhpbmsgSSBzaG91bGQgaW5pdGlhbGl6ZSB0aGUgZm91ciBj
aGFubmVscyBvZgo+Pj4+IGpoNzExMC10aW1lciBhcyBjbG9ja2V2ZW50cyBub3QgY2xvY2tzb3Vy
Y2UgcHJlLWNwdS4KPj4+Cj4+PiBJZiBubyBjbG9ja3NvdXJjZSBpcyBuZWVkZWQgb24gdGhpcyBT
b0MgYmVjYXVzZSByaXNjdiB0aW1lcnMgYXJlCj4+PiB1c2VkLCB0aGVuIGl0IGlzIG5vdCB1c2Vm
dWwgdG8gcmVnaXN0ZXIgYSBjbG9ja3NvdXJjZSBmb3IgdGhpcwo+Pj4gdGltZXIgYW5kIHRoZSBj
b3JyZXNwb25kaW5nIGNvZGUgY2FuIGdvIGF3YXkuCj4+Pgo+Pj4gSWYgdGhlIGNsb2NrZXZlbnQg
aXMgb3B0aW9uYWwgd2h5IGRvIHlvdSBuZWVkIHRoaXMgZHJpdmVyIGF0IGFsbD8KPj4+Cj4+Pgo+
Pj4KPj4KPj4gSGkgRGFuaWVsLAo+Pgo+PiBTb3JyeSwgbWF5YmUgSSBkaWRuJ3QgZXhwcmVzcyBp
dCBjbGVhcmx5IGVub3VnaC4gSSB1c2UgdGhpcwo+PiBqaDcxMTAtdGltZXIgYXMgYSBnbG9iYWwg
dGltZXIgb24gdGhlIFNvQyBhbmQgcmlzY3YtdGltZXIgYXMgY3B1Cj4+IGxvY2FsIHRpbWVyLiBT
byB0aGVzZSBhcmUgc29tZXRoaW5nIGRpZmZlcmVudC4KPj4KPj4gVGhlc2UgZm91ciBjb3VudGVy
cyBpbiB0aGlzIGpoNzExMC10aW1lciBhcmUgZXhhY3RseSB0aGUgc2FtZSBhbmQKPj4gaW5kZXBl
bmRlbnQgb2YgZWFjaCBvdGhlci4gSWYgdGhpcyB0aW1lciBpcyB1c2VkIGFzIGEgZ2xvYmFsIHRp
bWVyLAo+PiBkbyBJIHVzZSBvbmx5IG9uZSBvciBhbGwgb2YgdGhlIGNvdW50ZXJzIHRvIHJlZ2lz
dGVyIGNsb2Nrc291cmNlIGFuZAo+PiBjbG9ja2V2ZW50Pwo+IAo+IFllcy4KPiAKPiBUaGUgZ2xv
YmFsIHRpbWVyIGlzIG9ubHkgdGhlcmUgd2hlbiB0aGUgQ1BVIGlzIHBvd2VyZWQgZG93biBhdCBp
ZGxlIHRpbWUsIHNvIHRoZSB0aW1lIGZyYW1ld29yayB3aWxsIHN3aXRjaCB0byB0aGUgYnJvYWRj
YXN0IHRpbWVyIGFuZCB0aGVyZSBjYW4gYmUgb25seSBvbmUgaW5zdGFuY2UuCj4gCj4gSWYgeW91
IHJlZ2lzdGVyIGFsbCB0aGUgY291bnRlcnMsIG9ubHkgb25lIHdpbGwgYmUgdXNlZCBieSB0aGUg
a2VybmVsLCBzbyBpdCBwb2ludGxlc3MgdG8gYWRkIHRoZW0gYWxsLgo+IAo+IE9uIHRoZSBjbG9j
a3NvdXJjZSBzaWRlLCB5b3UgbWF5IHdhbnQgdG8gcXVlc3Rpb24gaWYgaXQgaXMgcmVhbGx5IHVz
ZWZ1bC4gVGhlIHJpc2N2IGhhcyBhIGNsb2Nrc291cmNlIHdpdGggYSBoaWdoZXIgcmF0ZSBhbmQg
ZmxhZ2dlZCBhcyBjb250aW51b3VzIFsxXS4gU28gaWYgdGhlIEpINzExMCBjbG9ja3NvdXJjZSBp
cyByZWdpc3RlcmVkLCBpdCB3b24ndCBiZSB1c2VkIHRvby4KPiAKPiBIb3BlIHRoYXQgaGVscHMK
PiAKPiDCoCAtLSBEYW5pZWwKPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdGhlcm1hbC9saW51eC5naXQvdHJlZS9kcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXJpc2N2LmMjbjY4Cj4gCgpUaGFua3MuIFRoZSByaXNjdi10aW1lciBoYXMgYSBj
bG9ja3NvdXJjZSB3aXRoIGEgaGlnaGVyIHJhdGluZyBidXQgYSBjbG9ja2V2ZW50IHdpdGggbG93
ZXIgcmF0aW5nWzFdIHRoYW4gamg3MTEwLXRpbWVyLiBJIHRlc3RlZCB0aGUgamg3MTEwLXRpbWVy
IGFzIGNsb2NrZXZlbnQgYW5kIGZsYWdnZWQgYXMgb25lIHNob3QsIHdoaWNoIGNvdWxkIGRvIHNv
bWUgb2YgdGhlIHdvcmtzIGluc3RlYWQgb2YgcmlzY3YtdGltZXIuIEFuZCB0aGUgY3VycmVudF9j
bG9ja2V2ZW50IGNoYW5nZWQgdG8gamg3MTEwLXRpbWVyLgoKQmVjYXVzZSB0aGUgamg3MTEwLXRp
bWVyIHdvcmtzIGFzIGNsb2Nrc291cmNlIHdpdGggbG93ZXIgcmF0aW5nIGFuZCBvbmx5IHdpbGwg
YmUgdXNlZCBhcyBnbG9iYWwgdGltZXIgYXQgQ1BVIGlkbGUgdGltZS4gSXMgaXQgbmVjZXNzYXJ5
IHRvIGJlIHJlZ2lzdGVyZWQgYXMgY2xvY2tzb3VyY2U/IElmIG5vdCwgc2hvdWxkIGl0IGp1c3Qg
YmUgcmVnaXN0ZXJlZCBhcyBjbG9ja2V2ZW50PwoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXguZ2l0L3RyZWUvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1yaXNjdi5jI240NQoKVGhhbmtzLApYaW5neXUgV3UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
