Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C260FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 03:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHBcydym+IQBzev8GSESHFb1mP8eL/qKstD9XhuDFC8=; b=SWHUi7DO5CMmU3
	nR+GEtMnfsSY8f/cKdI0isiPOjzQLu/HD62soeyXdJ91kl2AEHVtLEQEM3o0QxLJkNvuqS1Ph1emq
	4jeJ+Pz2FIyONueX37l4WBb2mBcPLJ96fsK35xldcWCNiL7sQVGgo1zcjbKks0qQrpnZDt8Duu7ZI
	Lb3A4ZcRNLlrYxIHd2O/vTLd52lImH319BJmWJNUpcdxku0cUBTNTh4Ewco012uZsHhCBj4N8NZwM
	8P4XexbwqC4pa9797CcPQ/6dfRLkmhPaQfOtPm9/IDJxCrZu7Ii3dSyYNOVWMzFh3DMmEysOOghrM
	cYTfbJIEoxtfxxwDHKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhNkF-00BLlM-N8; Thu, 21 Apr 2022 03:44:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhNk4-00BLhh-1k; Thu, 21 Apr 2022 03:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5488E1477;
 Wed, 20 Apr 2022 20:44:23 -0700 (PDT)
Received: from [192.168.225.231] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 441B93F766;
 Wed, 20 Apr 2022 20:44:15 -0700 (PDT)
Message-ID: <75f444a6-4f50-4356-9e71-f72c59bf0a52@arm.com>
Date: Thu, 21 Apr 2022 09:14:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
 <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
 <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
 <CA+CK2bCF=7mADB=rxyHtVEd3oCZ4mxtKf=28L49uQr5oxUwYZQ@mail.gmail.com>
 <eec38afc-4ecc-29f8-9d8a-722661c30314@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <eec38afc-4ecc-29f8-9d8a-722661c30314@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_204428_171399_50391D75 
X-CRM114-Status: GOOD (  13.19  )
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

CgpPbiA0LzIxLzIyIDA4OjM1LCBUb25nIFRpYW5nZW4gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjIv
NC8yMSAwOjQ0LCBQYXNoYSBUYXRhc2hpbiDlhpnpgZM6Cj4+IE9uIFdlZCwgQXByIDIwLCAyMDIy
IGF0IDI6NDUgQU0gVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3ZWkuY29tPiB3cm90ZToK
Pj4+Cj4+Pgo+Pj4KPj4+IOWcqCAyMDIyLzQvMTkgMTc6MjksIEFuc2h1bWFuIEtoYW5kdWFsIOWG
memBkzoKPj4+Pgo+Pj4+Cj4+Pj4gT24gNC8xOC8yMiAwOToxNCwgVG9uZyBUaWFuZ2VuIHdyb3Rl
Ogo+Pj4+PiAtLS0gYS9tbS9wYWdlX3RhYmxlX2NoZWNrLmMKPj4+Pj4gKysrIGIvbW0vcGFnZV90
YWJsZV9jaGVjay5jCj4+Pj4+IEBAIC0xMCw2ICsxMCwxNCBAQAo+Pj4+PiDCoMKgICN1bmRlZiBw
cl9mbXQKPj4+Pj4gwqDCoCAjZGVmaW5lIHByX2ZtdChmbXQpwqDCoMKgwqDCoMKgwqAgInBhZ2Vf
dGFibGVfY2hlY2s6ICIgZm10Cj4+Pj4+Cj4+Pj4+ICsjaWZuZGVmIFBNRF9QQUdFX1NJWkUKPj4+
Pj4gKyNkZWZpbmUgUE1EX1BBR0VfU0laRcKgwqDCoMKgwqDCoCBQTURfU0laRQo+Pj4+PiArI2Vu
ZGlmCj4+Pj4+ICsKPj4+Pj4gKyNpZm5kZWYgUFVEX1BBR0VfU0laRQo+Pj4+PiArI2RlZmluZSBQ
VURfUEFHRV9TSVpFwqDCoMKgwqDCoMKgIFBVRF9TSVpFCj4+Pj4+ICsjZW5kaWYKPj4+Pgo+Pj4+
IFdoeSBjYW5ub3QgUE1EX1NJWkUvUFVEX1NJWkUgYmUgdXNlZCBvbiBldmVyeSBwbGF0Zm9ybSBp
bnN0ZWFkID8gV2hhdCBpcyB0aGUKPj4+PiBuZWVkIGZvciB1c2luZyBQVURfUEFHRV9TSVpFL1BN
RF9QQUdFX1NJWkUgPyBBcmUgdGhleSBkaWZmZXJlbnQgb24geDg2ID8KPj4+PiAuCj4+Pgo+Pj4g
SGksIFBhc2hh77yaCj4+PiBJIGNoZWNrZWQgdGhlIGRlZmluaXRpb25zIG9mIFBNRF9TSVpFL1BV
RF9TSVpFIGFuZAo+Pj4gUFVEX1BBR0VfU0laRS9QTURfUEFHRV9TSVpFIGluIHg4NiBhcmNoaXRl
Y3R1cmUgYW5kIHRoZWlyIHVzZSBvdXRzaWRlCj4+PiB0aGUgYXJjaGl0ZWN0dXJlKGVnOiBpbiBt
bS8sIGFsbCB1c2VkIFBNRF9TSVpFL1BVRF9TSVpFKSwgV291bGQgaXQgYmUKPj4+IGJldHRlciB0
byB1c2UgYSB1bmlmaWVkIFBNRF9TSVpFL1BVRF9TSVpFIGhlcmU/Cj4+Cj4+IEhpIFRvbmcsCj4+
Cj4+IFllcywgaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIFBNRF9TSVpFL1BVRF9TSVpFIGluc3RlYWQg
b2YKPj4gUFVEX1BBR0VfU0laRS9QTURfUEFHRV9TSVpFIGluIHBhZ2VfdGFibGVfY2hlY2sgdG8g
YmUgaW5saW5lIHdpdGggdGhlCj4+IHJlc3Qgb2YgdGhlIG1tLwo+Pgo+PiBQYXNoYQo+Pgo+IEhp
IFBhc2hhIGFuZCBBbnNodW1hbjoKPiAKPiBPSywgRnVuY3Rpb25hbCBjb3JyZWN0bmVzcyBpcyBu
b3QgYWZmZWN0ZWQgaGVyZSwgaSBwbGFuIHRvIG9wdGltaXplIHRoaXMgcG9pbnQgYWZ0ZXIgdGhp
cyBwYXRjaHNldCBpcyBtZXJnZWQuCgpBcyBwYWdlIHRhYmxlIGNoZWNrIGlzIG5vdyBiZWluZyBw
cm9wb3NlZCB0byBiZSBzdXBwb3J0ZWQgb24gbXVsdGlwbGUgcGxhdGZvcm1zIGkuZQphcm02NCwg
cmlzY3YgYmVzaWRlcyBqdXN0IHg4NiwgaXQgc2hvdWxkIG5vdCBoYXZlIGFueSBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgbWFjcm9zCm9yIGZ1bmN0aW9ucy4gSGVuY2UgcGxlYXNlIGRvIGdlbmVyYWxp
emUgdGhlc2UgUE1EL1BVRCBzaXplcyBpbiB0aGlzIHNlcmllcyBpdHNlbGYuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
