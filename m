Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414C4C369B2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 02:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX/Gn0S9r9FStkaeob5otjB3GN1PlTKF3DWcm0J8m7E=; b=0Lmz5o5DDYskJm
	6r26Kb7KW2amdK4Ol8qWKn7PUldkeC8eFvMnf9kkkFkOe8cdRzLe8rx1Po/GBsW2FRU3xHmhmC3YQ
	HQQ1qSpiRpym00FNQ1PwyQXGkrv0eeeJzx1qYrVKZWoSP9EM49QoRXH3UQ0VYJkzJQJGmAS453SnT
	Z/Gz+eTI+2w/pNVT2o9C8Y74KDRs9/lob04blXXUCShD3YivRYQS4mX+ayeFyeYm/L+x3cmAHicff
	KV2jHvauHGnltF+aFRsauxyK2KQadDvXzq7CKxfEay4z85iZC46IsxycpMXwBa5BQJIxcQV2/fqyh
	x3NVmxC4O9BgMHDa8l7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4VfA-00000004AS6-0US9;
	Tue, 15 Apr 2025 02:04:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Vf7-00000004ARd-2YUG
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 02:04:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4299371a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 19:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744682672; x=1745287472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
        b=LffS5plqBWRfBeg7YW6T0yZgewo+KrSduqiXYqEjuhuQrEFIPDVqvM0UXZLJLADekQ
         Y+3SH0A/SpH96pxZ5k7fpI+Sd3RqmLoKvDc/myOaiy/FANFiyirsyVf8PMe0OcsLa1O7
         oZDr27jQsgPoycAW78ujkFrhOGEkqmOHx73LQxhClKdihSXeOzeb66Y3Coi97zEuXLcn
         Wn6iZU3ls/fbq9p5MBEs4rYvY/qlICU1wm3ieMRcDt7AkJNCPUt9BzaWyPVLOPvdwsm1
         j7f824sJsxWUsN+NDCWI7D0zWLG3HIcIvmoRci1Yza2Fh7ygV9VHgL6bn0mEYmAv/T8t
         JYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744682672; x=1745287472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
        b=lQ8ZyDVq6eGoOOinGTBiq4qgblPRp5p2qi0KsjN6naa1Iyqn5F4yfW6zZgcqrqPnoW
         C8KjrTy+GQoWkgVwTdhUrJtRo1oJDvp9ljkICKWxIUv9yaR+jVZ53ohz5zFpS9HjBs/E
         ovaeYcGKfkTVAVEMmEHlNIfKApaiX5l3XF503RMgaDYdeFGZUhSOB4NpOwqRz0yAUeXi
         /NPW/e+7s9coWL1VINoeXDQzJxGhBSfHA2IECcX6o3reBjM4KEPXdCksNZde4IkLToX/
         FX8h/+yYNGOOYSvMAI5sCW+/YFt10nCfrzJpH30aJwRPvnuHxD4P2tv8C7UrcYHuSf+g
         fpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZx6AGrivL16Vi0IUF2c7smMVG21mC40o4flMhb3aJkApk5Dtr4djrW3iUQqP/iH4gwVd0P6W8LYivvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTXy5tZK19IDgFuJsseCc/w/gBvDv7jWhqydHdi05UHiFEDzKD
	z2zNtPoaWzgaqMplU0xRPD7nVPC9lG5csCmSdEC+0RcHLlsu4mY1C3wl774NbNY=
X-Gm-Gg: ASbGncsFUHVl3IzCkqq4M6o+sSN9OsziRRKO37/W88k0ut1WiYUu2Nd4r3CQqufo3eD
	P1kjwtqJfip9c2YtbGhblAljI1iGRsWc56HdMhH9nmemr3nqcxzUKkllL3BaB4SIBPSJWzPQMN9
	cgxuYpSj/eEPZAYIJfj+Ovg8qcNT7jlDZn1H6gr8e35FLOIDEbPlP2E1bR97GzVP2CHJr53eoEe
	Q5sE/u/2LTLK7dqmQ0PLUB0mLZSH1QeEs0zVSbcu9xVFpjp9vfoRuwYmE3gmowRgJ4ltrv6oOiI
	xDcrLLv84a9NOSDLX29fZGoxM0P65jTlk+Z8YlBue/d7DNA=
X-Google-Smtp-Source: AGHT+IEGINtwuIIvAG2vOyy+05/hzxGzcyCN3rLg9V0W9dc2TsjoIN0MbhxjBGLcyWirEoR5Ps2qpQ==
X-Received: by 2002:a17:90a:d64d:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-308237b9f43mr17682243a91.24.1744682672433;
        Mon, 14 Apr 2025 19:04:32 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm13372486a91.25.2025.04.14.19.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 19:04:31 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:04:29 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Message-ID: <Z/2+rbhsaBP0DQop@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-20-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_190433_915452_F8E4BCE9 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> TH1520 SoC implements power management capabilities through the E902
> core, which can be communicated with through the mailbox, using firmware
> protocol.
> 
> Add AON node, which servers as a power-domain controller.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 197df1f32b25..474f31576a1b 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +#include <dt-bindings/power/thead,th1520-power.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
>  		snps,blen = <0 0 64 32 0 0 0>;
>  	};
>  
> +	aon: aon {
> +		compatible = "thead,th1520-aon";
> +		mboxes = <&mbox_910t 1>;
> +		mbox-names = "aon";
> +		#power-domain-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I tested this on top of 6.15-rc1 and found no issues.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
