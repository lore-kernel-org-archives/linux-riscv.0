Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83346C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6ceLoTRqfhUEgrMH3d+Y+fGvF9+dL/0QAqsnzJi3no=; b=NB+Xcf5XTsOR8G
	Licx/0z3NMiZ7uPq9Pb5MvnNntMjD5kY+8avLrJAvukO5MhUAdzBOPQQX1dVypf/IuLlTfHqDkfEj
	6JeqlVeyY4DEsKfYQzEOtpcUG4zepM4wDmmBvALEHQULDgRqy2+2A+aTRX2YVQkCbtx0sCp3r0zJR
	lH5BTfoV3jDfZuD3faXEnxa8LZIl3qU9cDI2PRClwD3B9s4bXgMjLO3cCGUvDDiYB6fFDT34Yqg7M
	TRirA5pnf42brYwGv+zCUMvS80WQyvDdcDwSUKJkXWIk5nkyE1wCutek/22S7PvXwdOxBSp1idRdF
	Z2ktAenT/cY2oqhlGxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKz6-003Ooe-2R;
	Fri, 12 Jan 2024 17:06:20 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKz4-003Onc-09
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 17:06:19 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-204301f2934so4174986fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 09:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705079175; x=1705683975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxDmPbTUZ80+lOlOzGwr67WCJ4FJvPU58qXtdfRO14Y=;
        b=T46MskL3s0EwiRgSBYsQqByVnRZpe3VCBMdieaLIPmE5CNna43xtMERmSMj1HuRaed
         M3uc0AEoX9kH7cZ8amx0WhmM0Nl2AyiPhEAGLJJ3HFmAomxP6kxU097Cmi9MTqWGOToa
         oUkpxvh2aPSBBSdVKo6SiEXP+MRwR6wG0lRmVZLlzymiBfXDK73De0vYsowEKDOs5EDN
         ZFmsD9mnfXO+onRp2gHOnU/caa/J+vtXa/ECsV+XFKHJX/xY6kWJPK9AFPmG27kWrx5Q
         zqV2l2rdQtUUj04tuecwlwAar4bFm/qLi4Zaas+xdaKp8cmLaMj+OzdzzHxfhKlhJsDo
         8tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705079175; x=1705683975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxDmPbTUZ80+lOlOzGwr67WCJ4FJvPU58qXtdfRO14Y=;
        b=TvV5gZ8P9tmmI3a2Tvoz0dEk6105T0Jdp/VyVVdRA/gAQNq9VaI3KPuIncpmSRuEPR
         0fr1rLl+Ynv2ko3+3EFFEApZCyM0Vl1T06s6UeEfrhM3lyj+kNwLXi1HLcaXZpBz6HUy
         2SMjEqvirrMa6NWjnaYeiVqBA+FK/+X8ch7M5viGVM+Fa84mA1mG/CzT0RcvIZOjXpvh
         ml+0du/aza7LneG5qcfSIQHYBJmcjHubCkybWNYTRPlQdUSPF1PCxaz8EwH3IzXWfWko
         kk5y7yYsIyjuFyeQEbnoHaymrYm9ntc8eLlfj5zYagAWaXkMmyaVdyGMbqzQeD2P6AKO
         ioZA==
X-Gm-Message-State: AOJu0YwbjD4JL3ipA6vaceSN/4eHwSmrNGYKQWcZ13q2D3BY0XtqF2if
	xp9ZSy4n6BepVi7ugoxSqFC8cBE9bafcN7A08Xs=
X-Google-Smtp-Source: AGHT+IHJs7Sb6cRG8FtEN2BTrbb3u51J7kM7B9co7sQh7KIPYGKioMWBlt7G2jC3jaUY9GU6LXslcm+q7S40rx3lBCA=
X-Received: by 2002:a05:6871:413:b0:203:743e:ba22 with SMTP id
 d19-20020a056871041300b00203743eba22mr1879464oag.89.1705079175449; Fri, 12
 Jan 2024 09:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240112142621.13525-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYCPR01MB112699FAB53E6E4647893516B866F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112699FAB53E6E4647893516B866F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jan 2024 17:05:48 +0000
Message-ID: <CA+V-a8smkiub9ACDsqxv0z8yF_iLVEXG2OHwS7iJ+tmsdmTQ6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing
 port pins P19 to P28
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_090618_080496_9E909777 
X-CRM114-Status: GOOD (  11.29  )
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

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIEZyaSwgSmFuIDEyLCAyMDI0
IGF0IDI6MzHigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Ogo+Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
PiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPgo+ID4gU2VudDog
RnJpZGF5LCBKYW51YXJ5IDEyLCAyMDI0IDI6MjYgUE0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2NCAz
LzRdIHBpbmN0cmw6IHJlbmVzYXM6IHBpbmN0cmwtcnpnMmw6IEFkZCB0aGUgbWlzc2luZwo+ID4g
cG9ydCBwaW5zIFAxOSB0byBQMjgKPiA+CjxzbmlwPgo+ID4KPiA+ICsvKioKPiA+ICsgKiBzdHJ1
Y3QgcnpnMmxfdmFyaWFibGVfcGluX2NmZyAtIHBpbiBkYXRhIGNmZwo+ID4gKyAqIEBjZmc6IHBv
cnQgcGluIGNvbmZpZ3VyYXRpb24KPiA+ICsgKiBAcG9ydDogcG9ydCBudW1iZXIKPiA+ICsgKiBA
cGluOiBwb3J0IHBpbgo+ID4gKyAqLwo+ID4gK3N0cnVjdCByemcybF92YXJpYWJsZV9waW5fY2Zn
IHsKPiA+ICsgICAgIHUzMiBjZmc6MjA7Cj4gPiArICAgICB1OCBwb3J0OjU7Cj4KPiAgdTMyID8/
ClRoaXMgaXMgZG9uZSBiYXNlZCBvbiB0aGUgZmVlZGJhY2sgcHJvdmlkZWQgcHJldmlvdXNseSBi
eSBHZWVydCBbMF0uCgo+ID4gKyAgICAgdTggcGluOjU7Cj4KPiAgdTMyID8/Cj4KZGl0dG8uCgpb
MF0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtc29j
L3BhdGNoLzIwMjMxMjAxMTMxNTUxLjIwMTUwMy0zLXByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbS8jMjU2MjUxMTgKCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
