Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC84AC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VFJefj3Md5qy/51Vj913q6lCVADWLwU3478lTy9Yws=; b=fGN1q2x3LTwmLG
	B5ePDIHflFoOfKd3b4DYGyjAeSm5EDx04giVo9fbyp0M5DdXYqMeYM9KTW/UgYotGWcrGlo9Advue
	xPm2KIj86JdIkqJZeI49KRKkzAvABPSe4pdjqvxTQkzCMMySwT+rA5UD2vE9QXu7rM32f7VG9laOt
	OhQJ4a+S6drAJxtFjubKfKM3PfjrHiIHqUipa2NFkOEA5hDI5qVnoPtjBrj6NDT8A/C9MjoMI7FyZ
	RrQfxHdX2qLWgNYrnIt492DsrZfBQ07PgUD+1m4JchAqduPegDcxnvHHpFozlAP/5cqvU2F2udtOm
	I0HkMZClriPn3agGJsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAgB-00000005l0A-3GSf;
	Tue, 26 Mar 2024 17:33:43 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAg8-00000005ky4-2DJ7
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 17:33:41 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60a434ea806so64130607b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 10:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474416; x=1712079216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S16dC9FBtS4z5iu5umvo/h4i6rfX9oeeL4oHp++Tmxw=;
        b=g8CGvZr+N8Ri5dznqzVUBnTCCijlJhmekLq+LX4DwOVtUf9B0DAQ8QQ4zBhe/gVzyC
         39fGZ4ctntEtvENs9eYquJT0uv4cTL5fdowXUowNluFUKF7vibNtDVvu3enusixh7hU5
         Pb6RaczSDPKQyDf70JrSQAsABDnUDdiKMD8KhC8XK9mFApOaeAqwtUJlgM/t5V0/A9CK
         QI7As+/sVlRdm+/mc5dLAQeG7JfFHtsPmQ1x5DzaItpJ55A6kKoj6rOdWX4UP2NwpSEC
         Of1FZ0w083RcshalKv3zKo1XqkbRgSaq4lDj/RrEFwWRuQxarEMoTG/xTGjzEqlpFecF
         XDgw==
X-Forwarded-Encrypted: i=1; AJvYcCWEsiD5HEwPG0dt162Y5B2/9qJGdKnR5C6wUz1HNevNGn1cCDOwyiD6C5jP4oyAm4v2MsQfCIm1RNJUwtryfYICXQL2bAj+0mZiv2Bvme1t
X-Gm-Message-State: AOJu0YxIotpeAinWrpoyzm8TQXVZGi7gaois75VIn/WchX7YBd88Zau9
	SMEGmpPTTHN08fIgioT5CqciNyZB3bXZwitOhEWi/C2Y3gM2OdMPAnSnKj2ddjE=
X-Google-Smtp-Source: AGHT+IHhDDW9ucNA7s5XC3R/NnhBbcxJsFhIHxFZkzn1C7DZqflyLsqDIlcJtakgI7t0dg+bWGff8Q==
X-Received: by 2002:a81:4997:0:b0:611:9db2:7ff1 with SMTP id w145-20020a814997000000b006119db27ff1mr2091085ywa.26.1711474416176;
        Tue, 26 Mar 2024 10:33:36 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id ee7-20020a05690c288700b0060cbdb0cd11sm1536335ywb.111.2024.03.26.10.33.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 10:33:35 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso5997920276.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 10:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWI3+C1GEDPMly58EP/cbn+GUi9O4Ta8LQ1dGubMcUSX+1PiY+sYN4uNTZ+KQde5Dswja/PN9YU9G4IbJQknjMM3HDQjCTW8bvh+RB0yj0
X-Received: by 2002:a25:213:0:b0:dcf:a4a9:98bd with SMTP id
 19-20020a250213000000b00dcfa4a998bdmr1995576ybc.20.1711474414496; Tue, 26 Mar
 2024 10:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <631a1f4c066181b54617bfe2f38b0bd0ac865b68.1711474200.git.geert+renesas@glider.be>
In-Reply-To: <631a1f4c066181b54617bfe2f38b0bd0ac865b68.1711474200.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Mar 2024 18:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX85DW5scsc1Uxfz92GfMHi+N3icTCihwr43de5FvapZQ@mail.gmail.com>
Message-ID: <CAMuHMdX85DW5scsc1Uxfz92GfMHi+N3icTCihwr43de5FvapZQ@mail.gmail.com>
Subject: Re: [PATCH] drm: DRM_WERROR should depend on DRM
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_103340_642766_5EABD18C 
X-CRM114-Status: GOOD (  15.49  )
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgNjozMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+IFRoZXJlIGlzIG5vIHBvaW50IGluIGFza2lu
ZyB0aGUgdXNlciBhYm91dCBlbmZvcmNpbmcgdGhlIERSTSBjb21waWxlcgo+IHdhcm5pbmcgcG9s
aWN5IHdoZW4gY29uZmlndXJpbmcgYSBrZXJuZWwgd2l0aG91dCBEUk0gc3VwcG9ydC4KPgo+IEZp
eGVzOiBmODk2MzJhOWU1ZmE2YzQ3ICgiZHJtOiBBZGQgQ09ORklHX0RSTV9XRVJST1IiKQo+IFNp
Z25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
CgpNeSBhcG9sb2dpZXMsIHNvbWV0aGluZyB3ZW50IHdyb25nIHdpdGggdGhlIGxpc3Qgb2YgcmVj
aXBpZW50cy4KUGxlYXNlIGlnbm9yZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
