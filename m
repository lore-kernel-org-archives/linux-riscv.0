Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86588CA0FF8
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KXbUe0XxiYGFxRbaAY6+nS3FDZyolB3blTbtOul4CE=; b=P/JgxySwYC2jZt
	ldb+T268xQFg9wZ+RRhNNyZ+3OIbKLaJOQXsS8aKFRfFaz0XSeTyFty8O+EouSntk7ZAeJ65v+8oj
	pTVDcISqYRWOGGk1B6Z4Af/qtwmdhfbCimlT2ZsW7STTcMcRkwtTXu6Vq8diaUrdK2GDJjrPQRfa3
	jD/P3dwnQ5CmSLhK5fBSxb2+Pj1dmo82G6MozVjrLLW6O4lbjsLzxfiQoRHsCHdiis6sxSRn4X9hS
	TRxSBSZ/sMNJBkd6jqYvUU7PRbqE7WfWWqBIL5RaG3j+MkC05MJ8L3edSl02tw7LQXWRF96qJej0R
	XKRUSVaH6+Iyde2eyLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcJxl-0017HC-15;
	Sat, 02 Sep 2023 06:18:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcJxh-0017Fp-0v;
	Sat, 02 Sep 2023 06:18:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F3206164C;
	Sat,  2 Sep 2023 06:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB9CC433D9;
	Sat,  2 Sep 2023 06:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693635495;
	bh=S2JjhDQaQjCUBS5BoHwvNrpSReY7nD+6fFAceggH5L4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hIUKwpwmhpYMtn3fTmQXOATMfWHK5+QPj14H0A97QXLXMppSSF9eVXCHQIGuGPsDY
	 JjzSpA3VOzM9M2jNUI1NrIRu8zgcBXHLxoQM6oHLaopiRUU3znUlfC12Ro9UhBiyLx
	 uQT/EorLWHbocPK7E0C1R7T0Ceo4xuq7MBqd0VBTtdv+WbnaPLX7CNg9/sp8uC4d1q
	 E6nGabVyu+eSwVBRG+WRXgYyuhhV+6YVwCc4NAO2vfjaKe5QtdE0vr3jDD9pYrofL/
	 ZGRbk7ZUIJXJ2i3EKLtq2t4f9yRJMYPM7drBRGh6gbPpID1D4FJKbE/iBAkuyvuhrL
	 efRJeyXUxdCfw==
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bf2427b947so1924761a34.3;
        Fri, 01 Sep 2023 23:18:14 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+ye1wFqqIE3i07taeYvJNScRSi6ePluMuYMPzncUaBzZzkt41
	Z9UBAKQQZywT7lbMYuBbzLLVK5m45MVGwQ+i9/w=
X-Google-Smtp-Source: AGHT+IESGICPQ/WBafsIpCkqlmLOntDrnFZ4mcqJsB8bb0Bsgx61YqGasOzlsnoQknaLtIFXHXJ++FKkRqersGaIAOU=
X-Received: by 2002:a05:6870:ac12:b0:1b7:3f07:e431 with SMTP id
 kw18-20020a056870ac1200b001b73f07e431mr5406945oab.54.1693635494264; Fri, 01
 Sep 2023 23:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230831191335.give.534-kees@kernel.org> <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
 <202309011250.AB0DAA03@keescook>
In-Reply-To: <202309011250.AB0DAA03@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Sep 2023 15:17:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgcdwg_3Mtu_ZQYWLKPf5Pzm9syQkqxEDPmD6tic3J6A@mail.gmail.com>
Message-ID: <CAK7LNAQgcdwg_3Mtu_ZQYWLKPf5Pzm9syQkqxEDPmD6tic3J6A@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_231825_435272_DF353299 
X-CRM114-Status: GOOD (  26.86  )
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

T24gU2F0LCBTZXAgMiwgMjAyMyBhdCA0OjUw4oCvQU0gS2VlcyBDb29rIDxrZWVzY29va0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMDQ6NTg6MzdQTSAr
MDkwMCwgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMSwgMjAyMyBhdCA0
OjEz4oCvQU0gS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBDdXJyZW50bHkgdGhlIEtjb25maWcgZnJhZ21lbnRzIGluIGtlcm5lbC9jb25maWdzIGFu
ZCBhcmNoLyovY29uZmlncwo+ID4gPiB0aGF0IGFyZW4ndCB1c2VkIGludGVybmFsbHkgYXJlbid0
IGRpc2NvdmVyYWJsZSB0aHJvdWdoICJtYWtlIGhlbHAiLAo+ID4gPiB3aGljaCBjb25zaXN0cyBv
ZiBoYXJkLWNvZGVkIGxpc3RzIG9mIGNvbmZpZyBmcmFnbWVudHMuIEluc3RlYWQsIGxpc3QKPiA+
ID4gYWxsIHRoZSBmcmFnbWVudCB0YXJnZXRzIHRoYXQgaGF2ZSBhICIjIEhlbHA6ICIgY29tbWVu
dCBwcmVmaXggc28gdGhlCj4gPiA+IHRhcmdldHMgY2FuIGJlIGdlbmVyYXRlZCBkeW5hbWljYWxs
eS4KPiA+ID4KPiA+ID4gQWRkIGxvZ2ljIHRvIHRoZSBNYWtlZmlsZSB0byBzZWFyY2ggZm9yIGFu
ZCBkaXNwbGF5IHRoZSBmcmFnbWVudCBhbmQKPiA+ID4gY29tbWVudC4gQWRkIGNvbW1lbnRzIHRv
IGZyYWdtZW50cyB0aGF0IGFyZSBpbnRlbmRlZCB0byBiZSBkaXJlY3QgdGFyZ2V0cy4KPiA+ID4K
PiA+ID4gQ2M6IE5pY29sYXMgU2NoaWVyIDxuaWNvbGFzQGZqYXNsZS5ldT4KPiA+ID4gQ2M6IE1p
Y2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiA+ID4gQ2M6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPiA+ID4gQ2M6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+ID4gPiBDYzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwo+ID4gPiBDYzogeDg2QGtlcm5lbC5vcmcKPiA+ID4gQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFi
cy5vcmcKPiA+ID4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gQ2M6
IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCj4gPiA+IENjOiBsaW51eC1rYnVpbGRAdmdlci5r
ZXJuZWwub3JnCj4gPiA+IENjOiBsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJuZWwub3JnCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gPiBD
by1kZXZlbG9wZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4g
PiA+IC0tLQo+ID4gPiB2MzoKPiA+ID4gLSBVc2UgTWFrZWZpbGUgbG9naWMgZnJvbSBNYXNhaGly
byBZYW1hZGEKPiA+ID4gLSBVc2UgIiMgSGVscDogIiBwcmVmaXgsIGJ1dCBvbmx5IG9uIGRlc2ly
ZWQgZnJhZ21lbnQgdGFyZ2V0cwo+ID4gPiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMwODI1MTk0MzI5Lmdvbm5hLjkxMS1rZWVzQGtlcm5lbC5vcmcKPiA+ID4gdjE6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgyNDIyMzYwNi5uZXZlci43NjIta2Vlc0BrZXJu
ZWwub3JnCj4gPiA+IC0tLQo+ID4gPiAgTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgLQo+ID4gPiAgYXJjaC9hcm0vY29uZmlncy9kcmFtXzB4MDAwMDAwMDAu
Y29uZmlnICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9hcm0vY29uZmlncy9kcmFtXzB4YzAwMDAwMDAu
Y29uZmlnICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9hcm0vY29uZmlncy9kcmFtXzB4ZDAwMDAwMDAu
Y29uZmlnICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9hcm0vY29uZmlncy9scGFlLmNvbmZpZyAgICAg
ICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9hcm02NC9jb25maWdzL3ZpcnQuY29uZmlnICAg
ICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9wb3dlcnBjL2NvbmZpZ3MvZGlzYWJsZS13ZXJy
b3IuY29uZmlnIHwgIDEgKwo+ID4gPiAgYXJjaC9wb3dlcnBjL2NvbmZpZ3Mvc2VjdXJpdHkuY29u
ZmlnICAgICAgIHwgIDQgKysrLQo+ID4gPiAgYXJjaC9yaXNjdi9jb25maWdzLzMyLWJpdC5jb25m
aWcgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9jb25maWdzLzY0LWJpdC5jb25m
aWcgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9zMzkwL2NvbmZpZ3MvYnRmLmNvbmZpZyAg
ICAgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC9zMzkwL2NvbmZpZ3Mva2FzYW4uY29uZmln
ICAgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgYXJjaC94ODYvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgLS0tLQo+ID4gPiAga2VybmVsL2NvbmZpZ3MvZGVidWcuY29uZmln
ICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ID4gIGtlcm5lbC9jb25maWdzL2t2bV9ndWVzdC5j
b25maWcgICAgICAgICAgICB8ICAxICsKPiA+ID4gIGtlcm5lbC9jb25maWdzL25vcG0uY29uZmln
ICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiA+ICBrZXJuZWwvY29uZmlncy9ydXN0LmNvbmZp
ZyAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiA+ICBrZXJuZWwvY29uZmlncy90aW55LmNvbmZp
ZyAgICAgICAgICAgICAgICAgfCAgMiArKwo+ID4gPiAga2VybmVsL2NvbmZpZ3MveDg2X2RlYnVn
LmNvbmZpZyAgICAgICAgICAgIHwgIDEgKwo+ID4gPiAga2VybmVsL2NvbmZpZ3MveGVuLmNvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ID4gIHNjcmlwdHMva2NvbmZpZy9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrKy0tLQo+ID4gPiAgMjEgZmlsZXMg
Y2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+Cj4gPgo+
ID4gSnVzdCBvbmUgdGhpbmcuCj4gPgo+ID4KPiA+Cj4gPgo+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9jb25maWdzL3RpbnkuY29uZmlnIGIva2VybmVsL2NvbmZpZ3MvdGlueS5jb25maWcK
PiA+ID4gaW5kZXggMDAwMDlmN2QwODM1Li42MGE0YjZkODBiMzYgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2tlcm5lbC9jb25maWdzL3RpbnkuY29uZmlnCj4gPiA+ICsrKyBiL2tlcm5lbC9jb25maWdzL3Rp
bnkuY29uZmlnCj4gPiA+IEBAIC0xLDMgKzEsNSBAQAo+ID4gPiArIyBIZWxwOiBTaXplLW9wdGlt
aXplZCBrZXJuZWwgaW1hZ2UKPiA+Cj4gPgo+ID4gSSB3aWxsIGRyb3AgdGhpcy4KPiA+Cj4gPgo+
ID4gV2UgYWxyZWFkeSBoYXZlIGEgaGFyZC1jb2RlZCBoZWxwIG1lc3NhZ2UuCj4gPgo+ID4gICB0
aW55Y29uZmlnICAgLSBDb25maWd1cmUgdGhlIHRpbmllc3QgcG9zc2libGUga2VybmVsCj4gPgo+
ID4KPiA+Cj4gPgo+ID4gVGhlbiwgc29tZSBsaW5lcyBiZWxvdywgYWdhaW4uCj4gPgo+ID4gICB0
aW55LmNvbmZpZyAgICAgICAgICAgICAgIC0gU2l6ZS1vcHRpbWl6ZWQga2VybmVsIGltYWdlCj4g
Pgo+ID4KPiA+Cj4gPiB0aW55LmNvbmZpZyBpcyBmb3IgaW50ZXJuYWwgdXNlIGZvciB0aW55Y29u
ZmlnLgo+Cj4gU2hhbGwgSSBzZW5kIGEgdjQsIG9yIGRpZCB5b3UgZml4IHRoaXMgdXAgYWxyZWFk
eT8KCgpMb2NhbGx5IGZpeGVkLXVwLgoKSWYgbm9ib2R5IHBvaW50cyBvdXQgYW55dGhpbmcgZWxz
ZSwKeW91IGRvIG5vdCBuZWVkIHRvIHNlbmQgdjQuCgoKCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNh
aGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
