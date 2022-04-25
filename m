Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C53C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph5C8f1QxxVOui4aymPpAsO1d8r8u5WSUA1equt9oDw=; b=YVFYXSXa0Q4Si3
	5623WtmW2GnUDEqEuAF1gQvL3n2JxFs1fJcAmyQ70sV5dv1YlGNjXG6XtABEWOn1tl4h3ZTLdkPOd
	nRfZfaBXb+CI4icmIzq6Bu0v+1SIAUWVuuR5kGa4sHXMwcTPG124oWY4hiuKB9YBZdC77ySUhrlwn
	mSpBtG39vzIb5fqZxM9TpGVUdp19fpsG5CFPRw+xBogDsP0aV1wPUV4gb5zkVzO8kRian8+Cf1fQd
	At/LGh3CPYEM523U2+VLduEC5oYR3XzyXAiFPDxpg48DY1deLIk2XVDxx3IzRvLQZjZkU0fsZeVKr
	f4Jb7CclH7RxvPtNADKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitFM-008cgR-V2; Mon, 25 Apr 2022 07:35:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitF9-008ccS-6k; Mon, 25 Apr 2022 07:34:48 +0000
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kmxb322vHzfb6c;
 Mon, 25 Apr 2022 15:33:51 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Apr 2022 15:34:41 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Apr 2022 15:34:40 +0800
Message-ID: <d6eb7e4e-aaf1-ab4f-dbe1-90e60b37b18e@huawei.com>
Date: Mon, 25 Apr 2022 15:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 4/5] arm64: mm: add support for page table check
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
 <20220421082042.1167967-5-tongtiangen@huawei.com>
 <89ec03a9-5fee-7f4f-d189-67eb2aad24a3@arm.com>
 <c64e2159-d560-b560-f37e-4594692d88e1@huawei.com>
 <1ad261fc-4eb0-21f4-2f6b-11696cd5c1c3@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <1ad261fc-4eb0-21f4-2f6b-11696cd5c1c3@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_003447_448718_CC89ABBA 
X-CRM114-Status: UNSURE (   5.90  )
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

CgrlnKggMjAyMi80LzI1IDEzOjQxLCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gCj4gCj4g
T24gNC8yNC8yMiAwOTo0NCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+Pgo+Pgo+PiDlnKggMjAyMi80
LzIyIDE0OjQ1LCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4+PiBQbGVhc2UgY2hhbmdlIHRo
ZSBzdWJqZWN0IGxpbmUgYXMKPj4+Cj4+PiBhcm02NC9tbTogRW5hYmxlIEFSQ0hfU1VQUE9SVFNf
UEFHRV9UQUJMRV9DSEVDSwo+Pj4KPj4+IE9SCj4+Pgo+Pj4gYXJtNjQvbW06IFN1YnNjcmliZSBB
UkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0sKPj4+Cj4+PiBPbiA0LzIxLzIyIDEzOjUwLCBU
b25nIFRpYW5nZW4gd3JvdGU6Cj4+Pj4gRnJvbTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2Fu
Z0BodWF3ZWkuY29tPgo+Pj4+Cj4+Pj4gQXMgY29tbWl0IGQyODNkNDIyYzZjNCAoIng4NjogbW06
IGFkZCB4ODZfNjQgc3VwcG9ydCBmb3IgcGFnZSB0YWJsZQo+Pj4+IGNoZWNrIiksIGFkZCBzb21l
IG5lY2Vzc2FyeSBwYWdlIHRhYmxlIGNoZWNrIGhvb2tzIGludG8gcm91dGluZXMgdGhhdAo+Pj4+
IG1vZGlmeSB1c2VyIHBhZ2UgdGFibGVzLgo+Pj4KPj4+IFBsZWFzZSBtYWtlIHRoZSBjb21taXQg
bWVzc2FnZSBjb21wcmVoZW5zaXZlLCB3aGljaCBzaG91bGQgaW5jbHVkZQo+Pj4KPj4+IC0gRW5h
YmxpbmcgQVJDSF9TVVBQT1JUU19QQUdFX1RBQkxFX0NIRUNLIG9uIGFybTY0Cj4+PiAtIEFkZGlu
ZyBhbGwgYWRkaXRpb25hbCBwYWdlIHRhYmxlIGhlbHBlcnMgcmVxdWlyZWQgZm9yIFBBR0VfVEFC
TEVfQ0hFQ0sKPj4+IC0gSW5zdHJ1bWVudGluZyBleGlzdGluZyBwYWdlIHRhYmxlIGhlbHBlcnMg
d2l0aCBwYWdlIHRhYmxlIGNoZWNrIGhvb2tzCj4+Pgo+Pgo+PiBHb29kIHN1Z2dlc3Rpb24sIGlm
IGkgbmVlZCB0byBkbyBhIG5ldyB2ZXJzaW9uIGZvciBzb21lIG90aGVyIHJlYXNvbiBpIHRoaW5r
IGl0IHNob3VsZCBiZSBkZXNjcmliZWQgbW9yZSBjb21wcmVoZW5zaXZlbAo+IAo+IAo+IFRoaXMg
c2VyaWVzIG5lZWRzIHJldmlzaW9uIHRvIGFjY29tbW9kYXRlIGVhcmxpZXIgY29tbWVudHMuCj4g
LgoKT0ssIFRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
