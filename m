Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329C1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 23:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97B560F70
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 23:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E97B560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=v8YifwEeD90jtnim4PC2ndizs4Cm1dzmvGG+XrXksH4=; b=JkTWKfJC/Npxq2c1I8x/h+wKgP
	gw0CjMr0Py88WOSVWmRV00dxiNfcpUUm1uWd9GLWDsAhTh2/3nuG5qvON/Q4oT4YxHqyGyjOSi9Fl
	dRZALB/LR3Red3YKhc1LmCFDNgFvc4PtS2xJ9fHxMYFW0mG+hAb/ew6Nb24bKAE0AyKmj4RqyNWTC
	yx1SQ+WP6ED4LryG79VFbCe18GSBucOPAb2BiwuQ8r+XVzoktiSs22q8+gBXR3N/ZxRBAsaMF2A96
	xscNYp8h81eZqKBN9FTCbIvM/kUcd0xuOcY6k2N35LrHjvEXcZS7jH70vf6byNmTuNk8+vO6QIPrR
	X5QBSGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWJi-003JXO-Ia; Tue, 26 Oct 2021 23:57:18 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWJa-003JUw-29
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 23:57:11 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f5so1074310pgc.12
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ox25PEd+7ja67BkL02/UpuGlluy92XCgWo2yIwyEZj0=;
 b=Ny3C/AYqnDIk9xUQr0b2aUAc6ZqIKH/IzKv5eS1yCC2fOeIfvOw5ppqcw7zg2AMxmU
 daSzKE92Mphk4eLrkfaJQi5JmGg73wL6Nx7rU0ObM6PCH1qoqR5f+djvvlicX16GbpHJ
 Bykdqg8Yz55S7Yquy6LFRxoXKruHK9qzxTAXDbDK4fmqjFR21/fX8Z3J3LH4vcmZ8fs+
 L8SeDoY0Fo1+d03hrg6uCBJPvNXfmY2WuFmOg0MJlszUDIORd183Mi9ibUMmMuoKwu5d
 p1gNEAwJU3oV7ICBvxFMPeDPLOvT9isHcymcpwsgdzkWTq1YQZsUnB0Hpc7Y76hvMFhL
 O+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ox25PEd+7ja67BkL02/UpuGlluy92XCgWo2yIwyEZj0=;
 b=eX8QOh7yA0DwUFkI4DcN+2btTu/Xa3spMBT64S+WitEcPWvJS3KJseXrOuEPzUPFEe
 DJSBEF0FSt8Tp+jSaW20jjxPdL+lDulerBwI2AGgl/XrNYJLZNymLrrpmLu0EnUx33aB
 tH37noREgBQjtnmmKp30mLRvbIFzn6T+w3VW1vZd1q2Tw3ASmbszp2QZF72myFmOKV+v
 BFbXb7FEZNOzsBd0vP4Kgi4I1C3TRk7OV4hn/h8J2O3a/sqO+5yEYcmhd35JHsQzxYPY
 EHw4XY4NQFybM/qM9Hi/yyD7Vy+P950Y18O1NKbqDlQd22+4yuWJ3fNhMO+SyrLwWM4F
 tDDQ==
X-Gm-Message-State: AOAM531VibEvTOwlo1pfgqx/v9/yoOnInG0PnMfW8Fb8l1h0KPygN86H
 YHZa6AqKGAFJ1jVODd8Z37Digw==
X-Google-Smtp-Source: ABdhPJz3RQ63fyBQqvKn/D46Jc2OoCtWF/yyFNbn9ZrAf/N6PuubuHYBrlFNyVhRKH5q85eSH0FjDw==
X-Received: by 2002:a05:6a00:23d3:b0:44c:a67f:49af with SMTP id
 g19-20020a056a0023d300b0044ca67f49afmr28918069pfc.50.1635292628805; 
 Tue, 26 Oct 2021 16:57:08 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id 23sm1847703pjc.37.2021.10.26.16.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:57:08 -0700 (PDT)
Date: Tue, 26 Oct 2021 16:57:08 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Oct 2021 16:57:04 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: defconfig: enable DRM_NOUVEAU
In-Reply-To: <20211012164658.81894-1-heinrich.schuchardt@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, axboe@kernel.dk, sagar.kadam@sifive.com,
 Atish Patra <Atish.Patra@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-5dc2aa26-9f1c-4764-9877-6d99569210b4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_165710_134502_F55E54AC 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, 12 Oct 2021 09:46:58 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> Both RADEON and NOUVEAU graphics cards are supported on RISC-V. Enabling
> the one and not the other does not make sense.
>
> As typically at most one of RADEON, NOUVEAU, or VIRTIO GPU support will be
> needed DRM drivers should be compiled as modules.

Do you have an nVidia card that works on real hardware?  Last I checked 
was a while ago, but they weren't working at the time (IIRC it was 
something to do with PCIe addressing, but it was a hardware limitation 
so I don't remember exactly how it all fits together).

If they work then I'm happy to flip them on.

> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/configs/defconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 4ebc80315f01..c252fd5706d2 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -72,9 +72,10 @@ CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_POWER_RESET=y
> -CONFIG_DRM=y
> -CONFIG_DRM_RADEON=y
> -CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_DRM=m
> +CONFIG_DRM_RADEON=m
> +CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_VIRTIO_GPU=m
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
