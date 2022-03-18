Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923CAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 03:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN1SLpzplNWTE77/OUDsUerK5Gr1n1OjtjrmBXqX0RY=; b=nlc354hKmHi5m2
	XG+GA9HUg9TuHQF8KkkNfC5oz3KcixocJ7j9CJz1+wBhXHe4iKBc7O1GFCZOs9MP6UAIInilazRC3
	Xy4k3r+0sfnW4fZdBzmvF3SIqdzk0LikIgqviSCC6GMHqMTFgPaUq8OTPRefrQ+8RJCziUb9M3/7Q
	59bpG6Pw/2XrRhHcdhBV9HjTbpRdchqQJJOOBMeLN1Ht1wz1tTw6VQOrJ6a1QYKRC6gg7alIvJdqK
	uKPWvCu2wLumwSmgdHwi4n5kZruJBIev+WC3IkdfDOsZBWdDcsvA5IBUKpdGoghS5ItjG7EtMb2Rc
	MszIAY0JJvUekAjlR4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV3lF-000J6t-0j; Fri, 18 Mar 2022 03:58:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV3l1-000J4E-Ib; Fri, 18 Mar 2022 03:58:33 +0000
Received: from kwepemi100008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KKVYf2rxszCqk9;
 Fri, 18 Mar 2022 11:56:22 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 11:58:24 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 11:58:23 +0800
Message-ID: <cb91532b-c0cd-034c-2f93-4f76fabf5fc1@huawei.com>
Date: Fri, 18 Mar 2022 11:58:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH -next 3/4] arm64: mm: add support for page table check
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, "Will
 Deacon" <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>
References: <20220317141203.3646253-1-tongtiangen@huawei.com>
 <20220317141203.3646253-4-tongtiangen@huawei.com> <YjOFNEvj7EfBasCI@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <YjOFNEvj7EfBasCI@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_205831_831341_457FF8CF 
X-CRM114-Status: GOOD (  12.05  )
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

CgrlnKggMjAyMi8zLzE4IDM6MDAsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6Cj4gT24gVGh1LCBN
YXIgMTcsIDIwMjIgYXQgMDI6MTI6MDJQTSArMDAwMCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiBA
QCAtNjI4LDYgKzY0NywyNSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcG1kX3BhZ2Vf
dmFkZHIocG1kX3QgcG1kKQo+PiAgICNkZWZpbmUgcHVkX2xlYWYocHVkKQkJcHVkX3NlY3QocHVk
KQo+PiAgICNkZWZpbmUgcHVkX3ZhbGlkKHB1ZCkJCXB0ZV92YWxpZChwdWRfcHRlKHB1ZCkpCj4+
ICAgCj4+ICsjaWZkZWYgQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sKPj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlX3QgcHRlKQo+PiArewo+PiArCXJldHVy
biAocHRlX3ZhbChwdGUpICYgUFRFX1ZBTElEKSAmJiAocHRlX3ZhbChwdGUpICYgUFRFX1VTRVIp
Owo+PiArfQo+IAo+IFRoZXJlIGlzIGFub3RoZXIgY2xhc3Mgb2YgdXNlciBtYXBwaW5ncywgZXhl
Y3V0ZS1vbmx5LCB0aGF0IGhhdmUgYm90aAo+IFBURV9VU0VSIGFuZCBQVEVfVVhOIGNsZWFyZWQu
IFNvIHRoaXMgbG9naWMgc2hvdWxkIGJlOgo+IAo+IAlwdGVfdmFsaWQocHRlKSAmJiAocHRlX3Vz
ZXIocHRlKSB8fCBwdGVfdXNlcl9leGVjKHB0ZSkpCj4gCj4gd2l0aCBwdGVfdXNlcigpIGFzOgo+
IAo+ICNkZWZpbmUgcHRlX3VzZXIocHRlKQkoISEocHRlX3ZhbChwdGUpICYgUFRFX1VTRVIpKQoK
R29vZCBzdWdnZXN0aW9uLCB0aGUgUFRDKHBhZ2UgdGFibGUgY2hlY2spIGNhbiBjb3ZlciBVWE4g
cGFnZSBhbmQgCnB0ZV91c2VyKHB0ZSkgaGVscGVyIGlzIHJlcXVpcmVkLgoKPiAKPiBEbyB3ZSBj
YXJlIGFib3V0IFBST1RfTk9ORSBtYXBwaW5ncyBoZXJlPyBUaGV5IGhhdmUgdGhlIHZhbGlkIGJp
dAo+IGNsZWFyZWQgYnV0IHB0ZV9wcmVzZW50KCkgaXMgdHJ1ZS4KPgoKUFRDIHdpbGwgbm90IGNo
ZWNrIHRoaXMgc3BlY2lhbCB0eXBlKFBST1RfTk9ORSkgb2YgcGFnZS4KCj4+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcG1kX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHBtZF90IHBtZCkKPj4gK3sKPj4gKwly
ZXR1cm4gcG1kX2xlYWYocG1kKSAmJiAocG1kX3ZhbChwbWQpICYgUFRFX1ZBTElEKSAmJgo+PiAr
CQkocG1kX3ZhbChwbWQpICYgUFRFX1VTRVIpOwo+PiArfQo+IAo+IHBtZF9sZWFmKCkgaW1wbGll
cyB2YWxpZCwgc28geW91IGNhbiBza2lwIGl0IGlmIHRoYXQncyB0aGUgYWltLgoKUFRDIG9ubHkg
Y2hlY2tzIHdoZXRoZXIgdGhlIG1lbW9yeSBibG9jayBjb3JyZXNwb25kaW5nIHRvIHRoZSBwbWRf
bGVhZiAKdHlwZSBjYW4gYWNjZXNzLCBmb3IgIXBtZF9sZWFmLCBQVEMgY2hlY2tzIGF0IHRoZSBw
dGUgbGV2ZWwuIFNvIGkgdGhpbmsgCnRoaXMgaXMgbmVjZXNzYXJ5LgoKPiAKPiBTaW1pbGFyIGNv
bW1lbnQgdG8gdGhlIHB0ZSB2YXJpYW50IG9uIGV4ZWN1dGUtb25seSBhbmQgUFJPVF9OT05FCj4g
bWFwcGluZ3MKClNhbWUgY29uc2lkZXJhdGlvbnMgYXMgYWJvdmUuCgpUaGFua3MuClRvbmcKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
