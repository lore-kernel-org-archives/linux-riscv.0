Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D21C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdJ7gbcKi5ilzbeqVvJxm2EgWLec//ZIm9pLJB8Y9vQ=; b=w6zWaRj43ax066
	TkXSByAUJfCtbAc7JsSdzHA6krhbQ+oVhFkMP04gY8IaSV4cGfBt3dnpESog9ufF1wynaofJ3WdJP
	RWSgaJHakJvw5PTlZf5Qrz93ztRaxGNvoJ/LIYaCL0gIHeAYd4fPugPAaj1gQSEP6+ZxjezfRZSsA
	xeTVgfDqrDnqe1ziF/k58D9k74Fp8ZOhO5zN/uOiYCrGJ+CwPSF7L2y+79f+yUKzlwpfun406XHXe
	ZtLeE2Y/8TwCxUXPe7iS8mXGOV9wRxUGpY6nhKCt+pr4VNfgn4I3L2wyt2/q5XcgBgMWw/Ebreooc
	zDt8DFg2lxGipEfoqHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v5a-0000000GWvR-150R;
	Tue, 14 May 2024 16:33:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v5X-0000000GWuH-1GrT
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 16:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80B22CE12A5;
	Tue, 14 May 2024 16:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F1BC2BD10;
	Tue, 14 May 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715704392;
	bh=2O3FVoVp95G4P4aUBtb5SLdBJuD22ckBazyVVu22ZDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WTI29hSiyDCBZ/ISmRKtXANpO+MIhVZR4JWCVcJqN9/o+DiUQ5X0GEXAdrgRbrqyZ
	 b+wMqcBFG+zX/Kql95Loc0oVKFWI3aDu/VsJ6sUjSCyxr34W2VMnjPBg7uvGlV/hZf
	 58sTwPUhjQ7JMumSjb2rr2cwE1QWDF6sGQYy+c8i5MpLLEcO/yEfjel9AzUt4f9Ndw
	 iHHJc31d3f817J5K1WR8DjMU2QpBKILOiQ3F5iJ+kPtnSXMw28vI/Wyx4ymQyRvfsG
	 S0fOOCFPj7SWbYL/SpOwoFMZPh2UYXNv3uMEs0lkKg9UHfVRQRY8cPajbAQF84TznI
	 /HHuZ+HKrZCgw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 1/8] riscv: mm: Pre-allocate vmemmap/direct map PGD
 entries
In-Reply-To: <CAHVXubhfsvDZrw_Cvg8AnEm00P0TQvrSOV_jVSBRckmJLp6EFQ@mail.gmail.com>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-2-bjorn@kernel.org>
 <CAHVXubhfsvDZrw_Cvg8AnEm00P0TQvrSOV_jVSBRckmJLp6EFQ@mail.gmail.com>
Date: Tue, 14 May 2024 18:33:09 +0200
Message-ID: <87wmnwtku2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_093315_728659_283427FA 
X-CRM114-Status: GOOD (  20.82  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEhpIEJq
w7ZybiwKPgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDI0IGF0IDQ6MDXigK9QTSBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+Pgo+PiBUaGUgUklTQy1WIHBvcnQgY29waWVzIHRoZSBQR0QgdGFi
bGUgZnJvbSBpbml0X21tL3N3YXBwZXJfcGdfZGlyIHRvCj4+IGFsbCB1c2VybGFuZCBwYWdlIHRh
Ymxlcywgd2hpY2ggbWVhbnMgdGhhdCBpZiB0aGUgUEdEIGxldmVsIHRhYmxlIGlzCj4+IGNoYW5n
ZWQsIG90aGVyIHBhZ2UgdGFibGVzIGhhcyB0byBiZSB1cGRhdGVkIGFzIHdlbGwuCj4+Cj4+IElu
c3RlYWQgb2YgaGF2aW5nIHRoZSBQR0QgY2hhbmdlcyByaXBwbGUgb3V0IHRvIGFsbCB0YWJsZXMs
IHRoZQo+PiBzeW5jaHJvbml6YXRpb24gY2FuIGJlIGF2b2lkZWQgYnkgcHJlLWFsbG9jYXRpbmcg
dGhlIFBHRCBlbnRyaWVzL3BhZ2VzCj4+IGF0IGJvb3QsIGF2b2lkaW5nIHRoZSBzeW5jaHJvbml6
YXRpb24gYWxsIHRvZ2V0aGVyLgo+Pgo+PiBUaGlzIGlzIGN1cnJlbnRseSBkb25lIGZvciB0aGUg
YnBmL21vZHVsZXMsIGFuZCB2bWFsbG9jIFBHRCByZWdpb25zLgo+PiBFeHRlbmQgdGhpcyBzY2hl
bWUgZm9yIHRoZSBQR0QgcmVnaW9ucyB0b3VjaGVkIGJ5IG1lbW9yeSBob3RwbHVnZ2luZy4KPj4K
Pj4gUHJlcGFyZSB0aGUgUklTQy1WIHBvcnQgZm9yIG1lbW9yeSBob3RwbHVnIGJ5IHByZS1hbGxv
Y2F0ZQo+PiB2bWVtbWFwL2RpcmVjdCBtYXAgZW50cmllcyBhdCB0aGUgUEdEIGxldmVsLiBUaGlz
IHdpbGwgcm91Z2hseSB3YXN0ZQo+PiB+MTI4IHdvcnRoIG9mIDRLIHBhZ2VzIHdoZW4gbWVtb3J5
IGhvdHBsdWdnaW5nIGlzIGVuYWJsZWQgaW4gdGhlCj4+IGtlcm5lbCBjb25maWd1cmF0aW9uLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+
IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIHwgNCArKy0tCj4+ICBhcmNo
L3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgfCA3ICsrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNh
bi5oCj4+IGluZGV4IDBiODVlMzYzZTc3OC4uZTZhMDA3MWJkYjU2IDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rYXNhbi5oCj4+IEBAIC02LDggKzYsNiBAQAo+Pgo+PiAgI2lmbmRlZiBfX0FTU0VNQkxZ
X18KPj4KPj4gLSNpZmRlZiBDT05GSUdfS0FTQU4KPj4gLQo+PiAgLyoKPj4gICAqIFRoZSBmb2xs
b3dpbmcgY29tbWVudCB3YXMgY29waWVkIGZyb20gYXJtNjQ6Cj4+ICAgKiBLQVNBTl9TSEFET1df
U1RBUlQ6IGJlZ2lubmluZyBvZiB0aGUga2VybmVsIHZpcnR1YWwgYWRkcmVzc2VzLgo+PiBAQCAt
MzQsNiArMzIsOCBAQAo+PiAgICovCj4+ICAjZGVmaW5lIEtBU0FOX1NIQURPV19TVEFSVCAgICAg
KChLQVNBTl9TSEFET1dfRU5EIC0gS0FTQU5fU0hBRE9XX1NJWkUpICYgUEdESVJfTUFTSykKPj4g
ICNkZWZpbmUgS0FTQU5fU0hBRE9XX0VORCAgICAgICBNT0RVTEVTX0xPV0VTVF9WQUREUgo+PiAr
Cj4+ICsjaWZkZWYgQ09ORklHX0tBU0FOCj4+ICAjZGVmaW5lIEtBU0FOX1NIQURPV19PRkZTRVQg
ICAgX0FDKENPTkZJR19LQVNBTl9TSEFET1dfT0ZGU0VULCBVTCkKPj4KPj4gIHZvaWQga2FzYW5f
aW5pdCh2b2lkKTsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9y
aXNjdi9tbS9pbml0LmMKPj4gaW5kZXggMjU3NGY2YTNiMGU3Li41YjhjZGZhZmI1MmEgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4+IEBAIC0yNyw2ICsyNyw3IEBACj4+Cj4+ICAjaW5jbHVkZSA8YXNtL2ZpeG1hcC5oPgo+
PiAgI2luY2x1ZGUgPGFzbS9pby5oPgo+PiArI2luY2x1ZGUgPGFzbS9rYXNhbi5oPgo+PiAgI2lu
Y2x1ZGUgPGFzbS9udW1hLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPj4gICNpbmNs
dWRlIDxhc20vc2VjdGlvbnMuaD4KPj4gQEAgLTE0ODgsMTAgKzE0ODksMTYgQEAgc3RhdGljIHZv
aWQgX19pbml0IHByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb24KPj4gICAgICAgICBwYW5pYygiRmFpbGVkIHRvIHByZS1hbGxvY2F0ZSAl
cyBwYWdlcyBmb3IgJXMgYXJlYVxuIiwgbHZsLCBhcmVhKTsKPj4gIH0KPj4KPj4gKyNkZWZpbmUg
UEFHRV9FTkQgS0FTQU5fU0hBRE9XX1NUQVJUCj4+ICsKPj4gIHZvaWQgX19pbml0IHBndGFibGVf
Y2FjaGVfaW5pdCh2b2lkKQo+PiAgewo+PiAgICAgICAgIHByZWFsbG9jYXRlX3BnZF9wYWdlc19y
YW5nZShWTUFMTE9DX1NUQVJULCBWTUFMTE9DX0VORCwgInZtYWxsb2MiKTsKPj4gICAgICAgICBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfTU9EVUxFUykpCj4+ICAgICAgICAgICAgICAgICBwcmVhbGxv
Y2F0ZV9wZ2RfcGFnZXNfcmFuZ2UoTU9EVUxFU19WQUREUiwgTU9EVUxFU19FTkQsICJicGYvbW9k
dWxlcyIpOwo+PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NRU1PUllfSE9UUExVRykp
IHsKPj4gKyAgICAgICAgICAgICAgIHByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShWTUVNTUFQ
X1NUQVJULCBWTUVNTUFQX0VORCwgInZtZW1tYXAiKTsKPj4gKyAgICAgICAgICAgICAgIHByZWFs
bG9jYXRlX3BnZF9wYWdlc19yYW5nZShQQUdFX09GRlNFVCwgUEFHRV9FTkQsICJkaXJlY3QgbWFw
Iik7Cj4+ICsgICAgICAgfQo+PiAgfQo+PiAgI2VuZGlmCj4+IC0tCj4+IDIuNDAuMQo+Pgo+Cj4g
QXMgeW91IGFza2VkLCB3aXRoCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyNDA1MTQxMzM2MTQuODc4MTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tL1QvI3UsCj4geW91
IHdpbGwgYmUgYWJsZSB0byByZW1vdmUgdGhlIHVzYWdlIG9mIEtBU0FOX1NIQURPV19TVEFSVC4K
ClZlcnkgbmljZSAtLSBjb25zaXN0ZW5jeSEgSSdsbCBuZWVkIHRvIHJlc3Bpbiwgc28gSSdsbCBj
bGVhbiB0aGlzIHVwIGZvcgp0aGUgbmV4dCB2ZXJzaW9uLgoKPiBCdXQgYW55aG93LCB5b3UgY2Fu
IGFkZDoKPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2lu
Yy5jb20+CgoKVGhhbmsgeW91IQpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
