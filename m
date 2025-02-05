Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B103C02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZoCE2BjN1oEW3yKS5BTS3JLhk939nMhCZQRh1Ul6sjM=; b=vzVs9zz0mm8fYgT5ke1a5TyUc9
	n+VaFjLXnaO4HuviF5yxHnZ2Noj7H8SvGz+bAx+0oOiuAt/ym7Mjqsy2iE/sPYBjwuXO1ODCrsdB/
	iquEHxxcHtWGhCfhTNVyLZbpmb/TQkCfaavQWaB9jcwra5iX7xqzXzRsjXJ8F/1U9q4o7fp4cVKmO
	65kd4M2pnbYBvdH3PJZfK3GEXXhD2/egE7uKJWmGEF55MZh7qlQVEHain9lWVa2PwGhL/5ML69VNT
	mbeflRKjcYoCrXXdy4m1cJg5GdIQDTGODMFFUGbWMn82T7jdd8ugpQemYA/DCv77BEcUfnfuyS8bH
	C7LRZ4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcZp-00000002rdA-1HG9;
	Wed, 05 Feb 2025 10:24:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcSG-00000002qSm-1Unr
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:16:27 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF0763F85B
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738750577;
	bh=Av5C3NG7n6JTUOYj8LuXVH2zlqsaee6hvA/xGrgK+Rg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LSeUVzuxX5SYKPd78DDZTDR5Boe67EHhQpPXRsa9XSAR8Ohz98sEfrVT7As15n8lu
	 hA35gjSiNk4lAvoDVMO7QtSGfgjl1iPi8OmubZu74yjPmUxXbfI1hKuJtXURGYgB4Y
	 E1BKYoIl9b3praw246jksmGS1I6ux/FmcdJMxTuBAOuCIV5Kj54ydlaIpZbXBc9JAU
	 Muh3Stke7y7CpGknBhIQRcdlagXI+/tg5rr9dBPYw2DUi0mQVcVOVenVkaWuxCArx+
	 o4a+JoFmyS4JDPCltIosLBvZCxX0o4VIkExrKqx970X2DIK5AI8eCFj74lFXx/dhHI
	 6hVDR6iGG4b8w==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2ad8e353167so4220605fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750576; x=1739355376;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Av5C3NG7n6JTUOYj8LuXVH2zlqsaee6hvA/xGrgK+Rg=;
        b=Urox7Y7avzQ0QtLiqr4/e8Fq6+ZY1OsQHVEUeagm5CcV2YgX8orJslaWe+O7o7F7UK
         FboaJ1Rn0ue4aQP/iQ7MewWxY2r6LZMD0a2Ax4dkGmpEeHaqUEO4P+17s9GmvVYr4Y/X
         +UJcG9PcpQc+VTzq5sA3Odxf0pLV5HHEAOQ/HLP5sy33Px8/s0dM6ZFnWq0inl25Lt0a
         O6P9dOIP9HS/eFe1WmMpin4aM/tIvNsMLez3MTs18u5wlHHCfg9Jj1C9CEP1IEft2Y2/
         CGAR1eP0GSSRN4kQ9vRIf/q4GBcBoMf/xOCb34W9RjL1GNG7S7yMHH0Js03nElMO+gRp
         SW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUZok261C5nHNwEAU+pxBgu4UhLLPDMKL6XPVqsF+KMTCtIgxa/tp4rbdFaypUZnMMR1gQ3uhd0zBh39Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNdnaywHNrrmReu1pFLlwoHAXtgSSqXCUgj8Qm3wQYBEWFG3a
	94iok7pzG1hpz/wdTcXEptr2ogttKFz5ZKixwddOWnmwTBusHxM35XOBbjySN/Ovv393y/VR5Fb
	a/sloQ/+97WAqwb0gSbhGsK92JeP+GZX1GMhqrR6b7Wh052r2joTv94T3SrcZdCp94Uz02V/jKv
	2eRZr1AumnCkR2QhF+typ+ZfX+hWO8UEcqYSIeSsXR2AW2M2rpNnnnAK9L
X-Gm-Gg: ASbGncv8B1/CMM6GjQBXvwxHVKeIlf03sfbgd5v6jp0s/aXiUDD0hQqXKcaE74Fy6OM
	ia56zV+QSW1Vn3h8/OR8Qo4NZ0QTEu3GEb3WpqEsC+gFlL0kzfDsHX0OPMOJobL9SG3JxxvSeEc
	it8STFN1U+Kit1xS0=
X-Received: by 2002:a05:6871:36c4:b0:29e:4a13:603f with SMTP id 586e51a60fabf-2b804ecdf7bmr1499797fac.4.1738750576126;
        Wed, 05 Feb 2025 02:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsJQ7P73/5n5tnAPQgpI0ua/1rwM5j7fLIXzbO141ngEH/FiC2y/KSAGjHe9WOZwY5cCBqXocuueLiB5hV4nY=
X-Received: by 2002:a05:6871:36c4:b0:29e:4a13:603f with SMTP id
 586e51a60fabf-2b804ecdf7bmr1499777fac.4.1738750575796; Wed, 05 Feb 2025
 02:16:15 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:16:15 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:16:15 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-2-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-2-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:16:15 -0800
X-Gm-Features: AWEUYZlJTl1Ykr0gfo45PSvnnmc9ItZ-0-EmoaBAoCqlMDbSjYPKQi0nAWkDg2Q
Message-ID: <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_021625_778689_410FB676 
X-CRM114-Status: GOOD (  11.20  )
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

E Shattow wrote:
> Replace syscrg assignments of clocks, clock parents, and rates with
> default settings for compatibility with downstream boot loader SPL
> secondary program loader.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b817..a5661b677687 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>  };
>
>  &syscrg {
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-rates = <500000000>, <1500000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;

I think Conor asked about this too, but you still don't write why it's ok to
drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
respectively. You should add this to the commit message itself.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
