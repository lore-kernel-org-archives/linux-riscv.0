Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AF9C3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo9ibFGGa0So4Bd3F6DoYCDbNyzmz43KXf+mPkbFweY=; b=KtMhK76kKA14W4
	Bjg3f5ZVjGXYiKchg1PjOnlhSpP+/36E+nYBWsfPiPU9hfTXUFVD6urWxIraXTVHEGMOMu+eorMoT
	FvQ5foru5NhPLSEhV/axN2UjAqWtU7EN5jRY/XMoaZBTPnVlQlsIDBRIQJZe8pDTg8siHnjeQHLy3
	Lnml70YrRqrKe7mAfIstab5u9NkgXDGEr4YnaRDFPAl2TnGFGRChiFopHL7BN1IYonVvpFHlBC1/5
	kWho+/xmYaam16sRPiauRd3UhmsbnURINXaop3gG9Ej6RVylY/cgkwIk4NA/KlUMepKzYPlQKefLP
	2GikubZZcgmck2ODWAlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSz4x-00000004UHU-2bsf;
	Sun, 14 Jul 2024 13:15:51 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSz4e-00000004UDD-06qV;
	Sun, 14 Jul 2024 13:15:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso4091299e87.2;
        Sun, 14 Jul 2024 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720962930; x=1721567730; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KiCM4Oh0wwP2VREwcugnR/BGE8YEV2FgEAMfKAudQZU=;
        b=nIiwX7CCnYdwltY6IU1MgKp6q1soJ4rd4n+n63tRv3gKKp8gpGSOsXblvYsj5yw7Z+
         arIhsh1balPh/rpOndEmtxgPMmYaZK2t7rdElRPCaaz/9blPKeYi5rJRhGfQyRO6RmHi
         5q/6HYlN9avbaQFsH309Xs8t1+D1a/8Isa8JBG/e9VvULq884Euh8IDJvYTVle39qQ4T
         +GTo4suAH3JRaK89yKn9x/KgBIr/mmZu8dqYuFDtI02U1gdJ2xhlEmsibhGOXRbt5yqf
         RCx19s1qE5dv+JYCDkuJR2sluGSw7wtN4w6XXeJfLX5fH4+4436RqTpLZktYkYJTJRMr
         XM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720962930; x=1721567730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiCM4Oh0wwP2VREwcugnR/BGE8YEV2FgEAMfKAudQZU=;
        b=hGDqvP2IFOLoyni9lBvFfLHzhwbMhmNYbl9jZc2cI7ckKPBEscCAYG24C5dMgKY2G7
         uhXzJWbkV5tDPLVuJU3xs1JYbUoeC5BQsk41TRJ+BCHyuK8Gc7nYNTKN4ZPtty0R6Mzg
         W6pdDEkrnM7O5cRfvAyGgoerBKS3laAGUgejpEEykTOPFip2sHeU+d3X7Se53xln1k+r
         S/EFJ3SMMlZ9Gnep2fp0kcozazXXEp5pd7Us7WP4D+HmzD7vJKGt7Qq9od8Ud8Jtf0+4
         9ffqqoU02ku0qYZgXHWdSwENCF8k+SwKXbQdmXZyKXkEMwXmunImkKEcNJ591bs14mOS
         uIUg==
X-Forwarded-Encrypted: i=1; AJvYcCUSOSEGKzziD1bIb7HIGeXsbqhgIeS/G/mX5ZiZtBYiG+V/XmjdUZcBYTk5LV1c35JC4XqVC1Msxwrf7DBT+FnowA9iN/BpcSouE73g5BzgaLuJ6h9FtNhQDY2lv+SoPud/cd/bTMJlZ63a9X6gsHnxxpPnGu0=
X-Gm-Message-State: AOJu0YzNohtAT3nYPLaZgivuH1hPJxKE7gqPoTWZa62z5CEne3ozh6MH
	o1t3txymvDiIPfg9T1Lg7l6AuiIpZ/VPw6tXlHYpY8joZP/fDfGH
X-Google-Smtp-Source: AGHT+IEwsZANI92FHt4sUnfLljzN4WZnd499R+at6I3cz5xxru5RwfBlwsIV4f5R+2ItBy99UrvDKg==
X-Received: by 2002:ac2:42d8:0:b0:52b:b327:9c1c with SMTP id 2adb3069b0e04-52eb99d59e8mr9045576e87.62.1720962927807;
        Sun, 14 Jul 2024 06:15:27 -0700 (PDT)
Received: from mobilestation (pppoe77-82-205-78.kamchatka.ru. [77.82.205.78])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24f38absm467456e87.79.2024.07.14.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 06:15:27 -0700 (PDT)
Date: Sun, 14 Jul 2024 16:15:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Drew Fustini <drew@pdp7.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC net-next 0/4] Add the dwmac driver support for T-HEAD
 TH1520 SoC.
Message-ID: <w3ex6eu3fhv4rmb67hm5ktwkehefw25gmemtqsjjfaa76z7v6t@vmfzungbincv>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_061532_093149_6169678A 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Drew

On Sat, Jul 13, 2024 at 03:35:09PM -0700, Drew Fustini wrote:
> I am marking this as an RFC since it has been almost a year since the
> previous series and Jisheng has handed it off to me. There was
> discussion about the syscon for the APB registers in Jisheng's v2. I've
> gone a different route and switched to adding a second memory region to
> the gmac node:
> 
>   dwmac: DesignWare GMAC IP core registers
>     apb: GMAC APB registers
> 
> This patch depends my clock controller series:
> 
>  [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock controller
>  https://lore.kernel.org/linux-riscv/20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com/
> 
> and the pinctrl series from Emil:
> 
>  [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
>  https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> 
> I have a branch with this series and the dependencies on top of 6.10-rc7:
>  https://github.com/pdp7/linux/tree/b4/thead-dwmac
> 
> Changes since Jisheng v2:
>  - remove thead,gmacapb that references syscon for APB registers
>  - add a second memory region to gmac nodes for the APB registers
>  - Link: https://lore.kernel.org/all/20230827091710.1483-1-jszhang@kernel.org/

I see the vast majority of the v2 comments left ignored:
compatible-string, Tx/Rx common clock handle, clock delays, etc.
Please take a closer look at v2 discussions and make sure the notes
were implemented or send a reasonable response why it wasn't done.

-Serge(y)

> 
> Changes since Jisheng v1:
>  - rebase on the lastest net-next
>  - collect Reviewed-by tag
>  - address Krzysztof's comment of the dt binding
>  - fix "div is not initialised" issue pointed out by Simon
>  - Link: https://lore.kernel.org/all/20230820120213.2054-1-jszhang@kernel.org/
> 
> ---
> Emil Renner Berthing (1):
>       riscv: dts: thead: Add TH1520 ethernet nodes
> 
> Jisheng Zhang (3):
>       dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
>       dt-bindings: net: add T-HEAD dwmac support
>       net: stmmac: add glue layer for T-HEAD TH1520 SoC
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
>  .../devicetree/bindings/net/thead,dwmac.yaml       |  81 ++++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  89 ++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 131 +++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  55 +++-
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 300 +++++++++++++++++++++
>  9 files changed, 670 insertions(+), 2 deletions(-)
> ---
> base-commit: 568c4e4b646777f3373f383cc38864a3cd91bbb7
> change-id: 20240712-thead-dwmac-1d44c472bbd5
> 
> Best regards,
> -- 
> Drew Fustini <dfustini@tenstorrent.com>
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
