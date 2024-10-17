Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA1BD21274
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I1jYtCMLPwcAYAk1gu2RLiARszGyEB6huLHgQU6OQyg=; b=1TBcBpRL9OB09Cu16x6plaD4cC
	OzbqIw6gR2rdtecD4X87Pc0N7hyD+R3cGSHNXSm69JljCnYze7gwf4XBlnxmCuRh5LHoDacVKQtVq
	GNk83LYOB+WX/gaoiJ2VUHVnk5WJ14PVyLAEZEGiTIVaQsnr4gTsN93RFtpaCtTrkkLWDc/w9Xh1m
	OEYc3D2Vv/mG0oB+GbJHJFSenkAAli3cfgZ03YX4vtE/+T7ryq11TkAFuJy+MCZVoHBxGNCvQ4yOh
	Ik7umG7lRWIyvN2hadE5nsd4cOGv+yKm2Osm4tdaEJagGmFnRihAeTYXFyOT1/nErmCMjoFSSt0GQ
	uhmBn0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OH6-0000000EaTz-1kw1;
	Thu, 17 Oct 2024 11:02:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OG9-0000000EZgI-3e7E
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 11:01:53 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A4E5F3F458
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729162893;
	bh=rBZFdT3MLsNU1ABGIaObRFXCBfywuT/8DVsj8czEnD0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uPWXaMm3Tin3JL+SPrLU5hNvx0oNzxbN/3vcOvcg/uTSDj5qmS9LuPiK/xjbdwCS8
	 Yg7R1PaWMishErWtJwRgJme1GPC80BQqTPOkRgGcdff7pkkY0XRd5xcHH3pdJdwSvS
	 UINzDzSyzbhUNAKpANht83uKt0+2Rcx+b99yasIvNVQPLhzJ04Vs416yEUUMm2mg6s
	 y/MFcb5mBhTUg+2aCOaJkCBL+mjD9DrhknRa50paSWkhYou+zg61mBq68TIrZ0UEvv
	 nf3XGuE2XTs4UrmuzIUFq+E8UcClVVbxhBCSP07uvNqYuAqPGuNjWPUr93BLsmUZK7
	 i/0xf+zGGeWOQ==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-288ae5eabaaso644185fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 04:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729162892; x=1729767692;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBZFdT3MLsNU1ABGIaObRFXCBfywuT/8DVsj8czEnD0=;
        b=kQLFMN1ADl2x78rUYImAUrm7eNk4L4HAGwV4YGCI2DTWQ+oOnPK/Sd2MlncjnzviSW
         tWrMHLT3nHedjNqrRz0A/gXapcj1V9fioL0Kk38HRGXbC4QzJpMmXzkfmml3onrbciyp
         5Y5rG7QCVCI8MwEhOY4uppWsr5S5QhEF869H9AHT2zJeHctwTCD6K+3RwuTn+kX3G/pY
         W16suBhU3TrJZDrlhgV8ZLafL6aOSWI1ZSYEPVjwvHsvn1FtPo7dOTaH6lj8+FUj3vm7
         Fps7OuCYlsb2Pih1WycKg/JLUcr8cWvgMWz7dPWNHDj3PQMLey7W0s55sPUrW9xWJT2/
         Nl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsmk0DL4GDDNxeTUt0ysOO4jIpJruIrP/Rh9QmLbqKt0VPC9R3OSFgtPwaUlbUtb4WXdmTt1kO/dss2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmHFqI1F+1SOjVX0W0a4ACWILqVz+6X1EzSlsyjVPg1ajDaAzk
	+4mhaNk15RkDxdHSLAMHmTCRBYYBU2yDG7UM2jYl7Jt1dI1RNY7zSYcwE95Vx/SrI/pzcqRP7y3
	/xy1auvXkNTdmGQdqJJijx0XyYzyhCgymSZyaRjuwIaTag+Fma7B8ufB87HF77rp+KlSZ2ZqxoZ
	cs8ypykIE9oKj+V+fNhWdqtQMPMD8oc4k7dOLren2jYp8FbBNLESbqpBKF
X-Received: by 2002:a05:6870:6b8b:b0:288:6220:fe18 with SMTP id 586e51a60fabf-288ede29989mr5858212fac.15.1729162892273;
        Thu, 17 Oct 2024 04:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHMQG+kH208gfIiCgVMibniBpJ9STBwlor/4oG77CWFuIW/8xPcr2jPuy853NfEotH6tqZk6Hzqg2xW/WrByQ=
X-Received: by 2002:a05:6870:6b8b:b0:288:6220:fe18 with SMTP id
 586e51a60fabf-288ede29989mr5858187fac.15.1729162891890; Thu, 17 Oct 2024
 04:01:31 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Oct 2024 04:01:31 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241016-moonscape-tremor-8d41e6f741ff@spud>
References: <20241016-moonscape-tremor-8d41e6f741ff@spud>
Mime-Version: 1.0
Date: Thu, 17 Oct 2024 04:01:31 -0700
Message-ID: <CAJM55Z-3R5tbvpQB7mLF6b=FD9Wg-78_KPww2nqOLr566WPOFg@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: disable unused csi/camss nodes
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_040139_132909_47EB2757 
X-CRM114-Status: GOOD (  14.17  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Aurelien reported probe failures due to the csi node being enabled
> without having a camera attached to it. A camera was in the initial
> submissions, but was removed from the dts, as it had not actually been
> present on the board, but was from an addon board used by the
> developer of the relevant drivers. The non-camera pipeline nodes were
> not disabled when this happened and the probe failures are problematic
> for Debian. Disable them.
>
> CC: stable@vger.kernel.org
> Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera subsystem nodes")
> Closes: https://lore.kernel.org/all/Zw1-vcN4CoVkfLjU@aurel32.net/
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Changhuang Liang <changhuang.liang@starfivetech.com>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c7771b3b64758..d6c55f1cc96a9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -128,7 +128,6 @@ &camss {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
>  			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
>  	assigned-clock-rates = <49500000>, <198000000>;
> -	status = "okay";
>
>  	ports {
>  		#address-cells = <1>;
> @@ -151,7 +150,6 @@ camss_from_csi2rx: endpoint {
>  &csi2rx {
>  	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
>  	assigned-clock-rates = <297000000>;
> -	status = "okay";
>
>  	ports {
>  		#address-cells = <1>;
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
