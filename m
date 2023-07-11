Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37128EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meQLcqZWGfXbFBcJxWImVgMgDgEpJ7lobZt3Ii1U+g8=; b=WsyUtdSjnhy5ZZ
	olEnastjsDOmGuc+3XoHFK/pGa3B0iOZGh/PIQuPoTEnYEknFZP9ZYzHPS6r7QUZQvN1o7g1ub3QL
	R83mD0ZUiat7B9WT1/alBMdCmz6UvnoF5e+mqL0EHnpYpgz1POFdb5lI67NUN72v4K42I1eWSlA9q
	pWLo5ib0YL+H991ez21huyFGHVriQGpa+EyIWAyjD6HhQPMRKEcQjPj1VzHqaIsRuzA70iW7ZzVtn
	kmTQdQg/o4gKbcqCp2vUDXYlXNdQIBNKYAYpnpeDTRqvNlf2o4f/IhJemktk/TVJ3ZTvP5zlzQMD3
	H0ApkQ+IfoZ4gWawxFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBCe-00EisQ-1i;
	Tue, 11 Jul 2023 11:06:44 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBCY-00Eipv-38;
	Tue, 11 Jul 2023 11:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073598; x=1720609598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RVFLgj8cxsWZyvySjgaprTvsCfpSOgqQ4kC3+s/s1Fk=;
  b=Fgb/nzHdhACg9g5her1kIIHPWeJMCqDylq1nS+bRcMWjiKxpA76/iRcO
   sTaAJTdEfkONty+4pL+OBY1upct2eZJaa4dveqrXbk3kmo5ZJOI1SR7RY
   0j2QKeopsLJL046lR2p7P5OwtCgGchysPywz5Pn5OutUssKFMvY8YFclT
   n0hIv9eG7KDpQx3c8NmnCtn0Jb2aXBQQkjgMQ5RrDtFwWeKmlp8DCUnyI
   hRoX/Qni1jMapu+3UrmVLm17GxCFKi5L9dQLNfHca7upEJ/XelTOsOMvw
   Ah8UDbx6EyH4MprfWwiu8ZjGKMq5NdlSF/dewGDPmVUaN+1dmwFmU0erh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450950692"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="450950692"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 04:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721057401"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="721057401"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 04:06:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJBCG-001pDs-2n;
	Tue, 11 Jul 2023 14:06:20 +0300
Date: Tue, 11 Jul 2023 14:06:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
Message-ID: <ZK03rBqoQ0IZz617@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
 <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_040639_021886_DD1B10C7 
X-CRM114-Status: GOOD (  24.95  )
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

On Mon, Jul 10, 2023 at 06:16:22PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:
> > Seems by unknown reason, probably some kind of mis-rebase,
> > the commit 0c79378c0199 ("spi: add ancillary device support")
> > adds a dozen of duplicating lines of code. Drop them.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/spi/spi.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> > 
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index c99ee4164f11..46cbda383228 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
> >  static int spi_add_device_locked(struct spi_device *spi)
> >  {
> >  	struct spi_controller *ctlr = spi->controller;
> > -	struct device *dev = ctlr->dev.parent;
> > -
> > -	/* Chipselects are numbered 0..max; validate. */
> > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > -			ctlr->num_chipselect);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/* Set the bus ID string */
> > -	spi_dev_set_name(spi);
> 
> I see that this is duplicating spi_add_device() (and we really could do
> better with code sharing there I think) but I can't immediately see
> where the duplication that's intended to be elimiated is here - where
> else in the one call path that spi_add_device_locked() has would we do
> the above?  Based on the changelog I was expecting to see some
> duplicated code in the function itself.

Oh, by some reason Sebastian wasn't in this rather long Cc list.
Added him.

Reading again I don't see any useful explanation why that piece of code has to
be duplicated among these two functions. It's 100% a copy.

Sebastian, can you shed some light here?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
