Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D430CC021A6
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgddLtFaFU/IVHn5ccgwYKysuE4x4QaA7ihucARPXu4=; b=FvTvXrEUQZddCS
	zZRf9dz62n63akDsH48P3cqDqfv8WsezbIOVywoBuA5U7LFj/HFQ/TSFt14/yerp0ceVysuhaGZCg
	NAk43rbGyYsswd6Wwr2LI+PYlcp+af+9ESFHGdn3dBLE4Agk6FNd05P9hUmD+NLkub4twrhdytEK7
	b3GLTWmv9MzBAEVKN7kN7ZO0KhoHsQt33OF+CiIHZ4O2eRXnGwMPzzfS1bYVH8v0igycZGjpJplt6
	6DYrIu5wjG4yvH30Y/fug/PiOB1ZEzywCwuWPb+sV7MkBQiei7EaCT6adaQrmQ7h3/KwiGJ3fYS9P
	xXglNe7jpJl8b4+8V0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGb-00000008FBX-2AIo;
	Wed, 12 Feb 2025 17:11:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFsU-000000089iN-0c6u;
	Wed, 12 Feb 2025 16:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8DD9A40C0D;
	Wed, 12 Feb 2025 16:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADD3C4CEE2;
	Wed, 12 Feb 2025 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739378781;
	bh=dBlv29benpRXnHK6aFHmeoFcTFBzZcFMV33Vx/ypJEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1HyDBMdqOGCUvxXYvV+Ko7K2m4FxzxOSSxHOlqRcjl+f3935/0l3rF3nJOydXeUY
	 6GG/aZtFFY9/eZpYbSCsYxGxJcciAMYPoKB4WQOEWPv3QbHv6MOuKy2i9atXxb+XGe
	 oW5PBZpyDHTVtDsj6VfBhhySSuEppnf3pyZ+N2XmIvPvsAQrBuxTPKpSbQYxXEx2nU
	 AMRf2RwEGOPXxAElqs4uGtn7viYUsqQzzwtgcYa0iMs8DtjXsNOLWt4GIrZwymZ7Ip
	 qaVmfm+Z4VGzjBSo86sPiwwx1mxMO7+YriMGfKsxMarEP6n34EGT5meo5e0itT6wUK
	 vmYnIIqwuvDNQ==
Message-ID: <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
Date: Wed, 12 Feb 2025 17:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Chao Wei <chao.wei@sophgo.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_084622_323653_73DA57F8 
X-CRM114-Status: GOOD (  16.21  )
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

T24gMTIvMDIvMjAyNSAxMDoyNiwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgo+IEhpIElub2No
aSwgS3J6eXN6dG9mLAo+IAo+IE9uIFdlZCwgMjAyNS0wMi0xMiBhdCAwODozMSArMDgwMCwgSW5v
Y2hpIEFtYW90byB3cm90ZToKPj4gT24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTE6MDk6NDFQTSAr
MDEwMCwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgo+Pj4gTWFrZSB0aGUgcGVyaXBoZXJhbCBk
ZXZpY2UgdHJlZSByZS11c2FibGUgb24gQVJNNjQgcGxhdGZvcm0gYnkgbW92aW5nIENQVQo+Pj4g
Y29yZSBhbmQgaW50ZXJydXB0IGNvbnRyb2xsZXJzJyBwYXJ0cyBpbnRvIHRoZSByZXNwZWN0aXZl
IHBlci1Tb0MgLmR0c2kKPj4+IGZpbGVzLgo+Pj4KPj4+IEFkZCBTT0NfUEVSSVBIRVJBTF9JUlEo
KSBtYWNybyB3aGljaCBleHBsaWNpdGx5IG1hcHMgcGVyaXBoZXJhbCBudWJlcmluZwo+Pj4gaW50
byAicGxpYyIgaW50ZXJydXB0LWNvbnRyb2xsZXIgbnVtYmVyaW5nLgo+Pj4KPj4+IEhhdmUgYSBu
aWNlIHJlZmFjdG9yaW5nIHNpZGUtZWZmZWN0IHRoYXQgInBsaWMiIGFuZCAiY2xpbnQiICJjb21w
YXRpYmxlIgo+Pj4gcHJvcGVydHkgaXMgbm90IHNwZWNpZmllZCBvdXRzaWRlIG9mIHRoZSBjb3Jy
ZXNwb25kaW5nIGRldmljZSBpdHNlbGYuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+Pj4gLS0tCj4+PiBDaGFu
Z2Vsb2c6Cj4+PiB2MjoKPj4+IC0gaW5zdGVhZCBvZiBjYXJ2aW5nIG91dCBwZXJpcGhlcmFscycg
cGFydCwgY2FydmUgb3V0IEFSQ0gtc3BlY2lmaWNzIChDUFUKPj4+IGNvcmUsIGludGVycnVwdCBj
b250cm9sbGVycykgYW5kIHNwcmVhZCB0aGVtIGFtb25nIDMgU29DIC5kdHNpIGZpbGVzIHdoaWNo
Cj4+PiBpbmNsdWRlZCBjdjE4eHguZHRzaTsKPj4+IC0gZGVmaW5lIGEgbGFiZWwgZm9yIHRoZSAi
c29jIiBub2RlIGFuZCB1c2UgaXQgaW4gdGhlIG5ld2x5IGludHJvZHVjZWQgRFRzOwo+Pj4KPj4+
IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpwqDCoMKgIHwgNjQgKysr
KysrKysrKysrLS0tCj4+PiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgxMmguZHRz
acKgwqDCoCB8IDY0ICsrKysrKysrKysrKy0tLQo+Pj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MXguZHRzacKgwqDCoMKgIHzCoCAyICstCj4+PiDCoGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTh4eC1jcHUuZHRzaSB8IDU3ICsrKysrKysrKysrKysrCj4+PiDCoGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC5kdHNpwqDCoMKgwqAgfCA5MSArKysrKystLS0t
LS0tLS0tLS0tLS0tCj4+PiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi5kdHNp
wqDCoMKgwqAgfCA2NCArKysrKysrKysrKystLS0KPj4+IMKgNiBmaWxlcyBjaGFuZ2VkLCAyNDAg
aW5zZXJ0aW9ucygrKSwgMTAyIGRlbGV0aW9ucygtKQo+Pj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LWNwdS5kdHNpCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+Pj4gaW5kZXggYWExZjVkZjEwMGYwLi5l
ZWYyODg0YjM2ZjkgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4MDBiLmR0c2kKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIu
ZHRzaQo+Pj4gQEAgLTMsNiArMyw4IEBACj4+PiDCoCAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4+PiDCoCAqLwo+Pj4gwqAKPj4+ICsjZGVm
aW5lIFNPQ19QRVJJUEhFUkFMX0lSUShucikJKChucikgKyAxNikKPj4+ICsKPj4+IMKgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1jdjE4MDBiLmg+Cj4+PiDCoCNpbmNsdWRl
ICJjdjE4eHguZHRzaSIKPj4+IMKgCj4+PiBAQCAtMTQsMjIgKzE2LDYyIEBAIG1lbW9yeUA4MDAw
MDAwMCB7Cj4+PiDCoAkJcmVnID0gPDB4ODAwMDAwMDAgMHg0MDAwMDAwPjsKPj4+IMKgCX07Cj4+
PiDCoAo+Pgo+Pj4gLQlzb2Mgewo+Pj4gLQkJcGluY3RybDogcGluY3RybEAzMDAxMDAwIHsKPj4+
IC0JCQljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLXBpbmN0cmwiOwo+Pj4gLQkJCXJlZyA9
IDwweDAzMDAxMDAwIDB4MTAwMD4sCj4+PiAtCQkJwqDCoMKgwqDCoCA8MHgwNTAyNzAwMCAweDEw
MDA+Owo+Pj4gLQkJCXJlZy1uYW1lcyA9ICJzeXMiLCAicnRjIjsKPj4KPj4KPj4+ICsJY3B1czog
Y3B1cyB7Cj4+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4+ICsJCSNzaXplLWNlbGxzID0g
PDA+Owo+Pj4gKwkJdGltZWJhc2UtZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPj4+ICsKPj4+ICsJ
CWNwdTA6IGNwdUAwIHsKPj4+ICsJCQljb21wYXRpYmxlID0gInRoZWFkLGM5MDYiLCAicmlzY3Yi
Owo+Pj4gKwkJCWRldmljZV90eXBlID0gImNwdSI7Cj4+PiArCQkJcmVnID0gPDA+Owo+Pj4gKwkJ
CWQtY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4+PiArCQkJZC1jYWNoZS1zZXRzID0gPDUxMj47
Cj4+PiArCQkJZC1jYWNoZS1zaXplID0gPDY1NTM2PjsKPj4+ICsJCQlpLWNhY2hlLWJsb2NrLXNp
emUgPSA8NjQ+Owo+Pj4gKwkJCWktY2FjaGUtc2V0cyA9IDwxMjg+Owo+Pj4gKwkJCWktY2FjaGUt
c2l6ZSA9IDwzMjc2OD47Cj4+PiArCQkJbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4+PiArCQkJ
cmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+Pj4gKwkJCXJpc2N2LGlzYS1iYXNlID0gInJ2NjRp
IjsKPj4+ICsJCQlyaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQi
LCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+Pj4gKwkJCQkJwqDCoMKgwqDCoMKgICJ6aWZlbmNl
aSIsICJ6aWhwbSI7Cj4+PiArCj4+PiArCQkJY3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxl
ciB7Cj4+PiArCQkJCWNvbXBhdGlibGUgPSAicmlzY3YsY3B1LWludGMiOwo+Pj4gKwkJCQlpbnRl
cnJ1cHQtY29udHJvbGxlcjsKPj4+ICsJCQkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPj4+ICsJ
CQl9Owo+Pj4gwqAJCX07Cj4+PiDCoAl9Owo+Pj4gwqB9Owo+Pgo+PiBNYWtlIGFsbCBzb2MgZGVm
aW5pdGlvbiBpbmNsdWRlIHRoZSBjb21tb24gY3B1IGZpbGUuIAo+PiBOb3QganVzdCBjb3B5IGl0
Lgo+IAo+IEkgd2FzIGFjdGluZyBhY2NvcmRpbmcgdG8gS3J6eXN6dG9mJ3Mgc3VnZ2VzdGlvbjoK
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9zb2MvZDNiYTBlYTUtMDQ5MS00MmQ1LWExOGUtNjRj
ZjIxZGY2OTZjQGtlcm5lbC5vcmcvCj4gCj4gS3J6eXN6dG9mLCBJIGNhbiBuYW1lIHRoZSBmaWxl
IGN2MTh4eC1jcHUtaW50Yy5kdHNpIGFuZCBwYWNrIENQVSBjb3JlICsgaW50ZXJydXB0Cj4gY29u
dHJvbGxlcnMgaW50byBpdC4gV291bGQgaXQgbWFrZSBzZW5zZT8KCgpJIGRvbid0IHVuZGVyc3Rh
bmQgdGhlIG9yaWdpbmFsIHN1Z2dlc3Rpb24uCgpJbm9jaGksIHBsZWFzZSB0cmltIHVubmVjZXNz
YXJ5IGNvbnRleHQgZnJvbSByZXBsaWVzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
