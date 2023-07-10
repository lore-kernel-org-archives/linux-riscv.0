Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877CFEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyC9+wTCmJUdEwcLWOFdMRJIlFIzRccKc2QymvnGu6U=; b=lCiuwboilfrYR4
	wEEtGGlO+kcz9eSRVtqu+rwOdNjaoLHW4wScUVxtWxZgIwg4o5ysoNlYIRWQ2o8Jn5cj4B8EVUUtN
	atTSeCeHfP0O9QDuXEFt2pYVNmP8HxnLnTjSAhYYf1xMFjHMHcDw7amx/waQ0LrF10pYF9NE8BpFR
	PPwebbmpVzwhHUTAJ/RGYJBmEvLwn7jI6QzW+YK+DicKqsdxv75jPPBgiZqsEenbpp4V+c+yq2nLO
	lo10oOcX67cYQobTUObrLMFwByb91RVfCgEm2z2189o+aDxfHIdSfJlJlgOsiJF/ktuIkEC/a3fe2
	Zq0ptLTN+j0KCr9BSTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrlj-00Bs9s-1F;
	Mon, 10 Jul 2023 14:21:39 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrlg-00Bs9J-1u
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 14:21:37 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5704fce0f23so57553977b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688998895; x=1691590895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBgv4VDyK5Qpjwf08U4WRFtQUEIQXzacdhbznuzNbE4=;
        b=NaM6axmHl936FbI/CdqBeYHkRxGZsTQHOeEO85GzQi/VeFVEYNFbqpBrAeMVmcnHHM
         dWfmdhKDbWMkvvpFcQRwOrq/gWy5nBuF+bfvpzLZWQ/lp6FeODvofq9NcuwiXp5y1BjN
         Pu+q2ZgE0a9ISKvx/GoWnKT44xaCwZU9jNXrIlj3nM1p4+NZg3OLpqnM8uh9fSZRrzYT
         LRbcTWcPJ6Z4xkokppQ08NRirQPZ7N5Xz7wyqHMZzUL0biqYOq0NlsZ9ucup4b7uyEuN
         krevmrgK5nEC7M9ywLHBaPs3gQc1+UG1JdfF5QQVlLSy5+E4VCayyvaCpMDjvqH4wGJT
         FClA==
X-Gm-Message-State: ABy/qLZl0QvAzN7hzU+qmhEaaUw1Oh+lskLJh4xqY7tJos2B6GgYatm2
	31MzDG+o24AuwRaiARf+/TPFb9dEF94w3g==
X-Google-Smtp-Source: APBJJlFqMwa79MykCoaUGrafEGJ47eg2Pn7DflFoRTp/GL5Ytg8egD9Nl9gBBzO1brrT7eD/9t7Diw==
X-Received: by 2002:a81:7189:0:b0:579:f5c2:b16e with SMTP id m131-20020a817189000000b00579f5c2b16emr13549250ywc.31.1688998895295;
        Mon, 10 Jul 2023 07:21:35 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id t128-20020a814686000000b0057a68b6c2f4sm2007143ywa.133.2023.07.10.07.21.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 07:21:35 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c4e4c258ba9so5575202276.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:21:35 -0700 (PDT)
X-Received: by 2002:a5b:d02:0:b0:c13:aca0:b713 with SMTP id
 y2-20020a5b0d02000000b00c13aca0b713mr11344591ybp.1.1688998894843; Mon, 10 Jul
 2023 07:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230630120433.49529-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230630120433.49529-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 16:21:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEYfBS8018BsVnYRj0+2VMY2QWnZnBB+ATfKPuAuJmMA@mail.gmail.com>
Message-ID: <CAMuHMdWEYfBS8018BsVnYRj0+2VMY2QWnZnBB+ATfKPuAuJmMA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_072136_652958_751C2C53 
X-CRM114-Status: GOOD (  17.56  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMjowNeKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE9uIFJaL0Zp
dmUgd2UgaGF2ZSBhZGRpdGlvbmFsIHBpbnMgY29tcGFyZWQgdG8gdGhlIFJaL0cyVUwgU29DIHNv
IHVwZGF0ZQo+IHRoZSBncGlvLXJhbmdlcyBwcm9wZXJ0eSBpbiBSWi9GaXZlIFNvQyBEVFNJLgo+
Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJq
QGJwLnJlbmVzYXMuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaQo+IEBAIC00Miw2ICs0MiwxMCBAQCBjcHUw
X2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiAgICAgICAgIH07Cj4gIH07Cj4KPiArJnBp
bmN0cmwgewo+ICsgICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDIzMj47CgpJcyB0
aGF0IGNvcnJlY3Q/IFlvdSBvbmx5IGhhdmUgMzIgbW9yZSBwaW5zIHRoYW4gb24gcjlhMDdnMDQz
dSwKd2hpY2ggdXNlczoKCiAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tcmFuZ2VzID0gPCZw
aW5jdHJsIDAgMCAxNTI+OwoKPiArfTsKPiArCj4gICZzb2Mgewo+ICAgICAgICAgZG1hLW5vbmNv
aGVyZW50Owo+ICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47CgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
