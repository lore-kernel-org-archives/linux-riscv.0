Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B8C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h5rnt4cCGFZbYNZm37O5HEae3Ly70T7xzY5PhvXXano=; b=Qck415wrsDKB4e73pRUEnoxUGb
	Ea+IhB4JwQk3AybwD1iJrM9ZFVqypYPZTbr8uOJ+1HJxpD0aTFwjs0ccdb5P5XVIlJD5818VJln1/
	roxZbHwH48g63W5ftQKwslNuqK8gV87lLiy7+0i0MAl3R26QFiO8bvabynAiKzzKo3kDTj5gvE6z4
	xp2nixDn9ZvYcaMRgbbA8Zk2FsKOHz7g8v0h4O1qIBsnJpRu5k/syziJM6vOLdsH2WN2yvovmyJc/
	2eQn2+AoShDNDd9SzkNy4aWIonpfvEUt2cTp2KSc9/5TemGr97mcV4OmpyG+adBlPb/Nu9944vf97
	7MSF1wWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9REF-00Fo9B-0V;
	Sat, 02 Dec 2023 14:44:23 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9RE9-00Fo7I-2H
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 14:44:21 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E0DE742256
	for <linux-riscv@lists.infradead.org>; Sat,  2 Dec 2023 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701528246;
	bh=r6jeVOJ8uNScbavO6oRhJDbP/R2qrE1dKTxqhisFANk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=netJP91cRT6bHTdR3RflFp92vX6ievOk7LiRu4YWxsUlhsoDhy9+nufCMbf7J77SX
	 tg3hiEONn8JGFmM3oVDWMS9Rjw8HXH2RGnV+48QGxnunmGsU5tK2dG7nd3h90ccWdS
	 iieqBAcrLvIwry8dUqtcwVauyRhOzWM34jWuGZ3DqToFPOYC6wsgoWbtFtz5fXNvVj
	 Pe0Zd7zS/6hrpdJHSmYbl41wqQsxlD+nZKPHLTrUJi+BFQTmVKd8htS6OIgnNmRJwA
	 pHmnVKjiCrJwzygJr/edqGphpQkR7OeQQK4AD4uV8gjMFq54JCR2QAQUhoGcY+G+AN
	 uvZYGjzzEuNhw==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67a94e16c21so23291846d6.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Dec 2023 06:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701528244; x=1702133044;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6jeVOJ8uNScbavO6oRhJDbP/R2qrE1dKTxqhisFANk=;
        b=iiGrf4HOBop8AjAHhMtMtj7IJirihjEdnXVvim/ao0iQ4tTyGKWTukqmchL/me2ynO
         37oefDpgrElrn2BU+Rgz8DZPA2ENhF+5DVZGRQopvF2I9/cRkHCz5lohxPJDtEvXqmD8
         aBQTUgOqmGoNMaUOcphnTi0YNHYYLbole0ZDxiRNFboRWZXqNl5x6DG5nKg74/rHwn4x
         Qv3YQkd521UDh4mi+I5nDSiQ5YTcD9oVsEQc41IDzeJC9nAy9qKj6GQFaZujgkmaE4pH
         PfsaP18nOqUjdBC5BH6hikH0e6hPCn09oQPBSOTQzGW3nkKEWtgXAY5/LP3zC63O+6wj
         K9LQ==
X-Gm-Message-State: AOJu0Yy4CqOP7E9cdp9lIhU1m1wHxU/GEIJ4qe8U2hz6rJi+4YeoqvjZ
	gyLUoe/SUOa6bibLzTI5j5FdGa1n18+35H2g+kXZ7sS0FnHNrndRQjPS++uHCLLvOEI0SnIMp3k
	S+mUrFx/EeAvxQqXDc7vGl25MhNI1hUhwZpbY2BmKLgpdQRN8VOhpUuBCoKH2QQ==
X-Received: by 2002:a05:622a:86:b0:425:4043:5f41 with SMTP id o6-20020a05622a008600b0042540435f41mr1919268qtw.127.1701528244256;
        Sat, 02 Dec 2023 06:44:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfPh334flr508EAZGNmLTyM+4QVgpXEgp8thSKGdCRPDIkTWGyXFCRDmz6MtLcyELHQnAA8WedEPZYZ24lPUA=
X-Received: by 2002:a05:622a:86:b0:425:4043:5f41 with SMTP id
 o6-20020a05622a008600b0042540435f41mr1919239qtw.127.1701528243903; Sat, 02
 Dec 2023 06:44:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 2 Dec 2023 06:44:03 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231115114912.71448-20-minda.chen@starfivetech.com>
References: <20231115114912.71448-1-minda.chen@starfivetech.com> <20231115114912.71448-20-minda.chen@starfivetech.com>
Mime-Version: 1.0
Date: Sat, 2 Dec 2023 06:44:03 -0800
Message-ID: <CAJM55Z8hb3vBgwOHoHuJpEPFVMNirhcs8AfZWRn4EgxbOGsq2Q@mail.gmail.com>
Subject: Re: [PATCH v11 19/20] PCI: starfive: Add JH7110 PCIe controller
To: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_064417_898346_42484FE5 
X-CRM114-Status: GOOD (  13.20  )
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

Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller platform driver codes, JH7110
> with PLDA host PCIe core.
>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Co-developed-by: Kevin Xie <kevin.xie@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  MAINTAINERS                                 |   7 +
>  drivers/pci/controller/plda/Kconfig         |  11 +
>  drivers/pci/controller/plda/Makefile        |   1 +
>  drivers/pci/controller/plda/pcie-plda.h     |  71 ++-
>  drivers/pci/controller/plda/pcie-starfive.c | 460 ++++++++++++++++++++
>  drivers/pci/pci.h                           |   7 +
>  6 files changed, 556 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pci/controller/plda/pcie-starfive.c
>

...

> +
> +static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie,
> +				  struct device *dev)
> +{
> +	int domain_nr;
> +
> +	pcie->num_clks = devm_clk_bulk_get_all(dev, &pcie->clks);
> +	if (pcie->num_clks < 0)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get pcie clocks\n");

Hi Minda,

From Damian's mail I noticed that this should propagate the error from
devm_clk_bulk_get_all() properly, so -EPROBE is converted to an -ENODEV error.
Eg.

	if (pcie->num_clks < 0)
		return dev_err_probe(dev, pcie->num_clks,
				     "failed to get pcie clocks\n");

> +
> +	pcie->resets = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(pcie->resets))
> +		return dev_err_probe(dev, PTR_ERR(pcie->resets),
> +				     "failed to get pcie resets");
> +
> +	pcie->reg_syscon =
> +		syscon_regmap_lookup_by_phandle(dev->of_node,
> +						"starfive,stg-syscon");
> +
> +	if (IS_ERR(pcie->reg_syscon))
> +		return dev_err_probe(dev, PTR_ERR(pcie->reg_syscon),
> +				     "failed to parse starfive,stg-syscon\n");
> +
> +	pcie->phy = devm_phy_optional_get(dev, NULL);
> +	if (IS_ERR(pcie->phy))
> +		return dev_err_probe(dev, PTR_ERR(pcie->phy),
> +				     "failed to get pcie phy\n");
> +
> +	domain_nr = of_get_pci_domain_nr(dev->of_node);
> +
> +	if (domain_nr < 0 || domain_nr > 1)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get valid pcie domain\n");
> +
> +	if (domain_nr == 0)
> +		pcie->stg_pcie_base = STG_SYSCON_PCIE0_BASE;
> +	else
> +		pcie->stg_pcie_base = STG_SYSCON_PCIE1_BASE;
> +
> +	pcie->reset_gpio = devm_gpiod_get_optional(dev, "perst",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(pcie->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
> +				     "failed to get perst-gpio\n");
> +
> +	pcie->power_gpio = devm_gpiod_get_optional(dev, "enable",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(pcie->power_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pcie->power_gpio),
> +				     "failed to get power-gpio\n");
> +
> +	return 0;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
