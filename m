Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6CC021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJJw/Xv3pBOYbWjo483lVwtSg3MKSEhBxiym3FKwnk4=; b=SWb0W/QIqPPm1y
	fy2R2FY+rx2cwnNmCA49EDF5xrC+yQyasIRuGpwvjsednPOoIqDSDFsVXFrjHS35YwgAEi/e1F+aK
	O6uxf4WnSu3Zgut9IjoWVnVYornHPZRAm+uc4t/TMzwJLoRvW/6WNDg3arqMIoNQaS5r6ko2uYN0N
	VSXyucX1HnUx5q20LwA/Z1Vmrfm+tLIM+Tl7C+wLXw0JwYpDUMrKb/XUtWsHWyYOIi/Az7WszpsOy
	HySFEcW0LT65loICUJahIivDrKb60XXGyjbhPsI3Ix9+8ICL2E9jcdM66FhH70TmYprc/8k9OdyPi
	mkTlmpM8IdQSuT7dRRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkyG-0000000Fp9d-3BU8;
	Tue, 25 Feb 2025 02:46:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkyE-0000000Fp9F-190a
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 02:46:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220d39a5627so78189505ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 18:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740451613; x=1741056413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmIWyDzbi7XG4PWOrNU7Jp5a97tuft4JsdTFHE1ZFT4=;
        b=H5qAFJmj/4ub39CA1LXlhjWptxNKPfyfVaocoszjCsY8tzI+4bJ1YETp3tjgTKDSD/
         oRN/ufA41pTy81K4RfCYXcj9Ml7xnzliFsAT4XSOv6d9lV+FiEhxDC+UxKqI6Z2qHmx0
         g9sOoGe8oI/xdG1rPj80Jshe/dmogKUhwU+Moc0iNBeweXmxb9L6dpmnLL4CTgl47ayY
         BI+bkmODLeXa0lXzqWNyOvjkiMGMkHu3ZFCj9Av3rYb3dOfOVeFS9HnlarPwtZusKVZU
         SR1zFnM1r75YeSIYcDyFXbIjMmdM5AiwKme+e0eO/7OWuMa6ouKMYD3VGKyl/WuWzHTZ
         pkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740451613; x=1741056413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmIWyDzbi7XG4PWOrNU7Jp5a97tuft4JsdTFHE1ZFT4=;
        b=oP0/flXINp47/wmcttfbqjnxAvXA60ybq36u9ZB6gA89CLcxzHRGMICFWudcp5qgsa
         /TskNTUjsaeH6AUsdVrRT/45SgPM3YmVhvVltUMq13SqUww8PQlfU7+syJGR2UKLbgt3
         w3CZnstAc8blW7Gd6r0QKds329epaCmtGitEPxFAvbILU54Z26ieeBMtCQPY6kbUXtmS
         gjJHZCk1PwR826JGZ9FGoXZkxzmOEl7pPqHGe8Few1mbWpN7RaHvxnn5xvUp4jA6IriU
         cHN5wObyOOznmTgX21cRtwxrY2OMuzrGD9k6Qerq6FKrbi/+yciJ0JdgoNa78V4AEWGm
         FWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoIXzXmTZWL5UlO9NTGaLtq/D62BaUaGO/YGZUd1GaxhhYVpwYhmBC/Nwb/ExbaKUV3MUxw9r+G1i/CA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9K3dG/KjjsfuFGO8WJ1xjR9A7Lu36xVVeyhRgudwWJtN6s7b2
	biuN2RsG8Mqd6lj7LfdqresjpTNB6Z9qmA/ynEzpTw87omYZ9fRzDhPC5dqkEyD9vA==
X-Gm-Gg: ASbGncsUfRyg6Tf4zqGuqoyo7ULwiDehqPIHyJf7GLEo//ICWtsIsyVA7Fz6fiXh3Xl
	jgyQRRsydPGF7tpeLgUybBbDs5ACr++cEPU0bYdtQ8yFHRqw1ejlElba2DnEks9Auxtepoe8hHH
	gSfgazIN5HzK5Z+Y8rFBcg3LkmBuHtth8fjDGIWlVkPOWYEsHkKdYyfgXgjF9TXXqq4pyZXWnUl
	BlDFKhQ+MoDNJ/FNj9vEDizLmWil8Q5jcpI5lpkSi1Q3SkOzGzs3diwGH137vHwaMql1l4Vasg9
	t3/UbptZuOKVdGQlilLbhBQ=
X-Google-Smtp-Source: AGHT+IG62mV9bUNCTrCikvFZ49tzCfx9NyDU8cgaFnBUFHLGXzqnYJ/ncZN2tiei9ufed4SF/bBPXw==
X-Received: by 2002:a17:903:41d2:b0:21f:33:ad2 with SMTP id d9443c01a7336-221a003892emr229965215ad.52.1740451613128;
        Mon, 24 Feb 2025 18:46:53 -0800 (PST)
Received: from localhost ([111.34.70.129])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2230a00ab6bsm3279565ad.58.2025.02.24.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 18:46:52 -0800 (PST)
Date: Tue, 25 Feb 2025 10:46:49 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	looong.bin@gmail.com
Subject: Re: [PATCH 2/3] spi: sophgo: add Sophgo SPI NOR controller driver
Message-ID: <6sjygqay4kpwupau7gx5uulo4t32c3rn5kiktqxp6t2phi45ly@elsqfqzpnumz>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-3-looong.bin@gmail.com>
 <20250224132115-GYA41655@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224132115-GYA41655@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_184654_322081_0EC675A9 
X-CRM114-Status: GOOD (  39.02  )
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

On Mon, Feb 24, 2025 at 01:21:15PM +0000, Yixun Lan wrote:
> Hi Longbin:
> 
> On 18:12 Mon 24 Feb     , Longbin Li wrote:
> > Add support for Sophgo SPI NOR controller in Sophgo SoC.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  drivers/spi/Kconfig          |   9 +
> >  drivers/spi/Makefile         |   1 +
> >  drivers/spi/spi-sophgo-nor.c | 501 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 511 insertions(+)
> >  create mode 100644 drivers/spi/spi-sophgo-nor.c
> > 
> > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> > index ea8a31032927..6b6d7b348485 100644
> > --- a/drivers/spi/Kconfig
> > +++ b/drivers/spi/Kconfig
> > @@ -1021,6 +1021,15 @@ config SPI_SN_F_OSPI
> >  	  for connecting an SPI Flash memory over up to 8-bit wide bus.
> >  	  It supports indirect access mode only.
> > 
> > +config SPI_SOPHGO_NOR
> > +	tristate "Sophgo SPI NOR Controller"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	help
> > +	  This enables support for the Sophgo SPI NOR controller,
> > +	  which supports Dual/Qual read and write operations while
> > +	  also supporting 3Byte address devices and 4Byte address
> > +	  devices.
> > +
> >  config SPI_SPRD
> >  	tristate "Spreadtrum SPI controller"
> >  	depends on ARCH_SPRD || COMPILE_TEST
> > diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> > index 9db7554c1864..9ded1de4b2fd 100644
> > --- a/drivers/spi/Makefile
> > +++ b/drivers/spi/Makefile
> > @@ -134,6 +134,7 @@ obj-$(CONFIG_SPI_SH_SCI)		+= spi-sh-sci.o
> >  obj-$(CONFIG_SPI_SIFIVE)		+= spi-sifive.o
> >  obj-$(CONFIG_SPI_SLAVE_MT27XX)          += spi-slave-mt27xx.o
> >  obj-$(CONFIG_SPI_SN_F_OSPI)		+= spi-sn-f-ospi.o
> > +obj-$(CONFIG_SPI_SOPHGO_NOR)	+= spi-sophgo-nor.o
> >  obj-$(CONFIG_SPI_SPRD)			+= spi-sprd.o
> >  obj-$(CONFIG_SPI_SPRD_ADI)		+= spi-sprd-adi.o
> >  obj-$(CONFIG_SPI_STM32) 		+= spi-stm32.o
> > diff --git a/drivers/spi/spi-sophgo-nor.c b/drivers/spi/spi-sophgo-nor.c
> > new file mode 100644
> > index 000000000000..1139deeac327
> > --- /dev/null
> > +++ b/drivers/spi/spi-sophgo-nor.c
> > @@ -0,0 +1,501 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Sophgo SPI NOR controller driver
> > + *
> > + * Copyright (c) 2025 Longbin Li <looong.bin@gmail.com>
> > + */
> > +
> > [...]
> > +struct sophgo_spifmc {
> > +	struct spi_controller *ctrl;
> > +	void __iomem *io_base;
> > +	struct device *dev;
> > +	struct mutex lock;
> it will be great to document the lock

Thanks, but I don't think the function of this lock is complicated,
adding comments may be useless.

> > +	struct clk *clk;
> > +};
> > +
> > +static int sophgo_spifmc_wait_int(struct sophgo_spifmc *spifmc, u8 int_type)
> > +{
> > +	u32 stat;
> > +
> > +	return readl_poll_timeout(spifmc->io_base + SPIFMC_INT_STS, stat,
> > +				  (stat & int_type), 0, 1000000);
> > +}
> > +
> > +
> > [...]
> > +static ssize_t sophgo_spifmc_trans_reg(struct sophgo_spifmc *spifmc,
> > +				       const struct spi_mem_op *op)
> > +{
> > +	const u8 *dout = NULL;
> > +	u8 *din = NULL;
> > +	size_t len = op->data.nbytes;
> > +	u32 reg;
> > +	int ret;
> > +	int i;
> squash them which save one line:
> 	int i, ret;
> 

Thanks, I will modify it.

> > +
> > +	if (op->data.dir == SPI_MEM_DATA_IN)
> > +		din = op->data.buf.in;
> > +	else
> > +		dout = op->data.buf.out;
> > +
> > +	reg = sophgo_spifmc_init_reg(spifmc);
> > +	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE;
> > +	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
> > +
> > +	if (din) {
> > +		reg |= SPIFMC_TRAN_CSR_BUS_WIDTH_1_BIT;
> > +		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
> > +		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
> > +
> > +		writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
> > +	} else {
> > +		/*
> > +		 * If write values to the Status Register,
> > +		 * configure TRAN_CSR register as the same as
> > +		 * sophgo_spifmc_read_reg.
> > +		 */
> > +		if (op->cmd.opcode == 0x01) {
> > +			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
> > +			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
> > +			writel(len, spifmc->io_base + SPIFMC_TRAN_NUM);
> > +		}
> > +	}
> > +
> > +
> > [...]
> > +static const struct spi_controller_mem_ops sophgo_spifmc_mem_ops = {
> > +	.exec_op = sophgo_spifmc_exec_op,
> > +};
> > +
> > +static void sophgo_spifmc_init(struct sophgo_spifmc *spifmc)
> > +{
> > +	u32 tran_csr;
> > +	u32 reg;
> > +
> > +	writel(0, spifmc->io_base + SPIFMC_DMMR);
> > +
> > +	reg = readl(spifmc->io_base + SPIFMC_CTRL);
> > +	reg |= SPIFMC_CTRL_SRST;
> ..
> > +	reg &= ~((1 << 11) - 1);
> so this is a mask? use macro to define, instead of using magic number

Yes, this is a mask to init SPI Clock Divider, I will add a macro, thanks.

> > +	reg |= 1;
> > +	writel(reg, spifmc->io_base + SPIFMC_CTRL);
> > +
> > +	writel(0, spifmc->io_base + SPIFMC_CE_CTRL);
> > +
> > +	tran_csr = readl(spifmc->io_base + SPIFMC_TRAN_CSR);
> > +	tran_csr |= (0 << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT);
> > +	tran_csr |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_4_BYTE;
> > +	tran_csr |= SPIFMC_TRAN_CSR_WITH_CMD;
> > +	writel(tran_csr, spifmc->io_base + SPIFMC_TRAN_CSR);
> > +}
> > +
> > +static int sophgo_spifmc_probe(struct platform_device *pdev)
> > +{
> > +	struct spi_controller *ctrl;
> > +	struct sophgo_spifmc *spifmc;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*spifmc));
> > +	if (!ctrl)
> > +		return -ENOMEM;
> > +
> > +	spifmc = spi_controller_get_devdata(ctrl);
> > +	dev_set_drvdata(&pdev->dev, ctrl);
> > +
> ..
> > +	spifmc->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(spifmc->clk)) {
> > +		dev_err(&pdev->dev, "AHB clock not found.\n");
> > +		return PTR_ERR(spifmc->clk);
> > +	}
> > +
> > +	ret = clk_prepare_enable(spifmc->clk);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Unable to enable AHB clock.\n");
> > +		return ret;
> > +	}
> you can combine above with devm_clk_get_enabled(), and simplify 
> return routine by using "return dev_err_probe(..)"
> 

Thanks, I will modify it.

> > +
> > +	spifmc->dev = &pdev->dev;
> > +	spifmc->ctrl = ctrl;
> > +
> > +	spifmc->io_base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	ctrl->num_chipselect = 1;
> > +	ctrl->dev.of_node = pdev->dev.of_node;
> > +	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
> > +	ctrl->auto_runtime_pm = false;
> > +	ctrl->mem_ops = &sophgo_spifmc_mem_ops;
> > +	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
> > +
> > +	mutex_init(&spifmc->lock);
> strictly, you still need to do error handler, e.g, destroy mutex if probe fail

Thanks, I will add it.

> > +
> > +	sophgo_spifmc_init(spifmc);
> > +	sophgo_spifmc_init_reg(spifmc);
> > +
> > +	return devm_spi_register_controller(&pdev->dev, ctrl);
> > +}
> > +
> > [...]
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
