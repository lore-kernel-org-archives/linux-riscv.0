Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E074D41C25
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7xrZqAQfhrA/nGoq9Ck+FYULWJl0NWzvmtZK+NELRo=; b=V1dyfZ5tA77R0P
	IqlO60RzO6QiL9CtChg0tHFofx7H7Z07zKWvIwzx7CAo2797Bd6e++EYwljKdRQ6DXvdTfzAoawHf
	UyYyR4JnnVZ4Z5NfEgFeFFeVSHkozI/5w6q2y1wZi+mEtXb424avIx85gn7Gw6ge69obznTmHYgPO
	8ATee5XuMXOJzkBi9IEZLsGbWI88A0B0KlD3gHwZXoDbg86hAqG5PwSYxJl6J5HxLJ7ZI1TA2fFKg
	3ilv1aajkvZqyAg38eIQ+qOOC0mYvDIzO1c7XcHlvc9jSjG76vhNtKgH6NAY3m17UppBP4q6JV922
	ZTZmphRCIxX/PFMxphqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9jG-00000006Fjh-1llG;
	Wed, 13 Nov 2024 09:32:02 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9jD-00000006Fik-3MXi
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 09:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sYduzIL5xYBpOhZ4zkPNuY+2MR3kIHW4dW8GP+wbE6M=; b=P/DdhROfb/KqtB5HT2BcrTquBl
	+d2KfQEp+mzH+ZCMb9yqcVOBTqawFkEPbGCptxjt2M4N1erkfATzaWFn+Jj0km/CCGtKxwEA9AXLj
	3mFvkVDugO6j3PDdv4zEEofMF4GWEUCNZMAHJKMtiP2L5PeiR+dE3XAZCK//GX3mkWSvDOEeVvNqR
	UfdIPInb82K8VtEqmb0N6zHjClY3G4t3DPXc0Jnj4KsOOU9CFQcEyCJtrTq7hWzPgINqiYd850iQp
	XbRp81b3hVzWCRSifmHSy29e6qiCi0FE+9w4fI1C5f+p5GdvR/BzAL9sicvViYRNkZeKmxwJuU4VZ
	U3k6qJSQ==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tB9jA-003vND-Fb; Wed, 13 Nov 2024 09:31:57 +0000
Message-ID: <9b7165eb-43fc-40ab-80cd-dda61e2f933d@codethink.co.uk>
Date: Wed, 13 Nov 2024 09:31:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: traps: make insn fetch common in unknown
 instruction
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, ajones@ventanamicro.com, alex@ghiti.fr
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-3-ben.dooks@codethink.co.uk>
 <45408e3d-5b7a-40cc-bfca-b58cf3737c9c@codethink.co.uk>
Content-Language: en-GB
Organization: Codethink Limited.
In-Reply-To: <45408e3d-5b7a-40cc-bfca-b58cf3737c9c@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_013159_942992_6709A3D3 
X-CRM114-Status: GOOD (  16.00  )
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

T24gMTMvMTEvMjAyNCAwOToyMSwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDEzLzExLzIwMjQgMDk6
MTcsIEJlbiBEb29rcyB3cm90ZToKPj4gQWRkIHRoZSB0cmFwcGVkIGluc3RydWN0aW9uIChpbnNu
KSBhcyB0aGUgc2Vjb25kIGFyZ3VtZW50IHRvCj4+IHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIo
KSBmcm9tIHRoZSB0cmFwIGhhbmRsZXIgc28gd2hlbiB3ZQo+PiBhZGQgbW9yZSBoYW5kbGVycyB3
ZSBjYW4gZG8gdGhlIGZldGNoIG9mIHRoZSBpbnN0cnVjdGlvbiBqdXN0Cj4+IG9uY2UuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4g
LS0tCj4+IC0gZml4ZWQgd29yZGluZyBvZiBwYXRjaCBmcm9tIHJmYwo+PiAtLS0KPj4gwqAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCB8wqAgNCArKy0tCj4+IMKgIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmPCoMKgwqDCoMKgwqAgfCAxMSArKysrKysrKysrLQo+PiDCoCBhcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuY8KgwqDCoMKgwqAgfCAxMSArLS0tLS0tLS0tLQo+PiDCoCAzIGZp
bGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vIAo+PiB2ZWN0b3IuaAo+PiBpbmRleCBiZTdkMzA5Y2NhOGEuLmM5ZjBiMDJjZDk3
NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+PiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4+IEBAIC0yMSw3ICsyMSw3IEBACj4+
IMKgIGV4dGVybiB1bnNpZ25lZCBsb25nIHJpc2N2X3ZfdnNpemU7Cj4+IMKgIGludCByaXNjdl92
X3NldHVwX3ZzaXplKHZvaWQpOwo+PiAtYm9vbCByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKHN0
cnVjdCBwdF9yZWdzICpyZWdzKTsKPj4gK2Jvb2wgcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihz
dHJ1Y3QgcHRfcmVncyAqcmVncywgdTMyIGluc24pOwo+PiDCoCB2b2lkIGtlcm5lbF92ZWN0b3Jf
YmVnaW4odm9pZCk7Cj4+IMKgIHZvaWQga2VybmVsX3ZlY3Rvcl9lbmQodm9pZCk7Cj4+IMKgIHZv
aWQgZ2V0X2NwdV92ZWN0b3JfY29udGV4dCh2b2lkKTsKPj4gQEAgLTI2OCw3ICsyNjgsNyBAQCBz
dHJ1Y3QgcHRfcmVnczsKPj4gwqAgc3RhdGljIGlubGluZSBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6
ZSh2b2lkKSB7IHJldHVybiAtRU9QTk9UU1VQUDsgfQo+PiDCoCBzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGJvb2wgaGFzX3ZlY3Rvcih2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+PiAtc3RhdGljIGlu
bGluZSBib29sIHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
IAo+PiB7IHJldHVybiBmYWxzZTsgfQo+PiArc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfZmly
c3RfdXNlX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIAo+PiB1MzIgaW5zbikgeyByZXR1
cm4gZmFsc2U7IH0KPj4gwqAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5
KHN0cnVjdCBwdF9yZWdzICpyZWdzKSAKPj4geyByZXR1cm4gZmFsc2U7IH0KPj4gwqAgc3RhdGlj
IGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQpIHsgcmV0
dXJuIAo+PiBmYWxzZTsgfQo+PiDCoCAjZGVmaW5lIHJpc2N2X3ZfdnNpemUgKDApCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+PiBpbmRleCA1MWViZmQyM2UwMDcuLjFjM2ZhYjI3MmZkMSAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4+IEBAIC0xNzIsMTEgKzE3MiwyMCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBf
c2VjdGlvbiB2b2lkIAo+PiBkb190cmFwX2luc25faWxsZWdhbChzdHJ1Y3QgcHRfcmVncyAqcmUK
Pj4gwqDCoMKgwqDCoCBib29sIGhhbmRsZWQ7Cj4+IMKgwqDCoMKgwqAgaWYgKHVzZXJfbW9kZShy
ZWdzKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgdTMyIF9fdXNlciAqZXBjID0gKHUzMiBfX3VzZXIg
KilyZWdzLT5lcGM7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1MzIgaW5zbiA9ICh1MzIpcmVncy0+YmFk
YWRkcjsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaXJxZW50cnlfZW50ZXJfZnJvbV91c2Vy
X21vZGUocmVncyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4+
IC3CoMKgwqDCoMKgwqDCoCBoYW5kbGVkID0gcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihyZWdz
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghaW5zbikgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoX19nZXRfdXNlcihpbnNuLCBlcGMpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLyogdG9kbyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4g
Z3JyLCBvZiBjb3Vyc2UgYXMgc29vbiBhcyBpdCBpcyBzZW50IEkgbm90aWNlIHRoZSAvdG9kby8g
aGVyZQo+IAo+IE5vdCBzdXJlIGlmIHdlIHNob3VsZCBwcmludCBzb21ldGhpbmcgaWYgX19nZXRf
dXNlcigpIGZhaWxzIGZvcgo+IHdoYXQgL3Nob3VsZC8gYmUgYW4gZ29vZCBpbnN0cnVjdGlvbiBh
ZGRyc3MuLi4uIHNob3VsZCBwcm9iYWJseQo+IGF0LWxlYXN0IGJhaWwgb3V0IG9mIGRvX3RyYXBf
aW5zbl9pbGxlZ2FsKCkgaWYgbm90IGFsc28gcHJpbnQgYQo+IHdhcm5pbmcuCj4KCmkgdGhpbmsg
ZG9pbmc6CgoJaWYgKF9fX2dldF91c2VyKGluc24sIGVwcikpIHsKCQloYW5kbGVkID0gZmFsc2U7
CgkJaW5zbiA9IDA7Cgl9Cgp0aGVuIGp1c3QgY2hlY2tpbmcgZm9yICJpZiAoaW5zbikiIGJlZm9y
ZSBoYW5kIGhhbmRsZXJzLgoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5j
by51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0
dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
