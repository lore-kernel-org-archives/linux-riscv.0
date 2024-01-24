Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A5C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpzUl3mgW+h9qR7krkGLxKKrrpqrPwT9J6aODNvsKdw=; b=FmzBG5NS+JZVBF
	ifHW8yVHK1xS0RPbpwVs0CzuzrvV3A+NkozhRKse3GdNB5aXu+RCuaKbtZyG5Bz4N3QyAuTW0mMLU
	H7zoyYjWtPLWi0TDqU2H5UWPdHl9zAQP/NEyW48/u956s+1BsrBBNEBR6UedCpGDqV9tFgtCYRLWM
	QPZwnSJVAliNrOp/BlSJEhPCoDUI2nW7eim99D4BYQNHnipI+u7UKPIvkWXEaTECE9+8jYMrIWJvn
	JVYK+y4lUNb95ZEZ15CKP/BCNEiss1Iv5kdRvgF1g4e3WI61XQjezXlxSdZgfkJWG50dmXC2bqGp5
	KXlX2pdwgjDw/Y0jv9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSitC-004rii-1h;
	Wed, 24 Jan 2024 19:26:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSit9-004rhZ-1o
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 19:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0BE1CE312D;
	Wed, 24 Jan 2024 19:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D48FC433C7;
	Wed, 24 Jan 2024 19:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706124374;
	bh=1luHflipx08MCbwskQYWL44FDmImdsKPSiQ2SiqpMTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nmq3HUbXIzGld9+zZrrdh3XTvYDu2bcKTpFtnnB1njrhuAZzpUqwaJk58R1Bg4968
	 G9VQf8DaGxNSX7Cp3S0F073p8aqBUE8w2dUOqMqhIXr0BFKzjtf5UJ8O0I3B+3Scrt
	 twz/O/hEs3LR1FbuBVmFV7PQVaMma84l9+jgvIklBTTwf3jokMiLquShNKi/EnVrPr
	 LTpvm2L4LBJyPQVRG8rkrON40GwAvEot3s5SA1Bewk56YYgP2vPl+vdGDVaFw4/Fq/
	 cyt3rDXosI2RKxqwda8nK3DgxVdDVdQ+KtYHGbFaA9XOeXiQEDCXKmRKZSEEjffWEA
	 3+kMhp7m51WXQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, Christoph =?utf-8?Q?M=C3=BCllner?=
 <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Conor Dooley
 <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: qemu riscv, thead c906, Linux boot regression
In-Reply-To: <78107c83-7035-414c-9a44-af5e234fd5c2@ventanamicro.com>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
 <78107c83-7035-414c-9a44-af5e234fd5c2@ventanamicro.com>
Date: Wed, 24 Jan 2024 20:26:10 +0100
Message-ID: <87wmryr0rx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_112619_965860_FBB481B9 
X-CRM114-Status: GOOD (  14.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+IHdyaXRl
czoKCj4gT24gMS8yNC8yNCAwOTo0OSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gSGkhCj4+IAo+
PiBJIGJ1bXBlZCB0aGUgUklTQy1WIExpbnV4IGtlcm5lbCBDSSB0byB1c2UgcWVtdSA4LjIuMCwg
YW5kIHJlYWxpemVkIHRoYXQKPj4gdGhlYWQgYzkwNiBkaWRuJ3QgYm9vdCBhbnltb3JlLiBCaXNl
Y3Rpb24gcG9pbnRzIHRvIGNvbW1pdCBkNmE0MjdlMmMwYjIKPj4gKCJ0YXJnZXQvcmlzY3YvY3B1
LmM6IHJlc3RyaWN0ICdtYXJjaGlkJyB2YWx1ZSIpCj4+IAo+PiBSZXZlcnRpbmcgdGhhdCBjb21t
aXQsIG9yIHRoZSBoYWNrIGJlbG93IHNvbHZlcyB0aGUgYm9vdCBpc3N1ZToKPj4gCj4+IC0tODwt
LQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5j
Cj4+IGluZGV4IDhjYmZjN2U3ODFhZC4uZTE4NTk2YzhhNTVhIDEwMDY0NAo+PiAtLS0gYS90YXJn
ZXQvcmlzY3YvY3B1LmMKPj4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jCj4+IEBAIC01MDUsNiAr
NTA1LDkgQEAgc3RhdGljIHZvaWQgcnY2NF90aGVhZF9jOTA2X2NwdV9pbml0KE9iamVjdCAqb2Jq
KQo+PiAgICAgICBjcHUtPmNmZy5leHRfeHRoZWFkc3luYyA9IHRydWU7Cj4+ICAgCj4+ICAgICAg
IGNwdS0+Y2ZnLm12ZW5kb3JpZCA9IFRIRUFEX1ZFTkRPUl9JRDsKPj4gKyAgICBjcHUtPmNmZy5t
YXJjaGlkID0gKChRRU1VX1ZFUlNJT05fTUFKT1IgPDwgMTYpIHwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIChRRU1VX1ZFUlNJT05fTUlOT1IgPDwgOCkgIHwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIChRRU1VX1ZFUlNJT05fTUlDUk8pKTsKPj4gICAjaWZuZGVmIENPTkZJR19VU0VS
X09OTFkKPj4gICAgICAgc2V0X3NhdHBfbW9kZV9tYXhfc3VwcG9ydGVkKGNwdSwgVk1fMV8xMF9T
VjM5KTsKPj4gICAjZW5kaWYKPj4gLS04PC0tCj4+IAo+PiBJJ20gdW5zdXJlIHdoYXQgdGhlIGNv
cnJlY3QgcWVtdSB3YXkgb2YgYWRkaW5nIGEgZGVmYXVsdCB2YWx1ZSBpcywKPj4gb3IgaWYgYzkw
NiBzaG91bGQgaGF2ZSBhIHByb3BlciBtYXJjaGlkLgo+Cj4gSW4gY2FzZSB5b3UgbmVlZCB0byBz
ZXQgYSAnbWFyY2hpZCcgZGlmZmVyZW50IHRoYW4gemVybyBmb3IgYzkwNiwgdGhpcyBoYWNrIHdv
dWxkCj4gYmUgYSBwcm9wZXIgZml4LiBBcyBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtc2cgb2Yg
dGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ6Cj4KPiAiTmFtZWQgQ1BVcyBzaG91bGQgc2V0ICdtYXJj
aGlkJyB0byBhIG1lYW5pbmdmdWwgdmFsdWUgaW5zdGVhZCwgYW5kIGdlbmVyaWMKPiAgIENQVXMg
Y2FuIHNldCB0byBhbnkgdmFsaWQgdmFsdWUuIgo+Cj4gVGhhdCBtZWFucyB0aGF0IGFueSBzcGVj
aWZpYyBtYXJjaGlkIHZhbHVlIHRoYXQgdGhlIENQVSB1c2VzIG11c3QgdG8gYmUgc2V0Cj4gaW4g
aXRzIG93biBjcHVfaW5pdCgpIGZ1bmN0aW9uLgoKR290IGl0LiBUaGFua3MsIERhbmllbCEKCkZv
ciBjb21wbGV0ZW5lc3MgKHNpbmNlIGl0IGNhbWUgdXAgb24gdGhlIHdlZWtseSBQVyBjYWxsKTsg
Q29ub3IgcG9pbnRlZApvdXQgdGhhdCB6ZXJvICppcyogaW5kZWVkIHRoZSByaWdodCBtYXJjaGlk
IGZvciBjOTA2LCBhbmQgaW4gZmFjdCwgdGhlCm5vbi16ZXJvIG1hcmNoaWQgcHJlIGNvbW1pdCBk
NmE0MjdlMmMwYjIgd2FzIGluY29ycmVjdC4KClBvc3QgY29tbWl0IGQ2YTQyN2UyYzBiMiwgdGhl
IGNvcnJlY3QgYWx0ZXJuYXRpdmUgaXMgcGlja2VkIHVwLCBhbmQKRVJSQVRBX1RIRUFEX1BCTVQg
KHVzaW5nIG5vbi1zdGFuZGFyZCBtZW1vcnkgdHlwZSBiaXRzIGluCnBhZ2UtdGFibGUtZW50cmll
cykga2lja3MgaW4uIEFGQUlVLCB0aGF0J3Mgbm90IGltcGxlbWVudGVkIGJ5IHFlbXUncwpjOTA2
IHN1cHBvcnQsIHdoaWNoIHRoZW4gdHJhcHMuCgpUaGF0J3MgdGhlIHRoZW9yeS4gTWF5YmUgQ2hy
aXN0b3BoIGtub3dzIGlmIHRoZSBub24tc3RhbmRhcmQgYml0cyBhcmUKaW1wbGVtZW50ZWQgb3Ig
bm90PwoKUmVnYXJkbGVzczsgSSByZW1vdmVkIGJvb3RpbmcgUWVtdSBULWhlYWQgYzkwNiBmcm9t
IHRoZSBDSSwgYW5kIHRoZQpidWlsZC9ib290IHBhc3NlcyBuaWNlbHkgOy0pIFsxXQoKCkJqw7Zy
bgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi9hY3Rpb25z
L3J1bnMvNzY0MTc2NDc1OS9qb2IvMjA4MTk4MDEyMzU/cHI9NDQ3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
