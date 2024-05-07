Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B34BC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RrSlIjoaf5kDuao66ECNf0JJ0XcCR65TeWdHM4+KTT4=; b=XTrVqe1R0ry9tpgGGcys37nd6h
	FeSpNnH8kyMvNMGzSB6qm+KZlfMJcCGRt2xzPAs9jbwex1mn8N7ArGkAO6zMJvu2cHk2kCjok6+sG
	qii8FFaZQWMv9xcIz1DChm55/XW57LeVg4b9eRAIVAGwnKzx0/N2SRs8xwK/kGyXVf1AbpDwF8fR+
	cAzBrxxtweBx8sTh2df5DCd1ibAiU7Ls7OO82jsoMdsRudSh1ZwTNhtq5eQwYXF51Tlhm70eB1z1/
	6m8Jq5jTLpyCtm/7l6S519wMR25MtN/xP51VCpAW1Y4wBXZFDv27CkvqApSkW5fmP/vAN2wpnckRv
	Z2xAskJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hn7-0000000AU0Q-0COn;
	Tue, 07 May 2024 10:11:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hn3-0000000ATyF-0SOf
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 10:11:19 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 228A8400F7
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715076675;
	bh=tN0TsnKRXwG6A84l3wPnbSYJqqWrPLAk8v9HABeeBQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CBb5x9Ogm2Z3jFtaUhYEKp0DdCv5MlE75Ufi2rsm+lPfNwHSvMmEG3YYwXzOtdkGG
	 TKsYUsjCIy52vDDMWNVkbsapSI+exBhl9WHG9BvkkY2iuyQbrinixb7gvpjcAYw/iG
	 gRnBU0a58KxJhbf5KCp96wGHb/h5ppVOv54NUiV9vCynZzt6ZLHmSzeg7Pc19v1ewX
	 jv0T6eoReF3MzOw0hcEgP83tnq1Y0cLsQjCMns5YGB2fuQ/FI2JH/f7Xg3oTdfA+Qe
	 Q3DdEe6Vx52f/1vADw9Hy92jOQ+HfwB1okl8GP3oFqAkwXwjZLe0dxTXazN1AW8Nyk
	 k/ECDOlVhUiIA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43ad0f16513so33452281cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 03:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076671; x=1715681471;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tN0TsnKRXwG6A84l3wPnbSYJqqWrPLAk8v9HABeeBQo=;
        b=YZPV5V93VzhsJe0obSpncQzi8MpUDYGH4D42zIM/AMSO06BWz36kJn1IELtEhdeb23
         cCL9L0IS7EEVx3CcmdfphcnJjjze53Wzg0wrMt7OcW0SxcxwkDEtEKvZ5O3TtUXlv2nV
         osarz/5IvaA4OR68UfnRPz7vmls2okR69HVqFT+3cSXVgUHmcg9kzpBYZOwpUIKmNbo4
         OMQB4fglXyNPu5Z2ieIquRpeqt9sSohqQXZk3k7cJjbeMTod/6L76MFTRkZ40K3gpK3B
         57NLmVStuoWpwXUFYgQ+O6CRkFbAB+YnF8rQCUr+iym6EU/CLx+HyJMs7YpiIgGCtc12
         jSiw==
X-Forwarded-Encrypted: i=1; AJvYcCU78V02CSU0es2cykeLr5SZY74h0NdqOJ9OyNHUiR34Odo4sYNHPMKRGy3AMIZu8u0TD2P6Zgy1OxW6arGe1vVj8r4z3lLicIJg3/bQKZ1q
X-Gm-Message-State: AOJu0YxTq2gw7HvRtwmcpMSpGvlq+aOS/jaZ7qvzZGgGQHCjPt8ky7uy
	hktcfmzguQCWQ68BifWGHPJV+/Rtf5R8x6iIaOIdy8AthUA6ofZQdCjhs2pnwhVM3WL/bVl4K1T
	vhLH9RnhQmbBZZ83NDL+Esjk5LCmjuxf41O+HHyqCTMo6o5k9murmOBW5tQ2kcYlXXKEqY7lKrr
	xeLhnJCJwRnvzPS97rFKA084GirhYVxNDcKGrJuIX3bUxA0AayIdI05gPa
X-Received: by 2002:ac8:5796:0:b0:43a:ee30:c554 with SMTP id v22-20020ac85796000000b0043aee30c554mr14429964qta.19.1715076671612;
        Tue, 07 May 2024 03:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC7lED7C0+ygdXPmMOe7xhSHbvQ874n3CyLpSpLWzJYqBxzPH9DjYI8NhKtEuhH+DJaKvyqnKZq7GeBNuznjs=
X-Received: by 2002:ac8:5796:0:b0:43a:ee30:c554 with SMTP id
 v22-20020ac85796000000b0043aee30c554mr14429943qta.19.1715076671316; Tue, 07
 May 2024 03:11:11 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 May 2024 03:11:10 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240507065319.274976-2-xingyu.wu@starfivetech.com>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com> <20240507065319.274976-2-xingyu.wu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 7 May 2024 03:11:10 -0700
Message-ID: <CAJM55Z9nJKOEawvxHwUt5w0FKYGw9pBN9_YtOCHjzFGTQ_HvAA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: starfive: jh7110-sys: Add notifier for PLL0 clock
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_031117_604043_35782A0B 
X-CRM114-Status: GOOD (  24.91  )
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

Xingyu Wu wrote:
> Add notifier function for PLL0 clock. In the function, the cpu_root clock
> should be operated by saving its current parent and setting a new safe
> parent (osc clock) before setting the PLL0 clock rate. After setting PLL0
> rate, it should be switched back to the original parent clock.
>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

This looks much better, thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 31 ++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 ++
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 8f5e5abfa178..dafa3ae71751 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -385,6 +385,32 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>
> +/*
> + * This clock notifier is called when the rate of PLL0 clock is to be changed.
> + * The cpu_root clock should save the curent parent clock and swicth its parent
> + * clock to osc before PLL0 rate will be changed. Then swicth its parent clock
> + * back after the PLL0 rate is completed.
> + */
> +static int jh7110_pll0_clk_notifier_cb(struct notifier_block *nb,
> +				       unsigned long action, void *data)
> +{
> +	struct jh71x0_clk_priv *priv = container_of(nb, struct jh71x0_clk_priv, pll_clk_nb);
> +	struct clk *cpu_root = priv->reg[JH7110_SYSCLK_CPU_ROOT].hw.clk;
> +	int ret = 0;
> +
> +	if (action == PRE_RATE_CHANGE) {
> +		struct clk *osc = clk_get(priv->dev, "osc");
> +
> +		priv->original_clk = clk_get_parent(cpu_root);
> +		ret = clk_set_parent(cpu_root, osc);
> +		clk_put(osc);
> +	} else if (action == POST_RATE_CHANGE) {
> +		ret = clk_set_parent(cpu_root, priv->original_clk);
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
>  static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  {
>  	struct jh71x0_clk_priv *priv;
> @@ -413,7 +439,10 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  		if (IS_ERR(priv->pll[0]))
>  			return PTR_ERR(priv->pll[0]);
>  	} else {
> -		clk_put(pllclk);
> +		priv->pll_clk_nb.notifier_call = jh7110_pll0_clk_notifier_cb;
> +		ret = clk_notifier_register(pllclk, &priv->pll_clk_nb);
> +		if (ret)
> +			return ret;
>  		priv->pll[0] = NULL;
>  	}
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index 23e052fc1549..e3f441393e48 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -114,6 +114,8 @@ struct jh71x0_clk_priv {
>  	spinlock_t rmw_lock;
>  	struct device *dev;
>  	void __iomem *base;
> +	struct clk *original_clk;
> +	struct notifier_block pll_clk_nb;
>  	struct clk_hw *pll[3];
>  	struct jh71x0_clk reg[];
>  };
> --
> 2.25.1
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
