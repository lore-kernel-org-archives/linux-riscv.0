Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 03:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUzHqHgJucfNuk/eGK6PAJpDwmKl0Hg0uQIsxjLi/DM=; b=AuTuWcBamPs0lE
	r7uowmSKos3j771Rw03rBxlIIWnFWhuwME64+YaKlPOHDC7OP1xhZG9uQzD0wZ5699zqpk7piOpPL
	ia49g/aH6DqMRT4gSFVtrRRNlQ1m/dfxzU8O/AGDHcRJ+dGEmg1PIv5hunB5C/nsP/WAIWCBV6p6E
	tqsea45RGO9QFck2t8lhjIskktnn6K9MCi4sAN3m6CLsNfmTGM2yL+rFVG5qswv6vTLltwLs+KSB/
	r5F/Ja1tK7bATghekvQ+7j/24HzVxR2ErNwxmFy0JjWX80+mdzG/+nHFSuPtPeQaDS3aS6pTMmY5o
	DMUulxCNbp/GV+mcecUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhN9I-00BHKl-PZ; Thu, 21 Apr 2022 03:06:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhN97-00BHHc-Ld; Thu, 21 Apr 2022 03:06:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KkMpx4VcFzfYpj;
 Thu, 21 Apr 2022 11:05:13 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 11:05:59 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 11:05:58 +0800
Message-ID: <eec38afc-4ecc-29f8-9d8a-722661c30314@huawei.com>
Date: Thu, 21 Apr 2022 11:05:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
To: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, linux-mm
 <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
 <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
 <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
 <CA+CK2bCF=7mADB=rxyHtVEd3oCZ4mxtKf=28L49uQr5oxUwYZQ@mail.gmail.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CA+CK2bCF=7mADB=rxyHtVEd3oCZ4mxtKf=28L49uQr5oxUwYZQ@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_200617_901709_620B203D 
X-CRM114-Status: GOOD (  10.10  )
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

CgrlnKggMjAyMi80LzIxIDA6NDQsIFBhc2hhIFRhdGFzaGluIOWGmemBkzoKPiBPbiBXZWQsIEFw
ciAyMCwgMjAyMiBhdCAyOjQ1IEFNIFRvbmcgVGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNv
bT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IOWcqCAyMDIyLzQvMTkgMTc6MjksIEFuc2h1bWFuIEtoYW5k
dWFsIOWGmemBkzoKPj4+Cj4+Pgo+Pj4gT24gNC8xOC8yMiAwOToxNCwgVG9uZyBUaWFuZ2VuIHdy
b3RlOgo+Pj4+IC0tLSBhL21tL3BhZ2VfdGFibGVfY2hlY2suYwo+Pj4+ICsrKyBiL21tL3BhZ2Vf
dGFibGVfY2hlY2suYwo+Pj4+IEBAIC0xMCw2ICsxMCwxNCBAQAo+Pj4+ICAgICN1bmRlZiBwcl9m
bXQKPj4+PiAgICAjZGVmaW5lIHByX2ZtdChmbXQpICAgICAgICAicGFnZV90YWJsZV9jaGVjazog
IiBmbXQKPj4+Pgo+Pj4+ICsjaWZuZGVmIFBNRF9QQUdFX1NJWkUKPj4+PiArI2RlZmluZSBQTURf
UEFHRV9TSVpFICAgICAgIFBNRF9TSVpFCj4+Pj4gKyNlbmRpZgo+Pj4+ICsKPj4+PiArI2lmbmRl
ZiBQVURfUEFHRV9TSVpFCj4+Pj4gKyNkZWZpbmUgUFVEX1BBR0VfU0laRSAgICAgICBQVURfU0la
RQo+Pj4+ICsjZW5kaWYKPj4+Cj4+PiBXaHkgY2Fubm90IFBNRF9TSVpFL1BVRF9TSVpFIGJlIHVz
ZWQgb24gZXZlcnkgcGxhdGZvcm0gaW5zdGVhZCA/IFdoYXQgaXMgdGhlCj4+PiBuZWVkIGZvciB1
c2luZyBQVURfUEFHRV9TSVpFL1BNRF9QQUdFX1NJWkUgPyBBcmUgdGhleSBkaWZmZXJlbnQgb24g
eDg2ID8KPj4+IC4KPj4KPj4gSGksIFBhc2hh77yaCj4+IEkgY2hlY2tlZCB0aGUgZGVmaW5pdGlv
bnMgb2YgUE1EX1NJWkUvUFVEX1NJWkUgYW5kCj4+IFBVRF9QQUdFX1NJWkUvUE1EX1BBR0VfU0la
RSBpbiB4ODYgYXJjaGl0ZWN0dXJlIGFuZCB0aGVpciB1c2Ugb3V0c2lkZQo+PiB0aGUgYXJjaGl0
ZWN0dXJlKGVnOiBpbiBtbS8sIGFsbCB1c2VkIFBNRF9TSVpFL1BVRF9TSVpFKSwgV291bGQgaXQg
YmUKPj4gYmV0dGVyIHRvIHVzZSBhIHVuaWZpZWQgUE1EX1NJWkUvUFVEX1NJWkUgaGVyZT8KPiAK
PiBIaSBUb25nLAo+IAo+IFllcywgaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIFBNRF9TSVpFL1BVRF9T
SVpFIGluc3RlYWQgb2YKPiBQVURfUEFHRV9TSVpFL1BNRF9QQUdFX1NJWkUgaW4gcGFnZV90YWJs
ZV9jaGVjayB0byBiZSBpbmxpbmUgd2l0aCB0aGUKPiByZXN0IG9mIHRoZSBtbS8KPiAKPiBQYXNo
YQo+IApIaSBQYXNoYSBhbmQgQW5zaHVtYW46CgpPSywgRnVuY3Rpb25hbCBjb3JyZWN0bmVzcyBp
cyBub3QgYWZmZWN0ZWQgaGVyZSwgaSBwbGFuIHRvIG9wdGltaXplIHRoaXMgCnBvaW50IGFmdGVy
IHRoaXMgcGF0Y2hzZXQgaXMgbWVyZ2VkLgoKVG9uZy4KCj4+Cj4+IFRoYW5rcywKPj4gVG9uZy4K
PiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
