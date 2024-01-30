Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BE5C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba2uk6ZqxCrf94dixlbn0+ucpTFllpvQ0wFRG3kdDHo=; b=yXqpdbgzf6HpUf
	Zmn1JI0mcgougzrmLothPI2KJsBxKCFWJpFBfWc15cuRROTc02b4PDBuVHelHrLfx668StHHP+Jjd
	SL1CQmRmHKN5jD3kMPEyJeWlDNYh5mWz7U7gKBed8Mvf/AHSECPJOSY35GYuyuBKnnZIM+v3Szhto
	5ZU+uMM7Zx/nWmlcSK0KBA7iG8SOUovCTqyjR6cMjEXWgB8wXqWoWKpG+rxfEW2ekwGRiANvShXax
	OZULAiCFLwrjd+oEPYvxr+PWob4GvSL4PV207kEaJWJ4apIuoWI/3MN0DhBInRwiAmTkyGV/zxet/
	lybLkKU7dKG4oVNJeUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmIG-0000000GRFw-2AOF;
	Tue, 30 Jan 2024 11:28:44 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmIE-0000000GREA-1MTw
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:28:43 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ff9adbf216so33913167b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706614120; x=1707218920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W54hXGwyrXiKIUUpJUiH2UqyDwulWdbv5HbLIOlRE2U=;
        b=GMAyuqPSYpMW/Cmcfm/arSAV5ozU0sWBshtekE7vTc1V6xB1FDUrTDXbztaO/V/ptJ
         ideN3qUOYJzvw0f1Q3q2DtWZc+brgNY9LhZcngGEc4Y0pEajQBFIs3zbxS/HahLBN8X/
         X5Hb8L4k1S6W0+j2NNv2VlakXvN47Ekhvx8LOxFcLBGsFqnT8hGzGdJzIKDhxybbQ9ZN
         JD9B8JqPDZi2bIAb/1poZ0nlOYYXX9TGfvMtW3RW2T6SYekfYB3Ov4L+7cTGh8Xy8zMh
         cMW9Mvpv1TQFTm+r2qQXttuV6Ccc6FzAO+PdHfcDow0HOnBDWKRhe+3dOCl3hd+2CFCB
         nRAg==
X-Gm-Message-State: AOJu0Yy6RxXJDJ9n0hTzL8C+iIJqt1vrKNuGKhWVSzns4Ci/fSbQXw73
	fH5KizKV9E9vy4KDKHsisGFBOgaetjqWJb7MXeTWXbHMsUScF+1zwdL2l3CI98I=
X-Google-Smtp-Source: AGHT+IF2OFmtyQYa9Wn6d96cAFTnMI0N06dR62uRCS3piAYWU2sY6vAuEe9RekZdwDStG+le+b9vyA==
X-Received: by 2002:a05:690c:3508:b0:5ff:cbab:2625 with SMTP id fq8-20020a05690c350800b005ffcbab2625mr8850388ywb.36.1706614119749;
        Tue, 30 Jan 2024 03:28:39 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id u198-20020a8184cf000000b0060024349bcbsm3133600ywf.132.2024.01.30.03.28.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:28:39 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-602b7cef983so45583877b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:28:39 -0800 (PST)
X-Received: by 2002:a81:be03:0:b0:5ff:a3df:9ba4 with SMTP id
 i3-20020a81be03000000b005ffa3df9ba4mr7021538ywn.48.1706614117959; Tue, 30 Jan
 2024 03:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129151618.90922-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129151618.90922-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 12:28:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOWw9jQytipok-BM2yThJgtpaJte-ksjF1VuDmxHhmJg@mail.gmail.com>
Message-ID: <CAMuHMdVOWw9jQytipok-BM2yThJgtpaJte-ksjF1VuDmxHhmJg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g043: Move interrupt-parent
 property to common DTSI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_032842_382438_8564BA2B 
X-CRM114-Status: GOOD (  15.29  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE5vdyB0aGF0IHdlIGhhdmUgYWRkZWQg
c3VwcG9ydCBmb3IgSVJRQyB0byBib3RoIFJaL0ZpdmUgYW5kIFJaL0cyVUwgU29Dcwo+IHdlIGNh
biBtb3ZlIHRoZSBpbnRlcnJ1cHQtcGFyZW50IGZvciBwaW5jdHJsIG5vZGUgYmFjayB0byB0aGUg
Y29tbW9uCj4gc2hhcmVkIHI5YTA3ZzA0My5kdHNpIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpS
ZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
