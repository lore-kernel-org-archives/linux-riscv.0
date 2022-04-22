Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239F5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MANwdvXNdYVma04nF4FolMkDu/AEPGhAWyXprUc67EY=; b=JXe1anY0Px+Oqf
	QNOKkL42ONxBGz571jl3gu2XX8uX3i2cF7opv/8Z1DgKU5ckZBuhG+pVrbwSnjRKRY+pEZhhxRdmA
	nncQDhb7Qj8gkaIXRQkuGGj/vjx9fRrq/0YJQ+sQIA3WyP8TykcNXQssTJBI+zKzPWHmHxzb1wapU
	mc8cgAru2Retv0/VDPwU1I9EiJf2SlqHCsU4XwwNvO0D5jIJR//PBdUEU1IKeMV2RSwhzkiH4ZjSY
	zwNJM97ElsOEeYPMrhztOI0HTYShej4TpXJe5M3lxyURyCwnFxGt01uaD0U9oi2c1V/SG9ccaQfnU
	1oQqf2F52uHK8nhLVMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmqn-00GZol-RX; Fri, 22 Apr 2022 06:33:06 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmo1-00GYSZ-Uc; Fri, 22 Apr 2022 06:30:16 +0000
Received: from kwepemi100023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Kl4Hy5T8mz1J9m3;
 Fri, 22 Apr 2022 14:29:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100023.china.huawei.com (7.221.188.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 14:30:05 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 14:30:04 +0800
Message-ID: <10215555-5eb6-d53d-5949-d603ce346d6f@huawei.com>
Date: Fri, 22 Apr 2022 14:30:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 2/5] mm: page_table_check: move
 pxx_user_accessible_page into x86
To: Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-3-tongtiangen@huawei.com>
 <905f22d6-0671-21b2-a341-bdc5ba02e59c@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <905f22d6-0671-21b2-a341-bdc5ba02e59c@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_233014_389012_A486FC30 
X-CRM114-Status: GOOD (  15.24  )
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

CgrlnKggMjAyMi80LzIyIDEzOjExLCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gU2ltaWxh
ciB0byBwcmV2aW91cyBjb21taXRzIG9uIHRoZSBzYW1lIGZpbGUsIHRoZSBmb2xsb3dpbmcgc3Vi
amVjdAo+IGxpbmUgZm9ybWF0LCB3b3VsZCBoYXZlIGJlZW4gcHJlZmVycmVkLgo+IAo+IG1tL3Bh
Z2VfdGFibGVfY2hlY2s6IDxkZXNjcmlwdGlvbj4KPiAKPiBPbiA0LzIxLzIyIDEzOjUwLCBUb25n
IFRpYW5nZW4gd3JvdGU6Cj4+IEZyb206IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KPj4KPj4gVGhlIHB4eF91c2VyX2FjY2Vzc2libGVfcGFnZSgpIGNoZWNrIHRoZSBQ
VEUgYml0LCBpdCdzCj4gCj4gcy9jaGVjay9jaGVja3MJCQkgXl5eXgo+IAo+PiBhcmNoaXRlY3R1
cmUtc3BlY2lmaWMgY29kZSwgbW92ZSB0aGVtIGludG8geDg2J3MgcGd0YWJsZS5oCj4gVGhlIGNv
bW1pdCBtZXNzYWdlIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBjbGVhciwgYXRsZWFzdCBjb21wbGV0
ZSBpbgo+IHNlbnRlbmNlcy4gSSBkb250IHdhbnQgdG8gYmUgYmlrZSBzaGVkZGluZyBoZXJlIGJ1
dCB0aGlzIGlzIGRlZmluaXRlbHkKPiBpbmNvbXBsZXRlLiBUaGVzZSBoZWxwZXJzIGFyZSBiZWlu
ZyBtb3ZlZCBvdXQgdG8gbWFrZSB0aGUgcGFnZSB0YWJsZQo+IGNoZWNrIGZyYW1ld29yaywgcGxh
dGZvcm0gaW5kZXBlbmRlbnQuIEhlbmNlIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQKPiBtZW50
aW9uIHRoaXMuCgpUaGUgY29tbWl0IG1lc3NhZ2UgaXMgbm90IHZlcnkgY2xlYXIgYW5kIGl0IGlz
IHRvbyBzaW1wbGUuCgpUaGFua3MuCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2Fu
ZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFRvbmcgVGlh
bmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4KPj4gQWNrZWQtYnk6IFBhc2hhIFRhdGFzaGlu
IDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggfCAxOSArKysrKysrKysrKysrKysrKysrCj4+ICAgbW0vcGFnZV90YWJs
ZV9jaGVjay5jICAgICAgICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4+IGluZGV4IGI3NDY0ZjEzZTQxNi4uNTY0YWJlNDJiMGY3IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gKysrIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4+IEBAIC0xNDQ3LDYgKzE0NDcsMjUgQEAgc3RhdGljIGlubGlu
ZSBib29sIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyh2b2lkKQo+PiAgIAlyZXR1cm4gdHJ1ZTsKPj4g
ICB9Cj4+ICAgCj4+ICsjaWZkZWYgQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sKPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlKQo+PiArewo+PiAr
CXJldHVybiAocHRlX3ZhbChwdGUpICYgX1BBR0VfUFJFU0VOVCkgJiYgKHB0ZV92YWwocHRlKSAm
IF9QQUdFX1VTRVIpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX3VzZXJf
YWNjZXNzaWJsZV9wYWdlKHBtZF90IHBtZCkKPj4gK3sKPj4gKwlyZXR1cm4gcG1kX2xlYWYocG1k
KSAmJiAocG1kX3ZhbChwbWQpICYgX1BBR0VfUFJFU0VOVCkgJiYKPj4gKwkJKHBtZF92YWwocG1k
KSAmIF9QQUdFX1VTRVIpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkKPj4gK3sKPj4gKwlyZXR1cm4gcHVkX2xlYWYo
cHVkKSAmJiAocHVkX3ZhbChwdWQpICYgX1BBR0VfUFJFU0VOVCkgJiYKPj4gKwkJKHB1ZF92YWwo
cHVkKSAmIF9QQUdFX1VTRVIpOwo+IAo+IEEgbGluZSBicmVhayBpcyBub3QgcmVhbGx5IHJlcXVp
cmVkIGhlcmUgKGFuZCBhYm92ZSBhcyB3ZWxsKS4gQXMgc2luZ2xlCj4gY29tcGxldGUgbGluZSB3
b3VsZCBzdGlsbCBiZSB3aXRoaW4gMTAwIGNoYXJhY3RlcnMuCj4gClJpZ2h0LCBub3cgb25lIGxp
bmUgY2FuIGhhdmUgMTAwIGNoYXJhY3RlcnMuCgpUaGFua3MuCgo+PiArfQo+PiArI2VuZGlmCj4+
ICsKPj4gICAjZW5kaWYJLyogX19BU1NFTUJMWV9fICovCj4+ICAgCj4+ICAgI2VuZGlmIC8qIF9B
U01fWDg2X1BHVEFCTEVfSCAqLwo+PiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV90YWJsZV9jaGVjay5j
IGIvbW0vcGFnZV90YWJsZV9jaGVjay5jCj4+IGluZGV4IGViMGQwYjcxY2RmNi4uMzY5MmJlYTJl
YTJjIDEwMDY0NAo+PiAtLS0gYS9tbS9wYWdlX3RhYmxlX2NoZWNrLmMKPj4gKysrIGIvbW0vcGFn
ZV90YWJsZV9jaGVjay5jCj4+IEBAIC01MiwyMyArNTIsNiBAQCBzdGF0aWMgc3RydWN0IHBhZ2Vf
dGFibGVfY2hlY2sgKmdldF9wYWdlX3RhYmxlX2NoZWNrKHN0cnVjdCBwYWdlX2V4dCAqcGFnZV9l
eHQpCj4+ICAgCXJldHVybiAodm9pZCAqKShwYWdlX2V4dCkgKyBwYWdlX3RhYmxlX2NoZWNrX29w
cy5vZmZzZXQ7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyX2Fj
Y2Vzc2libGVfcGFnZShwdGVfdCBwdGUpCj4+IC17Cj4+IC0JcmV0dXJuIChwdGVfdmFsKHB0ZSkg
JiBfUEFHRV9QUkVTRU5UKSAmJiAocHRlX3ZhbChwdGUpICYgX1BBR0VfVVNFUik7Cj4+IC19Cj4+
IC0KPj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocG1kX3Qg
cG1kKQo+PiAtewo+PiAtCXJldHVybiBwbWRfbGVhZihwbWQpICYmIChwbWRfdmFsKHBtZCkgJiBf
UEFHRV9QUkVTRU5UKSAmJgo+PiAtCQkocG1kX3ZhbChwbWQpICYgX1BBR0VfVVNFUik7Cj4+IC19
Cj4+IC0KPj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVk
X3QgcHVkKQo+PiAtewo+PiAtCXJldHVybiBwdWRfbGVhZihwdWQpICYmIChwdWRfdmFsKHB1ZCkg
JiBfUEFHRV9QUkVTRU5UKSAmJgo+PiAtCQkocHVkX3ZhbChwdWQpICYgX1BBR0VfVVNFUik7Cj4+
IC19Cj4+IC0KPj4gICAvKgo+PiAgICAqIEFuIGVudHkgaXMgcmVtb3ZlZCBmcm9tIHRoZSBwYWdl
IHRhYmxlLCBkZWNyZW1lbnQgdGhlIGNvdW50ZXJzIGZvciB0aGF0IHBhZ2UKPj4gICAgKiB2ZXJp
ZnkgdGhhdCBpdCBpcyBvZiBjb3JyZWN0IHR5cGUgYW5kIGNvdW50ZXJzIGRvIG5vdCBiZWNvbWUg
bmVnYXRpdmUuCj4gCj4gV2l0aCBhYm92ZSBtZW50aW9uZWQgY29kZSBjbGVhbnVwIGFuZCBjb21t
aXQgbWVzc2FnZSBjaGFuZ2VzIGluIHBsYWNlLgo+IAo+IFJldmlld2VkLWJ5OiBBbnNodW1hbiBL
aGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPiAuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
