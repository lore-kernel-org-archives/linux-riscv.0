Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747ADC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URPLgmNr6e/FDaJElhjwCl3AI/ISR4BeQv9PdnEdVkM=; b=tWdlzA/Vpm4rNO
	j4VN4iNRxyE6TAIjaXYSpVOgqu9fteUTUjsnsMRv4HYiCh43qgaU5j4UEt+0NZTdqidUOpLkfyC6i
	eZ2IQfDEQxNNTEUj5ZEi+jo1MdsmHi2rKJolmuQjW2b2D85YlHnIoIIS72HLumpomeYTX050oJP92
	QrSvuNIYAME/sLlS1DGPqwyFEdpKI5JhMfimDUAU7ZmnZnWTTt4RpJzEusi76/cu3lfxvqQdPktET
	g81Nrw47MBDMhWxxS13hnBmQGH1GPCyoQAIEYFwH1UtlstSk8I34KCDV6Tba3gNjP9vjpf35Jk07u
	DFoND4T4eK5Q1Syn4avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEUp-007q6E-2g;
	Wed, 01 Nov 2023 16:55:11 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEUk-007q4a-0A
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 16:55:09 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6ce2cc39d12so4346590a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698857701; x=1699462501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwUrtJF5cSmaSOwk46tcXUzBT42i9cnlTuP0Y/SquhQ=;
        b=ZTb/HBgRTo/97dbomsD+A5pSDNgM2azQDilLkvZbPVdcwpk2wV7aEw5cYzqRSkiPKq
         2Bv4O/6JYyeqWJAgE+xE+CBK8Uk9iukQzMc0j4nLrnu0daZbODM8O/WXzsdezg10HrBt
         nMBQTKzXZN6wLoufzni1zxWC8uHDqIt4achW71X5CRb2f3HHSo8t8Npl8VvpYnW9ItL5
         1xivZZBzNqtXxNXuDp0/z3qC3Pd4wKBfzqkdiYRCUqX41s+8OtRpZThEwW6eE1udaL/M
         gtQIDBHD7Sp1dz1fhY6vLMMlofqoNAVZmYDqh1pYugH1jfoXWL6PUvql+laFkd3ODWYB
         infw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698857701; x=1699462501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwUrtJF5cSmaSOwk46tcXUzBT42i9cnlTuP0Y/SquhQ=;
        b=HX+y+OFY0GCl/6KU1zoT/P0Nzv0uc9k/pb6kmuLK6itvPC4/vGSQAW472EssXCB0u8
         V9EnAZdF2MhxQKTHxuCxVh02O7Lm6qFzcddWq+NP8UIotDMqho0ra40IyFkFUVqUIAMc
         2v1qxWtr4C25atJJkxlmW9tHm/MR8bylkoS15rKCp0eiiP5rce9Zwf5tJSUKRmb1oHO2
         ZOUiuT09sVl6Aj83VlQ0qLXLM1/lnx/zVbrlqkqBMZQf0XkVX6274+1Ci61d17yWTdD8
         liirmhqMG/e/P6OtBUNrkcIfjKMo9YRxdnHxzW/rbRHM/CoycpeSfWF31N8jLXuZKevu
         8KwQ==
X-Gm-Message-State: AOJu0YzvdP1M+E6ItWj+/zS1Jc5+EKz5Gx+IsFVYGPEYpUnz2AeoPwYD
	1uzH/q+PaWT//WdWUYGcgxjoaZvqlVG4fZCRDuo=
X-Google-Smtp-Source: AGHT+IGzIOOf5ZiXWYX06EYatfjv+c51rMmsFsnzhtgelnRLy2iIgVtHs5uhL5C9EoNmX/zPv7+Bc99ty25L52+enwA=
X-Received: by 2002:a05:6830:410b:b0:6b9:bd9d:e333 with SMTP id
 w11-20020a056830410b00b006b9bd9de333mr17880966ott.3.1698857700794; Wed, 01
 Nov 2023 09:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231028155101.1039049-1-hch@lst.de>
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Nov 2023 16:54:31 +0000
Message-ID: <CA+V-a8sEO38o2OKcW7nryD=dnPowF9s3Ov0R2rKJecZ4ZVEYQg@mail.gmail.com>
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
To: Christoph Hellwig <hch@lst.de>
Cc: geert+renesas@glider.be, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, soc@kernel.org, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_095506_089771_D772C566 
X-CRM114-Status: GOOD (  23.62  )
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

T24gU2F0LCBPY3QgMjgsIDIwMjMgYXQgNDo1NeKAr1BNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IFRoZSBjYWNoZSBvcHMgYXJlIGFsc28gdXNlZCBieSB0aGUgcG1l
bSBjb2RlIHdoaWNoIGlzIHVuY29uZGl0aW9uYWxseQo+IGJ1aWx0IGludG8gdGhlIGtlcm5lbC4g
IE1vdmUgdGhlbSBpbnRvIGEgc2VwYXJhdGUgZmlsZSB0aGF0IGlzIGJ1aWx0Cj4gYmFzZWQgb24g
dGhlIGNvcnJlY3QgY29uZmlnIG9wdGlvbi4KPgo+IEZpeGVzOiBmZDk2Mjc4MTI3MGUgKCJyaXNj
djogUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTIHNob3VsZG4ndCBkZXBlbmQgb24gUklTQ1Zf
RE1BX05PTkNPSEVSRU5UIikKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vTWFrZWZpbGUgICAgICAgICAgfCAgMSArCj4gIGFyY2gv
cmlzY3YvbW0vY2FjaGUtb3BzLmMgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+ICBhcmNo
L3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jIHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L21tL2NhY2hlLW9wcy5jCj4KClJldmlld2VkLWJ5OiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+ClRlc3Rl
ZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPiAjCk9uIFJaL0ZpdmUgU01BUkMKCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IGluZGV4
IDljNDU0ZjkwZmQzZGEyLi4zYTRkZmM4YmFiY2Y4YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IEBAIC0zNiwzICsz
Niw0IEBAIGVuZGlmCj4KPiAgb2JqLSQoQ09ORklHX0RFQlVHX1ZJUlRVQUwpICs9IHBoeXNhZGRy
Lm8KPiAgb2JqLSQoQ09ORklHX1JJU0NWX0RNQV9OT05DT0hFUkVOVCkgKz0gZG1hLW5vbmNvaGVy
ZW50Lm8KPiArb2JqLSQoQ09ORklHX1JJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUykgKz0gY2Fj
aGUtb3BzLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZS1vcHMuYyBiL2FyY2gv
cmlzY3YvbW0vY2FjaGUtb3BzLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMDAwLi5hOTkzYWQxMWQwZWNhOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jp
c2N2L21tL2NhY2hlLW9wcy5jCj4gQEAgLTAsMCArMSwxNyBAQAo+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMSBX
ZXN0ZXJuIERpZ2l0YWwgQ29ycG9yYXRpb24gb3IgaXRzIGFmZmlsaWF0ZXMuCj4gKyAqLwo+ICsK
PiArI2luY2x1ZGUgPGFzbS9kbWEtbm9uY29oZXJlbnQuaD4KPiArCj4gK3N0cnVjdCByaXNjdl9u
b25zdGRfY2FjaGVfb3BzIG5vbmNvaGVyZW50X2NhY2hlX29wcyBfX3JvX2FmdGVyX2luaXQ7Cj4g
Kwo+ICt2b2lkCj4gK3Jpc2N2X25vbmNvaGVyZW50X3JlZ2lzdGVyX2NhY2hlX29wcyhjb25zdCBz
dHJ1Y3QgcmlzY3Zfbm9uc3RkX2NhY2hlX29wcyAqb3BzKQo+ICt7Cj4gKyAgICAgICBpZiAoIW9w
cykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgbm9uY29oZXJlbnRfY2FjaGVf
b3BzID0gKm9wczsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9ub25jb2hlcmVudF9y
ZWdpc3Rlcl9jYWNoZV9vcHMpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25j
b2hlcmVudC5jIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+IGluZGV4IGI3NmU3
ZTE5MmViMTgzLi4zNDFiZDY3MDZiNGM1NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2Rt
YS1ub25jb2hlcmVudC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+
IEBAIC0xNSwxMiArMTUsNiBAQCBzdGF0aWMgYm9vbCBub25jb2hlcmVudF9zdXBwb3J0ZWQgX19y
b19hZnRlcl9pbml0Owo+ICBpbnQgZG1hX2NhY2hlX2FsaWdubWVudCBfX3JvX2FmdGVyX2luaXQg
PSBBUkNIX0RNQV9NSU5BTElHTjsKPiAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2NhY2hlX2FsaWdu
bWVudCk7Cj4KPiAtc3RydWN0IHJpc2N2X25vbnN0ZF9jYWNoZV9vcHMgbm9uY29oZXJlbnRfY2Fj
aGVfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiAtICAgICAgIC53YmFjayA9IE5VTEwsCj4gLSAg
ICAgICAuaW52ID0gTlVMTCwKPiAtICAgICAgIC53YmFja19pbnYgPSBOVUxMLAo+IC19Owo+IC0K
PiAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZG1hX2NhY2hlX3diYWNrKHBoeXNfYWRkcl90IHBh
ZGRyLCBzaXplX3Qgc2l6ZSkKPiAgewo+ICAgICAgICAgdm9pZCAqdmFkZHIgPSBwaHlzX3RvX3Zp
cnQocGFkZHIpOwo+IEBAIC0xNjIsMTIgKzE1NiwzIEBAIHZvaWQgX19pbml0IHJpc2N2X3NldF9k
bWFfY2FjaGVfYWxpZ25tZW50KHZvaWQpCj4gICAgICAgICBpZiAoIW5vbmNvaGVyZW50X3N1cHBv
cnRlZCkKPiAgICAgICAgICAgICAgICAgZG1hX2NhY2hlX2FsaWdubWVudCA9IDE7Cj4gIH0KPiAt
Cj4gLXZvaWQgcmlzY3Zfbm9uY29oZXJlbnRfcmVnaXN0ZXJfY2FjaGVfb3BzKGNvbnN0IHN0cnVj
dCByaXNjdl9ub25zdGRfY2FjaGVfb3BzICpvcHMpCj4gLXsKPiAtICAgICAgIGlmICghb3BzKQo+
IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gLQo+IC0gICAgICAgbm9uY29oZXJlbnRfY2FjaGVf
b3BzID0gKm9wczsKPiAtfQo+IC1FWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9ub25jb2hlcmVudF9y
ZWdpc3Rlcl9jYWNoZV9vcHMpOwo+IC0tCj4gMi4zOS4yCj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
