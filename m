Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A8C021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g6mb8bvcUY8cdIo2g8EOtcujXWpQhRF0JCuZaCW1+X8=; b=vVMVfMaBIFT2Xu4K1bT85D/AYt
	EndPF4q2DMf12bOQEV3EDpQNqB5COKeDYlgD0YEEOaJJsD3yH/u6pyrEqnjbYMdCJ9cV/zL7NPaL7
	bzkn5HHNHsm+Z6xGpuWFGULpMk3rynsvAs1Qbj4mPg+fPNPuLpYXkJbTnc2nCKMeO9AvTP+j47sUs
	M2cMMiRyVZXLHv0OzC32UjhRHMtHLREWgwGq8nhoZeWJMao5zTIpUBXiKEA5RsCTb0u1+GQnZgR7y
	KxZIePW2p8jVirP9ASCD76bs724DqHCZKXG74fkwblJnmjn7VWZtSk2HCluBwlgcOfSx6tvV/ahjy
	7yUb6WiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkky6-0000000DG2u-2Kls;
	Wed, 19 Feb 2025 14:22:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkxb-0000000DFxo-0TU5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:22:00 +0000
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AEB23F2C9
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739974917;
	bh=TNFsSZbXf9eUik7wRM0fvibJQY2YnOZp+sKu7B0H7PU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mGuX916hjaGA3c9vr8PYPR/LXlipIYN8B8NTcMo5Xu2E+qIBaCv+d1QoLzIyQyRQN
	 kt6d7wqwEpNKHfAEtVD6B8AS7SbmEpzvfzpmrLXe5Qe9Pz2DnS7R5YBcGis2j0P5v5
	 ZNKWJhQPVabT0eP7Nu8LzQ0oGSZQzMbDCo78cHVsBUUB9ndwuEonibVJgbzTeDbvOK
	 fs4bYQrNHy5cpTnIndZQTNRUk9wXzMgnY9uZHA3HWyW3c6+isc02dya1Ds1tVJzbYo
	 LtA4bTDBTGTAjaAB7LhFlSd/VUzB08VUDd7A7G/OU+RVfU4GR3qWdr2iwW8sSm+7vO
	 Te9g+YYvAlmtA==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f3d417cb4bso7924749b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 06:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974916; x=1740579716;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNFsSZbXf9eUik7wRM0fvibJQY2YnOZp+sKu7B0H7PU=;
        b=sa88OLS1CZw4KM/PG9VgjSIgx1JTvolsWWVwkvObiw4uYgXD4metYzAT2YGScuuv3f
         VZSnGxRYmWLwkALPhgbHfoUJxzSZcDTuzcc4tlS8YHk/Gd0YdOPVta0+R1MMOwV+g7iK
         WxG7ezUrG0FUYHrIu6vWq6m2xz+ao4RvtK8nEgqPbHceoLYa+ihCEGnLpQawS4l830nt
         1NqlzOCc1Htzz+rW1eaXPmZSCC/Ony6s4z3m/mOqcH7W09YPfPVUh7GWvd1WHHnTVxMX
         vNe5X4dHcIOJy8RU91q+huRS+O45sxAiF4UteddttJ7uvgNgVt4Xb1JHM52sBcvpplI5
         Yhug==
X-Gm-Message-State: AOJu0YzoEexEqyC7Ol9Hf+TZDfESOckEBRWXYk7xho/J0EtYyisz0Loo
	LciZTsv6sKwrG2xiLtwMEW5Crnlih1dJ1Mu1ZL/clp1ATUrhQ3FDnyvYELOsUTRvEsNYSqeMkXC
	n21Xb1t4hyaJWbZeaqqMmAXJPfaCY+K7sTyNZMKBTOiUXmvbpuuXo6061nEwWHlZm7MzjgrBhgh
	+I9F72Uz4wrSUlmbUfwzK2GD0GfDLAS+WjtkqmAnFfqIDVRHtJInwPV2iB
X-Gm-Gg: ASbGncsin+Pc6L6GvKS0y41FtyjmFijwxgJDbmwf43c8ByGgEzD+pajeNntTZIb9tkv
	w+K6GVfeAA4IWUWZFT4WmNYCXCzg/hSg3qQPAO2vY5d2C/BWDMxZDPaH3SFju6ln2VYJEpehzEU
	T9IHqK8tOoVGGF2m4=
X-Received: by 2002:a05:6808:2009:b0:3f4:28:1cf9 with SMTP id 5614622812f47-3f40f24c70bmr3215796b6e.37.1739974916174;
        Wed, 19 Feb 2025 06:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEKEwejCxHSGMNqBDr8UWGdz+HnH9g09SOIuN3EzxDyFqmETR+GIxaKnUFIYn1IRhg7V7hGhncJdXEh66k2zg=
X-Received: by 2002:a05:6808:2009:b0:3f4:28:1cf9 with SMTP id
 5614622812f47-3f40f24c70bmr3215763b6e.37.1739974915815; Wed, 19 Feb 2025
 06:21:55 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:21:55 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:21:55 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com>
References: <20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com>
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 06:21:55 -0800
X-Gm-Features: AWEUYZkshXOe8nO7q9Z2xgk8mlOteMmpUwpHHVMO_JGbLr-I9D65us9gjN0VrVM
Message-ID: <CAJM55Z9GJr3BtbQeFpNU2P=nomsOvQ6dsVYFX_s=tHznu75ptQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: increase eMMC bus speed
To: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_062159_410306_28DFD632 
X-CRM114-Status: GOOD (  21.09  )
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

Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
>
> The assigned clock speed of 50 MHz is and max-frequency of 100MHz are
> limitting this interface which is SDIO 5.0 capable. Sadly at 200MHz it
> fails to mount an eMMC drive, 150MHz (really 132 MHz) is the highest it
> was able to get.
>
> This improves the seq read/write performance by 2x~
>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
> I put this in this specific dts instead of the common one as I cannot
> test if other boards are also able to handle these speeds.

Hi Maud,

Thanks for the patch!

These settings work on my Milk-V Mars board booting off eMMC, but I'm not sure
if that means we can just raise the frequency across all the JH7110 boards.
The eMMC on my Milk-V mars is a detachable module that identifies as

  mmcblk0: mmc0:0001 DG4016 14.7 GiB

I guess what works might depend on the module too. Is the eMMC on the framework
board soldered on?

Raising the max-frequency to 200MHz seems right for all boards since we're
already saying mmc0 supports HS200 mode.

Maybe we could begin by raising the max frequency to 200MHz for all boards,
but only assign the 150MHz rate on the framework board?

/Emil
>
> This patch depends on [1]
>
> [1]: https://lore.kernel.org/all/20250207093618.126636-1-sandie.cao@deepcomputing.io/
> ---
>  arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index 8d9ce8b69a71be78ca57618ae842c9f415648450..1f4bac9f89463a6af844b8f1743bdfa659e612ab 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -11,6 +11,11 @@ / {
>  	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
>  };
>
> +&mmc0 {
> +	max-frequency = <200000000>;
> +	assigned-clock-rates = <150000000>;
> +};
> +
>  &pcie1 {
>  	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
>  	phys = <&pciephy1>;
>
> ---
> base-commit: 0bc08ec1ff5a32449d2b04704173dbf3ebd6b014
> change-id: 20250215-fml13v01_emmc_speed-67812bd9b404
>
> Best regards,
> --
> Maud Spierings <maud_spierings@hotmail.com>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
