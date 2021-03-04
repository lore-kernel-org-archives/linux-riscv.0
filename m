Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D89C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 12:01:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 613B660C3D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 12:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 613B660C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ffoohGPzJq2J9KvfR5dLtqSAgLxzg3aPZl1gC6zXyc=; b=O1MsjPYeFy1FvYAcImXtGz+lQ
	GMvw7+KsXyWguRB1dA3Nooogy7MPy4g1ESStQOE7z1Og2lHNqqS/SjY4zhXRsWCGTFAtL6A5bX2WF
	SpfUk89NuOxniR4e27ZCBoaWOXWq9WFx7W5nNr7PPH/pJm+z6nQqfomJWUd60gSZ+OlRYNBZ+fmCG
	Uui6HH+AHnf0Nzjp9etHUHxdpqTafkyESGHyaNYd3+zQUj6x8gg8oQxCObpJ3zBv0FI968Ly9JRfE
	w4ZOqCs1dm32Y80cp7fOc+OsCix/gHzoO9PuS6Uy66kgolatLbo35wvlwSYlk62LSblNBF5TVAxlY
	N2gVR7yHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHmfB-008XNP-M6; Thu, 04 Mar 2021 12:01:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHmef-008XF5-9f
 for linux-riscv@lists.infradead.org; Thu, 04 Mar 2021 12:00:37 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lHmeU-0002Qy-MG; Thu, 04 Mar 2021 13:00:22 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lHmeP-0005IT-4s; Thu, 04 Mar 2021 13:00:17 +0100
Message-ID: <807b832828d95bc003e7caed63ff86b4f9ff6eaa.camel@pengutronix.de>
Subject: Re: [RFC PATCH 5/6] PCI: designware: Add SiFive FU740 PCIe host
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Greentime Hu <greentime.hu@sifive.com>, paul.walmsley@sifive.com, 
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com,
 bhelgaas@google.com,  robh+dt@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com,  alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com,  vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Date: Thu, 04 Mar 2021 13:00:17 +0100
In-Reply-To: <34c2c3985443b23a75ce89c605c4b833bbafd134.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
 <34c2c3985443b23a75ce89c605c4b833bbafd134.1614681831.git.greentime.hu@sifive.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
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

On Tue, 2021-03-02 at 18:59 +0800, Greentime Hu wrote:
[...]
> +static int fu740_pcie_probe(struct platform_device *pdev)
> +{
[...]
> +       /* Fetch reset */
> +       afp->rst = devm_reset_control_get(dev, NULL);

Please use
       afp->rst = devm_reset_control_get_exclusive(dev, NULL);	

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
