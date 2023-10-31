Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2OOrczUtrm/Q+RryD60ZLoE7xNaKlTe1MDBFX3Qehe8=; b=IZ75jwkdmpfM02WBhoTG2fGTvH
	qt36ZaHA04R8A+QhmBAsvWv43VQRMI+93pPP76ODSY1spI66b+qZxEFOWJA7VAeRGiL4i0rAZgSY6
	kkpVSmAQ87ZM4PNWUkgjrMPvT3fbWoFwtKQ8CrSSafNRxL5FxdLeOQwQXue5Zd824ZqoiFmz86fSp
	8oL9os0/duUT7F/whQAe/He4y5rlzsU/PX2bAYJDyE8wY6h1nYEJHCm8rLaQe7oDAhsQzLwTQ2KhC
	KlWE0O54uuj1iDt81pFYDW0QA7ww2g4v6waEwxi02jNB839NysKVGPlm13nTq43acdL5jr0EICLR/
	NHV/ZV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxptG-005RyK-1F;
	Tue, 31 Oct 2023 14:38:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxptD-005RxB-0B
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:38:44 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7F6893F19A
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698763111;
	bh=au17QPiJsjAocXmUfByZs1Bf5AaxfhY0/xgh3nLmqCY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fkxU2/HAn1VE9B5RbLJ6mr15WDArxJ+ajn/txLoY2T8HaXVhZCUd6IW9fsjEZE6Mu
	 zOKyEZrxAacOdXKmhW2VhehGfy5Zf9Qom1VBKr37kB2+fwtat7s8b/in/JQV29/nm0
	 1Xvd15/Oye9SsvJ4EI8g66BbuZ292XWWlsJD6Nc97upH+215+yLJB9Dt/hxg6qSao5
	 ZngBIm8hyYXQXTmFBGMdYqL0NHMvqG1U4fH1Jmd6+2ZTm6G4JoRVf/p2M5+BgY4n/h
	 kJRfrTcvekBOc6QrlIPDd8iWKeBYGbwz9MCKn49br1CmAZkD1jN/0aZCMSTxDSAJme
	 o1WAQ+ORk7Tyg==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cdffe4d1cso70946701cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698763109; x=1699367909;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=au17QPiJsjAocXmUfByZs1Bf5AaxfhY0/xgh3nLmqCY=;
        b=rGwrBrhuFE4K5HgMk8EPqTpD2wwZPLQOSD7QN7MxWrHVrxwUtliPp44rwlpK0EAZOF
         8ffUWxSJwaKyROXnRoN9xzbyrBKraGNRtYV7nnJRmybzDjntEZkZ9gK5NXXFoCMJ/ltB
         YB1OcTUHAvGX7VGk9nstqOZiF1auFLIagbw4lkuCYwFcpR3fiLGSjc//gQ3Hp7s56LBF
         qRT/9fIRK0+FbAnG6nNhLvXZ3TgJW3PD/9ZG64VuJoZxioxAMrpVLG5fzFbBvHBYGKb6
         3+PRI6uVeNhf3PDN4BdB5419c4PnQNHXXOVCr4xShN6pCWn5NKwUU64ubdc2APsEuz0I
         yPAA==
X-Gm-Message-State: AOJu0YxHQbFbD5Mflmd+ogsAlyXXu2qxUt3qiFVFUyPRfCdouC0ZWeHT
	H/Fwfvl5zTVePEgVhHM7XzwLYGm8UMYsBDSgOGikWNySHfcoaQVWUBvIOeZZC02Xp2/AxUriGBv
	5ZMLhFKeMKWz9VJfZ8GCDCdqYZj93zj1mXhUoMfQMJaYXzcHwRJCgY+K1R7JbPg==
X-Received: by 2002:a05:622a:1009:b0:419:7623:ef6c with SMTP id d9-20020a05622a100900b004197623ef6cmr16897767qte.60.1698763109679;
        Tue, 31 Oct 2023 07:38:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEManiQqpXLt0b01D3i/c6XioIV3LcDFDS3I/YsKWQWlnlDlbI16LCgriOnJiUp81AuiFuChC8BPHTNIdY05AA=
X-Received: by 2002:a05:622a:1009:b0:419:7623:ef6c with SMTP id
 d9-20020a05622a100900b004197623ef6cmr16897742qte.60.1698763109425; Tue, 31
 Oct 2023 07:38:29 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:38:29 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-8-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com> <20231029042712.520010-8-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:38:29 -0700
Message-ID: <CAJM55Z8D12XoRG4WGaf=PG0_yp7d_xk9EhOk7bnCKQRMok9eBA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] riscv: dts: starfive: jh7100: Add ccache DT node
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_073843_253700_5FBD8F0A 
X-CRM114-Status: GOOD (  12.73  )
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

Cristian Ciocaltea wrote:
> Provide a DT node for the SiFive Composable Cache controller found on
> the StarFive JH7100 SoC.
>
> Note this is also used to support non-coherent DMA, via the
> sifive,cache-ops cache flushing operations.

This property is no longer needed:
https://lore.kernel.org/linux-riscv/20231031141444.53426-1-emil.renner.berthing@canonical.com/

Also it would be nice to mention that these nodes are copied from my
visionfive patches ;)

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 06bb157ce111..a8a5bb00b0d8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -32,6 +32,7 @@ U74_0: cpu@0 {
>  			i-tlb-sets = <1>;
>  			i-tlb-size = <32>;
>  			mmu-type = "riscv,sv39";
> +			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> @@ -60,6 +61,7 @@ U74_1: cpu@1 {
>  			i-tlb-sets = <1>;
>  			i-tlb-size = <32>;
>  			mmu-type = "riscv,sv39";
> +			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> @@ -147,6 +149,18 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>
> +		ccache: cache-controller@2010000 {
> +			compatible = "starfive,jh7100-ccache", "sifive,ccache0", "cache";
> +			reg = <0x0 0x2010000 0x0 0x1000>;
> +			interrupts = <128>, <130>, <131>, <129>;
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <2048>;
> +			cache-size = <2097152>;
> +			cache-unified;
> +			sifive,cache-ops;
> +		};
> +
>  		clint: clint@2000000 {
>  			compatible = "starfive,jh7100-clint", "sifive,clint0";
>  			reg = <0x0 0x2000000 0x0 0x10000>;
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
