Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2531C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6CQ+HCAeDKAkKLGJPBSqpxp1z/jY+a0cQVwEu80XhE=; b=sUW0EFKzG+6QBe
	1LLZoU5gEftFzCs/vV50SCL5rr+/JWJlj1BUma4QqDAs305hzukbhMysL4/qqJP4UtstJmWwT7GXu
	eMtGjzAzVAdPcJurNrbROSBKOu/2/JKA5c8SPzwVfJSI0jXvGId1eb2aauFjTwTvyy4xs1mgfq/17
	bpf9mvCtDRJblljBK/lQ1v9cedBjd9nFXLXsa8rqDkm8RkxY138dPg+R3KVywAeo3rjRHdVSSwTid
	hZc7A53dS4kBS8JutDiPI6ysXtPkO9Jc9r0g97zOcEiYvKURfAMJBtTAvKoANVjbBla9EKpY85WLg
	ZJKoYNFt3W+QRDAfGYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrVj-001JPC-0P;
	Tue, 15 Aug 2023 10:42:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVrVf-001JOb-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 10:42:49 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B4AA43F314
	for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 10:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692096162;
	bh=duOk3LgELGIF/UgXORRXxO9gqyMTzaSEm/w19zx7IRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZMmbHzXC+P+6ETU5BwJez8D/7ORGFr17t2CknIpECNcrBZ5bStuOTxwtdt0fTRMl8
	 Qef0lVkEyxfIerMG6E0eYXC6lA71O7TACF7bbaAgYKpK8pSEXsErcnA9fZ/T8xiZBf
	 8qR3Aiqz5YvaNikKKyaKa3Mda1W4BmPubXXCg5YnYuMMEdyTQa4jf2SOMjFR5Q634H
	 5lnb+Rj2sWrbW4ZRpSZ4stPC50YRjOBO8omGNPLvUspsJceo1ZPyXrZ0LorjjX7Lxh
	 //ISON/wQUbnJt8b/BHKWfwm99/XXs8sMRVlB3qpAJ0I3I8kw+/PSu/4g7ZykxunLf
	 S4Fl6vIt/NBAw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-40ff2434811so56761111cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 03:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692096161; x=1692700961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duOk3LgELGIF/UgXORRXxO9gqyMTzaSEm/w19zx7IRQ=;
        b=MSSbrAIi8dGLh8F88rYHP5ln28q7X/GYpDZ5hx8VcE/KozOZmJics4CFJ4N3uPSSax
         pTKYKON2yHL3GQzivY3h3zbvc5K6ZSCnODjDbvxsDFfKJVowBD/D7m5io8+CMY9qfGcE
         eXqdxuE4MeEGfYcRHMAD5Kxtk1UnvrQsVQXgYYr06m9LjGY8F6btyZrDoBOrZTZsF1ED
         ECz6LOzsIP6hN3FiVA6jXOxzbYWgoEefgHoKkD/Ng9OwCSvp12uLX5w2TWpWW6ZLESC/
         5EWn1vudVjv5ESNx4awzuG5Nj2Le/I3PR5pPZcmamz8ON1tjDY1HN4NQjN9xsHqknhFO
         bdKA==
X-Gm-Message-State: AOJu0Yw4TWiDJZEHVO3hVFTxbuHuwu53GG56AbxlgHfW1krq2MCtHHce
	w0IvLGwiO1fugw2GK+CyLpDzMGuQzenXilOj7AZslM4UEO0rO5Im3Ubn/rUO+MdzCIlQkjwQngC
	6oDN7mlnlbmAqXSJUXg8FsvDMxtWI0c0BZNlnDl2cJtxHSeNCPRdlekDQic2l79LP+5wkGd/kax
	s=
X-Received: by 2002:a05:622a:1489:b0:403:acd3:e90e with SMTP id t9-20020a05622a148900b00403acd3e90emr15343608qtx.48.1692096161633;
        Tue, 15 Aug 2023 03:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWcUU2g9tQLwLDiJjpVe4lUVMp4mj0HTyk4i3cpbp3El3GAlSJv3T6rlhMIKt96CAkIN2WcptNdyzpfq8sQw=
X-Received: by 2002:a05:622a:1489:b0:403:acd3:e90e with SMTP id
 t9-20020a05622a148900b00403acd3e90emr15343594qtx.48.1692096161369; Tue, 15
 Aug 2023 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230815-scurvy-jujitsu-4fced586cffc@spud>
In-Reply-To: <20230815-scurvy-jujitsu-4fced586cffc@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 15 Aug 2023 12:42:25 +0200
Message-ID: <CAJM55Z8moyAcmQWZV0TyP-XO9fMN5_inDk-vtmDkuqCYic_-4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: fix jh7110 qspi sort order
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_034247_893605_126EDDC1 
X-CRM114-Status: GOOD (  15.03  )
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

On Tue, 15 Aug 2023 at 12:38, Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Emil pointed out that "13010000 sorts after 12070000". Reshuffle the
> entries to be in-order.
>
> Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthign@canonical.com>

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 38 ++++++++++++------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 9aa563898868..e85464c328d0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -676,25 +676,6 @@ i2c6: i2c@12060000 {
>                         status = "disabled";
>                 };
>
> -               qspi: spi@13010000 {
> -                       compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
> -                       reg = <0x0 0x13010000 0x0 0x10000>,
> -                             <0x0 0x21000000 0x0 0x400000>;
> -                       interrupts = <25>;
> -                       clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
> -                                <&syscrg JH7110_SYSCLK_QSPI_AHB>,
> -                                <&syscrg JH7110_SYSCLK_QSPI_APB>;
> -                       clock-names = "ref", "ahb", "apb";
> -                       resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
> -                                <&syscrg JH7110_SYSRST_QSPI_AHB>,
> -                                <&syscrg JH7110_SYSRST_QSPI_REF>;
> -                       reset-names = "qspi", "qspi-ocp", "rstc_ref";
> -                       cdns,fifo-depth = <256>;
> -                       cdns,fifo-width = <4>;
> -                       cdns,trigger-address = <0x0>;
> -                       status = "disabled";
> -               };
> -
>                 spi3: spi@12070000 {
>                         compatible = "arm,pl022", "arm,primecell";
>                         reg = <0x0 0x12070000 0x0 0x10000>;
> @@ -767,6 +748,25 @@ sfctemp: temperature-sensor@120e0000 {
>                         #thermal-sensor-cells = <0>;
>                 };
>
> +               qspi: spi@13010000 {
> +                       compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
> +                       reg = <0x0 0x13010000 0x0 0x10000>,
> +                             <0x0 0x21000000 0x0 0x400000>;
> +                       interrupts = <25>;
> +                       clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>,
> +                                <&syscrg JH7110_SYSCLK_QSPI_AHB>,
> +                                <&syscrg JH7110_SYSCLK_QSPI_APB>;
> +                       clock-names = "ref", "ahb", "apb";
> +                       resets = <&syscrg JH7110_SYSRST_QSPI_APB>,
> +                                <&syscrg JH7110_SYSRST_QSPI_AHB>,
> +                                <&syscrg JH7110_SYSRST_QSPI_REF>;
> +                       reset-names = "qspi", "qspi-ocp", "rstc_ref";
> +                       cdns,fifo-depth = <256>;
> +                       cdns,fifo-width = <4>;
> +                       cdns,trigger-address = <0x0>;
> +                       status = "disabled";
> +               };
> +
>                 syscrg: clock-controller@13020000 {
>                         compatible = "starfive,jh7110-syscrg";
>                         reg = <0x0 0x13020000 0x0 0x10000>;
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
