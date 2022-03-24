Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7B0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 02:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGlTY0Y/xGoIgYquAqInZiCyabc5TowQisZHd7OIrSU=; b=simtamEdQ0Zj0Q
	c6mNekWcEUvA9AEML7RG7yqPiXDC42bfq6nBb0HGQa7qBfyY+qbHzpVYrWpJxi3Ga5dFvCdsPi4CH
	29di22+kMC4GFpqzdkaIh48lzaFq/JyYYWFL9ELAH3k4ZYgeMtDsE+u6a90rhJUhiZjMm76yzZefa
	0oVlVgtR5Qndos7Z3X3Qmg0EMfEO5aqErA3JcRKVJIe5pbbBytvkDG+s65SSQVwaaDmnCR/8gcGeO
	Rf1X2ENZDeaWZTKbsOqdlvGfwEvoF3y2XkCjri3e8rer3Nw/QcQlWX59khzWQ8p2JtyRdw2ka2MKJ
	3fxBnNXIlJu4lWoayydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXDSt-00FU18-LA; Thu, 24 Mar 2022 02:44:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXDSg-00FTxp-1u; Thu, 24 Mar 2022 02:44:32 +0000
Received: from kwepemi100013.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KP8f53mB4zfZCQ;
 Thu, 24 Mar 2022 10:42:53 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100013.china.huawei.com (7.221.188.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Mar 2022 10:44:27 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Mar 2022 10:44:25 +0800
Message-ID: <a8021f23-7878-bba4-6727-732f8e34c196@huawei.com>
Date: Thu, 24 Mar 2022 10:44:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH -next v2 2/4] mm: page_table_check: add hooks to public
 helpers
To: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-3-tongtiangen@huawei.com>
 <CA+CK2bAa96oE0FbtJUjAJ=vpuzQsW3R60K9SUhca6mZ3BL1f8w@mail.gmail.com>
 <0c95c24d-b980-a8b3-9c68-e10d16e05e10@huawei.com>
 <CA+CK2bAhxZEyirFHjwEB6aRDqH8ZzbJu_NELaT+vBAuDtDh9PQ@mail.gmail.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CA+CK2bAhxZEyirFHjwEB6aRDqH8ZzbJu_NELaT+vBAuDtDh9PQ@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_194430_455958_BAD9A0B5 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMi8zLzI0IDEwOjEyLCBQYXNoYSBUYXRhc2hpbiDlhpnpgZM6Cj4gT24gV2VkLCBN
YXIgMjMsIDIwMjIgYXQgMTA6MDcgUE0gVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3ZWku
Y29tPiB3cm90ZToKPj4KPj4KPj4KPj4g5ZyoIDIwMjIvMy8yNCAxOjQyLCBQYXNoYSBUYXRhc2hp
biDlhpnpgZM6Cj4+PiBPbiBUdWUsIE1hciAyMiwgMjAyMiBhdCAxMDoyNSBBTSBUb25nIFRpYW5n
ZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gTW92ZSBwdGVwX2Ns
ZWFyKCkgdG8gdGhlIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIGFuZCBhZGQgcGFnZSB0YWJsZSBj
aGVjawo+Pj4+IHJlbGF0ZSBob29rcyB0byBzb21lIGhlbHBlcnMsIGl0J3MgcHJlcGFyZSBmb3Ig
c3VwcG9ydCBwYWdlIHRhYmxlIGNoZWNrCj4+Pj4gZmVhdHVyZSBvbiBuZXcgYXJjaGl0ZWN0dXJl
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3
ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8
IDEwIC0tLS0tLS0tLS0KPj4+PiAgICBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCAgICAgICAgfCAy
NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+Pj4+IGluZGV4IDhjZDY1MTRlMzA1Mi4uOGM4NWYyZWFiYmFhIDEwMDY0NAo+Pj4+IC0t
LSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4+ICsrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4+IEBAIC0xMDc3LDE2ICsxMDc3LDYgQEAgc3RhdGljIGlu
bGluZSBwdGVfdCBwdGVwX2dldF9hbmRfY2xlYXJfZnVsbChzdHJ1Y3QgbW1fc3RydWN0ICptbSwK
Pj4+PiAgICAgICAgICAgcmV0dXJuIHB0ZTsKPj4+PiAgICB9Cj4+Pj4KPj4+PiAtI2RlZmluZSBf
X0hBVkVfQVJDSF9QVEVQX0NMRUFSCj4+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX2NsZWFy
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXApCj4+Pj4gLXsKPj4+PiAtICAgICAgIGlm
IChJU19FTkFCTEVEKENPTkZJR19QQUdFX1RBQkxFX0NIRUNLKSkKPj4+PiAtICAgICAgICAgICAg
ICAgcHRlcF9nZXRfYW5kX2NsZWFyKG1tLCBhZGRyLCBwdGVwKTsKPj4+PiAtICAgICAgIGVsc2UK
Pj4+PiAtICAgICAgICAgICAgICAgcHRlX2NsZWFyKG1tLCBhZGRyLCBwdGVwKTsKPj4+PiAtfQo+
Pj4+IC0KPj4+PiAgICAjZGVmaW5lIF9fSEFWRV9BUkNIX1BURVBfU0VUX1dSUFJPVEVDVAo+Pj4+
ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX3NldF93cnByb3RlY3Qoc3RydWN0IG1tX3N0cnVj
dCAqbW0sCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXApCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPj4+PiBpbmRleCBmNGY0MDc3
Yjk3YWEuLmQyN2ZkMGVkODRhOSAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFi
bGUuaAo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4+Pj4gQEAgLTEyLDYgKzEy
LDcgQEAKPj4+PiAgICAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPGxp
bnV4L2Vycm5vLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGVfdWZmZC5o
Pgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvcGFnZV90YWJsZV9jaGVjay5oPgo+Pj4+Cj4+Pj4gICAg
I2lmIDUgLSBkZWZpbmVkKF9fUEFHRVRBQkxFX1A0RF9GT0xERUQpIC0gZGVmaW5lZChfX1BBR0VU
QUJMRV9QVURfRk9MREVEKSAtIFwKPj4+PiAgICAgICAgICAgZGVmaW5lZChfX1BBR0VUQUJMRV9Q
TURfRk9MREVEKSAhPSBDT05GSUdfUEdUQUJMRV9MRVZFTFMKPj4+PiBAQCAtMjU5LDE0ICsyNjAs
NiBAQCBzdGF0aWMgaW5saW5lIGludCBwbWRwX2NsZWFyX2ZsdXNoX3lvdW5nKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLAo+Pj4+ICAgICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVH
RVBBR0UgKi8KPj4+PiAgICAjZW5kaWYKPj4+Pgo+Pj4+IC0jaWZuZGVmIF9fSEFWRV9BUkNIX1BU
RVBfQ0xFQVIKPj4+PiAtc3RhdGljIGlubGluZSB2b2lkIHB0ZXBfY2xlYXIoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwdGVfdCAqcHRlcCkKPj4+PiAtewo+Pj4+IC0gICAgICAgcHRlX2NsZWFyKG1tLCBh
ZGRyLCBwdGVwKTsKPj4+PiAtfQo+Pj4+IC0jZW5kaWYKPj4+PiAtCj4+Pj4gICAgI2lmbmRlZiBf
X0hBVkVfQVJDSF9QVEVQX0dFVF9BTkRfQ0xFQVIKPj4+PiAgICBzdGF0aWMgaW5saW5lIHB0ZV90
IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPj4+
PiBAQCAtMjc0LDEwICsyNjcsMjMgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVwX2dldF9hbmRf
Y2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+Pj4gICAgewo+Pj4+ICAgICAgICAgICBwdGVf
dCBwdGUgPSAqcHRlcDsKPj4+PiAgICAgICAgICAgcHRlX2NsZWFyKG1tLCBhZGRyZXNzLCBwdGVw
KTsKPj4+PiArICAgICAgIHBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyKG1tLCBhZGRyZXNzLCBw
dGUpOwo+Pj4+ICAgICAgICAgICByZXR1cm4gcHRlOwo+Pj4+ICAgIH0KPj4+PiAgICAjZW5kaWYK
Pj4+Pgo+Pj4+ICsjaWZuZGVmIF9fSEFWRV9BUkNIX1BURVBfQ0xFQVIKPj4+PiArc3RhdGljIGlu
bGluZSB2b2lkIHB0ZXBfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcg
YWRkciwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdGVfdCAqcHRlcCkKPj4+
PiArewo+Pj4+ICsjaWZkZWYgQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sKPj4+PiArICAgICAgIHB0
ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRkciwgcHRlcCk7Cj4+Pj4gKyNlbHNlCj4+Pj4gKyAgICAg
ICBwdGVfY2xlYXIobW0sIGFkZHIsIHB0ZXApOwo+Pj4+ICsjZW5kaWYKPj4+Cj4+PiBJIGhhdmUg
YSBwcmVmZXJlbmNlIHRvIHVzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfUEFHRV9UQUJMRV9DSEVD
SykpCj4+PiBpbnN0ZWFkIG9mICNpZmRlZi4gVGhlIGVuZCByZXN1bHQgaXMgdGhlIHNhbWUuIE90
aGVyd2lzZSBpdCBsb29rcwo+Pj4gZ29vZC4KPj4+Cj4+PiBUaGFua3MsCj4+PiBQYXNoYQo+Pj4g
Lgo+Pgo+PiBJIGhhdmUgYSBsaXR0bGUgaGVzaXRhdGlvbiB3aGVuIG1ha2luZyB0aGlzIGNoYW5n
ZSAsIGluIHRoZW9yeSwgYWRkIGlmCj4+IGhlcmUgbWF5IGFmZmVjdCB0aGUgcGVyZm9ybWFuY2Ug
YSBsaXR0bGUgaW4gc29tZSBzY2VuYXJpb3MuIEhvd2V2ZXIsIHRoZQo+PiBpbXBhY3Qgb24gdGhl
IHdob2xlIGNhbGwgcGF0aCBzaG91bGQgYmUgc21hbGwuCj4gCj4gSSBkbyBub3QgdGhpbmsgc28s
IHRoZSBjb21waWxlciBzaG91bGQgb3B0aW1pemUgb3V0IElTX0VOQUJMRUQoKSB3aGVuCj4gbm90
IGVuYWJsZWQsIG5vPwo+IAoKWW91IGFyZSByaWdodC4KCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0CgpUaGUgY29tcGlsZXIg
d2lsbCBjb25zdGFudC1mb2xkIHRoZSBjb25kaXRpb25hbCBhd2F5LCBhbmQgaW5jbHVkZSBvciAK
ZXhjbHVkZSB0aGUgYmxvY2sgb2YgY29kZSBqdXN0IGFzIHdpdGggYW4gI2lmZGVmLCBzbyB0aGlz
IHdpbGwgKipub3QgYWRkIAphbnkgcnVudGltZSBvdmVyaGVhZCoqLgoKVGhhbmtzIDopCgo+Pgo+
PiBJIHdpbGwgc2VuZCB2MyB1c2luZyBpZiAoSVNfRU5BQkxFRChDT05GSUdfUEFHRV9UQUJMRV9D
SEVDSykpLgo+Pgo+PiBUaGFua3MuCj4+IFRvbmcKPj4gLgo+IC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
