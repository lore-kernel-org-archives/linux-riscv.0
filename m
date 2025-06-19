Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F1DC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=els4qJ1irBbO87z2JYzwJUVxcbKQkoMaOxOdf7okX1g=; b=p/e40NBUZqjHbe
	RxrbtTNb/Kw+QJnT9kvkXRaxtluh8AfnscVi/7zbcRiaDrdvmDFSddFS85voBTslW3wuOVzYO9ohg
	kIx24IkVXJux3rvd/aNLhKy/CJQJWSUp55GrBQpyTYvsfR6pZ65aiC+7rTrrkUgdujTmREif/a3tO
	pR+Q82HLrykQ4ZRjyq7m6xQJoaN7jPe7oljJy14TGMA1RZufwMifmCzGj0eVAAemce2sqWLM30FqF
	2nM3SbCrCR7T8qLkNHNod+Arodeanbb8JUPj0B/ADKu5giBW9V3F61JlhkvkhfXbrXHVRtL/A5bH2
	Axm4aO5aEbAh63Tj2jTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSByw-0000000CgJw-2BBX;
	Thu, 19 Jun 2025 09:54:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB3y-0000000CVpt-1753;
	Thu, 19 Jun 2025 08:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B3E3629E6;
	Thu, 19 Jun 2025 08:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB25C4CEF3;
	Thu, 19 Jun 2025 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323361;
	bh=GY39qewCO8ZjeGeZxUohtkWS54SrNUfyybjbm7an5Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BiG8+DpI8qK/7ehh9mHlWcIBDcd2aW6L5zsdQwFfDHxAQzkw3wpYWGPQ6B8QAPH9D
	 y3g3vBeuapW2jbg7F3C0+1XUsLnDTo/NVZBstotfSykAdmedcEkBtU7uK0/NAe+wSt
	 Kc+Lun055qORQz7b1mmMomPpcYDq76KH/YewkrSM0s4AR/fntnE2c+ZQiv3ylk6uFy
	 YMe89/7ZUy5WBvyLmptPtHixT5axCELqsF3d08SoPQsMs39mRobfTX8/5lFJkTd5Ag
	 2mulMGlFaIN9bMOa0eo2qBME6/JU5n//r22rEhdAHA56YcfKfLRjdPIb6YPhoPnwm1
	 xxs6mMfeLDs3A==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so840190a12.2;
        Thu, 19 Jun 2025 01:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFsma2gYcQRXjavN9m6qbIBQ6e9n9QCi7oqUtTM74ZOGIB2s3uM7dZTSGWnURb/nhPUCciW3fRVScO8E4NB2OF@lists.infradead.org, AJvYcCWM+lLWT9wmBMlSWZ7dKOqPoZ9g5KRkH92gRPLJsmenPb3AOQomSsKJElOweOLQzfX52v8iCljSVxiCJSE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1UVPr9+0axtk9jDOZSW/sWRWTIjUbEdSa/HQSfcbKPfzJTiI+
	2RId+5B2jnhy3YZU6FTjuytDE+1edLfYo1Oh8bq7M5BK+bFvfROcPHyXq+mI8LA3Ons+95vwWMG
	VkJSlIJlgaac4pffklbKE4Y6FZBDZdRY=
X-Google-Smtp-Source: AGHT+IHshgFBjrE/bznWO4e6lyy0nq5bnj0JFcjbPNAIZZpdv6svyHpe5+Z0ZAFZ4cpQ+FvgAbwAckAC6VQE1xAS01s=
X-Received: by 2002:a05:6402:26cc:b0:607:16b1:7489 with SMTP id
 4fb4d7f45d1cf-608d094801bmr19223662a12.20.1750323359751; Thu, 19 Jun 2025
 01:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org>
In-Reply-To: <20250523043935.2009972-10-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 16:55:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
X-Gm-Features: AX0GCFvInY5DbmRkbwxLo6Cb2clGLakUsQ51xQCaa7Coc4b_DkkyTMX5tkJkYVA
Message-ID: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] loongarch: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Tianyang Zhang <zhangtianyang@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
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

SGksIEtlZXMsCgpPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjozOeKAr1BNIEtlZXMgQ29vayA8
a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFdoZW4gS0NPViBpcyBlbmFibGVkIGFsbCBmdW5j
dGlvbnMgZ2V0IGluc3RydW1lbnRlZCwgdW5sZXNzCj4gdGhlIF9fbm9fc2FuaXRpemVfY292ZXJh
Z2UgYXR0cmlidXRlIGlzIHVzZWQuIFRvIHByZXBhcmUgZm9yCj4gX19ub19zYW5pdGl6ZV9jb3Zl
cmFnZSBiZWluZyBhcHBsaWVkIHRvIF9faW5pdCBmdW5jdGlvbnMsIHdlIGhhdmUgdG8KPiBoYW5k
bGUgZGlmZmVyZW5jZXMgaW4gaG93IEdDQydzIGlubGluZSBvcHRpbWl6YXRpb25zIGdldCByZXNv
bHZlZC4gRm9yCj4gbG9vbmdhcmNoIHRoaXMgZXhwb3NlZCBzZXZlcmFsIHBsYWNlcyB3aGVyZSBf
X2luaXQgYW5ub3RhdGlvbnMgd2VyZQo+IG1pc3NpbmcgYnV0IGVuZGVkIHVwIGJlaW5nICJhY2Np
ZGVudGFsbHkgY29ycmVjdCIuIEZpeCB0aGVzZSBjYXNlcyBhbmQKPiBmb3JjZSBvbmUgZnVuY3Rp
b24gdG8gYmUgaW5saW5lIHdpdGggX19hbHdheXNfaW5saW5lLgo+Cj4gU2lnbmVkLW9mZi1ieTog
S2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Cj4gLS0tCj4gQ2M6IEh1YWNhaSBDaGVuIDxjaGVu
aHVhY2FpQGtlcm5lbC5vcmc+Cj4gQ2M6IFdBTkcgWHVlcnVpIDxrZXJuZWxAeGVuMG4ubmFtZT4K
PiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IFRpYW55YW5n
IFpoYW5nIDx6aGFuZ3RpYW55YW5nQGxvb25nc29uLmNuPgo+IENjOiBCaWJvIE1hbyA8bWFvYmli
b0Bsb29uZ3Nvbi5jbj4KPiBDYzogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29t
Pgo+IENjOiA8bG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldj4KPiAtLS0KPiAgYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS9hc20vc21wLmggfCAyICstCj4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC90aW1l
LmMgICAgIHwgMiArLQo+ICBhcmNoL2xvb25nYXJjaC9tbS9pb3JlbWFwLmMgICAgICB8IDQgKyst
LQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9zbXAuaCBiL2FyY2gvbG9v
bmdhcmNoL2luY2x1ZGUvYXNtL3NtcC5oCj4gaW5kZXggYWQwYmQyMzRhMGYxLi44OGUxOWQ4YTEx
ZjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc21wLmgKPiArKysg
Yi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9zbXAuaAo+IEBAIC0zOSw3ICszOSw3IEBAIGlu
dCBsb29uZ3Nvbl9jcHVfZGlzYWJsZSh2b2lkKTsKPiAgdm9pZCBsb29uZ3Nvbl9jcHVfZGllKHVu
c2lnbmVkIGludCBjcHUpOwo+ICAjZW5kaWYKPgo+IC1zdGF0aWMgaW5saW5lIHZvaWQgcGxhdF9z
bXBfc2V0dXAodm9pZCkKPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHBsYXRfc21wX3Nl
dHVwKHZvaWQpClNpbWlsYXIgdG8geDg2IGFuZCBhcm0sIEkgcHJlZmVyIHRvIG1hcmsgaXQgYXMg
X19pbml0IHJhdGhlciB0aGFuCl9fYWx3YXlzX2lubGluZS4KCkh1YWNhaQoKPiAgewo+ICAgICAg
ICAgbG9vbmdzb25fc21wX3NldHVwKCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2Fy
Y2gva2VybmVsL3RpbWUuYyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC90aW1lLmMKPiBpbmRleCBi
Yzc1YTNhNjlmYzguLjM2NzkwNmIxMGY4MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9r
ZXJuZWwvdGltZS5jCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYwo+IEBAIC0x
MDIsNyArMTAyLDcgQEAgc3RhdGljIGludCBjb25zdGFudF90aW1lcl9uZXh0X2V2ZW50KHVuc2ln
bmVkIGxvbmcgZGVsdGEsIHN0cnVjdCBjbG9ja19ldmVudF9kZXYKPiAgICAgICAgIHJldHVybiAw
Owo+ICB9Cj4KPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGdldF9sb29wc19wZXJfamlm
Znkodm9pZCkKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgZ2V0X2xvb3BzX3Blcl9qaWZmeSh2b2lk
KQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGxwaiA9ICh1bnNpZ25lZCBsb25nKWNvbnN0
X2Nsb2NrX2ZyZXE7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5j
IGIvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5jCj4gaW5kZXggNzBjYTczMDE5ODExLi5kZjk0
OWEzZDBmMzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5jCj4gKysr
IGIvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5jCj4gQEAgLTE2LDEyICsxNiwxMiBAQCB2b2lk
IF9faW5pdCBlYXJseV9pb3VubWFwKHZvaWQgX19pb21lbSAqYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplKQo+Cj4gIH0KPgo+IC12b2lkICplYXJseV9tZW1yZW1hcF9ybyhyZXNvdXJjZV9zaXplX3Qg
cGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gK3ZvaWQgKiBfX2luaXQgZWFybHlfbWVt
cmVtYXBfcm8ocmVzb3VyY2Vfc2l6ZV90IHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+
ICB7Cj4gICAgICAgICByZXR1cm4gZWFybHlfbWVtcmVtYXAocGh5c19hZGRyLCBzaXplKTsKPiAg
fQo+Cj4gLXZvaWQgKmVhcmx5X21lbXJlbWFwX3Byb3QocmVzb3VyY2Vfc2l6ZV90IHBoeXNfYWRk
ciwgdW5zaWduZWQgbG9uZyBzaXplLAo+ICt2b2lkICogX19pbml0IGVhcmx5X21lbXJlbWFwX3By
b3QocmVzb3VyY2Vfc2l6ZV90IHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+ICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwcm90X3ZhbCkKPiAgewo+ICAgICAgICAgcmV0
dXJuIGVhcmx5X21lbXJlbWFwKHBoeXNfYWRkciwgc2l6ZSk7Cj4gLS0KPiAyLjM0LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
