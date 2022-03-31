Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E41C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hLoqIMFjRukH1qs8DfqAoloZjNgCDPUF0DOkpSCV7O0=; b=V685f/gjg2VTTsTgGtJRUIbjaN
	D94M/regdMx9WtwILNxdbQatu2Lssohx/O+n/26PrCwuHlTFIp9io0BsEvixDEvB2SJCIYxSdMu7M
	1Kpm1nsJ/viCqrU8W0fICwineaZaWOzxs7mKjN/aLOL3B9bg4dXs4MQkJe6cx2LQi2/3GITymLzf4
	zjMMCMbaF4RcVGdnag2aMSuettmSztgz5mzmdBlW3LxM9+fJV8wKi7SVSgiavveqo4YjUW1LLZgjv
	NtxSEa9Cr/IpWYVhk1kwaTIt300tpSPL4ppaTRxo1yzar4EtKUHI1aRn2EKFSpVPMp5+m/scEcRVS
	lubO9IGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnjp-000lJn-Oq; Thu, 31 Mar 2022 05:52:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnjm-000lI0-7J
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:52:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id b15so20980129pfm.5
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6clqOzL4awTIe/Myi39wRCRddQabktOnET1sZMtKgY=;
 b=B81P5y2U1gn7+cASnfMbrgp0W8zkDkgOFfGJOnrixf9+HQ9mHNd+lpoDfJpadxfarb
 f/XIU9dBB2mhfQK8VUUYpmZnGiGXL+m1JSmCC36GYEmT2072Dfz2tzGmKLcpdGjfDHcE
 h7mWnH+VChvFP3p5jfhUBgtALMdJKloZOi6N2T/OqkYVnTWg/xcL70bQ4eeqbj2te4n6
 zd6dPnPJPxfa5P+ZIEzloF3XO/mfkXhgRpKIdntrrHeIrh1ZYVfh4qeayfoIuEiHo6lF
 ctNPzE8cpkGN81UnozSGG1eXCrFRjnKeK2hQlvxCKfjsbnHrwcRV5DkR304bDGybzRfd
 U5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Q6clqOzL4awTIe/Myi39wRCRddQabktOnET1sZMtKgY=;
 b=Z8pSh3EuQ3WevDh/WWbT4WEft/k5/5vMcQapQQlXDnQYqjndY6KAO00P0304XYFTR5
 Y+WLQDI71EdUsjT8sUFrTduou/0ONQOGxNOr8ErZssUHEB2NWgCWRSVfces+j0+NVgB/
 sJTx7GzdlVLO/7Iio7XNLV+o/A+Q3+3IUH65kmfaTpzhfjFHauGpPcW+CwDr4ZtCPHwU
 6NpgVzoF9uCKAzDVxZsO9HbL9HSfq05JnakncyS3xR6KfYHBqs4IxiUuJ5f8khj9Ehqh
 4jv33RAnGFYfu56yAK2JPAQbFodqupOqLu/NHyGz/an17NCuBBaqypG0+TJUlgxc2qHp
 lQHA==
X-Gm-Message-State: AOAM532KrF1Nmkvq33ctCPfPs0ECfH+o4Qsxufp9GfbQ/JXclGfyd9iq
 NU5PM7NWzAxW5vs/26gc6Q5AHw==
X-Google-Smtp-Source: ABdhPJyMgfjKLyPVJuHF/zy5zj4GaAkHDyEqrRhc7jRst1LQsQYTb/zhHY++XRzlA9cTzXGUOyuy7g==
X-Received: by 2002:a05:6a00:2182:b0:4f6:5051:61db with SMTP id
 h2-20020a056a00218200b004f6505161dbmr3612616pfi.40.1648705969331; 
 Wed, 30 Mar 2022 22:52:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 bw17-20020a056a00409100b004fadad3b93esm25084515pfb.142.2022.03.30.22.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 22:52:48 -0700 (PDT)
Date: Wed, 30 Mar 2022 22:52:48 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 21:00:09 PDT (-0700)
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
In-Reply-To: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, damien.lemoal@opensource.wdc.com, niklas.cassel@wdc.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Niklas.Cassel@wdc.com
Message-ID: <mhng-5c2b88e6-6ccd-4ff3-8ae4-5f2dabb1e75a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225250_343571_0AF51590 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, 08 Mar 2022 05:28:05 PST (-0800), Niklas.Cassel@wdc.com wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> According to the K210 Standalone SDK Programming guide:
> https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
>
> Section 15.4.3.3:
> SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> SPI3 supports: standard, dual and quad transfers (octal is not supported).
>
> In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> connected to the SPI flash.
>
> Update the device tree to specify the correct bus width.
>
> Tested on maix bit, maix dock and maixduino, which all have the same
> SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> would not make sense for this k210 board to be designed differently.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
> Changes since v1:
> -Add the new properties directly after spi-max-frequency for all DT board
>  files.
>
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 ++
>  4 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index 984872f3d3a9..b9e30df127fe 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -203,6 +203,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index 7ba99b4da304..8d23401b0bbb 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -205,6 +205,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index be9b12c9b374..24fd83b43d9d 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -213,6 +213,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index 031c0c28f819..25341f38292a 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -178,6 +178,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
