Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70542C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 00:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NPsjyhao3qHfKAaQKrNa1P8u1ES421a0lkU2sj48U8=; b=p28FruKQK3hkin
	q5PlAx1BfPhWglnGWVtsCXRMdbg7ewwRB1K6ZYqyl662BNc8G9tD4XdErpyGEvaoh9JVkEWhkJ1CR
	IvdiXd3zv40kfeiHhta1s4FQDofqUVwzm8uRPf3ZRVEJ8m8MZY+1yD6UQBYRQ6LpsaO34b7n8tt7+
	hAcO0gf3PZLm8IiY4v4scWNMpHE6GTlmHxFVtnS4Q254Xo4Li75lYQQqEjLPl9hm1PdfHSK5oUlhY
	cwo7xK0dDE589PanDn7OU+RZ6efTBLsosqyo7ydiCUG/KrDt1hfb8aEI5iQ7qNWfaGm9Vj/sVLqQp
	99jaCIFWoDFd7KwC7VzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJk69-001Yww-03;
	Thu, 13 Jul 2023 00:22:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJk65-001Yw0-35
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 00:22:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21CB0619E1
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 00:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AC1C43397
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 00:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207732;
	bh=53e5HYBjtna0vDGuXWnqkXj1xC6mo6JvkjpwJaby3Ao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qVtb5lFIAud8qNq//k/g5bY28hfo+MfngHXRED/Uw7htCmSN2GeEqB7AB9Ky38mxi
	 A1RY0EMXCmZW8WAlTF+RSIoqDjs+aLSD94tOUbwSPLk1oVBVNhe13lwhfQuZ3YaFCi
	 ZLRHqU+3xugCXNCmg2GC/AwP8B/j9QDFcPmpDXcv5cA6evgy796VKwr9P9qGrUOect
	 xxIMxIdKvGF25iW0yOzfOU7KRDrRUOLQHLQkNHz9icxFvlvr/Gbwo1ymWR1/793WCu
	 Tu2FObP6Aan0biDDoYty6FK/f8WjsQxCXBt1kXDTfpoj3Q1M/SgJXvoCcl0MXrpdpj
	 LuHIbAHNb80eg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb41682472so217393e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 17:22:11 -0700 (PDT)
X-Gm-Message-State: ABy/qLaA0/r3ULED7x8SFq7Bs9YgbowY/9FVq1NjdcqX3h3eRndnMiYR
	sT8ho6WlkyKgQtllojLT4a86Pb8uTwkfilo9n8Q=
X-Google-Smtp-Source: APBJJlGB+/ycMH8jAxFyzWVEpdJwmx4SCYYeZsQvOAEUuyfzZoM/VwHrjCsO+dmLZaIEHnImNesMHW8I6SxbrUlMhh8=
X-Received: by 2002:a19:7b11:0:b0:4f8:6600:4074 with SMTP id
 w17-20020a197b11000000b004f866004074mr18043887lfc.17.1689207729930; Wed, 12
 Jul 2023 17:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230628131442.3022772-1-sameo@rivosinc.com> <20230628131442.3022772-4-sameo@rivosinc.com>
In-Reply-To: <20230628131442.3022772-4-sameo@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 12 Jul 2023 20:21:58 -0400
X-Gmail-Original-Message-ID: <CAJF2gTTc3O+RYmwtfLe0M1D58LH8fXGWMrJLYxjx17aHakAZUQ@mail.gmail.com>
Message-ID: <CAJF2gTTc3O+RYmwtfLe0M1D58LH8fXGWMrJLYxjx17aHakAZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Implement archrandom when Zkr is available
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux@rivosinc.com, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, "Hongren (Zenithal) Zheng" <i@zenithal.me>, 
	Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_172218_078141_EA69755D 
X-CRM114-Status: GOOD (  26.03  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgOToxNeKAr0FNIFNhbXVlbCBPcnRpeiA8c2FtZW9Acml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBaa3IgZXh0ZW5zaW9uIGlzIHJhdGlmaWVkIGFuZCBw
cm92aWRlcyAxNiBiaXRzIG9mIGVudHJvcHkgc2VlZCB3aGVuCj4gcmVhZGluZyB0aGUgU0VFRCBD
U1IuCj4KPiBXZSBjYW4gaW1wbGVtZW50IGFyY2hfZ2V0X3JhbmRvbV9zZWVkX2xvbmdzKCkgYnkg
ZG9pbmcgbXVsdGlwbGUgY3NycncgdG8KPiB0aGF0IENTUiBhbmQgZmlsbGluZyBhbiB1bnNpZ25l
ZCBsb25nIHdpdGggdmFsaWQgZW50cm9weSBiaXRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IE9ydGl6IDxzYW1lb0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYXJjaHJhbmRvbS5oIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgfCAgOSArKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNzkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hcmNocmFuZG9tLmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2FyY2hyYW5kb20uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5o
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjg5ODdjZDBiODkx
ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5k
b20uaAo+IEBAIC0wLDAgKzEsNzAgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgKi8KPiArLyoKPiArICogS2VybmVsIGludGVyZmFjZSBmb3IgdGhlIFJJU0NWIGFyY2hf
cmFuZG9tXyogZnVuY3Rpb25zCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMyBieSBSaXZv
cyBJbmMuCj4gKyAqCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBBU01fUklTQ1ZfQVJDSFJBTkRPTV9I
Cj4gKyNkZWZpbmUgQVNNX1JJU0NWX0FSQ0hSQU5ET01fSAo+ICsKPiArI2luY2x1ZGUgPGFzbS9j
c3IuaD4KPiArCj4gKyNkZWZpbmUgU0VFRF9SRVRSWV9MT09QUyAxMAo+ICsKPiArc3RhdGljIGlu
bGluZSBib29sIF9fbXVzdF9jaGVjayBjc3Jfc2VlZF9sb25nKHVuc2lnbmVkIGxvbmcgKnYpCj4g
K3sKPiArICAgICAgIHVuc2lnbmVkIGludCByZXRyeSA9IFNFRURfUkVUUllfTE9PUFMsIHZhbGlk
X3NlZWRzID0gMDsKPiArICAgICAgIGNvbnN0IGludCBuZWVkZWRfc2VlZHMgPSBzaXplb2YobG9u
ZykgLyBzaXplb2YodTE2KTsKPiArICAgICAgIHUxNiAqZW50cm9weSA9ICh1MTYgKil2Owo+ICsK
PiArICAgICAgIGRvIHsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICog
VGhlIFNFRUQgQ1NSICgweDAxNSkgbXVzdCBiZSBhY2Nlc3NlZCB3aXRoIGEgcmVhZC13cml0ZQo+
ICsgICAgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbi4KPiArICAgICAgICAgICAgICAgICovCj4g
KyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3NyX3NlZWQgPSBjc3Jfc3dhcChDU1JfU0VF
RCwgMCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBzd2l0Y2ggKGNzcl9zZWVkICYgU0VFRF9PUFNU
X01BU0spIHsKPiArICAgICAgICAgICAgICAgY2FzZSBTRUVEX09QU1RfRVMxNjoKPiArICAgICAg
ICAgICAgICAgICAgICAgICBlbnRyb3B5W3ZhbGlkX3NlZWRzKytdID0gY3NyX3NlZWQgJiBTRUVE
X0VOVFJPUFlfTUFTSzsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodmFsaWRfc2VlZHMg
PT0gbmVlZGVkX3NlZWRzKQptYXhfbG9uZ3MgPSAxPyBuZWVkZWRfc2VlZHMgb25seSBjb3VsZCBi
ZSAyLzQuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgICAgICAgICBjYXNl
IFNFRURfT1BTVF9ERUFEOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2Vycl9vbmNlKCJh
cmNocmFuZG9tOiBVbnJlY292ZXJhYmxlIGVycm9yXG4iKTsKRG8gd2UgbmVlZCB0aGlzIHByX2Vy
cj8gQ291bGQgd2UgdHJlYXQgaXQgYXMgYSByZXR1cm4gZmFsc2U/IFllcywgaXQncwphIGhhcmR3
YXJlIHByb2JsZW0sIGJ1dCBub3Qgc2VyaW91cy4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgICAgICAgICAgY2FzZSBTRUVEX09QU1RfQklTVDoK
PiArICAgICAgICAgICAgICAgY2FzZSBTRUVEX09QU1RfV0FJVDoKPiArICAgICAgICAgICAgICAg
ZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgfSB3aGlsZSAoLS1yZXRyeSk7Cj4gKwo+ICsgICAgICAgcmV0dXJu
IGZhbHNlOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHNpemVfdCBfX211c3RfY2hlY2sgYXJj
aF9nZXRfcmFuZG9tX2xvbmdzKHVuc2lnbmVkIGxvbmcgKnYsIHNpemVfdCBtYXhfbG9uZ3MpCj4g
K3sKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHNpemVfdCBf
X211c3RfY2hlY2sgYXJjaF9nZXRfcmFuZG9tX3NlZWRfbG9uZ3ModW5zaWduZWQgbG9uZyAqdiwg
c2l6ZV90IG1heF9sb25ncykKPiArewo+ICsgICAgICAgaWYgKCFtYXhfbG9uZ3MgKQppZiAobWF4
X2xvbmdzID09IDEpID8KPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAg
LyoKPiArICAgICAgICAqIElmIFprciBpcyBzdXBwb3J0ZWQgYW5kIGNzcl9zZWVkX2xvbmcgc3Vj
Y2VlZHMsIHdlIHJldHVybiBvbmUgbG9uZwo+ICsgICAgICAgICogd29ydGggb2YgZW50cm9weS4K
PiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJ
U0NWX0lTQV9FWFRfWktSKSAmJiBjc3Jfc2VlZF9sb25nKHYpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMTsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArI2VuZGlmIC8qIEFT
TV9SSVNDVl9BUkNIUkFORE9NX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCBiOThiM2I2
YzlkYTIuLjdkMGNhOTA4MmM2NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0zODksNiAr
Mzg5LDE1IEBACj4gICNkZWZpbmUgQ1NSX1ZUWVBFICAgICAgICAgICAgICAweGMyMQo+ICAjZGVm
aW5lIENTUl9WTEVOQiAgICAgICAgICAgICAgMHhjMjIKPgo+ICsvKiBTY2FsYXIgQ3J5cHRvIEV4
dGVuc2lvbiAtIEVudHJvcHkgKi8KPiArI2RlZmluZSBDU1JfU0VFRCAgICAgICAgICAgICAgIDB4
MDE1Cj4gKyNkZWZpbmUgU0VFRF9PUFNUX01BU0sgICAgICAgICBfQUMoMHhDMDAwMDAwMCwgVUwp
Cj4gKyNkZWZpbmUgU0VFRF9PUFNUX0JJU1QgICAgICAgICBfQUMoMHgwMDAwMDAwMCwgVUwpCj4g
KyNkZWZpbmUgU0VFRF9PUFNUX1dBSVQgICAgICAgICBfQUMoMHg0MDAwMDAwMCwgVUwpCj4gKyNk
ZWZpbmUgU0VFRF9PUFNUX0VTMTYgICAgICAgICBfQUMoMHg4MDAwMDAwMCwgVUwpCj4gKyNkZWZp
bmUgU0VFRF9PUFNUX0RFQUQgICAgICAgICBfQUMoMHhDMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUg
U0VFRF9FTlRST1BZX01BU0sgICAgICBfQUMoMHhGRkZGLCBVTCkKPiArCj4gICNpZmRlZiBDT05G
SUdfUklTQ1ZfTV9NT0RFCj4gICMgZGVmaW5lIENTUl9TVEFUVVMgICAgQ1NSX01TVEFUVVMKPiAg
IyBkZWZpbmUgQ1NSX0lFICAgICAgICAgICAgICAgIENTUl9NSUUKPiAtLQo+IDIuNDEuMAo+CgpS
ZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
