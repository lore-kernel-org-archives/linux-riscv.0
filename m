Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0BDC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEY7tBB3p9MvFu3+LWywnGjUd4V+AhC3Aqt0aYGvVNU=; b=FOerYS8VBV3td9
	tSFyzfdrmGFpsQ3KRm5u4SSaXiPMfbXb3UInu0vZwo+nkwsPWlwcVABw+VqeW6MwHiLFhiGkm2zSZ
	ICXXb6T2mgDkV2NmPCVAa0YBZ8NtSLxUp6HeLcd4YpQlBUXxtH+uHIaCr1AYhbgZQA5lzLK2KXoz7
	eUgM06xbYhkL+DEe+7IVa0Psgad4ERjLzm5zPsVq7GNZsU7T5zcmgJ03T6btxmpUsB2zLuzhgR+vI
	vDtaZOgm4NV5LKjAxhqjfHffxeajSG7Ks1OgsCoLDiSfYitAYa4CgtCAbH+LrlNE+DK5VLFPfMLXi
	bjpTT2evmhUeHtFtS0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uXR-0000000GPUa-2OSl;
	Tue, 14 May 2024 15:58:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uXO-0000000GPSS-2Hhl
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 15:58:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso37813666b.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715702274; x=1716307074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YVPz8d9fNN7RmoGRWLz27p194UlG1xw9/YZRFhtwc4=;
        b=BsM0vcT5FV0/b6g1+QroB0wl34ow5KI+TG3BlgIH6FdarWauGk4RNjAbPFEPsgolip
         qGnxY2E2c2E0Bp0QHF2sDwWvAcL7PKDg1/KKEE4kMESFiU3faOFGgnfYW0xjYbkkkl2i
         PUmnz49KfzUV8/JxggHfUXYfnTT6VkX0HBtZmPSynwBPqQf6dcmwlnUKhIzTJw7TLsUz
         SHuDGl7Exq+XiuDvkC0U47wGFDYijH4k27rjHh27LhbrailwD+TJ55r6KQOI5S3AW8tB
         YSWnOoq4APBPLl7Fg45dJQ9d/s0D1LJMP0mb57lsjHLpeBFv7svxauCQXbvX1aHUp+xb
         0VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702274; x=1716307074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YVPz8d9fNN7RmoGRWLz27p194UlG1xw9/YZRFhtwc4=;
        b=avttvQRZTFUScUmVPapDePi5CvAb0IVnGmEdI5csfAgykN8csyxmsdJCck45LxelRD
         g4ZVC6LFor7dxGcVWRdrAA762JIBoKDcy6dHwbe8fq2Ung8K5Qca/FxQF1pTxu3gtlyE
         z3UFtmAcW6INxEbPUL+jHf6luUbDw6WT/X0UU//FDfSYf55S+gWYrhTTjIB6Hvv8OHl6
         Rm/H3Ej+lg5fHt1GvgmNmndn4cH9Kq4tohbKc6v8+0NOuQDrG1AdVbdicA4rtDN4+oPH
         aOcosof2KX1cMmqH7D+0dQ2Lg15TyYxsocU47HQ1/JXX9wnWaaRWsW1a7EzfSfUg91Eo
         uAig==
X-Forwarded-Encrypted: i=1; AJvYcCWjFHL4c7Llv+65X1KMNIsLZMk04k88OlEoUNOzLWFYjSX8NbVANWTOrPw8qmmetASGpFrcd5BlJkwwsvur3+gEiBx4fjNUlZnT95wGopBA
X-Gm-Message-State: AOJu0YwfMfA29DPjr8idaOwy/1jBepdm/D0ZuvrIg69fkwoM1Vfo/Z6M
	CTWWqqxM/4CWR7QrXkJ+eraa9nyzy4xEdY9nvwcphRj50W0zl7JWW9BaXOzGn3WTXvhHjROpbMX
	+uauvzZ/G1kxhrSc7qsnL8CXVbkHFp9AmNkYFPQ==
X-Google-Smtp-Source: AGHT+IGpm9BtgF2gQRgKdtEpvWTCkNaf/J7ULsUq4SiDnv5BQvS5Vo6yygT4W4ORsVjJhPMMfM/u6EKEY/mm3nAcHd8=
X-Received: by 2002:a17:907:9705:b0:a5a:7cd3:b2e7 with SMTP id
 a640c23a62f3a-a5a7cd3b463mr311306266b.11.1715702273691; Tue, 14 May 2024
 08:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240514140446.538622-1-bjorn@kernel.org> <20240514140446.538622-2-bjorn@kernel.org>
In-Reply-To: <20240514140446.538622-2-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 14 May 2024 17:57:42 +0200
Message-ID: <CAHVXubhfsvDZrw_Cvg8AnEm00P0TQvrSOV_jVSBRckmJLp6EFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] riscv: mm: Pre-allocate vmemmap/direct map PGD entries
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_085758_607977_0D42F482 
X-CRM114-Status: GOOD (  24.52  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmrDtnJuLAoKT24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgNDowNeKAr1BNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+Cj4gVGhlIFJJU0MtViBwb3J0IGNvcGllcyB0aGUgUEdEIHRhYmxl
IGZyb20gaW5pdF9tbS9zd2FwcGVyX3BnX2RpciB0bwo+IGFsbCB1c2VybGFuZCBwYWdlIHRhYmxl
cywgd2hpY2ggbWVhbnMgdGhhdCBpZiB0aGUgUEdEIGxldmVsIHRhYmxlIGlzCj4gY2hhbmdlZCwg
b3RoZXIgcGFnZSB0YWJsZXMgaGFzIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbC4KPgo+IEluc3RlYWQg
b2YgaGF2aW5nIHRoZSBQR0QgY2hhbmdlcyByaXBwbGUgb3V0IHRvIGFsbCB0YWJsZXMsIHRoZQo+
IHN5bmNocm9uaXphdGlvbiBjYW4gYmUgYXZvaWRlZCBieSBwcmUtYWxsb2NhdGluZyB0aGUgUEdE
IGVudHJpZXMvcGFnZXMKPiBhdCBib290LCBhdm9pZGluZyB0aGUgc3luY2hyb25pemF0aW9uIGFs
bCB0b2dldGhlci4KPgo+IFRoaXMgaXMgY3VycmVudGx5IGRvbmUgZm9yIHRoZSBicGYvbW9kdWxl
cywgYW5kIHZtYWxsb2MgUEdEIHJlZ2lvbnMuCj4gRXh0ZW5kIHRoaXMgc2NoZW1lIGZvciB0aGUg
UEdEIHJlZ2lvbnMgdG91Y2hlZCBieSBtZW1vcnkgaG90cGx1Z2dpbmcuCj4KPiBQcmVwYXJlIHRo
ZSBSSVNDLVYgcG9ydCBmb3IgbWVtb3J5IGhvdHBsdWcgYnkgcHJlLWFsbG9jYXRlCj4gdm1lbW1h
cC9kaXJlY3QgbWFwIGVudHJpZXMgYXQgdGhlIFBHRCBsZXZlbC4gVGhpcyB3aWxsIHJvdWdobHkg
d2FzdGUKPiB+MTI4IHdvcnRoIG9mIDRLIHBhZ2VzIHdoZW4gbWVtb3J5IGhvdHBsdWdnaW5nIGlz
IGVuYWJsZWQgaW4gdGhlCj4ga2VybmVsIGNvbmZpZ3VyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va2FzYW4uaCB8IDQgKystLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAg
ICAgICAgfCA3ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNh
bi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oCj4gaW5kZXggMGI4NWUzNjNlNzc4
Li5lNmEwMDcxYmRiNTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNh
bi5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oCj4gQEAgLTYsOCArNiw2
IEBACj4KPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPgo+IC0jaWZkZWYgQ09ORklHX0tBU0FOCj4g
LQo+ICAvKgo+ICAgKiBUaGUgZm9sbG93aW5nIGNvbW1lbnQgd2FzIGNvcGllZCBmcm9tIGFybTY0
Ogo+ICAgKiBLQVNBTl9TSEFET1dfU1RBUlQ6IGJlZ2lubmluZyBvZiB0aGUga2VybmVsIHZpcnR1
YWwgYWRkcmVzc2VzLgo+IEBAIC0zNCw2ICszMiw4IEBACj4gICAqLwo+ICAjZGVmaW5lIEtBU0FO
X1NIQURPV19TVEFSVCAgICAgKChLQVNBTl9TSEFET1dfRU5EIC0gS0FTQU5fU0hBRE9XX1NJWkUp
ICYgUEdESVJfTUFTSykKPiAgI2RlZmluZSBLQVNBTl9TSEFET1dfRU5EICAgICAgIE1PRFVMRVNf
TE9XRVNUX1ZBRERSCj4gKwo+ICsjaWZkZWYgQ09ORklHX0tBU0FOCj4gICNkZWZpbmUgS0FTQU5f
U0hBRE9XX09GRlNFVCAgICBfQUMoQ09ORklHX0tBU0FOX1NIQURPV19PRkZTRVQsIFVMKQo+Cj4g
IHZvaWQga2FzYW5faW5pdCh2b2lkKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IDI1NzRmNmEzYjBlNy4uNWI4Y2RmYWZi
NTJhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiBAQCAtMjcsNiArMjcsNyBAQAo+Cj4gICNpbmNsdWRlIDxhc20vZml4bWFw
Lmg+Cj4gICNpbmNsdWRlIDxhc20vaW8uaD4KPiArI2luY2x1ZGUgPGFzbS9rYXNhbi5oPgo+ICAj
aW5jbHVkZSA8YXNtL251bWEuaD4KPiAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+Cj4gICNpbmNs
dWRlIDxhc20vc2VjdGlvbnMuaD4KPiBAQCAtMTQ4OCwxMCArMTQ4OSwxNiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgcHJlYWxsb2NhdGVfcGdkX3BhZ2VzX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQs
IHVuc2lnbmVkIGxvbgo+ICAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBwcmUtYWxsb2NhdGUgJXMg
cGFnZXMgZm9yICVzIGFyZWFcbiIsIGx2bCwgYXJlYSk7Cj4gIH0KPgo+ICsjZGVmaW5lIFBBR0Vf
RU5EIEtBU0FOX1NIQURPV19TVEFSVAo+ICsKPiAgdm9pZCBfX2luaXQgcGd0YWJsZV9jYWNoZV9p
bml0KHZvaWQpCj4gIHsKPiAgICAgICAgIHByZWFsbG9jYXRlX3BnZF9wYWdlc19yYW5nZShWTUFM
TE9DX1NUQVJULCBWTUFMTE9DX0VORCwgInZtYWxsb2MiKTsKPiAgICAgICAgIGlmIChJU19FTkFC
TEVEKENPTkZJR19NT0RVTEVTKSkKPiAgICAgICAgICAgICAgICAgcHJlYWxsb2NhdGVfcGdkX3Bh
Z2VzX3JhbmdlKE1PRFVMRVNfVkFERFIsIE1PRFVMRVNfRU5ELCAiYnBmL21vZHVsZXMiKTsKPiAr
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NRU1PUllfSE9UUExVRykpIHsKPiArICAgICAg
ICAgICAgICAgcHJlYWxsb2NhdGVfcGdkX3BhZ2VzX3JhbmdlKFZNRU1NQVBfU1RBUlQsIFZNRU1N
QVBfRU5ELCAidm1lbW1hcCIpOwo+ICsgICAgICAgICAgICAgICBwcmVhbGxvY2F0ZV9wZ2RfcGFn
ZXNfcmFuZ2UoUEFHRV9PRkZTRVQsIFBBR0VfRU5ELCAiZGlyZWN0IG1hcCIpOwo+ICsgICAgICAg
fQo+ICB9Cj4gICNlbmRpZgo+IC0tCj4gMi40MC4xCj4KCkFzIHlvdSBhc2tlZCwgd2l0aApodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDUxNDEzMzYxNC44NzgxMy0xLWFs
ZXhnaGl0aUByaXZvc2luYy5jb20vVC8jdSwKeW91IHdpbGwgYmUgYWJsZSB0byByZW1vdmUgdGhl
IHVzYWdlIG9mIEtBU0FOX1NIQURPV19TVEFSVC4KCkJ1dCBhbnlob3csIHlvdSBjYW4gYWRkOgoK
UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRo
YW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
