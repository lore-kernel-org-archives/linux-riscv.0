Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6580C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urqoJ2eITNYXkcmdktx/aTzFOjGrzgNdyirn/+p5xwo=; b=NwsafKBYteNi8u
	kKwZQ3LEL408ZFC38J9oduwSe7oCarv5HgaH3942cWJOnO5pxDCCdw0AVXTWdCuC7Qi9KFmWj0OqH
	bd+P/vVr0xe8C1RGsWzErGbw/QfW6pS6qXa0CcuTl6XRyzsqSAYisWWbXb1wxnOw4DV7fqAR6tMql
	o0VoUsIYSS9zUruu+sKAp4EW/f5crrOW+c2lpCLawr614tDQvGlAWBgtRfU06vykr21qjrQvl5/Yl
	EkcK7GZPNE8cJuXe3cemc/BK+BIwSGB/hlmQrU9vQdED9Ckh+IYrJ8smoOxVHYi3w4kipKVKdojcE
	X7GdnLcLY4v9+ADMxXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlTl-0000000GCbx-0FEK;
	Tue, 30 Jan 2024 10:36:33 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlTi-0000000GCac-1PUP
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:36:31 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6029e069e08so50159037b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610989; x=1707215789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0zKEeIH6XGdGj+q5gmx2XiQOnw1KXquglVBPd+xyto=;
        b=OTrAWGzvKVaOZk3nGfkCFWYTf5zc621j7kxo6PiXZWsirT0j0GzNN/z98D6WcybjOU
         6zLqg4zbWmJ7QL1ivKqd9wtOFQrOWFmekthenuqmJNkXz3jBPQgzDw7FmfRhYwSPCrRB
         QMPHSxUADRPenYpFCKc5WInwScNMmPz2L6OS2tjN/Bzq7Um2Ic9x1aBb1Jkbm7JZaPOs
         wKhJWOM3nFB1eYIUoOfBeYNQb4x3vbDGzwyWfUFlcock806QOsIfQBnjEs2L3omWPSoy
         lK4pWmRBvVGnP+jV2lyMeBILUy93v3tC6doiLE1F6QATZjjW0qVYAfcytTp4ellLqmGE
         qaBQ==
X-Gm-Message-State: AOJu0Yy5lkdEsfqA5VdNhEjjBWGoB5mG69O7XJpj6Pp70v6JI9qb4jh6
	PCOip+pz95UB9N4P1IJdVpqbjQMJpYRlzJ5CGwPEFXxnnuhNeSTk64LTXFURIoc=
X-Google-Smtp-Source: AGHT+IFipvs71KztgqNGlQ3JG8bPChwFyXAqxMa+kxjiWqADNrxSkmNLm3u9fUtS1TatpUg2zo32Ww==
X-Received: by 2002:a81:a843:0:b0:5ff:84f1:6fe3 with SMTP id f64-20020a81a843000000b005ff84f16fe3mr5420375ywh.23.1706610989003;
        Tue, 30 Jan 2024 02:36:29 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id c194-20020a814ecb000000b00603f0c80c61sm344089ywb.142.2024.01.30.02.36.28
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:36:28 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-603c5d7997aso24954757b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:36:28 -0800 (PST)
X-Received: by 2002:a81:e207:0:b0:5e9:fa4a:fd56 with SMTP id
 p7-20020a81e207000000b005e9fa4afd56mr5491349ywl.13.1706610987546; Tue, 30 Jan
 2024 02:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129135556.63466-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129135556.63466-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 11:36:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-x94pcJ7UwYH_SUcFc_k0CiNckqxEX=_QCi+Ad9adJw@mail.gmail.com>
Message-ID: <CAMuHMdV-x94pcJ7UwYH_SUcFc_k0CiNckqxEX=_QCi+Ad9adJw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_023630_398796_202587D4 
X-CRM114-Status: GOOD (  17.20  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMjo1NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEN1cnJlbnRseSB3ZSBhc3N1bWUgYWxs
IHRoZSBwb3J0IHBpbnMgYXJlIHNlcXVlbnRpYWwgaWUgYWx3YXlzIFBYXzAgdG8KPiBQWF9uIChu
PTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mgd2UgaGF2ZSBhZGRpdGlvbmFsIHBpbnMg
UDE5XzEgdG8KPiBQMjhfNSB3aGljaCBoYXZlIGhvbGVzIGluIHRoZW0sIGZvciBleGFtcGxlIG9u
bHkgb25lIHBpbiBvbiBwb3J0MTkgaXMKPiBhdmFpbGFibGUgYW5kIHRoYXQgaXMgUDE5XzEgYW5k
IG5vdCBQMTlfMC4gU28gdG8gaGFuZGxlIHN1Y2ggY2FzZXMKPiBpbmNsdWRlIHBpbm1hcCBmb3Ig
ZWFjaCBwb3J0IHdoaWNoIHdvdWxkIGluZGljYXRlIHRoZSBwaW4gYXZhaWxhYmlsaXR5Cj4gb24g
ZWFjaCBwb3J0LiBBcyB0aGUgcGluY291bnQgY2FuIGJlIGNhbGN1bGF0ZWQgYmFzZWQgb24gcGlu
bWFwIGRyb3AgdGhpcwo+IGZyb20gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNyby4KPgo+IFBy
ZXZpb3VzbHkgd2UgaGFkIGEgbWF4IG9mIDcgcGlucyBvbiBlYWNoIHBvcnQgYnV0IG9uIFJaL0Zp
dmUgUG9ydC0yMAo+IGhhcyA4IHBpbnMsIHNvIG1vdmUgdGhlIHNpbmdsZSBwaW4gY29uZmlndXJh
dGlvbiB0byBCSVQoNjMpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiBy
ZW5lc2FzLXBpbmN0cmwgZm9yIHY2LjkuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
