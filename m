Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F49C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCjauoqWv0yTHkYYPQDqhjvbGZG6O2ThwmZOfg6uTkU=; b=XXi8t2nHQ3nFWR
	W87zpYZ/dMhggZQIcnm4ktOuCBB+MULNR5TKt5R/uJ2XDS8bypc8xI7VdJer04XPVHMPPopQYhxkq
	DnVyRRxY9hUjcp3JJ3sc4mELLUlhej6fEQUNpPL/dBByl5K5Owab8xB1+wo7T+H6GOiz9cQm2u9VL
	myhVXBD+TcdAmtlqyFUkXCFdQuHwk/w+cpCHKzyf5ZXVNGMRALI4MZapKekGdOCgS7kRBTbnuMVf+
	bln6HKvSRhMnMdqtDM2BqJy9FAhGZ/9Q0awhDNEr8pLmS8SbIiY7L6MzdndHRLS//awukRLE9pjLq
	chvWLUtrNnYBjfaEqJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmFQ-0000000GQZC-2QVw;
	Tue, 30 Jan 2024 11:25:48 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmFN-0000000GQY5-3jCl
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:25:47 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ffdf06e009so37740897b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613943; x=1707218743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRnlMJumtKu3HGeJaBtjZds244bkDv4Dl9koHy9aL+0=;
        b=NmXTsPLR1+3r9qY++cOgJ0OsmbOvH7xmrmK3DvoQxoRuv/QAstHLfxtxnnYuXJ/tyX
         lMwqCVH1PUAqhQykg760WYNyaMrHJs5Oo0cIyWK5DV7YHoCj4pYaGyt9Hlm41ujygzkj
         G8ELjqQJ8jLtSeTurbxSlsQCHPEFxT5Q6dDEQJd3hjKURMWktzQhOqou5C8eAWPmfZf0
         tAPrS5JqCDbtQZbQ5gSHWmoFZyOUeCVkXLl1EyqDDxhatXEtOzncqukgGRIIwsSPmPEX
         H1pkaY5OoqE6GadJiITsZeUuYuAy4pGKkoPFdEDLgQivDZrxXr0uT5ykoQlF2U5hEhht
         tb6Q==
X-Gm-Message-State: AOJu0YykVNc4L5JwgCuW7IYSszutuu1E2WMWuMUArjdz2XKqv57SBw4p
	W2gLebeT1md4fO2zjsm/AAeXoyVnFQqe+H3yaFjJ8YqWa3xC3YJvGsAT5sjQQFs=
X-Google-Smtp-Source: AGHT+IFTvGfnCvVqgvH9CVPjQaPpRsf33Hrm+FUfwXwGjv9XRO3+uveiCxxzLaXdCkcwIb8vKpqpyw==
X-Received: by 2002:a0d:ff84:0:b0:5ff:6c4d:fe34 with SMTP id p126-20020a0dff84000000b005ff6c4dfe34mr5849428ywf.48.1706613943472;
        Tue, 30 Jan 2024 03:25:43 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id o190-20020a0dccc7000000b005ff96ca079fsm3114267ywd.141.2024.01.30.03.25.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:25:43 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3101040276.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:25:43 -0800 (PST)
X-Received: by 2002:a25:203:0:b0:dc2:4d3e:acf6 with SMTP id
 3-20020a250203000000b00dc24d3eacf6mr3997077ybc.13.1706613943089; Tue, 30 Jan
 2024 03:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129151618.90922-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129151618.90922-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 12:25:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=E5VDZn0QjiGQL73j135LiA1QNrYH-hCve1Yk0PqJ=A@mail.gmail.com>
Message-ID: <CAMuHMdV=E5VDZn0QjiGQL73j135LiA1QNrYH-hCve1Yk0PqJ=A@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to
 RZ/Five SoC DTSI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_032545_949195_D6FC2402 
X-CRM114-Status: GOOD (  18.20  )
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

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCB0aGUg
SVJRQyBub2RlIHRvIFJaL0ZpdmUgKFI5QTA3RzA0M0YpIFNvQyBEVFNJLgoKVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQoKPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cgo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
cmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDQzZi5kdHNpCj4gQEAgLTUwLDYgKzUwLDgyIEBAICZzb2Mgewo+ICAgICAgICAg
ZG1hLW5vbmNvaGVyZW50Owo+ICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4K
PiArICAgICAgIGlycWM6IGludGVycnVwdC1jb250cm9sbGVyQDExMGEwMDAwIHsKPiArICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0M2YtaXJxYyIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyemcybC1pcnFjIjsKPiArICAgICAgICAg
ICAgICAgcmVnID0gPDAgMHgxMTBhMDAwMCAwIDB4MjAwMDA+Owo+ICsgICAgICAgICAgICAgICAj
aW50ZXJydXB0LWNlbGxzID0gPDI+Owo+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwwPjsKPiArICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gKyAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDApIElSUV9UWVBFX0xFVkVM
X0hJR0g+LAoKQXMgdGhpcyBpcyB0aGUgUlovRml2ZS1zcGVjaWZpYyAuZHRzaSBmaWxlLCBhbmQg
bm90IHRoZSBjb21tb24gYmFzZQouZHRzaSwgeW91IGNvdWxkIGF2b2lkIHVzaW5nIFNPQ19QRVJJ
UEhFUkFMX0lSUSgpIGhlcmUuCkkgYW0gbm90IHN1cmUgd2hhdCBpcyBtb3N0IHJlYWRhYmxlLi4u
CgpUaGUgcmVzdCBMR1RNIChwZW5kaW5nIGludGVycnVwdCBuYW1lcyByZXZpZXcgY29tbWVudHMp
LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
