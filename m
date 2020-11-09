Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B58C55ABD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:55:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DFA20789
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aQv3YpRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DFA20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZcUFxFwyahrNlrDlEJxJqNT2yvBmjCLn9Mg9z2sdUoE=; b=aQv3YpRRkgMSL+sH2gRUB0Sk+
	M6EJZC8QOkuX8YYzoegZ/V/oCfXuMLgiNOzeFHNw2jZDOryaXj67zl16h3no60EjFCb67dHNiPGQQ
	XmoKMpgFsqLLXkpLGJuXNjFivpg/034w3Ls8D+N5ggFfKlvBrs3VAYjr8yNGY+117Cg0uX8GSOzmU
	sUp1GbJP9jSHa+GlqSeKhCHEXOsC7794on8s0/CfBqNOJ41h71XrgvrU854pj3HY/ZFAZvIpbNNCJ
	FBIU/tt6Gii1bTb4HhKofpnBOI8YJRRsieH++bN8H/nCeR4QJJBnfe8cGI4XFU4mW0obVgd7GDWlD
	+NUm4KiIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcF8M-0004r8-Jv; Mon, 09 Nov 2020 21:55:30 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcF8J-0004qj-Bp
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:55:28 +0000
Received: by mail-oi1-f196.google.com with SMTP id m17so11931809oie.4
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 13:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=04FVsg3be89rhioIr4Vul6hS9/ZyD/kx4pWYlaKleBM=;
 b=gkFw3z4OglN/Y1e/OgVOgdYF7V5ObxQ7P+Pl3EOiUzv/l1RUeb1gKDhhlX4xMz0y4R
 KLR8i5nQkYwKwcPaa+fIMptxrxdabP/nzFNvorPjmXtj/kHSiB3uAcFinl2wHJiIP2/H
 snyIu128sU9G3lWqDA6+YUgvnIfXsKev9VKqRmQ4JJkYPue8OS3H/I5hQ0WePl6SFUBm
 j/qltSfUoGvU6CgV0xiREOdvhX2YQaFsZ9Nlg2yUAcDSVHTBylG9/GrYdWWhpeddDw2M
 bEMoj0kLAhEP9Owi/R7XxgL0Ze698ikdowki4zSGObXxk503OAL12noKu90k8UTG3V4j
 22LQ==
X-Gm-Message-State: AOAM531Nn5zvnJFbxf+A06v4V8G1WsbLY56a4X7GxRZ2FtmagiDW/WXa
 PuX2n1JbceaCggl33d0uCg==
X-Google-Smtp-Source: ABdhPJzL2GcGme0D4867kVwep2Xa+C8mW3Fs8Qp4DkNNiQWlPr7shzCEUKfk7gGEG6DgNm+m3wq1VA==
X-Received: by 2002:a05:6808:d0:: with SMTP id t16mr797254oic.79.1604958926366; 
 Mon, 09 Nov 2020 13:55:26 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c31sm2753199otb.27.2020.11.09.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:55:25 -0800 (PST)
Received: (nullmailer pid 1824495 invoked by uid 1000);
 Mon, 09 Nov 2020 21:55:24 -0000
Date: Mon, 9 Nov 2020 15:55:24 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Message-ID: <20201109215524.GA1819368@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <20201109212158.y34otj3uy2hev75c@mobilestation>
 <BL0PR04MB6514111AE633C1E53B6F08A3E7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL0PR04MB6514111AE633C1E53B6F08A3E7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_165527_462197_AA7D1E91 
X-CRM114-Status: GOOD (  29.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 09:39:19PM +0000, Damien Le Moal wrote:
> On 2020/11/10 6:22, Serge Semin wrote:
> > On Sat, Nov 07, 2020 at 05:13:54PM +0900, Damien Le Moal wrote:
> >> The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
> >> ctrlr0 register format. This SoC is also quite slow and gets significant
> >> SD card performance improvements from using no-delay polled transfers.
> >> Add the dw_spi_k210_init() function tied to the
> >> "canaan,kendryte-k210-spi" compatible string to set the
> >> DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
> >> for this SoC.
> >>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >> ---
> >>  drivers/spi/spi-dw-mmio.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> >> index 3f1bc384cb45..a00def6c5b39 100644
> >> --- a/drivers/spi/spi-dw-mmio.c
> >> +++ b/drivers/spi/spi-dw-mmio.c
> >> @@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
> >>  	return 0;
> >>  }
> >>  
> >> +static int dw_spi_k210_init(struct platform_device *pdev,
> >> +			    struct dw_spi_mmio *dwsmmio)
> >> +{
> >> +	dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int dw_spi_mmio_probe(struct platform_device *pdev)
> >>  {
> >>  	int (*init_func)(struct platform_device *pdev,
> >> @@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
> >>  	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
> >>  	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
> >>  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> > 
> >> +	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
> > 
> > Other than the comments from Sean and Mark regarding the DFS_32
> > feature runtime detectability, I couldn't find a patch with adding the
> > new new compatible string into the DW APB SSI DT schema. Have I missed
> > it? If I haven't could you add one to the next version of the series?
> 
> Yes, I will. I forgot to change the DW DT binding doc for this. I did add a
> patch for the "polling" property but forgot the compatible string.
> 
> In any case, I think that this new compatible string change can be dropped by
> switching to automatically detecting the DFS32 and using a different solution
> than the polling property change I sent for the RX fifo overflow problem.

No, new SoC needs new compatible string. Especially if a new vendor. 

> 
> I am still going through all the emails trying to understand what to try next to
> avoid the polling "hack".

Use compatible.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
