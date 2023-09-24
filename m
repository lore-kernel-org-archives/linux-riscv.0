Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB498CE7A8C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIPwGrTeIqs67aW2hAht7XNgyWHCCJaIU28GXY/IM8A=; b=iEPn03RYyGTBhD
	pfeDM9UCkfaG6oXAPOqn1kxTRzw5MMUoSaS3fRZEWeqJE5ttuH7HVDecFaXKx1kscUuMfNReodOYL
	Kgclk0eUdyYmEAUeQU736l4Nw/wyD1+ogMm8cI8HWw2OndQxgojNC9AE4SaDlRH9vqz4IJIVh7Pdw
	0hG99u/4BNVdq7/Wb5x/fzHzfS8XPxIYg7TvzgRbDkjjQNxPhKc4u84cHqVOJBwHJ3wu6LYHzYNCO
	TjYQC17p75tX0R4eUPRJIw8cweciWkczNpAr4XjZr7g+aKt+cjdShjjjphYohsh/UKKzN2IRUaHnf
	5cDKcZYCyrp3Mcd0u0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVBi-00Ck74-0a;
	Sun, 24 Sep 2023 19:54:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVBf-00Ck69-2Q
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 19:54:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so11933184a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585278; x=1696190078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBJ4eW5WukCsQ+DoRqfNvvhyVgTkVqFsDx/NRH21ELQ=;
        b=Rif6snK1ftS8E2delrbSfTioUX67yjlzSsfKQM4b0DR/bHXGvRMAf13nUzdjwF7ujO
         GNZDNQjwSM4PUTALs92lVM4PV4lzN3wDdP6XFNvLDPwD0aVhDjQABeQcidsjW/mhGEN7
         fbI1oXPx5evG9OyDN77mkMIPT2s5n55Ot5QYYP/MbDcZV5B9EuKECXkwzHGa8GmTmPqK
         KijGk9It1kibUPiYbFDHTrJXGAEcPqDx/YexZMTp13dVvKgMl4ZLLP6eowBIoPDWEAkg
         fYY8RSzGPsCH6bBA/+makCWrOHxxWcytUW4WsgQ/nVULMy/r73Zex0XzoKgSGAZtTdJp
         yIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585278; x=1696190078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBJ4eW5WukCsQ+DoRqfNvvhyVgTkVqFsDx/NRH21ELQ=;
        b=XnibWwJfkABGryABeW+3b3KmkS357eSTwgCxjlhMax88M6TdZm5EvXIpRlm8o2Rjth
         4WvVU3tgGaJBfErVCPduymyUMap40g8yFW3BL1/CR3VeLa9O0E/2ShBUR5ElIfcGECRB
         CYNgUlNk5eMDtuE5e8bnh/Y9qTApyiyrWo3EKKm1K270ebkMoD61YkNa7v4bQ6ta7NjC
         qjcLjvDabBndfbl3VwToBCcn8E4f6IeIE9ATVzGsV1QpF2ceL2FIXjBX8oAv5lWmcZ8d
         kHrPOxSVeU3Crp2P0xorTPBZ18QgS9O5hTHdGozYuc/Ky5JiOg0s06sdZNHfid3+WEwA
         XVmg==
X-Gm-Message-State: AOJu0Yx+9H85xVOc1QrCZ4fETMScCCBMOEM1ausw6FAaLPRIQtYokl5o
	X+YlHVcPYO4V0tG47YQ1TghIsjgTTP93Cw==
X-Google-Smtp-Source: AGHT+IEg4Ffl4e4EwIXj2zJUO5/CRFwkOyfOlyWF1+MbH0y3nxE8C2jfCFV30MbtEJIi+L7O2OTFSQ==
X-Received: by 2002:a05:6402:274b:b0:525:4d74:be8c with SMTP id z11-20020a056402274b00b005254d74be8cmr12848115edd.14.1695585277637;
        Sun, 24 Sep 2023 12:54:37 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7d38d000000b0052fe12a864esm4653293edq.57.2023.09.24.12.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:54:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: allwinner: remove address-cells from intc node
Date: Sun, 24 Sep 2023 21:54:36 +0200
Message-ID: <10341211.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20230916-saddling-dastardly-8cf6d1263c24@spud>
References: <20230916-saddling-dastardly-8cf6d1263c24@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_125439_792398_89744E6F 
X-CRM114-Status: GOOD (  15.24  )
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
> Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thanks!

Best regards,
Jernej

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
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..b8684312593e 100644
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
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
