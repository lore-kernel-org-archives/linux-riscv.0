Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9D5F3094B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFJoqBcjFJhYdAY0gBWUaJsweA6OklMLndyGD4SAnLk=; b=oD0dlmeoS9noNy
	onR2iGHim/j3G06QPGlSaeU7v/CehR6unt5+j9PY0KkqFhZ11NnCZNE/vOaBrxwM3P2KhescY9y3N
	8jduRU9QymxpDfqEdh/8Gqa0Z5mgdm8YlNDCOKEeHX3G3KLyU0Gsk1H5WVAcNbz44EvgIGdu496VF
	Se8HrcSG3BphsR8WlZT3e+Wwr2gKzD9patbH2xZdDt/uneRxkEDsvogs5W+EwCGy5n3ARGEPaQRlM
	ibBuQWLuxUZlyDDVJmnmpxERoJ/wvJJGQ0K2cqx/eutyJIIL1Y7mFHgINg3pMnVFSEFmph7eJKHGD
	inPyqcQtGmnx24Dz1UxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7CZ-00000001hoQ-2i3U;
	Thu, 05 Mar 2026 11:49:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7CX-00000001ho0-2tXv
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 11:49:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dea72099eso2446359e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 03:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772711347; cv=none;
        d=google.com; s=arc-20240605;
        b=CwQCEkeCG5B1RlXZ/iDAolgIxRirdXBPABjAWC8A8qD8pIVNXmrUCcvASyuzIrPMdI
         Set8MklLnoYZYX0DewXFf7T7XvwCPz4pMqAjhBC5SJKoeHtc8Wu9LUejMUdz4tnSYSSt
         8JogOKs+zXLQ8/wess/sIrb0ri5wKr2avSAF44yZ6/rY0g6k+VNcIYb2pPI107/2yso3
         Y5AyEDKkDdAIGiMuTrc4oFmncbp3yRDK52gUdrVkfH+xPbSbZtoA/fe3Hrga1VdZf4RQ
         WzArJ3tigByktNrcFtvF/m4hH66yuqx6HIDzChnhEWuMB7FfNxmYjhXVpFFyNxDrB5w8
         bGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JsfgSj6xXDBTyorRizxHsuWjgHE8jzwVestTRCsOkXE=;
        fh=fatudNHtuR0zRq16ZcOAEhzCh+vrn2UAcSX+1ZVrwho=;
        b=BSpQ6fq2kSKWm+/RzMvUSWTt2aklPawQABj4mVsqh+S2O71C5ZbwPrnyxGimvfeW6O
         ACjmwMn6QtOuwWNXJ515Opi6OxiNO+RixwaZDfuPyI4Ef/hbG2vtk6APE7p0WAyhvYtR
         GFWQfoYVrRxtSFcFy2SghIYjr649BUc0+eiwc0EbnRtYE4KLZTpqRKnk7ybB4xv1rHwS
         PDQBegHWDvHHjHR6Bv8RWoDQkj5/5ZVyqy+Puy+ETmhXm7C3vqbEK5n7foyxCtH/RYqo
         ImgRL8mC0qxHQjoaJ0qb+dt+iPGOST2BtKh6sHK/UC2cauZN9VUHMPKB77N3jp4qk5Dg
         dKRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772711347; x=1773316147; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsfgSj6xXDBTyorRizxHsuWjgHE8jzwVestTRCsOkXE=;
        b=wCDpHyWWm00q3DWbtSOkOct6Z2n3KVUbIAKXvp+E3/Dw15WzmF7VxxzPmdTDOAvxH3
         tFF48MtmnaCFhzPKqwaFeIiA9291Owsu5am4+kB+B45McT3DhSa/MjTdfPvPWfAeS/KP
         X1W8YKSo0dILVs2Jh+gGFbfXyriHF5FXv2C32RGUmo1U5d0Yt67IWNQKNQMVUSOtZmBQ
         ZrPb1zQAvC3+xpy3v8F1ydXLgyW0d5nHsUPqjVBTISdf4jvBueR6X4gi0hq/TjKkEpA2
         2+fDsbCLvTM2pNKfEqvnxLA8xL52kiKTwLyQqbPhsDqBA74zsqRSgFqEeYZLzhJyqFMN
         8wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772711347; x=1773316147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsfgSj6xXDBTyorRizxHsuWjgHE8jzwVestTRCsOkXE=;
        b=IvA6FG54LsKjVt0mwqXchWvafXzmvzbZ2Y3eCz8eNHcZjozaB2OKR8XvTsnEqKwhXL
         Od0f7qtTrTN/FiR0wdRTJaUYDyCUFmhta7tSMnzpdD5wkjU675DZmekcX05srHMWE6Rz
         3Z4HHwqKgS3TSzKOgiQMqP2Dz1ixpBWSdlZiIoSrCf9wevzqV5a5fUIMOsVNNNJmw2eL
         ZM30gg2KpGPbQITS1BWoNa2Ul4QlGd2FiYGDKIIBlDi7+Lo4SzwC2aOQEoS0ECumVoEA
         i4w5DuP+1ZxgG+L17JTU4WWqUVEcFCygVoY9jhNa81aNIBb6I5kF1A7BMEXBhQmnHRbk
         cZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ5R4TUJUQeEET8pDo6uwILNMwfb4PvoUKM8alCUPf5WOZoEt83wDZ8OVJElm3OkHDEFJg5kq6ynoXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtj4IfVtyC7WvG4JubWCbOW5CZM+O8YsZEHtDT2UlE81MHj22F
	ALjXtzjg18xIkj7AVH0hRs/izkEGX4SK3yf0k6cjdmC6N3cEu2rZiBqjMVXzT1bkp0HFrtSF3iD
	VZDPZZxfpNTn1EaksXpSsWdDgvsnPBmiCBE5p8TF0jQ==
X-Gm-Gg: ATEYQzx7IkDggXKZROeEini/Vjc/yamk08GIFaOW79qLO/EG5KAfqz+FP+2eMmU+Q/K
	p5Huh9fbIWLIkbicxWizviSphdeMWXARxQ4Fn7nFHmSBfEMgTjauwCalihsrrKVv2yWgnJFhssf
	YJS/7G2X1Q9zrLm2dew+z8nHrYOSerZzv931uEq4eF97Sg2GQcNhBVydPgvlE5ovLLMkpBGa5CM
	uRzBzoX1nQqZmcmQkHt0r76UcsGv4hEzx0ED+/gP9us9C3AKBLSjwCsiJWJ2c22OvAcjMw0vLYv
	D0KACc1H
X-Received: by 2002:a05:6512:3093:b0:5a1:3134:923f with SMTP id
 2adb3069b0e04-5a131349301mr720263e87.40.1772711346715; Thu, 05 Mar 2026
 03:49:06 -0800 (PST)
MIME-Version: 1.0
References: <20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn> <20260226115923.75670-3-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260226115923.75670-3-jiayu.riscv@isrc.iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Mar 2026 12:48:29 +0100
X-Gm-Features: AaiRm53AjyJYNQijXY6q6y4X_v_yONuMKKSX6WNloZ4c1DB_5kt_3SxJ_g0U8Uc
Message-ID: <CAPDyKFrxJ0oWuMWoUEYGO0t-WOYU+G7p5eFw8cUY7xyPaREB5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC
 controller support
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: krzk@kernel.org, adrian.hunter@intel.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	gaohan@iscas.ac.cn, me@ziyao.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_034909_811426_3D0EB9F4 
X-CRM114-Status: GOOD (  27.41  )
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

On Thu, 26 Feb 2026 at 12:59, Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn> wrote:
>
> Add SDHCI controller driver for Canaan k230 SoC. Implement custom
> sdhci_ops for set_clock, phy init, init and reset.
>
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 288 ++++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 2b75a36c096b..21c77e908d77 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -128,9 +128,11 @@
>  #define PHY_CNFG_PHY_PWRGOOD_MASK      BIT_MASK(1) /* bit [1] */
>  #define PHY_CNFG_PAD_SP_MASK           GENMASK(19, 16) /* bits [19:16] */
>  #define PHY_CNFG_PAD_SP                        0x0c /* PMOS TX drive strength */
> +#define PHY_CNFG_PAD_SP_k230           0x09 /* PMOS TX drive strength for k230 */
>  #define PHY_CNFG_PAD_SP_SG2042         0x09 /* PMOS TX drive strength for SG2042 */
>  #define PHY_CNFG_PAD_SN_MASK           GENMASK(23, 20) /* bits [23:20] */
>  #define PHY_CNFG_PAD_SN                        0x0c /* NMOS TX drive strength */
> +#define PHY_CNFG_PAD_SN_k230           0x08 /* NMOS TX drive strength for k230 */
>  #define PHY_CNFG_PAD_SN_SG2042         0x08 /* NMOS TX drive strength for SG2042 */
>
>  /* PHY command/response pad settings */
> @@ -153,14 +155,22 @@
>  #define PHY_PAD_RXSEL_3V3              0x2 /* Receiver type select for 3.3V */
>
>  #define PHY_PAD_WEAKPULL_MASK          GENMASK(4, 3) /* bits [4:3] */
> +#define PHY_PAD_WEAKPULL_DISABLED      0x0 /* Weak pull up and pull down disabled */
>  #define PHY_PAD_WEAKPULL_PULLUP                0x1 /* Weak pull up enabled */
>  #define PHY_PAD_WEAKPULL_PULLDOWN      0x2 /* Weak pull down enabled */
>
>  #define PHY_PAD_TXSLEW_CTRL_P_MASK     GENMASK(8, 5) /* bits [8:5] */
>  #define PHY_PAD_TXSLEW_CTRL_P          0x3 /* Slew control for P-Type pad TX */
> +#define PHY_PAD_TXSLEW_CTRL_P_k230_VAL2        0x2 /* Slew control for P-Type pad TX for k230 */
>  #define PHY_PAD_TXSLEW_CTRL_N_MASK     GENMASK(12, 9) /* bits [12:9] */
>  #define PHY_PAD_TXSLEW_CTRL_N          0x3 /* Slew control for N-Type pad TX */
>  #define PHY_PAD_TXSLEW_CTRL_N_SG2042   0x2 /* Slew control for N-Type pad TX for SG2042 */
> +#define PHY_PAD_TXSLEW_CTRL_N_k230_VAL2        0x2 /* Slew control for N-Type pad TX for k230 */
> +#define PHY_PAD_TXSLEW_CTRL_N_k230_VAL1        0x1 /* Slew control for N-Type pad TX for k230 */
> +
> +/* PHY Common DelayLine config settings */
> +#define PHY_COMMDL_CNFG                        (DWC_MSHC_PTR_PHY_R + 0x1c)
> +#define PHY_COMMDL_CNFG_DLSTEP_SEL     BIT(0) /* DelayLine outputs on PAD enabled */
>
>  /* PHY CLK delay line settings */
>  #define PHY_SDCLKDL_CNFG_R             (DWC_MSHC_PTR_PHY_R + 0x1d)
> @@ -174,7 +184,10 @@
>  #define PHY_SDCLKDL_DC_HS400           0x18 /* delay code for HS400 mode */
>
>  #define PHY_SMPLDL_CNFG_R              (DWC_MSHC_PTR_PHY_R + 0x20)
> +#define PHY_SMPLDL_CNFG_EXTDLY_EN      BIT(0)
>  #define PHY_SMPLDL_CNFG_BYPASS_EN      BIT(1)
> +#define PHY_SMPLDL_CNFG_INPSEL_MASK    GENMASK(3, 2) /* bits [3:2] */
> +#define PHY_SMPLDL_CNFG_INPSEL         0x3 /* delay line input source */
>
>  /* PHY drift_cclk_rx delay line configuration setting */
>  #define PHY_ATDL_CNFG_R                        (DWC_MSHC_PTR_PHY_R + 0x21)
> @@ -227,6 +240,14 @@
>  /* SMC call for BlueField-3 eMMC RST_N */
>  #define BLUEFIELD_SMC_SET_EMMC_RST_N   0x82000007
>
> +/* Canaan specific Registers */
> +#define SD0_CTRL                       0x00
> +#define SD0_HOST_REG_VOL_STABLE                BIT(4)
> +#define SD0_CARD_WRITE_PROT            BIT(6)
> +#define SD1_CTRL                       0x08
> +#define SD1_HOST_REG_VOL_STABLE                BIT(0)
> +#define SD1_CARD_WRITE_PROT            BIT(2)
> +
>  /* Eswin specific Registers */
>  #define EIC7700_CARD_CLK_STABLE                BIT(28)
>  #define EIC7700_INT_BCLK_STABLE                BIT(16)
> @@ -268,6 +289,12 @@ struct eic7700_priv {
>         unsigned int drive_impedance;
>  };
>
> +struct k230_priv  {
> +       /* Kendryte k230 specific */
> +       struct regmap *hi_sys_regmap;
> +       const struct dwcmshc_k230_match_data *match_data;
> +};
> +
>  #define DWCMSHC_MAX_OTHER_CLKS 3
>
>  struct dwcmshc_priv {
> @@ -284,12 +311,34 @@ struct dwcmshc_priv {
>  };
>
>  struct dwcmshc_pltfm_data {
> +       const void *match_data;

This makes sense to me!

Although, I realized that dwcmshc_rk35xx_init() could also move its
assignment of "devtype" into this match_data.

Can you please create a follow-up patch to fixup this and to avoid
storing this type of data in two different ways?

>         const struct sdhci_pltfm_data pdata;
>         const struct cqhci_host_ops *cqhci_host_ops;
>         int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
>         void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
>  };
>
> +struct dwcmshc_k230_match_data {
> +       bool is_emmc;
> +       u32 ctrl_reg;
> +       u32 vol_stable_bit;
> +       u32 write_prot_bit;
> +};
> +
> +static const struct dwcmshc_k230_match_data k230_emmc_match_data = {
> +       .is_emmc = true,
> +       .ctrl_reg = SD0_CTRL,
> +       .vol_stable_bit = SD0_HOST_REG_VOL_STABLE,
> +       .write_prot_bit = SD0_CARD_WRITE_PROT,
> +};
> +
> +static const struct dwcmshc_k230_match_data k230_sdio_match_data = {
> +       .is_emmc = false,
> +       .ctrl_reg = SD1_CTRL,
> +       .vol_stable_bit = SD1_HOST_REG_VOL_STABLE,
> +       .write_prot_bit = SD1_CARD_WRITE_PROT,
> +};

[...]

> +
> +static int dwcmshc_k230_init(struct device *dev, struct sdhci_host *host,
> +                            struct dwcmshc_priv *dwc_priv)
> +{
> +       static const char * const clk_ids[] = {"block", "timer", "axi"};
> +       const struct dwcmshc_k230_match_data *match_data;
> +       const struct dwcmshc_pltfm_data *pltfm_data;
> +       struct device_node *usb_phy_node;
> +       struct k230_priv *k230_priv;
> +       u32 data;
> +       int ret;
> +
> +       pltfm_data = device_get_match_data(dev);
> +
> +       if (!pltfm_data || !pltfm_data->match_data) {
> +               dev_err(dev, "No vendor data found for K230\n");
> +               return -EINVAL;
> +       }
> +       match_data = pltfm_data->match_data;

I don't think this should be specific to dwcmshc_k230_init().

Instead I suggest adding a "const void *match_data" to the "struct
dwcmshc_priv" - and copy the pointer in the common dwcmshc_probe()
instead. In this way, all variants will be able to use it.

> +
> +       k230_priv = devm_kzalloc(dev, sizeof(struct k230_priv), GFP_KERNEL);
> +       if (!k230_priv)
> +               return -ENOMEM;
> +
> +       k230_priv->match_data = match_data;
> +       dwc_priv->priv = k230_priv;
> +
> +       usb_phy_node = of_parse_phandle(dev->of_node, "canaan,usb-phy", 0);
> +       if (!usb_phy_node)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to find canaan,usb-phy phandle\n");
> +
> +       k230_priv->hi_sys_regmap = device_node_to_regmap(usb_phy_node);
> +       of_node_put(usb_phy_node);
> +
> +       if (IS_ERR(k230_priv->hi_sys_regmap))
> +               return dev_err_probe(dev, PTR_ERR(k230_priv->hi_sys_regmap),
> +                                    "Failed to get k230-usb-phy regmap\n");
> +
> +       ret = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> +                                           ARRAY_SIZE(clk_ids), clk_ids);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to get/enable k230 mmc other clocks\n");
> +
> +       if (match_data->is_emmc) {
> +               host->flags &= ~SDHCI_SIGNALING_330;
> +               dwc_priv->flags |= FLAG_IO_FIXED_1V8;
> +       } else {
> +               host->mmc->caps |= MMC_CAP_SD_HIGHSPEED;
> +               host->quirks2 |= SDHCI_QUIRK2_NO_1_8_V;
> +       }
> +
> +       ret = regmap_read(k230_priv->hi_sys_regmap, match_data->ctrl_reg, &data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read control reg 0x%x\n",
> +                                    match_data->ctrl_reg);
> +
> +       data |= match_data->write_prot_bit | match_data->vol_stable_bit;
> +       ret = regmap_write(k230_priv->hi_sys_regmap, match_data->ctrl_reg, data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to write control reg 0x%x\n",
> +                                    match_data->ctrl_reg);
> +
> +       return 0;
> +}

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
