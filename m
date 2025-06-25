Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E64C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 01:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+4R28Zz+k9vO7up4FRB4KxhAFBoH0GkkGra4XeJMWQ=; b=mFze0CuM76S/J5
	w35/0fqrV2POzCaLN0UJayrCIMN7ClUjO/SB2GzLMs/3e4lAoCjLY70mKv32hnCHjQ+KbacZt+Kww
	lzNOBPTZWrnKCjltqhD/rM2B05YsyxycVjoEciaV8mwwukTMBO+ON2gFKy0KWTpo+Zf31odMrXAU0
	4wuNfKS++8suAFHcy9Gzwop3SCY+PcqHR4jOPNpQEyzBg+AwDGJj1Kv9RtgkcSEua/DiVqbT9ct5Q
	vCaTqRLuMVr7ROBG+O681cxUtMxWxMGzbHqXWTxBV7gs259RgjFKjYS/cPuixiU9TmQxvnWwM27ie
	8Zi9PEWmBZV/k5grzl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEft-00000007EeI-2jbf;
	Wed, 25 Jun 2025 01:11:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEdZ-00000007EOc-30ea;
	Wed, 25 Jun 2025 01:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C914360051;
	Wed, 25 Jun 2025 01:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5E3C4CEE3;
	Wed, 25 Jun 2025 01:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750813756;
	bh=ar+M7uOS6NGMBXnGsSfhmdY2/NIrFzzFwB2vQ2UdzzU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=si3Mv9bYY/8kBwTkVAcQqZoJK6oPCfQbERzoeHQNnnjouaaju9cDPj5M/XH+LGCGf
	 sutZ2TLPTDRMtEiUcTLAfcucjlB1tBOK027s1ZYe+qpQm8YtBXVVCggwf2H8yIixe+
	 IDVtaRLnE7OYk8omFmO1wVvMArdpG+qU6ghcCXqwDH3eSeR/zt8PJr47crwpodU4K/
	 +SdYth5GpIqN7Rkz05vHh/vtCMrcnD2wmTD+63kR8qXgeUEYggdfeNmyLdKPgxxZY0
	 Z7hF7LuReE6Xw0PlrdhJ4M022p1QhH6fci9WuRh8Uql2D6xK1hPUmyC7uoJ+Q8UvXd
	 gbu4rtou3gcJw==
Date: Tue, 24 Jun 2025 18:09:18 -0700
From: Kees Cook <kees@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tianyang Zhang <zhangtianyang@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, llvm@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_10/14=5D_loongarch=3A_Han?=
 =?US-ASCII?Q?dle_KCOV_=5F=5Finit_vs_inline_mismatches?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org> <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com> <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
Message-ID: <B5A11282-CB0E-46E0-A5D7-EF4D8BFC23B4@kernel.org>
MIME-Version: 1.0
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

CgpPbiBKdW5lIDI0LCAyMDI1IDU6MzE6MTIgQU0gUERULCBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNh
aUBrZXJuZWwub3JnPiB3cm90ZToKPkhpLCBLZWVzLAo+Cj5PbiBUaHUsIEp1biAxOSwgMjAyNSBh
dCA0OjU14oCvUE0gSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+IEhpLCBLZWVzLAo+Pgo+PiBPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjozOeKAr1BNIEtl
ZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPj4gPgo+PiA+IFdoZW4gS0NPViBpcyBl
bmFibGVkIGFsbCBmdW5jdGlvbnMgZ2V0IGluc3RydW1lbnRlZCwgdW5sZXNzCj4+ID4gdGhlIF9f
bm9fc2FuaXRpemVfY292ZXJhZ2UgYXR0cmlidXRlIGlzIHVzZWQuIFRvIHByZXBhcmUgZm9yCj4+
ID4gX19ub19zYW5pdGl6ZV9jb3ZlcmFnZSBiZWluZyBhcHBsaWVkIHRvIF9faW5pdCBmdW5jdGlv
bnMsIHdlIGhhdmUgdG8KPj4gPiBoYW5kbGUgZGlmZmVyZW5jZXMgaW4gaG93IEdDQydzIGlubGlu
ZSBvcHRpbWl6YXRpb25zIGdldCByZXNvbHZlZC4gRm9yCj4+ID4gbG9vbmdhcmNoIHRoaXMgZXhw
b3NlZCBzZXZlcmFsIHBsYWNlcyB3aGVyZSBfX2luaXQgYW5ub3RhdGlvbnMgd2VyZQo+PiA+IG1p
c3NpbmcgYnV0IGVuZGVkIHVwIGJlaW5nICJhY2NpZGVudGFsbHkgY29ycmVjdCIuIEZpeCB0aGVz
ZSBjYXNlcyBhbmQKPj4gPiBmb3JjZSBvbmUgZnVuY3Rpb24gdG8gYmUgaW5saW5lIHdpdGggX19h
bHdheXNfaW5saW5lLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogS2VlcyBDb29rIDxrZWVzQGtl
cm5lbC5vcmc+Cj4+ID4gLS0tCj4+ID4gQ2M6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5l
bC5vcmc+Cj4+ID4gQ2M6IFdBTkcgWHVlcnVpIDxrZXJuZWxAeGVuMG4ubmFtZT4KPj4gPiBDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4+ID4gQ2M6IFRpYW55YW5nIFpo
YW5nIDx6aGFuZ3RpYW55YW5nQGxvb25nc29uLmNuPgo+PiA+IENjOiBCaWJvIE1hbyA8bWFvYmli
b0Bsb29uZ3Nvbi5jbj4KPj4gPiBDYzogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQu
Y29tPgo+PiA+IENjOiA8bG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldj4KPj4gPiAtLS0KPj4gPiAg
YXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc21wLmggfCAyICstCj4+ID4gIGFyY2gvbG9vbmdh
cmNoL2tlcm5lbC90aW1lLmMgICAgIHwgMiArLQo+PiA+ICBhcmNoL2xvb25nYXJjaC9tbS9pb3Jl
bWFwLmMgICAgICB8IDQgKystLQo+PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9p
bmNsdWRlL2FzbS9zbXAuaCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3NtcC5oCj4+ID4g
aW5kZXggYWQwYmQyMzRhMGYxLi44OGUxOWQ4YTExZjQgMTAwNjQ0Cj4+ID4gLS0tIGEvYXJjaC9s
b29uZ2FyY2gvaW5jbHVkZS9hc20vc21wLmgKPj4gPiArKysgYi9hcmNoL2xvb25nYXJjaC9pbmNs
dWRlL2FzbS9zbXAuaAo+PiA+IEBAIC0zOSw3ICszOSw3IEBAIGludCBsb29uZ3Nvbl9jcHVfZGlz
YWJsZSh2b2lkKTsKPj4gPiAgdm9pZCBsb29uZ3Nvbl9jcHVfZGllKHVuc2lnbmVkIGludCBjcHUp
Owo+PiA+ICAjZW5kaWYKPj4gPgo+PiA+IC1zdGF0aWMgaW5saW5lIHZvaWQgcGxhdF9zbXBfc2V0
dXAodm9pZCkKPj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHBsYXRfc21wX3NldHVw
KHZvaWQpCj4+IFNpbWlsYXIgdG8geDg2IGFuZCBhcm0sIEkgcHJlZmVyIHRvIG1hcmsgaXQgYXMg
X19pbml0IHJhdGhlciB0aGFuCj4+IF9fYWx3YXlzX2lubGluZS4KPklmIHlvdSBoYXZlIG5vIG9i
amVjdGlvbnMsIEkgd2lsbCBhcHBseSB0aGlzIHBhdGNoIHdpdGggdGhlIGFib3ZlIG1vZGlmaWNh
dGlvbi4KClRoYXQncyBmaW5lIGJ5IG1lOyB0aGFuayB5b3UhIEkgZGlkbid0IGhhdmUgYSBjaGFu
Y2UgeWV0IHRvIHZlcmlmeSB0aGF0IGl0IGFjdHVhbGx5IGZpeGVzIHRoZSBtaXNtYXRjaGVzIEkg
c2F3LCBidXQgaWYgaXQgbG9va3MgZ29vZCB0byB5b3UsIHllcyBwbGVhc2UuIDopCgotS2VlcwoK
Pgo+Cj5IdWFjYWkKPgo+Pgo+PiBIdWFjYWkKPj4KPj4gPiAgewo+PiA+ICAgICAgICAgbG9vbmdz
b25fc21wX3NldHVwKCk7Cj4+ID4gIH0KPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gv
a2VybmVsL3RpbWUuYyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC90aW1lLmMKPj4gPiBpbmRleCBi
Yzc1YTNhNjlmYzguLjM2NzkwNmIxMGY4MSAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL2xvb25nYXJj
aC9rZXJuZWwvdGltZS5jCj4+ID4gKysrIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYwo+
PiA+IEBAIC0xMDIsNyArMTAyLDcgQEAgc3RhdGljIGludCBjb25zdGFudF90aW1lcl9uZXh0X2V2
ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsIHN0cnVjdCBjbG9ja19ldmVudF9kZXYKPj4gPiAgICAg
ICAgIHJldHVybiAwOwo+PiA+ICB9Cj4+ID4KPj4gPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgX19p
bml0IGdldF9sb29wc19wZXJfamlmZnkodm9pZCkKPj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcg
Z2V0X2xvb3BzX3Blcl9qaWZmeSh2b2lkKQo+PiA+ICB7Cj4+ID4gICAgICAgICB1bnNpZ25lZCBs
b25nIGxwaiA9ICh1bnNpZ25lZCBsb25nKWNvbnN0X2Nsb2NrX2ZyZXE7Cj4+ID4KPj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5jIGIvYXJjaC9sb29uZ2FyY2gvbW0v
aW9yZW1hcC5jCj4+ID4gaW5kZXggNzBjYTczMDE5ODExLi5kZjk0OWEzZDBmMzQgMTAwNjQ0Cj4+
ID4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvbW0vaW9yZW1hcC5jCj4+ID4gKysrIGIvYXJjaC9sb29u
Z2FyY2gvbW0vaW9yZW1hcC5jCj4+ID4gQEAgLTE2LDEyICsxNiwxMiBAQCB2b2lkIF9faW5pdCBl
YXJseV9pb3VubWFwKHZvaWQgX19pb21lbSAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+PiA+
Cj4+ID4gIH0KPj4gPgo+PiA+IC12b2lkICplYXJseV9tZW1yZW1hcF9ybyhyZXNvdXJjZV9zaXpl
X3QgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4+ID4gK3ZvaWQgKiBfX2luaXQgZWFy
bHlfbWVtcmVtYXBfcm8ocmVzb3VyY2Vfc2l6ZV90IHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplKQo+PiA+ICB7Cj4+ID4gICAgICAgICByZXR1cm4gZWFybHlfbWVtcmVtYXAocGh5c19hZGRy
LCBzaXplKTsKPj4gPiAgfQo+PiA+Cj4+ID4gLXZvaWQgKmVhcmx5X21lbXJlbWFwX3Byb3QocmVz
b3VyY2Vfc2l6ZV90IHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+PiA+ICt2b2lkICog
X19pbml0IGVhcmx5X21lbXJlbWFwX3Byb3QocmVzb3VyY2Vfc2l6ZV90IHBoeXNfYWRkciwgdW5z
aWduZWQgbG9uZyBzaXplLAo+PiA+ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBw
cm90X3ZhbCkKPj4gPiAgewo+PiA+ICAgICAgICAgcmV0dXJuIGVhcmx5X21lbXJlbWFwKHBoeXNf
YWRkciwgc2l6ZSk7Cj4+ID4gLS0KPj4gPiAyLjM0LjEKPj4gPgoKLS0gCktlZXMgQ29vawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
