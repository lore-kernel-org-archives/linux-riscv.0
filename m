Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D6C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DUp0yUS4W2UMUa4PbTQmmCwGx0XqvpgPoNzyM6idgs=; b=hi1coMSs2OmxUP
	fqgTZeun22PpmFh007MqUNK3ipLr5Z2W694BcWLvF8muaqqo/nguFzolmFRGzpu93HsaMOtCM02n1
	XzYIeZhrUQMqI31mII1gbbbtFEK4t7rgECbxTq+fZ8XXCQN3+YF15fMZb45paivQV9UGxAtqXkphk
	2QmYoALH0QXcudMK8wqxck7pZQjLBWnXxGwiSvO1rmJkLLqc1X6DA9lHlg7yA53D3jBIa2JN11mYr
	fCB+eU/G4mDYNy6r8cMXAgCuTTxLYVl2mEZ/vGiG1YcTz3LBblyLYuDlZOIDjaiYtTex5GeE+knmy
	wmsdanrxDKszz2L2vmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBkb-00000003wXJ-0b8K;
	Wed, 31 Jan 2024 14:39:41 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBkY-00000003wVH-2oMD
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:39:39 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4bd80b41cbdso1048649e0c.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706711975; x=1707316775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqrU+GVrz1zcwcZi5i1BgXLhXk9f50v4UGP6Xhj2ZlU=;
        b=BP/4EpA1V3zD92MciejMT5z/mSsQ5Fgz7fW46H7nvMAW1HYg3KTYDKEtqqfEf9jPpo
         LnYODYi8hT9YnT85dXet+bq98yS85kX2I5A1VyBE45be/zWc3tDPlnf9U7XJG9/A0dRk
         pWHaDOTSsVwAr+oyZsLgx6g7Euttv01K/nlA8HbSP9v0Q7g0jIvMIQp8wEAqe8r+71kG
         7M8G6MP8EQ0ZgSApsh4Kt525QWxtBiayIrLmgK6fCWKSJMOiEu+zOKZkvtq9OPXkc7m9
         MMDcsoYthoiNuXCcZTyAWfret3DB9tExzTWJFzwkEIle8hP7Cx7D/RJ4LJXgpx+1+lTo
         MQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711975; x=1707316775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqrU+GVrz1zcwcZi5i1BgXLhXk9f50v4UGP6Xhj2ZlU=;
        b=cPPXjCSehTxFr+MiC1w7BzyBd641Rt1sB5IcRfwMVQqIRgZwslNXTDVqpMY+iDsVxH
         Zll5MMZFDIH5jov+Nk/j3QmlIa/NGMaZQP6IbpGzxOGSmiPiyFsQmST48ZHVLEwDbfwV
         n75mbrQNsnkITCIYQEp0Fo5f4DZOFWRnL1DFVkArKfRx/TQDHhUmFRO0ioSB9C03aC7c
         MLN3ND/CZafgd9Q9DnoM1o6GEiPPsWZS4yYLhXrNSTSlFLdjzWfSw4MMUF46H2crOrDy
         mZj8W5iX11Eo31LxedFq3Mjg3xXeBvXws5N7bCUwlmVJxjXRrVY+YBIJBgZ7yAzvh4KD
         vcaw==
X-Gm-Message-State: AOJu0YxBvEvC+RKT3xg8x0Vlexx9Gr3+bbHgawEwHX0QJuo2KHHW+Yzp
	x8HAkxxqYQEubZFhFH543PHtav6PnzbHl3gHRs8uupoAF5iht5QpRMxd8YvmEeuuLiiUFn3n0PJ
	SyD2cMNt9wtm2PXH7cOR3SgB6NFE=
X-Google-Smtp-Source: AGHT+IEw488xosd62LYpZ4qUC9JuwvhcFv4GBaJXAl2lMH4ACM1qXE1Ck9LKAp28ChYZ8M+26nxopKxA3MYm9yAuUB0=
X-Received: by 2002:a05:6122:3a05:b0:4bd:728b:c108 with SMTP id
 fp5-20020a0561223a0500b004bd728bc108mr1783559vkb.8.1706711975030; Wed, 31 Jan
 2024 06:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129135556.63466-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUiiQpw5UH8s748oqaH5BuFqDy=feWxdsEPJ4jaHRzkyA@mail.gmail.com> <CAMuHMdWe1_51wxrvhrPN4HVdsZNLep_Qz2ianW0cPXxJ6ECEfw@mail.gmail.com>
In-Reply-To: <CAMuHMdWe1_51wxrvhrPN4HVdsZNLep_Qz2ianW0cPXxJ6ECEfw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 31 Jan 2024 14:39:09 +0000
Message-ID: <CA+V-a8vBv+5Yd9hHOJnvuo4=JGYj59FkBy+oqscXKxu+9W=png@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_063938_731033_D56EC7B0 
X-CRM114-Status: GOOD (  13.07  )
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

SGkgR2VlcnQsCgpPbiBXZWQsIEphbiAzMSwgMjAyNCBhdCAxOjQ54oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUdWUsIEphbiAzMCwgMjAyNCBhdCAxMTozOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyOSwgMjAyNCBh
dCAyOjU24oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiA+ID4KPiA+ID4gT24gUlovRml2ZSB3ZSBoYXZlIGFkZGl0aW9uYWwgcGlu
cyBjb21wYXJlZCB0byB0aGUgUlovRzJVTCBTb0Mgc28gdXBkYXRlCj4gPiA+IHRoZSBncGlvLXJh
bmdlcyBwcm9wZXJ0eSBpbiBSWi9GaXZlIFNvQyBEVFNJLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+Cj4gPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1waW5jdHJsIGZvciB2
Ni4xMCwgYXMgdGhpcyBoYXMgYSBoYXJkCj4gPiBkZXBlbmRlbmN5IG9uIHRoZSBwaW4gY29udHJv
bCBwYXRjaGVzLgo+Cj4gSXQncyB3b3JzZTogdGhlIHBpbiBjb250cm9sIHBhdGNoZXMgd2l0aG91
dCB0aGUgRFQgcGF0Y2ggYnJlYWtzLCBzb28uCj4gU28gSSBoYXZlIG5vIGNob2ljZSBidXQgbWVy
Z2luZyBwYXRjaCAzLzQgYW5kIDQvNC4KPgpGaW5lIGJ5IG1lLgoKQ2hlZXJzLApQcmFiaGFrYXIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
