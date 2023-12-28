Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE301C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kM2fD8OAE1EFeoLzBzLn9gGGu56hPMBkP4/CZ6ZUVJA=; b=aSeDGChyuez5/AeN86zxrZRmXU
	2VHnYrRJQgQ0YwMgR8gd7PPvpv5g6nl3zbT54NHIx+NI8CDBPh9V6VGS3zYRdL125cyLJgZOvVsMZ
	/zTvS5kUTVluoj773vq5Djbo9lDxOny7WRJ6Eg6JhEUkRPMRi6GyKXlNl6aHH+Xy0Czewo4Pqpu9R
	S2brQtKhGfl8w21KkMPEYAKPmg+NnUio6ggliMwWB6ihdqk++ZPq0t/Xhrt44nMi6vb4ky2K41yD0
	9Ns9ThkBLATPYNpbplDoJyGUt7g6zfu1qbTbIVDl6I+mVsMGDMcvId1NkiU7UQf891Zu8WMeTnr/n
	eVD9qQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqlu-00Gxmw-2h;
	Thu, 28 Dec 2023 13:50:02 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqlr-00GxmG-13
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 13:50:02 +0000
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 904BC3F73C
	for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703771396;
	bh=g2vyKn++4yvglINkEI7SotQQ04RejW9YFQLdk8yapwk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=t0VBB2Vm3gCz6Ouik6M/gi8v7aeWtZ+sJoEAiLfPUqAO5psgm+bUJNKnjmI+g4rO9
	 Q2wxYdO0KMsldWswQJYmxvmW1PGz++GVAY8TM2UrD/XPYfV65X1men9qHismF/4DEY
	 r7q58J5h98neSgu0ay2kOg8ywBRqPBjkm4lskXSokkD0cnzYkTPSYS9g9fR5y8wYTb
	 DABIjXoJrU4jsrmyhBXe7w1232lkJl46xsyPB1uGaZvWPXglROYzIszrA6Xq6qsq51
	 qHp/Sebg9wch3ntlB3Hnc9uD+pkrrMmCx30cBldb26yWxGN8WZeUE7qaaZ0zsI8h6o
	 xT3WX28wu2SqA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dbfdb7c252so1961546a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 05:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703771395; x=1704376195;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2vyKn++4yvglINkEI7SotQQ04RejW9YFQLdk8yapwk=;
        b=q8cewoQBej+aUhwScPjh2gBDiT1vl1fAGadz1Enhr9JxvJlp0xLB5kvwnbcBkCdtBh
         eExvkSC/S8SOZpmnK1vnwcgWwfSR4ypJKCgHUxylA1hvr3aZ+qPPGVJperhLOGGACfR3
         YdNQO3vnWc9133rnkOMFFE5/4K7R+91sDlno8xG+1GLpVCYWe94gbPtAY7O1Yg4H8a9f
         mP/+rtKywznAFHwPY5soXhwNFukFgbWR13zb/K31aDR9f8W3U5Rm6cTE4wLhiudloBzQ
         FIeE5u/VqiR9T1zGMwJn9iNKHs4Ux2S6OQCbGR6Vk6bPjLBNEBW3wDjxHsKXUJTb4t49
         pqFQ==
X-Gm-Message-State: AOJu0YxGeoT+jcfD8gErXsLwBaEvp3XlCpxSsXurnLgZxIpNrvBZppDM
	dCNhX2k4R+aVD0nm3qzloOVu0hr98OYi7H1F7FzZ407ny7p7U3rnJ9wba3Q9j4y7EpRfwFkmp4j
	aXBVvB7LdNo3b+RKZOiQmR574qJOzBK6SouXVezYONvIi2A9ft4jzY91KbRsKrbvrJ9nO
X-Received: by 2002:a05:6830:1e05:b0:6db:a4f2:3328 with SMTP id s5-20020a0568301e0500b006dba4f23328mr4785936otr.16.1703771395252;
        Thu, 28 Dec 2023 05:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmrzqKoMS+hVN2Nyl55A4PbsNFXOgPVNBuQh84okXul/5vlojVmzD/GTwGmPHv0MgZC6sYXb3cX9ln7SZGFNI=
X-Received: by 2002:a05:6830:1e05:b0:6db:a4f2:3328 with SMTP id
 s5-20020a0568301e0500b006dba4f23328mr4785918otr.16.1703771394872; Thu, 28 Dec
 2023 05:49:54 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Dec 2023 07:49:54 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <DM6PR20MB23160B8499CC2BFDAE6FCACDAB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB23160B8499CC2BFDAE6FCACDAB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Thu, 28 Dec 2023 07:49:54 -0600
Message-ID: <CAJM55Z-6qn2BQRrdAXnmbCzNLrEjV-cNRsvhL7C=9Hbaga5WsQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add watchdog dt node for CV1800
To: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_054959_500711_89553A36 
X-CRM114-Status: GOOD (  16.66  )
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

AnnanLiu wrote:
> Add the watchdog device tree node to cv1800 SoC.
> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR20MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/
>
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  4 ++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi          | 15 +++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> index 3af9e34b3bc7..f3103de4a8cc 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> @@ -36,3 +36,7 @@ &osc {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&watchdog0 {
> +	status = "okay";
> +};

You don't set status = "disabled" in the cv1800b.dtsi so you shouldn't need to
enable it explicitly here.

> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aec6401a467b..a0a6b6fc6bc5 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Annan Liu <annan.liu.xdu@outlook.com>
>   */
>
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -103,6 +104,20 @@ uart4: serial@41c0000 {
>  			status = "disabled";
>  		};
>
> +		watchdog0: watchdog@3010000{
> +			compatible = "snps,dw-wdt";
> +			reg = <0x3010000 0x100>;
> +			interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pclk>;
> +			resets = <&rst RST_WDT>;
> +		};

Are there more than 1 watchdogs on the SoC? Otherwise there should be no reason
to call this "watchdog0".

> +
> +		pclk: pclk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <25000000>;
> +		};
> +
>  		plic: interrupt-controller@70000000 {
>  			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>  			reg = <0x70000000 0x4000000>;
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
