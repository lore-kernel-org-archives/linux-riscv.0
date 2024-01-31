Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8376CC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECAOvIYi8pDTz1p3NlkXmKDiJMV2B4cHxnIrFYn9nJE=; b=C8tl91SzHPLXta
	u9vLiHzuaL20y8jaEIWZFd/ji3htg6Syc9LSeVnp1EC3RBydKAbxfvwcMYwmOfRbo+lQ5y/7UJpsU
	kWF5hIaR8oGfFJHsR0Co2iCa4SZXWvvNH/nze6YVQacLmGwTF6shqLHyBHQ3e+UN3etPl8rU01rY/
	FvL99Oevqaahk2BynvkGRk+n44qqUATvo093gzmd7WTv/MOGN+82Sqb/FDuLsFdRWYLxE/+n3I1Uo
	ldTqIrqr9dX40H2ABWnwwjkOsUGZGyCwu4b3HrHTb41gspuUBgZlT8z9RWPUXBSkcY6WztlNFdCez
	mQ3MAgOwuVUFw1t6Cx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAxk-00000003hTz-0ql2;
	Wed, 31 Jan 2024 13:49:12 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAxg-00000003hSM-3MXD
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:49:10 +0000
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed179f0faso711909276.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 05:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708946; x=1707313746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPLw/LWplp7+P1Gs+5HHE9GJRqlCVuyyfFXDuI3BijA=;
        b=LGjK9IOsGGddzoxTgkeTVWZhH+hEMz8lwkV0qsBW6K86WCAQp3JByGBLSNCIbbbd7m
         nUe4lnNqdFA9vFs4ny2DC6OyPC9QV+bgJUfunblot6I1brnZK7QVW2GUYzvut76MJnuI
         azpuh6fmCTNMNWybQFvqmFZHxrusEVlhPys/0d8/xKKMg1C0nYgjnjth63/0FKT3ZCJB
         yuE+RgDGlxyqLhlhLzwkaunRPs804tAaaD+yEPJGokyodTPMtE1TnO17L1yt6kFuivOz
         SUy9YRD2lJ6NIMGjFotipAlW6tWdnKdoKgfyu9XVxDKOGGdBYV4ikVcQSIXkTVFYS0Et
         vdQw==
X-Gm-Message-State: AOJu0YyxhlNoHwRUO/0K3H41cMkJtNhBH4x1ppVRhoPmi11vhdvzf11e
	oda62SAnNEM8vI5EVynrSZDa7L1KNfswR7rRogITCpne7LsMe/4N+augDF7PQeo=
X-Google-Smtp-Source: AGHT+IEuAC256U67Th9Lp1SGFH54/MF2Wo3CRfKu/ozhGNXfRxjSRzEWVgNh+9Qqti08b5OlgzGXNw==
X-Received: by 2002:a81:af4d:0:b0:604:151d:20d3 with SMTP id x13-20020a81af4d000000b00604151d20d3mr187397ywj.23.1706708945929;
        Wed, 31 Jan 2024 05:49:05 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c2-20020a258802000000b00dc2366900f9sm3484186ybl.65.2024.01.31.05.49.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 05:49:05 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6040e7ebf33so3860037b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 05:49:05 -0800 (PST)
X-Received: by 2002:a0d:eac5:0:b0:604:9ef:3045 with SMTP id
 t188-20020a0deac5000000b0060409ef3045mr1069160ywe.31.1706708945557; Wed, 31
 Jan 2024 05:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129135556.63466-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUiiQpw5UH8s748oqaH5BuFqDy=feWxdsEPJ4jaHRzkyA@mail.gmail.com>
In-Reply-To: <CAMuHMdUiiQpw5UH8s748oqaH5BuFqDy=feWxdsEPJ4jaHRzkyA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jan 2024 14:48:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWe1_51wxrvhrPN4HVdsZNLep_Qz2ianW0cPXxJ6ECEfw@mail.gmail.com>
Message-ID: <CAMuHMdWe1_51wxrvhrPN4HVdsZNLep_Qz2ianW0cPXxJ6ECEfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240131_054908_865770_3E918872 
X-CRM114-Status: GOOD (  18.06  )
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

SGkgUHJhYmhha2FyLAoKT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTE6MzjigK9BTSBHZWVydCBV
eXR0ZXJob2V2ZW4KPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBNb24sIEphbiAy
OSwgMjAyNCBhdCAyOjU24oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+Cj4gPgo+ID4gT24gUlovRml2ZSB3ZSBoYXZlIGFkZGl0aW9uYWwg
cGlucyBjb21wYXJlZCB0byB0aGUgUlovRzJVTCBTb0Mgc28gdXBkYXRlCj4gPiB0aGUgZ3Bpby1y
YW5nZXMgcHJvcGVydHkgaW4gUlovRml2ZSBTb0MgRFRTSS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
Cj4KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4KPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1waW5jdHJsIGZvciB2Ni4xMCwgYXMg
dGhpcyBoYXMgYSBoYXJkCj4gZGVwZW5kZW5jeSBvbiB0aGUgcGluIGNvbnRyb2wgcGF0Y2hlcy4K
Ckl0J3Mgd29yc2U6IHRoZSBwaW4gY29udHJvbCBwYXRjaGVzIHdpdGhvdXQgdGhlIERUIHBhdGNo
IGJyZWFrcywgc29vLgpTbyBJIGhhdmUgbm8gY2hvaWNlIGJ1dCBtZXJnaW5nIHBhdGNoIDMvNCBh
bmQgNC80LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
