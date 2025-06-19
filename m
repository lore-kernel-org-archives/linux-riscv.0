Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06388C73C66
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sC2UuZ6eOV5hRH77lVnxdYR621Cpenz3+Z621Fl3neo=; b=EMJ2laPRAJ6ui5
	0y6rUtoINYJ3ERxnXl1h7nIOEnKSDEBQovNPKLNfcl5ZK8rxG39Bunk2QHBv/bdyNXjhN15fKWHu5
	MUwlkt0Dj//vFo29m3dKKLnac+CNHji8xGkv9J6fy9uGRnio3HKsd8ZJQMXxyrwPUB094pwjKyklV
	vjVSMgdI8jzPJLvzGmfJzJMjOZ+1KbkdqXnfxVAxl0Akap2Vtou3ctiKaDJFXdS1eO5Hfoch0IWmf
	cPtdKgIvvAh0XhcQjfGhLkj3WGG3s3zjHhS3uTlBYy3E0N3f+EUkqB14fgafH1Jl2v1kyjcwgMdqi
	g0Qdm3Q3cv8F9JQpeEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBwj-0000000Cfs9-0fKa;
	Thu, 19 Jun 2025 09:52:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB3Q-0000000CVhL-3elo;
	Thu, 19 Jun 2025 08:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9D15A54350;
	Thu, 19 Jun 2025 08:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B497C4CEF4;
	Thu, 19 Jun 2025 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323327;
	bh=eQADuGSiL41NAxGl9NK+UhkSlVn0yTQBhyaUTND5Uzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2FgroRg8XpbJ/VSjtfLXHjJJRjKYpLj2XcaUHKG2xLQ7wfM+Z5n3rCjl6c8Zto5M
	 RSqSwjDobL8Uw3UNbEgelKH8UpaKTaToYX2CC3EHc2vsE2pdmJDyKlBWw+TMDnneAR
	 zMJQDoEg8twbtA3I11UyCenEImVZ9sO7oElSKq/lIdyVHdbSV7Rl1uy4I9OtVCIJ1L
	 xY4b7NmVNhx3/G6psbDY7j5hAeSUhrVg2Gh8rwAs7zI7pjkVGSiXnOiYqIeGf09brb
	 UZTFESwD6c+51mkUr6sZ7eCO2jWacLftMDJ3IO+VCTUTYL9SrpXOCd2q9ivlu3Pq39
	 P3TSZ4nA1tZBA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so1001925a12.3;
        Thu, 19 Jun 2025 01:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAeZlVsX1D8RtvpmvwcIPIaTGcVFrtjbodDi2eHo+QRjKHukyVnRipyys7YzY0gqW1u+kzytYeERbzkXU=@lists.infradead.org, AJvYcCVQKZB2bkoeNJcB7VOPj/3hEpNQQ3/Tmlv3lb7Z8NuUTXChtfzDCA7bcC3OyINY/oL7PzALUHL9JLV/H4MtnZu7@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrmqZ6C+Q8xDTXxI0GNETauYCafrWx2eDwFQOsOlkDQce+nGF
	tDiufiGNcmtd4sdsovIUZ0Q7hFWxW5emX/odCUGJM+xiKipGPnNbZfuWe2aTWB4bbnLc8MuU4ft
	jidycYPUup0omMezoxZ1BDTrVUJT7DO0=
X-Google-Smtp-Source: AGHT+IFe63NPmdC9P72cDlyX2WP9si/cWhn+2uqDCCs1dQMO/+ouBJs4HCM0Kl1RCgdHuztVjrD3QGSEtvvPoh/cEAU=
X-Received: by 2002:a05:6402:50d2:b0:607:6057:9006 with SMTP id
 4fb4d7f45d1cf-608d08f7a70mr18716524a12.8.1750323325929; Thu, 19 Jun 2025
 01:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-9-kees@kernel.org>
In-Reply-To: <20250523043935.2009972-9-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 16:55:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4rFt3J6hD-eiNN5nihNR0cwMxPJQpq8LQWkx4km428og@mail.gmail.com>
X-Gm-Features: AX0GCFtBM3K8OeK1JL3sld-cpEWi3kLQAET9w-cyksCMv2tJ5SCZdduevj4T0cU
Message-ID: <CAAhV-H4rFt3J6hD-eiNN5nihNR0cwMxPJQpq8LQWkx4km428og@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] mips: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015529_040402_0781BF19 
X-CRM114-Status: GOOD (  17.00  )
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

SGksIEtlZXMsCgpPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjo0MeKAr1BNIEtlZXMgQ29vayA8
a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFdoZW4gS0NPViBpcyBlbmFibGVkIGFsbCBmdW5j
dGlvbnMgZ2V0IGluc3RydW1lbnRlZCwgdW5sZXNzCj4gdGhlIF9fbm9fc2FuaXRpemVfY292ZXJh
Z2UgYXR0cmlidXRlIGlzIHVzZWQuIFRvIHByZXBhcmUgZm9yCj4gX19ub19zYW5pdGl6ZV9jb3Zl
cmFnZSBiZWluZyBhcHBsaWVkIHRvIF9faW5pdCBmdW5jdGlvbnMsIHdlIGhhdmUgdG8KPiBoYW5k
bGUgZGlmZmVyZW5jZXMgaW4gaG93IEdDQydzIGlubGluZSBvcHRpbWl6YXRpb25zIGdldCByZXNv
bHZlZC4gRm9yCj4gbWlwcyB0aGlzIHJlcXVpcmVzIGZvcmNpbmcgYSBmdW5jdGlvbiB0byBiZSBp
bmxpbmUgd2l0aCBfX2Fsd2F5c19pbmxpbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sg
PGtlZXNAa2VybmVsLm9yZz4KPiAtLS0KPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dl
bmRAYWxwaGEuZnJhbmtlbi5kZT4KPiBDYzogPGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPgo+
IC0tLQo+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vdGltZS5oIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L21pcHMvaW5jbHVkZS9hc20vdGltZS5oIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3RpbWUuaAo+
IGluZGV4IGU4NTVhMzYxMWQ5Mi4uMDQ0Y2ZmMGUwNzY0IDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlw
cy9pbmNsdWRlL2FzbS90aW1lLmgKPiArKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vdGltZS5o
Cj4gQEAgLTU1LDcgKzU1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgbWlwc19jbG9ja2V2ZW50X2lu
aXQodm9pZCkKPiAgICovCj4gIGV4dGVybiBpbnQgaW5pdF9yNGtfY2xvY2tzb3VyY2Uodm9pZCk7
Cj4KPiAtc3RhdGljIGlubGluZSBpbnQgaW5pdF9taXBzX2Nsb2Nrc291cmNlKHZvaWQpCj4gK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGluaXRfbWlwc19jbG9ja3NvdXJjZSh2b2lkKQpTaW1p
bGFyIHRvIHg4NiBhbmQgYXJtLCBJIHByZWZlciB0byBtYXJrIGl0IGFzIF9faW5pdCByYXRoZXIg
dGhhbgpfX2Fsd2F5c19pbmxpbmUuCgpIdWFjYWkKCj4gIHsKPiAgI2lmZGVmIENPTkZJR19DU1JD
X1I0Swo+ICAgICAgICAgcmV0dXJuIGluaXRfcjRrX2Nsb2Nrc291cmNlKCk7Cj4gLS0KPiAyLjM0
LjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
