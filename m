Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840CACA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RLesBE6Zy+JAwOj7DMPxzlp2cghisEO112O32cxKEk=; b=J24D9EhSiTjvBd
	Y+gq5RIqrhEuxlOYKG4pXweW48Q+Bkpmyto5srEOQuMwlKj76iPgAO6Ri2N6ZG/ftQKQ7BFegBT5+
	XPbYTvvx4Pem5hlBGMWTLuhUVwsOTzZSgnX7U4PP2l9nHbyfwIdnCo4v0EuxG/FEJPkRAYe2UyGQs
	AJx4vn7FWUgXmcDd9pf+ja+FHuNFMVtKseJdR/nd48eMeCv+3sEk9VymL8vcWZYa1WY/qTfNnceF6
	APwX6vgbNq6DexGNyiw2z5GmaVxxI5AXCy2siz/QBQ5wlAuTMwxI45iZ74jHx8wxI4ymFt7unCBJW
	lVGaxg+UpumnkScw1mOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzL9-00Gfkn-1D;
	Fri, 01 Sep 2023 08:17:15 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzL5-00GfkO-27
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 08:17:13 +0000
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7b8d2631fdso1332908276.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 01:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693556227; x=1694161027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdHaDXHtYr3ML3gRgEjVJjdfXKNvKOVFfI7tWyAzqws=;
        b=WIoeNSaxmfy2MyejCy1Hp9z/yZQ5C+KjUrsKj0FLxlY6/EfJTvryiYP2Z+52C71ROe
         UzfcMn++pHIiRU/yS4+KT909OTN3095EfmVp+b3jVp/J/A+oT0USJZoLgaPYhDedq2uX
         ksNrCSrenjoRvMkXPiwmNh831Di2hsQzIymder2ePdfDUQ1KJWnNKCcJ1IFy4Z2r5KHI
         5sa6vWpJy12aN5UaYmwBnLr1kuvyhX5zqSGbQZKPiiwXJYwK0gjilmwM4C0clcMqmoEd
         EprSIeKTRQEQTwEmCKeF97oeQBUHavh3hV4l1XfokmbpOwVh6xIvNRPGUqi4tenw/rPI
         CpaA==
X-Gm-Message-State: AOJu0Yyp2ZgGyLomlEJXi5HTKmJSrcGe6ELEM+aaqwcDz8Z4EBhiJmcb
	VJvAvQRPdCuYdI449x/yjw2qY4LYwfu3KA==
X-Google-Smtp-Source: AGHT+IHrj6BNO5R41Ql2d/Y1EieyE8kVAwjevdwRMHO/Gss3H+liptR8tCxikN1gZ9Ap6wlk/b/6MQ==
X-Received: by 2002:a25:bc07:0:b0:d78:19de:76ee with SMTP id i7-20020a25bc07000000b00d7819de76eemr2136284ybh.62.1693556226918;
        Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d184-20020a254fc1000000b00d687cf69599sm784687ybb.52.2023.09.01.01.17.06
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7b8d2631fdso1332885276.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 01:17:06 -0700 (PDT)
X-Received: by 2002:a25:bc8c:0:b0:d7a:d923:4493 with SMTP id
 e12-20020a25bc8c000000b00d7ad9234493mr2039914ybk.64.1693556225863; Fri, 01
 Sep 2023 01:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230901075932.105822-1-biju.das.jz@bp.renesas.com> <20230901075932.105822-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230901075932.105822-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 10:16:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh7TLORPJQBtX+8wisVeFEGwVX8+p_xxNmAsA7e0zU8Q@mail.gmail.com>
Message-ID: <CAMuHMdWh7TLORPJQBtX+8wisVeFEGwVX8+p_xxNmAsA7e0zU8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_011711_721085_9608252D 
X-CRM114-Status: GOOD (  15.93  )
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

T24gRnJpLCBTZXAgMSwgMjAyMyBhdCA5OjU54oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToKPiBFbmFibGUgUmVuZXNhcyBhdDI1cWwxMjhhIGZsYXNoIGNv
bm5lY3RlZCB0byBRU1BJMC4gQWxzbyBkaXNhYmxlCj4gdGhlIG5vZGUgZnJvbSByemZpdmUtc21h
cmMtc29tIGFzIGl0IGlzIHVudGVzdGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+IHYyLT52MzoKPiAgKiBEcm9wcGVkIHN1
Ym5vZGVzLCBhcyBhbGwgcGlucyB1c2UgdGhlIHNhbWUgcG93ZXItc291cmNlIHZhbHVlLgoKUmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
