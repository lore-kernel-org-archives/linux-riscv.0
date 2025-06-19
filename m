Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF35C7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 02:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJbbDNyD7/CiIMqIeJaX2LJAVtWiAXra9yX7yoojXdo=; b=4QjsnHv6OmUZqT
	UCk61GNn7dROHqzA82zKAOk6+alt8dgWMK2D+vWGDlyIkwa7ClonOsYYIsHYBghOv1TmdRVrA5F7r
	MR3+ZeCCw4/Fbkr2svsSw1drvk87ruWDF3uo+F3l3IdbglVO37MCUfbkWlgjc1EjCtjUNhOoPdD7G
	jbGqOkbE/LFsZ5AG1b8KUkv3lSqOdVQHrcxP9zseU9sxUkP+hVVKNtRdC0AkOBDAez69z3wC6diXW
	VInD6TAcC0G6O04KcEce71YpV3wE1s+6b+3Lj1gkWt2VWaqT0F3GcnqF1nHOmUXftWhr0wzdAFjTw
	sHM91ou/0A7ucG8/5OLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5M5-0000000BqjG-2ZD3;
	Thu, 19 Jun 2025 02:50:21 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5M3-0000000BqiZ-3L3R
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 02:50:21 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3137c20213cso227919a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750301419; x=1750906219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
        b=PiTZUqsNwiCoO7BWkNaV9Yngrz5tAPwhbxHAPg7cjGP4q3c/tDaqvYd+3/bSlTP6ON
         6k119Lzr/NZabfayJo/VT2M8T4lsZ0Gzuh5PBqA9Wy7bTks2rkoZG3xCUpOwQyMQTduQ
         XZ8uMtPsqlqrMbLZ/tr2ec4d80AsGPuO9NwDNORNmi5fut+OV1M8+/FOx2fdJ5dq4Aio
         bS1DLnS1z8bATW/S2JYfYb2BlwtOWdmvfxMH3qgzPqhpjHmOVrnj4UBBWCGZHbI1cjGF
         8WpRSmprgRLj/WTSMq47dp6DYYjWFEI16xywUuRvmWvhqPPVMs41WxJ0wZm0I1FyvWN8
         Jmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301419; x=1750906219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
        b=f7t6Tz9RjUX6j20BK01kBTgYSD9K4sUx9H1B4u3+LWntKEErJqakRmjbsIN5XQ5ArK
         4dVw+24v01XrbsaU5GKCbPV3+B9+wMjyQQxGeFBv/Zs2BREmFSfAyJ2eQ4Q3JoVcMtZH
         BJLtcht7voR+DF/dZo6/9lTI8HTN/MAfjy4wXBjnxzW4sGCx/02GkeW3LX8AclmJfOWA
         4Ik1W79euvwWQHrXTsFwm2w7+Q9YZEbB1xIrTtl3oEixcJuupAWtOsbaV0gRo4LygY+a
         pwfzuTbl+5pEXuaVFiJqKIjTDQWiuRKMzxXayess8jqpnOeNmAiGmRzqSzrD/Zzrz4tH
         CzPg==
X-Forwarded-Encrypted: i=1; AJvYcCVmxoM8HtU5gG5KKP/a0J0isM4XnFoF5IJalxPFgVgr/bfKkxRWzuht4JPGl0/3PGnCBMuVP+aE43U1YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFyHI/qTVrmtt4LRLqinqmynoaO9XEpoagzI9QK+TPB5YB+vY1
	GUpbHVrsZBd+xGDIdINPYnewL4B5OLbN6GYUv9RkJi5zdWjxzKExA7J6MP2FA4A+unA=
X-Gm-Gg: ASbGnctU802A9zWoKhqKy+utLrhoDci9Y+TNNL7GVacIRFjuOLA/A1E2a3+utPYCr2w
	E4zWVNPETjLWcywL0WdHcs60dObrmTD3+llLlQCz1oM5pRF+wwAO65d0JXTpUkiIH1iPdHJo1Ik
	KKFXXzQx93PMDyeY95pKwN7XBamwJdsJj19rI3v9aPThenJHIrCQJWh53lF/XxESSPubNzq829I
	qG24cqLVH9ey8IBSFJ4JApHHAFG0+Z0Zr29hUDXW3srAk8RU8O4dcXxxG3IbhqPxlRjM01cCu4i
	O4MJPlXqglxiSNev6UZFcgT2c1Q/RW8lyhe0w0KC3GH9iW/c1DlsmQNFt3NHKVXROayxKoI=
X-Google-Smtp-Source: AGHT+IFubn9Xjjn7fmMto+xZqblm2yd0WPXfa0iuVG1BkV+6lAGb7+2YAe7yAyYCgSsbecVsjsPVIw==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr26840306a91.29.1750301418839;
        Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a25617asm985583a91.33.2025.06.18.19.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:50:16 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aFN66I9GsCb9qC4G@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_195019_923940_05EC0EFD 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed, Jun 18, 2025 at 12:22:13PM +0200, Michal Wilczynski wrote:
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
> 
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
> 
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index f3f5db0201ab8c0306d4d63072a1573431e51893..c8447eef36c3a6e92d768658b6b19dfeb59a47c4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells = <0>;
>  	};
>  
> +	gpu_mem_clk: mem-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		clock-output-names = "gpu_mem_clk";
> +		#clock-cells = <0>;
> +	};
> +
>  	stmmac_axi_config: stmmac-axi-config {
>  		snps,wr_osr_lmt = <15>;
>  		snps,rd_osr_lmt = <15>;
> @@ -500,6 +507,21 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpu: gpu@ffef400000 {
> +			compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +				     "img,img-rogue";
> +			reg = <0xff 0xef400000 0x0 0x100000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_vo CLK_GPU_CORE>,
> +				 <&gpu_mem_clk>,
> +				 <&clk_vo CLK_GPU_CFG_ACLK>;
> +			clock-names = "core", "mem", "sys";
> +			power-domains = <&aon TH1520_GPU_PD>;
> +			power-domain-names = "a";
> +			resets = <&rst TH1520_RESET_ID_GPU>;
> +		};
> +
>  		rst: reset-controller@ffef528000 {
>  			compatible = "thead,th1520-reset";
>  			reg = <0xff 0xef528000 0x0 0x4f>;
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
