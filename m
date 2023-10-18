Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ACECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qc4eSQ6gly2ne7Cg4e8ciH5ufgHNoTvZqc20ILOolT8=; b=rsXn0XG9wmr1nd
	EFUbp7eXY63FzOKmmynC8wrU7559/fI48nWfdHTIkor8UP8LdEx8hjq5dZPkW99Teo5huRZZ4NZOG
	+jKWC/isYSQSHnn1nwOJ0zDvJLAJqv58NndDhkvzv4bDSENE+N159wyNz6+jxa8Tvzs3PzSLgnoKU
	UMaWbU0aycjrIPtIX7yFeIwqaqXWW1oUiLFEZTn7TJ642cy/Y2XUCcAeIN/iche2rqbB5LTTo5BHT
	wbkJU32scXGyKdU3IYDdAyC9jdHj6udijDQYMN76F17I8OVl4Cn+QKBd0exRaHprMN/p+vLkIVD5+
	vktxe0Q0VoonLwYb3jcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBGa-00FRt2-1k;
	Wed, 18 Oct 2023 18:27:36 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBGW-00FRrT-0H
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:27:35 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1e10507a4d6so4945834fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697653650; x=1698258450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uuE8X3ARJ57BcGgPFMSf839t2rt9s7PXI27Pr/2dTZg=;
        b=kSZegNFFDQMteWexJ6MQpFO0T6ECPr8oQLOB6MNfxQEvGptNjzDztY0fxWq9nkJ/5v
         Yfx76ZPtAa0l8Zbm8/Kde4I0aIHzCxka6N1NqAclMJaQTj72818NnkaD5d1vlB7aV/df
         mSpOFbwn07jj/i+0rxGkFqvYjfLUIsO4iBVg6S5ZdLXv9FocNOOdGFF5Ar0p47CdLDSZ
         1IogOmpNxyk/tQ+85cjTbY+ufhKtMG8DqhJ8gDayN+oHVSXkdzUbnXMpydhu8NMZMgzR
         QHLeJymIGiYdHGfptATxf8yqFUZDL3BDdstXHIWza29McImpqVoYqBd+qxk9O5rxfNsF
         B2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697653650; x=1698258450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuE8X3ARJ57BcGgPFMSf839t2rt9s7PXI27Pr/2dTZg=;
        b=VDaV0JLNO2ZXuFEMGzJLsVxy7Oi6zZdEKGIZa4SYoks7sYXhEPQ4JGvyLUuc0GFMG3
         n5i0G1N0G6zF/Y8gqwZjHsKkLvx5DZ2jGpBAEZuvn24IE/yVlHfxk9oHZiOFQxPRvUVS
         pS3yNBPbVHp8q7kxi6jUBZFX0yMDPVR+nUSn3Du0xSgbJFtNdXUGbyRnxqyc1y0uKYBl
         x5zBmiULJIhxBC6yvXCQyQKRDxtmSLhVosvQ5UqEuzgpGXnytxIsVtuJFGSlmNdDFa/f
         PgkpBDvjen4srIRnEnhFNEA9D7Pa5ziYqjpYg+RJFBj8+xXkU0CIlwqajHc3f9mDLoF9
         glhA==
X-Gm-Message-State: AOJu0Yyv1JiFga6vR3H0KyPyVX5qctd5aaJllGY+7MAU3ZIfxVd3OKlD
	2Q2CkCbC41/8KRfcpF5kjTrpww==
X-Google-Smtp-Source: AGHT+IHTxg6W+gfUttFZTkmsb7RZ0F59rBYksqIf4mu3kIyHD+Qgwv4wIU2YHANGhJ4qREqy/1LLEg==
X-Received: by 2002:a05:6870:c0c:b0:1dc:d8c6:39f with SMTP id le12-20020a0568700c0c00b001dcd8c6039fmr253401oab.14.1697653650132;
        Wed, 18 Oct 2023 11:27:30 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:3b92:d9c:239b:cd56])
        by smtp.gmail.com with ESMTPSA id a6-20020aa78e86000000b006b4a5569694sm3684152pfr.83.2023.10.18.11.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 11:27:29 -0700 (PDT)
Date: Wed, 18 Oct 2023 11:27:26 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 3/7] mmc: sdhci-of-dwcmshc: Add support for T-Head
 TH1520
Message-ID: <ZTAjjju/Ymn7Svyn@x1>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
 <20231017-th1520-mmc-v2-3-4678c8cc4048@baylibre.com>
 <ZS/9y1kRyuRzznVk@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZS/9y1kRyuRzznVk@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_112732_127996_44581274 
X-CRM114-Status: GOOD (  34.56  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 18, 2023 at 11:46:19PM +0800, Jisheng Zhang wrote:
> On Tue, Oct 17, 2023 at 01:43:49PM -0700, Drew Fustini wrote:
> > Add support for the mmc controller in the T-Head TH1520 with the new
> > compatible "thead,th1520-dwcmshc". Implement custom sdhci_ops for
> > set_uhs_signaling, reset, voltage_switch, and platform_execute_tuning.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  drivers/mmc/host/sdhci-of-dwcmshc.c | 358 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 358 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > index 3a3bae6948a8..88ed0937c4e9 100644
> > --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> > +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > @@ -8,6 +8,7 @@
> >   */
> >  
> >  #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/iopoll.h>
> > @@ -35,6 +36,21 @@
> >  #define DWCMSHC_CARD_IS_EMMC		BIT(0)
> >  #define DWCMSHC_ENHANCED_STROBE		BIT(8)
> >  #define DWCMSHC_EMMC_ATCTRL		0x40
> > +/* Tuning and auto-tuning fields in AT_CTRL_R control register */
> > +#define AT_CTRL_AT_EN			BIT(0) /* autotuning is enabled */
> > +#define AT_CTRL_CI_SEL			BIT(1) /* interval to drive center phase select */
> > +#define AT_CTRL_SWIN_TH_EN		BIT(2) /* sampling window threshold enable */
> > +#define AT_CTRL_RPT_TUNE_ERR		BIT(3) /* enable reporting framing errors */
> > +#define AT_CTRL_SW_TUNE_EN		BIT(4) /* enable software managed tuning */
> > +#define AT_CTRL_WIN_EDGE_SEL_MASK	GENMASK(11, 8) /* bits [11:8] */
> > +#define AT_CTRL_WIN_EDGE_SEL		0xf /* sampling window edge select */
> > +#define AT_CTRL_TUNE_CLK_STOP_EN	BIT(16) /* clocks stopped during phase code change */
> > +#define AT_CTRL_PRE_CHANGE_DLY_MASK	GENMASK(18, 17) /* bits [18:17] */
> > +#define AT_CTRL_PRE_CHANGE_DLY		0x1  /* 2-cycle latency */
> > +#define AT_CTRL_POST_CHANGE_DLY_MASK	GENMASK(20, 19) /* bits [20:19] */
> > +#define AT_CTRL_POST_CHANGE_DLY		0x3  /* 4-cycle latency */
> > +#define AT_CTRL_SWIN_TH_VAL_MASK	GENMASK(31, 24) /* bits [31:24] */
> > +#define AT_CTRL_SWIN_TH_VAL		0x9  /* sampling window threshold */
> >  
> >  /* Rockchip specific Registers */
> >  #define DWCMSHC_EMMC_DLL_CTRL		0x800
> > @@ -72,6 +88,82 @@
> >  	(((x) & DWCMSHC_EMMC_DLL_TIMEOUT) == 0))
> >  #define RK35xx_MAX_CLKS 3
> >  
> > +/* PHY register area pointer */
> > +#define DWC_MSHC_PTR_PHY_R	0x300
> > +
> > +/* PHY general configuration */
> > +#define PHY_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x00)
> > +#define PHY_CNFG_RSTN_DEASSERT	0x1  /* Deassert PHY reset */
> > +#define PHY_CNFG_PAD_SP_MASK	GENMASK(19, 16) /* bits [19:16] */
> > +#define PHY_CNFG_PAD_SP		0x0c /* PMOS TX drive strength */
> > +#define PHY_CNFG_PAD_SN_MASK	GENMASK(23, 20) /* bits [23:20] */
> > +#define PHY_CNFG_PAD_SN		0x0c /* NMOS TX drive strength */
> > +
> > +/* PHY command/response pad settings */
> > +#define PHY_CMDPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x04)
> > +
> > +/* PHY data pad settings */
> > +#define PHY_DATAPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x06)
> > +
> > +/* PHY clock pad settings */
> > +#define PHY_CLKPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x08)
> > +
> > +/* PHY strobe pad settings */
> > +#define PHY_STBPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x0a)
> > +
> > +/* PHY reset pad settings */
> > +#define PHY_RSTNPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x0c)
> > +
> > +/* Bitfields are common for all pad settings */
> > +#define PHY_PAD_RXSEL_1V8		0x1 /* Receiver type select for 1.8V */
> > +#define PHY_PAD_RXSEL_3V3		0x2 /* Receiver type select for 3.3V */
> > +
> > +#define PHY_PAD_WEAKPULL_MASK		GENMASK(4, 3) /* bits [4:3] */
> > +#define PHY_PAD_WEAKPULL_PULLUP		0x1 /* Weak pull down enabled */
> > +#define PHY_PAD_WEAKPULL_PULLDOWN	0x2 /* Weak pull down enabled */
> > +
> > +#define PHY_PAD_TXSLEW_CTRL_P_MASK	GENMASK(8, 5) /* bits [8:5] */
> > +#define PHY_PAD_TXSLEW_CTRL_P		0x3 /* Slew control for P-Type pad TX */
> > +#define PHY_PAD_TXSLEW_CTRL_N_MASK	GENMASK(12, 9) /* bits [12:9] */
> > +#define PHY_PAD_TXSLEW_CTRL_N		0x3 /* Slew control for N-Type pad TX */
> > +
> > +/* PHY CLK delay line settings */
> > +#define PHY_SDCLKDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x1d)
> > +#define PHY_SDCLKDL_CNFG_UPDATE	BIT(4) /* set before writing to SDCLKDL_DC */
> > +
> > +/* PHY CLK delay line delay code */
> > +#define PHY_SDCLKDL_DC_R		(DWC_MSHC_PTR_PHY_R + 0x1e)
> > +#define PHY_SDCLKDL_DC_INITIAL		0x40 /* initial delay code */
> > +#define PHY_SDCLKDL_DC_DEFAULT		0x32 /* default delay code */
> > +#define PHY_SDCLKDL_DC_HS400		0x18 /* delay code for HS400 mode */
> > +
> > +/* PHY drift_cclk_rx delay line configuration setting */
> > +#define PHY_ATDL_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x21)
> > +#define PHY_ATDL_CNFG_INPSEL_MASK	GENMASK(3, 2) /* bits [3:2] */
> > +#define PHY_ATDL_CNFG_INPSEL		0x3 /* delay line input source */
> > +
> > +/* PHY DLL control settings */
> > +#define PHY_DLL_CTRL_R			(DWC_MSHC_PTR_PHY_R + 0x24)
> > +#define PHY_DLL_CTRL_DISABLE		0x0 /* PHY DLL is enabled */
> > +#define PHY_DLL_CTRL_ENABLE		0x1 /* PHY DLL is disabled */
> > +
> > +/* PHY DLL  configuration register 1 */
> > +#define PHY_DLL_CNFG1_R			(DWC_MSHC_PTR_PHY_R + 0x25)
> > +#define PHY_DLL_CNFG1_SLVDLY_MASK	GENMASK(5, 4) /* bits [5:4] */
> > +#define PHY_DLL_CNFG1_SLVDLY		0x2 /* DLL slave update delay input */
> > +#define PHY_DLL_CNFG1_WAITCYCLE		0x5 /* DLL wait cycle input */
> > +
> > +/* PHY DLL configuration register 2 */
> > +#define PHY_DLL_CNFG2_R			(DWC_MSHC_PTR_PHY_R + 0x26)
> > +#define PHY_DLL_CNFG2_JUMPSTEP		0xa /* DLL jump step input */
> > +
> > +/* PHY DLL master and slave delay line configuration settings */
> > +#define PHY_DLLDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x28)
> > +#define PHY_DLLDL_CNFG_SLV_INPSEL_MASK	GENMASK(6, 5) /* bits [6:5] */
> > +#define PHY_DLLDL_CNFG_SLV_INPSEL	0x3 /* clock source select for slave DL */
> > +
> > +#define FLAG_IO_FIXED_1V8	BIT(0)
> > +
> >  #define BOUNDARY_OK(addr, len) \
> >  	((addr | (SZ_128M - 1)) == ((addr + len - 1) | (SZ_128M - 1)))
> >  
> > @@ -92,6 +184,8 @@ struct dwcmshc_priv {
> >  	struct clk	*bus_clk;
> >  	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA reg */
> >  	void *priv; /* pointer to SoC private stuff */
> > +	u16 delay_line;
> > +	u16 flags;
> >  };
> >  
> >  /*
> > @@ -157,6 +251,129 @@ static void dwcmshc_request(struct mmc_host *mmc, struct mmc_request *mrq)
> >  	sdhci_request(mmc, mrq);
> >  }
> >  
> > +static void th1520_phy_1_8v_init(struct sdhci_host *host)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +	u32 val;
> > +
> > +	if (!priv)
> > +		return;
> 
> this is impossible, can be removed.

Thanks, will do.

> 
> > +
> > +	/* deassert phy reset & set tx drive strength */
> > +	val = PHY_CNFG_RSTN_DEASSERT;
> > +	val |= FIELD_PREP(PHY_CNFG_PAD_SP_MASK, PHY_CNFG_PAD_SP);
> > +	val |= FIELD_PREP(PHY_CNFG_PAD_SN_MASK, PHY_CNFG_PAD_SN);
> > +	sdhci_writel(host, val, PHY_CNFG_R);
> > +
> > +	/* disable delay line */
> > +	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE, PHY_SDCLKDL_CNFG_R);
> > +
> > +	/* set delay line */
> > +	sdhci_writeb(host, priv->delay_line, PHY_SDCLKDL_DC_R);
> > +	sdhci_writeb(host, PHY_DLL_CNFG2_JUMPSTEP, PHY_DLL_CNFG2_R);
> > +
> > +	/* enable delay lane */
> > +	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
> > +	val &= ~(PHY_SDCLKDL_CNFG_UPDATE);
> > +	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
> > +
> > +	/* configure phy pads */
> > +	val = PHY_PAD_RXSEL_1V8;
> > +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLUP);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
> > +	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
> > +	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
> > +
> > +	val = FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
> > +
> > +	val = PHY_PAD_RXSEL_1V8;
> > +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLDOWN);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
> > +
> > +	/* enable data strobe mode */
> > +	sdhci_writeb(host, FIELD_PREP(PHY_DLLDL_CNFG_SLV_INPSEL_MASK, PHY_DLLDL_CNFG_SLV_INPSEL),
> > +		     PHY_DLLDL_CNFG_R);
> > +
> > +	/* enable phy dll */
> > +	sdhci_writeb(host, PHY_DLL_CTRL_ENABLE, PHY_DLL_CTRL_R);
> > +}
> > +
> > +static void th1520_phy_3_3v_init(struct sdhci_host *host)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +	u32 val;
> > +
> > +	/* deassert phy reset & set tx drive strength */
> > +	val = PHY_CNFG_RSTN_DEASSERT;
> > +	val |= FIELD_PREP(PHY_CNFG_PAD_SP_MASK, PHY_CNFG_PAD_SP);
> > +	val |= FIELD_PREP(PHY_CNFG_PAD_SN_MASK, PHY_CNFG_PAD_SN);
> > +	sdhci_writel(host, val, PHY_CNFG_R);
> > +
> > +	/* disable delay line */
> > +	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE, PHY_SDCLKDL_CNFG_R);
> > +
> > +	/* set delay line */
> > +	sdhci_writeb(host, priv->delay_line, PHY_SDCLKDL_DC_R);
> > +	sdhci_writeb(host, PHY_DLL_CNFG2_JUMPSTEP, PHY_DLL_CNFG2_R);
> > +
> > +	/* enable delay lane */
> > +	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
> > +	val &= ~(PHY_SDCLKDL_CNFG_UPDATE);
> > +	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
> > +
> > +	/* configure phy pads */
> > +	val = PHY_PAD_RXSEL_3V3;
> > +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLUP);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
> > +	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
> > +	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
> > +
> > +	val = FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
> > +
> > +	val = PHY_PAD_RXSEL_3V3;
> > +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLDOWN);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> > +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N);
> > +	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
> > +
> > +	/* enable phy dll */
> > +	sdhci_writeb(host, PHY_DLL_CTRL_ENABLE, PHY_DLL_CTRL_R);
> > +}
> > +
> > +static void th1520_sdhci_set_phy(struct sdhci_host *host)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +	u16 emmc_ctrl;
> > +
> > +	/* Before power on, set PHY configs */
> > +	if (priv->flags & FLAG_IO_FIXED_1V8)
> > +		th1520_phy_1_8v_init(host);
> > +	else
> > +		th1520_phy_3_3v_init(host);
> > +
> > +	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> 
> Hi Drew,
> 
> IMHO, this doesn't work for sdio. Normally, for a sdio wifi,
> "non-removable" is set, then the EMMC bit will be set below unexpectedly.
> So I suggested trying cap2 & (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)
> and reflect this fact in the dt-binding, I.E if this host is for emmc
> then no-sd and no-sdio is a must. I didn't see other
> solutions.

Thank you for explaining. I will change the code to test that instead.

> 
> PS: can sd and sdio work with this patch?

After sending v2, I tried enabling the sdhci nodes. Initially, the
microSD card was not recognized. Then I realized I needed to change
th1520_set_uhs_signaling() so that it calls th1520_sdhci_set_phy()
for all devices and not just for MMC_TIMING_MMC_HS400.

With that change, the microSD card did appear as a block device and
I was able to mount the vfat partition that was on the card.

I did not try enabling sdio for the wifi module yet.

> 
> Thanks
> 
> > +		emmc_ctrl = sdhci_readw(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> > +		emmc_ctrl |= DWCMSHC_CARD_IS_EMMC;
> > +		sdhci_writew(host, emmc_ctrl, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> > +	}
> > +
> > +	sdhci_writeb(host, FIELD_PREP(PHY_DLL_CNFG1_SLVDLY_MASK, PHY_DLL_CNFG1_SLVDLY) |
> > +		     PHY_DLL_CNFG1_WAITCYCLE, PHY_DLL_CNFG1_R);
> > +}
> > +
> >  static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
> >  				      unsigned int timing)
> >  {
> > @@ -189,9 +406,26 @@ static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
> >  		ctrl_2 |= DWCMSHC_CTRL_HS400;
> >  	}
> >  
> > +	if (priv->flags & FLAG_IO_FIXED_1V8)
> > +		ctrl_2 |= SDHCI_CTRL_VDD_180;
> >  	sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
> >  }
> >  
> > +static void th1520_set_uhs_signaling(struct sdhci_host *host,
> > +				     unsigned int timing)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +
> > +	dwcmshc_set_uhs_signaling(host, timing);
> > +	if (timing == MMC_TIMING_MMC_HS400) {
> > +		priv->delay_line = PHY_SDCLKDL_DC_HS400;
> > +		th1520_sdhci_set_phy(host);
> > +	} else {
> > +		sdhci_writeb(host, 0, PHY_DLLDL_CNFG_R);
> > +	}
> > +}
> > +
> >  static void dwcmshc_hs400_enhanced_strobe(struct mmc_host *mmc,
> >  					  struct mmc_ios *ios)
> >  {
> > @@ -338,6 +572,85 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
> >  	sdhci_reset(host, mask);
> >  }
> >  
> > +static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +	u32 val = 0;
> > +
> > +	if (host->flags & SDHCI_HS400_TUNING)
> > +		return 0;
> > +
> > +	sdhci_writeb(host, FIELD_PREP(PHY_ATDL_CNFG_INPSEL_MASK, PHY_ATDL_CNFG_INPSEL),
> > +		     PHY_ATDL_CNFG_R);
> > +	val = sdhci_readl(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
> > +
> > +	/*
> > +	 * configure tuning settings:
> > +	 *  - center phase select code driven in block gap interval
> > +	 *  - disable reporting of framing errors
> > +	 *  - disable software managed tuning
> > +	 *  - disable user selection of sampling window edges,
> > +	 *    instead tuning calculated edges are used
> > +	 */
> > +	val &= ~(AT_CTRL_CI_SEL | AT_CTRL_RPT_TUNE_ERR | AT_CTRL_SW_TUNE_EN |
> > +		 FIELD_PREP(AT_CTRL_WIN_EDGE_SEL_MASK, AT_CTRL_WIN_EDGE_SEL));
> > +
> > +	/*
> > +	 * configure tuning settings:
> > +	 *  - enable auto-tuning
> > +	 *  - enable sampling window threshold
> > +	 *  - stop clocks during phase code change
> > +	 *  - set max latency in cycles between tx and rx clocks
> > +	 *  - set max latency in cycles to switch output phase
> > +	 *  - set max sampling window threshold value
> > +	 */
> > +	val |= AT_CTRL_AT_EN | AT_CTRL_SWIN_TH_EN | AT_CTRL_TUNE_CLK_STOP_EN;
> > +	val |= FIELD_PREP(AT_CTRL_PRE_CHANGE_DLY_MASK, AT_CTRL_PRE_CHANGE_DLY);
> > +	val |= FIELD_PREP(AT_CTRL_POST_CHANGE_DLY_MASK, AT_CTRL_POST_CHANGE_DLY);
> > +	val |= FIELD_PREP(AT_CTRL_SWIN_TH_VAL_MASK, AT_CTRL_SWIN_TH_VAL);
> > +
> > +	sdhci_writel(host, val, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
> > +	val = sdhci_readl(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
> > +
> > +	/* check if is possible to enable auto-tuning */
> 
> I'm not sure why do we need to check auto tuning is supported. Does this
> mean some of the sdhci hosts in th1520 don't support auto tuing while
> others support it?

I agree that this doesn't seem to make sense. This was logic I found in
the T-Head kernel. I've never seen that message print thus far during my
testing, so I think this if() block is probably unnecessary.

I just removed that if() block and I found that eMMC an microSD still
work okay. I will remove this in the next revision.

> 
> > +	if (!(val & AT_CTRL_AT_EN)) {
> > +		dev_err(mmc_dev(host->mmc), "failed to enable auto tuning\n");
> > +		return -EIO;
> 
> FWICT, the controller can make use of sw tuning if AT isn't supported
> but I think that could be an improvement in the future. We can focuse on
> AT now.

Yes, I believe software controller tuning is an option, and I agree it
would be preferable to add that functionality later.
> 
> > +	}
> > +
> > +	/* perform tuning */
> > +	sdhci_start_tuning(host);
> > +	host->tuning_err = __sdhci_execute_tuning(host, opcode);
> > +	if (host->tuning_err) {
> > +		/* disable auto-tuning upon tuning error */
> > +		val &= ~AT_CTRL_AT_EN;
> > +		sdhci_writel(host, val, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
> > +		dev_err(mmc_dev(host->mmc), "tuning failed: %d\n", host->tuning_err);
> > +		return -EIO;
> > +	}
> > +	sdhci_end_tuning(host);
> > +
> > +	return 0;
> > +}
> > +
> > +static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> > +	u16 ctrl_2;
> > +
> > +	sdhci_reset(host, mask);
> > +
> > +	if (priv->flags & FLAG_IO_FIXED_1V8) {
> > +		ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> > +		if (!(ctrl_2 & SDHCI_CTRL_VDD_180)) {
> > +			ctrl_2 |= SDHCI_CTRL_VDD_180;
> > +			sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
> > +		}
> > +	}
> > +}
> > +
> >  static const struct sdhci_ops sdhci_dwcmshc_ops = {
> >  	.set_clock		= sdhci_set_clock,
> >  	.set_bus_width		= sdhci_set_bus_width,
> > @@ -356,6 +669,17 @@ static const struct sdhci_ops sdhci_dwcmshc_rk35xx_ops = {
> >  	.adma_write_desc	= dwcmshc_adma_write_desc,
> >  };
> >  
> > +static const struct sdhci_ops sdhci_dwcmshc_th1520_ops = {
> > +	.set_clock		= sdhci_set_clock,
> > +	.set_bus_width		= sdhci_set_bus_width,
> > +	.set_uhs_signaling	= th1520_set_uhs_signaling,
> > +	.get_max_clock		= dwcmshc_get_max_clock,
> > +	.reset			= th1520_sdhci_reset,
> > +	.adma_write_desc	= dwcmshc_adma_write_desc,
> > +	.voltage_switch		= th1520_phy_1_8v_init,
> > +	.platform_execute_tuning = &th1520_execute_tuning,
> > +};
> > +
> >  static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
> >  	.ops = &sdhci_dwcmshc_ops,
> >  	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> > @@ -379,6 +703,12 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
> >  		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
> >  };
> >  
> > +static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
> > +	.ops = &sdhci_dwcmshc_th1520_ops,
> > +	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> > +	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> > +};
> > +
> >  static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> >  {
> >  	int err;
> > @@ -447,6 +777,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
> >  		.compatible = "snps,dwcmshc-sdhci",
> >  		.data = &sdhci_dwcmshc_pdata,
> >  	},
> > +	{
> > +		.compatible = "thead,th1520-dwcmshc",
> > +		.data = &sdhci_dwcmshc_th1520_pdata,
> > +	},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);
> > @@ -542,6 +876,30 @@ static int dwcmshc_probe(struct platform_device *pdev)
> >  			goto err_clk;
> >  	}
> >  
> > +	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
> > +		priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
> > +
> > +		if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
> > +		    (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
> > +		    (device_property_read_bool(dev, "mmc-hs400-1_8v")))
> > +			priv->flags |= FLAG_IO_FIXED_1V8;
> > +		else
> > +			priv->flags &= ~FLAG_IO_FIXED_1V8;
> > +
> > +		/*
> > +		 * start_signal_voltage_switch() will try 3.3V first
> > +		 * then 1.8V. Use SDHCI_SIGNALING_180 ranther than
> > +		 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
> > +		 * in sdhci_start_signal_voltage_switch().
> > +		 */
> > +		if (priv->flags & FLAG_IO_FIXED_1V8) {
> > +			host->flags &= ~SDHCI_SIGNALING_330;
> > +			host->flags |=  SDHCI_SIGNALING_180;
> > +		}
> > +
> > +		sdhci_enable_v4_mode(host);
> > +	}
> > +
> >  #ifdef CONFIG_ACPI
> >  	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
> >  		sdhci_enable_v4_mode(host);
> > 
> > -- 
> > 2.34.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
