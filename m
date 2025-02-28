Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49D9C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubXYbuuMsW3qvQOQ5hlMPMv/4hGBEmK9lbOV+CBuajg=; b=Awc/SAFYs/II77
	KVl8T2zafYFoQXXTZKZ1DPfwa8lum33EkFqE+h7AKKnVWiKF+WUnIHO98Wcta8uJDAZhxx6Voxc22
	kZwi2s3rrjDrbK/E6mLIaLk+zpYIXOTignZBPD8K8ZQXOBux9Cgj+QTnWKfXtw/XgD5Al2vVANWRU
	HgYXJ8mSgWIemdo9qC7qjLek7TUNcw8yxTUmTSnW4GMeNyylC3zGLIJmE/i+abfzXGZ6k30tI6XE0
	zrSVDrOOj9OcAzYlxGnC7bc4l/QoLTs6J+MsZDzZcH0XpHhCZqMW8V1j+9tzn3Ahmn2cF1hRTiclG
	3vPH8IrzSbMn9Nux/hBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvDA-0000000A3dC-0MCw;
	Fri, 28 Feb 2025 07:55:08 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvBz-0000000A3ZE-1cam
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 07:53:57 +0000
Received: from [192.168.2.35] (unknown [98.97.25.197])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4DA9AB4C0592;
	Fri, 28 Feb 2025 08:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=mail; t=1740729229;
	bh=AXDPsPyWvICXScXCh1eSoBQkEfWfZVi/WOVQ1cYJJA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wqUWew5OisMsHSP6/g5SkINKU6ork8UBayx98V8axC131N69Yk1QeqoyWXNjeEgvt
	 40lVl7yRhMKKK+PFm+KKucXVZdg4CeEXBznZCvkjMMDMJ3jlEP67YeFQoIj2eu4swq
	 2+I0mynKl/NAZKTr/6jgGYlyflKKGWXVAM34zzwU=
Message-ID: <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
Date: Thu, 27 Feb 2025 23:53:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Hal Feng <hal.feng@starfivetech.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_235355_889656_89DFC711 
X-CRM114-Status: GOOD (  17.41  )
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

CgpPbiAyLzYvMjUgMTk6MDEsIEhhbCBGZW5nIHdyb3RlOgo+PiBPbiAwNi4wMi4yNSAxOToxNywg
RSBTaGF0dG93IHdyb3RlOgo+PiBPbiAyLzUvMjUgMTg6NTksIEhhbCBGZW5nIHdyb3RlOgo+Pj4g
T24gMi81LzIwMjUgNjowMSBQTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPj4+PiBPbiAy
LzUvMjUgMDg6NTcsIEhhbCBGZW5nIHdyb3RlOgo+Pj4+PiBPbiAyLzMvMjAyNSA5OjM3IEFNLCBF
IFNoYXR0b3cgd3JvdGU6Cj4+Pj4+PiBBZGQgYm9vdHBoLXByZS1yYW0gaGludGluZyB0byBqaDcx
MTAtY29tbW9uLmR0c2k6Cj4+Pj4+PiDCoMKgIC0gaTJjNV9waW5zIGFuZCBpMmMtcGlucyBzdWJu
b2RlIGZvciBjb25uZWN0aW9uIHRvIGVlcHJvbQo+Pj4+Pj4gwqDCoCAtIGVlcHJvbSBub2RlCj4+
Pj4+PiDCoMKgIC0gcXNwaSBmbGFzaCBjb25maWd1cmF0aW9uIHN1Ym5vZGUKPj4+Pj4+IMKgwqAg
LSBtZW1vcnkgbm9kZQo+Pj4+Pj4gwqDCoCAtIHVhcnQwIGZvciBzZXJpYWwgY29uc29sZQo+Pj4+
Pj4KPj4+Pj4+IMKgwqAgV2l0aCB0aGlzIHRoZSBVLUJvb3QgU1BMIHNlY29uZGFyeSBwcm9ncmFt
IGxvYWRlciBtYXkgZHJvcCBzdWNoCj4+Pj4+PiDCoMKgIG92ZXJyaWRlcyB3aGVuIHVzaW5nIGR0
LXJlYmFzaW5nIHdpdGggSkg3MTEwIE9GX1VQU1RSRUFNIGJvYXJkCj4+IHRhcmdldHMuCj4+Pj4+
Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVzaGVsbC5kZT4KPj4+Pj4+
IC0tLQo+Pj4+Pj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9u
LmR0c2kgfCA2ICsrKysrKwo+Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1jb21tb24uZHRzaQo+Pj4+Pj4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1jb21tb24uZHRzaQo+Pj4+Pj4gaW5kZXggMzBjNWYzNDg3YzhiLi5jOWU3YWU1OWVl
N2MgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1jb21tb24uZHRzaQo+Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtY29tbW9uLmR0c2kKPj4+Pj4+IEBAIC0yOCw2ICsyOCw3IEBAIGNob3NlbiB7Cj4+Pj4+
PiDCoMKgwqDCoMKgIG1lbW9yeUA0MDAwMDAwMCB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwIDB4NDAwMDAwMDAgMHgxIDB4MD47Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYm9vdHBoLXBy
ZS1yYW07Cj4+Pj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGdwaW8tcmVz
dGFydCB7Cj4+Pj4+PiBAQCAtMjQ3LDYgKzI0OCw3IEBAIGVtbWNfdmRkOiBhbGRvNCB7Cj4+Pj4+
PiDCoMKgwqDCoMKgIH07Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGVlcHJvbUA1MCB7Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwNCI7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDB4NTA+Owo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2VzaXplID0gPDE2PjsKPj4+
Pj4+IEBAIC0zMjMsNiArMzI1LDcgQEAgJnFzcGkgewo+Pj4+Pj4gwqDCoMKgwqDCoCBub3JfZmxh
c2g6IGZsYXNoQDAgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiamVk
ZWMsc3BpLW5vciI7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFtOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGNkbnMscmVhZC1kZWxheSA9IDwyPjsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcGktbWF4
LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNkbnMs
dHNoc2wtbnMgPSA8MT47Cj4+Pj4+PiBAQCAtNDA1LDYgKzQwOCw3IEBAIEdQT0VOX1NZU19JMkMy
X0RBVEEsCj4+Pj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGkyYzVfcGlu
czogaTJjNS0wIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBpMmMtcGlucyB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwaW5tdXggPSA8R1BJT01VWCgxOSwgR1BPVVRfTE9XLAo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQT0VOX1NZU19J
MkM1X0NMSywgQEAgLTQxMyw2ICs0MTcsNyBAQAo+Pj4+Pj4gR1BJX1NZU19JMkM1X0NMSyk+LAo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEdQT0VOX1NZU19JMkM1X0RBVEEsCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1BJX1NZU19JMkM1X0RBVEEpPjsKPj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpYXMtZGlzYWJsZTsgLyogZXh0ZXJuYWwgcHVs
bC11cCAqLwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnB1dC1lbmFibGU7Cj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnB1dC1zY2htaXR0LWVuYWJsZTsKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+Pj4+Pj4gQEAgLTY0MSw2ICs2NDYsNyBAQCBHUE9FTl9ESVNBQkxF
LAo+Pj4+Pj4gwqAgfTsKPj4+Pj4+IMKgIMKgICZ1YXJ0MCB7Cj4+Pj4+PiArwqDCoMKgIGJvb3Rw
aC1wcmUtcmFtOwo+Pj4+Pj4gwqDCoMKgwqDCoCBjbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+
Owo+Pj4+Pj4gwqDCoMKgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+Pj4+Pj4gwqDC
oMKgwqDCoCBwaW5jdHJsLTAgPSA8JnVhcnQwX3BpbnM+Owo+Pj4+Pgo+Pj4+PiBXaGF0IGFib3V0
ICZtbWMwLCAmbW1jMSwgJnFzcGksICZzeXNncGlvLCAmbW1jMF9waW5zLAo+PiAmbW1jMV9waW5z
LCAmaTJjNT8KPj4+Pj4gV2h5IG5vdCBhZGQgImJvb3RwaC1wcmUtcmFtOyIgZm9yIHRoZW0/Cj4+
Pj4KPj4+PiBXb3VsZCB0aGV5IGJlIG5lZWRlZCBiZWZvcmUgcmVsb2NhdGlvbiBvZiBVLUJvb3Qg
dG8gRFJBTT8KPj4+Cj4+PiBZZWFoLCB0aGV5IGFyZSBuZWVkZWQgYnkgU1BMIGFuZCB0aGV5IGFy
ZSBzZXQgaW4gVS1Cb290Cj4+PiBhcmNoL3Jpc2N2L2R0cy9qaDcxMTAtY29tbW9uLXUtYm9vdC5k
dHNpLgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IEhhbAo+Pj4KPj4KPj4gV2hlbiBJIHRlc3Rl
ZCBvbiBTdGFyNjQgdGhlcmUgd2FzIG5vbmUgb2YgdGhvc2UgbmVlZGVkIHRvIGJvb3QuIFdlIGNh
biBhZGQKPj4gbW9yZSBib290cGgtcHJlLXJhbSBhcyBuZWVkZWQgYnV0IEkgd2FudCB0byBrbm93
IGhvdyB0byB0ZXN0IChiZWNhdXNlIEkKPj4gZGlkIG5vdCBzZWUgYW55IG5lZWQgZm9yIHRoZXNl
KS4KPj4KPj4gSG93IGRvIHlvdSB0ZXN0IHRoYXQgdGhlc2UgYXJlIG5lZWRlZD8KPiAKPiBJbiBt
eSBvcGluaW9uLCBTUEwgbmVlZCB0byByZWFkIFUtQm9vdCBmcm9tIEVNTUMgKG1tYzApIG9yIFNE
Y2FyZCAobW1jMSkgb3IKPiBRU1BJIGZsYXNoIChxc3BpKS4gQWxzbyBpdCBuZWVkIHRvIGNob29z
ZSB0aGUgY29ycmVjdCBEVEIgYnkgcmVhZGluZyBFRVBST00KPiBtb3VudGVkIG9uIGkyYzUuIFRv
IHJ1biBtbWMgLyBpMmMgZHJpdmVycywgdGhlIHBpbiBjb25maWd1cmF0aW9ucyAoc3lzZ3Bpbywg
bW1jMC8xX3BpbnMpCj4gYXJlIGFsc28gbmVlZGVkLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBIYWwK
CkVNTUMgb3IgU0RjYXJkIGFyZSBub3QgcG9zc2libGUgdG8gYm9vdCAodmlhIEpINzExMCBib290
IFJPTSwgZGlzdGluY3QKZnJvbSBRU1BJIGJvb3Qgb2YgVS1Cb290IGFuZCBsYXRlciBFTU1DIG9y
IFNEY2FyZCBjYXBhYmlsaXR5KSBpbiB0aGlzCndheSBvbiBzb21lIG9mIHRoZSBib2FyZHMgd2hl
cmUgdHJhbnNpc3RvciBsb2dpYyBwYWlycyBHUElPMCBhbmQgR1BJTzEKYm90aC1vZmYgb3IgYm90
aC1vbi4gU0RjYXJkIGJvb3QgaXMgb2ZmaWNpYWxseSByZWNvbW1lbmRlZCBhZ2FpbnN0IGFzCiJu
b3Qgc3VwcG9ydGVkIiBieSB0aGUgU3RhckZpdmUgcmVmZXJlbmNlIGRvY3VtZW50YXRpb24sIGFu
ZCBJIHN1cHBvc2UKd2hhdCByZW1haW5zIGlzIEVNTUMgYm9vdCBhcyB2YWxpZCB0aG91Z2ggSSBo
YXZlIG5vdCBoZWFyZCBvZiBhbnkgdXNlcnMKZm9yIHRoaXMuCgpXaGF0IGlzIHRoZSB0ZXN0IHBy
b2NlZHVyZSBmb3IgRU1NQyBib290LCBjYW4geW91IGV4cGxhaW4gYW5kIEkgd2lsbCB0cnkKaXQg
b24gdGhlIFN0YXI2ND8KCi1FCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
