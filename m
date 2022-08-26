Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62293ECAAD6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwFKeYuwggVKxSfIl8kHK4vB64Kqfv5IfVqAVnB+DKc=; b=bGOXYFUKCgG3hG
	RjX6s6g5zQMqG/loj/KzxEHGe4QfZiFtmsBYw+9qcahcMCr4Qi+fw81DQnOXUvk+dLARLRQ2H48nr
	XP0vZ3FxQU+5FxSN2iPE2G0rm2Np47kXP2qROESvr4rIP2nFMmitf7YvdYrP8dAoDowum3N4EKblL
	CSmdUFeMr2w+4XqNN2+2gDjvLAD9YaKV+tgjTDCiXFUhxh8Q0Ez6uW0aRn6hZXJley8PGjGVB+4gK
	MGEY9Nawy1l9Ig7pRYwWRO35wjAOxGg94qRzB+VYW5wAHN1jAtIXBaiYJfTjetkgdPP3KhmO/TyjC
	8AqXXzXbRAT+OobzU/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRSuo-00Eh2O-C8; Fri, 26 Aug 2022 06:34:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRSuk-00Egss-Se
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 06:34:01 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MDVLw34WWzkWfR;
	Fri, 26 Aug 2022 14:30:16 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 14:33:49 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 14:33:48 +0800
Message-ID: <3541c980-7fcf-7047-cec7-3c2ca6381a99@huawei.com>
Date: Fri, 26 Aug 2022 14:33:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
To: Andrew Jones <ajones@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
 <20220825105600.ezueddmwehob42rf@kamzik>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220825105600.ezueddmwehob42rf@kamzik>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_233359_321088_5E210A78 
X-CRM114-Status: GOOD (  12.40  )
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

CgrlnKggMjAyMi84LzI1IDE4OjU2LCBBbmRyZXcgSm9uZXMg5YaZ6YGTOgo+IE9uIE1vbiwgQXVn
IDE1LCAyMDIyIGF0IDAzOjIwOjI0QU0gKzAwMDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4gQ3Vy
cmVudCwgVGhlIGhlbHBlcnMgX19nZXQvcHV0X3VzZXJfbm9jaGVjaygpIGlzIHVzZWQgYnkgZ2V0
L3B1dF91c2VyKCkgYW5kCj4+IF9fZ2V0L3B1dF9rZXJuZWxfbm9mYXVsdCgpLCB3aGljaCBpcyBu
b3QgYWx3YXlzIHVhY2Nlc3MsIHNvIHRoZSBuYW1lIHdpdGgKPj4gKnVzZXIqIGlzIG5vdCBhcHBy
b3ByaWF0ZS4KPj4KPj4gQWxzbyByZW5hbWUgeHh4X3VzZXJfeHh4IHRvIHh4eF9tZW1feHggIG9u
IHRoZSBjYWxsIHBhdGggb2YKPj4gX19nZXQvcHV0X3VzZXJfbm9jaGVjaygpCj4+Cj4+IE9ubHkg
cmVmYWN0b3IgY29kZSB3aXRob3V0IGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRvbmcgVGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4KPj4gLS0tCj4+
ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCA0OCArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAy
NCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4gaW5kZXggODU1
NDUwYmVkOWY1Li4xMzcwZGEwNTViNDQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
Cj4+IEBAIC01MCw3ICs1MCw3IEBACj4+ICAgICogY2FsbC4KPj4gICAgKi8KPj4gICAKPj4gLSNk
ZWZpbmUgX19nZXRfdXNlcl9hc20oaW5zbiwgeCwgcHRyLCBlcnIpCQkJXAo+PiArI2RlZmluZSBf
X2dldF9tZW1fYXNtKGluc24sIHgsIHB0ciwgZXJyKQkJCVwKPj4gICBkbyB7CQkJCQkJCQlcCj4+
ICAgCV9fdHlwZW9mX18oeCkgX194OwkJCQkJXAo+PiAgIAlfX2FzbV9fIF9fdm9sYXRpbGVfXyAo
CQkJCQlcCj4+IEBAIC02NCwxMiArNjQsMTIgQEAgZG8gewkJCQkJCQkJXAo+PiAgIH0gd2hpbGUg
KDApCj4+ICAgCj4+ICAgI2lmZGVmIENPTkZJR182NEJJVAo+PiAtI2RlZmluZSBfX2dldF91c2Vy
XzgoeCwgcHRyLCBlcnIpIFwKPj4gLQlfX2dldF91c2VyX2FzbSgibGQiLCB4LCBwdHIsIGVycikK
Pj4gKyNkZWZpbmUgX19nZXRfbWVtXzgoeCwgcHRyLCBlcnIpIFwKPj4gKwlfX2dldF9tZW1fYXNt
KCJsZCIsIHgsIHB0ciwgZXJyKQo+PiAgICNlbHNlIC8qICFDT05GSUdfNjRCSVQgKi8KPj4gLSNk
ZWZpbmUgX19nZXRfdXNlcl84KHgsIHB0ciwgZXJyKQkJCQlcCj4+ICsjZGVmaW5lIF9fZ2V0X21l
bV84KHgsIHB0ciwgZXJyKQkJCQlcCj4+ICAgZG8gewkJCQkJCQkJXAo+PiAtCXUzMiBfX3VzZXIg
Kl9fcHRyID0gKHUzMiBfX3VzZXIgKikocHRyKTsJCVwKPj4gKwl1MzIgKl9fcHRyID0gKHUzMiAq
KShwdHIpOwkJCQlcCj4gCj4gRG9lc24ndCBjYXN0aW5nIGF3YXkgX191c2VyIHJlZHVjZSBzcGFy
c2UncyB1dGlsaXR5PwoKIEZyb20gdGhlIGNhbGwgbG9naWNbMV0sIHRoZSBhZGRyZXNzIHBhc3Nl
ZCBpbnRvIHRoaXMgbWFjcm8gaXMgbm90IApuZWNlc3NhcmlseSBfX3VzZXIuIEkgdW5kZXJzdGFu
ZCB0aGF0IG5vIHByb2JsZW0gd2lsbCBiZSBpbnRyb2R1Y2VkIGZvciAKc3BhcnNlJ3MgdXRpbGl0
eS4KCkluIGFkZGl0aW9uLCB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIGEgcG9pbnRlciBjb252ZXJz
aW9uIGhlcmUsIHdpbGwgYmUgCmZpeGVkIG5leHQgdmVyc2lvbi4KClsxXSBfX2dldF9rZXJuZWxf
bm9mYXVsdCAtPiBfX2dldF9tZW1fbm9jaGVjayAtPiBfX2dldF9tZW1fOAo+IAo+PiAgIAl1MzIg
X19sbywgX19oaTsJCQkJCQlcCj4+ICAgCV9fYXNtX18gX192b2xhdGlsZV9fICgJCQkJCVwKPj4g
ICAJCSIxOlxuIgkJCQkJCVwKPj4gQEAgLTg4LDIwICs4OCwyMCBAQCBkbyB7CQkJCQkJCQlcCj4+
ICAgfSB3aGlsZSAoMCkKPj4gICAjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4+ICAgCj4+IC0j
ZGVmaW5lIF9fZ2V0X3VzZXJfbm9jaGVjayh4LCBfX2d1X3B0ciwgX19ndV9lcnIpCQlcCj4+ICsj
ZGVmaW5lIF9fZ2V0X21lbV9ub2NoZWNrKHgsIF9fZ3VfcHRyLCBfX2d1X2VycikJCVwKPiAKPiBU
aGUgcGF0Y2ggcmVwbGFjZXMgYWxsIGdldC9wdXRfdXNlciBpbnN0YW5jZXMgd2l0aCBnZXQvcHV0
X21lbSwKPiBidXQgd2hhdCBhYm91dCAnZ3UnIGFuZCAncHUnIGluc3RhbmNlcyAod2hpY2ggYXJl
IHByZXN1bWFibHkgc2hvcnQKPiBmb3IgZ2V0L3B1dF91c2VyKT8KCm9rLCBtaXNzaW5nIHRoYXQs
IEl0IGlzIG5vdCBhcHByb3ByaWF0ZSB0byB1c2UgX19ndV94eHjvvIx3aWxsIGJlIGZpeGVkIApu
ZXh0IHZlcnNpb24uCgpUaGFua3MsClRvbmcuCgo+IAo+IFRoYW5rcywKPiBkcmV3Cj4gLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
