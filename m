Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E659C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxgiCKDH0Orf5B6amkE3xhp8wbySv7ZNn5KCazzXMMY=; b=0b08Fc+smALsUp
	xQSsOVVV8qwGR0MJ2BcGSkGwEk5TM+Fkn2vMZRNbsykd67CWUzcDhcF3FktXbH2PxrBv30bl7aK3c
	bxwoQYi3TX0mzlXOmIbt2sAFZhVlXpybXGCWGDM0yAClsKLR9yB9OtS5l872nyIPWmaJmzA0BKAc9
	FYHw7te4WtmeAiYgL/KydYz7/H17YurPb6k0YrfZkOh9cp/+1D4SyHPgqbYfGJA2QvezE4Mld5587
	ETHJIzmc+L78wgep0GT1srYsjj4EQkJlneLJrgKQPbD8stivpXcpb3274R8Y/ICfHaauvIDu0qfA8
	4ZY8H1hzDqhDkYCLvw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWBKh-006f1X-OW; Mon, 21 Mar 2022 06:15:59 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWBKU-006ewJ-B4; Mon, 21 Mar 2022 06:15:48 +0000
Received: from kwepemi500002.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KMPTB6yTQzfYr5;
 Mon, 21 Mar 2022 14:14:06 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500002.china.huawei.com (7.221.188.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 14:15:38 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 14:15:37 +0800
Message-ID: <d3006048-f737-439e-b985-cfbab69c4167@huawei.com>
Date: Mon, 21 Mar 2022 14:15:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Tong Tiangen <tongtiangen@huawei.com>
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
 <cb91532b-c0cd-034c-2f93-4f76fabf5fc1@huawei.com> <YjS+2FVpq8D4Gx0S@arm.com>
In-Reply-To: <YjS+2FVpq8D4Gx0S@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_231546_739717_EF55EB0B 
X-CRM114-Status: GOOD (  12.53  )
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

CgrlnKggMjAyMi8zLzE5IDE6MTgsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6Cj4gT24gRnJpLCBN
YXIgMTgsIDIwMjIgYXQgMTE6NTg6MjJBTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiDl
nKggMjAyMi8zLzE4IDM6MDAsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6Cj4+PiBPbiBUaHUsIE1h
ciAxNywgMjAyMiBhdCAwMjoxMjowMlBNICswMDAwLCBUb25nIFRpYW5nZW4gd3JvdGU6Cj4+Pj4g
QEAgLTYyOCw2ICs2NDcsMjUgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHBtZF9wYWdl
X3ZhZGRyKHBtZF90IHBtZCkKPj4+PiAgICAjZGVmaW5lIHB1ZF9sZWFmKHB1ZCkJCXB1ZF9zZWN0
KHB1ZCkKPj4+PiAgICAjZGVmaW5lIHB1ZF92YWxpZChwdWQpCQlwdGVfdmFsaWQocHVkX3B0ZShw
dWQpKQo+Pj4+ICsjaWZkZWYgQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sKPj4+PiArc3RhdGljIGlu
bGluZSBib29sIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGVfdCBwdGUpCj4+Pj4gK3sKPj4+
PiArCXJldHVybiAocHRlX3ZhbChwdGUpICYgUFRFX1ZBTElEKSAmJiAocHRlX3ZhbChwdGUpICYg
UFRFX1VTRVIpOwo+Pj4+ICt9Cj4gWy4uLl0KPj4+IERvIHdlIGNhcmUgYWJvdXQgUFJPVF9OT05F
IG1hcHBpbmdzIGhlcmU/IFRoZXkgaGF2ZSB0aGUgdmFsaWQgYml0Cj4+PiBjbGVhcmVkIGJ1dCBw
dGVfcHJlc2VudCgpIGlzIHRydWUuCj4+Pgo+Pgo+PiBQVEMgd2lsbCBub3QgY2hlY2sgdGhpcyBz
cGVjaWFsIHR5cGUoUFJPVF9OT05FKSBvZiBwYWdlLgo+IAo+IFBST1RfTk9ORSBpcyBqdXN0IGEg
cGVybWlzc2lvbiBidXQgc2luY2Ugd2UgZG9uJ3QgaGF2ZSBpbmRlcGVuZGVudCByZWFkCj4gYW5k
IHdyaXRlIGJpdHMgaW4gdGhlIHB0ZSwgd2UgaW1wbGVtZW50IGl0IGFzIGFuIGludmFsaWQgcHRl
IChiaXQgMAo+IGNsZWFyZWQpLiBUaGUgb3RoZXIgY29udGVudCBvZiB0aGUgcHRlIGlzIGZpbmUs
IHNvIHB0ZV9wZm4oKSBzaG91bGQKPiBzdGlsbCB3b3JrLiBQVEMgY291bGQgYXMgd2VsbCBjaGVj
ayB0aGlzLCBJIGRvbid0IHRoaW5rIGl0IGh1cnRzLgoKWW91IGhhdmUgYSBwb2ludCBhbmQgdGhl
IGxvZ2ljIHNob3VsZCBiZToKCglwdGVfcHJlc2VudChwdGUpICYmIChwdGVfdXNlcihwdGUpIHx8
IHB0ZV91c2VyX2V4ZWMocHRlKSkKCj4gCj4+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UocG1kX3QgcG1kKQo+Pj4+ICt7Cj4+Pj4gKwlyZXR1cm4gcG1kX2xl
YWYocG1kKSAmJiAocG1kX3ZhbChwbWQpICYgUFRFX1ZBTElEKSAmJgo+Pj4+ICsJCShwbWRfdmFs
KHBtZCkgJiBQVEVfVVNFUik7Cj4+Pj4gK30KPj4+Cj4+PiBwbWRfbGVhZigpIGltcGxpZXMgdmFs
aWQsIHNvIHlvdSBjYW4gc2tpcCBpdCBpZiB0aGF0J3MgdGhlIGFpbS4KPj4KPj4gUFRDIG9ubHkg
Y2hlY2tzIHdoZXRoZXIgdGhlIG1lbW9yeSBibG9jayBjb3JyZXNwb25kaW5nIHRvIHRoZSBwbWRf
bGVhZiB0eXBlCj4+IGNhbiBhY2Nlc3MsIGZvciAhcG1kX2xlYWYsIFBUQyBjaGVja3MgYXQgdGhl
IHB0ZSBsZXZlbC4gU28gaSB0aGluayB0aGlzIGlzCj4+IG5lY2Vzc2FyeS4KPiAKPiBNeSBwb2lu
dCBpcyB0aGF0IHRoZSAocG1kX3ZhbChwbWQpICYgUFRFX1ZBTElEKSBjaGVjayBpcyBzdXBlcmZs
dW91cwo+IHNpbmNlIHRoYXQncyBjb3ZlcmVkIGJ5IHBtZF9sZWFmKCkgYWxyZWFkeS4KCk9o77yM
aSBnb3QgaXTvvIx5b3UncmUgcmlnaHQgYW5kIHRoZXNlIHdpbGwgYmUgZml4ZWQgaW4gdjIuCgpD
b25zaWRlcmluZyBhbGwgeW91ciBzdWdnZXN0aW9ucywgVGhlIGZpbmFsIGxvZ2ljIHNob3VsZCBi
ZToKCisjZGVmaW5lIHB0ZV91c2VyKHB0ZSkgICAgICAgICAgKCEhKHB0ZV92YWwocHRlKSAmIFBU
RV9VU0VSKSkKCisjZGVmaW5lIHBtZF91c2VyKHBtZCkJCXB0ZV91c2VyKHBtZF9wdGUocG1kKSkK
KyNkZWZpbmUgcG1kX3VzZXJfZXhlYyhwbWQpCXB0ZV91c2VyX2V4ZWMocG1kX3B0ZShwbWQpKQoK
KyNkZWZpbmUgcHVkX3VzZXIocHVkKSAgICAgICAgICBwdGVfdXNlcihwdWRfcHRlKHB1ZCkpCgor
c3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGVfdCBwdGUpCit7
CisJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkgJiYgKHB0ZV91c2VyKHB0ZSl8fCBwdGVfdXNlcl9l
eGVjKHB0ZSkpOworfQoKK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3Bh
Z2UocG1kX3QgcG1kKQoreworCXJldHVybiBwbWRfcHJlc2VudChwbWQpICYmIChwbWRfdXNlcihw
bWQpfHwgcG1kX3VzZXJfZXhlYyhwbWQpKTsKK30KCitzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkKK3sKKwlyZXR1cm4gcHVkX3ByZXNlbnQocHVk
KSAmJiBwdWRfdXNlcihwdWQpOworfQoKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
