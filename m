Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601BC3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idBzXRKPqUTma2LM+pRD6tXYKVNxZ8UFCCHHv0rgOkE=; b=FxX4bVBeJCKq3+
	D5DXdIVvygneC7fQq/hDBiBlUuFtG9mbeDySJTa8PvRN99eeVny+GIakSkTBuhZJPDIB0oDSAg/ga
	qyl4wWMXmwkmw+NkSIwSsScQpNM3HZqY8Wa+6ufV/m2X/hWANgJHrhp6/VgOJY6bYz7I+7pt4iYsJ
	svmML2wln12g3q99RvBhhGQe41NVeKylJx1u0W3x90HSpVDN+RXCoNbjPgR1dRgqGfBVMvgQ911ap
	leKJIDhKf3qLDOt6X2bVIHVu07jsCMW8x9EjewbjVbYqNDiDURwfWvLfCqSLjB7cBXINRDjAqD8dQ
	he4ujeGc0yhDLKqa+JBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWjFE-0000000GXeO-2wiA;
	Wed, 24 Jul 2024 21:09:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWjFC-0000000GXdB-0A7S
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 21:09:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70d2b921c48so211306b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1721855393; x=1722460193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjbueeIIyUEroZshkKxdpKEriHR9zWClHjFGUbNFoy8=;
        b=yEmy9S8NRKUvETpA8D3KlRWjkvFCjflPYE33UcdyS8Y5xpnAOYZSg1oLEMkb7W3GWl
         r+136YIR54hRc7BJ0nYnfvoQVRZVMmwoRWbMMYpIrVzO0AJ0iDgjI+1CB1agIV5h7Sqq
         6jUBMR5E32p6p4KyXrlGcSV5N6qqk5fFB/dsGQ8+i0EBzbeWAa8YHjR10IzupqfXk2TW
         iYsE8jmRWCov9GE4+1DEauPn2dsaztKw1tmQljrhYmnwjgcR8G0nV6dY8f6E6hxOaM2B
         bNuzX+kOr7PcsfZmyc4bQAsNP3gjVwMytDyjwqhFZ4J3cyuCu/CVJdygs3/K3esMuHXM
         f/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721855393; x=1722460193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjbueeIIyUEroZshkKxdpKEriHR9zWClHjFGUbNFoy8=;
        b=CuHIBrrx9xqbJyuGVh7oTqsZPDx3GB76SZQ6hMCT7vB81ARJHymoQcJLE86P1PQ8tD
         Hh00/3OPf2mcJap20D7Uv6+fRICUL1bHeD+/sQTsRXMy0xemBT6qBvOwjM7xW1KU7dvw
         GJw2mBvPQFR+TpE5lb3jaLSRWyZRjIJnG1+7Q3f3SSKUp/H0fIosh+W19MG+JlFi1TFU
         3dZIkCV9ohHjWr782il1nIpLpjoxOa3QAOZAooOXkawt4d39drr9yzbivazsZI4QVRsD
         KOJ263pJ8V7ZXif/avuFbetKV48Kgmrujpusg/VXaC67xJc2VFtp+r2lHbIudbs9qc88
         t3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZLkCtsWcknDrfhbSUtX+g/JjsoR4SyhuxnLR7S9s4lrCMC/DAqECy2FAYORyzurpxehYvalUhkS5lNDmOK263E11JH5Kpt7MO52Y2s9+
X-Gm-Message-State: AOJu0YzOBkqEbexvuROmnUZ6essHKE6YBT2NWlCIzWlixMOjyipSW9aO
	84lVdGAfbWZeqNhX7TniEXQoslRr48eRwoGUmG5RYixWX8c6oyfG5fCK9F6ax0w=
X-Google-Smtp-Source: AGHT+IEKt/RfkCtSA9CPOxPqJF0r1UmC/bt2fLfDSdr/8Y2DnQGu8cJz8hAe2wzxaa0eNCpkvzktFQ==
X-Received: by 2002:a05:6a20:7f95:b0:1be:d5e9:b444 with SMTP id adf61e73a8af0-1c4725173a1mr1458314637.0.1721855393189;
        Wed, 24 Jul 2024 14:09:53 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:8821:4dd1:578:cc09])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e8730sm2128580a91.38.2024.07.24.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 14:09:52 -0700 (PDT)
Date: Wed, 24 Jul 2024 14:09:50 -0700
From: Drew Fustini <drew@pdp7.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 3/8] mmc: sdhci-of-dwcmshc: factor out code for
 th1520_init()
Message-ID: <ZqFtntMl9aw4OBDS@x1>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
 <b774f2b62d68edab2d95d9dbd1f55cac50c6abff.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b774f2b62d68edab2d95d9dbd1f55cac50c6abff.1721377374.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_140954_101308_75930A49 
X-CRM114-Status: GOOD (  22.53  )
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

On Fri, Jul 19, 2024 at 04:45:59PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Different socs have initialization operations in
> the probe process, which are summarized as functions.
> 
> This patch first factor out init function for th1520.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 51 +++++++++++++++++------------
>  1 file changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 903fe06050e4..bb0adc2ee325 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -830,6 +830,35 @@ static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
>  	}
>  }
>  
> +static int th1520_init(struct device *dev,
> +		       struct sdhci_host *host,
> +		       struct dwcmshc_priv *dwc_priv)
> +{
> +	dwc_priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
> +
> +	if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
> +	    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
> +	    device_property_read_bool(dev, "mmc-hs400-1_8v"))
> +		dwc_priv->flags |= FLAG_IO_FIXED_1V8;
> +	else
> +		dwc_priv->flags &= ~FLAG_IO_FIXED_1V8;
> +
> +	/*
> +	 * start_signal_voltage_switch() will try 3.3V first
> +	 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
> +	 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
> +	 * in sdhci_start_signal_voltage_switch().
> +	 */
> +	if (dwc_priv->flags & FLAG_IO_FIXED_1V8) {
> +		host->flags &= ~SDHCI_SIGNALING_330;
> +		host->flags |=  SDHCI_SIGNALING_180;
> +	}
> +
> +	sdhci_enable_v4_mode(host);
> +
> +	return 0;
> +}
> +
>  static void cv18xx_sdhci_reset(struct sdhci_host *host, u8 mask)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1231,27 +1260,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	}
>  
>  	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
> -		priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
> -
> -		if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
> -		    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
> -		    device_property_read_bool(dev, "mmc-hs400-1_8v"))
> -			priv->flags |= FLAG_IO_FIXED_1V8;
> -		else
> -			priv->flags &= ~FLAG_IO_FIXED_1V8;
> -
> -		/*
> -		 * start_signal_voltage_switch() will try 3.3V first
> -		 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
> -		 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
> -		 * in sdhci_start_signal_voltage_switch().
> -		 */
> -		if (priv->flags & FLAG_IO_FIXED_1V8) {
> -			host->flags &= ~SDHCI_SIGNALING_330;
> -			host->flags |=  SDHCI_SIGNALING_180;
> -		}
> -
> -		sdhci_enable_v4_mode(host);
> +		th1520_init(dev, host, priv);
>  	}
>  
>  #ifdef CONFIG_ACPI
> -- 
> 2.34.1
> 

Reviewd-by: Drew Fustini <drew@pdp7.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
