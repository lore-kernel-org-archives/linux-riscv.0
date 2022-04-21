Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B47EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 06:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYiocK0TLJ+xRbZI1Vshn6S97DbnBS83Z8KhvsKaSbQ=; b=agNMi5qf+RodqU
	65cUAjWQYYdDz4KTRbXwycyvPW1/Fqpm5jUY2x0K/X8qVrD9QvlJrujHFGVNLY85Gq19aVqblNi2y
	P/zMIg2fxda0BHAI5uFfDaSzAwnXGJn4xluFecno+lpY4q094pZ4ELreW+Br/ZJfeTNHQfH3EIW2s
	B+jS726PMXLd8Ea+oVZQ8EN52DOspbcEmvJIOXxoWNrk66mpdTx2blye3FhSjhPPsazDlEpm1mn6Y
	kB7uH61tnCRcVPC7K8s0pmd7BrllL6F8pKcnRx7VxLIDh/p+Y2uUoCvhl9SF74OM4uDDKmONCq840
	yUMniyhwC3K0xZTWggbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQHq-00Biix-J0; Thu, 21 Apr 2022 06:27:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQHc-00Bicb-9Y; Thu, 21 Apr 2022 06:27:18 +0000
Received: from kwepemi500017.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KkSH32BTGzfYw0;
 Thu, 21 Apr 2022 14:26:23 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500017.china.huawei.com (7.221.188.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 14:27:09 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 14:27:07 +0800
Message-ID: <f6f0646d-7acc-0e2e-9aea-3910a5546dd3@huawei.com>
Date: Thu, 21 Apr 2022 14:27:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
To: Anshuman Khandual <anshuman.khandual@arm.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
 <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
 <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
 <CA+CK2bCF=7mADB=rxyHtVEd3oCZ4mxtKf=28L49uQr5oxUwYZQ@mail.gmail.com>
 <eec38afc-4ecc-29f8-9d8a-722661c30314@huawei.com>
 <75f444a6-4f50-4356-9e71-f72c59bf0a52@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <75f444a6-4f50-4356-9e71-f72c59bf0a52@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_232716_780413_86CD111A 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

CgrlnKggMjAyMi80LzIxIDExOjQ0LCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gCj4gCj4g
T24gNC8yMS8yMiAwODozNSwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+Pgo+Pgo+PiDlnKggMjAyMi80
LzIxIDA6NDQsIFBhc2hhIFRhdGFzaGluIOWGmemBkzoKPj4+IE9uIFdlZCwgQXByIDIwLCAyMDIy
IGF0IDI6NDUgQU0gVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3ZWkuY29tPiB3cm90ZToK
Pj4+Pgo+Pj4+Cj4+Pj4KPj4+PiDlnKggMjAyMi80LzE5IDE3OjI5LCBBbnNodW1hbiBLaGFuZHVh
bCDlhpnpgZM6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDQvMTgvMjIgMDk6MTQsIFRvbmcgVGlhbmdl
biB3cm90ZToKPj4+Pj4+IC0tLSBhL21tL3BhZ2VfdGFibGVfY2hlY2suYwo+Pj4+Pj4gKysrIGIv
bW0vcGFnZV90YWJsZV9jaGVjay5jCj4+Pj4+PiBAQCAtMTAsNiArMTAsMTQgQEAKPj4+Pj4+ICDC
oMKgICN1bmRlZiBwcl9mbXQKPj4+Pj4+ICDCoMKgICNkZWZpbmUgcHJfZm10KGZtdCnCoMKgwqDC
oMKgwqDCoCAicGFnZV90YWJsZV9jaGVjazogIiBmbXQKPj4+Pj4+Cj4+Pj4+PiArI2lmbmRlZiBQ
TURfUEFHRV9TSVpFCj4+Pj4+PiArI2RlZmluZSBQTURfUEFHRV9TSVpFwqDCoMKgwqDCoMKgIFBN
RF9TSVpFCj4+Pj4+PiArI2VuZGlmCj4+Pj4+PiArCj4+Pj4+PiArI2lmbmRlZiBQVURfUEFHRV9T
SVpFCj4+Pj4+PiArI2RlZmluZSBQVURfUEFHRV9TSVpFwqDCoMKgwqDCoMKgIFBVRF9TSVpFCj4+
Pj4+PiArI2VuZGlmCj4+Pj4+Cj4+Pj4+IFdoeSBjYW5ub3QgUE1EX1NJWkUvUFVEX1NJWkUgYmUg
dXNlZCBvbiBldmVyeSBwbGF0Zm9ybSBpbnN0ZWFkID8gV2hhdCBpcyB0aGUKPj4+Pj4gbmVlZCBm
b3IgdXNpbmcgUFVEX1BBR0VfU0laRS9QTURfUEFHRV9TSVpFID8gQXJlIHRoZXkgZGlmZmVyZW50
IG9uIHg4NiA/Cj4+Pj4+IC4KPj4+Pgo+Pj4+IEhpLCBQYXNoYe+8mgo+Pj4+IEkgY2hlY2tlZCB0
aGUgZGVmaW5pdGlvbnMgb2YgUE1EX1NJWkUvUFVEX1NJWkUgYW5kCj4+Pj4gUFVEX1BBR0VfU0la
RS9QTURfUEFHRV9TSVpFIGluIHg4NiBhcmNoaXRlY3R1cmUgYW5kIHRoZWlyIHVzZSBvdXRzaWRl
Cj4+Pj4gdGhlIGFyY2hpdGVjdHVyZShlZzogaW4gbW0vLCBhbGwgdXNlZCBQTURfU0laRS9QVURf
U0laRSksIFdvdWxkIGl0IGJlCj4+Pj4gYmV0dGVyIHRvIHVzZSBhIHVuaWZpZWQgUE1EX1NJWkUv
UFVEX1NJWkUgaGVyZT8KPj4+Cj4+PiBIaSBUb25nLAo+Pj4KPj4+IFllcywgaXQgbWFrZXMgc2Vu
c2UgdG8gdXNlIFBNRF9TSVpFL1BVRF9TSVpFIGluc3RlYWQgb2YKPj4+IFBVRF9QQUdFX1NJWkUv
UE1EX1BBR0VfU0laRSBpbiBwYWdlX3RhYmxlX2NoZWNrIHRvIGJlIGlubGluZSB3aXRoIHRoZQo+
Pj4gcmVzdCBvZiB0aGUgbW0vCj4+Pgo+Pj4gUGFzaGEKPj4+Cj4+IEhpIFBhc2hhIGFuZCBBbnNo
dW1hbjoKPj4KPj4gT0ssIEZ1bmN0aW9uYWwgY29ycmVjdG5lc3MgaXMgbm90IGFmZmVjdGVkIGhl
cmUsIGkgcGxhbiB0byBvcHRpbWl6ZSB0aGlzIHBvaW50IGFmdGVyIHRoaXMgcGF0Y2hzZXQgaXMg
bWVyZ2VkLgo+IAo+IEFzIHBhZ2UgdGFibGUgY2hlY2sgaXMgbm93IGJlaW5nIHByb3Bvc2VkIHRv
IGJlIHN1cHBvcnRlZCBvbiBtdWx0aXBsZSBwbGF0Zm9ybXMgaS5lCj4gYXJtNjQsIHJpc2N2IGJl
c2lkZXMganVzdCB4ODYsIGl0IHNob3VsZCBub3QgaGF2ZSBhbnkgYXJjaGl0ZWN0dXJlIHNwZWNp
ZmljIG1hY3Jvcwo+IG9yIGZ1bmN0aW9ucy4gSGVuY2UgcGxlYXNlIGRvIGdlbmVyYWxpemUgdGhl
c2UgUE1EL1BVRCBzaXplcyBpbiB0aGlzIHNlcmllcyBpdHNlbGYuCj4gLgoKT0ssIHdpbGwgcmVz
ZW5kLgoKVGhhbmsgeW91LgpUb25nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
