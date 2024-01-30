Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D14C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/k2EpKdT+RjOTdRZmxyXjGVZViKqnyaM+ALjTUnmGw=; b=0FTAE1Rgfhp+LB
	VUd6sKKSBCATwAY5Ol9Oub4H5DI0l8g8DOjRFPtDWZS+a4C6KurwikqjkrauLEOJG0DY4T/xIQKco
	V8EXJXVV2/Dc10Fp5a4VMHETEPZTV33nAJ/yu+g2te6NyMnossaQBHius1c638IdBHFcM5zkdcq58
	vPA9uPl/G0x600cnJkn6YYz/qNOQ6LyXqf+/Trn0ZZImDDIRWMG5qdt3QuBPeOtq6QDC9fotSZ1jJ
	ulb1WTz4K3j1aDpXgpYW5hBJQtjX7OmMF/ldWpnYnMYLgq7CElUr8SzjOhAfao4XkQbXS+xekuUNW
	vZvbHhI3FZeGlLd0RV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlVY-0000000GDry-2fW3;
	Tue, 30 Jan 2024 10:38:24 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlVS-0000000GDnd-1EBs
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:38:21 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-602d222c078so39914717b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611097; x=1707215897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+UdOqZZwrPnQ0aumW9u93q+aeRPCvN7vS4/TIye6aw=;
        b=EoaFC0NBYFxj7N1nKnfB+F9q/zHaiqhfYr5x9YPlpHdzh+SXCUihtztPmtTtAiakZv
         mzYlaILBNUkk+HfinvQp24rWlTF2gv+sLtEbLOAn+6qqGxSUAPtHOB3B4IS/knRzFOVH
         xGSAkYCIMUsyaSPUx2HvZX2jzq2vuMgdKALCud/QNKH7iRXWUd4kQxuVpz+0ojNKf0kJ
         hAsGJ+dvFpHRc1j+aAxZ4FANGd59aO/4zPz/zPtgWIFlwK2QBmofjog0txABrTyJi2w1
         lVeQ1NzySdR/Lw+V45OuAu1nXjXVDuQxi4wmerCAhiio9C+QDRWffv+EMn9n8UdL0Dym
         d9cQ==
X-Gm-Message-State: AOJu0YyjQfUdPptb3XD0y2399ZDBLemLHn3p8eGvQjpA9Q83qnkIRcya
	NY9Gxp0S0lH91DOxzrbiw1MOVfOhI+70X6CWrEBhlpWGNFjbf9dPSRY2R7QUnhw=
X-Google-Smtp-Source: AGHT+IH3YgapE18wJT+qEECeHYxvU1jX9BEtRqHpu4g4G64QEHPSpwaBdCElZCjfwjcuRpzijNqKDw==
X-Received: by 2002:a81:a746:0:b0:602:98af:b469 with SMTP id e67-20020a81a746000000b0060298afb469mr6527282ywh.9.1706611097231;
        Tue, 30 Jan 2024 02:38:17 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u79-20020a0deb52000000b005ff8b88a631sm3132002ywe.133.2024.01.30.02.38.17
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:38:17 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-603e370790cso16694587b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:38:17 -0800 (PST)
X-Received: by 2002:a81:e244:0:b0:5ff:5e94:277b with SMTP id
 z4-20020a81e244000000b005ff5e94277bmr6676192ywl.45.1706611096838; Tue, 30 Jan
 2024 02:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129135556.63466-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129135556.63466-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 11:38:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiiQpw5UH8s748oqaH5BuFqDy=feWxdsEPJ4jaHRzkyA@mail.gmail.com>
Message-ID: <CAMuHMdUiiQpw5UH8s748oqaH5BuFqDy=feWxdsEPJ4jaHRzkyA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
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
X-CRM114-CacheID: sfid-20240130_023818_550274_B50BBDFD 
X-CRM114-Status: GOOD (  14.86  )
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
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE9uIFJaL0ZpdmUgd2UgaGF2ZSBhZGRp
dGlvbmFsIHBpbnMgY29tcGFyZWQgdG8gdGhlIFJaL0cyVUwgU29DIHNvIHVwZGF0ZQo+IHRoZSBn
cGlvLXJhbmdlcyBwcm9wZXJ0eSBpbiBSWi9GaXZlIFNvQyBEVFNJLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
PgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwgZm9yIHY2LjEwLCBhcyB0aGlz
IGhhcyBhIGhhcmQKZGVwZW5kZW5jeSBvbiB0aGUgcGluIGNvbnRyb2wgcGF0Y2hlcy4KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
