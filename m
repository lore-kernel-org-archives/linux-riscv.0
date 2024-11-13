Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF277D462C3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbU84BpLKIqf5+4mh4eBepyMPwCmMEi+1ZTotRaD8A0=; b=NJLR/xVrHLRtq6
	/fTCvoC3BhJdmBf+ONgbMqR9YjtwsiWnhzJuGw7fB7kUg1gZQ/5AGmjwCeYzxdRiU9IG3dcTIUkeR
	S9xOunQpvheKJ4DObuCaodZ/2Q/XhHHfPhml39x59ngolgeuU0IUEBX37BK37oC7uKUJHNC3b2xn7
	VdCub2Uvf6e/pS8aLcTyqNHlhgyb2C+h/uNa6hPCv/+AIRZJspc8uYx5LAoBh/ilfB7opV4zETheE
	zOd6VvVnP5d9ewKoWhXGbDP1DZ52MlPeb7mAoXpkfVZIJAhfWCNYc6eSAqS9prDddhk1Wv60uaUO/
	EelqNupDVASaRUi5AauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFLQ-00000007JLL-3SAO;
	Wed, 13 Nov 2024 15:31:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFLB-00000007JHc-3g6V
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:31:36 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B21233F2BD
	for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1731511888;
	bh=QlPgmr9lfODDlfP2omT7i0R89fEaKNKJt4cjbSvbt1E=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type;
	b=b/FbUQUsTtgFbc0PvxQjPi9j3kj5AoDPxZuB0MYmfVxEsLqDUvJ/paNCpLTBh/FiI
	 +iROOw8R90RlCcsXOHsAIae+NAI5ETUaEra2D0g5Z2RkDimbgM4E5Bu8wpl2hDIgZY
	 s4EOoyb/nPBjVKqzaLCiKsfo8xR48ElOIWJ5qKiXnCDsnLwvGK5E3FbV51NVE0UxXL
	 FTcCSgN0oTwIUug5y+szH6rU1a/IzalbueiqdeseNSa36/UbhM58EnQCnXjLEv+X2b
	 mvTk9rJsVxgtu6UaPbagTX96qGR3aq47bG4lNiaXhzEFz7okJ+CjmUew4C2HOqbRqa
	 EJWjXm6auaf8g==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-290b3fece73so6841233fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 07:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511887; x=1732116687;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlPgmr9lfODDlfP2omT7i0R89fEaKNKJt4cjbSvbt1E=;
        b=nWuGqcJmOkztYcx2wuOG+Tjo3AwwjqfzQKN6iQkDZO473DOkSOeeznIwCuxDUVWHrM
         hjSlleVpb3qz91qqgjYClaJMSg9ztHxAN/yM/FiZgVz1yyT3UjgEXsWHmNe7MWyzxFYM
         7BdXhSTiNiKhOcYZqG5LDXu1eizT04+L07XpcEot5XAn94qWZMkfv9E3zJsDR1oGT4CM
         UY/FpMbCNZde3fNhcqf/fnCkgnWvvQLYhtP/NT3tEKyhadGbzfYLbRHuSXqKOhQRQNt0
         n2EFzPmQens4n6aJxq0Tk4u6VpxjFJX+RZDYL3u/kH9ff6HGxkZSzSrSw5/2sOGow/A9
         RDsw==
X-Forwarded-Encrypted: i=1; AJvYcCUgZWMtJ7PvXjUmRvyZZOLkDvJqjjIvWOAWAF53EzYWBGvkEVg3vFqtRD7Bl1xbwDwy2SezykEhGfXxEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVnclLeZ4t8hpfp7Km70I6BRU0IRU3Lkp2RAZoxWC9TN2+XRZL
	wI6R6M48RdrWhY90K/b2LmWSbJ3bOvyC3GeC+UpR6ONQ5lFuc5V6z0hFPxq1c0G915Ox7fZPn2P
	X9j3//mmc3AgaiEHtCgVF4Cn1mwBHGOcTtB2XRnqxS3IMskhBereZgjzq81LSpC5k7LvpWhYG5d
	/lAK0SInJZ3j2JSWa+d6tm6gj3LOBv8+bivLOf+/9a74Jtvh0SBP+bnZgM
X-Received: by 2002:a05:6871:589a:b0:260:f883:95f9 with SMTP id 586e51a60fabf-295602ff7d0mr17159847fac.42.1731511887447;
        Wed, 13 Nov 2024 07:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0z7Jp0XMyjRAbohYkAVIhRcQh3YSYeIYiseo4qNrUcHEZ2QHWzle0ceQ/e/Hjh0uVmlig9StAflHiJoVTYzM=
X-Received: by 2002:a05:6871:589a:b0:260:f883:95f9 with SMTP id
 586e51a60fabf-295602ff7d0mr17159785fac.42.1731511886807; Wed, 13 Nov 2024
 07:31:26 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Nov 2024 07:31:26 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241110054405.667779-1-drew@pdp7.com>
References: <20241110054405.667779-1-drew@pdp7.com>
Mime-Version: 1.0
Date: Wed, 13 Nov 2024 07:31:26 -0800
Message-ID: <CAJM55Z9o0JyJnw6C3=eGmgduK92M3nthKSLCB3-N5QD0YkLwyQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: enable pinctrl and dwmac support for TH1520
To: Drew Fustini <drew@pdp7.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_073134_352439_0681FD74 
X-CRM114-Status: GOOD (  15.88  )
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

Drew Fustini wrote:
> Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
> the BeagleV Ahead and the Sipeed LicheePi 4A.
>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
> Note: the th1520 pinctrl driver and thead dwmac ethernet driver have
> been applied by their respective subsystems and are in linux-next.
> I've successfully tested next on both the ahead and lpi4a boards.
> This patch is based on next-20241108.
>
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index b4a37345703e..99a11142c03c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
>  CONFIG_PINCTRL_SOPHGO_CV1812H=y
>  CONFIG_PINCTRL_SOPHGO_SG2000=y
>  CONFIG_PINCTRL_SOPHGO_SG2002=y
> +CONFIG_PINCTRL_TH1520=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_SIFIVE=y
>  CONFIG_POWER_RESET_GPIO_RESTART=y
> @@ -242,6 +243,7 @@ CONFIG_RTC_DRV_SUN6I=y
>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_SUN6I=m
>  CONFIG_DW_AXI_DMAC=y
> +CONFIG_DWMAC_THEAD=y

The network driver doesn't seem like something that's essential to boot the
board. I'd suggest just enabling it as a module.

/Emil

>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
> --
> 2.34.1
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
