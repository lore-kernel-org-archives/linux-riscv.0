Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D6BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5YWr3fIoNdn50UXCmKsDPwKtBJvHszdOG3EMQFCXyY=; b=pp1ZfGYxpoY3HG
	4JY9SAJWfDCcP+amg/2RoV7rl8FU+Lpq+QneP3SMLYJrkD2sauJxOTL6O92Fzgy6uuYySy0S2+Lg+
	SIrxxdizppn5JEgYLhySn5U2DvU+7FsHeey9WUMFh8MMlDr1QZDbCdV4HbU+VsRKc7B2izo+DTxcr
	ICtDynJxlUDLictMVvyNFDinNLd+HgRDBgsDk9mSpHikTEG5w573JeBBO1O9E4mkFAmCHhzGSwN54
	UZa5Ym7T1E8n2LAVb4b7ii1xOWsNILRGnPiA3u1/15K+pR03VSQUDchEkGNhE46W3HGvhibGMn4v1
	yXQh7HjrnZtFd8itRgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbZV-009aE1-45; Thu, 16 Feb 2023 10:33:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbZR-009aAX-2n
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:32:59 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0FB833F71F
	for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676543570;
	bh=Dx3MYilqW2r7Vu1W8An/euV6qfs89+qFW9d0ePW+LXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l2Sz+Dx0ewqiqGpoYwwqDiv2O3pK2U4WB42UVg701Sf8OxJLoFkjMDJueAOSJ/5oD
	 kBFbMV+xEvCVehF06JOVZekt0PSBiSAgXalp3kXc66PrtlGGRzdL+qqDZ0AdO+wlYN
	 s/pkCAFIFENpND2KBJ1bEGVp91NFuv+noPgUk0JeiM03fy+SeU5/EiLoiN8HoOAi5Z
	 Xt7Wz5nNL8itaIAHtlMDTOA3BBf9VZ0SAGBljtLZPU6g91NMnRRFxOLVgwszv9TGRa
	 dY1QG3spxEhLzTnII+N2D6S8OKhzbuq2Pnxn4uN7bAGLsO9SDzgWGSLV+7bbfYT91F
	 QtPpmodrdpTGQ==
Received: by mail-qk1-f199.google.com with SMTP id x7-20020a05620a098700b007242aa494ddso896143qkx.19
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 02:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx3MYilqW2r7Vu1W8An/euV6qfs89+qFW9d0ePW+LXE=;
        b=5DPeaAnxpRMHS57FcwZqo0TsC28Cx2/cJhJ/dvUnBpA7Wp6ZBgfHc+BDAlPH13/kr6
         ju10W7BzfasvfuxY86JO2xk72E0RFm2P//WAdVksh1s9szYMKv3mH7/+whyDhDVX1wzK
         Ip2cQpAEnM7Y1WqaesmaLySci7kYmRVMr57rDv9AWk+bVbt8RW7Ph22wYD+0Si1nJHNk
         XERa24vKxn40cGyJ5gpOP2n6FfhF9AEvR3LMf0XU6VBZ5d2KaVVkiyBsW4kNOCxPpXxj
         Fv/nfcX2oauq1RP7HClA1WrZiO+ulI81j2dXnPsbLwfxps1ZwwnfGQhbRGoQ2FV2kd3t
         rVAA==
X-Gm-Message-State: AO0yUKWj4moU0tUwL27ogyDimaxGxCFt+6EWGN7KEtTAxOFhSwe24ZP8
	NIgSvGEN8pRJg37ETy6avtkdBsXUVt0aK81VoatUUg0kID/nMo38cEfBL0bLw4twvQzM9jYBqR4
	lTLpqoP6P2ix/C5yFkd8OoKszIZ0+VyaiPrDob14Jxo4Sz5GEK8L+Z7oIyVbHWg==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id y15-20020a05622a164f00b003bce3a8d1d6mr542988qtj.229.1676543568967;
        Thu, 16 Feb 2023 02:32:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+4xsIEJbTGPazez50zbEJszx4ibDQjWznUyLD8XYEgf0cX5nDZgAvCvsKEVYODY8nBGxetreYQTo+KIdL+fjs=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr542972qtj.229.1676543568686; Thu, 16
 Feb 2023 02:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com> <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com> <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
 <Y+38bT8cnahu19bw@wendy> <Y+4AxDSDLyL1WAqh@wendy>
In-Reply-To: <Y+4AxDSDLyL1WAqh@wendy>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 16 Feb 2023 11:32:31 +0100
Message-ID: <CAJM55Z9M2xgNBRxG8cNefGt5hn4fbZmgHWzC2e8AfmKUq9Gw7A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023257_548149_B9E7E518 
X-CRM114-Status: GOOD (  41.25  )
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

On Thu, 16 Feb 2023 at 11:09, Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Thu, Feb 16, 2023 at 09:50:37AM +0000, Conor Dooley wrote:
> > On Thu, Feb 16, 2023 at 10:27:17AM +0100, Emil Renner Berthing wrote:
> > > On Wed, 15 Feb 2023 at 15:04, Hal Feng <hal.feng@starfivetech.com> wrote:
> > > > On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
> > > > > On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > > > >> +       model = "StarFive VisionFive 2 VB";
> > > > >> +       compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
> > > > >
> > > > > Hi Hal,
> > > > >
> > > > > I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
> > > > > and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
> > > > > still think having these names match what is printed on the silkscreen
> > > > > makes it a lot easier for everybody. Even your own releases calls the
> > > > > boards "v1.2A" and "v1.3B":
> > > > > https://github.com/starfive-tech/VisionFive2/releases/
> > > > >
> > > > > So I'd suggest
> > > > > model = "StarFive VisionFive 2 v1.3B";
> > > > > compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> > > > >
> > > > > I haven't seen these "VA" and "VB" anywhere else, so if you don't want
> > > > > the version numbers and can promise that there will be no incompatible
> > > > > future revisions of the boards then maybe just drop the "V". Eg.
> > > > > model = "StarFive VisionFive 2 B";
> > > > > compatible = "starfive,visionfive-2-b", "starfive,jh7110";
> > > >
> > > > The version A board has reached the end of life. As far as I know, the
> > > > version B board will not update also unless there are some important
> > > > requirements and StarFive decides to update. Furthermore, it's too late
> > > > to change the compatible as patch 1 was already accepted. Will it be
> > > > easier to read if I modify it as below?
> > > >
> > > >         model = "StarFive VisionFive 2 vB";
> > > >         compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
> > >
> > > Oh, that's sad that the kernel will now end up calling the boards
> > > something that's used nowhere else, even by StarFive :/
> > > But yeah, I guess vA and vB are a little easier to read.
> >
> > Nothing has been released with that name so AFAIU we can change it
> > still. If you sort it out today/tomorrow I'll try get it to Arnd before
> > the merge window opens...
> >
> > I might've jumped the gun a bit here, I thought that it'd been changed
> > to what you (Emil) had suggested.

No, I'm sorry for being late here. The below definitely looks better to me.

Hal, would you be fine with this change?

/Emil

>
> -- >8 --
> From 4d44e8a83716d1caa314f25a95bd21ac8904909e Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Thu, 16 Feb 2023 09:58:22 +0000
> Subject: [PATCH] dt-bindings: riscv: correct starfive visionfive 2 compatibles
>
> Using "va" and "vb" doesn't match what's written on the board, or the
> communications from StarFive.
> Switching to using the silkscreened version number will ease confusion &
> the risk of another spin of the board containing a "conflicting" version
> identifier.
>
> Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 60c7c03fcdce..cc4d92f0a1bf 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -26,8 +26,8 @@ properties:
>
>        - items:
>            - enum:
> -              - starfive,visionfive-2-va
> -              - starfive,visionfive-2-vb
> +              - starfive,visionfive-2-v1.2a
> +              - starfive,visionfive-2-v1.3b
>            - const: starfive,jh7110
>
>  additionalProperties: true
> --
> 2.39.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
