Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16C0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 06:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UW7i4OXBq98fKQrP1aU84E748f9O/JQ2kh4CsBDEMyE=; b=nig67T2nimErSf
	pDn5cEjZbSLmTsKMWVpOSbEx4ntNkIcByo5bmwCnBRT83lA475tzBJ175dtRxr66TI/9vvaacGK8P
	8c2YmjuXhEJQZ38bAhcydFcpuR8BbsW/ZHe8u8JlXv7JCkPSZJhFHtdYykF5UGdS7W8Eh8WUi/rwr
	iAU7HfKMaL4b72LPpSM0MxuDYpnnvkFcWz1Jzz/BwHn6/5HNU8KsRb7FfarHPKuRDcHDR7msZplAd
	LgcH3wXnTJiM4Vv5BQBvPMEFXioxI9bJKU2KOdnJIuiKJWW+UjI4YIkLK5OsQgAJeIiV3G7At+qb/
	ZXSbeSgI4RSlBY6pRq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngKch-00FkRj-F3; Mon, 18 Apr 2022 06:12:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngKcW-00FkPj-5j; Mon, 18 Apr 2022 06:12:22 +0000
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Khc3B69nnzFptq;
 Mon, 18 Apr 2022 14:09:42 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 14:12:11 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 14:12:10 +0800
Message-ID: <0b023809-8138-a44f-83e2-db54a7446954@huawei.com>
Date: Mon, 18 Apr 2022 14:12:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 0/4]mm: page_table_check: add support on arm64
 and riscv
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220418034444.520928-1-tongtiangen@huawei.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_231220_423043_315EDBD0 
X-CRM114-Status: UNSURE (   9.61  )
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

SGkgQW5kcmV3LCBDYXRhbGluLCBQYWxtZXI6CgpUaGlzIHBhdGNoIG1vZGlmaWVzIHRoZSBjb2Rl
IHJlbGF0ZWQgdG8gdGhlIG1tL3g4Ni9hcm02NC9yaXNjdiwgd2hvIGNhbiAKaGVscCBtZSBtZXJn
ZSBpdCBpZiBubyBvYmplY3QsIE1heWJlIEFuZHJldyBpcyBtb3JlIGFwcHJvcHJpYXRlPwoKVGhh
bmtzLApUb25nLgoK5ZyoIDIwMjIvNC8xOCAxMTo0NCwgVG9uZyBUaWFuZ2VuIOWGmemBkzoKPiBQ
YWdlIHRhYmxlIGNoZWNrIHBlcmZvcm1zIGV4dHJhIHZlcmlmaWNhdGlvbnMgYXQgdGhlIHRpbWUg
d2hlbiBuZXcKPiBwYWdlcyBiZWNvbWUgYWNjZXNzaWJsZSBmcm9tIHRoZSB1c2Vyc3BhY2UgYnkg
Z2V0dGluZyB0aGVpciBwYWdlCj4gdGFibGUgZW50cmllcyAoUFRFcyBQTURzIGV0Yy4pIGFkZGVk
IGludG8gdGhlIHRhYmxlLiBJdCBpcyBzdXBwb3J0ZWQKPiBvbiBYODZbMV0uCj4gCj4gVGhpcyBw
YXRjaHNldCBtYWRlIHNvbWUgc2ltcGxlIGNoYW5nZXMgYW5kIG1ha2UgaXQgZWFzaWVyIHRvIHN1
cHBvcnQKPiBuZXcgYXJjaGl0ZWN0dXJlLCB0aGVuIHdlIHN1cHBvcnQgdGhpcyBmZWF0dXJlIG9u
IEFSTTY0IGFuZCBSSVNDVi4KPiAKPiBbMV1odHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjExMTIzMjE0ODE0LjM3NTYwNDctMS1wYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tLwo+IAo+IHYz
IC0+IHY0Ogo+ICAgMS4gQWRhcHQgdG8gbmV4dC0yMDIyMDQxNAo+IAo+IHYyIC0+IHYzOgo+ICAg
IDEuIE1vZGlmeSBwdGVwX2NsZWFyKCkgaW4gaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgsIHVzaW5n
IElTX0VOQUJMRUQKPiAgICAgICBhY2NvcmRpbmcgdG8gdGhlIHN1Z2dlc3Rpb25zIG9mIFBhc2hh
Lgo+IAo+IHYxIC0+IHYyOgo+ICAgIDEuIEZpeCBhcm02NCdzIHB0ZS9wbWQvcHVkX3VzZXJfYWNj
ZXNzaWJsZV9wYWdlKCkgYWNjb3JkaW5nIHRvIHRoZQo+ICAgICAgIHN1Z2dlc3Rpb25zIG9mIENh
dGFsaW4uCj4gICAgMi4gQWxzbyBmaXggcmlzY3YncyBwdGVfcG1kX3B1ZF91c2VyX2FjY2Vzc2li
bGVfcGFnZSgpLgo+IAo+IEtlZmVuZyBXYW5nICgyKToKPiAgICBtbTogcGFnZV90YWJsZV9jaGVj
azogbW92ZSBweHhfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UgaW50byB4ODYKPiAgICBhcm02NDogbW06
IGFkZCBzdXBwb3J0IGZvciBwYWdlIHRhYmxlIGNoZWNrCj4gCj4gVG9uZyBUaWFuZ2VuICgyKToK
PiAgICBtbTogcGFnZV90YWJsZV9jaGVjazogYWRkIGhvb2tzIHRvIHB1YmxpYyBoZWxwZXJzCj4g
ICAgcmlzY3Y6IG1tOiBhZGQgc3VwcG9ydCBmb3IgcGFnZSB0YWJsZSBjaGVjawo+IAo+ICAgYXJj
aC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAgYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4g
ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICB8IDI5ICsrKysrKystLS0tLQo+ICAg
aW5jbHVkZS9saW51eC9wZ3RhYmxlLmggICAgICAgICAgfCAyNiArKysrKysrLS0tLQo+ICAgbW0v
cGFnZV90YWJsZV9jaGVjay5jICAgICAgICAgICAgfCAyNSArKysrLS0tLS0tLQo+ICAgNyBmaWxl
cyBjaGFuZ2VkLCAxNzggaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
