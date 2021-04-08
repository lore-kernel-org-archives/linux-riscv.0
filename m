Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E69C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E1261131
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 15:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E1261131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5EISnJO5kVFTH1HFeBRWynKP4w5jjDzXj64N/jeVOB0=; b=M0XBKMwLljhOqmd33jjHoH9+P
	LE/AvnsxZxXci3N42U9iHwhNxN0x/OI7bREKXRGogRTJSN0dX0bI11RqFk17+hGFM9icK587HyG4m
	78ZQDhMFmQQ033YDkmkoqmLgISCzy9OYKH/QXZwhEshu9+F8DH+AhUoQ6Mb9IFkAIgbTG31SHgIMt
	/X7jXlnwNYIQ23o0JN34twfjh6NNfr6ygv37XX4PFcqNnVNKRRFWTWtxhZeDeBSJwYceZInyvkpgU
	f7sbN5tAq/CcuWoUdUIaW82210BSPv8414l+pe56HUr7Jn0HKfbNMjehOLIxp25FNmL+69lTPQlk9
	2ytnMtlSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWZU-008Oo5-Un; Thu, 08 Apr 2021 15:27:53 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWZO-008OkN-Fa
 for linux-riscv@lists.infradead.org; Thu, 08 Apr 2021 15:27:48 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so2643731otq.8
 for <linux-riscv@lists.infradead.org>; Thu, 08 Apr 2021 08:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rdZfDLUXaMwgcMUkGetCIhlvH4deTfYYyOQSzUBFId8=;
 b=EBA6r2Lg5zK0fiw1ON8Ut0pfc0yLFYiFtxNPs7e3C1bNAzK6kZOOpe+V11Q/lokCVz
 zDaflK8tBP7l2hUBwD//4nA5b5GW2EYbCED4oryzTHWTS3KK15PcQCDIM8eqQ5RmWiPP
 xyd4ib9W5VXIyB9V2osM+lSSFimGwQ1uvXazpGkx7P4oX08DwbjO311xLlpKniuVdSor
 veMTxMEsgAWr2lXhgPZ55JrrfbEZIULn8VHmgnv18gLvtAiyOvg2sXvFB9cRvyEX2Rg0
 vXSNoeMNHKK3HU5gD5KamSj1ALMrDpdZfWt2tFeyMwn22rNew6PNdGdGDbI9Lj1Alx2F
 XCMw==
X-Gm-Message-State: AOAM532dNtCATVe2AwCIHKQzDvHH5GE2WCtSdGs273rWFyuMjkLV7UnP
 DtVmlQc1msCSYiyVqyba6Q==
X-Google-Smtp-Source: ABdhPJx+CB57VJt5MT3qSNg+O2bSCTTG4lZKqRMJVQNbU1/SJ53npzyNH/Jh8yb4te5/vIqEC6CGww==
X-Received: by 2002:a9d:70cf:: with SMTP id w15mr8438401otj.283.1617895664765; 
 Thu, 08 Apr 2021 08:27:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n12sm6389560otq.42.2021.04.08.08.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 08:27:44 -0700 (PDT)
Received: (nullmailer pid 1515862 invoked by uid 1000);
 Thu, 08 Apr 2021 15:27:42 -0000
Date: Thu, 8 Apr 2021 10:27:42 -0500
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v5 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <20210408152742.GA1510069@robh.at.kernel.org>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210406092634.50465-6-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406092634.50465-6-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162746_798140_9B69EC21 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, Apr 06, 2021 at 05:26:33PM +0800, Greentime Hu wrote:
> From: Paul Walmsley <paul.walmsley@sifive.com>
> 
> Add driver for the SiFive FU740 PCIe host controller.
> This controller is based on the DesignWare PCIe core.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Co-developed-by: Henry Styles <hes@sifive.com>
> Signed-off-by: Henry Styles <hes@sifive.com>
> Co-developed-by: Erik Danie <erik.danie@sifive.com>
> Signed-off-by: Erik Danie <erik.danie@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |   9 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-fu740.c | 308 ++++++++++++++++++++++++
>  3 files changed, 318 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
