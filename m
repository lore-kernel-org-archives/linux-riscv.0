Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638BDCD98E9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQEfOZYWuwCE2BdB24txbTdVOa72WufYxvliE68NXhg=; b=qUaJEwZdBzV4aL
	3Ddn8I5NfXZj+bRJuFyD74jc9YVEV4dfrdRz9h8fR1pCM+vLfUpDUTqj4N1C7wcFZvTu9n4fCJ54t
	7dgeCMJM4igk79H2M11zRdq3y5GA/Pfjy/fEv3wHFkfQCDFXb5lcxrJjhm210ewJs/uUvxoKKnV63
	zKWZpJsLpO+n+MAqql4UlEKGNTZo5yQogoAolNy4kueiAwdcJfemYW9zDZbJx5RBppA+lQdpvD0mY
	kkHAIe9cRaITo3e+zoTy0GHpJQb3LKBVnH/ZFqOSNrp/zW5HpnS4Kcrnchvb7DA6vrohO/yNZZyrY
	mfzN9wxV0IUCZLfhANsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqPp1-00Eeq6-09;
	Wed, 11 Oct 2023 03:23:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqPox-00Eepc-1c
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 03:23:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406618d0992so61607455e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696994613; x=1697599413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ7dw6mq3fAmsxi1/7yqbTp/Tliv2AY25KGUzP1YQfM=;
        b=glsTsFyw1decr3/6JWjIoNSANPVTWRM3hy3BjyoxXCFeciVRenDsaAkvj4z2yQLPWc
         LYpSCEZ12QLZ7TmwEU0WhucqlTG3OSJi1oNIl8DjhBnjXlvM9HyS7XrBb3Bbu4/qS8/k
         mTXy2VrFsLP/SPuvhcmTeI1o2MXa/ls65Za6mQxafEJLFX3tYPdEwvjpwW5AUL/gMj9f
         Aob0kOYFWRNlbqN08EMD9Pf9MTFG1Pf+QP34aMNBESUNgDCqJmnjjoRxmHRMMaDtxF/W
         ZpVoFNvwJuON1DZ0u0Efj1yKv1UOdsaoCEAKcb7e44Lcw5htxqTQUpsiE8BhsrfpD294
         vGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696994613; x=1697599413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ7dw6mq3fAmsxi1/7yqbTp/Tliv2AY25KGUzP1YQfM=;
        b=tHT+g6GpQo0ezDDtRBqW56K44O3iJE55cTYX5x4I8/m9lDJnBVebwaVAQRptMpShF3
         KWqGehpkbbEJL2j8Styz29/qrbzeKDUVeIjf5xyMYEhUh2ppYo2d1YbXcszjgosciIF8
         8dB7u56HifH9GPDakOfl56z926/iX6LRvFedlfC9WHjk1sVUISMZ+z/GYDd3HYxNLh5b
         UWtChthfqTMhA8CLjyWyZM9z96tLE6CZEi51UCg2OkBqS0sW2fxrJmf+kPvwAcMaxqa1
         8w6oAGx+fTugy1jviTilbrYwBKMKF/C8gODBIf/6gQvDociqHsvcfFFm8V2yhDA9o85E
         5FyQ==
X-Gm-Message-State: AOJu0Yyxf93FOMQcXAHmC+O8XC0k83QzcFzNv9s2IdeTDWWtu5eu4Vcv
	DB+kzP/btyqhgglt0oIVWeZl0zmzs4lyPairsdldHQ==
X-Google-Smtp-Source: AGHT+IFzXn41foFVeSb6zSWD3ItZskIbYaHjbVugoGL99KDVOKgkl7V8kEVpbVb+GvRZDDLiXvmlBx5bboSlUCb66Ts=
X-Received: by 2002:a05:600c:2202:b0:3f6:58ad:ed85 with SMTP id
 z2-20020a05600c220200b003f658aded85mr18338305wml.10.1696994613341; Tue, 10
 Oct 2023 20:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230912021349.28302-1-cuiyunhui@bytedance.com> <87jzsvd1xn.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jzsvd1xn.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 11 Oct 2023 11:23:22 +0800
Message-ID: <CAEEQ3wkBACC2SdHQZYyVoXzGhd+=wHD9Hf5gL_Yhu1dWuXAVZQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_202339_571044_BAE530C7 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

SGkgQmrDtnJuLAoKT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgODoxM+KAr1BNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20+IHdyaXRlczoKPgo+ID4gQWRkIHVzZXJsYW5kIGluc3RydWN0aW9uIGR1bXAg
YW5kIHJlbmFtZSBkdW1wX2tlcm5lbF9pbnN0cigpCj4gPiB0byBkdW1wX2luc3RyKCkuCj4gPgo+
ID4gQW4gZXhhbXBsZToKPiA+IFsgICAgMC44MjI0MzldIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBp
bWFnZSAoaW5pdG1lbSkgbWVtb3J5OiA2OTE2Swo+ID4gWyAgICAwLjgyMzgxN10gUnVuIC9pbml0
IGFzIGluaXQgcHJvY2Vzcwo+ID4gWyAgICAwLjgzOTQxMV0gaW5pdFsxXTogdW5oYW5kbGVkIHNp
Z25hbCA0IGNvZGUgMHgxIGF0IDB4MDAwMDAwMDAwMDA1YmUxOCBpbiBiYlsxMDAwMCs1ZmIwMDBd
Cj4gPiBbICAgIDAuODQwNzUxXSBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQg
NS4xNC4wLXJjNC0wMDA0OS1nYmQ2NDQyOTBhYTcyLWRpcnR5ICMxODcKPiA+IFsgICAgMC44NDEz
NzNdIEhhcmR3YXJlIG5hbWU6ICAsIEJJT1MKPiA+IFsgICAgMC44NDE3NDNdIGVwYyA6IDAwMDAw
MDAwMDAwNWJlMTggcmEgOiAwMDAwMDAwMDAwMDc5ZTc0IHNwIDogMDAwMDAwM2ZmZmNhZmRhMAo+
ID4gWyAgICAwLjg0MjI3MV0gIGdwIDogZmZmZmZmZmY4MTZlOWRjOCB0cCA6IDAwMDAwMDAwMDAw
MDAwMDAgdDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQyOTQ3XSAgdDEgOiAwMDAw
MDAzZmZmYzlmZGYwIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6IDAwMDAwMDAwMDAwMDAwMDAK
PiA+IFsgICAgMC44NDM0MzRdICBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiAwMDAwMDAzZmZm
Y2EwMTkwIGExIDogMDAwMDAwM2ZmZmNhZmUxOAo+ID4gWyAgICAwLjg0Mzg5MV0gIGEyIDogMDAw
MDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiAwMDAwMDAwMDAwMDAwMDAw
Cj4gPiBbICAgIDAuODQ0MzU3XSAgYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAw
MDAwMDAwMCBhNyA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDQ4MDNdICBzMiA6IDAw
MDAwMDAwMDAwMDAwMDAgczMgOiAwMDAwMDAwMDAwMDAwMDAwIHM0IDogMDAwMDAwMDAwMDAwMDAw
MAo+ID4gWyAgICAwLjg0NTI1M10gIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAw
MDAwMDAwMDAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQ1NzIyXSAgczggOiAw
MDAwMDAwMDAwMDAwMDAwIHM5IDogMDAwMDAwMDAwMDAwMDAwMCBzMTA6IDAwMDAwMDAwMDAwMDAw
MDAKPiA+IFsgICAgMC44NDYxODBdICBzMTE6IDAwMDAwMDAwMDBkMTQ0ZTAgdDMgOiAwMDAwMDAw
MDAwMDAwMDAwIHQ0IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0NjYxNl0gIHQ1IDog
MDAwMDAwMDAwMDAwMDAwMCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDcyMDRd
IHN0YXR1czogMDAwMDAwMDIwMDAwMDAyMCBiYWRhZGRyOiAwMDAwMDAwMGYwMDI4MDUzIGNhdXNl
OiAwMDAwMDAwMDAwMDAwMDAyCj4gPiBbICAgIDAuODQ4MjE5XSBDb2RlOiBmMDZmIGZmNWYgMzgy
MyBmYTExIDAxMTMgZmIwMSAyZTIzIDAyMDEgMDI5MyAwMDAwICg4MDUzKSBmMDAyCj4gPiBbICAg
IDAuODUxMDE2XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwg
aW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwNAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCkNvdWxkIHUgaGVscCB0byBtZXJnZSB0aGlzIHBhdGNo
IGludG8gbGludXgtbmV4dD8gT3IgY2FuIGFueW9uZSBoZWxwCnRvIG1lcmdlIGl0PwoKVGhhbmtz
77yMCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
