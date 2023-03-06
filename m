Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8292C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uS2E1wAd+o01hR/BkNjApVGcEV0QuLGHi0bcW1zhrDY=; b=3kledhDeZHIc5S
	X3HonAzap+f2OECKIsTah1sU5rFvX7XBAj2myeYegIwCiWkD+1vMRHF5RXGf19lutEnW/hMWpjzru
	fUVonN0lZRlwPTiJNSjKSpsV7+VBNZlQB4jA10cTobOWxB+lztV96p9vbCuY4Ew6sja+4HwXjM2Pz
	auMrgE8ZlUE6BFgFVaIP204vTIrTXPQeJ2y07ljNRvX4ET+KaWNdTi3vMUkg6jDt6hesqgh9sK9Lc
	8LckoBW0zskyA6YzwEEk2pjtxpYoHaCXxu6YXB9uaHxKIMIhp61wA20jZ3kDi4gJ4FxQRmjFXMzzz
	fhGgGBlwuoxt/HZQofFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZASL-00CmmH-D2; Mon, 06 Mar 2023 13:00:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZASG-00CmkX-QC
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 13:00:43 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C6AB43F04C
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678107636;
	bh=g1eQhMOrSFO4wd2eOSO121iAVcPyIcQf7Ea6EkfWiqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QucJMJ2k0oMKUVG2GR+pcK1mTEfAaC4amU1rAT4RUP0wXgrH5n+FTkkUctr/ojieP
	 c5g0AXNO5EexhT5IAoVwknHykA8fKztFb3WPpL9zUcqCtejldetP2oaUhwVoBg5m+2
	 wspX6kyVDV8eodHmITtYbKCkKc5nCWKeZ48+g+0HgvTOHTi9N1jZKPVmQrCjN/47a6
	 IRYaIckI3PmXCE4oHI6QuwmdK6fa619898uKTNLvtW0lf34wF9ttCzVl3sMINR6HIu
	 LYCsa3HB8GqvbJ/YWafZDo3dI6KjFq4zo7Otx4A2ogfGS+WNpDvBumY0jsuZAXANdZ
	 WiE4/ao+/E0YQ==
Received: by mail-qt1-f198.google.com with SMTP id g13-20020ac8124d000000b003bfba5d76a3so5114111qtj.15
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 05:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1eQhMOrSFO4wd2eOSO121iAVcPyIcQf7Ea6EkfWiqI=;
        b=UoPCBUOp29uGirMjR0IYTQ8DuK3KF2e6XfPQQX96iCIzjXH+aMvwWV/o9kg7yy04JD
         9APmrAZ9vNeaXkLtvH2i6zlrCcBgbF2r/P4MMI3yjzF3A6oTf+3WBg+w+4lKhPW68J2u
         +1QMVMPB/y0DpRF3wbOIkCDp6FySoFa5BmvASPrZ4ACAz+EiT6z59KRNirw/cgMTRTlw
         /zHyv74liFYdv3/5SbPJU9hjLDQBc3rZx9A1Eqb89OtUqRpVJgJuUoejX4P5LZt6L30s
         ql2/u67WaQz7k6lNrv0GbSe6tAJmlamj4seyY3Zqa6qvKJ9lJWm5F4BQwJkbVfMEdT/7
         AXQw==
X-Gm-Message-State: AO0yUKUSQV3MEfA2v3Ho7px0an9e55GQYiQD4Hv5b+7XGPv20hgVF0gw
	umlQtT+YHTtkVwhgYk4m6V+NrUUt8iWrQCEfqADQ/0I4Eg8LTD+dI8IfnSI9O5vAW/byhHYaycp
	mTVuZ4vwBJL45C+zKji+xvWOG0PGJbPPUzwaJhegGEHIj5JjJaZpE03RCxeGnxA==
X-Received: by 2002:a05:6214:18c4:b0:56e:9089:a447 with SMTP id cy4-20020a05621418c400b0056e9089a447mr2641922qvb.0.1678107635904;
        Mon, 06 Mar 2023 05:00:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+uStpOIPtxsYzQNm4+Hh42VAU2TMK0ufly6uRcEDKQLOkg3C1RgTzTQxXlU+P3QnMKJ7/YkQrtQAk9jtb28zU=
X-Received: by 2002:a05:6214:18c4:b0:56e:9089:a447 with SMTP id
 cy4-20020a05621418c400b0056e9089a447mr2641907qvb.0.1678107635636; Mon, 06 Mar
 2023 05:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-12-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-12-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 14:00:19 +0100
Message-ID: <CAJM55Z_8m42vfoPDicTP18S6Z1ZXYbFeS1edTjzYVB3Kq2xFeQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] riscv: dts: starfive: visionfive-2-v1.2a: Add
 gmac+phy's delay configuration
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_050041_198233_3F072AD4 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, 3 Mar 2023 at 10:01, Samin Guo <samin.guo@starfivetech.com> wrote:
> v1.2A gmac0 uses motorcomm YT8531(rgmii-id) PHY, and needs delay
> configurations.
>
> v1.2A gmac1 uses motorcomm YT8512(rmii) PHY, and needs to
> switch rx and rx to external clock sources.
>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../starfive/jh7110-starfive-visionfive-2-v1.2a.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
> index 4af3300f3cf3..205a13d8c8b1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
> @@ -11,3 +11,16 @@
>         model = "StarFive VisionFive 2 v1.2A";
>         compatible = "starfive,visionfive-2-v1.2a", "starfive,jh7110";
>  };
> +
> +&gmac1 {
> +       phy-mode = "rmii";
> +       assigned-clocks = <&syscrg JH7110_SYSCLK_GMAC1_TX>,
> +                         <&syscrg JH7110_SYSCLK_GMAC1_RX>;
> +       assigned-clock-parents = <&syscrg JH7110_SYSCLK_GMAC1_RMII_RTX>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_RMII_RTX>;
> +};
> +
> +&phy0 {
> +       rx-internal-delay-ps = <1900>;
> +       tx-internal-delay-ps = <1350>;
> +};

Here you're not specifying the internal delays for phy1 which means it
defaults to 1950ps for both rx and tx. Is that right or did you mean
to set them to 0 like the v1.3b phy1?

Also your u-boot seems to set what the linux phy driver calls
motorcomm,keep-pll-enabled and motorcomm,auto-sleep-disabled for all
the phys. Did you leave those out on purpose?

> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
