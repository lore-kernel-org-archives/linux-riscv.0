Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A894DC2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W8xh8M5mLOixil5u6fmlfx0qK5ZdyRpYbkEMVoQi8kw=; b=43OzzHcs7X5HJRP3J8F4qHxNW3
	ZSbhDYMBIW+mTYEBsY8R0lheLmb89ArfMBu28H2rIvYiqtGCag75ef2y23TCHMCl/KIiCLl5i/jsR
	kW/Jg/KIa4uDlC4/ChR/dhdOs4Sl39LovA2CYVtWlUVW9Y7zjNllR2WGrVneTRurvfIPB2iYp5C9/
	HqVScWxh8EJAbnx6IcSt8BppOiJQ11KavSVqjcL/MMALwhqhZDnQ2G+v6dXmWIegE2kAAW7jguBez
	8sQrx6IpvdOsH2hkAKA6/IjK0/pZ9t+/WYm2VEz1Qkw/6fsLawzA+ofb25misbG2JdhGzLpIiyaew
	JfsO4WzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc53-00000001My4-1nN8;
	Thu, 15 May 2025 17:09:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc50-00000001Mxe-3ZzD
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 17:09:12 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 236663F830
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747328948;
	bh=EAHU3J18eD31/ymgQS39ucRDzPTjYOdwY+kBoX2CB8c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Q/9Ov6vSX8nyTSdTrEusGIw1IOAifR3fyWqsWmDqsUtmF5azoNAjxbQi0KhTdgGxW
	 SKQ6EDllzu6TkNZ8C20yOw9y8Wy0hPFB9L7+ljEKM1M9extwqqI6OB/Gccf0WCM7eY
	 Bh3kBafQJVygnjAE4lohs5LC3F95KlIOEUa+YiKdYaXP+e3ED9xRRaleGvZLcp816k
	 UfEbIOMmztYEpO41YMcQ6FI8CqDIOt1/BFJRyQPKMBSW2E7ypB+stS1Hwsj3WBaxUL
	 dh2BeMwaoqsGoYvOXH9d7LHZbWrPkphuMCKjr9GBt/KmqBzrqrB1lYRK36k7XFnBsl
	 3jCKFml5stA+A==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6061f07465fso655430eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 10:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328944; x=1747933744;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAHU3J18eD31/ymgQS39ucRDzPTjYOdwY+kBoX2CB8c=;
        b=e4CvD8HtjTgzD24IZ5UeF1vC3YED8H0IETYQK6Yw6uPGvhGMBoF3ZFoKr5VSRCVfnv
         AFt8BVkGm6YVdGxtz6mS65zq1UZjqsplrJuWgSU8KQClUyW+M43h8aEUoi/pEXIf9UFq
         LFaTcfbnub8OvQc/mC5P9ln7E0WT/yRQBUkdX0G4jwMc//jDRN7P1jdV24Le4Qq0E1kA
         +fsVL1W+F+OdBsn04dsEcgVmHwBqTaiybZg5EZpmpHdqZVjaC0GetP1nx/1fmeMvZ1Zs
         XoW3Do6Lp63LpX08DTffhf64G6ljBns3N+5SlzG3V+znYR04oI8BFz2/aadrOXpeTyu+
         F0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVzd7qdRChM7B9utO9XUT2qxWbvsLSbRfwiYb3YuquW7V9hIJ1Rgaau1sbTBDVhXVaKW5Df9Tq65kNsDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxGPZY04AiQC3B5XO/Yi7E2gcRLK5E8USK3NLBGWtK/TdNgtpg
	TMT2BsmB8F3CzDGswlxfLPI8FP95pxvBX/3EwDsQIHNRPnz00GRoAx9O3/yI+e5e8Txwbyc5MzE
	kd3lHRIqhRZTdcEPwk1P432FXPvSA0BmwRrrenvtLsJTt9XaWCY2MPoIbko2upHtaEu4DYAwJqg
	xnP+RYtQEUmlc4G6UpTVolFmydZvGnEse9QHlEVoiq24ZrK0I1O4ZJ/2/w3zkc
X-Gm-Gg: ASbGncv2/D5Drzo+BUOFrztBa+CyVyGYHe66OYMEphWGbKPnZ3FyqC8dWhdCwUMEl1A
	hvzpQua+Qlalj3RpWCaIjBB+0k2H1SmYHlN76Z8z9cnbuYYtyqP+oGHX0/R48tUrfJvRPQA==
X-Received: by 2002:a05:6820:210d:b0:606:8579:4c5b with SMTP id 006d021491bc7-609f36bf4bamr161416eaf.1.1747328944556;
        Thu, 15 May 2025 10:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFLlaIpBSb50nrAEfKwrzW44A+wmRkrahI+IsmV1VZdoth2sU4ipKUE23o6HxNeOl35A87CWuYdetvBF/REIc=
X-Received: by 2002:a05:6820:210d:b0:606:8579:4c5b with SMTP id
 006d021491bc7-609f36bf4bamr161396eaf.1.1747328944263; Thu, 15 May 2025
 10:09:04 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:03 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-2-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-2-e@freeshell.de>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:09:03 -0700
X-Gm-Features: AX0GCFs9vd2gnAh-5tFs89i_vEFOodBVMxQaK2XBrUlr3f41ZlKWfMl944u5vOQ
Message-ID: <CAJM55Z9g=YKZmdkq7BserR4hR-MxsvDLexUkf4u+L53m3vAtzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] riscv: dts: starfive: jh7110-common: add CPU BUS
 PERH QSPI clocks to syscrg
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_100911_210231_09109C09 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
> Add syscrg clock assignments for CPU, BUS, PERH, and QSPI as required by
> boot loader before kernel.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918..f1489e9bb83e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -353,9 +353,17 @@ &spi0 {
>  };
>
>  &syscrg {
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> +			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
>  			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-rates = <500000000>, <1500000000>;
> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> +	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
>  };
>
>  &sysgpio {
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
