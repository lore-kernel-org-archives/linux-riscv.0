Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D35C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:36:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A4360BD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A4360BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jbJDBxNMLu7Zj+uutqCluB8LhM4h/axNt8bbCfnf0+k=; b=loRwaZExqjZ2r6OTqlNUxz9bT
	sdoBV5fMRsHwLNewuvwMM/Jaa6/kFcZaZiexcfIa/8NPzxiRdfYqS0/YrA8BCMSGGIjczzTOfx3xh
	+Y1AGd5+polTaGUODUuM5AG1JHGvOC7yC61fi53ZuPCpbj4cgnXsXycJn1QRYJXmztkYlzccqbH7J
	nDedatP0efRwI/jfHMRQVDZ1uksQe9mTRV5Ecg+SRfh9JldUgTMymskXiRdc9A5/RWcV8zNAymjEZ
	V2vuFizYwwaTf/yYBY7+Yxh84fZzwj7UP2QE6fr+esYswQX6Cw4WZqLDFFMjBdyjE3wCwETUvM9uT
	3U62hoYxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqvu-008glb-7X; Thu, 01 Apr 2021 06:35:58 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqvo-008gkA-Ia
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 06:35:56 +0000
Received: by mail-wr1-f52.google.com with SMTP id j9so611392wrx.12
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 23:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4rL9IgiyziFhXFq9JhHe8MRiCspi+Fv8AChbH+YGoiU=;
 b=TlJK7vJH5nUYhzaTSa6DFL1x+iubDdNECLUXLbwjTAwwMsq28aB4naA5aNh8aOZQ/N
 KpLdw4whartu9C3R+fuuwiQKWuQy1V4o8IbSN7EAnPtf4VPdA7RMs8pzjys/FHCnHtk2
 sOozlGUef/s/4yLnPdCPz9AaxHxP02eL+yh2mOgV2rVgydlMjaH+DV+LZ0CLBezAqbXW
 ldVMNIp4IP0E67QLCMBfiWTTnoRedKEV8IRXMI8PHSJGmS50XVD8hEHRSGIGrWG3ocn5
 lMAL5iE9vIaOYrcmfmer8I1uw3BXpvAc91SZhrXNUaS+pXpwAyTGHDcrEFUGPagyxkDT
 +mqw==
X-Gm-Message-State: AOAM530J365Si94s1e7TwGmBo12hcFo7pYTlLODLyDgr1oYdeT5WtLlr
 JiRhu3deMa0ost/UH+CL2m4=
X-Google-Smtp-Source: ABdhPJw/qtpkUX8J2ufQv5E/USmElRfcGrQQSfQnIFS25ZxrLYmTbD+T5qkceGS46q+4xdmea/1CTg==
X-Received: by 2002:a5d:4d45:: with SMTP id a5mr7872790wru.396.1617258950754; 
 Wed, 31 Mar 2021 23:35:50 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id k4sm11620091wrd.9.2021.03.31.23.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 23:35:50 -0700 (PDT)
Date: Thu, 1 Apr 2021 08:35:48 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v4 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <YGVpxHd/JhYPyaMQ@rocinante>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
 <20210401060054.40788-6-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401060054.40788-6-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_073554_271709_DBEB5DA4 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Hi Greentime,

[...]
> +	/* Wait for wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for wait_ilde state failed!\n");
> +
> +	/* Clear */
> +	writel_relaxed(0, phy_cr_para_wr_en);
> +
> +	/* Wait for ~wait_idle */
> +	ret = readl_poll_timeout(phy_cr_para_ack, val, !val, 10, 5000);
> +	if (ret)
> +		dev_err(dev, "Wait for !wait_ilde state failed!\n");
> +}
[...]
> +static int fu740_pcie_start_link(struct dw_pcie *pci)
> +{
> +	struct device *dev = pci->dev;
> +
> +	/* Start LTSSM. */
> +	fu740_pcie_ltssm_enable(dev);
> +	return 0;
> +}

The typos etc., are still here.  See:

  https://lore.kernel.org/linux-pci/YFQqpojmJyX0l6lx@rocinante/

Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
