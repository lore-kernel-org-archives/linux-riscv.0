Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87848C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 15:58:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3351360FF1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 15:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3351360FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wr14zRv0Qjo8zEtTQ6qvBTtIDx7Mqd8RFw0ReaQLJ4I=; b=YHmWqhlFKeHj3ugY5al54wimA
	rVUo9oBoPcl5kMPhuOlEAeYOVS1Vxte2xJm2rYdxU4HU5xt9rkeZ33QBB6WJjgBpcAsVXAKUIduGx
	iaSuqICV4Na3dM/r8Ek4+NJEJnqFgUVaiKq5eq3jKc8vKsm4i/HlQPj6deeARNiiPtzygHO+rdpKH
	vwcdw64xmvyk/CyZsMXpOTPbjcpDwlGpdZJ4t8lt3Mxm2CxyQF8OcrJ7u94MPbNagIDb8z6ssrULg
	3RcX6Z7gKQtvRkxRRlgC3jZ6yznkNtwwDd/oLaos/eMZoKSMG7uVOexqpN4PHwqFzWnRSDoHwUI3m
	y4Y6jszNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUX38-008YSr-Uc; Thu, 08 Apr 2021 15:58:31 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUX35-008YPq-1W
 for linux-riscv@lists.infradead.org; Thu, 08 Apr 2021 15:58:28 +0000
Received: by mail-oo1-f44.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so623399ook.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Apr 2021 08:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6J4L/TsHJ2gKS1KfT1jfs3S232wn3ZqOeaVbpNbMR50=;
 b=CuDfdZg6ml7cNuPJ1EpRY2ZgIzjleysE4xB+ZRXDyAbTK24x4VmjkKNhV4v6QD7zRr
 jh7+1uDcW06ukJN9KAcMYBh4uyfzPAAkNrEbf80d4BUYhYu1Kn1pcNbsBfycBo97Mnrm
 a4k5PWY1VQ19HNKXqcwbtEAAxqqLde/sWcqskjTwB69D39RiCT+uJnjIkJf8GxbX9DU2
 8vpMoRbbNjGiM1ykkCTlJnmW0qaZO2SHVWCQtbYdtJ5gowkUAaFX1EXrf8V1yZDxp3M5
 I3Xh0xLXX3M1KegTr+Ti5fqa5tJPHl2oRwbGeJXp6ZpJth4LI5Oj+rJ6Iq4eW//e9lst
 OCww==
X-Gm-Message-State: AOAM532vmMivKgN9WaDn+Wjzi4pFjdKg7sVPPWppw8KFgc42Kz5SCNBw
 iTQqZoCqPgHhHHn2jUjlXA==
X-Google-Smtp-Source: ABdhPJwe1NgTXpk1jXSjJcDpXkDclx6OHy852pAAAlbNj1hDALIwQ1pjKNO6ghh860jhdWIrEsJCQQ==
X-Received: by 2002:a4a:bd1a:: with SMTP id n26mr7989991oop.45.1617897505861; 
 Thu, 08 Apr 2021 08:58:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 10sm6179615otq.10.2021.04.08.08.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 08:58:25 -0700 (PDT)
Received: (nullmailer pid 1552624 invoked by uid 1000);
 Thu, 08 Apr 2021 15:58:23 -0000
Date: Thu, 8 Apr 2021 10:58:23 -0500
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: lorenzo.pieralisi@arm.com, hes@sifive.com, zong.li@sifive.com,
 jh80.chung@samsung.com, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 linux-pci@vger.kernel.org, helgaas@kernel.org, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, paul.walmsley@sifive.com,
 linux-clk@vger.kernel.org, alex.dewar90@gmail.com, p.zabel@pengutronix.de,
 erik.danie@sifive.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, vidyas@nvidia.com,
 sboyd@kernel.org, bhelgaas@google.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Message-ID: <20210408155823.GA1520096@robh.at.kernel.org>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210406092634.50465-5-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406092634.50465-5-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_165827_159985_A8DC3315 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, 06 Apr 2021 17:26:32 +0800, Greentime Hu wrote:
> Add PCIe host controller DT bindings of SiFive FU740.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  .../bindings/pci/sifive,fu740-pcie.yaml       | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
