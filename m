Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D876C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLBNsr1r+WQbnpDiVP8GPQWvmwvDvcTNx0DrrMYLED4=; b=zgax/KwerHOR7G
	PrqrbFk1FEwNKb2HGQ67/8peiF49PvPt44FhOK+1zfV2hPCIkd1YsrutGbxAfqEU57tal4nbWc6Va
	rhob38pdbZWpIt+RIwujuwukAJfvso+qiWzdQ35Pc45YekTB6tS2Gsk4X0yGWX0GW6wHDUkOFsweh
	3b/ZINkzkRZwvPnUGHJP5sZjZcJHJdmRva4iO0T8kOTsGgdqlsBLz+DiQRdkT5Od7VPQRhChjltyi
	Xr50OaW8WECWQPGjX/smLwl0d4yWFwcUscrFclvFgG+fZiBPWt4OFBNkTlCn2sPVk1lMmOpuEclMd
	KOMQ4IQTPu63LHWnNAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckna-0000000CeyC-2GTm;
	Fri, 18 Jul 2025 13:06:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckl0-0000000CeXP-3ouP;
	Fri, 18 Jul 2025 13:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3DEC601D9;
	Fri, 18 Jul 2025 13:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E41C4CEEB;
	Fri, 18 Jul 2025 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752843849;
	bh=e9JV0Z0iQk3JJlBwUijpHfs6OkBiHHnta1gSH+W9zOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSHIa+MrlwXDsebHQMAOBrcdcgNNRuFu1OTjumS8fxdFBEiWA23QLsWePa1HP1jXa
	 DP7rD2arOXkIYe04ayLXrk6t48TKPhah+qrfUQk4ky4F4LbYRccQTgZL/kXp3nQJYB
	 nrJLucASNeNNY+00+8mINN6UNjKqm5BId8c4coJWxb2glH/Jf36YSDoPuBM+WSroOr
	 n4i8t1jm9SduQegLb6spa4A1/MFx1Gu+g8rrZJhbtALp3VA5PnisWIVkS3OfF1re3r
	 AMqmvtywhenvyRLdeSc0OM7qWEwqaMFUvF5JgNdpEgu+srMur2jwIhNPEyXJW5TR2q
	 5vV09+6vxMu3A==
Date: Fri, 18 Jul 2025 14:04:00 +0100
From: Lee Jones <lee@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Allison Randal <allison@lohutok.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/13] arm: Handle KCOV __init vs inline mismatches
Message-ID: <20250718130400.GB11056@google.com>
References: <20250717231756.make.423-kees@kernel.org>
 <20250717232519.2984886-5-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717232519.2984886-5-kees@kernel.org>
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

T24gVGh1LCAxNyBKdWwgMjAyNSwgS2VlcyBDb29rIHdyb3RlOgoKPiBXaGVuIEtDT1YgaXMgZW5h
YmxlZCBhbGwgZnVuY3Rpb25zIGdldCBpbnN0cnVtZW50ZWQsIHVubGVzcwo+IHRoZSBfX25vX3Nh
bml0aXplX2NvdmVyYWdlIGF0dHJpYnV0ZSBpcyB1c2VkLiBUbyBwcmVwYXJlIGZvcgo+IF9fbm9f
c2FuaXRpemVfY292ZXJhZ2UgYmVpbmcgYXBwbGllZCB0byBfX2luaXQgZnVuY3Rpb25zLCB3ZSBo
YXZlIHRvCj4gaGFuZGxlIGRpZmZlcmVuY2VzIGluIGhvdyBHQ0MncyBpbmxpbmUgb3B0aW1pemF0
aW9ucyBnZXQgcmVzb2x2ZWQuIEZvcgo+IGFybSB0aGlzIGV4cG9zZWQgc2V2ZXJhbCBwbGFjZXMg
d2hlcmUgX19pbml0IGFubm90YXRpb25zIHdlcmUgbWlzc2luZwo+IGJ1dCBlbmRlZCB1cCBiZWlu
ZyAiYWNjaWRlbnRhbGx5IGNvcnJlY3QiLiBGaXggdGhlc2UgY2FzZXMgYW5kIGZvcmNlCj4gc2V2
ZXJhbCBmdW5jdGlvbnMgdG8gYmUgaW5saW5lIHdpdGggX19hbHdheXNfaW5saW5lLgo+IAo+IEFj
a2VkLWJ5OiBOaXNoYW50aCBNZW5vbiA8bm1AdGkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEtlZXMg
Q29vayA8a2Vlc0BrZXJuZWwub3JnPgo+IC0tLQo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFy
bWxpbnV4Lm9yZy51az4KPiBDYzogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFy
by5vcmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBO
aXNoYW50aCBNZW5vbiA8bm1AdGkuY29tPgo+IENjOiBTYW50b3NoIFNoaWxpbWthciA8c3NhbnRv
c2hAa2VybmVsLm9yZz4KPiBDYzogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KPiBDYzogQWxs
aXNvbiBSYW5kYWwgPGFsbGlzb25AbG9odXRvay5uZXQ+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IDxsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvbWZkL2RieDUwMC1wcmNt
dS5oICB8IDIgKy0KCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgoKPiAgYXJj
aC9hcm0vbW0vY2FjaGUtZmVyb2Nlb24tbDIuYyAgIHwgMiArLQo+ICBhcmNoL2FybS9tbS9jYWNo
ZS10YXVyb3MyLmMgICAgICAgfCAyICstCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItb3Jp
b24uYyB8IDIgKy0KPiAgZHJpdmVycy9zb2MvdGkvcG0zM3h4LmMgICAgICAgICAgIHwgMiArLQo+
ICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvZGJ4NTAwLXByY211LmggYi9pbmNsdWRlL2xp
bnV4L21mZC9kYng1MDAtcHJjbXUuaAo+IGluZGV4IDk4NTY3NjIzYzlkZi4uODI4MzYyYjc4NjBj
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWZkL2RieDUwMC1wcmNtdS5oCj4gKysrIGIv
aW5jbHVkZS9saW51eC9tZmQvZGJ4NTAwLXByY211LmgKPiBAQCAtMjEzLDcgKzIxMyw3IEBAIHN0
cnVjdCBwcmNtdV9md192ZXJzaW9uIHsKPiAgCj4gICNpZiBkZWZpbmVkKENPTkZJR19VWDUwMF9T
T0NfREI4NTAwKQo+ICAKPiAtc3RhdGljIGlubGluZSB2b2lkIHByY211X2Vhcmx5X2luaXQodm9p
ZCkKPiArc3RhdGljIGlubGluZSB2b2lkIF9faW5pdCBwcmNtdV9lYXJseV9pbml0KHZvaWQpCj4g
IHsKPiAgCWRiODUwMF9wcmNtdV9lYXJseV9pbml0KCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vbW0vY2FjaGUtZmVyb2Nlb24tbDIuYyBiL2FyY2gvYXJtL21tL2NhY2hlLWZlcm9jZW9u
LWwyLmMKPiBpbmRleCAyNWRiZDg0YTFhYWYuLjJiZmVmYjI1MmZmZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9tbS9jYWNoZS1mZXJvY2Vvbi1sMi5jCj4gKysrIGIvYXJjaC9hcm0vbW0vY2FjaGUt
ZmVyb2Nlb24tbDIuYwo+IEBAIC0yOTUsNyArMjk1LDcgQEAgc3RhdGljIGlubGluZSB1MzIgcmVh
ZF9leHRyYV9mZWF0dXJlcyh2b2lkKQo+ICAJcmV0dXJuIHU7Cj4gIH0KPiAgCj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCB3cml0ZV9leHRyYV9mZWF0dXJlcyh1MzIgdSkKPiArc3RhdGljIGlubGluZSB2
b2lkIF9faW5pdCB3cml0ZV9leHRyYV9mZWF0dXJlcyh1MzIgdSkKPiAgewo+ICAJX19hc21fXygi
bWNyIHAxNSwgMSwgJTAsIGMxNSwgYzEsIDAiIDogOiAiciIgKHUpKTsKPiAgfQo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9tbS9jYWNoZS10YXVyb3MyLmMgYi9hcmNoL2FybS9tbS9jYWNoZS10YXVy
b3MyLmMKPiBpbmRleCBiMWUxYWJhNjAyZjcuLmJmZTE2NmNjYWNlMCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9tbS9jYWNoZS10YXVyb3MyLmMKPiArKysgYi9hcmNoL2FybS9tbS9jYWNoZS10YXVy
b3MyLmMKPiBAQCAtMTc3LDcgKzE3Nyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgd3Jp
dGVfYWN0bHIodTMyIGFjdGxyKQo+ICAJX19hc21fXygibWNyIHAxNSwgMCwgJTAsIGMxLCBjMCwg
MVxuIiA6IDogInIiIChhY3RscikpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBlbmFibGVfZXh0
cmFfZmVhdHVyZSh1bnNpZ25lZCBpbnQgZmVhdHVyZXMpCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBl
bmFibGVfZXh0cmFfZmVhdHVyZSh1bnNpZ25lZCBpbnQgZmVhdHVyZXMpCj4gIHsKPiAgCXUzMiB1
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1vcmlvbi5jIGIv
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1vcmlvbi5jCj4gaW5kZXggNDllODZjYjcwYTdhLi42
MWYxZTI3ZmM0MWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1vcmlv
bi5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1vcmlvbi5jCj4gQEAgLTQzLDcg
KzQzLDcgQEAgc3RhdGljIHN0cnVjdCBkZWxheV90aW1lciBvcmlvbl9kZWxheV90aW1lciA9IHsK
PiAgCS5yZWFkX2N1cnJlbnRfdGltZXIgPSBvcmlvbl9yZWFkX3RpbWVyLAo+ICB9Owo+ICAKPiAt
c3RhdGljIHZvaWQgb3Jpb25fZGVsYXlfdGltZXJfaW5pdCh1bnNpZ25lZCBsb25nIHJhdGUpCj4g
K3N0YXRpYyB2b2lkIF9faW5pdCBvcmlvbl9kZWxheV90aW1lcl9pbml0KHVuc2lnbmVkIGxvbmcg
cmF0ZSkKPiAgewo+ICAJb3Jpb25fZGVsYXlfdGltZXIuZnJlcSA9IHJhdGU7Cj4gIAlyZWdpc3Rl
cl9jdXJyZW50X3RpbWVyX2RlbGF5KCZvcmlvbl9kZWxheV90aW1lcik7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc29jL3RpL3BtMzN4eC5jIGIvZHJpdmVycy9zb2MvdGkvcG0zM3h4LmMKPiBpbmRl
eCBkZmRmZjE4NmM4MDUuLmRjNTJhMjE5N2QyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy90
aS9wbTMzeHguYwo+ICsrKyBiL2RyaXZlcnMvc29jL3RpL3BtMzN4eC5jCj4gQEAgLTE0NSw3ICsx
NDUsNyBAQCBzdGF0aWMgaW50IGFtMzN4eF9kb19zcmFtX2lkbGUodTMyIHdmaV9mbGFncykKPiAg
CXJldHVybiBwbV9vcHMtPmNwdV9zdXNwZW5kKGFtMzN4eF9kb193Zmlfc3JhbSwgd2ZpX2ZsYWdz
KTsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBfX2luaXQgYW00M3h4X21hcF9naWModm9pZCkKPiAr
c3RhdGljIGludCBhbTQzeHhfbWFwX2dpYyh2b2lkKQo+ICB7Cj4gIAlnaWNfZGlzdF9iYXNlID0g
aW9yZW1hcChBTTQzWFhfR0lDX0RJU1RfQkFTRSwgU1pfNEspOwo+ICAKPiAtLSAKPiAyLjM0LjEK
PiAKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
