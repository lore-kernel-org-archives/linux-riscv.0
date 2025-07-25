Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAA0C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ohhv0Gb1M0GVEq/fgc7avs3BTHcYdH8MuDVyAtuncfw=; b=wYuJXJyrsBcAUx
	08IrgEEvqJ+r/bK841NhsVU76TC2lBkVJgB7U7iVAhcY6oZY4h7VLCjW99PX4GykwkvRJPuXTsYRa
	NjcYZdTbcFej14+h7nsqANy0z97IQottjzTa/ToEdc/xXroYv2RWy4yBNn5om/xJD5Upl72tYvUwV
	+iC8xlIjPCDUJgP4veUG9a1paAzUEjP7OBpi2xthDhe/steK2ixM6E2tL5YwEQ8xCAOLtJSr7kq0r
	R137rUm+LD1Ma9vJR6PM1HLCyLHqxVPJ4OiOgeBxG9c0AsVJkB2zolxul8zHqrgZ3rlvBZzyductr
	HJvhRfTf5QV/DyhwWY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHWP-00000009ozU-46G6;
	Fri, 25 Jul 2025 12:27:33 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHWM-00000009oyO-1uMU
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 12:27:33 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e2a60aeb26so14820475ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753446449; x=1754051249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=YcWRhWpZVlbBUnMNTpL1bw0svBLY55b4mJjrjRSs+NfLwPiJB4Ws3urigpmaYlKiXP
         ziuekvRuLqn+Utran4x4x1xwKcEjNaPgztbHIjxVvnGcnmK8ZuI96rtNzQFj2rvoz7Gw
         CVEzR5fKk8akwRxuvalV+uluFMH0XEdPrTE358hJDy2KBZyOAKmDxp8CDEZBmWb78if9
         MgrflZjhkf9Xg9MtQ8gccUZQDZsymyRuBmy9CStA2jem6GVaiS1S2IFf1a1QD4kRjR4r
         tNYNrTkOr1VvimHGfLdC13q9XN7qPLIZYiEnYbWej3Pw/cvvCwN2nXKgV+NHFNSKfjzM
         urbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446449; x=1754051249;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=P2zuJvjCMMKdahnnvNJyKin3yBfc54fiap6Znmn7dpZbC1GNwVoV+U3jk6nd5AwHW1
         fEqT6V+UxiaRtdVx4J20llN4N35ivPoFkrX11KGMeSq7Ds/kzHZgSeFeAyj6eObkyHko
         FdXyf5IUKnNfcfWRyXWif92JPcjzBLV+WApqNMtzoefuMXZ8YYgsA9wJrHo/WhRzxcjr
         l89qL8+JXFpvfCMe8hSf701WoLn+GLSjoZ7GvzJVZOwLhJF9KNFxZGKtWvgBZQnSKGtv
         B2K1AzZ4L2sPN0ro0Rhc5pyr/doaxPFW1VqwzZr4ZFSiXgYs/SpRph4b17LKhDrfFkuU
         GSfw==
X-Forwarded-Encrypted: i=1; AJvYcCXmP3hxp0O1sIKm63/fut522rVZbtgvGVk4whVDV5Z6hK6YJ9+Q9yzz0T9AQ0LXbKCI+pJZWWn2pDFAmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDrfbz+pMYCU9KYc2mg/1AR4Xl5JpLIZYU7LHp6vSKFhIl8uaC
	N4wSKosH+Ywgy9Tm3Ab0Cbr3wgqPxTbZYx0J+/jwJ/Azg1u4likioHBNNGMnyz52d0k=
X-Gm-Gg: ASbGncvBzka9GBh9ZFM3X0lJdE13rhHtIvA+fi0CORImAQceCKyEJ5Lc6OkSRH0FiO4
	Zhhg01p5PCPjN5QOwMAfFadKs4OSSGQIGnbgdTk4YDG44lqxWrYj6GQL7NOsN6ZdBhm1XBMTgEL
	7hYoWdlFwccNX3VNdB/mnQDVTJL1ylhKUU1DmTEsFKYCgmNMtYffYnR3n2QPFPLlrL9eVLi/tSV
	QdYslsAHPIANLEcMwLWM7+Hctytfm1qEuHLSH9ai5pXPBZ0CcpROT1y7PhBrwghRNmpltIJ0cSM
	x9sAxxYk6TplFuQW6w2uARR0g14QgHI8aaqQ2GUmlctNUMkVfFUq/F30o3lLurEBJZi4TMkhH03
	E7xvYzVtPQQ/YvD3ery04VjwsejtPcNDplQ==
X-Google-Smtp-Source: AGHT+IGhO7mEEzu6qStEKP3YhLwseiPFmOnrBPl6/OYfukEuwKgUEIwMH1W9FrN/Z85sZ2BLST8iBQ==
X-Received: by 2002:a05:6e02:1a4b:b0:3e3:b7e7:7a67 with SMTP id e9e14a558f8ab-3e3c52b01f6mr23978105ab.14.1753446449421;
        Fri, 25 Jul 2025 05:27:29 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aebd545fsm992684173.57.2025.07.25.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:27:28 -0700 (PDT)
Message-ID: <e236fa5e-7085-419e-bc68-c49f9416847b@riscstar.com>
Date: Fri, 25 Jul 2025 07:27:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-3-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250724202511.499288-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_052731_996573_42FCDCA9 
X-CRM114-Status: GOOD (  29.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/24/25 3:25 PM, Alex Elder wrote:
> All devices supported by simple MFD use the same 8-bit register 8-bit
> value regmap configuration.  There is an option available for a device
> to specify a custom configuration, but no existing device uses it.
> 
> Rather than requiring a "full" regmap configuration to be provided to
> change only the max_register value, Lee Jones suggested allowing
> max_register to be specified in the simple_mfd_data structure.  The
> 8-bit register 8-bit configuration is still used by default, but
> max_register is also applied if it is non-zero.
> 
> If both regmap_config and max_register are provided, the max_register
> field in the regmap_config structure is ignored.

It occurred to me this morning that the regmap_config structure
can be freed after the call to devm_regmap_init_i2c(), so I'm
going to add a function to free it (if it was dynamically
allocated).

					-Alex

> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v9: - max_register takes precedence over regmap_config in simple_mfd_data
>      - New function simple_regmap_config() encapsulates providing config
>      - simple_regmap_config() allocates a regmap_config if necessary
>      - A small duplicated comment is removed in "simple-mfd-i2c.h"
> 
>   drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
>   drivers/mfd/simple-mfd-i2c.h |  5 +----
>   2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..f3ba79c112d4e 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
>   	.val_bits = 8,
>   };
>   
> +/*
> + * Determine regmap config to use.  If no regmap_config is provided,
> + * regmap_config_8r_8v is used.  If max_register is specified it is
> + * (also) used, whether or not regmap_config is provided.
> + */
> +static const struct regmap_config *
> +simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
> +{
> +	struct regmap_config *regmap_config;
> +
> +	if (!data)
> +		return &regmap_config_8r_8v;
> +
> +	if (data->regmap_config && !data->max_register)
> +		return data->regmap_config;
> +
> +	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
> +	if (!regmap_config)
> +		return NULL;
> +
> +	if (data->regmap_config)
> +		*regmap_config = *data->regmap_config;
> +	else
> +		*regmap_config = regmap_config_8r_8v;
> +	if (data->max_register)
> +		regmap_config->max_register = data->max_register;
> +
> +	return regmap_config;
> +}
> +
>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   {
>   	const struct simple_mfd_data *simple_mfd_data;
> @@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   
>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>   
> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> -		regmap_config = &regmap_config_8r_8v;
> -	else
> -		regmap_config = simple_mfd_data->regmap_config;
> +	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
> +	if (!regmap_config)
> +		return -ENOMEM;
>   
>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>   	if (IS_ERR(regmap))
> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
> index 7cb2bdd347d97..6fa36b3d7a217 100644
> --- a/drivers/mfd/simple-mfd-i2c.h
> +++ b/drivers/mfd/simple-mfd-i2c.h
> @@ -8,10 +8,6 @@
>    * shared by all sub-devices.  Children can use their parent's device structure
>    * (dev.parent) in order to reference it.
>    *
> - * This driver creates a single register map with the intention for it to be
> - * shared by all sub-devices.  Children can use their parent's device structure
> - * (dev.parent) in order to reference it.
> - *
>    * Once the register map has been successfully initialised, any sub-devices
>    * represented by child nodes in Device Tree or via the MFD cells in the
>    * associated C file will be subsequently registered.
> @@ -25,6 +21,7 @@
>   
>   struct simple_mfd_data {
>   	const struct regmap_config *regmap_config;
> +	unsigned int max_register;
>   	const struct mfd_cell *mfd_cell;
>   	size_t mfd_cell_size;
>   };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
