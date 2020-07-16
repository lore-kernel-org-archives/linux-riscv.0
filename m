Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0780C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63BF20760
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z+OHqa0I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lUDpaAUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A63BF20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lpTqrFDnwYxRR96ml8MHUhgw0JqmWZjikFZeH4UFoLM=; b=z+OHqa0I0ua8soUEef6yIDFVL
	dHST4YZ/WhaqZsUno/u9Yvap25ohRUk/HbKCYLezQ0Pe6P3ZIAJx5OOsIdo4cdD9p2/qMKZRCL+Db
	lDK0UoOTv6HJhws5Oe/emlJdHDV5EJyGSDzi6UNJEp6qwYAynQIYPgMWcgJ64qZ5Q223I6DNetDZf
	i0cCbeMFitaCtT4D0FUBznhxlQoSVQfHosMdBfDH+K5k133MM/bIUabf5bKnxJeQZvPSnc+CBC24D
	lr4ApgJYX6P8HPx5H9P0PpB1T/PM2sJpDY24DWaGexy/geJxPhVM7lnZ2S6XEvS59ZVe3Z9E/QrZU
	wI8efpHgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3hS-0005nx-CZ; Thu, 16 Jul 2020 13:13:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3hP-0005nZ-HT
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:13:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id z13so7018079wrw.5
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s9u0OaI73oXhhsb+oeV3fiveuxa7GdvhC13FjWGvhnU=;
 b=lUDpaAUiBGrLCQlRiX+SgWv6HzFUpZjxg8IbVIxQAjEem/sOgyzudjH1Ew2udNkvnz
 CZQSIxD0QpP+GxU65RWUZKiEl0ZDuVnwaLPZPBDrX5kZkpcmDn8l/GDC7vsLr1ZCUryT
 4vJH83uX+Essxes/0nPXT4VXyiKkziIPkQLw6/kBXq/75Z8wp1rTV9Uryv4E2RCddiz8
 UQwqwUHWPADle7ZRaPjCIafb33zMWegcMSWgTAtWGaMuLFtJNkrInhBMHuM7UYV/8zJo
 +x9vGTpqvugEAC74jtG6zR8B3/mqj8+TiAyjE3pwPzLa5VMPohnn2OePR443sucX3oBx
 KihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s9u0OaI73oXhhsb+oeV3fiveuxa7GdvhC13FjWGvhnU=;
 b=Hy6a+hSMFtsHvVsMeRMRiNha/VXqPpi2zcK/6rBzWw5v4a462ofrZgyJrfnUw+dh9r
 ZqNKcdgFyRzhzaZQ8GbLWbn6Q5y+9Kyy66dHBcdjlyEraYU6zGc2o4GOW9yAC10UoeEz
 u04hkYjr4kJ9Gmgw0zSGh9jUMl7VBs8kNtDNxl4Z8AFT8xBI5AgW5PhflnIRsmz5CYEz
 4+ZrqF5tYFV9Tr73Dih89auRfn1GEdRXS49nbXJca5B3sJNJlCw5WyItDr3at/5fXqtz
 ObNw9LLBgd8rR82MRFBZPOersPu88y+7UStLYQELdhjJ0LQCwH1hFazjcl4cCRr1jb9g
 mWcw==
X-Gm-Message-State: AOAM533hcCJHGZqRDC9jqNtvbnVAS6K7GLLORO71Zuo82OvpnxZf5S5+
 tavrgr8Mt+/wjmcUEyzf+qLI9MS0GpXmInplhnvHeA==
X-Google-Smtp-Source: ABdhPJyNrDd++3iRKErtZgLSEvCnoA9VLxRwm6VVLX4CuD9FS6IlrIlhxCvro2daVx57TMR+P//3sqVgv/nFdgNLLZg=
X-Received: by 2002:adf:ff87:: with SMTP id j7mr5358437wrr.128.1594905197215; 
 Thu, 16 Jul 2020 06:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2020 18:43:03 +0530
Message-ID: <CAAhSdy0==OEUUs6-+0g=kogqm2J=64XFiacNL7HdgZwyS-3hWA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_091319_660119_FB2AD873 
X-CRM114-Status: GOOD (  13.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 10:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds SiFive drivers to rv32_defconfig, to keep in sync with the
> 64-bit config. This is useful when testing 32-bit kernel with QEMU
> 'sifive_u' 32-bit machine.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  arch/riscv/configs/rv32_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 05bbf52..8759501 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -14,6 +14,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
> +CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
> @@ -61,6 +62,8 @@ CONFIG_HVC_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_SPI=y
> +CONFIG_SPI_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
> @@ -76,6 +79,8 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
> --
> 2.7.4
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
