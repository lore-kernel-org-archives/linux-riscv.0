Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6218EC761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPRM01te2oMfg3pItCEL7kNeyRBZJxHhwDV8cbKZuv0=; b=dKtJUnl6JmIjgD
	qfWAX1Q2GNGNbmnt09NHeOxNpGsCcUO+6o1hW6kGU6mkcCxK37U/7FWq1+QH/Vy5puvWJ0blIWHjV
	oX+JvpfVGXla1YueBshjNrYZZ1SZ801jUwWCUeJ6s+N0F0AJAdTtNi6gT5+zWpQqLF2lMU7X1oR/+
	skMxRiiGU98uZr+qkw8pAzuRJDJz7jtK8k8l0EuP3+EBq7cnphWkcCQbFGfGETjLGfPuoorEXoqO4
	e9ljeI/vVpaibdMGLGhNWT7pMSk2S2sN+FHlMo1dhqZMqZCGThOgKJDvUEA3z1zH6u9I3z1+Fk3wS
	4j8qNNjjKlbkBKdr+nIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piK1r-008Z53-2R;
	Fri, 31 Mar 2023 19:03:15 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piK1l-008Z21-0E
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 19:03:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id x17so30222308lfu.5
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680289384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Op2hvo1QpmD4q1fBgDvpflzYt4ille90lJOYkm9McQ=;
        b=I9MBLXscoVftIVV9CjCEAHOLc8es0K+E7ZAIKRZSAuC79s8JCWAbcfd1/wUUY2D1HQ
         qqYcbYBp9j38efRMctWg4KhDrinDHH5RMfqVpMBTCL4Pk5KAEY8YYLgbdBmp5lNBd4WX
         WBc1Yn7iuEmqLxYw2OFLb+mQtYK5mlHl0JUwNLCzNVz+0GIhP2VGQ8Kctjbx/6443Naz
         LZCatuF8uyuce31qb7oKNBD0H88jyGp68xeFcevSTSVJbS9mpFdEBMKyuWIBKJiEr2z3
         maWg/ujFK92UZ5pkT8/UrO2C4mPvcUCyo0eGZRpGS2QfuAbUsDWyZRFIM1W4el2h38OR
         Ai8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680289384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Op2hvo1QpmD4q1fBgDvpflzYt4ille90lJOYkm9McQ=;
        b=RID77A4mWsFoqjVCfhhPhWzvfD5yw0H+r754+FEQph50L5PAUOdV7EVdovUxUSr+ZL
         haNmYXbXmAwG9u/aHspVLUQiPwzfzPpGEFToTKAnRbJLa6h1X3OCPT11CEkMYYkpNQTN
         TVM/hKiWa4t4v7RDmY6Hbu4CxAiOoE2vMHnFpMKT5X2dJUkb6FKk0UQzO9hnCdNvVxxa
         oA4i13pJ7OYuv9dxUOFB41T0N5jWjC4yXALRjwWnHUmFffZYuPI0oKwiz5XmlRLP2tiX
         F0gZT1jPuy33VFz6MvkaDiWZsboEErptGwu2d1v54gGjyTJm4HEQRSxISVSK9hE9i9Yt
         cu4g==
X-Gm-Message-State: AAQBX9e5Q3DOQ7mU6DDuKoGLlygh33LXERrd3ctBva+6e7lyoH2tRNxm
	cVAFo1qf/B4GzkH4bT/h6ce2sfrtuOt/jneIG7dLNQ==
X-Google-Smtp-Source: AKy350bg046U6kUEdMKJ47xgMoqU+o1btrNpujCJ6vXB3o551Lu3oiJA8WifEc5bExAewh/oNaLY16yV+c/9sUrBP2Y=
X-Received: by 2002:ac2:4470:0:b0:4eb:304f:66ea with SMTP id
 y16-20020ac24470000000b004eb304f66eamr823973lfl.13.1680289384305; Fri, 31 Mar
 2023 12:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230331182727.4062790-1-evan@rivosinc.com> <25837ca5-b709-4d20-912b-ab13e6353069@spud>
In-Reply-To: <25837ca5-b709-4d20-912b-ab13e6353069@spud>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 31 Mar 2023 12:02:28 -0700
Message-ID: <CALs-Hss-W78x04LS7X_RiTmU19Xv6d3f4x5rgeEhV7TVy7_CEA@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: dts: nezha-d1: Add memory
To: Conor Dooley <conor@kernel.org>
Cc: linux-sunxi@lists.linux.dev, conor.dooley@microchip.com, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_120309_320923_4223B0C5 
X-CRM114-Status: GOOD (  17.56  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTE6MznigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTE6Mjc6MjdBTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IEFkZCBtZW1vcnkgaW5mbyBmb3IgdGhlIEQxIE5l
emhhLCB3aGljaCBzZWVtcyB0byBiZSByZXF1aXJlZCBmb3IgaXQgdG8KPiA+IGJvb3Qgd2l0aCB0
aGUgc3RvY2sgZmlybXdhcmUuIE5vdGUgdGhhdCB0aGlzIGhhcmRjb2RlcyAxR0IsIHdoaWNoIGlz
Cj4gPiBub3QgdGVjaG5pY2FsbHkgY29ycmVjdCBhcyB0aGV5IGFsc28gbWFrZSBtb2RlbHMgd2l0
aCBkaWZmZXJlbnQgYW1vdW50cwo+ID4gb2YgUkFNLgo+Cj4gPiBJcyB0aGUgZmlybXdhcmUgc3Vw
cG9zZWQgdG8gcG9wdWxhdGUgdGhpcz8KPgo+IFl1cC4gU2FtdWVsIGludGVudGlvbmFsbHkgZGlk
IGl0IHRoaXMgd2F5Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzhhMjE5
NGJmLTkzYmQtZGU0ZC04ZDM5LTBjZDcyYWFiYjBhOUBzaG9sbGFuZC5vcmcvCj4KPiBTaW5jZSBJ
IGRvbid0IGxpa2UgdXNpbmcgdGhlIGZpcm13YXJlIHByb3ZpZGVkIHN0dWZmIHRvIG1vcmUgZWFz
aWx5Cj4gdGVzdCBJIGRvIHRoaXMgaW4gbXkgdS1ib290IGJvb3Qgc2NyaXB0Ogo+Cj4gdGZ0cCAw
eDU0MDAwMDAwIGQxLWZpdEltYWdlLmZpdAo+IGJvb3RtIHN0YXJ0IDB4NTQwMDAwMDAKPiBib290
bSBsb2Fkb3MgMHg1NDAwMDAwMAo+IGJvb3RtIHJhbWRpc2s7Cj4gYm9vdG0gcHJlcDsKPiBmZHQg
bWVtb3J5IDB4NDAwMDAwMDAgMHgyMDAwMDAwMAo+IGJvb3RtIGdvOwo+Cj4gSG9wZSBlaXRoZXIg
b2YgdGhlIGFib3ZlIGFyZSBoZWxwZnVsLAo+IENvbm9yLgoKQWgsIEkgc2VlLCB0aGFua3MgZm9y
IHRoZSBwb2ludGVycy4gSSd2ZSBnb3Qgd2hhdGV2ZXIgZmlybXdhcmUgY2FtZQp3aXRoIHRoZSAi
ZGQgYW5kIGdvIiBGZWRvcmEgaW1hZ2UgSSBmb3VuZCBvbiB0aGUgaW50ZXJuZXQgc29tZXdoZXJl
LAp3aGljaCBkb2Vzbid0IHNlZW0gdG8gZG8gdGhlIG1lbW9yeSBub2RlIHBvcHVsYXRpb24gZm9y
IG1lLiBJJ3ZlIGJlZW4KaGVzaXRhbnQgdG8gcmVidWlsZCB0aGUgZmlybXdhcmUgYXMgSSBkb24n
dCB3YW50IHRvIGJyZWFrIHRoZSBGZWRvcmEKInNhZmUgT1MiLCBhbmQgaWYgdGhlcmUncyBhIHdh
eSB0byBnZXQgbWlyZWQgaW4gc29tZSBidWlsZAplbnZpcm9ubWVudCwgSSBzZWVtIHRvIGhhdmUg
YSBub3NlIGZvciBmaW5kaW5nIGl0LgoKSSdsbCBwcm9iYWJseSBqdXN0IGtlZXAgdGhlIHBhdGNo
IGxvY2FsbHkgaW4gbXkgdHJlZSwgYW5kIGlmIEknbQpmb3JjZWQgdG8gdXBkYXRlIHRoZSBmaXJt
d2FyZSBmb3Igc29tZSBvdGhlciByZWFzb24gSSdsbCB0cnkgcmVtb3ZpbmcKaXQuCgotRXZhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
