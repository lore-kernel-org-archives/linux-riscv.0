Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A47C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 02:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2C7TUrq9P6nk2nyztwPuyU0dMjx6MvDS4HA/Gqt3Dg=; b=z+ILMBf4CHg5d0
	NhC/PCZ2+Vk7sY5WzvHTchoN74hRuPOGCanxF39vE6xPrrVcC0gLzzPeadwf3W/bUMbvVwCqWZkcd
	38WUShGeYtkwa0ObQ7w3KcIEja+2QgKjLS9lNOFyP7clSVeepuXPR0PKcoIPnsupBg8sZECad+FfA
	IZi2aE/wc4/1UDaETsE4FrcVAWzj+qRisuzT3bkPulqnSOvBXilXsAvhfePSSk9wtouJ2fJeh3waB
	1mmxuKCrskHoQtxedB39B448G9pY37BBt4TOW4coF/AtAwNFuJZBR8qkFnYjA5dpgWEkhUByWggNB
	FwKrD9ViuzXOfAeh+caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXCtc-00FOLi-4B; Thu, 24 Mar 2022 02:08:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXCtN-00FOEw-6b; Thu, 24 Mar 2022 02:08:03 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KP7qD2mtszCqsq;
 Thu, 24 Mar 2022 10:05:44 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Mar 2022 10:07:51 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Mar 2022 10:07:50 +0800
Message-ID: <0c95c24d-b980-a8b3-9c68-e10d16e05e10@huawei.com>
Date: Thu, 24 Mar 2022 10:07:49 +0800
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
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CA+CK2bAa96oE0FbtJUjAJ=vpuzQsW3R60K9SUhca6mZ3BL1f8w@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_190801_635656_89027A6B 
X-CRM114-Status: GOOD (  12.89  )
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

CgrlnKggMjAyMi8zLzI0IDE6NDIsIFBhc2hhIFRhdGFzaGluIOWGmemBkzoKPiBPbiBUdWUsIE1h
ciAyMiwgMjAyMiBhdCAxMDoyNSBBTSBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5j
b20+IHdyb3RlOgo+Pgo+PiBNb3ZlIHB0ZXBfY2xlYXIoKSB0byB0aGUgaW5jbHVkZS9saW51eC9w
Z3RhYmxlLmggYW5kIGFkZCBwYWdlIHRhYmxlIGNoZWNrCj4+IHJlbGF0ZSBob29rcyB0byBzb21l
IGhlbHBlcnMsIGl0J3MgcHJlcGFyZSBmb3Igc3VwcG9ydCBwYWdlIHRhYmxlIGNoZWNrCj4+IGZl
YXR1cmUgb24gbmV3IGFyY2hpdGVjdHVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVG9uZyBUaWFu
Z2VuIDx0b25ndGlhbmdlbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggfCAxMCAtLS0tLS0tLS0tCj4+ICAgaW5jbHVkZS9saW51eC9wZ3RhYmxl
LmggICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+PiBpbmRleCA4Y2Q2NTE0ZTMwNTIuLjhjODVmMmVhYmJhYSAxMDA2NDQKPj4g
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+PiBAQCAtMTA3NywxNiArMTA3Nyw2IEBAIHN0YXRpYyBpbmxp
bmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyX2Z1bGwoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+
ICAgICAgICAgIHJldHVybiBwdGU7Cj4+ICAgfQo+Pgo+PiAtI2RlZmluZSBfX0hBVkVfQVJDSF9Q
VEVQX0NMRUFSCj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgcHRlcF9jbGVhcihzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwdGVfdCAqcHRlcCkKPj4gLXsKPj4gLSAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdf
UEFHRV9UQUJMRV9DSEVDSykpCj4+IC0gICAgICAgICAgICAgICBwdGVwX2dldF9hbmRfY2xlYXIo
bW0sIGFkZHIsIHB0ZXApOwo+PiAtICAgICAgIGVsc2UKPj4gLSAgICAgICAgICAgICAgIHB0ZV9j
bGVhcihtbSwgYWRkciwgcHRlcCk7Cj4+IC19Cj4+IC0KPj4gICAjZGVmaW5lIF9fSEFWRV9BUkNI
X1BURVBfU0VUX1dSUFJPVEVDVAo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX3NldF93cnBy
b3RlY3Qoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXApCj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4+
IGluZGV4IGY0ZjQwNzdiOTdhYS4uZDI3ZmQwZWQ4NGE5IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3BndGFibGUuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+PiBAQCAt
MTIsNiArMTIsNyBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9idWcuaD4KPj4gICAjaW5jbHVkZSA8
bGludXgvZXJybm8uaD4KPj4gICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvcGd0YWJsZV91ZmZkLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvcGFnZV90YWJsZV9jaGVjay5oPgo+Pgo+PiAgICNpZiA1IC0g
ZGVmaW5lZChfX1BBR0VUQUJMRV9QNERfRk9MREVEKSAtIGRlZmluZWQoX19QQUdFVEFCTEVfUFVE
X0ZPTERFRCkgLSBcCj4+ICAgICAgICAgIGRlZmluZWQoX19QQUdFVEFCTEVfUE1EX0ZPTERFRCkg
IT0gQ09ORklHX1BHVEFCTEVfTEVWRUxTCj4+IEBAIC0yNTksMTQgKzI2MCw2IEBAIHN0YXRpYyBp
bmxpbmUgaW50IHBtZHBfY2xlYXJfZmx1c2hfeW91bmcoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsCj4+ICAgI2VuZGlmIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAqLwo+PiAgICNl
bmRpZgo+Pgo+PiAtI2lmbmRlZiBfX0hBVkVfQVJDSF9QVEVQX0NMRUFSCj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgcHRlcF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdGVfdCAqcHRlcCkKPj4gLXsK
Pj4gLSAgICAgICBwdGVfY2xlYXIobW0sIGFkZHIsIHB0ZXApOwo+PiAtfQo+PiAtI2VuZGlmCj4+
IC0KPj4gICAjaWZuZGVmIF9fSEFWRV9BUkNIX1BURVBfR0VUX0FORF9DTEVBUgo+PiAgIHN0YXRp
YyBpbmxpbmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBh
ZGRyZXNzLAo+PiBAQCAtMjc0LDEwICsyNjcsMjMgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVw
X2dldF9hbmRfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+ICAgewo+PiAgICAgICAgICBw
dGVfdCBwdGUgPSAqcHRlcDsKPj4gICAgICAgICAgcHRlX2NsZWFyKG1tLCBhZGRyZXNzLCBwdGVw
KTsKPj4gKyAgICAgICBwYWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhcihtbSwgYWRkcmVzcywgcHRl
KTsKPj4gICAgICAgICAgcmV0dXJuIHB0ZTsKPj4gICB9Cj4+ICAgI2VuZGlmCj4+Cj4+ICsjaWZu
ZGVmIF9fSEFWRV9BUkNIX1BURVBfQ0xFQVIKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwdGVwX2Ns
ZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHB0ZV90ICpwdGVwKQo+PiArewo+PiArI2lmZGVmIENPTkZJ
R19QQUdFX1RBQkxFX0NIRUNLCj4+ICsgICAgICAgcHRlcF9nZXRfYW5kX2NsZWFyKG1tLCBhZGRy
LCBwdGVwKTsKPj4gKyNlbHNlCj4+ICsgICAgICAgcHRlX2NsZWFyKG1tLCBhZGRyLCBwdGVwKTsK
Pj4gKyNlbmRpZgo+IAo+IEkgaGF2ZSBhIHByZWZlcmVuY2UgdG8gdXNlIGlmIChJU19FTkFCTEVE
KENPTkZJR19QQUdFX1RBQkxFX0NIRUNLKSkKPiBpbnN0ZWFkIG9mICNpZmRlZi4gVGhlIGVuZCBy
ZXN1bHQgaXMgdGhlIHNhbWUuIE90aGVyd2lzZSBpdCBsb29rcwo+IGdvb2QuCj4gCj4gVGhhbmtz
LAo+IFBhc2hhCj4gLgoKSSBoYXZlIGEgbGl0dGxlIGhlc2l0YXRpb24gd2hlbiBtYWtpbmcgdGhp
cyBjaGFuZ2UgLCBpbiB0aGVvcnksIGFkZCBpZiAKaGVyZSBtYXkgYWZmZWN0IHRoZSBwZXJmb3Jt
YW5jZSBhIGxpdHRsZSBpbiBzb21lIHNjZW5hcmlvcy4gSG93ZXZlciwgdGhlIAppbXBhY3Qgb24g
dGhlIHdob2xlIGNhbGwgcGF0aCBzaG91bGQgYmUgc21hbGwuCgpJIHdpbGwgc2VuZCB2MyB1c2lu
ZyBpZiAoSVNfRU5BQkxFRChDT05GSUdfUEFHRV9UQUJMRV9DSEVDSykpLgoKVGhhbmtzLgpUb25n
Ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
