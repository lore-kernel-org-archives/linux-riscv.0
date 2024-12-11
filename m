Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE92E77185
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAZy8AFmjhsRAwa0zoJDGspfde7tm9FyHz+p20xx2RQ=; b=bq18YBEsc6yRzb
	uRPLXu1LrTk+UOEjvCEAkDSRkFXFo3f1BZKS2SUjjHYtnGQ+yFIynSatLsHaSUdiBa9VwFV7JZxx1
	CDqQXjwoZCWgkagFhawHHhCKzmXeOOCgbZC6Q9ms1dN23FORPMX4IHpHoInriP9Iw+fFmTKtEEFdv
	3mvx4lem4kuO5u5g9k7v96oyG+FkZ8/6Te/b2+U8QDyDVkgIZOpneRQoufNEc8mCZs/3qEA+mOCf0
	4hJxoMUmZrkO+xvCQPREBLOlKGUE1gsXzh3MYR91VtflzEmBJvapM2yj+3Oay6dvaG/ARvdBxpJUE
	YA5tfFah4DQMWRQ7OVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ4H-0000000FXnP-2rXh;
	Wed, 11 Dec 2024 17:00:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ4B-0000000FXj3-1OOy
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 17:00:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216728b1836so19952175ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 09:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1733936402; x=1734541202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWqO7y57cWM6CWwmLstYLccTGjvJS+PAY2Pr1FYpjA=;
        b=C8jC4BZTdbfR0CMEEHiSLpazqdN+6v4SS2PqkA5EfQhO+As8ba76+W05eNJ9krR9j+
         kfx2d5sO9I9twn1nniGNdYf14nzKZEdJU+hhQEVVHY7v7CY2tl4mkr4QE9kNcfE4gu1Y
         jvD/H24GxASQdgjyIzVwUQ3Hd4pX/jPglChgqGg+RwNXSVHchff7G+wHIN9qwsDFcc3f
         /foR79+QUpSyuPi+MBjaPzvhgcyWHn/SqwAbNdWo+eRKVUnywh94xLNCTHvu9Eev+zMx
         7icPtVtIliOfuRukMqAWAF/AdUYCs6I86y78u5YrLSBB0s7oXG8uvl7uMS23qaSe8Xcq
         kaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936402; x=1734541202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcWqO7y57cWM6CWwmLstYLccTGjvJS+PAY2Pr1FYpjA=;
        b=YCJIVbuD6H9GgEp3Kc8/rlElAsgqIIIkEpfYzGyabNWiarDCnjVrddLXtHpcBNv3jU
         9lpch0ONW69EbKuH7dxpwUM5P660GWy8sJ6C5aKpE/iPoq4k2KrLSDcv/cF36LWCh+nh
         AKUsEXp6WRHGZ/w7XPdo6+E23IkkV7+qrDbhT6yUAi2T4LlFGN/CWFNzLbpZwqtyGvsK
         JNoPwsqX3tG0Qx20pXd1gbXkz3pcqTr5A13YGB/Jpbu5eeY1TYIXEwd84lU0tlAhSHHk
         O/Qm0AxCuGQDElltbfZdFxEAGHh9oHDo0qLhGXQRgab78THLQHZkuVzM1RWHj9tsgUaW
         61fw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Z93KzNX959DMz+L7G7gdKebNv/UQY+AQISNAzNXrXS6XFvt240f+/6baCeqKE6flB4291Hrz3ijrUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg2H/ShVacITKh7HYAjXNopqZpEWpf0hp6kVJH6lV7rRPUR+gR
	gBC0OX+3te+HqkLVVwZzbUIpiyk0qACM1jGVPn90W6s/AEWUysb4T7de1ASzArE=
X-Gm-Gg: ASbGncsW9KsTly69HXClbdx0tatFBYxcQtNQ/6lYO0DywuWY5h7qblcN6OCohNi9Xyr
	9XKWNUl/cNRnN+D7AyJsFiC1KIkpYbyHbG7RHImDpIN5wDis0N9SiBEuJfX3BNxl+qQX5yeAO15
	qCnbACaCGmqOUQCDP19+CFnmW5K0zlSHh8kX+rYRskC2HBtnmhDI/vJxIZ1ZLY067+6H3RicWHm
	3TbUifbOTiOv82F2FC8pDrYTSgUi2A8VFfsU/jc3+FnB/IBTJFyPTUPshN1yM7stiy7jtULdqms
	AQ==
X-Google-Smtp-Source: AGHT+IHKMDJy+8aMTo0L9V3kptUu4ExSspBRWYnaTTDSkbDRcqUrBQ6wSExEs1ilCcg4ibGX1mWAlw==
X-Received: by 2002:a17:902:e74d:b0:216:4b66:1f1f with SMTP id d9443c01a7336-2178aee74e6mr7394085ad.54.1733936401569;
        Wed, 11 Dec 2024 09:00:01 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2166ef8b8d7sm35272785ad.67.2024.12.11.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 09:00:01 -0800 (PST)
Date: Wed, 11 Dec 2024 08:59:59 -0800
From: Drew Fustini <dfustini@tenstorrent.com>
To: bigunclemax@gmail.com
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yangtao Li <frank.li@vivo.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
Message-ID: <Z1nFD5XHGzhYMVXj@x1>
References: <20241210083029.92620-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_090003_377926_F2F5FFDC 
X-CRM114-Status: GOOD (  23.36  )
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

On Tue, Dec 10, 2024 at 11:30:27AM +0300, bigunclemax@gmail.com wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz which is got through frequency division of source clock
> VIDEO PLL by 4 [1].
> 
> But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
> frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
> to work 4 times slower.
> 
> Let's fix this issue by adding fixed factor clock that divides
> VIDEO PLL by 4 for emmc/sdhci.
> 
> Link: https://github.com/revyos/thead-kernel/blob/7563179071a314f41cdcdbfd8cf6e101e73707f3/drivers/clk/thead/clk-light-fm.c#L454
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 17e32ae08720..1015fab95251 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -779,6 +779,13 @@ static struct ccu_div dpu1_clk = {
>  	},
>  };
>  
> +static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
> +			   &video_pll_clk.common.hw, 4, 1, 0);
> +
> +static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
> +	{ .hw = &emmc_sdio_ref_clk.hw },
> +};
> +
>  static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, BIT(4), 0);
>  static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, BIT(5), 0);
>  static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
> @@ -798,7 +805,7 @@ static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", p
>  		0x150, BIT(12), 0);
>  static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);
>  static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), 0);
> -static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", video_pll_clk_pd, 0x204, BIT(30), 0);
> +static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, BIT(30), 0);
>  static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, BIT(26), 0);
>  static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, BIT(24), 0);
>  static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, BIT(23), 0);
> @@ -1059,6 +1066,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
>  		return ret;
>  	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
>  
> +	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
>  	if (ret)
>  		return ret;
> -- 
> 2.45.2
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for fixing this. Reads are over 3 times faster now.

6.13-rc1:

  debian@lpi4amain:~$ dd bs=1M count=512 if=/dev/zero of=zero_512M.bin oflag=direct
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 11.8457 s, 45.3 MB/s

  debian@lpi4amain:~$ dd bs=1M if=zero_512M.bin iflag=direct of=/dev/null
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 6.60576 s, 81.3 MB/s

6.13-rc1 with patch:

  debian@lpi4amain:~$ dd bs=1M count=512 if=/dev/zero of=zero_512M.bin oflag=direct
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 11.5359 s, 46.5 MB/s

  debian@lpi4amain:~$ dd bs=1M if=zero_512M.bin iflag=direct of=/dev/null
  512+0 records in
  512+0 records out
  536870912 bytes (537 MB, 512 MiB) copied, 2.03638 s, 264 MB/s

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
