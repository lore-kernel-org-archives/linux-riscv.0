Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABFAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 06:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8k3FAfpn5OXsTQsvGKyjOo6IDTd2SHGR5BSOPtvDBQ=; b=iaquaDvMZ50tgj
	Ugpdz8Ct36+X5ZvCsi0g1E8iYaclZ+rmBSTTDTgPONIjnoB4RxwNy4kMMp3CX5FydxgR+MxLOyJf3
	ZP7Sr+jyTW4JSHxq7Y+O+lPW+x4QWICtWvvr3oxeJHZDG0a7JGGXCk29k4tS/d37qXI9eF6K7Fo19
	wSJIJK+1DbgBcRsmSOpJ9KOvrQaGJK3OqFFfTEd9S6HDYOsfSIzKYRpO+LuZaIfA/+Pqq9FYwUIaR
	dd5phGsRVXXZea20i0cAuH3gsVaED3KbdPGkaxlcd/tbgZTKB4U3wukk+ocv7G+WoNpeELgTTUeTe
	GL3X+F6CEwCuZii/JWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh44n-007ban-Ut; Wed, 20 Apr 2022 06:44:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh44Z-007bVo-A2; Wed, 20 Apr 2022 06:44:21 +0000
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KjrjC5Hypz1J9qf;
 Wed, 20 Apr 2022 14:43:27 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 14:44:12 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Apr 2022 14:44:10 +0800
Message-ID: <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
Date: Wed, 20 Apr 2022 14:44:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
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
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
 <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_234419_548363_52CCABE1 
X-CRM114-Status: UNSURE (   6.76  )
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

CgrlnKggMjAyMi80LzE5IDE3OjI5LCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gCj4gCj4g
T24gNC8xOC8yMiAwOToxNCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiAtLS0gYS9tbS9wYWdlX3Rh
YmxlX2NoZWNrLmMKPj4gKysrIGIvbW0vcGFnZV90YWJsZV9jaGVjay5jCj4+IEBAIC0xMCw2ICsx
MCwxNCBAQAo+PiAgICN1bmRlZiBwcl9mbXQKPj4gICAjZGVmaW5lIHByX2ZtdChmbXQpCSJwYWdl
X3RhYmxlX2NoZWNrOiAiIGZtdAo+PiAgIAo+PiArI2lmbmRlZiBQTURfUEFHRV9TSVpFCj4+ICsj
ZGVmaW5lIFBNRF9QQUdFX1NJWkUJUE1EX1NJWkUKPj4gKyNlbmRpZgo+PiArCj4+ICsjaWZuZGVm
IFBVRF9QQUdFX1NJWkUKPj4gKyNkZWZpbmUgUFVEX1BBR0VfU0laRQlQVURfU0laRQo+PiArI2Vu
ZGlmCj4gCj4gV2h5IGNhbm5vdCBQTURfU0laRS9QVURfU0laRSBiZSB1c2VkIG9uIGV2ZXJ5IHBs
YXRmb3JtIGluc3RlYWQgPyBXaGF0IGlzIHRoZQo+IG5lZWQgZm9yIHVzaW5nIFBVRF9QQUdFX1NJ
WkUvUE1EX1BBR0VfU0laRSA/IEFyZSB0aGV5IGRpZmZlcmVudCBvbiB4ODYgPwo+IC4KCkhpLCBQ
YXNoYe+8mgpJIGNoZWNrZWQgdGhlIGRlZmluaXRpb25zIG9mIFBNRF9TSVpFL1BVRF9TSVpFIGFu
ZCAKUFVEX1BBR0VfU0laRS9QTURfUEFHRV9TSVpFIGluIHg4NiBhcmNoaXRlY3R1cmUgYW5kIHRo
ZWlyIHVzZSBvdXRzaWRlIAp0aGUgYXJjaGl0ZWN0dXJlKGVnOiBpbiBtbS8sIGFsbCB1c2VkIFBN
RF9TSVpFL1BVRF9TSVpFKSwgV291bGQgaXQgYmUgCmJldHRlciB0byB1c2UgYSB1bmlmaWVkIFBN
RF9TSVpFL1BVRF9TSVpFIGhlcmU/CgpUaGFua3MsClRvbmcuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
