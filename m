Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8342C83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onWNz19L/qiS9tZ3najHd+eO1uPLABQivRK7YdRyf9Y=; b=0WzNV0tFzvzchq
	5QagbmNKnxLUB6kpNZN9RBdK6ktfzq/ULBH3IPFUSI5GQm60bHJqRBoCtDGxQuADJtf73prOiS50Q
	wLgcX6GSwKeCjMc5MBuiGKrJZmi2j0Afmx+gykAKnPq1jGxGK6+gohcFM3jIx6Pv1jqUHzScYXmYB
	H43AwaE7nKmCEFwuw6duOIdOGry2s9e7NK+HFS0XQhehQvcbcrb0z/cII+kW7YMN2Zs5/HVhDl9pf
	QBvwJWlaATfejDqQyw2Q3Z1C8hXbbtNgvUFFiWB9AFtet7oIO8LJEMZFhPnwDlTVvVHhyjcUKK9za
	8kut0CUKeveG9YDDVPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIR9-00DGeh-1I;
	Wed, 30 Aug 2023 10:28:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIR5-00DGZc-1M
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 10:28:33 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2DEBF41D35
	for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693391307;
	bh=0x71Jiks4crbLYMF8B7w24UzcWpOCQauPfqR/sxZV0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pm+uIcVEjgoNMMPEU15DjGahvJopLjdyEsZ3lVBRLnnEoZGajFmXcmGJCxNnhMGlo
	 289uAiPO3Hcxnfwd1Cdq6AaPH9clsR0nIzdp8j5vLvsXBEO1ZZ/FOqQAF8M1cdyd2U
	 9fbU1Y5jfkKDPEtHosWfG2JSEOSJXGO/MKZMPPFy9iMWVOpj/6EhSoMMIreZbdKKbv
	 iMEFDZS1i8GZgtjhPbYEosrb3udYZDAWtOXEMRLKOELKH54HMjlPHBptcrZ+/YudOA
	 K8/Fz1dMHcpak0lrnkaCK5MzYBaPnbAM1Uo7aXSNTCMUrdAFyNnyulmlMr3n8yYcxk
	 M7BkdOumReMrw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4108d23b401so59281871cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 03:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693391305; x=1693996105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x71Jiks4crbLYMF8B7w24UzcWpOCQauPfqR/sxZV0g=;
        b=HLUvYaief2IYmfpvgaejBBDmZazcmO/hDm0AMgU2PfjR1t3Y7XCsEEXRMAovgSOVKS
         bjYfrXzLGbtFbh2jnOrzZkLJyWo7l8VE8RUT4FwlJiZmUwIZWKaORiapbJaRJ8Ya03sS
         RSzyA8bPrXDAekdhjrzFCft6Un6VDbVPNvegVAecv5ARV5iCQJ/yS+AHpf17gfHRuihr
         3UUVBKUu+ajdRAJyatpjpWRfGOCTke0wwUbVydYShA2EbwYtAd2rs8Lb2Mw7VidpCN2D
         uJkh3f4OpUjfkg+ZOq+4DFAxOpopcC5oL66yXpoVj7uD6+eihew9pKmZ2RgEE5xwrmDt
         lz4g==
X-Gm-Message-State: AOJu0YyoXXdrN9Akbl5jUjo156bIfgvdWWON8VIE0u0rR0GhJF2BX5GA
	CeXXK21JBh21BblSNkNlNL5MJL39oisV1cw1F/AKqXRDDa45VFJeuTFrp6oxn5A45Klvf9yAu6L
	Q54sG8WglSJvr7TCU4bBdvGA0D3cycLXPmvNqaUIBuQYJFrrwidfLJfkLAd6jhA==
X-Received: by 2002:ac8:4e89:0:b0:403:e958:b456 with SMTP id 9-20020ac84e89000000b00403e958b456mr2057139qtp.19.1693391305191;
        Wed, 30 Aug 2023 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUywKtZ9QBvF7SXkZ/+FtfBV0akTc4+5p56GkjMS3vEHZ1SMFeY9wEQ5cijc1CJI92RxPk+2KWSd+Z7E9kvN8=
X-Received: by 2002:ac8:4e89:0:b0:403:e958:b456 with SMTP id
 9-20020ac84e89000000b00403e958b456mr2057124qtp.19.1693391304908; Wed, 30 Aug
 2023 03:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230830031846.127957-1-william.qiu@starfivetech.com> <20230830031846.127957-3-william.qiu@starfivetech.com>
In-Reply-To: <20230830031846.127957-3-william.qiu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 30 Aug 2023 12:28:08 +0200
Message-ID: <CAJM55Z9CL8DN+uEhRoR7ZUuwtVudTUzA1+Q4Hn_rukCfT+SXeQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mmc: starfive: Change tuning implementation
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_032831_829111_88DB3F0D 
X-CRM114-Status: GOOD (  35.41  )
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

On Wed, 30 Aug 2023 at 05:21, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Before, we used syscon to achieve tuning, but the actual measurement
> showed little effect, so the tuning implementation was modified here,
> and it was realized by reading and writing the UHS_REG_EXT register.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  drivers/mmc/host/dw_mmc-starfive.c | 131 ++++++++---------------------
>  1 file changed, 37 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-starfive.c b/drivers/mmc/host/dw_mmc-starfive.c
> index fd05a648a8bb..593c995e49f5 100644
> --- a/drivers/mmc/host/dw_mmc-starfive.c
> +++ b/drivers/mmc/host/dw_mmc-starfive.c
> @@ -20,14 +20,6 @@
>  #define ALL_INT_CLR            0x1ffff
>  #define MAX_DELAY_CHAIN                32
>
> -struct starfive_priv {
> -       struct device *dev;
> -       struct regmap *reg_syscon;
> -       u32 syscon_offset;
> -       u32 syscon_shift;
> -       u32 syscon_mask;
> -};
> -
>  static void dw_mci_starfive_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>  {
>         int ret;
> @@ -44,117 +36,68 @@ static void dw_mci_starfive_set_ios(struct dw_mci *host, struct mmc_ios *ios)
>         }
>  }
>
> +static void dw_mci_starfive_hs_set_bits(struct dw_mci *host, u32 smpl_phase)

"set bits" is very generic. Maybe dw_mci_starfive_set_sample_phase()
or something more descriptive.

> +{
> +       /* change driver phase and sample phase */
> +       u32 mask = 0x1f;
> +       u32 reg_value;
> +
> +       reg_value = mci_readl(host, UHS_REG_EXT);
> +
> +       /* In UHS_REG_EXT, only 5 bits valid in DRV_PHASE and SMPL_PHASE */
> +       reg_value &= ~(mask << 16);
> +       reg_value |= (smpl_phase << 16);
> +       mci_writel(host, UHS_REG_EXT, reg_value);
> +
> +       /* We should delay 1ms wait for timing setting finished. */
> +       mdelay(1);
> +}

This implementation could use some cleanup. Eg. why do we need the
mask variable?
How about something like this:

#define STARFIVE_SMPL_PHASE     GENMASK(20, 16)

u32 reg_value = mci_read(host, UHS_REG_EXT);
reg_value &= ~STARFIVE_SMPL_PHASE;
reg_value |= FIELD_PREP(STARFIVE_SMPL_PHASE, smpl_phase);
mci_writel(host, UHS_REG_EXT, reg_value);
...

>  static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>                                              u32 opcode)
>  {
>         static const int grade  = MAX_DELAY_CHAIN;
>         struct dw_mci *host = slot->host;
> -       struct starfive_priv *priv = host->priv;
> -       int rise_point = -1, fall_point = -1;
> -       int err, prev_err = 0;
> +       int err = -1;

This variable is always set later so doesn't need initialization and
is better called 'ret' as it's the return value of the function, and
not necessarily an error.

> +       int smpl_phase, smpl_raise = -1, smpl_fall = -1;
>         int i;
> -       bool found = 0;
> -       u32 regval;
> -
> -       /*
> -        * Use grade as the max delay chain, and use the rise_point and
> -        * fall_point to ensure the best sampling point of a data input
> -        * signals.
> -        */
> +
>         for (i = 0; i < grade; i++) {
> -               regval = i << priv->syscon_shift;
> -               err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
> -                                               priv->syscon_mask, regval);
> -               if (err)
> -                       return err;
> +               smpl_phase = i;

This can now be written

for (sampl_phase = 0; sampl_phase < grade; sampl_phase++)

> +               dw_mci_starfive_hs_set_bits(host, smpl_phase);
>                 mci_writel(host, RINTSTS, ALL_INT_CLR);
>
>                 err = mmc_send_tuning(slot->mmc, opcode, NULL);
> -               if (!err)
> -                       found = 1;
> -
> -               if (i > 0) {
> -                       if (err && !prev_err)
> -                               fall_point = i - 1;
> -                       if (!err && prev_err)
> -                               rise_point = i;
> -               }
>
> -               if (rise_point != -1 && fall_point != -1)
> -                       goto tuning_out;
> -
> -               prev_err = err;
> -               err = 0;
> -       }
> -
> -tuning_out:
> -       if (found) {
> -               if (rise_point == -1)
> -                       rise_point = 0;
> -               if (fall_point == -1)
> -                       fall_point = grade - 1;
> -               if (fall_point < rise_point) {
> -                       if ((rise_point + fall_point) >
> -                           (grade - 1))
> -                               i = fall_point / 2;
> -                       else
> -                               i = (rise_point + grade - 1) / 2;
> -               } else {
> -                       i = (rise_point + fall_point) / 2;
> +               if (!err && smpl_raise < 0) {
> +                       smpl_raise = i;
> +               } else if (err && smpl_raise >= 0) {
> +                       smpl_fall = i - 1;
> +                       break;
>                 }
> +       }
>
> -               regval = i << priv->syscon_shift;
> -               err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
> -                                               priv->syscon_mask, regval);
> -               if (err)
> -                       return err;
> -               mci_writel(host, RINTSTS, ALL_INT_CLR);
> +       if (i >= grade && smpl_raise >= 0)
> +               smpl_fall = grade - 1;
>
> -               dev_info(host->dev, "Found valid delay chain! use it [delay=%d]\n", i);
> -       } else {
> +       if (smpl_raise < 0) {
>                 dev_err(host->dev, "No valid delay chain! use default\n");
> +               dw_mci_starfive_hs_set_bits(host, 0);
>                 err = -EINVAL;
> +       } else {
> +               smpl_phase = (smpl_raise + smpl_fall) / 2;
> +               dw_mci_starfive_hs_set_bits(host, smpl_phase);
> +               dev_dbg(host->dev, "Found valid delay chain! use it [delay=%d]\n", smpl_phase);
> +               err = 0;
>         }

Maybe something like:

  if (smpl_raise < 0) {
    smpl_phase = 0;
    dev_err(host->dev, "No valid delay chain, using default\n");
    ret = -EINVAL;
    goto out;
  }

  smpl_phase = (smpl_raise + smpl_fall) / 2;
  dev_dbg(...);
  ret = 0;

out:
  dw_mci_starfive_hs_set_bits(host, smpl_phase);
  mci_writel(host, RINTSTS, ALL_INT_CLR);
  return ret;
>  }
>
> -static int dw_mci_starfive_parse_dt(struct dw_mci *host)
> -{
> -       struct of_phandle_args args;
> -       struct starfive_priv *priv;
> -       int ret;
> -
> -       priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> -       if (!priv)
> -               return -ENOMEM;
> -
> -       ret = of_parse_phandle_with_fixed_args(host->dev->of_node,
> -                                               "starfive,sysreg", 3, 0, &args);
> -       if (ret) {
> -               dev_err(host->dev, "Failed to parse starfive,sysreg\n");
> -               return -EINVAL;
> -       }
> -
> -       priv->reg_syscon = syscon_node_to_regmap(args.np);
> -       of_node_put(args.np);
> -       if (IS_ERR(priv->reg_syscon))
> -               return PTR_ERR(priv->reg_syscon);
> -
> -       priv->syscon_offset = args.args[0];
> -       priv->syscon_shift  = args.args[1];
> -       priv->syscon_mask   = args.args[2];
> -
> -       host->priv = priv;
> -
> -       return 0;
> -}
> -
>  static const struct dw_mci_drv_data starfive_data = {
>         .common_caps            = MMC_CAP_CMD23,
>         .set_ios                = dw_mci_starfive_set_ios,
> -       .parse_dt               = dw_mci_starfive_parse_dt,
>         .execute_tuning         = dw_mci_starfive_execute_tuning,
>  };
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
