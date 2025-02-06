Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0969C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GGPdC2LwnexW65ZiA1+Uid+xrtyBDW4Dt0soeFrIdA=; b=AbdgvcEUmxlHnJ
	AQASONf7BvYCb09UQrea/71v4G0ZNeOE6o4ZU0ABBZKXsZt/2Ve6/k2IfvwAQUpE2eGYVgUOTecY+
	lMPTjXXzNjWHR+oY2aESnATzj8Lcd6HeZazm78bCyGKrnlAtAGkMKlpyN+4lelXjJLHv/eLfE5ed9
	D+cxt08XinmPp2ob4P4mARcOkkMOuuvNQ98KncXOxwPuAXxlGCI2RLwl0srkaIWJFfHDjxYN7AsC1
	rs0R0qRc9ri8jyJiTPcw6KQuhSW5ig7FbXFDO8K8YijmEmfd9+FrPuW+InzheVEwPktWJzQFH7MYh
	ShY2WvEnrqX6Z+E/SGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Ow-00000006CKo-1ekw;
	Thu, 06 Feb 2025 11:50:34 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzsz-000000066Rv-1ydO
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 11:17:35 +0000
Received: from [192.168.2.35] (unknown [98.97.25.24])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 845CEB4C0145;
	Thu,  6 Feb 2025 12:17:28 +0100 (CET)
Message-ID: <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
Date: Thu, 6 Feb 2025 03:17:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_031733_651552_0D445426 
X-CRM114-Status: GOOD (  13.24  )
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

CgpPbiAyLzUvMjUgMTg6NTksIEhhbCBGZW5nIHdyb3RlOgo+IE9uIDIvNS8yMDI1IDY6MDEgUE0s
IEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+IE9uIDIvNS8yNSAwODo1NywgSGFsIEZlbmcg
d3JvdGU6Cj4+PiBPbiAyLzMvMjAyNSA5OjM3IEFNLCBFIFNoYXR0b3cgd3JvdGU6Cj4+Pj4gQWRk
IGJvb3RwaC1wcmUtcmFtIGhpbnRpbmcgdG8gamg3MTEwLWNvbW1vbi5kdHNpOgo+Pj4+IMKgwqAg
LSBpMmM1X3BpbnMgYW5kIGkyYy1waW5zIHN1Ym5vZGUgZm9yIGNvbm5lY3Rpb24gdG8gZWVwcm9t
Cj4+Pj4gwqDCoCAtIGVlcHJvbSBub2RlCj4+Pj4gwqDCoCAtIHFzcGkgZmxhc2ggY29uZmlndXJh
dGlvbiBzdWJub2RlCj4+Pj4gwqDCoCAtIG1lbW9yeSBub2RlCj4+Pj4gwqDCoCAtIHVhcnQwIGZv
ciBzZXJpYWwgY29uc29sZQo+Pj4+Cj4+Pj4gwqDCoCBXaXRoIHRoaXMgdGhlIFUtQm9vdCBTUEwg
c2Vjb25kYXJ5IHByb2dyYW0gbG9hZGVyIG1heSBkcm9wIHN1Y2gKPj4+PiDCoMKgIG92ZXJyaWRl
cyB3aGVuIHVzaW5nIGR0LXJlYmFzaW5nIHdpdGggSkg3MTEwIE9GX1VQU1RSRUFNIGJvYXJkIHRh
cmdldHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVAZnJlZXNoZWxsLmRl
Pgo+Pj4+IC0tLQo+Pj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNv
bW1vbi5kdHNpIHwgNiArKysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtY29tbW9uLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1j
b21tb24uZHRzaQo+Pj4+IGluZGV4IDMwYzVmMzQ4N2M4Yi4uYzllN2FlNTllZTdjIDEwMDY0NAo+
Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNp
Cj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0
c2kKPj4+PiBAQCAtMjgsNiArMjgsNyBAQCBjaG9zZW4gewo+Pj4+IMKgwqDCoMKgwqAgbWVtb3J5
QDQwMDAwMDAwIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5
IjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDQwMDAwMDAwIDB4MSAweDA+
Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+PiDCoMKgwqDCoMKgIH07
Cj4+Pj4gwqAgwqDCoMKgwqDCoCBncGlvLXJlc3RhcnQgewo+Pj4+IEBAIC0yNDcsNiArMjQ4LDcg
QEAgZW1tY192ZGQ6IGFsZG80IHsKPj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4gwqAgwqDCoMKgwqDC
oCBlZXByb21ANTAgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwNCI7Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZyA9IDwweDUwPjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZXNp
emUgPSA8MTY+Owo+Pj4+IEBAIC0zMjMsNiArMzI1LDcgQEAgJnFzcGkgewo+Pj4+IMKgwqDCoMKg
wqAgbm9yX2ZsYXNoOiBmbGFzaEAwIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJqZWRlYyxzcGktbm9yIjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgY2RucyxyZWFkLWRlbGF5ID0gPDI+Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcGktbWF4
LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjZG5zLHRz
aHNsLW5zID0gPDE+Owo+Pj4+IEBAIC00MDUsNiArNDA4LDcgQEAgR1BPRU5fU1lTX0kyQzJfREFU
QSwKPj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4gwqAgwqDCoMKgwqDCoCBpMmM1X3BpbnM6IGkyYzUt
MCB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOwo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpMmMtcGlucyB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlubXV4
ID0gPEdQSU9NVVgoMTksIEdQT1VUX0xPVywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1BPRU5fU1lTX0kyQzVfQ0xLLAo+Pj4+IEBA
IC00MTMsNiArNDE3LDcgQEAgR1BJX1NZU19JMkM1X0NMSyk+LAo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHUE9FTl9TWVNfSTJDNV9E
QVRBLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBHUElfU1lTX0kyQzVfREFUQSk+Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJpYXMtZGlzYWJsZTsgLyogZXh0ZXJuYWwgcHVsbC11cCAqLwo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlucHV0LWVuYWJsZTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnB1dC1z
Y2htaXR0LWVuYWJsZTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+PiBAQCAtNjQxLDYg
KzY0Niw3IEBAIEdQT0VOX0RJU0FCTEUsCj4+Pj4gwqAgfTsKPj4+PiDCoCDCoCAmdWFydDAgewo+
Pj4+ICvCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4gwqDCoMKgwqDCoCBjbG9jay1mcmVxdWVu
Y3kgPSA8MjQwMDAwMDA+Owo+Pj4+IMKgwqDCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPj4+PiDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmdWFydDBfcGlucz47Cj4+Pgo+Pj4gV2hh
dCBhYm91dCAmbW1jMCwgJm1tYzEsICZxc3BpLCAmc3lzZ3BpbywgJm1tYzBfcGlucywgJm1tYzFf
cGlucywgJmkyYzU/Cj4+PiBXaHkgbm90IGFkZCAiYm9vdHBoLXByZS1yYW07IiBmb3IgdGhlbT8K
Pj4KPj4gV291bGQgdGhleSBiZSBuZWVkZWQgYmVmb3JlIHJlbG9jYXRpb24gb2YgVS1Cb290IHRv
IERSQU0/Cj4gCj4gWWVhaCwgdGhleSBhcmUgbmVlZGVkIGJ5IFNQTCBhbmQgdGhleSBhcmUgc2V0
IGluCj4gVS1Cb290IGFyY2gvcmlzY3YvZHRzL2poNzExMC1jb21tb24tdS1ib290LmR0c2kuCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEhhbAo+IAoKV2hlbiBJIHRlc3RlZCBvbiBTdGFyNjQgdGhlcmUg
d2FzIG5vbmUgb2YgdGhvc2UgbmVlZGVkIHRvIGJvb3QuIFdlIGNhbgphZGQgbW9yZSBib290cGgt
cHJlLXJhbSBhcyBuZWVkZWQgYnV0IEkgd2FudCB0byBrbm93IGhvdyB0byB0ZXN0CihiZWNhdXNl
IEkgZGlkIG5vdCBzZWUgYW55IG5lZWQgZm9yIHRoZXNlKS4KCkhvdyBkbyB5b3UgdGVzdCB0aGF0
IHRoZXNlIGFyZSBuZWVkZWQ/CgotRQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
