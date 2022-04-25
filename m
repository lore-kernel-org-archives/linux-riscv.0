Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA09C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 05:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ful21zsE/mM8SbL7aqaFwcgbg0lZtcYcQt/rgGPB61U=; b=pjPFltBE4sGwRg
	iTWrw6vSrAzMkKM2LR+kjOFZDcjiIJJntjwRnvzn2gQnKtkBhQoBKU7oTcNOPzN8+U81xxaO2qMfU
	mNSuTPU7IL8tcqsb3J4H4bNZAhgZdxLaBh8EwHVGq6mPzMTYsWWbgERGgrQCvAzzlLl+pD9n9gx2A
	kxza40O6nWlz354FsL45TWWyx/wxTtB75YFtaScTMQqiS6YgjhAccz5/29+kCWSjJZui3axAlpu76
	H8m4nOcagCL7XI0tH2XQ1P/nPP0Yi0c1OiWRto2iPOxSwo/RnMKBA2HCb4OY5c56eov5lFQxnUyEp
	ZBdBcMMynnhXpfUi+hiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nirTQ-008PfR-Is; Mon, 25 Apr 2022 05:41:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nirTE-008Pan-M5; Mon, 25 Apr 2022 05:41:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B52A1FB;
 Sun, 24 Apr 2022 22:41:05 -0700 (PDT)
Received: from [10.163.40.250] (unknown [10.163.40.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF7A3F774;
 Sun, 24 Apr 2022 22:40:55 -0700 (PDT)
Message-ID: <1ad261fc-4eb0-21f4-2f6b-11696cd5c1c3@arm.com>
Date: Mon, 25 Apr 2022 11:11:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v5 4/5] arm64: mm: add support for page table check
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-5-tongtiangen@huawei.com>
 <89ec03a9-5fee-7f4f-d189-67eb2aad24a3@arm.com>
 <c64e2159-d560-b560-f37e-4594692d88e1@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <c64e2159-d560-b560-f37e-4594692d88e1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_224112_791478_B2A46466 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzI0LzIyIDA5OjQ0LCBUb25nIFRpYW5nZW4gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjIv
NC8yMiAxNDo0NSwgQW5zaHVtYW4gS2hhbmR1YWwg5YaZ6YGTOgo+PiBQbGVhc2UgY2hhbmdlIHRo
ZSBzdWJqZWN0IGxpbmUgYXMKPj4KPj4gYXJtNjQvbW06IEVuYWJsZSBBUkNIX1NVUFBPUlRTX1BB
R0VfVEFCTEVfQ0hFQ0sKPj4KPj4gT1IKPj4KPj4gYXJtNjQvbW06IFN1YnNjcmliZSBBUkNIX1NV
UFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0sKPj4KPj4gT24gNC8yMS8yMiAxMzo1MCwgVG9uZyBUaWFu
Z2VuIHdyb3RlOgo+Pj4gRnJvbTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWku
Y29tPgo+Pj4KPj4+IEFzIGNvbW1pdCBkMjgzZDQyMmM2YzQgKCJ4ODY6IG1tOiBhZGQgeDg2XzY0
IHN1cHBvcnQgZm9yIHBhZ2UgdGFibGUKPj4+IGNoZWNrIiksIGFkZCBzb21lIG5lY2Vzc2FyeSBw
YWdlIHRhYmxlIGNoZWNrIGhvb2tzIGludG8gcm91dGluZXMgdGhhdAo+Pj4gbW9kaWZ5IHVzZXIg
cGFnZSB0YWJsZXMuCj4+Cj4+IFBsZWFzZSBtYWtlIHRoZSBjb21taXQgbWVzc2FnZSBjb21wcmVo
ZW5zaXZlLCB3aGljaCBzaG91bGQgaW5jbHVkZQo+Pgo+PiAtIEVuYWJsaW5nIEFSQ0hfU1VQUE9S
VFNfUEFHRV9UQUJMRV9DSEVDSyBvbiBhcm02NAo+PiAtIEFkZGluZyBhbGwgYWRkaXRpb25hbCBw
YWdlIHRhYmxlIGhlbHBlcnMgcmVxdWlyZWQgZm9yIFBBR0VfVEFCTEVfQ0hFQ0sKPj4gLSBJbnN0
cnVtZW50aW5nIGV4aXN0aW5nIHBhZ2UgdGFibGUgaGVscGVycyB3aXRoIHBhZ2UgdGFibGUgY2hl
Y2sgaG9va3MKPj4KPiAKPiBHb29kIHN1Z2dlc3Rpb24sIGlmIGkgbmVlZCB0byBkbyBhIG5ldyB2
ZXJzaW9uIGZvciBzb21lIG90aGVyIHJlYXNvbiBpIHRoaW5rIGl0IHNob3VsZCBiZSBkZXNjcmli
ZWQgbW9yZSBjb21wcmVoZW5zaXZlbAoKClRoaXMgc2VyaWVzIG5lZWRzIHJldmlzaW9uIHRvIGFj
Y29tbW9kYXRlIGVhcmxpZXIgY29tbWVudHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
