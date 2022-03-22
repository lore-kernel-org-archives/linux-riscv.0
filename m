Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FFAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 03:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ0HNscLVuCcU+7//hlf3MbRsca6quZmdi1rR+WtG3s=; b=nasDCZpMP90uQq
	A/PWnsIYTvOXJ7oWucKh5bGUhKxIWfgA8rWx5bAtFCxHDFX9xwrxZUQBjOUOMql0EyhaoZxEylvUI
	ATeD1MY6fGHS74FljRljlVh4Ez02yGsGa496/6g7sUzI/FDokdLkH936ORkE94L01fjGT+Hkvly0u
	OXUJdFjMAOV8dtBsgWtC8hJC5O/om2rnbBoC1Y8Bjnu9Pq2jYMbzoK+7rvNBXGsuZQV/Zv2mT0sfE
	oxrMAL86qRqGXTYvmHkHb6oMKPNjK5LO/rTd3WFXsLeV7W9fVyBfnxcAOT6zdg1O3TP0g8C35jxpF
	QdcrVYxOBTyTvdlvOArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUs5-009pmg-D8; Tue, 22 Mar 2022 03:07:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUrr-009pgt-Ao; Tue, 22 Mar 2022 03:07:33 +0000
Received: from kwepemi100001.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KMxHB2qKtz1GCpk;
 Tue, 22 Mar 2022 11:07:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100001.china.huawei.com (7.221.188.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 11:07:24 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 11:07:23 +0800
Message-ID: <d5c5e2fa-a09b-bf1b-295b-8ed99fc85e57@huawei.com>
Date: Tue, 22 Mar 2022 11:07:22 +0800
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
 <cb91532b-c0cd-034c-2f93-4f76fabf5fc1@huawei.com> <YjS+2FVpq8D4Gx0S@arm.com>
 <d3006048-f737-439e-b985-cfbab69c4167@huawei.com> <Yjiqm6tQB5To5Jd9@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Yjiqm6tQB5To5Jd9@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_200731_558693_E2094601 
X-CRM114-Status: UNSURE (   7.87  )
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

CgrlnKggMjAyMi8zLzIyIDA6NDAsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6Cj4gT24gTW9uLCBN
YXIgMjEsIDIwMjIgYXQgMDI6MTU6MzZQTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiBD
b25zaWRlcmluZyBhbGwgeW91ciBzdWdnZXN0aW9ucywgVGhlIGZpbmFsIGxvZ2ljIHNob3VsZCBi
ZToKPj4KPj4gKyNkZWZpbmUgcHRlX3VzZXIocHRlKSAgICAgICAgICAoISEocHRlX3ZhbChwdGUp
ICYgUFRFX1VTRVIpKQo+Pgo+PiArI2RlZmluZSBwbWRfdXNlcihwbWQpCQlwdGVfdXNlcihwbWRf
cHRlKHBtZCkpCj4+ICsjZGVmaW5lIHBtZF91c2VyX2V4ZWMocG1kKQlwdGVfdXNlcl9leGVjKHBt
ZF9wdGUocG1kKSkKPj4KPj4gKyNkZWZpbmUgcHVkX3VzZXIocHVkKSAgICAgICAgICBwdGVfdXNl
cihwdWRfcHRlKHB1ZCkpCj4+Cj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNz
aWJsZV9wYWdlKHB0ZV90IHB0ZSkKPj4gK3sKPj4gKwlyZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAm
JiAocHRlX3VzZXIocHRlKXx8IHB0ZV91c2VyX2V4ZWMocHRlKSk7Cj4+ICt9Cj4gCj4gVGhpcyBp
cyBmaW5lLgo+IAo+PiArc3RhdGljIGlubGluZSBib29sIHBtZF91c2VyX2FjY2Vzc2libGVfcGFn
ZShwbWRfdCBwbWQpCj4+ICt7Cj4+ICsJcmV0dXJuIHBtZF9wcmVzZW50KHBtZCkgJiYgKHBtZF91
c2VyKHBtZCl8fCBwbWRfdXNlcl9leGVjKHBtZCkpOwo+PiArfQo+IAo+IFRoYXQncyBmaW5lIGFz
IHdlbGwgYXNzdW1pbmcgdGhhdCB0aGUgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQgb24gdGhlCj4g
c2V0X3BtZF9hdCgpIHBhdGggd2hlcmUgd2Uga25vdyB0aGF0IHRoZSBwbWQgd291bGQgYmUgYSBi
bG9jayBtYXBwaW5nCj4gKGh1Z2UgcGFnZSkuIEkgdGhpbmsgdGhhdCdzIHRoZSBjYXNlIGZyb20g
YSBxdWljayBsb29rIGF0IHRoZSBjdXJyZW50Cj4geDg2IGltcGxlbWVudGF0aW9uLgoKWWVhaCwg
UFRDIG9ubHkgY2hlY2sgcG1kIGJsb2NrIG1hcHBpbmcoaHVnZSBwYWdlKSBhbmQgcHVkIGlzIHNp
bWlsYXIuClRoZXNlIGNvZGUgbG9naWMgd2lsbCBiZSBpbmNsdWRlZCBpbiBWMi4KClRoYW5rcy4K
Cj4gCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90
IHB1ZCkKPj4gK3sKPj4gKwlyZXR1cm4gcHVkX3ByZXNlbnQocHVkKSAmJiBwdWRfdXNlcihwdWQp
Owo+PiArfQo+IAo+IFNhbWUgaGVyZS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
