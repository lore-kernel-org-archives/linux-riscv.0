Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097ACC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 04:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2fwoawAqEgoU6D7c020nJopbdbZ2CNo4Hzd6iQECRw=; b=hPeQ9nAJPSaeDm
	j2R1BGX6wcPMWV3YQ7KLKQGQUIVnpCiTj1HQN6MN8rVbAy0ivOoXzbAi+8jeukTsgZ50KIx5+49ys
	QFmtJ3/M6sdRXaj9/O1u8cOp9xaBSapR0jGMksc+b7XGv63Y3meo7O0r1KCqexslcZvQgc/jz64bt
	gRV2zZSVo9TVtLbuyNT6ZePPz9OvnObOmSd2AP5eNESGbpiPo3FAVlbnOusMottO/bHot6ld/HYaF
	LpZkkYshdi/rydOh7oDcMw36SkJ4DBbrptPCBSHQCq5Fg9D+LG9NoDpQ9MW0/z5wXjYTop0Pg0ewx
	s5bGi5c1o6AEOFsk/2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqT3A-009An3-7E; Fri, 26 Nov 2021 04:41:28 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqT37-009Amc-9M
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 04:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637901683; x=1669437683;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hZVtXpFqRJMlYlS8FsJlFSo33nXpxC5l4eca17rTe8Y=;
 b=AFsts0evx471qWTsjbwkFvwLNaSiDCeq0HYq/DIagutv1sepuUiDBCpC
 oXEJePGAk9OMwlF2yGQYpGGuO2m6dATLJ/xynD9/6Tzn5TmyObq3xlDLX
 pmtL3FZ9p+WpXMogoCl9idD1Kwwu7eYjLE0IYGOpEvU8eWX8na/mDmXJG
 bWjQjP4QdGZCGHmfmPQ6N9pb1jHOIphbcBY+K4h4peMAS5wWLrl7wzip1
 KeclsOVX2ddRzyG8CsMA4kncu+LuiMNhUvT2xPdpUfiiC+1BiLYDU/Gz1
 rG3q99uLy3FAn1HRN1C9njgaFhG1pMAWualTqZYgGGwukJACizp76punx A==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631548800"; d="scan'208";a="186698526"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2021 12:41:22 +0800
IronPort-SDR: cuwURHw10Q/49fq0QGPnHYE/nIi4ZyI0D+pxKM6zXhB5Ijf4k2zzGqhyvHhGtAKkXCNwpoihti
 EsKhhYT0b5EluiA0n+67ac40xC1RBB6JJVMmo7qlu2ZbLtWV6i8rgEAvYCvzqm4U6ttWuaw7bg
 bZ6DG7AdJqjUPOdA2wkRYvBXP9OOaCzXDpfZpLcAwi902EAnQSvYBzUvYWxZKQmroSo45A+zYD
 fBSHxxOEAyYQ84u5xXfOWDFOhhw5cNAkahJJPc3ZRRRq2P1dpxWZ+DsyAz7KrmLyCARyiknEpU
 SYzO95wuSsMC/vZ6H8ZrMGPg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 20:16:14 -0800
IronPort-SDR: Tiw5p9fkF55vVQ/cqBStn0TvZ98JfhvdArfvkrlT7EAtqasEQGBxTHN2dfLxW0At2whYmsKNWk
 7QzVWGcUM54upKT1oROmz7S81RS1m157s2hBiVsB5gmvJWrtvuDB2S9ubWMXOAxUfaQBf7p3s2
 swN09z4DsJgFK8Ka7FpHXHnKUns6yRQc50an/2J5iy8s939RtXHXaH0ye4/JBp4MKeLY8D2CKQ
 DkiVhG9UZlwohVvrcAFEnjfDSt0wo/Fx4svaxZQMYYsddlY+BzivvZ/AoeSGU0Zz+OG444YJjc
 VdI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 20:41:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J0hsH1qzsz1RtVn
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 20:41:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1637901682; x=1640493683; bh=hZVtXpFqRJMlYlS8FsJlFSo33nXpxC5l4ec
 a17rTe8Y=; b=DWIjMGJio0vG28DQUAzRaAEtxJ3MDnFd/juG8rrVvrFGDlKf+MB
 fWKcPjTcxTKZzNDKK36QyLap//BBLEhLiBYo8LceUreeraCQToIyvGErLPNcOZrV
 wnLwMvVj++xJFwECJha9jlwhDHn8goiCGbi8F/yocRySsS60womtsBtW7fWhe5XY
 XXhuO1nQ2i52sQk8hmo/UKP7Ofmt2BFvHyImOtPLjqcPVIRZE2N0lqaF8UMGNwMI
 gpgVVIDEG79NhH6aBgwOMCIXLMWU1O4QDYyOQcwic7MPYM7WjwMHPVhIYa+fB1bn
 YY3AisRdmnT3ZIzQZm3EISe6Ci//xdNc/+w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id f4bndw4A_c1m for <linux-riscv@lists.infradead.org>;
 Thu, 25 Nov 2021 20:41:22 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J0hsD3RBnz1RtVl;
 Thu, 25 Nov 2021 20:41:20 -0800 (PST)
Message-ID: <adacaa4b-0afd-ef5a-f778-18ca5faee8a5@opensource.wdc.com>
Date: Fri, 26 Nov 2021 13:41:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/9] riscv: dts: canaan: Fix SPI FLASH node names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-2-geert@linux-m68k.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20211125153131.163533-2-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_204125_421903_14E497A0 
X-CRM114-Status: GOOD (  15.97  )
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

On 2021/11/26 0:31, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
> 	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> Fix this by renaming all SPI FLASH nodes to "flash".
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index 0bcaf35045e795ed..984872f3d3a9b9ea 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -199,7 +199,7 @@ slot@0 {
>  };
>  
>  &spi3 {
> -	spi-flash@0 {
> +	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index ac8a03f5867adbd0..7ba99b4da304218e 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -201,7 +201,7 @@ slot@0 {
>  };
>  
>  &spi3 {
> -	spi-flash@0 {
> +	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index 623998194bc18aab..be9b12c9b374acb3 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -209,7 +209,7 @@ slot@0 {
>  };
>  
>  &spi3 {
> -	spi-flash@0 {
> +	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index cf605ba0d67e43cd..031c0c28f8195777 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -174,7 +174,7 @@ slot@0 {
>  };
>  
>  &spi3 {
> -	spi-flash@0 {
> +	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> 

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Tested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
