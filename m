Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A806C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 16:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvv2LzHjClZoSACb/cNsywnAjQHWycV2CEg42oyTyM=; b=xY3vv9qLL7NegI
	iqUWunj74rnIKcCuyuQ/45dBZpFSSDwvYgd8NPd48tDBrXqHlkh9nbU4Mb8+ktEkNP9daTvlVlJ+M
	y7EJ4hyJwcrKm0F5zdaswcJ6TlwR1dahCphp+9nVEgKgJFa4MTBX87SCvwJKTgb7BJemDS9YeQ0JH
	XJbn6ukokhRxw8Y3v7j+z1OL3qIyFPsLZjjq8zUIkyJ/o6x+wcM7UCmooU+V+ncMBUW7Vn83a6Hgv
	3kNwGfMlcYeTWvwvAWj2zSRYIKESudJbIZpWKcjIUYLOUIgx0ykWCVN9A4vwjMErTnrmlSMstV/d3
	tiBiwSgmA1Z1krtnjGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTLt-0000000FXhY-3uXa;
	Tue, 20 Feb 2024 16:52:17 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTLq-0000000FXgb-3eUP
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 16:52:16 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d2509c66daso4761401fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 08:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708447933; x=1709052733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2++bzZmBlDUJtBL2A+1xjZvezhGxUTSfoR1tudvrmw=;
        b=YG6BqG2Fp3dP7BLW0xiNnuNrCKU7q+4Qkq/Q+huFI7u30Bvy3IKjultR+65QyouUXY
         dtLr03flCvLlnXq0k6aIy8v79s5jCHMHMJ8WzlhBw9t9LpG+efm3qYN1TAY4placSHwD
         dgxL8kkQMv+++59CEDx7hGIabS0qTQuoETAexzDbXO4STQYYDmpoZdw0YjOZXmssBVi/
         5AJNET4XMEeTVM5QUptC50inczJgn9HqF7mBD4kNalab+epAsRsneTLPeMaXPLm9/jC7
         g7E8pHQTK332NL/k9WqnvrWP6EKi4AW4LKFQzwEthQlhLfb8evIFMjSb4gbLHrSLhlUh
         jixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447933; x=1709052733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2++bzZmBlDUJtBL2A+1xjZvezhGxUTSfoR1tudvrmw=;
        b=iszIfzbPzmvb6L92ssw0b9Azo5NYNm2H5Gr1ZFde6E1AotQEXPYvfrux13SHvXnF67
         3AaHkCuP979sy5/h0JoVd0Hmzw3wMYnebkrzIaj/lyTCR+dt3cSOuw+jWGu1ZqHKKoap
         9s2quW/G/lmon/U+COaVuDfH/Z8zsdLME9anUdw0odtWWM/jEiVSfeuCXHEGK4scR/FB
         NvCv2HiMkijPvyC38dQY36I//LN57Ag5hvrjHm7c8dyD1gzfhCaHgfu9Lx8jCQSbP88l
         VRtfYqRVgplDtoAEEeP5OcLOgxvZMbvD0j2WCtjKaD0F2pBzYFAmCftAu+BJnPzJx1sW
         URfA==
X-Forwarded-Encrypted: i=1; AJvYcCXPouC+V7ptMD8glMgSgdxlwCRhi4S2yOVJZJHvX80Q/Mzxp0S6enOjyDhwuOktQT57lDPvjz7fG6wyhsHwy3Cf91ExdOktz8iBAKdU94ZM
X-Gm-Message-State: AOJu0YxUNi/cLrEEUZsoLbEARujZjnj5ssGqli7AHlcQVfy4Srxa2UeX
	yyySuXuThny6YXlBD+FaMU3EGke0p/t3UgropB/NL3iTNZQUmxpkxU8iKOESQm6RSdjMGuGGicI
	KOPMKqAkKbZLTRKHyM9FvycfcLnniq99XE2H16A==
X-Google-Smtp-Source: AGHT+IFxn/XbcJ1LB10krZNF1aRmNeyYmzh22jCeeFItu7QL0ccN+D39sO7s3W7/K3hok3NiVql/DfBXEhGDD51v9UM=
X-Received: by 2002:a05:651c:1047:b0:2d2:3f05:d137 with SMTP id
 x7-20020a05651c104700b002d23f05d137mr3610001ljm.1.1708447932770; Tue, 20 Feb
 2024 08:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-8-apatel@ventanamicro.com> <875xyji7mc.ffs@tglx>
In-Reply-To: <875xyji7mc.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 22:22:01 +0530
Message-ID: <CAK9=C2V3hQnpibHgHUpwRXWn4LSuGue0a7Sh9NFYPB6XOizjoA@mail.gmail.com>
Subject: Re: [PATCH v13 07/13] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_085214_918378_529FAA9F 
X-CRM114-Status: GOOD (  20.97  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNzowMuKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArI2lmZGVmIENPTkZJR19TTVAKPiA+ICtzdGF0aWMgdm9pZCBp
bXNpY19tc2lfdXBkYXRlX21zZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0
b3IgKnZlYykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgbXNpX21zZyBtc2dbMl0gPSB7IFsxXSA9
IHsgfSwgfTsKPgo+IFRoYXQncyBhIHdlaXJkIGluaXRpYWxpemVyIGFuZCB3aHkgZG8geW91IG5l
ZWQgYW4gYXJyYXkgaGVyZT8KPgo+ICAgICAgICBzdHJ1Y3QgbXNpX21zZyBtc2cgPSB7IH07Cj4K
PiBTaG91bGQgYmUgc3VmZmljaWVudCwgbm8/CgpJIGhhZCB0YWtlbiByZWZlcmVuY2UgZnJvbSBp
cnFfbXNpX3VwZGF0ZV9tc2coKSBpbgphcmNoL3g4Ni9rZXJuZWwvYXBpYy9tc2kuYwoKSSB0cmll
ZCAic3RydWN0IG1zaV9tc2cgbXNnID0geyB9OyIgYW5kIGl0IHdvcmtzIGZpbmUgc28KSSB3aWxs
IHVwZGF0ZS4KCj4KPiA+ICsKPiA+ICsgICAgIGltc2ljX2lycV9jb21wb3NlX3ZlY3Rvcl9tc2co
dmVjLCBtc2cpOwo+ID4gKyAgICAgaXJxX2RhdGFfZ2V0X2lycV9jaGlwKGQpLT5pcnFfd3JpdGVf
bXNpX21zZyhkLCBtc2cpOwo+ID4gK30KPgo+ID4gK3N0YXRpYyBpbnQgaW1zaWNfaXJxX2RvbWFp
bl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25lZCBpbnQgdmlycSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2lycXMsIHZv
aWQgKmFyZ3MpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjOwo+ID4g
Kwo+ID4gKyAgICAgLyogTGVnYWN5LU1TSSBvciBtdWx0aS1NU0kgbm90IHN1cHBvcnRlZCB5ZXQu
ICovCj4KPiBDb21pbmcgYmFjayB0byBteSBlYXJsaWVyIHF1ZXN0aW9uOgo+Cj4gPj4gV2hhdCdz
IGxlZ2FjeSBNU0kgaW4gdGhhdCBjb250ZXh0Pwo+ID4KPiA+IFRoZSBsZWdhY3ktTVNJIGlzIHRo
ZSBNU0kgc3VwcG9ydCBpbiBQQ0kgdjIuMiB3aGVyZQo+ID4gbnVtYmVyIG9mIE1TSXMgYWxsb2Nh
dGVkIGJ5IGRldmljZSB3ZXJlIGVpdGhlciAxLCAyLCA0LAo+ID4gOCwgMTYsIG9yIDMyIGFuZCB0
aGUgZGF0YSB3cml0dGVuIGlzIDxkYXRhX3dvcmQ+ICsgPGlycW51bT4uCj4KPiBZb3UgdGFsayBh
Ym91dCBQQ0kvTVNJLCB3aGVyZSBtb3JlIHRoYW4gb25lIHZlY3RvciBpcyBuYW1lZAo+IG11bHRp
LU1TSS4gQ29udHJhcnkgdG8gdGhlIG1vZGVybiB2My4wIHZhcmlhbnQgd2hpY2ggaXMgUENJL01T
SS1YLgo+Cj4gU28gdGhpcyBzaG91bGQgYmUgIk11bHRpLU1TSSBpcyBub3Qgc3VwcG9ydGVkIHll
dCIsIG5vPwoKWWVzLCBJIGFncmVlLiBXZSBzaG91bGQganVzdCBjYWxsIGl0ICJNdWx0aS1NU0kg
aXMgbm90IHN1cHBvcnRlZCB5ZXQiCnRvIGF2b2lkIGNvbmZ1c2lvbi4gSSB3aWxsIHVwZGF0ZS4K
Cj4KPiA+ICsgICAgIGlmIChucl9pcnFzID4gMSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9UU1VQUDsKPiA+ICsKPiA+ICsgICAgIHZlYyA9IGltc2ljX3ZlY3Rvcl9hbGxvYyh2aXJxLCBj
cHVfb25saW5lX21hc2spOwo+ID4gKyAgICAgaWYgKCF2ZWMpCj4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRU5PU1BDOwo+ID4gKwo+ID4gKyAgICAgaXJxX2RvbWFpbl9zZXRfaW5mbyhkb21haW4s
IHZpcnEsIHZpcnEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICZpbXNpY19pcnFfYmFz
ZV9jaGlwLCB2ZWMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGhhbmRsZV9zaW1wbGVf
aXJxLCBOVUxMLCBOVUxMKTsKPgo+IFBsZWFzZSB1dGlsaXplIHRoZSAxMDAgY2hhcmFjdGVycy4K
Ck9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICAgICBpcnFfc2V0X25vcHJvYmUodmlycSk7
Cj4gPiArICAgICBpcnFfc2V0X2FmZmluaXR5KHZpcnEsIGNwdV9vbmxpbmVfbWFzayk7Cj4gPiAr
Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiBUaGFua3MsCj4KPiAgICAgICAgIHRnbHgK
ClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
