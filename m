Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC301C19F4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 23:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaU+30quB13HbWCOOLcylCEryve6MlkPScNtlamV9iQ=; b=UtaG6kKMURzZBI
	1605s3EOjDUyoUFIluFPP72sgsmfo3GLqSFEcZMrk8p/cUkKV7pYM7ysyjcuonMVazPyPtQcCsTi/
	Paam90BFdpTf7TNS1RMD31LgmgYD2tZYYjFXkZVz8YZX4LUy7oqGPVKa741ZoFx7XWcHzuns8GAgY
	BF00XHd3a+tK4MI3M1bm8ghGOESIk9Rql0p4DyQdrLLsQUyEVF/vQKODtLCvVmBrnjFgxW0nXcIOf
	e/zCO5YQ3tpyhoON9gLtkTrPIowasGdkydpI70frMulnYFIjDyHFhBOm+E7thT3g1ocXhfKzvwlgv
	ahijAON873nZtJVaxIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4UQx-0000000DLpX-3Ynf;
	Tue, 07 May 2024 23:41:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4UQt-0000000DLmO-3jNL;
	Tue, 07 May 2024 23:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A11261B3C;
	Tue,  7 May 2024 23:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7C2C2BBFC;
	Tue,  7 May 2024 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715125273;
	bh=ODKOUMcSjW/vZC3ltI6tPmb1ZIxhx2e2qI8/N+kVOFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WH1d1ZrdOijFn1cT49Jm2ZUSrhswkNac03IVHqq7Eohwb66eyC/upbIRg5OmSQrS5
	 590jVcfK2eY7mGIT+Mu2vfZ+2kgvT+bvvG+nO0mpjkaiB/hzuVoCqKdsgEfcB6GUI1
	 tZHVMdm8HMaoJWCDDdSEsUeSS2shrn9LwS64jApcEtp551mG5S0J2RXLfrbG59V5J/
	 HlHuUhoLZsEzbSOo52SetyHK+GisTyafXt2qQ3WQN6uI/FPqAL3Mvb4Ag0onvgsMRn
	 PVoqChvTS3nyekeTg4nrB1W8PoOH/gLtrOXEqRETwcHpFeC7NS6eZgZtaW77r3KgQl
	 SXWjnlSGSut3Q==
Date: Wed, 8 May 2024 08:41:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile
 <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, Liviu
 Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RESEND v8 05/16] module: make module_memory_{alloc,free}
 more self-contained
Message-Id: <20240508084102.9e9b18a9b111d427e7cc9c94@kernel.org>
In-Reply-To: <20240505160628.2323363-6-rppt@kernel.org>
References: <20240505160628.2323363-1-rppt@kernel.org>
	<20240505160628.2323363-6-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_164116_275315_02BF4626 
X-CRM114-Status: GOOD (  28.81  )
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

T24gU3VuLCAgNSBNYXkgMjAyNCAxOTowNjoxNyArMDMwMApNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPiAKPiBNb3ZlIHRoZSBsb2dpYyByZWxhdGVkIHRvIHRoZSBtZW1vcnkgYWxsb2Nh
dGlvbiBhbmQgZnJlZWluZyBpbnRvCj4gbW9kdWxlX21lbW9yeV9hbGxvYygpIGFuZCBtb2R1bGVf
bWVtb3J5X2ZyZWUoKS4KPiAKCkxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogTWFzYW1p
IEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KClRoYW5rcywKCj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgo+IFJldmll
d2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cj4gLS0t
Cj4gIGtlcm5lbC9tb2R1bGUvbWFpbi5jIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDI1
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvbW9kdWxlL21haW4uYyBiL2tl
cm5lbC9tb2R1bGUvbWFpbi5jCj4gaW5kZXggZTFlOGE3YTlkNmMxLi41YjgyYjA2OWUwZDMgMTAw
NjQ0Cj4gLS0tIGEva2VybmVsL21vZHVsZS9tYWluLmMKPiArKysgYi9rZXJuZWwvbW9kdWxlL21h
aW4uYwo+IEBAIC0xMjAzLDE1ICsxMjAzLDQ0IEBAIHN0YXRpYyBib29sIG1vZF9tZW1fdXNlX3Zt
YWxsb2MoZW51bSBtb2RfbWVtX3R5cGUgdHlwZSkKPiAgCQltb2RfbWVtX3R5cGVfaXNfY29yZV9k
YXRhKHR5cGUpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCAqbW9kdWxlX21lbW9yeV9hbGxvYyh1
bnNpZ25lZCBpbnQgc2l6ZSwgZW51bSBtb2RfbWVtX3R5cGUgdHlwZSkKPiArc3RhdGljIGludCBt
b2R1bGVfbWVtb3J5X2FsbG9jKHN0cnVjdCBtb2R1bGUgKm1vZCwgZW51bSBtb2RfbWVtX3R5cGUg
dHlwZSkKPiAgewo+ICsJdW5zaWduZWQgaW50IHNpemUgPSBQQUdFX0FMSUdOKG1vZC0+bWVtW3R5
cGVdLnNpemUpOwo+ICsJdm9pZCAqcHRyOwo+ICsKPiArCW1vZC0+bWVtW3R5cGVdLnNpemUgPSBz
aXplOwo+ICsKPiAgCWlmIChtb2RfbWVtX3VzZV92bWFsbG9jKHR5cGUpKQo+IC0JCXJldHVybiB2
emFsbG9jKHNpemUpOwo+IC0JcmV0dXJuIG1vZHVsZV9hbGxvYyhzaXplKTsKPiArCQlwdHIgPSB2
bWFsbG9jKHNpemUpOwo+ICsJZWxzZQo+ICsJCXB0ciA9IG1vZHVsZV9hbGxvYyhzaXplKTsKPiAr
Cj4gKwlpZiAoIXB0cikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwkvKgo+ICsJICogVGhl
IHBvaW50ZXIgdG8gdGhlc2UgYmxvY2tzIG9mIG1lbW9yeSBhcmUgc3RvcmVkIG9uIHRoZSBtb2R1
bGUKPiArCSAqIHN0cnVjdHVyZSBhbmQgd2Uga2VlcCB0aGF0IGFyb3VuZCBzbyBsb25nIGFzIHRo
ZSBtb2R1bGUgaXMKPiArCSAqIGFyb3VuZC4gV2Ugb25seSBmcmVlIHRoYXQgbWVtb3J5IHdoZW4g
d2UgdW5sb2FkIHRoZSBtb2R1bGUuCj4gKwkgKiBKdXN0IG1hcmsgdGhlbSBhcyBub3QgYmVpbmcg
YSBsZWFrIHRoZW4uIFRoZSAuaW5pdCogRUxGCj4gKwkgKiBzZWN0aW9ucyAqZG8qIGdldCBmcmVl
ZCBhZnRlciBib290IHNvIHdlICpjb3VsZCogdHJlYXQgdGhlbQo+ICsJICogc2xpZ2h0bHkgZGlm
ZmVyZW50bHkgd2l0aCBrbWVtbGVha19pZ25vcmUoKSBhbmQgb25seSBncmV5Cj4gKwkgKiB0aGVt
IG91dCBhcyB0aGV5IHdvcmsgYXMgdHlwaWNhbCBtZW1vcnkgYWxsb2NhdGlvbnMgd2hpY2gKPiAr
CSAqICpkbyogZXZlbnR1YWxseSBnZXQgZnJlZWQsIGJ1dCBsZXQncyBqdXN0IGtlZXAgdGhpbmdz
IHNpbXBsZQo+ICsJICogYW5kIGF2b2lkICphbnkqIGZhbHNlIHBvc2l0aXZlcy4KPiArCSAqLwo+
ICsJa21lbWxlYWtfbm90X2xlYWsocHRyKTsKPiArCj4gKwltZW1zZXQocHRyLCAwLCBzaXplKTsK
PiArCW1vZC0+bWVtW3R5cGVdLmJhc2UgPSBwdHI7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyB2b2lkIG1vZHVsZV9tZW1vcnlfZnJlZSh2b2lkICpwdHIsIGVudW0gbW9kX21l
bV90eXBlIHR5cGUpCj4gK3N0YXRpYyB2b2lkIG1vZHVsZV9tZW1vcnlfZnJlZShzdHJ1Y3QgbW9k
dWxlICptb2QsIGVudW0gbW9kX21lbV90eXBlIHR5cGUpCj4gIHsKPiArCXZvaWQgKnB0ciA9IG1v
ZC0+bWVtW3R5cGVdLmJhc2U7Cj4gKwo+ICAJaWYgKG1vZF9tZW1fdXNlX3ZtYWxsb2ModHlwZSkp
Cj4gIAkJdmZyZWUocHRyKTsKPiAgCWVsc2UKPiBAQCAtMTIyOSwxMiArMTI1OCwxMiBAQCBzdGF0
aWMgdm9pZCBmcmVlX21vZF9tZW0oc3RydWN0IG1vZHVsZSAqbW9kKQo+ICAJCS8qIEZyZWUgbG9j
ay1jbGFzc2VzOyByZWxpZXMgb24gdGhlIHByZWNlZGluZyBzeW5jX3JjdSgpLiAqLwo+ICAJCWxv
Y2tkZXBfZnJlZV9rZXlfcmFuZ2UobW9kX21lbS0+YmFzZSwgbW9kX21lbS0+c2l6ZSk7Cj4gIAkJ
aWYgKG1vZF9tZW0tPnNpemUpCj4gLQkJCW1vZHVsZV9tZW1vcnlfZnJlZShtb2RfbWVtLT5iYXNl
LCB0eXBlKTsKPiArCQkJbW9kdWxlX21lbW9yeV9mcmVlKG1vZCwgdHlwZSk7Cj4gIAl9Cj4gIAo+
ICAJLyogTU9EX0RBVEEgaG9zdHMgbW9kLCBzbyBmcmVlIGl0IGF0IGxhc3QgKi8KPiAgCWxvY2tk
ZXBfZnJlZV9rZXlfcmFuZ2UobW9kLT5tZW1bTU9EX0RBVEFdLmJhc2UsIG1vZC0+bWVtW01PRF9E
QVRBXS5zaXplKTsKPiAtCW1vZHVsZV9tZW1vcnlfZnJlZShtb2QtPm1lbVtNT0RfREFUQV0uYmFz
ZSwgTU9EX0RBVEEpOwo+ICsJbW9kdWxlX21lbW9yeV9mcmVlKG1vZCwgTU9EX0RBVEEpOwo+ICB9
Cj4gIAo+ICAvKiBGcmVlIGEgbW9kdWxlLCByZW1vdmUgZnJvbSBsaXN0cywgZXRjLiAqLwo+IEBA
IC0yMjI1LDcgKzIyNTQsNiBAQCBzdGF0aWMgaW50IGZpbmRfbW9kdWxlX3NlY3Rpb25zKHN0cnVj
dCBtb2R1bGUgKm1vZCwgc3RydWN0IGxvYWRfaW5mbyAqaW5mbykKPiAgc3RhdGljIGludCBtb3Zl
X21vZHVsZShzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmluZm8pCj4gIHsK
PiAgCWludCBpOwo+IC0Jdm9pZCAqcHRyOwo+ICAJZW51bSBtb2RfbWVtX3R5cGUgdCA9IDA7Cj4g
IAlpbnQgcmV0ID0gLUVOT01FTTsKPiAgCj4gQEAgLTIyMzQsMjYgKzIyNjIsMTIgQEAgc3RhdGlj
IGludCBtb3ZlX21vZHVsZShzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmlu
Zm8pCj4gIAkJCW1vZC0+bWVtW3R5cGVdLmJhc2UgPSBOVUxMOwo+ICAJCQljb250aW51ZTsKPiAg
CQl9Cj4gLQkJbW9kLT5tZW1bdHlwZV0uc2l6ZSA9IFBBR0VfQUxJR04obW9kLT5tZW1bdHlwZV0u
c2l6ZSk7Cj4gLQkJcHRyID0gbW9kdWxlX21lbW9yeV9hbGxvYyhtb2QtPm1lbVt0eXBlXS5zaXpl
LCB0eXBlKTsKPiAtCQkvKgo+IC0gICAgICAgICAgICAgICAgICogVGhlIHBvaW50ZXIgdG8gdGhl
c2UgYmxvY2tzIG9mIG1lbW9yeSBhcmUgc3RvcmVkIG9uIHRoZSBtb2R1bGUKPiAtICAgICAgICAg
ICAgICAgICAqIHN0cnVjdHVyZSBhbmQgd2Uga2VlcCB0aGF0IGFyb3VuZCBzbyBsb25nIGFzIHRo
ZSBtb2R1bGUgaXMKPiAtICAgICAgICAgICAgICAgICAqIGFyb3VuZC4gV2Ugb25seSBmcmVlIHRo
YXQgbWVtb3J5IHdoZW4gd2UgdW5sb2FkIHRoZSBtb2R1bGUuCj4gLSAgICAgICAgICAgICAgICAg
KiBKdXN0IG1hcmsgdGhlbSBhcyBub3QgYmVpbmcgYSBsZWFrIHRoZW4uIFRoZSAuaW5pdCogRUxG
Cj4gLSAgICAgICAgICAgICAgICAgKiBzZWN0aW9ucyAqZG8qIGdldCBmcmVlZCBhZnRlciBib290
IHNvIHdlICpjb3VsZCogdHJlYXQgdGhlbQo+IC0gICAgICAgICAgICAgICAgICogc2xpZ2h0bHkg
ZGlmZmVyZW50bHkgd2l0aCBrbWVtbGVha19pZ25vcmUoKSBhbmQgb25seSBncmV5Cj4gLSAgICAg
ICAgICAgICAgICAgKiB0aGVtIG91dCBhcyB0aGV5IHdvcmsgYXMgdHlwaWNhbCBtZW1vcnkgYWxs
b2NhdGlvbnMgd2hpY2gKPiAtICAgICAgICAgICAgICAgICAqICpkbyogZXZlbnR1YWxseSBnZXQg
ZnJlZWQsIGJ1dCBsZXQncyBqdXN0IGtlZXAgdGhpbmdzIHNpbXBsZQo+IC0gICAgICAgICAgICAg
ICAgICogYW5kIGF2b2lkICphbnkqIGZhbHNlIHBvc2l0aXZlcy4KPiAtCQkgKi8KPiAtCQlrbWVt
bGVha19ub3RfbGVhayhwdHIpOwo+IC0JCWlmICghcHRyKSB7Cj4gKwo+ICsJCXJldCA9IG1vZHVs
ZV9tZW1vcnlfYWxsb2MobW9kLCB0eXBlKTsKPiArCQlpZiAocmV0KSB7Cj4gIAkJCXQgPSB0eXBl
Owo+ICAJCQlnb3RvIG91dF9lbm9tZW07Cj4gIAkJfQo+IC0JCW1lbXNldChwdHIsIDAsIG1vZC0+
bWVtW3R5cGVdLnNpemUpOwo+IC0JCW1vZC0+bWVtW3R5cGVdLmJhc2UgPSBwdHI7Cj4gIAl9Cj4g
IAo+ICAJLyogVHJhbnNmZXIgZWFjaCBzZWN0aW9uIHdoaWNoIHNwZWNpZmllcyBTSEZfQUxMT0Mg
Ki8KPiBAQCAtMjI5Niw3ICsyMzEwLDcgQEAgc3RhdGljIGludCBtb3ZlX21vZHVsZShzdHJ1Y3Qg
bW9kdWxlICptb2QsIHN0cnVjdCBsb2FkX2luZm8gKmluZm8pCj4gIAlyZXR1cm4gMDsKPiAgb3V0
X2Vub21lbToKPiAgCWZvciAodC0tOyB0ID49IDA7IHQtLSkKPiAtCQltb2R1bGVfbWVtb3J5X2Zy
ZWUobW9kLT5tZW1bdF0uYmFzZSwgdCk7Cj4gKwkJbW9kdWxlX21lbW9yeV9mcmVlKG1vZCwgdCk7
Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC0tIAo+IDIuNDMuMAo+IAoKCi0tIApNYXNhbWkg
SGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
