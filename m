Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECEEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:01:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09ECA238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09ECA238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=q2nL4l0hCYInIjaD5unEUWgHMRG0bdWhueldz1Fy4fA=; b=zzEQQawSNyDyBUay/QPvUfxgc
	pgxzpNXgxKmRSy2Jz589OboFDoeCqFDZoVhGSlQ/4/5bAC35X2/7W0S1ONJeDdhnA6AWixbTHP+Po
	yLbWSlCEF+C12w4wEfG7cFmOTwI587xqE/ML1t+xbjBoqQCRjSNVs9gHWwVei1RdpzCkVG2DQiFAD
	W/FezW57bmCdJvuKgY2NSbKtxIB3NtbFWHj/e1zNHH6+C0i8R9em5nDLScOealAeNjdPwq+cbslug
	cKWIaFo0P9JlQC/ZonLWybThxGwx6EWb2qVHo51GYjOOXf2sOez9onWbCd3uVUEbZ/fFzFPIx8tC5
	HzOd06rug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzuks-0002Uy-BX; Thu, 14 Jan 2021 05:01:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzukp-0002UM-2K
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:01:04 +0000
Received: by mail-pj1-x1029.google.com with SMTP id j13so2546735pjz.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gdO0WTSyKWA1CQWh1+Ms9mCRHiJwmYIbRxyUnFoqJbg=;
 b=yqUJsNuQvhJwtek4cII9glL+VwLRVnrFOPIRqRs6YdXrtpfm/7JXl/j9KNtk422wZq
 PESK/HebDRDwAy4R90sIqGYW3YkUbuh31Nf/ldw3M1wFXVV/lqkHwvaEIJz0DVWtlU1+
 eEskoM+msdxRd4juvrvkjwBe9ml4NKM7nNwU5Yi7TW86MximiFYj1B07J3pinLzRcukJ
 Xwgb7N7NXskG5iR8L5EBj3ARX835VoyDRVREWi5rMj+6dEnIeOWhGm8v8uMqa86rK/Lp
 36VioJww4YzNLHAE6LAsX8eDloV1UAlxbwpJTkjEL6ClVy49Aa/GjHgdwzIoIas9VKka
 SeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gdO0WTSyKWA1CQWh1+Ms9mCRHiJwmYIbRxyUnFoqJbg=;
 b=GCIyw3PsEPotIXyvNQC5QfNEBSTNeAtyck+XNaK+HPtSh48D4F298/151m5Hh1vj4J
 47Hc6JV2VwB9RfnWlmv1XsdXf7chtzyUlkKvFqUdJ6/vNW7fI1s/3Wvwhx0kKRyF946Y
 SSRbASg6swHaWIykG5Wfr8doQJLDRNoiu9Q4/bqgBqfRUJCZEf0YmJX1DtvAHtTKgh9m
 Ww17Wtkfj80MwI+fzNQX5MLFO+duKaoL442dsibs7wqukzSdo5KmSrckUCin3gQmkZOS
 dSlWHc5GpySw/eadGE3SEhDEoj7HLqGyApfd5latLCVTxaQ63SZmvptbXcRCdlqolrXT
 tTBw==
X-Gm-Message-State: AOAM5337UcdEoUYF1861lns1CCP1cSkfVW90GfZnVub8sPyBAg0vGsp+
 npH6mHW21UNibN2MbgBXjsBNIA==
X-Google-Smtp-Source: ABdhPJw/KjwzxMrzkLg64ELSAlY5MYh64l6TXiHKqd631a6TQBCTeucap9fzUW/vz4QqeYnG6FGkfw==
X-Received: by 2002:a17:902:ee0b:b029:db:c808:ccef with SMTP id
 z11-20020a170902ee0bb02900dbc808ccefmr5909294plb.85.1610600461055; 
 Wed, 13 Jan 2021 21:01:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id ft9sm104201pjb.17.2021.01.13.21.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:01:00 -0800 (PST)
Date: Wed, 13 Jan 2021 21:01:00 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:00:58 PST (-0800)
Subject: Re: [PATCH v2 0/3] fix macb phy probe failure if phy-reset is not
 handled
In-Reply-To: <1605021732-268521-1-git-send-email-sagar.kadam@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sagar.kadam@sifive.com
Message-ID: <mhng-40b3307c-6849-46f4-83c3-ffa1ab92baef@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_000103_873147_FC30C6CD 
X-CRM114-Status: GOOD (  25.59  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, kernel@esmil.dk,
 anup@brainfault.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, yash.shah@sifive.com, robh+dt@kernel.org,
 Alistair Francis <Alistair.Francis@wdc.com>, sagar.kadam@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 10 Nov 2020 07:22:09 PST (-0800), sagar.kadam@sifive.com wrote:
> HiFive Unleashed is having VSC8541-01 ethernet phy device and requires a
> specific reset sequence of 0-1-0-1 in order to use it in unmanaged mode.
> This series addresses a corner case where phy reset is not handled by boot
> stages prior to linux.
> Somewhat similar unreliable phy probe failure was reported and discussed
> here [1].
> The macb driver fails to detect the ethernet phy device if the bootloader
> doesn't provide a proper reset sequence to the phy device or the phy itself
> is in some invalid state. Currently, the FSBL or u-boot-spl is resetting
> the phy device, and so there is no issue observed in the linux network
> setup.
>
> The series is based on linux-5.10-rc5.
> Patch 1: Add the OUI to the phy dt node to fix issue of missing mdio device
> Patch 2 and 3:
> 	Resetting phy needs GPIO support so add to dt and defconfig.
>
> [1] https://lkml.org/lkml/2018/11/29/154
>
> To reproduce the issue:
> Using FSBL:
> 1. Comment out VSC8541 reset sequence in fsbl/main.c
>    from within the freedom-u540-c000-bootloader.
> 2. Build and flash fsbl.bin to micro sdcard.
>
> Using u-boot:
> 1. Comment out VSC8541 reset sequence in board/sifive/fu540/spl.c
>    from mainline u-boot source code.
> 2. Build and flash u-boot binaries to micro sdcard.
>
> Boot the board and bootlog will show network setup failure messages as:
>
> [  1.069474] libphy: MACB_mii_bus: probed
> [  1.073092] mdio_bus 10090000.ethernet-ffffffff: MDIO device at address 0
> 	       is missing
> .....
> [  1.979252] macb 10090000.ethernet eth0: Could not attach PHY (-19)
>
> 3. Now apply the series build, and boot kernel.
> 4. MACB and VSC8541 driver get successfully probed and the network is set
>    without any failure.
>
>
> So irrespective of whether the prior stages handle the phy reset sequence,
> the probing is successful in both the cases of cold boot and warm boot.
>
> Change History:
> ===============================
> V2:
> -Rebased v1 on linux kernel v5.10-rc3.
>
> V1:
> -Ignore 4th patch as suggested and so removed it from the series.
> -Verified this series on 5.7-rc5.
>
> V0: Base RFC patch. Verified on 5.7-rc2
>
> Sagar Shrikant Kadam (3):
>   dts: phy: fix missing mdio device and probe failure of vsc8541-01
>     device
>   dts: phy: add GPIO number and active state used for phy reset
>   riscv: defconfig: enable gpio support for HiFive Unleashed
>
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 ++
>  arch/riscv/configs/defconfig                        | 2 ++
>  2 files changed, 4 insertions(+)

David pointed out I missed these, they're on fixes.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
