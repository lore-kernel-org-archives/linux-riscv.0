Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A86EC2D0CD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 May 2025 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qM0VKusauqhbAWjo0GU683bDpiLTBiAtmcSUSkeiVw=; b=MPBNWWvTtjPONY
	Zb2fYCukpqicvAIG+QdxDCGKycpCHhLzX1zoQJowXCJNXCR3lb9IcgCfu97QvQ1U5kLfzeNR8yXV/
	3rcPDCOJT1D8Odf8TcXToII8LHdv4Z04pGjVMKgsAQvmc72cDpHl3iV7VB7Xdsx6UJ8O83DzmurKu
	ArkSEcfQD4E5peQbwcyum/BoK7doMHwMEb588viVkdmurU/KVUNdvIvSpZm6bCUHJuGpxugnJTXnE
	sjsv2tJ2nfKieqd6Qt4WUlVkAAF5LDbNFu89XtVnHPwjvcZgoMFpaC8b8jJqMR3hBC2neOWR6mCw0
	H3xaX0eoMx1/q15qcoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLvO-000000065dT-2kRC;
	Sat, 17 May 2025 18:06:18 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLvM-000000065cO-1BE1
	for linux-riscv@lists.infradead.org;
	Sat, 17 May 2025 18:06:17 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so2132956137.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 May 2025 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747505174; x=1748109974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=hdTNEOQFc6bf9DiIf64346lmutwD45suA54NIQ8ntS3g9ocaWkUoxy/8jD3hnlSezM
         zFtTqpAJWGDVfW4UBJPDSz+/tN8KQc6k71kSQHwnAT2FzglStDsAfxTo2cy3bjT08u61
         HEZ9lVNOvW10EGWQURhjzwQA164jwVHvvBh1KptQq8lOrWLY1cAyb1K8jM2e13SVLUJS
         xjLRIJkudTom7HYcCiXdmBquwFj6MhHTtdZwLFRijMhPqJ1uzmGITl/3ICG868paw9ns
         9cX3wiuCfp/K+M3LdvbcaBHu9eR60bar8a4hBOt4sO8sKRaj63PSl1TX0OsL+qsNh9L9
         dkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747505174; x=1748109974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=haOrkjHfO7O8I5NSFCf7jwwYEzqARP8ikXeSao9MkuqzhmCHzvLU61TO05YlGI0tA4
         ibVE1m4f1+HtjU9O8JjIrXELcav/ibE+Qxn5RdPoA+422hozz1l1PbEbUAA+OXUVbUQU
         KIw/swmXbunpGBFvbrMDp+mtZlJzZFB1Gu3Z11IGQYP1rXpxEidD3nE/+xTPLBdMNpj7
         t0MSsYLiuvQElpL09W+KVCnryIvLFTexXuHSvF4SM4IB/b9tgURODrWy7dGPAfYb/9Ay
         cdROq4SU716MUySZTYnJ0mflIMm09SlLJRsL7ZefaBtEF13ONmGHDEgQNwjg4PrftUWT
         CwGw==
X-Forwarded-Encrypted: i=1; AJvYcCXNZZqj7NKcrAJETN/dxRkOyYc/GcpfYKr18hs56CuT61kVFtbZUzw/0wWzoBtfgk2ZOLFckZtKm8v2gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjx2SH9VXFkLQOZUP0mPhr1EIiXgdCTrL7jzYsL01c6O9qI2c
	NvHWc7chRFxta5GUpjMvTZD1iR1rBNYdNkxW30S3fxTxoKR6U49jZoBQNCp9W1jE0AEs6mgFCoE
	NHwCyZTA03ZOeRFnC6TTjnSJF3kfLWc4=
X-Gm-Gg: ASbGnctT7bZAseqKD+xAWd16EjotOZuNj8PFo5EsTcEQ/ymGQTXoTTadcg7A+YgEkBS
	0sk5q9rR4Vb6xi3mOiPG5JaRedt3UQt4L9tzV31neMwEKmXcos2q64hfkMrrshcP2ykMeFuuM+d
	0NksZuCJUkR2FhLofYvw2qc9nJfiRu6bfLGoAg1x6LEpy5
X-Google-Smtp-Source: AGHT+IH66PFdaZi5J8HDbVArPmOY4TBk+24AltynhiohhEtefKF4b5APmjMEeCNcvpc2ZeWTrAZPNwbAZPkXZvyAPfQ=
X-Received: by 2002:a05:6102:3e95:b0:4df:8f03:13dd with SMTP id
 ada2fe7eead31-4dfa6ae735fmr7820730137.5.1747505173766; Sat, 17 May 2025
 11:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
 <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sun, 18 May 2025 02:06:02 +0800
X-Gm-Features: AX0GCFtHMGcnarhky-ATNItjF_XCNfJdq0UotRwJwXxNaOVTLJwz1YvpazgWyKs
Message-ID: <CAAT7Ki9X0KOuuZnVjT2=uexD67rfyL4Gq18ZDgr15CeaoNOmpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X
 board device tree
To: Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_110616_341353_F9E4643C 
X-CRM114-Status: GOOD (  19.22  )
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

QWRkZWQgZXRoZXJuZXQgc3VwcG9ydCBiYXNlZCBvbiBbNF0uCgpbNF06IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI1MDUwNjA5MzI1Ni4xMTA3NzcwLTUtaW5vY2hpYW1hQGdtYWlsLmNv
bS8KCk9uIFNhdCwgTWF5IDE3LCAyMDI1IGF0IDExOjIy4oCvQU0gQ2hlbiBXYW5nIDx1bmljb3Ju
X3dhbmdAb3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gSGksIEhhbiwKPgo+IE9uIDIwMjUvNS8xNCAy
MjowOSwgSGFuIEdhbyB3cm90ZToKPiA+IFNvcGhnbyBTRzIwNDJfRVZCX1YxLlggWzFdIGlzIGEg
cHJvdG90eXBlIGRldmVsb3BtZW50IGJvYXJkIGJhc2VkIG9uIFNHMjA0Mgo+ID4KPiA+IEN1cnJl
bnRseSBzdXBwb3J0cyBzZXJpYWwgcG9ydCwgc2RjYXJkL2VtbWMsIHB3bSwgZmFuIHNwZWVkIGNv
bnRyb2wuCj4gPgo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9zb3BoZ28taGFy
ZHdhcmUvdHJlZS9tYXN0ZXIvU0cyMDQyL1NHMjA0Mi14OC1FVkIgWzFdCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwo+ID4gICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYxLmR0cyB8IDI0NyArKysrKysr
KysrKysrKysrKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2VydGlvbnMoKykKPiA+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1l
dmItdjEuZHRzCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdv
L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUKPiA+IGluZGV4
IDQ3ZDQyNDNhOGYzNS4uMjQ3MGUzMGFlOTAxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL01ha2VmaWxlCj4gPiBAQCAtMywzICszLDQgQEAgZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdP
KSArPSBjdjE4MDBiLW1pbGt2LWR1by5kdGIKPiA+ICAgZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdP
KSArPSBjdjE4MTJoLWh1YXNoYW4tcGkuZHRiCj4gPiAgIGR0Yi0kKENPTkZJR19BUkNIX1NPUEhH
TykgKz0gc2cyMDAyLWxpY2hlZXJ2LW5hbm8tYi5kdGIKPiA+ICAgZHRiLSQoQ09ORklHX0FSQ0hf
U09QSEdPKSArPSBzZzIwNDItbWlsa3YtcGlvbmVlci5kdGIKPiA+ICtkdGItJChDT05GSUdfQVJD
SF9TT1BIR08pICs9IHNnMjA0Mi1ldmItdjEuZHRiCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWV2Yi12MS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NvcGhnby9zZzIwNDItZXZiLXYxLmR0cwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNGYzOWEyNTc1YjhlCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYxLmR0cwo+Cj4gUGxlYXNl
IHJ1biAibWFrZSBDSEVDS19EVEJTPXkgVz0xIHlvdXJfZHRiX2ZpbGUiIGJlZm9yZSBzdWJtaXR0
aW5nCj4gcGF0Y2guIEkgaGF2ZSBhIHF1aWNrIGNoZWNrIGFuZCBnZXQgZm9sbG93aW5nIHdhcm5p
bmdzL2Vycm9yczoKPgo+IEVycm9yOiAuLi4uLi4vYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLWV2Yi12MS5kdHM6NjcuMS03IExhYmVsCj4gb3IgcGF0aCBnbWFjMCBub3QgZm91bmQK
PiBFcnJvcjogLi4uLi4uL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1ldmItdjEu
ZHRzOjg2LjE0LTE1Cj4gc3ludGF4IGVycm9yCj4gRkFUQUwgRVJST1I6IFVuYWJsZSB0byBwYXJz
ZSBpbnB1dCB0cmVlCj4KPiBBbmQgdGhlIHNpbWlsYXIgaXNzdWVzIGV4aXN0aW5nIGZvciBzZzIw
NDItZXZiLXYyLmR0cy4KPgo+IFsuLi4uLi5dCj4KPiA+ICsmZ21hYzAgewo+ID4gKyAgICAgcGh5
LWhhbmRsZSA9IDwmcGh5MD47Cj4gPiArICAgICBwaHktbW9kZSA9ICJyZ21paS1pZCI7Cj4gPiAr
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArCj4gPiArICAgICBtZGlvIHsKPiA+ICsgICAgICAg
ICAgICAgcGh5MDogcGh5QDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmcG9y
dDBhIDI3IEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVzZXQt
YXNzZXJ0LXVzID0gPDEwMDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVzZXQtZGVh
c3NlcnQtdXMgPSA8MTAwMDAwPjsKPiA+ICsgICAgICAgICAgICAgfTsKPiA+ICsgICAgIH07Cj4g
PiArfTsKPgo+IFRoaXMgc2hvdWxkIGJlIGRyb3BwZWQsIHdlIGNhbiBhZGQgdGhpcyBhZnRlciBl
dGhlcm5ldCBzdXBwb3J0IGlzCj4gdXBzdHJlYW1lZC4KPgo+IFRoZSBzYW1lIGZvciBldmJfdjIu
Cj4KPiBbLi4uLi4uXQo+Cj4gVGhhbmtzLgo+Cj4gQ2hlbgo+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
