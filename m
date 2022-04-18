Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D85C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3ww3ytCMu8xeJ+rRZ1QzMYVKiI3mF6NmHWfBLgEDJY=; b=s23z12xTilFEgH
	8xMusHJcpX9XLhr3WbVBqK8Psj1Re7K/tHl6/3f0oRi15+i1B+kHWzW8tZGJtj54xKjSoNRdvBQk8
	uJhvYDM/J4oAmmLa4lEbWDr216SekYYXCIL90hiZhc1O4xeVhHsVPkCyBhQBNcVJQVuR8ksSCtFYc
	2+w9R/ilhaktZ8a6oMSC2JZYF5fSU+sMYdBvldBy5sZCyBLHskj/snCHBhMWVkrUCdj1aTv6vlj70
	OCE0U9q88pVMAUaq/ukL8We41sbRoR6/cqMrq1pFLGBmKUMtQ6CSYcXKXtQkp+fOvxQbuIT+BHkmy
	OsBjAqVHdGdAAW/jW07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngTbY-00HWwC-Ey; Mon, 18 Apr 2022 15:47:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngTbM-00HWs5-FG; Mon, 18 Apr 2022 15:47:46 +0000
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Khrq65jkxzFq1Y;
 Mon, 18 Apr 2022 23:45:06 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 23:47:36 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 23:47:34 +0800
Message-ID: <ca13a4ec-17a6-8e29-e29e-39f9b47e78df@huawei.com>
Date: Mon, 18 Apr 2022 23:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v4 3/4] arm64: mm: add support for page table check
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
 <20220418034444.520928-4-tongtiangen@huawei.com>
 <1c314feb-cd78-2bb3-462e-4ea3cefe122e@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <1c314feb-cd78-2bb3-462e-4ea3cefe122e@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_084744_939654_9D0F6E76 
X-CRM114-Status: GOOD (  18.32  )
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

CgrlnKggMjAyMi80LzE4IDE3OjI4LCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gT24gNC8x
OC8yMiAwOToxNCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiBGcm9tOiBLZWZlbmcgV2FuZyA8d2Fu
Z2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+ClsuLi5dCj4+ICAgI2VuZGlmCj4gCj4gUmFuIHRo
aXMgc2VyaWVzIG9uIGFybTY0IHBsYXRmb3JtIGFmdGVyIGVuYWJsaW5nCj4gCj4gLSBDT05GSUdf
UEFHRV9UQUJMRV9DSEVDSwo+IC0gQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0tfRU5GT1JDRUQgKGF2
b2lkaW5nIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9uKQo+IAo+IEFmdGVyIHNvbWUgdGltZSwg
dGhlIGZvbGxvd2luZyBlcnJvciBjYW1lIHVwCj4gCj4gWyAgIDIzLjI2NjAxM10gLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gWyAgIDIzLjI2NjgwN10ga2VybmVsIEJVRyBh
dCBtbS9wYWdlX3RhYmxlX2NoZWNrLmM6OTAhCj4gWyAgIDIzLjI2NzYwOV0gSW50ZXJuYWwgZXJy
b3I6IE9vcHMgLSBCVUc6IDAgWyMxXSBQUkVFTVBUIFNNUAo+IFsgICAyMy4yNjg1MDNdIE1vZHVs
ZXMgbGlua2VkIGluOgo+IFsgICAyMy4yNjkwMTJdIENQVTogMSBQSUQ6IDMwIENvbW06IGtodWdl
cGFnZWQgTm90IHRhaW50ZWQgNS4xOC4wLXJjMy0wMDAwNC1nNjBhYThlMzYzYTkxICMyCj4gWyAg
IDIzLjI3MDM4M10gSGFyZHdhcmUgbmFtZTogbGludXgsZHVtbXktdmlydCAoRFQpCj4gWyAgIDIz
LjI3MTIxMF0gcHN0YXRlOiA0MDQwMDAwNSAoblpjdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQg
LVNTQlMgQlRZUEU9LS0pCj4gWyAgIDIzLjI3MjQ0NV0gcGMgOiBwYWdlX3RhYmxlX2NoZWNrX2Ns
ZWFyLmlzcmEuNisweDExNC8weDE0OAo+IFsgICAyMy4yNzM0MjldIGxyIDogcGFnZV90YWJsZV9j
aGVja19jbGVhci5pc3JhLjYrMHg2NC8weDE0OAo+IFsgICAyMy4yNzQzOTVdIHNwIDogZmZmZjgw
MDAwYWZiM2NhMAo+IFsgICAyMy4yNzQ5OTRdIHgyOTogZmZmZjgwMDAwYWZiM2NhMCB4Mjg6IGZm
ZmZmYzAwMDIyNTU4ZTggeDI3OiBmZmZmODAwMDBhMjdmNjI4Cj4gWyAgIDIzLjI3NjI2MF0geDI2
OiBmZmZmODAwMDA5ZjlmMmIwIHgyNTogZmZmZjAwMDA4YThkNTAwMCB4MjQ6IGZmZmY4MDAwMDlm
MDlmYTAKPiBbICAgMjMuMjc3NTI3XSB4MjM6IDAwMDBmZmZmODllMDAwMDAgeDIyOiBmZmZmODAw
MDA5ZjA5ZmI4IHgyMTogZmZmZjAwMDA4OTQxNGNjMAo+IFsgICAyMy4yNzg3OThdIHgyMDogMDAw
MDAwMDAwMDAwMDIwMCB4MTk6IGZmZmZmYzAwMDIyYTAwMDAgeDE4OiAwMDAwMDAwMDAwMDAwMDAx
Cj4gWyAgIDIzLjI4MDA2Nl0geDE3OiAwMDAwMDAwMDAwMDAwMDAxIHgxNjogMDAwMDAwMDAwMDAw
MDAwMCB4MTU6IDAwMDAwMDAwMDAwMDAwMDMKPiBbICAgMjMuMjgxMzMxXSB4MTQ6IDAwMDAwMDAw
MDAwMDAwNjggeDEzOiAwMDAwMDAwMDAwMDAwMGMwIHgxMjogMDAwMDAwMDAwMDAwMDAxMAo+IFsg
ICAyMy4yODI2MDJdIHgxMTogZmZmZmZjMDAwMjMyMDAwOCB4MTA6IGZmZmZmYzAwMDIzMjAwMDAg
eDkgOiBmZmZmODAwMDA5ZmExMDAwCj4gWyAgIDIzLjI4Mzg2OF0geDggOiAwMDAwMDAwMGZmZmZm
ZmZmIHg3IDogMDAwMDAwMDAwMDAwMDAwMSB4NiA6IGZmZmY4MDAwMDlmYTFmMDgKPiBbICAgMjMu
Mjg1MTM1XSB4NSA6IDAwMDAwMDAwMDAwMDAwMDAgeDQgOiAwMDAwMDAwMDAwMDAwMDAwIHgzIDog
MDAwMDAwMDAwMDAwMDAwMAo+IFsgICAyMy4yODY0MDZdIHgyIDogMDAwMDAwMDBmZmZmZmZmZiB4
MSA6IGZmZmYwMDAwODBmMjgwMGMgeDAgOiBmZmZmMDAwMDgwZjI4MDAwCj4gWyAgIDIzLjI4NzY3
M10gQ2FsbCB0cmFjZToKPiBbICAgMjMuMjg4MTIzXSAgcGFnZV90YWJsZV9jaGVja19jbGVhci5p
c3JhLjYrMHgxMTQvMHgxNDgKPiBbICAgMjMuMjg5MDQzXSAgX19wYWdlX3RhYmxlX2NoZWNrX3Bt
ZF9jbGVhcisweDNjLzB4NTAKPiBbICAgMjMuMjg5OTE4XSAgcG1kcF9jb2xsYXBzZV9mbHVzaCsw
eDExNC8weDM3MAo+IFsgICAyMy4yOTA2OTJdICBraHVnZXBhZ2VkKzB4MTE3MC8weDE5ZTAKPiBb
ICAgMjMuMjkxMzU2XSAga3RocmVhZCsweDExMC8weDEyMAo+IFsgICAyMy4yOTE5NDVdICByZXRf
ZnJvbV9mb3JrKzB4MTAvMHgyMAo+IFsgICAyMy4yOTI1OTZdIENvZGU6IDkxMDAxMDQxIGI4ZTgw
MDI0IDUxMDAwNDgyIDM2ZmZmZDYyIChkNDIxMDAwMCkKPiBbICAgMjMuMjkzNjc4XSAtLS1bIGVu
ZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiBbICAgMjMuMjk0NTExXSBub3RlOiBraHVn
ZXBhZ2VkWzMwXSBleGl0ZWQgd2l0aCBwcmVlbXB0X2NvdW50IDIKPiAKPiBMb29raW5nIGludG8g
ZmlsZSBtbS9wYWdlX3RhYmxlX2NoZWNrLmMgd2hlcmUgdGhpcyBwcm9ibGVtIG9jY3VyZWQuCj4g
Cj4gLyoKPiAgICogQW4gZW50eSBpcyByZW1vdmVkIGZyb20gdGhlIHBhZ2UgdGFibGUsIGRlY3Jl
bWVudCB0aGUgY291bnRlcnMgZm9yIHRoYXQgcGFnZQo+ICAgKiB2ZXJpZnkgdGhhdCBpdCBpcyBv
ZiBjb3JyZWN0IHR5cGUgYW5kIGNvdW50ZXJzIGRvIG5vdCBiZWNvbWUgbmVnYXRpdmUuCj4gICAq
Lwo+IHN0YXRpYyB2b2lkIHBhZ2VfdGFibGVfY2hlY2tfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAq
bW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQgbG9uZyBwZ2NudCkKPiB7Cj4gICAgICAg
ICAgc3RydWN0IHBhZ2VfZXh0ICpwYWdlX2V4dDsKPiAgICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFn
ZTsKPiAgICAgICAgICB1bnNpZ25lZCBsb25nIGk7Cj4gICAgICAgICAgYm9vbCBhbm9uOwo+IAo+
ICAgICAgICAgIGlmICghcGZuX3ZhbGlkKHBmbikpCj4gICAgICAgICAgICAgICAgICByZXR1cm47
Cj4gCj4gICAgICAgICAgcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Cj4gICAgICAgICAgcGFnZV9l
eHQgPSBsb29rdXBfcGFnZV9leHQocGFnZSk7Cj4gICAgICAgICAgYW5vbiA9IFBhZ2VBbm9uKHBh
Z2UpOwo+IAo+ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwZ2NudDsgaSsrKSB7Cj4gICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgcGFnZV90YWJsZV9jaGVjayAqcHRjID0gZ2V0X3BhZ2VfdGFibGVf
Y2hlY2socGFnZV9leHQpOwo+IAo+ICAgICAgICAgICAgICAgICAgaWYgKGFub24pIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgQlVHX09OKGF0b21pY19yZWFkKCZwdGMtPmZpbGVfbWFwX2Nv
dW50KSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEJVR19PTihhdG9taWNfZGVjX3JldHVy
bigmcHRjLT5hbm9uX21hcF9jb3VudCkgPCAwKTsKPiAgICAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEJVR19PTihhdG9taWNfcmVhZCgmcHRjLT5hbm9u
X21hcF9jb3VudCkpOwo+ICAgVHJpZ2dlcmVkIGhlcmUgPT09PT4+ICBCVUdfT04oYXRvbWljX2Rl
Y19yZXR1cm4oJnB0Yy0+ZmlsZV9tYXBfY291bnQpIDwgMCk7Cj4gICAgICAgICAgICAgICAgICB9
Cj4gICAgICAgICAgICAgICAgICBwYWdlX2V4dCA9IHBhZ2VfZXh0X25leHQocGFnZV9leHQpOwo+
ICAgICAgICAgIH0KPiB9Cj4gCj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCB3YXMgZXhwZWN0ZWQg
ZHVyaW5nIHBtZHBfY29sbGFwc2VfZmx1c2goKSB3aGljaCB3aGVuCj4gZmFpbGVkLCB0cmlnZ2Vy
ZWQgdGhpcyBCVUdfT04oKSA/IFRoaXMgY291bnRlciBzZWVtcyB0byBiZSBwYWdlIHRhYmxlIGNo
ZWNrCj4gc3BlY2lmaWMsIGNvdWxkIGl0IGp1c3QgZ28gd3JvbmcgPyBJIGhhdmUgbm90IGxvb2tl
ZCBpbnRvIHRoZSBkZXRhaWxzIGFib3V0Cj4gcGFnZSB0YWJsZSBjaGVjayBtZWNoYW5pc20uCj4g
Cj4gLSBBbnNodW1hbgo+IC4KCkhpIEFuc2h1bWFuOgoKVGhhbmtzIGZvciB5b3VyIGpvYi4KCkxl
dCBtZSBicmllZmx5IGV4cGxhaW4gdGhlIHByaW5jaXBsZSBvZiBwYWdlIHRhYmxlIGNoZWNrKFBU
QykuCgpQVEMgaW50cm9kdWNlcyB0aGUgZm9sbG93aW5nIHN0cnVjdCBmb3IgcGFnZSBtYXBwaW5n
IHR5cGUgY291bnQ6CnN0cnVjdCBwYWdlX3RhYmxlX2NoZWNrIHsKICAgICAgICAgYXRvbWljX3Qg
YW5vbl9tYXBfY291bnQ7CiAgICAgICAgIGF0b21pY190IGZpbGVfbWFwX2NvdW50Owp9OwpUaGlz
IHN0cnVjdHVyZSBjYW4gYmUgb2J0YWluZWQgYnkgImxvb2t1cF9wYWdlX2V4dChwYWdlKSIKCldo
ZW4gcGFnZSB0YWJsZSBlbnRyaWVzIGFyZSBzZXQocHVkL3BtZC9wdGUpLCBwYWdlX3RhYmxlX2No
ZWNrX3NldCgpICBpcyAKY2FsbGVkIHRvIGluY3JlYXNlIHRoZSBwYWdlIG1hcHBpbmcgY291bnQs
IEFsc28gY2hlY2sgZm9yIGVycm9ycyAoZWc6aWYgCmEgcGFnZSBpcyB1c2VkIGZvciBhbm9ueW1v
dXMgbWFwcGluZywgdGhlbiB0aGUgcGFnZSBjYW5ub3QgYmUgdXNlZCBmb3IgCmZpbGUgbWFwcGlu
ZyBhdCB0aGUgc2FtZSB0aW1lKS4KCldoZW4gcGFnZSB0YWJsZSBlbnRyaWVzIGFyZSBjbGVhcihw
dWQvcG1kL3B0ZSksIHBhZ2VfdGFibGVfY2hlY2tfY2xlYXIoKSAKICBpcyBjYWxsZWQgdG8gZGVj
cmVhc2UgdGhlIHBhZ2UgbWFwcGluZyBjb3VudCwgQWxzbyBjaGVjayBmb3IgZXJyb3JzLgoKVGhl
IGVycm9yIGNoZWNrIHJ1bGVzIGFyZSBkZXNjcmliZWQgaW4gdGhlIGZvbGxvd2luZyBkb2N1bWVu
dHM6IApEb2N1bWVudGF0aW9uL3ZtL3BhZ2VfdGFibGVfY2hlY2sucnN0CgpUaGUgc2V0dGluZyBh
bmQgY2xlYXJpbmcgb2YgcGFnZSB0YWJsZSBlbnRyaWVzIGFyZSBzeW1tZXRyaWNhbC4KCkhlcmUg
X19wYWdlX3RhYmxlX2NoZWNrX3BtZF9jbGVhcigpIHRyaWdnZXIgQlVHT04gd2hpY2ggaW5kaWNh
dGVzIHRoYXQgCnRoZSBwbWQgZW50cnkgZmlsZSBtYXBwaW5nIGNvdW50IGhhcyBiZWNvbWUgbmVn
YXRpdmUuCgpJIGd1ZXNzIGlmIFBUQyBkaWRuJ3QgZGV0ZWN0IHRoaXMgZXhjZXB0aW9uLCB3b3Vs
ZCB0aGVyZSBoYXZlIGJlZW4gYW55IApwcm9ibGVtcz8KClRoYW5rcywKVG9uZy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
