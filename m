Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A13C5B555
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0RXGPL6dh3q9lDwPY9PXNbg2FUAq9Wfy4DHFpGtNNE=; b=cgqh/tfRxkfHMs
	CFl4BPFZ92a430k76sabdqn4JeMtpeqluScGIIgcTffa3LBDorrLBjLb0EPOouq70ctwYGye1BmiT
	QRS8yOdT7sUVcdNWh76DzUoPczOaQ9TyZXqiWY5C3z4HrBlkTy3KilLwEKkn/zIhZHohtm3D4PtLl
	mErOYkeutas0CdsKXG5Jw2MdGaHCLGF1aEbtCuXweI/HV6kT1IeNDHKS/3OGOThCsk+7jfI7yd0rH
	Ch/kLftmEfFzk3c4TTgVOgDWhHKMA63GT/BKkLVw3ICJ10YcGr3J19UU2CVeuOxq8ZTXHVvnv5Ehn
	bSem6aZzdn62SFLb7s7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQl3-0000000AvPd-3hyu;
	Tue, 03 Jun 2025 12:28:45 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQk8-0000000AvAX-0gOz
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 12:27:49 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso4770202276.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953667; x=1749558467; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
        b=k6hAL+rQsXsxFAxCrdELh4O2ueTX4yMOjgoLfC2/W0oaMlp3EVu7JoPP4l0UKwLtTf
         7gmYBwHpMeiSM0Sf4T3UT9ZM26nnAdSVQqxpjKu6e4QQIiDojOlVWLn1peoyWGReeGPq
         TgqYm8TfKqzX/8tsbsHEnM4m+CLZ1jhApdMhAOQvJidHyTVew2Y5ivlp8q8QWguV7z6V
         BqvrP2oSZ8DovnJWJMXMadrklIfCUTqdvQYZmCRU68WOPOAnsSdFHkWWQLQ0m7VhOmcV
         gdbreEsFpOFUNjisn2OtztPYlzlcWjT0X+NoMyXKiao9k6uhnNjSfjczpl+QPhgS7I1n
         lbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953667; x=1749558467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkBUpTusJpTA0VXTt0i8mXorEGwS/Hyqj+o9q7jAdU0=;
        b=o8d1AeqfNvT85tVBNIv8FtUteR578R3r0LOrXPOIkNNHJKskb9YYRxnA3RpzBSEKJ2
         /KNVOzcWnZ4XqPMOMNy8c8JkMCkoWrdzLuM32l5AXmF9VzJxKbBAQN/6BiZwALyqfqvv
         d7mfY4E9hk2dyUzy9ZL4/zmJdgetaCXTkHyeHPkxYq8zpVe9K5zAoJ7GNa+zmStbAiZw
         yJ8wgnlmq0CfdArEFrAYqLFvQ4oaBlSiK6iopP76YZ6CH2XT6XCwr0RFRAPr/tCBBeeD
         z7MNFLsBwiSfULfaYTvKh73Q4KLn5BAkvYlv/HKaqztBWZ6qBac1ojHHUGfX/U9/+Ig/
         WUxw==
X-Forwarded-Encrypted: i=1; AJvYcCVK0luUUqw3Jd2YQAjNfGq1lKL0C0WvOqZnKtcTLZVNHaxsPuu+Qw6PAnGhoDfUcoFJvJ60tMWxW762zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRBMdaKvh+ZCLzzY5+vo6uqNzuO1C2YN+IvOvyCYeEcoax1UbY
	LI8Q+tg1lTjtfopEnhkyYWpCiEmdGbQomykgXi/7E5PJPWutiJMaCfxqlNCzzbLV+3+O/hcwxA/
	Ly418BSvckVBiUwUakAOAlKHeL5LX/Rd1Ypm5SbOlYw==
X-Gm-Gg: ASbGncsRtL0NVtIiTag2OG6dLROfBjjRYOc3DvV3Y8BNB+ZOEflDBu1J2LDJVqvtZoW
	i/mFzOiySX6YWwRBl28O/OclWKQW68gtliWpmvwD6kk8thfx89iCg6jv6dmydFk7nVxJAyY63Nz
	EkXGZHw5OG1uMyCH7OUhE1rYo+TADX+yv8
X-Google-Smtp-Source: AGHT+IHrpeHkj+2BBo06F52MCRNOttN7I/OSF6yK1xPb3e+88rZaXmBzR2xH+shfwb8QDbG4StP/a4Wb3x5cAxCSx/4=
X-Received: by 2002:a05:6902:6b10:b0:e7d:b0b6:1bf6 with SMTP id
 3f1490d57ef6-e7f81dfaa44mr21941753276.12.1748953666949; Tue, 03 Jun 2025
 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com> <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:27:11 +0200
X-Gm-Features: AX0GCFuhikVc4rQPnpXMCgeyFTV30-WWzpds7-nPqvmmTrY7jKqhLTeVB-8SqLA
Message-ID: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_052748_212489_DDAC076E 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
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
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>                 #clock-cells = <0>;
>         };
>
> +       gpu_mem_clk: mem-clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <0>;
> +               clock-output-names = "gpu_mem_clk";
> +               #clock-cells = <0>;
> +       };
> +
>         stmmac_axi_config: stmmac-axi-config {
>                 snps,wr_osr_lmt = <15>;
>                 snps,rd_osr_lmt = <15>;
> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>                         #clock-cells = <1>;
>                 };
>
> +               gpu: gpu@ffef400000 {
> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +                                    "img,img-rogue";
> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> +                                <&gpu_mem_clk>,
> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> +                       clock-names = "core", "mem", "sys";
> +                       power-domains = <&aon TH1520_GPU_PD>;
> +                       power-domain-names = "a";

If the power-domain-names are really needed, please pick a
useful/descriptive name.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
