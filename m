Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDCCCA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTn0aDK9OlyIm419TIaZOvBEOh6kXbrU/LT4Z8JbEqw=; b=Qw1TeiMkEaJqXR
	CDxZpBqF40p+UYlKi3lnSk0QttH8YfBv7JJr9CgeHvsAH7LvqUrA/1HApozxZwnp2o9f1KIFEv7cW
	YjgFGKAnVDGDmqbj7uuhIMFrQnfI8uXmx8w7D88fmAM3OX0pXFLMakO8oUTK+Ws1vjM30uM7j+Y78
	Gk3v/I9rSgC5EFzlP4QTQFXSpmIHuCKsawvnnGbdfswz9LWGuj1t9Yca36zHRZcO+a06+WV9AzuNp
	qxGQVVXDiLW+mJi12Cp9NJk2rgZy6GUFdAR5IJ7uBchL3C+1/kho7cJSZsdlGK72mHboe0gcXBHKS
	D6SN6smaqO6sXuhXhLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz3n-00GdTB-29;
	Fri, 01 Sep 2023 07:59:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz3j-00GdRi-36;
	Fri, 01 Sep 2023 07:59:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E6DA61CB2;
	Fri,  1 Sep 2023 07:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F28C433CA;
	Fri,  1 Sep 2023 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693555154;
	bh=GYFYHNBwiYIMyxXYhNMZBkYnxr8aCSZaJphpVUbR/gI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AaRktxRVhEkyJ9abOTUx7V1990sLCQZsTcFUleQ9gIPImVoGeS5XT88pEptizfQDW
	 nHQgbPUErQ/EtGTelQCn2JhACffAb906a3fJ4in3B4pCmK6qM0io61lBIOnhXZ01m0
	 H5w1WWX4mbREPA9UDC2fe+zlPL9TSAvCy5V5R8UagFmSy8vYheYL0hPJCXf5I91b7T
	 TooNiVCUoUTRJvGRT3I4IL6EjI/AcDVnd0G4O3HqcJT1EWm5mQPzH+sLC+Ivo0edUD
	 zFOJ+InUvPaokhPEzGYCjmb5rvDpXKLESGTzYoF9j92Jto02sA1aNf4Ycj8NwKOsMP
	 OOd4SSi9NU49A==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-573ac2fa37aso1025749eaf.3;
        Fri, 01 Sep 2023 00:59:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQ8TNjAK95bDbwmVhVjcMrz1bpx/kCR9m9igRuoJ9M4nzxPjKT
	S+kM1IPTKHXK5vYvnauRuDawfg5SI844UEQ8oKM=
X-Google-Smtp-Source: AGHT+IHWr1PcUpOyQTzQJYAg/TVFLv3Ywby9u7RUE31cJ6C0yBF+em+y7ml6sODmNo5t9DAFJN+2Shqq08kJwtSujfQ=
X-Received: by 2002:a4a:919c:0:b0:56e:4921:deb0 with SMTP id
 d28-20020a4a919c000000b0056e4921deb0mr1662294ooh.8.1693555153843; Fri, 01 Sep
 2023 00:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230831191335.give.534-kees@kernel.org>
In-Reply-To: <20230831191335.give.534-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Sep 2023 16:58:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
Message-ID: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_005916_171292_EAB90B05 
X-CRM114-Status: GOOD (  18.69  )
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

T24gRnJpLCBTZXAgMSwgMjAyMyBhdCA0OjEz4oCvQU0gS2VlcyBDb29rIDxrZWVzY29va0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gQ3VycmVudGx5IHRoZSBLY29uZmlnIGZyYWdtZW50cyBpbiBr
ZXJuZWwvY29uZmlncyBhbmQgYXJjaC8qL2NvbmZpZ3MKPiB0aGF0IGFyZW4ndCB1c2VkIGludGVy
bmFsbHkgYXJlbid0IGRpc2NvdmVyYWJsZSB0aHJvdWdoICJtYWtlIGhlbHAiLAo+IHdoaWNoIGNv
bnNpc3RzIG9mIGhhcmQtY29kZWQgbGlzdHMgb2YgY29uZmlnIGZyYWdtZW50cy4gSW5zdGVhZCwg
bGlzdAo+IGFsbCB0aGUgZnJhZ21lbnQgdGFyZ2V0cyB0aGF0IGhhdmUgYSAiIyBIZWxwOiAiIGNv
bW1lbnQgcHJlZml4IHNvIHRoZQo+IHRhcmdldHMgY2FuIGJlIGdlbmVyYXRlZCBkeW5hbWljYWxs
eS4KPgo+IEFkZCBsb2dpYyB0byB0aGUgTWFrZWZpbGUgdG8gc2VhcmNoIGZvciBhbmQgZGlzcGxh
eSB0aGUgZnJhZ21lbnQgYW5kCj4gY29tbWVudC4gQWRkIGNvbW1lbnRzIHRvIGZyYWdtZW50cyB0
aGF0IGFyZSBpbnRlbmRlZCB0byBiZSBkaXJlY3QgdGFyZ2V0cy4KPgo+IENjOiBOaWNvbGFzIFNj
aGllciA8bmljb2xhc0BmamFzbGUuZXU+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxl
cm1hbi5pZC5hdT4KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pgo+IENjOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiB4ODZAa2VybmVsLm9yZwo+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXhwcGMtZGV2QGxp
c3RzLm96bGFicy5vcmcKPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDby1kZXZlbG9wZWQtYnk6
IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gLS0tCj4gdjM6Cj4gLSBV
c2UgTWFrZWZpbGUgbG9naWMgZnJvbSBNYXNhaGlybyBZYW1hZGEKPiAtIFVzZSAiIyBIZWxwOiAi
IHByZWZpeCwgYnV0IG9ubHkgb24gZGVzaXJlZCBmcmFnbWVudCB0YXJnZXRzCj4gdjI6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgyNTE5NDMyOS5nb25uYS45MTEta2Vlc0BrZXJu
ZWwub3JnCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgyNDIyMzYwNi5u
ZXZlci43NjIta2Vlc0BrZXJuZWwub3JnCj4gLS0tCj4gIE1ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vY29uZmlncy9kcmFtXzB4MDAw
MDAwMDAuY29uZmlnICAgIHwgIDEgKwo+ICBhcmNoL2FybS9jb25maWdzL2RyYW1fMHhjMDAwMDAw
MC5jb25maWcgICAgfCAgMSArCj4gIGFyY2gvYXJtL2NvbmZpZ3MvZHJhbV8weGQwMDAwMDAwLmNv
bmZpZyAgICB8ICAxICsKPiAgYXJjaC9hcm0vY29uZmlncy9scGFlLmNvbmZpZyAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvdmlydC5jb25maWcgICAgICAgICAgICAg
fCAgMSArCj4gIGFyY2gvcG93ZXJwYy9jb25maWdzL2Rpc2FibGUtd2Vycm9yLmNvbmZpZyB8ICAx
ICsKPiAgYXJjaC9wb3dlcnBjL2NvbmZpZ3Mvc2VjdXJpdHkuY29uZmlnICAgICAgIHwgIDQgKysr
LQo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvMzItYml0LmNvbmZpZyAgICAgICAgICAgfCAgMSArCj4g
IGFyY2gvcmlzY3YvY29uZmlncy82NC1iaXQuY29uZmlnICAgICAgICAgICB8ICAxICsKPiAgYXJj
aC9zMzkwL2NvbmZpZ3MvYnRmLmNvbmZpZyAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Mz
OTAvY29uZmlncy9rYXNhbi5jb25maWcgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gveDg2L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0IC0tLS0KPiAga2VybmVsL2NvbmZp
Z3MvZGVidWcuY29uZmlnICAgICAgICAgICAgICAgIHwgIDIgKysKPiAga2VybmVsL2NvbmZpZ3Mv
a3ZtX2d1ZXN0LmNvbmZpZyAgICAgICAgICAgIHwgIDEgKwo+ICBrZXJuZWwvY29uZmlncy9ub3Bt
LmNvbmZpZyAgICAgICAgICAgICAgICAgfCAgMiArKwo+ICBrZXJuZWwvY29uZmlncy9ydXN0LmNv
bmZpZyAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGtlcm5lbC9jb25maWdzL3RpbnkuY29uZmln
ICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIGtlcm5lbC9jb25maWdzL3g4Nl9kZWJ1Zy5jb25m
aWcgICAgICAgICAgICB8ICAxICsKPiAga2VybmVsL2NvbmZpZ3MveGVuLmNvbmZpZyAgICAgICAg
ICAgICAgICAgIHwgIDIgKysKPiAgc2NyaXB0cy9rY29uZmlnL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrLS0tCj4gIDIxIGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KCgpKdXN0IG9uZSB0aGluZy4KCgoKCgo+IGRpZmYg
LS1naXQgYS9rZXJuZWwvY29uZmlncy90aW55LmNvbmZpZyBiL2tlcm5lbC9jb25maWdzL3Rpbnku
Y29uZmlnCj4gaW5kZXggMDAwMDlmN2QwODM1Li42MGE0YjZkODBiMzYgMTAwNjQ0Cj4gLS0tIGEv
a2VybmVsL2NvbmZpZ3MvdGlueS5jb25maWcKPiArKysgYi9rZXJuZWwvY29uZmlncy90aW55LmNv
bmZpZwo+IEBAIC0xLDMgKzEsNSBAQAo+ICsjIEhlbHA6IFNpemUtb3B0aW1pemVkIGtlcm5lbCBp
bWFnZQoKCkkgd2lsbCBkcm9wIHRoaXMuCgoKV2UgYWxyZWFkeSBoYXZlIGEgaGFyZC1jb2RlZCBo
ZWxwIG1lc3NhZ2UuCgogIHRpbnljb25maWcgICAtIENvbmZpZ3VyZSB0aGUgdGluaWVzdCBwb3Nz
aWJsZSBrZXJuZWwKCgoKClRoZW4sIHNvbWUgbGluZXMgYmVsb3csIGFnYWluLgoKICB0aW55LmNv
bmZpZyAgICAgICAgICAgICAgIC0gU2l6ZS1vcHRpbWl6ZWQga2VybmVsIGltYWdlCgoKCnRpbnku
Y29uZmlnIGlzIGZvciBpbnRlcm5hbCB1c2UgZm9yIHRpbnljb25maWcuCgoKCgotLSAKQmVzdCBS
ZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
