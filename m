Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33955C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoFJes6WDAJBDznROEKvh+aNzwjhcrqZbaPll9e/cjc=; b=SRZVLVS10oSwaQ
	bUPXcZ4MpUWluY/7LGo23/hAvaXZbUDGONZUxy6p+fl4QNUkN0Vho00GpHTunv2muDEdlgtQ49wUP
	ezxtaXWiGoq0P3n5bMrgwmCxiBTD9F0g+UVdUfpbNyu4vmx/9ZlvX3rT8wcO6FUN0A+O90kJ93ydg
	NGPjjO7hxn3ogFaZYyatBdw6oQkvwyz8ownAzP156WO/G4D7Ugz9+J/NI7SdRvsAPO5WOUVcdHWxE
	fw5Fz6OElBgkmnI+xh/D7qIkkkPcIKUnulDurVqtgO8qrjzMwuxGJO4CKA9y/Yy3Iv+z7v+Y6pF67
	DXXiv0aWwYFok49vdLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaYS-009FI5-OK; Thu, 16 Feb 2023 09:27:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaYO-009FEq-K3
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 09:27:51 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 406BE3F581
	for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676539661;
	bh=YtSJffCXpHu3ueJ8PsUTFVvEARiCiygu2497e6lu3sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CeUzaLgpI0J1mAKHraUXg8X+aNq2zKtRd126ADJ4cV+L9dS2SMuwOFwkbopCM83Hc
	 XOoSH96u+FsPu+VIekHQtQgLECYYUBzOnKG35N8ag6okHpSHatTGNMkJRIBwJ8qetM
	 2tnLY2fN8M/QKX+8KrUHakvvf/Yhh6NAd1F+t8sWssDzj5sd4rmVrgHlswAf7ZvuQi
	 6D+iNVvJdYMOb51abfGCy+n4vovlWPvnZfPGnTGnQETchHLSSOH+21toXkoMy+ioTR
	 txVZQTPR9RlW896CqUFXcwvOQ8zJsrenb9YUAbksSHlR5e0vS4WZKO3zT96R2WlEOu
	 SQ/ePWTt7H7qw==
Received: by mail-qv1-f70.google.com with SMTP id 98-20020a0c806b000000b0056c2797aa8bso787684qva.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 01:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676539654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtSJffCXpHu3ueJ8PsUTFVvEARiCiygu2497e6lu3sk=;
        b=X5Nkwq9LGKc7MpNcFONdQOK1bvUMW2HU3s2+VquIlL8CjpUJfAhwdFzTBttdAFSmxa
         Ses+8e/4cTLZrcSUPDmi9FGWtH6rFR6NgqgO3MTHHK186gJqrIpJP24utAlmuN09vzHp
         9hOVo8TMpd4HJqDOlQpTNz2S8SnChgRXD/77YrSesfIGkIz54ftxYoV+IsDIJ8AwFc0Y
         jMasH1ra4NdQxwkyo9RXnzwGnnreXX/rqfHzNmm/YNCItwV9tGQ7emZN2Lo75QCTL6+q
         U0ffFH2xEel+pjY4HHq41ZXTFPuKUOPXva0U+jVdz+HdqlrV+rcq9ZTOISy2Nf0kRwuX
         kJrQ==
X-Gm-Message-State: AO0yUKVTl2iE/xhTaWIsj6iIrbdnFVJubZtaSwFOSD7O2Fb65sPRI44B
	IJP7TuCQI0pGoiO7sgUbcYX76B2u5OFtacFVFsNI5ee5WQXG1Hyg/ZtsancTzwmT28IRfVgwEbg
	XcePX6XgIcpvCAMF5UoFtcQdlCb3cuFszx/kW7gfJxc63aixY9DKq3Teg9J0KGdvJ/tI=
X-Received: by 2002:a0c:aa99:0:b0:56e:9a77:3d2c with SMTP id f25-20020a0caa99000000b0056e9a773d2cmr423868qvb.5.1676539654701;
        Thu, 16 Feb 2023 01:27:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+gOh5M+60vN2srtjtTI82UUYYfTQ40fizvaxdbVgr7R/vjEXOgtRRd+V8bdRCq8Uk/39SmMqfAZgINDo1mvAo=
X-Received: by 2002:a0c:aa99:0:b0:56e:9a77:3d2c with SMTP id
 f25-20020a0caa99000000b0056e9a773d2cmr423864qvb.5.1676539654466; Thu, 16 Feb
 2023 01:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com> <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
In-Reply-To: <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 16 Feb 2023 10:27:17 +0100
Message-ID: <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_012748_829981_EE3F04BA 
X-CRM114-Status: GOOD (  32.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Feb 2023 at 15:04, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
> > On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wrote:
> >>
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>
> >> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> >> which has version A and version B. Support booting and basic
> >> clock/reset/pinctrl/uart drivers.
> >>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
> >>  .../jh7110-starfive-visionfive-2-va.dts       |  13 ++
> >>  .../jh7110-starfive-visionfive-2-vb.dts       |  13 ++
> >>  .../jh7110-starfive-visionfive-2.dtsi         | 111 ++++++++++++++++++
> >>  4 files changed, 138 insertions(+)
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> >> index 0ea1bc15ab30..79e925a4a227 100644
> >> --- a/arch/riscv/boot/dts/starfive/Makefile
> >> +++ b/arch/riscv/boot/dts/starfive/Makefile
> >> @@ -1,2 +1,3 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
> >> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-va.dtb jh7110-starfive-visionfive-2-vb.dtb
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
> >> new file mode 100644
> >> index 000000000000..188d3fddbe88
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
> >> @@ -0,0 +1,13 @@
> >> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> >> +/*
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +#include "jh7110-starfive-visionfive-2.dtsi"
> >> +
> >> +/ {
> >> +       model = "StarFive VisionFive 2 VA";
> >> +       compatible = "starfive,visionfive-2-va", "starfive,jh7110";
> >> +};
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
> >> new file mode 100644
> >> index 000000000000..f75c10536f84
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
> >> @@ -0,0 +1,13 @@
> >> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> >> +/*
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +#include "jh7110-starfive-visionfive-2.dtsi"
> >> +
> >> +/ {
> >> +       model = "StarFive VisionFive 2 VB";
> >> +       compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
> >
> > Hi Hal,
> >
> > I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
> > and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
> > still think having these names match what is printed on the silkscreen
> > makes it a lot easier for everybody. Even your own releases calls the
> > boards "v1.2A" and "v1.3B":
> > https://github.com/starfive-tech/VisionFive2/releases/
> >
> > So I'd suggest
> > model = "StarFive VisionFive 2 v1.3B";
> > compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> >
> > I haven't seen these "VA" and "VB" anywhere else, so if you don't want
> > the version numbers and can promise that there will be no incompatible
> > future revisions of the boards then maybe just drop the "V". Eg.
> > model = "StarFive VisionFive 2 B";
> > compatible = "starfive,visionfive-2-b", "starfive,jh7110";
>
> The version A board has reached the end of life. As far as I know, the
> version B board will not update also unless there are some important
> requirements and StarFive decides to update. Furthermore, it's too late
> to change the compatible as patch 1 was already accepted. Will it be
> easier to read if I modify it as below?
>
>         model = "StarFive VisionFive 2 vB";
>         compatible = "starfive,visionfive-2-vb", "starfive,jh7110";

Oh, that's sad that the kernel will now end up calling the boards
something that's used nowhere else, even by StarFive :/
But yeah, I guess vA and vB are a little easier to read.

> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
