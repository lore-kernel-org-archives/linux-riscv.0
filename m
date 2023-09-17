Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E58CD37B4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUFTokbZAj5JHq2cXBvorRrA8fieyNjIn67Nb3+sb8o=; b=LQebx0rPQdJRMx
	vN4qGOcdHNDoa5+3wr+Y8O0dEZ934OPJWxtdUG5NaTQcjuZgLXmpxt9wbjiSYqmo6O5gtZtuxDlIy
	xaGN8wel+XRucybmAKTr6NVAVEQX4EiR7OLIQZ3t1cMjVMO16caGRNwpxi4jNrzkLjnyy2gTwDv7H
	OuwGWuKNKJ7Hwn/JJRxkibJCFAQ94TgEPpcyy5V0TpEKfU7BYarkEGEsV87imEwHJgunv/yhP4S1R
	Q892jJIZBr4Pwh1TXlz2r83yeh7m9UaLInP9WwFOXH0NjmfiNNRzv3HQwt3CPmNQGDcvbeFcxy6kM
	+LZe2P0+LQfJCPn9QxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qht0V-00DjWp-2q;
	Sun, 17 Sep 2023 14:44:19 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qht0T-00DjWK-2W
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 14:44:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c93638322so797134766b.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961856; x=1695566656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76MVv177zY9dsxPsQgQCgjtWxWwiLSVOTVF9dOpujsM=;
        b=bLBSPgtytoPu4aGN6wnir5cj1V4DKB4F/AkhIakWY3RcfLeDKCQbh4ejlSUo+QxC05
         EDtHR3tN30gnExuzYgl8NbU1bRiWJMrPcOyxvvNLiwQL6T3AOVwgGFngxyTKW8tB9jGC
         wnD4M5mu3lA8J/X0rOINO9yW6wv1DF3vqa8Q3/1rwnuom3AyhsIIsMneT/BrOfo9IlI1
         QsW9bdsFunLDVAynrdUHEFtl55WuT35H2WERlpyHQDZQDDQIU9Dsajm88ss9729uIFXO
         zM74Id+nmAd8oTWSsKXrB1dAlqAg4xQA3D8y9bH2pEijcEaeA8dZsM8ughKbZvrXt2gZ
         XZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961856; x=1695566656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76MVv177zY9dsxPsQgQCgjtWxWwiLSVOTVF9dOpujsM=;
        b=d8plLrXwilsvfXEVQLxKV1+k8kPDVIPpY2vW6Q8eqwlPLwSPrxgZds98xRr1A54Rlw
         ok2AcFGY6qMBvwyRmrybOyRJ+LA/y1jMftuavGQhf5YyaHagJxMbr2vplYzyxZYp/VPL
         4LifMOJhS18buiPUFYk19TMWgsL8iYcF0vqAoABWN/Itb7V+8izSrhiGcMXJLv0ClIbj
         wOTH2nQ+yU7Us+vDYEVJkyVyY7mhx9CRZ48A9Ulns13eEsu2qjk9iAsfs6heVebY6C5G
         gUQqVPG/nBIMwI7xNhsZyt1ffBnflErCHYvwfZyU/1y3lDrrp+lQd0K1Y0m77gWUEajN
         VRWA==
X-Gm-Message-State: AOJu0YzBsRV+PdZr3SLBLNNeJ+Z7Q+1QpxODRdIAwVQ6njInjN0VMsit
	xuCjxyI9M8BX0LfYafl2ZhubayVngXgl0w==
X-Google-Smtp-Source: AGHT+IG10fQvNKmNWOCHHO3EJrMAN6SKA+/1Io0nXHROE7X4TQTiZl1pdzhSV1Hr6ZXK4WLsYWLxDQ==
X-Received: by 2002:a17:907:728e:b0:9a1:c69c:9388 with SMTP id dt14-20020a170907728e00b009a1c69c9388mr10830626ejc.37.1694961855448;
        Sun, 17 Sep 2023 07:44:15 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id e24-20020a17090681d800b009a2235ed496sm5176569ejx.141.2023.09.17.07.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:44:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: allwinner: remove address-cells from intc node
Date: Sun, 17 Sep 2023 16:44:12 +0200
Message-ID: <4863891.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230916-saddling-dastardly-8cf6d1263c24@spud>
References: <20230916-saddling-dastardly-8cf6d1263c24@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_074417_820079_AC2D0FF0 
X-CRM114-Status: GOOD (  14.13  )
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

Dne sobota, 16. september 2023 ob 11:14:00 CEST je Conor Dooley napisal(a):
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A recent submission [1] from Rob has added additionalProperties: false
> to the interrupt-controller child node of RISC-V cpus, highlighting that
> the D1 DT has been incorrectly using #address-cells since its
> introduction. It has no child nodes, so #address-cells is not needed.
> Remove it.
> 
> Fixes: 077e5f4f5528 ("riscv: dts: allwinner: Add the D1/D1s SoC devicetree")
> Link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.41844
> 68-1-robh@kernel.org/ [1] Signed-off-by: Conor Dooley
> <conor.dooley@microchip.com>
> ---
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Chen-Yu Tsai <wens@csie.org>
> CC: Jernej Skrabec <jernej.skrabec@gmail.com>
> CC: Samuel Holland <samuel@sholland.org>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-sunxi@lists.linux.dev
> CC: linux-kernel@vger.kernel.org

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi index
> 8275630af977..b8684312593e 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -30,7 +30,6 @@ cpu0: cpu@0 {
>  			cpu0_intc: interrupt-controller {
>  				compatible = "riscv,cpu-intc";
>  				interrupt-controller;
> -				#address-cells = <0>;
>  				#interrupt-cells = <1>;
>  			};
>  		};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
