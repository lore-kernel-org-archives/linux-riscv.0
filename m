Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A5BD5B865
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 03:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pvmh2eC4TogGGo7QqEwkk8fpiFlRyH/pghJQt18FffA=; b=cKan9ywxZ4VLO7
	tqVx7Aw8Jmzx385Ok3mHnm++i5/uUj5+clJb5IFugU39OOC2WC//18OEjZG4g9ZL+zGE1WTj//iMb
	gnD84n2r58DkYAW1gT9V/UBFJjeTAWGSRE3VMZOwSyV9QAm5sJxl1pSh3MOdNoxWtTtv2NEeyP6Xp
	LukPDNNum+84lAHdPO4FwpNtGrc9YLOZCyt8BRWWJG1zOzOt2tUquqhFZZv+9dTIWzc0N6W8N+4vJ
	q3Ly5/USMgmKi0nllcqCNmSJxKRzmmYbFYfUHyNRGT0uebs2CbtEsj/yjGfsIeKb6EjrAG7tY4KcI
	dHAj4tzSpQ4uGYcjI0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d0G-0000000D664-0sY7;
	Tue, 29 Oct 2024 03:34:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d0C-0000000D65a-3ZlZ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 03:34:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cf3e36a76so49261625ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730172880; x=1730777680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSg6iwg6m8H/oTxICMnvBDVJFOncGQFLnOpMpcMDaOM=;
        b=QHV5t98qHmK85N4tPIF9TRvEWFHrKPN5wssh36ezpE0xt5dnG8lcfO4V4sCtvHMM5t
         lB0sfMM6P6MMyW9v5bfpUCJzbXaZWYfytpkTxySWLMSJLCrE6pZ7CZt1Tv0IBUwxx8bW
         o2zQLbkgGSHx6/bXGsf5SYikTsSb7jpO9rf02SiqsqlktUuLqdzeCSQ6z6plpN5mNd6Y
         tD2TkptVy7HxBJmZXEwxEn8b7UNBl68L0euS2hhiXbHFf70cs0DkHotBMY/IQJu/7+iX
         LTc0z1L9SGV0L8RnVFDhVGRaUHA7oguBijegJjw3jTywbCo6BiGDFZ4Oo3f6to8v2yq9
         GQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730172880; x=1730777680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSg6iwg6m8H/oTxICMnvBDVJFOncGQFLnOpMpcMDaOM=;
        b=UytbADJCnJFhT8YwkEaNQPqqwLvR/qaTEqsaj8Rns/ke6uUkWlzt2540qBZBLuyKgR
         3pqAhvVAWwRFSYBAC9M++euJF9XkSrGHlgpijFDj3Nv0APn6NtyyOwgsdKp6erwHlNUB
         WuuqAWUEFluq2CLmHkOnJQMy69iVzoREYjbonckKyGYVdIdNvVdp/FcAEXLbAahCKRR3
         ci9V/QpEi93pJUgtd8mY35fxJLZ5sbLW0Zheo5Kf+igpcPWLGheAIueq/q/2QgC+HKG2
         fRfVEGPB+R/ABRL/2nRJ8nL0OqiTDlT84uLdpBr74jc4z2S+ps1XOWzDNaZ0tRNlamVI
         oeqw==
X-Forwarded-Encrypted: i=1; AJvYcCVyO6kbOey7wIoroOL6rcv9yqlscp3e7QWUAd+yElkAZzbiccKobw4UEwti89B6BV3JuGcre4WhEFFwUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQaJBnlCqxFaUp9IQpswXjcslDcabgEWpVUSQu0PbYZ5i4Gr7Z
	UUDSe+CWZw/VK3siZWiewWPN5//czMCeDaXolnv5P+zfxZNRrMgw
X-Google-Smtp-Source: AGHT+IHRfJL20TOTFufsIiVQ2aqDX8rcEhb5BS+f95mlHBX7cYDc6ZdYndIcZMOVGpfkVOvMZ60Pug==
X-Received: by 2002:a17:902:d507:b0:20e:986a:6e72 with SMTP id d9443c01a7336-210c6c0906bmr151590325ad.30.1730172880132;
        Mon, 28 Oct 2024 20:34:40 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ebcdsm57394395ad.223.2024.10.28.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 20:34:39 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:34:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
Message-ID: <dza57u6svlsbi7tmxujb4z4b5iqvzthjhyjybt2sklys6ovnpi@kcefsrcevr2h>
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-3-inochiama@gmail.com>
 <MA0P287MB28228810469B6A46D26CAF51FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB28228810469B6A46D26CAF51FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_203440_918690_5553EE75 
X-CRM114-Status: GOOD (  22.33  )
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

On Tue, Oct 29, 2024 at 10:59:04AM +0800, Chen Wang wrote:
> 
> On 2024/10/24 14:43, Inochi Amaoto wrote:
> [......]
> > diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> > new file mode 100644
> > index 000000000000..f1c33b166d01
> > --- /dev/null
> > +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> > @@ -0,0 +1,583 @@
> [......]
> > +int sg2042_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct sg2042_pinctrl *pctrl;
> > +	const struct sg2042_pinctrl_data *pctrl_data;
> > +	int ret;
> > +
> > +	pctrl_data = device_get_match_data(dev);
> > +	if (!pctrl_data)
> > +		return -ENODEV;
> > +
> > +	if (pctrl_data->npins == 0)
> > +		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
> > +
> > +	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> > +	if (!pctrl)
> > +		return -ENOMEM;
> > +
> > +	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(pctrl->regs))
> > +		return PTR_ERR(pctrl->regs);
> > +
> > +	pctrl->pdesc.name = dev_name(dev);
> > +	pctrl->pdesc.pins = pctrl_data->pins;
> > +	pctrl->pdesc.npins = pctrl_data->npins;
> > +	pctrl->pdesc.pctlops = &sg2042_pctrl_ops;
> > +	pctrl->pdesc.pmxops = &sg2042_pmx_ops;
> > +	pctrl->pdesc.confops = &sg2042_pconf_ops;
> > +	pctrl->pdesc.owner = THIS_MODULE;
> > +
> > +	pctrl->data = pctrl_data;
> > +	pctrl->dev = dev;
> > +	raw_spin_lock_init(&pctrl->lock);
> > +	mutex_init(&pctrl->mutex);
> > +
> > +	platform_set_drvdata(pdev, pctrl);
> > +
> > +	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
> > +					     pctrl, &pctrl->pctl_dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "fail to register pinctrl driver\n");
> > +
> > +	return pinctrl_enable(pctrl->pctl_dev);
> > +}
> > +EXPORT_SYMBOL_GPL(sg2042_pinctrl_probe);
> Why EXPORT_SYMBOL_GPL? sg2042_pinctrl_probe looks like just a global
> function should be enough.

See below for why declare it as a module.

> > +
> > +MODULE_DESCRIPTION("Pinctrl OPs for the SG2042 SoC");
> > +MODULE_LICENSE("GPL");
> 
> pinctrl-sg2042-ops.c is just a common file built together with
> pinctrl-sg2042.c, right? Why you declare it as a module?
> 

This is for sg2044, which has the same pinctrl ops. Build this as
module could save some space for the final image. 

> > diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> > new file mode 100644
> > index 000000000000..81411670f855
> > --- /dev/null
> > +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> > @@ -0,0 +1,642 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo SG2042 SoC pinctrl driver.
> > + *
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> 
> Sort in alphabetic.
> 
> [......]
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
