Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E14EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HJNcNE9VCSt22UoYmXe0flAkMrUIWHp1toCPIgH8T4=; b=W5dr3mJ9wOnqYc
	v+Fz4ukqvQJgNvtli7CbMlOvQ6LNcLw9vC4CqLTtIPCIyHcw5UOkYRnPB4uMReANunD7sGw6uujZv
	2rjGBLUk+ciKmABwyG1rQbTWZb4vF3EVDSO5p7lrdhxbcjIdIG9Ui1svxmxlMOc2+mP0nqmJAuZJe
	1pZjMZx4esQ5WUEDvC9/JsYOHSK6mXuSzlqks4DUYZfmIHMFjg8hm3JNZ8BI3ngRkhChW6zhj53fc
	H6yQHYRnyFVhs/M5kqdM/3k/I3LF0AlkQDE4AcFt7mvo/AmccD49WeABXD63/sI1dzw7y4z8+0AsS
	ZJ3HT6Nc8D/jfzfDacnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFifH-006hXh-0x;
	Sat, 01 Jul 2023 22:01:59 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFifD-006hWb-2j
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 22:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=awuPIRBOTCLPchkWj4ebZYVqHfMO7eHE5JTOy/aYNHY=; b=h1iYvb7zvOgUfccHyUvSVw+BsK
	PnsLEzDiZPkSggABGw1ftJsK318vzOrCOGkbRnfUWTy6q5I/L1/fU5h4snd1x6nMUoOtPoednRfHn
	jDf4pcqSQq5ypoiXEDWiVzWKSObeQSm3OOflf71Wxs320FHTYS06VIyVX7Aq5n1Kt/UKKezTKw2NB
	egE/RmV06MsWgAT1uo8MRvgTCQmTNHUj5wK4b82Yd6YC6/rVmQcZWNJvD3RmyScG9D13dHsYzINDd
	0q8Gmvk0rngnaNB0TklOPAlI3NZOkARUJ21pFjsJlZJL2US/ySO8atUJ2Xz1yBaUulaL9Lt+5H3xC
	4DQdTRZw==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFieo-00F95d-3k; Sun, 02 Jul 2023 00:01:30 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFien-00FECR-1d;
	Sun, 02 Jul 2023 00:01:29 +0200
Date: Sun, 2 Jul 2023 00:01:29 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 4/4] riscv: dts: starfive: add dma controller node
Message-ID: <ZKCiOQ0IuptKO8kr@aurel32.net>
Mail-Followup-To: Walker Chen <walker.chen@starfivetech.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
 <20230322094820.24738-5-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322094820.24738-5-walker.chen@starfivetech.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_150155_960025_1DB42D11 
X-CRM114-Status: GOOD (  13.35  )
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

On 2023-03-22 17:48, Walker Chen wrote:
> Add the dma controller node for the Starfive JH7110 SoC.
> 
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 17220576b21c..b503b6137743 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -510,6 +510,24 @@
>  			#gpio-cells = <2>;
>  		};
>  
> +		dma: dma-controller@16050000 {
> +			compatible = "starfive,jh7110-axi-dma";
> +			reg = <0x0 0x16050000 0x0 0x10000>;
> +			clocks = <&stgcrg JH7110_STGCLK_DMA1P_AXI>,
> +				 <&stgcrg JH7110_STGCLK_DMA1P_AHB>;
> +			clock-names = "core-clk", "cfgr-clk";
> +			resets = <&stgcrg JH7110_STGRST_DMA1P_AXI>,
> +				 <&stgcrg JH7110_STGRST_DMA1P_AHB>;
> +			interrupts = <73>;
> +			#dma-cells = <1>;
> +			dma-channels = <4>;
> +			snps,dma-masters = <1>;
> +			snps,data-width = <3>;
> +			snps,block-size = <65536 65536 65536 65536>;
> +			snps,priority = <0 1 2 3>;
> +			snps,axi-max-burst-len = <16>;
> +		};
> +
>  		aoncrg: clock-controller@17000000 {
>  			compatible = "starfive,jh7110-aoncrg";
>  			reg = <0x0 0x17000000 0x0 0x10000>;

It appears that this patch has never been applied, although the rest of
the series has already been merged. Unfortunately it doesn't apply
anymore due to other changes to that file.

Could you please rebase and repost it?

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
