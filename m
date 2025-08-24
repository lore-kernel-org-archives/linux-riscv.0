Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473F3CA0EFC
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 19:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3HsT+RqpF3gfxVaBQBflahLjAlyG7PqlyzqO9eUDTY=; b=JoF6SxiY58TuGs
	rGF6bU6eckhAaT7RhGu6p/dLNoD20FbWXhQTchPckcmRHDsW2kQ4tnLIyFWUUO4wnIBT8l3JENG29
	IaZpwQpyPtMv3GF0DFQDc2lhVtwn31C1Xw1CG3+08jXD5FcmAgPOAWV9mJyTKSVufOZZIecELZKNv
	u1pFNX6B1PBk097IcEA9wdIaSj9dYzuALZxlJjMqBAe+dvmSoIEemkYnQ4jaf57+iTQo1k1vynhKJ
	IYtW/IxAX2kcjVmbXim3JK4dLL8nOVEPxXf9AlI3zbU/78bads2lJq5hFfeBFXv2tWtksp0gFD8Ll
	P2xCZfMQ4/mKJjL7At0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGhe-00000006VaB-2cxe;
	Sun, 24 Aug 2025 19:48:34 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqGhc-00000006VZb-2PEp
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 19:48:34 +0000
Received: from [192.168.2.54] (unknown [98.97.26.216])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id CF33EB4E0003;
	Sun, 24 Aug 2025 21:48:24 +0200 (CEST)
Message-ID: <44585871-aabe-4d6d-b4c9-17d9acaa8063@freeshell.de>
Date: Sun, 24 Aug 2025 12:48:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
To: Icenowy Zheng <uwu@icenowy.me>, Hal Feng <hal.feng@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-2-hal.feng@starfivetech.com>
 <3c2b62e219e50555319da369cafa9a8f79eb71e8.camel@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <3c2b62e219e50555319da369cafa9a8f79eb71e8.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_124832_757389_9C98667C 
X-CRM114-Status: GOOD (  13.64  )
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

T24gOC8yNC8yNSAxMDoxNCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0wOC0yMeaY
n+acn+Wbm+eahCAxODowOSArMDgwMO+8jEhhbCBGZW5n5YaZ6YGT77yaCj4+IEFkZCBkZXZpY2Ug
dHJlZSBiaW5kaW5ncyBmb3IgdGhlIFN0YXJGaXZlIEpINzExMFMgU29DCj4+IGFuZCB0aGUgVmlz
aW9uRml2ZSAyIExpdGUgYm9hcmQgZXF1aXBwZWQgd2l0aCBpdC4KPj4KPj4gSkg3MTEwUyBTb0Mg
aXMgYW4gaW5kdXN0cmlhbCBTb0Mgd2hpY2ggY2FuIHJ1biBhdCAtNDB+ODUgZGVncmVlcwo+PiBj
ZW50aWdyYWRlCj4+IGFuZCB1cCB0byAxLjI1R0h6LiBJdHMgQ1BVIGNvcmVzIGFuZCBwZXJpcGhl
cmFscyBhcmUgbW9zdGx5IHNpbWlsYXIKPj4gdG8KPj4gdGhvc2Ugb2YgdGhlIEpINzExMCBTb0Mu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29t
Pgo+PiAtLS0KPj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3Rh
cmZpdmUueWFtbCB8IDUgKysrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc3RhcmZpdmUueWFtbAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9zdGFyZml2ZS55YW1sCj4+IGluZGV4IDdlZjg1MTc0MzUzZC4uYTI5NTI0OTA3MDlmIDEw
MDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3Rh
cmZpdmUueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc3RhcmZpdmUueWFtbAo+PiBAQCAtMzMsNiArMzMsMTEgQEAgcHJvcGVydGllczoKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHN0YXJmaXZlLHZpc2lvbmZpdmUtMi12MS4zYgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdGFyZml2ZSxqaDcxMTAKPj4gwqAKPj4g
K8KgwqDCoMKgwqAgLSBpdGVtczoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHN0YXJmaXZlLHZpc2lvbmZpdmUtMi1saXRlCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc3RhcmZpdmUsamg3MTEwcwo+IAo+IEkgc3Vn
Z2VzdCBhZGRpbmcgc3RhcmZpdmUsamg3MTEwIGFzIGEgZmFsbGJhY2sgaGVyZSwgYXMgaXQncyB0
aGUgU29DCj4gYmVzdCBrbm93biB0byBtb3N0IHNvZnR3YXJlcywgYW5kIEpINzExMFMgc2hvdWxk
bid0IGhhdmUgYW55IGRpZmZlcmVuY2UKPiB0byBKSDcxMTAgb3RoZXIgdGhhbiBiaW5uaW5nLgo+
IAo+PiArCj4+IMKgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPj4gwqAKPj4gwqAuLi4KPiAK
Ck5BSywgaXQgaXMgc2FpZCB0aGUgb3BlcmF0aW5nIHBhcmFtZXRlcnMgb2Ygamg3MTEwcyBhcmUg
ZGlzdGluY3QgZnJvbQpqaDcxMTAuIFlvdSB3b3VsZCBoYXZlIHRvIHNob3cgdGhhdCBpdCBpcyBz
YWZlIHRvIG9wZXJhdGUgdGhlIGpoNzExMHMKd2l0aCB0aGUgb3BlcmF0aW5nIHBhcmFtZXRlcnMg
b2YgdGhlIGpoNzExMC4gSWYgYW55dGhpbmcgdGhpcyB3b3VsZCBiZQp0aGUgaW52ZXJzZSwgc29t
ZSBqaDcxMXggKG9yIGV2ZW4gajcxeHggdG8gaW5jbHVkZSBqaDcxMDApIGNvbW1vbgpkZXNjcmlw
dGlvbiB3aXRoIGZhbGxiYWNrIG9wZXJhdGluZyBwYXJhbWV0ZXJzPyBBbmQgdG8gYWRkIHRoaXMg
Y29tbW9uCmZhbGxiYWNrIHdpdGggamg3MTAwICg/KSwgamg3MTEwLCBqaDcxMTBzICAtRQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
