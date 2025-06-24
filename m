Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D876C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV1Ol3yS07reXlu3iMvvW6nKNrUjjskeugC5eY6E2bA=; b=ykI2LCjRXrv3q7
	M/Arm/I5m+aKR2L1Xs/P2IngnNXB7Rf6Dkc4xYbMhUTbXpq94Ovfh9wypID2S6ufc5tI0P2eqf5Rr
	e3k4gpvP9/BjNEWcvTKwXdaFFdxUUXO8iDdKaqrSVesVFiZJB48wnWURlSTSRqsyCR7cMPreGerss
	aXpJe4k2whLIm3OIj9Q6OYDFE+3yDhGmUMeXDaqmUsoGOL54ZIMZ0faU4uJ34fr05W1z6TL66ms3t
	7ywB2rpKoElOTBnyUCWW/6s81idqVLAvIzoHRMfkZvkCJR+mYvUTew9YHJ/Hc+k0o5+AbDd0ii+az
	Ub1zZO4WEyoooLX+wouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU31h-00000005cMe-0x93;
	Tue, 24 Jun 2025 12:45:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2oB-00000005aZY-2K9x;
	Tue, 24 Jun 2025 12:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 808ED6116F;
	Tue, 24 Jun 2025 12:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A5CC4AF0B;
	Tue, 24 Jun 2025 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750768286;
	bh=A1vlO/L1VKH8WOeSv/ouj3ncracjwzpEiurRYiS/ALg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eu9htEvBiVbL44j/hDA/XL5IHMVRkTjREoK+yoJofVs3i2H7zYeWM4nuOEa8lvA1q
	 draOJBWRmasaODlA4846qtfnrHoWcfrlpN7SdkOAt9CRDuKgz+Jijdfb0hME3v4zjT
	 vySbdesGJCidQHCf0M229vamBtjKXpnwatmAh49jUKp+nVNq+/QlhEUFGI/3hC6dpM
	 MBpiZpEieyvMUEHttV5HVCNFcwOz97BYbHpUnESxPT0XUV2ac4VY/kC4HNi3iT2U1C
	 nndDqpkUc6Rj2nldXF12iLWnmS6e5StbWpsEaS9jarXC/+el4cuLLpnkbs9yytEYsC
	 jjsFUJ19nZmUg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso768502a12.2;
        Tue, 24 Jun 2025 05:31:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5LAcMmOEo0V2tr9rvzDH9L8gsX8Bn8QXfvVq41ML1ISix1HmrExTsfvEnkajkAq8vaVYNnvAKonRR2SFTSWfA@lists.infradead.org, AJvYcCWcbsnvWXclN9ibRngFvvKQSi06Hr1IjiJ+DArroO8ybdlolS+tjZrsjFpmYd/HTOMNDUWKAu9dzUSkw14=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MQgxj7gCbAdT49Y0tRysr1ybScjP9xZqqGRnmaHOttZ5fuEh
	ojQ5EnSpp0EG6DmbxThUPaTIRUU2nbhRfRsqpMSqqftkN8SLq6aaw75Wd7RcIw1lb1V6am0T7ec
	Zo8J4E7soHUhh12awf0WyAorMYbD6GKo=
X-Google-Smtp-Source: AGHT+IG78TOJtNBgPo6KUbppTtQyUVPXosqjkC+mjKzFM6GuMzZpIE/4mn6DMDsxVG8gc/mo29CZZDSg4K3moyGLako=
X-Received: by 2002:a50:9e07:0:b0:607:5987:5ba1 with SMTP id
 4fb4d7f45d1cf-60a1d1676eamr10402408a12.20.1750768284578; Tue, 24 Jun 2025
 05:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org>
 <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 24 Jun 2025 20:31:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
X-Gm-Features: AX0GCFsgXJm0uAqj4ZcBCmgCp5XFBS8cfA5fjKZVFWrLP2ySZYpAIUKeGDxIJgs
Message-ID: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
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

SGksIEtlZXMsCgpPbiBUaHUsIEp1biAxOSwgMjAyNSBhdCA0OjU14oCvUE0gSHVhY2FpIENoZW4g
PGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgS2VlcywKPgo+IE9uIEZyaSwg
TWF5IDIzLCAyMDI1IGF0IDEyOjM54oCvUE0gS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IFdoZW4gS0NPViBpcyBlbmFibGVkIGFsbCBmdW5jdGlvbnMgZ2V0IGluc3Ry
dW1lbnRlZCwgdW5sZXNzCj4gPiB0aGUgX19ub19zYW5pdGl6ZV9jb3ZlcmFnZSBhdHRyaWJ1dGUg
aXMgdXNlZC4gVG8gcHJlcGFyZSBmb3IKPiA+IF9fbm9fc2FuaXRpemVfY292ZXJhZ2UgYmVpbmcg
YXBwbGllZCB0byBfX2luaXQgZnVuY3Rpb25zLCB3ZSBoYXZlIHRvCj4gPiBoYW5kbGUgZGlmZmVy
ZW5jZXMgaW4gaG93IEdDQydzIGlubGluZSBvcHRpbWl6YXRpb25zIGdldCByZXNvbHZlZC4gRm9y
Cj4gPiBsb29uZ2FyY2ggdGhpcyBleHBvc2VkIHNldmVyYWwgcGxhY2VzIHdoZXJlIF9faW5pdCBh
bm5vdGF0aW9ucyB3ZXJlCj4gPiBtaXNzaW5nIGJ1dCBlbmRlZCB1cCBiZWluZyAiYWNjaWRlbnRh
bGx5IGNvcnJlY3QiLiBGaXggdGhlc2UgY2FzZXMgYW5kCj4gPiBmb3JjZSBvbmUgZnVuY3Rpb24g
dG8gYmUgaW5saW5lIHdpdGggX19hbHdheXNfaW5saW5lLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiBDYzogSHVhY2FpIENoZW4g
PGNoZW5odWFjYWlAa2VybmVsLm9yZz4KPiA+IENjOiBXQU5HIFh1ZXJ1aSA8a2VybmVsQHhlbjBu
Lm5hbWU+Cj4gPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiBD
YzogVGlhbnlhbmcgWmhhbmcgPHpoYW5ndGlhbnlhbmdAbG9vbmdzb24uY24+Cj4gPiBDYzogQmli
byBNYW8gPG1hb2JpYm9AbG9vbmdzb24uY24+Cj4gPiBDYzogSmlheHVuIFlhbmcgPGppYXh1bi55
YW5nQGZseWdvYXQuY29tPgo+ID4gQ2M6IDxsb29uZ2FyY2hAbGlzdHMubGludXguZGV2Pgo+ID4g
LS0tCj4gPiAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc21wLmggfCAyICstCj4gPiAgYXJj
aC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYyAgICAgfCAyICstCj4gPiAgYXJjaC9sb29uZ2FyY2gv
bW0vaW9yZW1hcC5jICAgICAgfCA0ICsrLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS9hc20vc21wLmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9zbXAuaAo+
ID4gaW5kZXggYWQwYmQyMzRhMGYxLi44OGUxOWQ4YTExZjQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L2xvb25nYXJjaC9pbmNsdWRlL2FzbS9zbXAuaAo+ID4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5j
bHVkZS9hc20vc21wLmgKPiA+IEBAIC0zOSw3ICszOSw3IEBAIGludCBsb29uZ3Nvbl9jcHVfZGlz
YWJsZSh2b2lkKTsKPiA+ICB2b2lkIGxvb25nc29uX2NwdV9kaWUodW5zaWduZWQgaW50IGNwdSk7
Cj4gPiAgI2VuZGlmCj4gPgo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwbGF0X3NtcF9zZXR1cCh2
b2lkKQo+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBwbGF0X3NtcF9zZXR1cCh2b2lk
KQo+IFNpbWlsYXIgdG8geDg2IGFuZCBhcm0sIEkgcHJlZmVyIHRvIG1hcmsgaXQgYXMgX19pbml0
IHJhdGhlciB0aGFuCj4gX19hbHdheXNfaW5saW5lLgpJZiB5b3UgaGF2ZSBubyBvYmplY3Rpb25z
LCBJIHdpbGwgYXBwbHkgdGhpcyBwYXRjaCB3aXRoIHRoZSBhYm92ZSBtb2RpZmljYXRpb24uCgoK
SHVhY2FpCgo+Cj4gSHVhY2FpCj4KPiA+ICB7Cj4gPiAgICAgICAgIGxvb25nc29uX3NtcF9zZXR1
cCgpOwo+ID4gIH0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdGltZS5j
IGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYwo+ID4gaW5kZXggYmM3NWEzYTY5ZmM4Li4z
Njc5MDZiMTBmODEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdGltZS5j
Cj4gPiArKysgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdGltZS5jCj4gPiBAQCAtMTAyLDcgKzEw
Miw3IEBAIHN0YXRpYyBpbnQgY29uc3RhbnRfdGltZXJfbmV4dF9ldmVudCh1bnNpZ25lZCBsb25n
IGRlbHRhLCBzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4g
IH0KPiA+Cj4gPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IGdldF9sb29wc19wZXJfamlm
Znkodm9pZCkKPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBnZXRfbG9vcHNfcGVyX2ppZmZ5KHZv
aWQpCj4gPiAgewo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIGxwaiA9ICh1bnNpZ25lZCBsb25n
KWNvbnN0X2Nsb2NrX2ZyZXE7Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL21t
L2lvcmVtYXAuYyBiL2FyY2gvbG9vbmdhcmNoL21tL2lvcmVtYXAuYwo+ID4gaW5kZXggNzBjYTcz
MDE5ODExLi5kZjk0OWEzZDBmMzQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9tbS9p
b3JlbWFwLmMKPiA+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL21tL2lvcmVtYXAuYwo+ID4gQEAgLTE2
LDEyICsxNiwxMiBAQCB2b2lkIF9faW5pdCBlYXJseV9pb3VubWFwKHZvaWQgX19pb21lbSAqYWRk
ciwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4KPiA+ICB9Cj4gPgo+ID4gLXZvaWQgKmVhcmx5X21l
bXJlbWFwX3JvKHJlc291cmNlX3NpemVfdCBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkK
PiA+ICt2b2lkICogX19pbml0IGVhcmx5X21lbXJlbWFwX3JvKHJlc291cmNlX3NpemVfdCBwaHlz
X2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ICB7Cj4gPiAgICAgICAgIHJldHVybiBlYXJs
eV9tZW1yZW1hcChwaHlzX2FkZHIsIHNpemUpOwo+ID4gIH0KPiA+Cj4gPiAtdm9pZCAqZWFybHlf
bWVtcmVtYXBfcHJvdChyZXNvdXJjZV9zaXplX3QgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNp
emUsCj4gPiArdm9pZCAqIF9faW5pdCBlYXJseV9tZW1yZW1hcF9wcm90KHJlc291cmNlX3NpemVf
dCBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBwcm90X3ZhbCkKPiA+ICB7Cj4gPiAgICAgICAgIHJldHVybiBlYXJseV9t
ZW1yZW1hcChwaHlzX2FkZHIsIHNpemUpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
