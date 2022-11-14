Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AABAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wH1VlO2aq85nOe6wK7Fs5oiP7l60t2BOLg3Mc9L1/ys=; b=EJKTGAwWleihH6CvTQGO5yaCaB
	cQFCb9jl4hs5X5bmgwzH1KdN/a/yUSzLw1y8JNiXv0Q7+N5oSpHYKnJ/85C2hQAOhDeP5k50hBbt4
	w2csJq+nf/oYL1OKHQpjDNfX5mBWkAhLQdDHdGhGZNQ0arxlVpb7nLuBr08B+bJD9pg1F69EFYUKl
	kLOrYBGeYKWwn54+sETuOtx9Sk3uFqU2kGPtyOm42M655kWUepr+qashToY5hEjctf9o9jNQGhuGG
	HaxdgDKrXGXY71cwKJSm2ui7PgJD3LpfCFFG4SbVh9b6bCXFcK+jYjZ5TiTWBvj9s4Q32oYTLQCCJ
	tcK97iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufOB-004EhG-3Z; Mon, 14 Nov 2022 19:45:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oufO7-004Ef2-CG
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 19:45:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id 4so11078980pli.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 11:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yrDwPwm83Gsd8MHtP5CTPBx61olTD3WwjbzbhCn5CU=;
        b=bmpJHazTG2M58Com07n6mhACwU8N4zkHdpZ1uT5MKUhjJgviuO0pNnQ66Y0z8CGvIK
         pmQTe5FG5dMMafxXK7YZACoLCqiG/Db6I9ID0t9ZGnjn+XZDFkS28vs4Sg2QfDqpe0sM
         td4IpNxcooPmOB3VwKukzQOd5OflrE8y7fLPzIfvNNCCuKB+sWLFJOJ7B3ZBonCRnEsQ
         dLRT+HzMk63o+34AEpk7ZYzBouOqmse0ALpLSMyyvGuePWqrPbIL25UeTQabs8QT3N82
         9gjdt34Jm1PS/0DqPEs1HNd9hnQDia57JqbAyGDU8yA6IdM1vM7lv3LDhYvQcOpfw+wM
         U61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yrDwPwm83Gsd8MHtP5CTPBx61olTD3WwjbzbhCn5CU=;
        b=Awc5BsnWS++neQY/n4zAHNWo3xfKJXh2lhhw3XQ56Pp8q76/cH1XQEQWh6ZfhFfiKA
         E7leCoib9nVcvZ7WPgV4Bxx06HtwKEEMN1sAyMf0Wjkq8nu/39koAGaOVj0kr42bojhU
         qPy7YuaLWOYkLHBtnm+Uj1US+bj8dZO8lUigE3Ed9NW4IiWfU5GthbsjKIWlP/ZUbI52
         d4xYgzzYuRySVAnfEvuC8b5Zp2dAt8p+0T6zaYU41mNqLBHSDGnxD88f7uiW5QbbC2JL
         BAyX0EEblLeSIiGDop3Q+2AUHTmoT9tUGUD77F6LUWXIfCNNFDZSD7iOzBc1ktHjOaQc
         T6kA==
X-Gm-Message-State: ANoB5plu//PkQEtiY7Nuq5pI6YUDkIrjfwvUnX86yQPg3H3DNohdojgD
	pG/ZNwmFyjHK2qasUtIysusM1g==
X-Google-Smtp-Source: AA0mqf55AAw7qDrbDesrQK7sJCvApOkyqnD+kAhD+9HMAXoCAlL5/GcCPeh4vOxFf6nB7tetNaAUKA==
X-Received: by 2002:a17:90a:af92:b0:212:e307:b59f with SMTP id w18-20020a17090aaf9200b00212e307b59fmr15390020pjq.208.1668455097479;
        Mon, 14 Nov 2022 11:44:57 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id mp14-20020a17090b190e00b0020ae09e9724sm6841941pjb.53.2022.11.14.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:44:56 -0800 (PST)
Date: Mon, 14 Nov 2022 11:44:56 -0800 (PST)
X-Google-Original-Date: Mon, 14 Nov 2022 11:44:52 PST (-0800)
Subject: Re: [PATCH v1 1/4] MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
In-Reply-To: <20221109212219.1598355-2-conor@kernel.org>
CC: kernel@esmil.dk, Arnd Bergmann <arnd@arndb.de>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, soc@kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-d094b0d1-e4cc-451f-81a7-266805b22105@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_114459_655909_A0F38E7D 
X-CRM114-Status: GOOD (  22.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 09 Nov 2022 13:22:17 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Following some discussion both on & off list, I have volunteered to take
> over maintaining the miscellaneous RISC-V devicetrees & soc drivers from
> Palmer to ease his load.
>
> So far only SiFive and Microchip have stuff in drivers/soc. For the
> former, a SiFive entry exists with a dead GitHub repo - so remove that
> to avoid confusion since the patches for drivers/soc & devicetrees will
> be routed via my tree & other drivers go through their subsystem trees.
> The Microchip directory only contains a RISC-V driver for now, but is
> likely to contain drivers for other archs in the future. To that end,
> change the PolarFire SoC entry to specifically mention the RISC-V driver
> & the new directory level entry does not mention an architecture.
>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> Link: https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 046ff06ff97f..b88ced1ff72c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13627,6 +13627,12 @@ S:	Supported
>  F:	drivers/misc/atmel-ssc.c
>  F:	include/linux/atmel-ssc.h
>
> +MICROCHIP SOC DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +S:	Supported
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	drivers/soc/microchip/
> +
>  MICROCHIP USB251XB DRIVER
>  M:	Richard Leitner <richard.leitner@skidata.com>
>  L:	linux-usb@vger.kernel.org
> @@ -17749,12 +17755,21 @@ F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/pci/controller/pcie-microchip-host.c
>  F:	drivers/reset/reset-mpfs.c
>  F:	drivers/rtc/rtc-mpfs.c
> -F:	drivers/soc/microchip/
> +F:	drivers/soc/microchip/mpfs-sys-controller.c
>  F:	drivers/spi/spi-microchip-core-qspi.c
>  F:	drivers/spi/spi-microchip-core.c
>  F:	drivers/usb/musb/mpfs.c
>  F:	include/soc/microchip/mpfs.h
>
> +RISC-V MISC SOC SUPPORT
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	Documentation/devicetree/bindings/riscv/
> +F:	arch/riscv/boot/dts/
> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> @@ -18781,7 +18796,6 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> -T:	git https://github.com/sifive/riscv-linux.git
>  N:	sifive
>  K:	[^@]sifive
>
> @@ -18800,6 +18814,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>  F:	drivers/dma/sf-pdma/
>
> +SIFIVE SOC DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	drivers/soc/sifive/
> +
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
