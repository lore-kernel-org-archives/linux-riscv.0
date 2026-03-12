Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AA7105A59E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w59oQ5zVdwRLLqeiAXnnI9ePL7whBlKWo6BtIzdKck=; b=Wb39+KCPXppJ+5
	OXa2yhjARTPFRWPe2AaVWR03RYtrPn98HqUMJBd55PTburGRRGyZcYMWYJ3g9akc9y2gOm4fvPO9p
	YiQs/YwUOSqPtX9mUqw8Hf812XYdDUO1ZL8dv6BEVsWWJdFtaa06kYcbN7Up0dMNkTGwFOJOu5GmK
	N3tuc6LiAiM1HajjyLFAPzPgENFw8uFWUrYw5+Zr+spY02GhPsOUHUPrGrkyvpI4CkDz50NZk7opp
	OLEwHfg1s+ssRwu1WHF0/j5GUwYHxQeic/LJKiStWKqfqG6e7ttcM6m5qL+wmi8y4aCOOP9NRrk/p
	P7QR/Pq73whbg+75QwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0g9H-0000000E8LW-1j6N;
	Thu, 12 Mar 2026 13:32:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0g9E-0000000E8Ky-2aAb
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 13:32:22 +0000
Received: from duge-virtual-machine (unknown [183.192.221.67])
	by APP-03 (Coremail) with SMTP id rQCowACnx949wLJpA8N1Cg--.52691S2;
	Thu, 12 Mar 2026 21:31:43 +0800 (CST)
Date: Thu, 12 Mar 2026 21:31:41 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Adrian Hunter <adrian.hunter@intel.com>, krzk@kernel.org,
	ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v3 2/3] mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC
 controller support
Message-ID: <abLAPc13t1+ik4R0@duge-virtual-machine>
References: <20260310064513.140093-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260310064513.140093-3-jiayu.riscv@isrc.iscas.ac.cn>
 <5cac60f7-46cb-45c8-9435-3ae88545ce4d@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cac60f7-46cb-45c8-9435-3ae88545ce4d@intel.com>
X-CM-TRANSID: rQCowACnx949wLJpA8N1Cg--.52691S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XryDCFyfXr13WFWxXw1UZFb_yoWDGr47pF
	WUAayYkr4DtF4Fgwn7Kan0vasIgrnIqr93K3s3G3yxtFs2kw1UWFyj9rWYyFyrZr4kAw17
	Xr1qq345ur9Ik37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [183.192.221.67]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_063221_217131_E893C0E7 
X-CRM114-Status: GOOD (  34.05  )
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

On Wed, Mar 11, 2026 at 04:04:03PM +0200, Adrian Hunter wrote:
> On 10/03/2026 08:45, Jiayu Du wrote:
> > Add SDHCI controller driver for Canaan k230 SoC. Implement custom
> > sdhci_ops for set_clock, phy init, init and reset.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  drivers/mmc/host/sdhci-of-dwcmshc.c | 287 ++++++++++++++++++++++++++++
> >  1 file changed, 287 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > index 2b75a36c096b..39d28574cfa8 100644
> > --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> > +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> > @@ -128,9 +128,11 @@
> >  #define PHY_CNFG_PHY_PWRGOOD_MASK	BIT_MASK(1) /* bit [1] */
> >  #define PHY_CNFG_PAD_SP_MASK		GENMASK(19, 16) /* bits [19:16] */
> >  #define PHY_CNFG_PAD_SP			0x0c /* PMOS TX drive strength */
> > +#define PHY_CNFG_PAD_SP_k230		0x09 /* PMOS TX drive strength for k230 */
> >  #define PHY_CNFG_PAD_SP_SG2042		0x09 /* PMOS TX drive strength for SG2042 */
> >  #define PHY_CNFG_PAD_SN_MASK		GENMASK(23, 20) /* bits [23:20] */
> >  #define PHY_CNFG_PAD_SN			0x0c /* NMOS TX drive strength */
> > +#define PHY_CNFG_PAD_SN_k230		0x08 /* NMOS TX drive strength for k230 */
> >  #define PHY_CNFG_PAD_SN_SG2042		0x08 /* NMOS TX drive strength for SG2042 */
> >  
> >  /* PHY command/response pad settings */
> > @@ -153,14 +155,22 @@
> >  #define PHY_PAD_RXSEL_3V3		0x2 /* Receiver type select for 3.3V */
> >  
> >  #define PHY_PAD_WEAKPULL_MASK		GENMASK(4, 3) /* bits [4:3] */
> > +#define PHY_PAD_WEAKPULL_DISABLED	0x0 /* Weak pull up and pull down disabled */
> >  #define PHY_PAD_WEAKPULL_PULLUP		0x1 /* Weak pull up enabled */
> >  #define PHY_PAD_WEAKPULL_PULLDOWN	0x2 /* Weak pull down enabled */
> >  
> >  #define PHY_PAD_TXSLEW_CTRL_P_MASK	GENMASK(8, 5) /* bits [8:5] */
> >  #define PHY_PAD_TXSLEW_CTRL_P		0x3 /* Slew control for P-Type pad TX */
> > +#define PHY_PAD_TXSLEW_CTRL_P_k230_VAL2	0x2 /* Slew control for P-Type pad TX for k230 */
> >  #define PHY_PAD_TXSLEW_CTRL_N_MASK	GENMASK(12, 9) /* bits [12:9] */
> >  #define PHY_PAD_TXSLEW_CTRL_N		0x3 /* Slew control for N-Type pad TX */
> >  #define PHY_PAD_TXSLEW_CTRL_N_SG2042	0x2 /* Slew control for N-Type pad TX for SG2042 */
> > +#define PHY_PAD_TXSLEW_CTRL_N_k230_VAL2	0x2 /* Slew control for N-Type pad TX for k230 */
> > +#define PHY_PAD_TXSLEW_CTRL_N_k230_VAL1	0x1 /* Slew control for N-Type pad TX for k230 */
> > +
> > +/* PHY Common DelayLine config settings */
> > +#define PHY_COMMDL_CNFG			(DWC_MSHC_PTR_PHY_R + 0x1c)
> > +#define PHY_COMMDL_CNFG_DLSTEP_SEL	BIT(0) /* DelayLine outputs on PAD enabled */
> >  
> >  /* PHY CLK delay line settings */
> >  #define PHY_SDCLKDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x1d)
> > @@ -174,7 +184,10 @@
> >  #define PHY_SDCLKDL_DC_HS400		0x18 /* delay code for HS400 mode */
> >  
> >  #define PHY_SMPLDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x20)
> > +#define PHY_SMPLDL_CNFG_EXTDLY_EN	BIT(0)
> >  #define PHY_SMPLDL_CNFG_BYPASS_EN	BIT(1)
> > +#define PHY_SMPLDL_CNFG_INPSEL_MASK	GENMASK(3, 2) /* bits [3:2] */
> > +#define PHY_SMPLDL_CNFG_INPSEL		0x3 /* delay line input source */
> >  
> >  /* PHY drift_cclk_rx delay line configuration setting */
> >  #define PHY_ATDL_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x21)
> > @@ -227,6 +240,14 @@
> >  /* SMC call for BlueField-3 eMMC RST_N */
> >  #define BLUEFIELD_SMC_SET_EMMC_RST_N	0x82000007
> >  
> > +/* Canaan specific Registers */
> > +#define SD0_CTRL			0x00
> > +#define SD0_HOST_REG_VOL_STABLE		BIT(4)
> > +#define SD0_CARD_WRITE_PROT		BIT(6)
> > +#define SD1_CTRL			0x08
> > +#define SD1_HOST_REG_VOL_STABLE		BIT(0)
> > +#define SD1_CARD_WRITE_PROT		BIT(2)
> > +
> >  /* Eswin specific Registers */
> >  #define EIC7700_CARD_CLK_STABLE		BIT(28)
> >  #define EIC7700_INT_BCLK_STABLE		BIT(16)
> > @@ -268,6 +289,12 @@ struct eic7700_priv {
> >  	unsigned int drive_impedance;
> >  };
> >  
> > +struct k230_priv  {
> > +	/* Kendryte k230 specific */
> > +	struct regmap *hi_sys_regmap;
> > +	const struct dwcmshc_k230_match_data *match_data;
> > +};
> > +
> >  #define DWCMSHC_MAX_OTHER_CLKS 3
> >  
> >  struct dwcmshc_priv {
> > @@ -275,6 +302,7 @@ struct dwcmshc_priv {
> >  	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
> >  	int vendor_specific_area2; /* P_VENDOR_SPECIFIC_AREA2 reg */
> >  
> > +	const void *match_data;
> >  	int num_other_clks;
> >  	struct clk_bulk_data other_clks[DWCMSHC_MAX_OTHER_CLKS];
> >  
> > @@ -284,12 +312,34 @@ struct dwcmshc_priv {
> >  };
> >  
> >  struct dwcmshc_pltfm_data {
> > +	const void *match_data;
> >  	const struct sdhci_pltfm_data pdata;
> >  	const struct cqhci_host_ops *cqhci_host_ops;
> >  	int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
> >  	void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
> >  };
> >  
> > +struct dwcmshc_k230_match_data {
> > +	bool is_emmc;
> > +	u32 ctrl_reg;
> > +	u32 vol_stable_bit;
> > +	u32 write_prot_bit;
> > +};
> > +
> > +static const struct dwcmshc_k230_match_data k230_emmc_match_data = {
> > +	.is_emmc = true,
> > +	.ctrl_reg = SD0_CTRL,
> > +	.vol_stable_bit = SD0_HOST_REG_VOL_STABLE,
> > +	.write_prot_bit = SD0_CARD_WRITE_PROT,
> > +};
> > +
> > +static const struct dwcmshc_k230_match_data k230_sdio_match_data = {
> > +	.is_emmc = false,
> > +	.ctrl_reg = SD1_CTRL,
> > +	.vol_stable_bit = SD1_HOST_REG_VOL_STABLE,
> > +	.write_prot_bit = SD1_CARD_WRITE_PROT,
> > +};
> > +
> >  static void dwcmshc_enable_card_clk(struct sdhci_host *host)
> >  {
> >  	u16 ctrl;
> > @@ -1656,6 +1706,205 @@ static int eic7700_init(struct device *dev, struct sdhci_host *host, struct dwcm
> >  	return 0;
> >  }
> >  
> > +static void dwcmshc_k230_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> > +{
> > +	u16 clk;
> > +
> > +	sdhci_set_clock(host, clock);
> > +
> > +	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> > +	/*
> > +	 * It is necessary to enable SDHCI_PROG_CLOCK_MODE. This is a
> > +	 * vendor-specific quirk. If this is not done, the eMMC will be
> > +	 * unable to read or write.
> > +	 */
> > +	clk |= SDHCI_PROG_CLOCK_MODE;
> > +	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
> > +}
> > +
> > +static void sdhci_k230_config_phy_delay(struct sdhci_host *host)
> > +{
> > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +	struct dwcmshc_priv *dwc_priv = sdhci_pltfm_priv(pltfm_host);
> > +	u32 val;
> > +
> > +	sdhci_writeb(host, PHY_COMMDL_CNFG_DLSTEP_SEL, PHY_COMMDL_CNFG);
> > +	sdhci_writeb(host, 0x0, PHY_SDCLKDL_CNFG_R);
> > +	sdhci_writeb(host, PHY_SDCLKDL_DC_INITIAL,
> > +		     PHY_SDCLKDL_DC_R);
> 
> Here and elsewhere.  Please avoid unnecessary line wrapping.
> You can use 100 columns.

Thank you. I will correct all unnecessary line wrapping.

> > +
> > +	val = PHY_SMPLDL_CNFG_EXTDLY_EN;
> > +	val |= FIELD_PREP(PHY_SMPLDL_CNFG_INPSEL_MASK,
> > +			  PHY_SMPLDL_CNFG_INPSEL);
> > +	sdhci_writeb(host, val, PHY_SMPLDL_CNFG_R);
> > +
> > +	sdhci_writeb(host, FIELD_PREP(PHY_ATDL_CNFG_INPSEL_MASK,
> > +		     PHY_ATDL_CNFG_INPSEL), PHY_ATDL_CNFG_R);
> 
> Can keep FIELD_PREP() all on one line:
> 
> 	sdhci_writeb(host, FIELD_PREP(PHY_ATDL_CNFG_INPSEL_MASK, PHY_ATDL_CNFG_INPSEL),
> 		     PHY_ATDL_CNFG_R);
> 
> > +
> > +	ret = read_poll_timeout(sdhci_readl, reg,
> > +				(reg & FIELD_PREP(
> > +					PHY_CNFG_PHY_PWRGOOD_MASK, 1)),
> 
> Need not line wrap after "FIELD_PREP("
> 
> > +	if (mask == SDHCI_RESET_ALL) {
> 
> Can reduce the indent by instead:
> 
> 	if (mask != SDHCI_RESET_ALL)
> 		return;
> 
> Then the remaining lines in this function do not need to be
> wrapped.
> 
> > @@ -1834,6 +2092,26 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_eic7700_pdata = {
> >  	.init = eic7700_init,
> >  };
> >  
> > +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_k230_emmc_pdata = {
> > +	.pdata = {
> > +		.ops = &sdhci_dwcmshc_k230_ops,
> > +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> > +			  SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12,
> > +	},
> > +	.init = dwcmshc_k230_init,
> > +	.match_data = (void *)&k230_emmc_match_data,
> > +};
> 
> Just an option if you like it:
> An alternative is to define your own platform data e.g.
> 
> struct k230_pltfm_data {
> 	struct dwcmshc_pltfm_data dwcmshc_pdata;
> 	bool is_emmc;
> 	u32 ctrl_reg;
> 	u32 vol_stable_bit;
> 	u32 write_prot_bit;
> };
> 
> static const struct k230_pltfm_data k230_emmc_data = {
> 	.dwcmshc_pdata = {
> 		.pdata = {
> 			.ops = &sdhci_dwcmshc_k230_ops,
> 			.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> 				  SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12,
> 		},
> 		.init = dwcmshc_k230_init,
> 	},
> 	.is_emmc = true,
> 	.ctrl_reg = SD0_CTRL,
> 	.vol_stable_bit = SD0_HOST_REG_VOL_STABLE,
> 	.write_prot_bit = SD0_CARD_WRITE_PROT,
> };
> 
> static const struct k230_pltfm_data k230_sdio_data = {
> 	.dwcmshc_pdata = {
> 		.pdata = {
> 			.ops = &sdhci_dwcmshc_k230_ops,
> 			.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> 				  SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12,
> 		},
> 		.init = dwcmshc_k230_init,
> 	},
> 	.is_emmc = false,
> 	.ctrl_reg = SD1_CTRL,
> 	.vol_stable_bit = SD1_HOST_REG_VOL_STABLE,
> 	.write_prot_bit = SD1_CARD_WRITE_PROT,
> };
> 
> Then:
> 		.compatible = "canaan,k230-emmc",
> 		.data = &k230_emmc_data.dwcmshc_pdata,
> and
> 		.compatible = "canaan,k230-sdio",
> 		.data = &k230_sdio_data.dwcmshc_pdata,
> 
> Although you would still need to add a pointer 
> to struct dwcmshc_pltfm_data from struct dwcmshc_priv,
> but then you could access it like:
> 
> #define to_k230_pdata(pd) container_of(pd, struct k230_pltfm_data, pd)
> 
> 	struct dwcmshc_priv *dwc_priv = sdhci_pltfm_priv(pltfm_host);
> 	struct dwcmshc_pltfm_data *dwcmshc_pdata = dwc_priv->dwcmshc_pdata;
> 	struct k230_pltfm_data *k230_pdata = to_k230_pdata(dwcmshc_pdata);
> 
Thank you for your suggestion. This looks better. I will make the changes.

Grateful regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
