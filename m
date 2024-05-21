Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2717CC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NdhxwoxBKtVHtTU/r73/zt06XYQOwP1hmPNyKBWrBw=; b=QbkTE5CaP6LXbo
	LABMzaKi8JR6R8J4Z4qERsCLq1dFldy1FmxzlSLC1RdKZNiTRJzvP9NHgrYnCMTAqkr32m7N+hBg4
	XXkaSJmxSIMPVpeEbXr8T8CQJhHQMxtsTUBYF+AbMsZSL/ezVdB00jfOuy7ojioqYS08zFykx/ASR
	UOzwcIoV6Di0G/3e3RJGwgYTbUnowHhxrJambJRdH/EPUxe0YY/u1kKtE6S6iD+D+SWV8N9YCI8Cx
	njxLbkh/Y00PSbolVR7R16z/ce1AdmdYHszQOIMt2TWxmjnBb9bIaAJOqn+TzxgUeKcTUrL/8RBl6
	EbfiYV7Me/U7DDxeBvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QFi-00000000816-03sc;
	Tue, 21 May 2024 14:14:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QFf-000000007zE-0q9G
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 14:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 42794CE0F93;
	Tue, 21 May 2024 14:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09770C2BD11;
	Tue, 21 May 2024 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716300840;
	bh=IfBzG6Jslwq80j1PaUKC/nbk7dw2f5dLPW+Dn8TzDk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rDdLV31M/Rnssi32k8I78G80H12gj4bfX7j9DaXPEN1aX9BUsimWeZ3+kOnXz4pfR
	 KQthzpqNHet08+kfxxXHnZeMmeKBMbvK1UQpJukKPcYVOKTUE6xasKg+9d3p8/MaAh
	 qqcoqfuEt0DTPChsVyUvpCpLlnZBSWbAFQKsLWtXGaYOopGv5mnPuPiULVt90bwASL
	 8y0h+7Ann3k0lAFjAhqmVCAcWb879VbULQ0qQ2LqMezYPJIwWtlCSEw+3Ify3QQ1Lh
	 nDZjCDP/b3nGxujpdhnSLcI/76WZC0/20AtQ3lCE5861wlb213399eLa/lrT0ly4Lb
	 Q9qh9GAbQp5rQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 9/9] riscv: mm: Add support for ZONE_DEVICE
In-Reply-To: <CAHVXubirHPj1pZhU7sFxFTzBWz_Psf5uts9y3Dji-a03nb=_iw@mail.gmail.com>
References: <20240521114830.841660-1-bjorn@kernel.org>
 <20240521114830.841660-10-bjorn@kernel.org>
 <CAHVXubirHPj1pZhU7sFxFTzBWz_Psf5uts9y3Dji-a03nb=_iw@mail.gmail.com>
Date: Tue, 21 May 2024 16:13:57 +0200
Message-ID: <87pltfdzh6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_071403_643360_7BA2BB5E 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIFR1
ZSwgTWF5IDIxLCAyMDI0IGF0IDE6NDnigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKPj4KPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Pgo+PiBaT05FX0RFVklDRSBwYWdlcyBuZWVkIERFVk1BUCBQVEVzIHN1cHBvcnQgdG8gZnVu
Y3Rpb24KPj4gKEFSQ0hfSEFTX1BURV9ERVZNQVApLiBDbGFpbSBhbm90aGVyIFJTVyAocmVzZXJ2
ZWQgZm9yIHNvZnR3YXJlKSBiaXQKPj4gaW4gdGhlIFBURSBmb3IgREVWTUFQIG1hcmssIGFkZCB0
aGUgY29ycmVzcG9uZGluZyBoZWxwZXJzLCBhbmQgZW5hYmxlCj4+IEFSQ0hfSEFTX1BURV9ERVZN
QVAgZm9yIHJpc2N2NjQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggICB8
IDIwICsrKysrKysrKysrKysrKysrKysrCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUtYml0cy5oIHwgIDEgKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAg
ICB8IDE3ICsrKysrKysrKysrKysrKysrCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+PiBpbmRleCAyNzI0ZGMyYWYyOWYuLjBiNzQ2OThjNjNjNyAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAt
MzYsNiArMzYsNyBAQCBjb25maWcgUklTQ1YKPj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfTk9O
X09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UKPj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfUE1F
TV9BUEkKPj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfUFJFUEFSRV9TWU5DX0NPUkVfQ01ECj4+
ICsgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1BURV9ERVZNQVAgaWYgNjRCSVQgJiYgTU1VCj4+ICAg
ICAgICAgc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCj4+ICAgICAgICAgc2VsZWN0IEFSQ0hf
SEFTX1NFVF9ESVJFQ1RfTUFQIGlmIE1NVQo+PiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19TRVRf
TUVNT1JZIGlmIE1NVQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLTY0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+PiBpbmRleCAy
MjFhNWMxZWUyODcuLmM2N2E5YmJmZDAxMCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLTY0LmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLTY0LmgKPj4gQEAgLTQwMCw0ICs0MDAsMjQgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFn
ZSAqcGdkX3BhZ2UocGdkX3QgcGdkKQo+PiAgI2RlZmluZSBwNGRfb2Zmc2V0IHA0ZF9vZmZzZXQK
Pj4gIHA0ZF90ICpwNGRfb2Zmc2V0KHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcyk7
Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4+ICtzdGF0aWMgaW5s
aW5lIGludCBwdGVfZGV2bWFwKHB0ZV90IHB0ZSk7Cj4+ICtzdGF0aWMgaW5saW5lIHB0ZV90IHBt
ZF9wdGUocG1kX3QgcG1kKTsKPj4gKwo+PiArc3RhdGljIGlubGluZSBpbnQgcG1kX2Rldm1hcChw
bWRfdCBwbWQpCj4+ICt7Cj4+ICsgICAgICAgcmV0dXJuIHB0ZV9kZXZtYXAocG1kX3B0ZShwbWQp
KTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSBpbnQgcHVkX2Rldm1hcChwdWRfdCBwdWQp
Cj4+ICt7Cj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUg
aW50IHBnZF9kZXZtYXAocGdkX3QgcGdkKQo+PiArewo+PiArICAgICAgIHJldHVybiAwOwo+PiAr
fQo+PiArI2VuZGlmCj4+ICsKPj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BHVEFCTEVfNjRfSCAq
Lwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKPj4gaW5kZXggMTc5YmQ0YWZl
Y2U0Li5hOGY1MjA1Y2VhNTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS1iaXRzLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJp
dHMuaAo+PiBAQCAtMTksNiArMTksNyBAQAo+PiAgI2RlZmluZSBfUEFHRV9TT0ZUICAgICAgKDMg
PDwgOCkgICAgLyogUmVzZXJ2ZWQgZm9yIHNvZnR3YXJlICovCj4+Cj4+ICAjZGVmaW5lIF9QQUdF
X1NQRUNJQUwgICAoMSA8PCA4KSAgICAvKiBSU1c6IDB4MSAqLwo+PiArI2RlZmluZSBfUEFHRV9E
RVZNQVAgICAgKDEgPDwgOSkgICAgLyogUlNXLCBkZXZtYXAgKi8KPj4gICNkZWZpbmUgX1BBR0Vf
VEFCTEUgICAgIF9QQUdFX1BSRVNFTlQKPj4KPj4gIC8qCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4+IGluZGV4IDc5MzNmNDkzZGI3MS4uMDJmYWRjMjc2MDY0IDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+PiBAQCAtMzg3LDYgKzM4NywxMyBAQCBzdGF0aWMgaW5saW5lIGlu
dCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpCj4+ICAgICAgICAgcmV0dXJuIHB0ZV92YWwocHRlKSAm
IF9QQUdFX1NQRUNJQUw7Cj4+ICB9Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX1BURV9E
RVZNQVAKPj4gK3N0YXRpYyBpbmxpbmUgaW50IHB0ZV9kZXZtYXAocHRlX3QgcHRlKQo+PiArewo+
PiArICAgICAgIHJldHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9ERVZNQVA7Cj4+ICt9Cj4+ICsj
ZW5kaWYKPgo+IE5vdCBzdXJlIHlvdSBuZWVkIHRoZSAjaWZkZWYgaGVyZS4KClcvbyBpdCAzMmIg
YnVpbGRzIGJyZWFrICghZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUCkgd2lsbCBo
YXZlCmEgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbikuLiBNYXliZSBpdCdzIGNsZWFuZXIganVzdCB0
byB1c2UgdGhhdCBpbnN0ZWFkPwoKPj4gKwo+PiAgLyogc3RhdGljIGlubGluZSBwdGVfdCBwdGVf
cmRwcm90ZWN0KHB0ZV90IHB0ZSkgKi8KPj4KPj4gIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3dy
cHJvdGVjdChwdGVfdCBwdGUpCj4+IEBAIC00MjgsNiArNDM1LDExIEBAIHN0YXRpYyBpbmxpbmUg
cHRlX3QgcHRlX21rc3BlY2lhbChwdGVfdCBwdGUpCj4+ICAgICAgICAgcmV0dXJuIF9fcHRlKHB0
ZV92YWwocHRlKSB8IF9QQUdFX1NQRUNJQUwpOwo+PiAgfQo+Pgo+PiArc3RhdGljIGlubGluZSBw
dGVfdCBwdGVfbWtkZXZtYXAocHRlX3QgcHRlKQo+PiArewo+PiArICAgICAgIHJldHVybiBfX3B0
ZShwdGVfdmFsKHB0ZSkgfCBfUEFHRV9ERVZNQVApOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgaW5s
aW5lIHB0ZV90IHB0ZV9ta2h1Z2UocHRlX3QgcHRlKQo+PiAgewo+PiAgICAgICAgIHJldHVybiBw
dGU7Cj4+IEBAIC03MTEsNiArNzIzLDExIEBAIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21rZGly
dHkocG1kX3QgcG1kKQo+PiAgICAgICAgIHJldHVybiBwdGVfcG1kKHB0ZV9ta2RpcnR5KHBtZF9w
dGUocG1kKSkpOwo+PiAgfQo+Pgo+PiArc3RhdGljIGlubGluZSBwbWRfdCBwbWRfbWtkZXZtYXAo
cG1kX3QgcG1kKQo+PiArewo+PiArICAgICAgIHJldHVybiBwdGVfcG1kKHB0ZV9ta2Rldm1hcChw
bWRfcHRlKHBtZCkpKTsKPj4gK30KPj4gKwo+PiAgc3RhdGljIGlubGluZSB2b2lkIHNldF9wbWRf
YXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwbWRfdCAqcG1kcCwgcG1kX3QgcG1kKQo+PiAgewo+PiAt
LQo+PiAyLjQwLjEKPj4KPgo+IE90aGVyd2lzZSwgeW91IGNhbiBhZGQ6Cj4KPiBSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmsgeW91IQoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
