Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F3FC83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKbyQr06jBMD3Fj8dGwNVebqfmC0IV/9s8Loa9mNlPA=; b=U1RmUXYLAcrf+S
	+ljcYsTN+/RzFISFscvVMZ9r2LWrnQz7x+KopXKheReYHUoY5E/9N7dDE7xVABgP+52lpc8uAeJdy
	UBwzmMFPrOkSRHspJFYmN+UW/GvhYp2TP4oY6qQDrqs34mII4mkCwjYeZeJCKaJaNcpIKYHAefHqx
	l2cJrhgU8grFfl0FgRefwBAqI37kITbeWm3M6QhsBWh9mn/ZSLSKa6CWqwXD0uHDn7YrOBYGzRnu8
	cCngCNjarbOfFvLjAphNJYnNFGHzooHumgBWIxkjIc1HhiKwXOdMPg4DbApOVjvKy9UjsyzsKof21
	GIsmJrJT82dkT5LiZbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucha5-0000000CDKu-11wF;
	Fri, 18 Jul 2025 09:40:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchEP-0000000C9fU-1FMF;
	Fri, 18 Jul 2025 09:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A821601DB;
	Fri, 18 Jul 2025 09:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23016C4CEF8;
	Fri, 18 Jul 2025 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752830296;
	bh=iN0MjV8lG6vlPY6QKWEDWqXP3y58juMGr+peNv9I/+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=upUCLIdrbbvEbKjUsZgTdUEGyRbXXPVKgUMJXI8oVEu7IuCo+NlAr8pZ3hP/3OpCS
	 z+m8WoLkMvYdx42mseDFgent82TIUAOPaXDuO0MHrSBPWaortApspXcggf+7lhNmY8
	 tOaGg0j7eaXiZqMy8OhhL3BAvuI4qqptGCOW5qdmQyljlx4c3DuNukqLAdC4airAsq
	 nJKi0Be3SrrR2xHh9RGmjhMqPl6sRDW75QEF/7Lu21+PwIinNh5ZPzzmyUHWJMe6cp
	 dzghcLYsnfaa3tVtbk0VeArOxbSMW6EX7TzfWbBD0ifZlVbF7q2+xGG6ugEJd7zFXx
	 5DD1NmgbOVSgg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so3434961a12.3;
        Fri, 18 Jul 2025 02:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrxZXrr/KRktGw3Em0zBTEnraFPRtGWiqkV0XW6Vckh5Q+k02PEN9qg98ydWOa7nU05/ImbvBKRCx2wBo=@lists.infradead.org, AJvYcCXHgREp5xzIsIzupY6JW8QwPUgnMM3ZhwCFDX8R9Hoy+gJFE4CNuS33bcclzQLsT9VZunftRCyVZQfnyC2455fk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1radSji7Y6itCKrWhpnXl6WYdKK1sarDEkzrQwbe3W1yviTg
	wEAD+Tq17sKAlgwus9VavPtvV1zm/mShw4vnXTS2YOLa37W0uMicEFgsyfP5Sfp+ubcwlD+p0Cd
	6ez42qM94uBCBXYfHD4oJ89+m4ENgDGw=
X-Google-Smtp-Source: AGHT+IH+CR6kK9khsoUi4kQxVa0vWTn3qqM4Z4G6WAw+0g0YyuRvDHP3ooIXGfMWBaXJUiPtMEtFUptkHeWtXN/zID4=
X-Received: by 2002:a05:6402:26d5:b0:60c:6a48:8047 with SMTP id
 4fb4d7f45d1cf-612d456bb15mr803449a12.11.1752830294637; Fri, 18 Jul 2025
 02:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250717231756.make.423-kees@kernel.org> <20250717232519.2984886-9-kees@kernel.org>
In-Reply-To: <20250717232519.2984886-9-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 18 Jul 2025 17:18:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4RyZQTak5AgYj6TaXHyEefgw+wmXs9Gi8jUJWrUV5HQw@mail.gmail.com>
X-Gm-Features: Ac12FXyrA9A9-rpLV3MB79YH2kXhj6f2Fk9F6HAlk-0emUPTHthuyPP3lR9zQXg
Message-ID: <CAAhV-H4RyZQTak5AgYj6TaXHyEefgw+wmXs9Gi8jUJWrUV5HQw@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] mips: Handle KCOV __init vs inline mismatch
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, 
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

UmV2aWV3ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgoKT24gRnJp
LCBKdWwgMTgsIDIwMjUgYXQgNzoyNuKAr0FNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPiB3
cm90ZToKPgo+IFdoZW4gS0NPViBpcyBlbmFibGVkIGFsbCBmdW5jdGlvbnMgZ2V0IGluc3RydW1l
bnRlZCwgdW5sZXNzCj4gdGhlIF9fbm9fc2FuaXRpemVfY292ZXJhZ2UgYXR0cmlidXRlIGlzIHVz
ZWQuIFRvIHByZXBhcmUgZm9yCj4gX19ub19zYW5pdGl6ZV9jb3ZlcmFnZSBiZWluZyBhcHBsaWVk
IHRvIF9faW5pdCBmdW5jdGlvbnMsIHdlCj4gaGF2ZSB0byBoYW5kbGUgZGlmZmVyZW5jZXMgaW4g
aG93IEdDQydzIGlubGluZSBvcHRpbWl6YXRpb25zIGdldAo+IHJlc29sdmVkLiBGb3IgbWlwcyB0
aGlzIHJlcXVpcmVzIGFkZGluZyB0aGUgX19pbml0IGFubm90YXRpb24gb24KPiBpbml0X21pcHNf
Y2xvY2tzb3VyY2UoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPgo+IC0tLQo+IENjOiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2JvZ2VuZEBhbHBoYS5mcmFu
a2VuLmRlPgo+IENjOiA8bGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gv
bWlwcy9pbmNsdWRlL2FzbS90aW1lLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRl
L2FzbS90aW1lLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vdGltZS5oCj4gaW5kZXggZTg1NWEz
NjExZDkyLi41ZTcxOTNiNzU5ZjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNt
L3RpbWUuaAo+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS90aW1lLmgKPiBAQCAtNTUsNyAr
NTUsNyBAQCBzdGF0aWMgaW5saW5lIGludCBtaXBzX2Nsb2NrZXZlbnRfaW5pdCh2b2lkKQo+ICAg
Ki8KPiAgZXh0ZXJuIGludCBpbml0X3I0a19jbG9ja3NvdXJjZSh2b2lkKTsKPgo+IC1zdGF0aWMg
aW5saW5lIGludCBpbml0X21pcHNfY2xvY2tzb3VyY2Uodm9pZCkKPiArc3RhdGljIGlubGluZSBf
X2luaXQgaW50IGluaXRfbWlwc19jbG9ja3NvdXJjZSh2b2lkKQo+ICB7Cj4gICNpZmRlZiBDT05G
SUdfQ1NSQ19SNEsKPiAgICAgICAgIHJldHVybiBpbml0X3I0a19jbG9ja3NvdXJjZSgpOwo+IC0t
Cj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
