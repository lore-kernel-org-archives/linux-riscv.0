Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3FBC48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUNMuczw4ObOCwxDD4S5KBF+PgWWqLp/yCuaxBAE/do=; b=GSipcSPsOYaEbT
	GBTY4OGvj7H2qdvVNwNq7qd1OyRMbUV582uoQJ5lQuShBSvTxxIRP8NzRU4/4Ym044+/6Bk52AQ7q
	9vwNhrftIKWIzQ64M8XUZLYkyxYbfGJSP4gPVP8NWa6ZhR6enbUdIExKl4gw+nh+Sxl7cKO0KlKHK
	TPQVZXKyLNUsM9+o6kqWL0YXmrn3Cc4tylXK9DE76eJeu+lEBEjF2WleN79ZPMf1pRCquM/HniQ/q
	cGZh/DzWoDFwHFENBatje3Yj3q6CR3G+NAN130ycpq0n6kmsakM8a/bYDHCDT/O9ZePgT9rfJG1h+
	2VaQ84TeVIiwzZ+UGdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayxH-00000002ZZR-2QjC;
	Fri, 16 Feb 2024 14:12:43 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayxE-00000002ZYZ-2zeP
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:12:41 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso2140364276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092757; x=1708697557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCEAJzYERTZa1lUHsnan5I6epPyLItD9aG9FckH/eVU=;
        b=Gwg4YDANYTxtzTZFELbYcqbnAIzdNtaunlQu5z0Kib2qRCuP6KDto0bqJibg3rYVkr
         1pfk4OMf5vVMUuorrHIYoTvKoicF/pptf5ykJFEEvQCT/0Wofy1WVKHIyc2qvqA5F43O
         LMbRtH7a2X4ON7zT9NG6uZmM77gQ/IslDifVJWULANgM/H5hdT6PX1fpDUK/lo2cDsOW
         tuUyMYClcffrLJDt7jHPpRCufRgT6uoE3W07PUhvYtBu/+AzYExU7KWu5A3twHzH9ZOD
         vEO3mhih4YRdiaimVskXUbIm0htUJx6pbNMJ4PqaAlWVwLXadUrtQklwwoTvzuVgQVJm
         JqUw==
X-Forwarded-Encrypted: i=1; AJvYcCWFH0KvmoFRgklWiJ1wvwtSuQiJsxfLsOBL5UnAqlL8AVXGNxGzCM4klA1lh+YXL4PGscoLrBkCmPxSYTMhAWJH80e23GEO7JdGMgTUCwES
X-Gm-Message-State: AOJu0YxyIfYP5OerbrAZtAGTbuUjbOFnFcGYD0r0rHi6AkJKl1Al0wsw
	ZWBbAzMujW4CSHObb4zLCUwOVhfoLZR/sTSZNFFNUx4NqzgIXxyS9N0iPZzQvTo=
X-Google-Smtp-Source: AGHT+IECXAbjMRXVPjjJxYJ/tSjvOFFl6asjaUp80t4Xa1RKsl0pnv+PXuimU/kZgHMgYrKzeH3VRA==
X-Received: by 2002:a25:b124:0:b0:dbc:decf:e511 with SMTP id g36-20020a25b124000000b00dbcdecfe511mr4294621ybj.6.1708092756914;
        Fri, 16 Feb 2024 06:12:36 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id q9-20020a258e89000000b00dc701e0bdbcsm307678ybl.44.2024.02.16.06.12.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:12:36 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1486623276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtw3epBGJrQf2PHahEIi9CwIG1HfeeP8GtxnTSKaXWlb5BXlFH/RhKkIjpiLikW3yeRLbPGWWCSvKkRtvGLzEStMgN1TzbsmDMLTYdGEiN
X-Received: by 2002:a25:7209:0:b0:dcc:32cb:cb3b with SMTP id
 n9-20020a257209000000b00dcc32cbcb3bmr4968431ybc.44.1708092755767; Fri, 16 Feb
 2024 06:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-18-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-18-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:12:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKrr6B62pe6ptibbPB733qGmL38A0eigXqqOOKN9HYXA@mail.gmail.com>
Message-ID: <CAMuHMdWKrr6B62pe6ptibbPB733qGmL38A0eigXqqOOKN9HYXA@mail.gmail.com>
Subject: Re: [PATCH 17/17] arm64: dts: renesas: r9a09g011: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061240_773255_F0FA321D 
X-CRM114-Status: GOOD (  15.77  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVXBkYXRlIENQRyAjcG93ZXItZG9t
YWluLWNlbGxzID0gPDE+IGFuZCBtb3ZlIGFsbCB0aGUgSVBzIHRvIGJlIHBhcnQgb2YgdGhlCj4g
YWx3YXlzIG9uIHBvd2VyIGRvbWFpbiBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1vZGlmaWVkIHRv
IHN1cHBvcnQgbXVsdGlwbGUKPiBwb3dlciBkb21haW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2xh
dWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKQXMgUlovVjJNIHVzZXMgdGhlIEludGVybmFsIFBvd2VyIERvbWFpbiBD
b250cm9sbGVyIChQTUMpLCB3aGljaAppcyBub3QgeWV0IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
LCBJJ2QgcmF0aGVyIGRlZmVyIHRoaXMgdW50aWwgYWxsCmRvbWFpbnMgYXJlIGhhbmRsZWQgYnkg
dGhlIGRyaXZlci4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
