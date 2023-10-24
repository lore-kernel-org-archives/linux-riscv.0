Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76041C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 05:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g/g7Vj3Eio8m/JmNhuow0p5QSvVtHTngru67gMT2WY=; b=VVeBaAtSlcJCGP
	hh9qQ/KykJSoiSHetu1NhTsjEmxbBuWIfW+suJWPBoPM2wG1HvpOmang/fp69hwwS28QPadrUfBfa
	acoNtpMjUReP6vUIC0TDSNqX+Vvt4GDni4ODdAKhRr0V9XESCFTzcF346i2sqtcA1b0k6JGO8G5pj
	BmvhAAbbXKU4GzRAUZsUt4ydPqVrCWklNMgJEXVNKij32TI8Iq2wGuMOfbOhkYj5aKJ773+TVXTfU
	ijFmu9XhFXXdysWJEulmPL1Hnatbv2UTPwuBNDx5Zt3y3yRuRen5HwKQJTmuhrgV6oUMvIoGHpwUV
	iVmkcNXaxEke3M0cj3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvA1J-008tYZ-0f;
	Tue, 24 Oct 2023 05:32:01 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvA1G-008tXw-0c
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 05:31:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6bd73395bceso2992314b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 22:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698125514; x=1698730314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMgZBMWXzo4q6vwznsY5I4wwZsoXDFPKydTpbp5gDQw=;
        b=paWHUYSSstaJRgFBNvsGEaL/O4/gkNix8kbelIsJzZDL09PVQzq9bnC6Zj+9GQXIDH
         jmRqqWy0I1w2NafDbZ9gLdZwDylQY2BiJA84qHK8wTqX/xGLSqZUDqHMv7U7nwXm/lPm
         kSOVgskdaou7ZEWCnBnz+/6ksb0exkJf2en3L8KHiGGp/wiGBSwBnAKMKda3AoxywtVY
         v2+jRO2LPlzMRG7GpBCtrN/9Aeed8zK3lzwge85boalcazsKmdN9ZEMaK+NcDQUmMebt
         Eu61OQ8ZhLbPT/3vlxBSPZV3JjEHTvSjU/3H+R9yi6weuUHY2oEUL8dcehjaoqTaGcq0
         +SBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698125514; x=1698730314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMgZBMWXzo4q6vwznsY5I4wwZsoXDFPKydTpbp5gDQw=;
        b=ZQXN5LtyICCCv5QP2xQK5WU1qTIgwdB4cVaSfyfTKGUSG4nuw8RuBO8ypSY4eswiv9
         hP5F2fu5U6YC7eFc3XbRjWDsYMWPYPgy7PnSeNXLC9uRbbzqeHl0lwtb3wumVResR1Rh
         qg2fJoHYOV3yvUwMhjOby4W42+PGHbdHY22/Zhvjt/lMsOS3/iL4vUcasYzPaXL9Pj8j
         9l6D7w4Y/0y2AA/nQB7EuS/7RhvLRrcKQbml3xID/5jNT+3jcwHn0eek0thE7ynd/QXD
         ih4L44jm7/Y0u8dXcIK+DbTkezf94w0dZJ8CSv+lKi0p0YT7QXmnEcj78FWwSG35kCez
         uccA==
X-Gm-Message-State: AOJu0Yyo9UzS2qTPm896vAiyMUr/xn4BhC7sUjXEe0BDT0WPI9R+1I9z
	lH3Wf2uNKcK3rxR4HF/35NnaCA==
X-Google-Smtp-Source: AGHT+IEXabVD0I42LfRfAleaLrDfaEeikt+nTW/LvpW+v1yM0hF9QKpCxuvRXO4yGRldBbG6ljXApg==
X-Received: by 2002:a05:6a20:7348:b0:17b:2c56:70bc with SMTP id v8-20020a056a20734800b0017b2c5670bcmr2083668pzc.10.1698125514459;
        Mon, 23 Oct 2023 22:31:54 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e9d:1e7:259:d68d:db3b:3cc])
        by smtp.gmail.com with ESMTPSA id y15-20020aa79aef000000b0068883728c16sm7216982pfp.144.2023.10.23.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 22:31:53 -0700 (PDT)
Date: Tue, 24 Oct 2023 11:01:37 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 12/14] irqchip/riscv-aplic: Add support for MSI-mode
Message-ID: <ZTdWueglO1iXuS1D@sunil-laptop>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-13-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023172800.315343-13-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_223158_233674_381F6B1A 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Anup,

On Mon, Oct 23, 2023 at 10:57:58PM +0530, Anup Patel wrote:
> The RISC-V advanced platform-level interrupt controller (APLIC) has
> two modes of operation: 1) Direct mode and 2) MSI mode.
> (For more details, refer https://github.com/riscv/riscv-aia)
> 
> In APLIC MSI-mode, wired interrupts are forwared as message signaled
> interrupts (MSIs) to CPUs via IMSIC.
> 
> We extend the existing APLIC irqchip driver to support MSI-mode for
> RISC-V platforms having both wired interrupts and MSIs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
[...]
> +int aplic_msi_setup(struct device *dev, void __iomem *regs)
> +{
> +	const struct imsic_global_config *imsic_global;
> +	struct irq_domain *irqdomain;
> +	struct aplic_priv *priv;
> +	struct aplic_msicfg *mc;
> +	phys_addr_t pa;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	rc = aplic_setup_priv(priv, dev, regs);
> +	if (!priv) {
This should check rc instead of priv.

> +		dev_err(dev, "failed to create APLIC context\n");
> +		return rc;
> +	}
> +	mc = &priv->msicfg;
> +
> +	/*
> +	 * The APLIC outgoing MSI config registers assume target MSI
> +	 * controller to be RISC-V AIA IMSIC controller.
> +	 */
> +	imsic_global = imsic_get_global_config();
> +	if (!imsic_global) {
> +		dev_err(dev, "IMSIC global config not found\n");
> +		return -ENODEV;
For all error return paths, priv should be freed.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
