Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20555C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 00:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaVyACOH8i13zbXzn30Z8S4VTRPXOAILnpGTsAM4kPc=; b=CBkzF5OnHkjEWq
	F97khayZcNTdOMyJGIKsmk7BeRTDsU7wyKVy2aQjDKJYM8DHAs2d6b68dngCRYjaMmxAL1r1oluih
	RBsj2UBJLCfEHC1FPNUhOj9d7VHb+s0PvjrWaKqUPwInfZqYHq9TBX8fop/S9vuTO4hF4VtElvko1
	KSxUzEaVPEZHQFiPX1gISQA4oCqw8nL9a8PnL+zvpuMIsKOy7+tBYkklsDSSAvEmdq+owHSrDAk11
	OnLXnB6LE7FUdG8s/XTP3A+Ryjrff8bBHju0/5YXmWa+UnHth6Xsp2NqLhUm1bZnI1GCzI1HoMdx5
	bhSMQu5ijCt9zRMSisdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r09bv-000CGA-1I;
	Tue, 07 Nov 2023 00:06:27 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r09bq-000CFX-18
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 00:06:25 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-35809893291so20135395ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 16:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699315580; x=1699920380; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mf5g5Mm+du9QPsx6fgXbExZqjKh6NGageD+9eQdsEU=;
        b=udCHdTlj+qaLFWOVkuGQVnc8Ulc3WssRbJTclEV6p1j9dcX+FNdhjHhVS3y+VYEs6k
         N9Pzs7v3EgCLyhE74wL0REnUVasVlj8Cn38YiF45oB5iAH2svnsOgSFxhaJ3NL8pwbti
         aYdRBkN3thWi+u3zH8rO3TuvVLUZMgErW74AGd8mROdaf/R0qEL08aGS93CuRE2nh1SF
         t/8wq7WkhJ3rAhQ5fQuz0PouKCAa/dB0Hx/oTkgabqxQI9Et8Pdk9n+fUlGkbrGfxAW2
         Rzvls0Op0ZoGqmrgNPQNovDe0V/3Xw3RfTcV1Wmjp03INKEkYphsICjqE5s5+OURhoBc
         zfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699315580; x=1699920380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Mf5g5Mm+du9QPsx6fgXbExZqjKh6NGageD+9eQdsEU=;
        b=gN1WMvRmRpiGo3NK9GMEgot2OXQk0r+TVQJmz3i139LSxcJgEbcjjYNEpvHIHdtorI
         S7BnsxdfJ/VFIgGmzw5wNN4VwBhPAQRIYGsSAuiSK5sS5npEeNIx1MxXSQmvn0TGSoBs
         gyxLiK0odUK4bs2y/4GFWe7+SwCNKJfmA+BdelsrGZwtKuoRP48FOXu5g0M6hH9MbaiI
         PLc7ITC0oj8JffO+H4VgcX//JaTloD8HQa/xNmzOu2uzqmR9LQ1n3yjQbWmU0CA0htDJ
         FqoYuU2EAAF7MhIloRbhRgKSaf30x5s3AYF0Age35P5sKxVvU6Zu/J9GhkdwX9Xl7jRF
         gwnA==
X-Gm-Message-State: AOJu0Yy58/meu4UjM8oYPZOBplas1aIMol+jTWRP6gwq7miLQc5Wt1JH
	utWPAG0vIc15ZatK2C9ygSB1SQ==
X-Google-Smtp-Source: AGHT+IGXGG7HlkQp7iDky/26odlQ2a4tHbOjMyliqsuluLh9F4tJK0Fjp95oKzUTCi0p0F55n2bikA==
X-Received: by 2002:a05:6e02:1bc3:b0:352:a73a:16f5 with SMTP id x3-20020a056e021bc300b00352a73a16f5mr1132291ilv.18.1699315580523;
        Mon, 06 Nov 2023 16:06:20 -0800 (PST)
Received: from x1 ([2601:1c2:1800:f680:9fcd:449f:a3b9:e442])
        by smtp.gmail.com with ESMTPSA id i14-20020aa787ce000000b006b76cb6523dsm6108528pfo.165.2023.11.06.16.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 16:06:19 -0800 (PST)
Date: Mon, 6 Nov 2023 16:06:15 -0800
From: Drew Fustini <dfustini@baylibre.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v4 3/7] mmc: sdhci-of-dwcmshc: Add support for T-Head
 TH1520
Message-ID: <ZUl/dw8/SnBpgLeG@x1>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
 <20231101-th1520-mmc-v4-3-86e0216b5994@baylibre.com>
 <6f68ab16-5512-4a48-ae28-e86ce989f578@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f68ab16-5512-4a48-ae28-e86ce989f578@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_160622_727803_441EE6F3 
X-CRM114-Status: GOOD (  30.17  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 06, 2023 at 08:42:38PM +0200, Adrian Hunter wrote:
> On 2/11/23 04:48, Drew Fustini wrote:
> > Add support for the mmc controller in the T-Head TH1520 with the new
> > compatible "thead,th1520-dwcmshc". Implement custom sdhci_ops for
> > set_uhs_signaling, reset, voltage_switch, and platform_execute_tuning.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> 
> One question below, otherwise:
> 
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> > ---
> >  drivers/mmc/host/sdhci-of-dwcmshc.c | 348 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 348 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > index 3a3bae6948a8..1a1386b742c1 100644
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
> > +#define PHY_PAD_WEAKPULL_PULLUP		0x1 /* Weak pull up enabled */
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
> > @@ -157,6 +251,126 @@ static void dwcmshc_request(struct mmc_host *mmc, struct mmc_request *mrq)
> >  	sdhci_request(mmc, mrq);
> >  }
> >  
> > +static void dwcmshc_phy_1_8v_init(struct sdhci_host *host)
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
> > +static void dwcmshc_phy_3_3v_init(struct sdhci_host *host)
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
> > +		dwcmshc_phy_1_8v_init(host);
> > +	else
> > +		dwcmshc_phy_3_3v_init(host);
> > +
> > +	if (host->mmc->caps2 & (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)) {
> 
> Perhaps you mean both MMC_CAP2_NO_SD and MMC_CAP2_NO_SDIO which would be as below?
> 
> 	if ((host->mmc->caps2 & (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)) == (MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO)) {
> 
> or
> 
> 	if (host->mmc->caps2 & MMC_CAP2_NO_SD && host->mmc->caps2 & MMC_CAP2_NO_SDIO) {
> 
> or some such?

Thanks for catching this. Yes, what I did is incorrect.

In fact, Jisheng had suggested this code in the v2 thread:

u32 tmp = MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO;
if ((cap2 & tmp) == tmp) {
	blablabla...
}

This is similar to your first suggestion above.

I'll fix this in v5.

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
