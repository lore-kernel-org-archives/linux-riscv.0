Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5A4C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 04:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZHe8DiOjkr4z+XFytWb61oLUYITIZP4B8z+jWv/IV0=; b=FcwXsw9a3Gx5du
	kpizxWOwgtRs26fMimzp6yxCvykiOLA782WcLHVPqHZDXFF7gSs10sjPhGEtNEJ4o9LUQaD3n0M7T
	4XdUsZVlIEPdghwDTKY1059qNoMg472ovNpD+fO2tMesgni0ohgsulE0ddJ5UDsU/Af3Xy6WZRnT1
	ZR5VvYtobvgBUehn9IjKkkmdHVChRHOpKRfX9IhYOFR0W+ORz8rjuEV5Yanv1YYDOEz6yqD8npvwu
	v47k3Cr+GW2mKZhA2XVgfJ18fTUMnv4744oUWL5KsMom2YkXjlCzJyiUqgNx+2YtMB6mfHBpfDQln
	zHUiCXkuYDJZ5gOL1wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niTZy-005jZl-M2; Sun, 24 Apr 2022 04:10:34 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niTZl-005jXn-4F; Sun, 24 Apr 2022 04:10:25 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KmF5X0CPwz1JB4m;
 Sun, 24 Apr 2022 12:09:20 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Apr 2022 12:10:09 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Apr 2022 12:10:08 +0800
Message-ID: <eaf17cfc-880e-2181-b253-d520781c428f@huawei.com>
Date: Sun, 24 Apr 2022 12:10:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 3/5] mm: page_table_check: add hooks to public
 helpers
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
 <20220421082042.1167967-4-tongtiangen@huawei.com>
 <7fc56f41-a3c2-76be-7a20-dda392f3c4fc@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <7fc56f41-a3c2-76be-7a20-dda392f3c4fc@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_211021_521445_152DCE0F 
X-CRM114-Status: GOOD (  19.53  )
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

CgrlnKggMjAyMi80LzIyIDE0OjA1LCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4gCj4gCj4g
T24gNC8yMS8yMiAxMzo1MCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+PiBNb3ZlIHB0ZXBfY2xlYXIo
KSB0byB0aGUgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYW5kIGFkZCBwYWdlIHRhYmxlIGNoZWNr
Cj4+IHJlbGF0ZSBob29rcyB0byBzb21lIGhlbHBlcnMsIGl0J3MgcHJlcGFyZSBmb3Igc3VwcG9y
dCBwYWdlIHRhYmxlIGNoZWNrCj4+IGZlYXR1cmUgb24gbmV3IGFyY2hpdGVjdHVyZS4KPiAKPiBD
b3VsZCBpbnN0cnVtZW50aW5nIGdlbmVyaWMgcGFnZSB0YWJsZSBoZWxwZXJzIChmYWxsYmFjayBp
bnN0YW5jZXMgd2hlbiBpdHMKPiBjb3JyZXNwb25kaW5nIF9fSEFWRV9BUkNIX1hYWCBpcyBub3Qg
ZGVmaW5lZCBvbiB0aGUgcGxhdGZvcm0pLCBtaWdodCBhZGQgYWxsCj4gdGhlIHBhZ2UgdGFibGUg
Y2hlY2sgaG9va3MgaW50byBwYXRocyBvbiBwbGF0Zm9ybXMgd2hpY2ggaGF2ZSBub3Qgc3Vic2Ny
aWJlZAo+IEFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyBpbiB0aGUgZmlyc3QgcGxhY2Ug
PyBBbHRob3VnaCB0aGVzZSBsb29rcyBoYXZlCj4gIUNPTkZJR19QQUdFX1RBQkxFX0NIRUNLIGZh
bGxiYWNrIHN0dWJzIGluIHRoZSBoZWFkZXIsIGhlbmNlIGEgYnVpbGQgcHJvYmxlbQo+IGdldHMg
YXZvaWRlZC4KClJpZ2h0LCBidWlsZCBwcm9ibGVtcyBhcmUgYXZvaWRlZCBieSBmYWxsYmFjayBz
dHVicyBpbiB0aGUgaGVhZGVyIGZpbGUuCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb25nIFRp
YW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+Cj4+IEFja2VkLWJ5OiBQYXNoYSBUYXRhc2hp
biA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC94ODYvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oIHwgMTAgLS0tLS0tLS0tLQo+PiAgIGluY2x1ZGUvbGludXgvcGd0YWJs
ZS5oICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+PiBpbmRleCA1NjRhYmU0MmIwZjcuLjUxY2QzOTg1OGY4MSAxMDA2NDQKPj4g
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+PiBAQCAtMTA3MywxNiArMTA3Myw2IEBAIHN0YXRpYyBpbmxp
bmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyX2Z1bGwoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+
ICAgCXJldHVybiBwdGU7Cj4+ICAgfQo+PiAgIAo+PiAtI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQ
X0NMRUFSCj4gCj4gQUZJQ1MgWDg2IGlzIHRoZSBvbmx5IHBsYXRmb3JtIHN1YnNjcmliaW5nIF9f
SEFWRV9BUkNIX1BURVBfQ0xFQVIuIEhlbmNlIGlmCj4gdGhpcyBpcyBnZXR0aW5nIGRyb3BwZWQg
Zm9yIGdlbmVyaWMgcHRlcF9jbGVhcigpLCB0aGVuIG5vIG5lZWQgdG8gYWRkIGJhY2sKPiAjaWZu
ZGVkIF9fSEFWRV9BUkNIX1BURVBfQ0xFQVIgY29uc3RydWN0LiBHZW5lcmljIHB0ZXBfY2xlYXIo
KSBpcyB0aGUgb25seQo+IGRlZmluaXRpb24gZm9yIGFsbCBwbGF0Zm9ybXMgPwo+IAo+IEFsc28g
aWYgdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gZHJvcCBvZmYgX19IQVZFX0FSQ0hfUFRFUF9DTEVB
UiBhbG9uZyB3aXRoCj4gb3RoZXIgcGFnZSB0YWJsZSBjaGVjayByZWxhdGVkIGNoYW5nZXMsIGl0
IG5lZWRzIHRvIGJlIGRvbmUgdmlhIGEgc2VwYXJhdGUKPiBwYXRjaCBpbnN0ZWFkLgoKQWdyZWVk
LgpJTU8sIHRoaXMgZml4IGNhbiBiZSBwYXRjaGVkIGxhdGVyLgoKPiAKPj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBwdGVwX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCj4+IC0JCQkgICAgICBwdGVfdCAqcHRlcCkKPj4gLXsKPj4gLQlpZiAoSVNfRU5BQkxFRChD
T05GSUdfUEFHRV9UQUJMRV9DSEVDSykpCj4+IC0JCXB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRk
ciwgcHRlcCk7Cj4+IC0JZWxzZQo+PiAtCQlwdGVfY2xlYXIobW0sIGFkZHIsIHB0ZXApOwo+PiAt
fQo+PiAtCj4+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQX1NFVF9XUlBST1RFQ1QKPj4gICBz
dGF0aWMgaW5saW5lIHZvaWQgcHRlcF9zZXRfd3Jwcm90ZWN0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+PiAgIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwKQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4L3BndGFibGUu
aAo+PiBpbmRleCA0OWFiOGVlMmQ2ZDcuLjEwZDJkOTFlZGYyMCAxMDA2NDQKPj4gLS0tIGEvaW5j
bHVkZS9saW51eC9wZ3RhYmxlLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPj4g
QEAgLTEyLDYgKzEyLDcgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4+ICAgI2luY2x1
ZGUgPGxpbnV4L2Vycm5vLmg+Cj4+ICAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGVfdWZm
ZC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3BhZ2VfdGFibGVfY2hlY2suaD4KPj4gICAKPj4gICAj
aWYgNSAtIGRlZmluZWQoX19QQUdFVEFCTEVfUDREX0ZPTERFRCkgLSBkZWZpbmVkKF9fUEFHRVRB
QkxFX1BVRF9GT0xERUQpIC0gXAo+PiAgIAlkZWZpbmVkKF9fUEFHRVRBQkxFX1BNRF9GT0xERUQp
ICE9IENPTkZJR19QR1RBQkxFX0xFVkVMUwo+PiBAQCAtMjcyLDE0ICsyNzMsNiBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKHZvaWQpCj4+ICAgfQo+PiAgICNlbmRp
Zgo+PiAgIAo+PiAtI2lmbmRlZiBfX0hBVkVfQVJDSF9QVEVQX0NMRUFSCj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgcHRlcF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+PiAtCQkJICAgICAgcHRlX3QgKnB0ZXApCj4+IC17Cj4+IC0JcHRlX2NsZWFyKG1tLCBh
ZGRyLCBwdGVwKTsKPj4gLX0KPj4gLSNlbmRpZgo+PiAtCj4+ICAgI2lmbmRlZiBfX0hBVkVfQVJD
SF9QVEVQX0dFVF9BTkRfQ0xFQVIKPj4gICBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2Fu
ZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4gICAJCQkJICAgICAgIHVuc2lnbmVkIGxv
bmcgYWRkcmVzcywKPj4gQEAgLTI4NywxMCArMjgwLDIyIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3Qg
cHRlcF9nZXRfYW5kX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+PiAgIHsKPj4gICAJcHRl
X3QgcHRlID0gKnB0ZXA7Cj4+ICAgCXB0ZV9jbGVhcihtbSwgYWRkcmVzcywgcHRlcCk7Cj4+ICsJ
cGFnZV90YWJsZV9jaGVja19wdGVfY2xlYXIobW0sIGFkZHJlc3MsIHB0ZSk7Cj4+ICAgCXJldHVy
biBwdGU7Cj4+ICAgfQo+PiAgICNlbmRpZgo+PiAgIAo+PiArI2lmbmRlZiBfX0hBVkVfQVJDSF9Q
VEVQX0NMRUFSCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHRlcF9jbGVhcihzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiArCQkJICAgICAgcHRlX3QgKnB0ZXApCj4+
ICt7Cj4+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0spKQo+PiArCQlw
dGVwX2dldF9hbmRfY2xlYXIobW0sIGFkZHIsIHB0ZXApOwo+PiArCWVsc2UKPj4gKwkJcHRlX2Ns
ZWFyKG1tLCBhZGRyLCBwdGVwKTsKPiAKPiBDb3VsZCBub3QgdGhpcyBiZSByZXdvcmtlZCB0byBh
dm9pZCBJU19FTkFCTEVEKCkgPyBUaGlzIGlzIGNvbmZ1c2luZy4gSWYgdGhlIHBhZ2UKPiB0YWJs
ZSBob29rcyBjYW4gYmUgYWRkZWQgdG8gYWxsIHBvdGVudGlhbCBwYWdlIHRhYmxlIHBhdGhzIHZp
YSBnZW5lcmljIGhlbHBlcnMsCj4gaXJyZXNwZWN0aXZlIG9mIENPTkZJR19QQUdFX1RBQkxFX0NI
RUNLIG9wdGlvbiwgdGhlcmUgaXMgbm8gcmF0aW9uYWxlIGZvciBkb2luZwo+IGEgSVNfRU5BQkxF
RCgpIGNoZWNrIGhlcmUuCj4gCgogRnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgY29kZSBsb2dpYywg
d2UgbmVlZCB0byBjaGVjayB0aGUgcHRlIGJlZm9yZSAKYmVpbmcgY2xlYXJlZC4gV2hldGhlciBw
dGUgY2hlY2sgaXMgcmVxdWlyZWQgZGVwZW5kcyBvbiBJU19FTkFCTEVEKCkuCgpBcmUgdGhlcmUg
YW55IHN1Z2dlc3Rpb25zIGZvciBiZXR0ZXIgaW1wbGVtZW50YXRpb24/CgpUaGFuayB5b3UsClRv
bmcuCgo+PiArfQo+PiArI2VuZGlmCj4+ICsKPj4gICAjaWZuZGVmIF9fSEFWRV9BUkNIX1BURVBf
R0VUCj4+ICAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVwX2dldChwdGVfdCAqcHRlcCkKPj4gICB7
Cj4+IEBAIC0zNjAsNyArMzY1LDEwIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kcF9odWdlX2dl
dF9hbmRfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+ICAgCQkJCQkgICAgcG1kX3QgKnBt
ZHApCj4+ICAgewo+PiAgIAlwbWRfdCBwbWQgPSAqcG1kcDsKPj4gKwo+PiAgIAlwbWRfY2xlYXIo
cG1kcCk7Cj4+ICsJcGFnZV90YWJsZV9jaGVja19wbWRfY2xlYXIobW0sIGFkZHJlc3MsIHBtZCk7
Cj4+ICsKPj4gICAJcmV0dXJuIHBtZDsKPj4gICB9Cj4+ICAgI2VuZGlmIC8qIF9fSEFWRV9BUkNI
X1BNRFBfSFVHRV9HRVRfQU5EX0NMRUFSICovCj4+IEBAIC0zNzIsNiArMzgwLDggQEAgc3RhdGlj
IGlubGluZSBwdWRfdCBwdWRwX2h1Z2VfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKPj4gICAJcHVkX3QgcHVkID0gKnB1ZHA7Cj4+ICAgCj4+ICAgCXB1ZF9jbGVhcihwdWRwKTsK
Pj4gKwlwYWdlX3RhYmxlX2NoZWNrX3B1ZF9jbGVhcihtbSwgYWRkcmVzcywgcHVkKTsKPj4gKwo+
PiAgIAlyZXR1cm4gcHVkOwo+PiAgIH0KPj4gICAjZW5kaWYgLyogX19IQVZFX0FSQ0hfUFVEUF9I
VUdFX0dFVF9BTkRfQ0xFQVIgKi8KPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
