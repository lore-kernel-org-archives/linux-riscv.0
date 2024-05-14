Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C33C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpfqPEuLLmR4Z0fTk4wJ8hBq9Jl8NBms0CM6e06zmio=; b=pSaH1UQzuVyco/
	TDQsXCOLgUYmicdQnVF3oLjtmtDocB1Ico4SE9z7WzPI8c+thJE7xEVNGQm6P0bJWqOyN06LM74Db
	iGkgvRig/tIAKgKThixNQ8qTup5+BwQ8si+P/YtMQ/pDlgdGSe/j4h6iOVVj3EmthrheDfS4Mp/v2
	WX7Vld/PjRgkzsSGKAEEWluy36GNuaR1cLwnoqw88ruUx1keppWcGtrmc4Q/xkSBkIzkIDrneOnRL
	mR13bgKnyZ5e5ZTf+aPV7D+4ne8TCn4U0MrPpvbKqXHISrofrJUoIN9cyTMw8VCpGnRgtHjhiNUrt
	aW790RyRxgYbY5EsVTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6vt7-0000000Gemx-0Wss;
	Tue, 14 May 2024 17:24:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6vt0-0000000Geje-2tGs
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 17:24:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-573137ba8d7so2027246a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715707459; x=1716312259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm6je9rht4BjYmGJ1IuR6KKMw8nH5QLaou4Ka+z1F+s=;
        b=0kOdjO5WfK3vy02yJwR76YpAZm/OipOT7Ztw8b35snn8ZLtNjnOhE96Df6Z9BaD78F
         RGECshYO6UcfFAjRn7/fmTLP4qpqZ2vwuf0RvYlhFgPAL0qnpuo/fjVtFv/dLUP4gvfX
         IW3NNkrfBPDA2OoRfUG775RYUi4TSWPiegQuiIiDDF5m/EAZMkzUGp0s6UQjA1eibYq+
         JGuXW/LQlxcXvWkJ86L09cOFlMsBxu6QNolZYylPRwbO/yDM/ECM2Ro2T3llO5/YlQit
         LoJm5J0eSZCVRgWlO+smmlkyrCtkDX08jjHvTu2BVyMqXVRXGororH5KrejQd69PjXbg
         nSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715707459; x=1716312259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm6je9rht4BjYmGJ1IuR6KKMw8nH5QLaou4Ka+z1F+s=;
        b=B4tprk0Wm4cMSHjn7c4peKJ5YvP3qvNAfHyuGiEaJEuIpmB2YExx0lzx0pEF7TeOzN
         jhlDF10LCeHNgMcBtGRd6P8em8Tgr68RVNrXMlbVtWYZDExHegELwxyW6p5cwlGjPT4g
         VU8SkTEa7s9F0ohHW78BaeZvnqy+oZX+Lso834mi+Px+SE7+VabX0UjxQkZS9GAZcoyz
         wQ2rMYWXwk1FeZMGflJ0etkOM4hoXuEmPuIPzHjKR0+BgZCsXuN03k9NNwiJm314rkEy
         djQbJd0e65aLDtuMZBN78z9FzXH81KUoahgA7CTwlDUgkdlXYm7pHev/uAo5ETM4HCXv
         2vMg==
X-Forwarded-Encrypted: i=1; AJvYcCVdeooW2rcI9DfNPqPRS3FKGIfV9UkiTllFrX1b0Bf/fhkiCNwCsI8Kvdlu0rk+XVseYM9mMdowIjGULjPcrr5+E/9/nXJNGxygfMUJSPY/
X-Gm-Message-State: AOJu0YxP0Dblnb5N6PmUIPCVvXWJhOz0e/oCuQRA2gPuZFkx/3ZXUBZ9
	4hS+N9By6UJmoMkehn5lvnpmKenLJ7CdTzNIWWdPyZ4a4fNXZOCCyBX+1BYJcaoC5FonGUP2ZVx
	oAHhIWCqNVGep2a1BNxlQlLAvdrlUjXb1KXyZSg==
X-Google-Smtp-Source: AGHT+IF56JWIpkZ2/AL2ubyZfgA/2Uc3aQFZ5Ej57ui6rLBhQ10e6OWlyGWRPN5l4ez0BlwqzQ5aMzCSBobUR5m/tfc=
X-Received: by 2002:a05:6402:26cd:b0:572:3fac:e085 with SMTP id
 4fb4d7f45d1cf-573328e276amr15922880a12.13.1715707459179; Tue, 14 May 2024
 10:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240514140446.538622-1-bjorn@kernel.org> <20240514140446.538622-4-bjorn@kernel.org>
In-Reply-To: <20240514140446.538622-4-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 14 May 2024 19:24:08 +0200
Message-ID: <CAHVXubj0Ly_Nm-J17bxuEn_1cUC_HxOMUxJ5dnfRB5CL6D0jeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] riscv: mm: Refactor create_linear_mapping_range()
 for memory hot add
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_102423_280628_18F734C5 
X-CRM114-Status: GOOD (  15.70  )
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

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgNDowNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gQWRkIGEgcGFyYW1ldGVyIHRvIHRoZSBkaXJlY3QgbWFwIHNldHVwIGZ1bmN0aW9u
LCBzbyBpdCBjYW4gYmUgdXNlZCBpbgo+IGFyY2hfYWRkX21lbW9yeSgpIGxhdGVyLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L21tL2luaXQuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCBjOTY5NDI3ZWFi
ODguLjZmNzJiMGIyYjg1NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTEyMjcsNyArMTIyNyw3IEBAIGFzbWxpbmth
Z2Ugdm9pZCBfX2luaXQgc2V0dXBfdm0odWludHB0cl90IGR0Yl9wYSkKPiAgfQo+Cj4gIHN0YXRp
YyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdfcmFuZ2UocGh5c19hZGRyX3Qg
c3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnRwdHJfdCBmaXhlZF9tYXBfc2l6ZSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnRwdHJfdCBmaXhlZF9t
YXBfc2l6ZSwgY29uc3QgcGdwcm90X3QgKnBncHJvdCkKPiAgewo+ICAgICAgICAgcGh5c19hZGRy
X3QgcGE7Cj4gICAgICAgICB1aW50cHRyX3QgdmEsIG1hcF9zaXplOwo+IEBAIC0xMjM4LDcgKzEy
MzgsNyBAQCBzdGF0aWMgdm9pZCBfX21lbWluaXQgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3Jhbmdl
KHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmVzdF9tYXBfc2l6ZShwYSwgdmEsIGVuZCAtIHBhKTsKPgo+
ICAgICAgICAgICAgICAgICBjcmVhdGVfcGdkX21hcHBpbmcoc3dhcHBlcl9wZ19kaXIsIHZhLCBw
YSwgbWFwX3NpemUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZ3Byb3Rf
ZnJvbV92YSh2YSkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGdwcm90
ID8gKnBncHJvdCA6IHBncHJvdF9mcm9tX3ZhKHZhKSk7Cj4gICAgICAgICB9Cj4gIH0KPgo+IEBA
IC0xMjgyLDIyICsxMjgyLDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfbGluZWFyX21h
cHBpbmdfcGFnZV90YWJsZSh2b2lkKQo+ICAgICAgICAgICAgICAgICBpZiAoZW5kID49IF9fcGEo
UEFHRV9PRkZTRVQpICsgbWVtb3J5X2xpbWl0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVu
ZCA9IF9fcGEoUEFHRV9PRkZTRVQpICsgbWVtb3J5X2xpbWl0Owo+Cj4gLSAgICAgICAgICAgICAg
IGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShzdGFydCwgZW5kLCAwKTsKPiArICAgICAgICAg
ICAgICAgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKHN0YXJ0LCBlbmQsIDAsIE5VTEwpOwo+
ICAgICAgICAgfQo+Cj4gICNpZmRlZiBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gKPiAtICAgICAg
IGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrdGV4dF9zdGFydCwga3RleHRfc3RhcnQgKyBr
dGV4dF9zaXplLCAwKTsKPiAtICAgICAgIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShrcm9k
YXRhX3N0YXJ0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtyb2RhdGFf
c3RhcnQgKyBrcm9kYXRhX3NpemUsIDApOwo+ICsgICAgICAgY3JlYXRlX2xpbmVhcl9tYXBwaW5n
X3JhbmdlKGt0ZXh0X3N0YXJ0LCBrdGV4dF9zdGFydCArIGt0ZXh0X3NpemUsIDAsIE5VTEwpOwo+
ICsgICAgICAgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3JhbmdlKGtyb2RhdGFfc3RhcnQsIGtyb2Rh
dGFfc3RhcnQgKyBrcm9kYXRhX3NpemUsIDAsIE5VTEwpOwo+Cj4gICAgICAgICBtZW1ibG9ja19j
bGVhcl9ub21hcChrdGV4dF9zdGFydCwgIGt0ZXh0X3NpemUpOwo+ICAgICAgICAgbWVtYmxvY2tf
Y2xlYXJfbm9tYXAoa3JvZGF0YV9zdGFydCwga3JvZGF0YV9zaXplKTsKPiAgI2VuZGlmCj4KPiAg
I2lmZGVmIENPTkZJR19LRkVOQ0UKPiAtICAgICAgIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5n
ZShrZmVuY2VfcG9vbCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZmVu
Y2VfcG9vbCArIEtGRU5DRV9QT09MX1NJWkUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUEFHRV9TSVpFKTsKPiArICAgICAgIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5n
ZShrZmVuY2VfcG9vbCwga2ZlbmNlX3Bvb2wgKyBLRkVOQ0VfUE9PTF9TSVpFLCBQQUdFX1NJWkUs
IE5VTEwpOwo+Cj4gICAgICAgICBtZW1ibG9ja19jbGVhcl9ub21hcChrZmVuY2VfcG9vbCwgS0ZF
TkNFX1BPT0xfU0laRSk7Cj4gICNlbmRpZgo+IC0tCj4gMi40MC4xCj4KCllvdSBjYW4gYWRkOgoK
UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRo
YW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
