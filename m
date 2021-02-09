Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEDBC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 15:25:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D4F64EB8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 15:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D4F64EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KdyoV8RzWsZf82YaBxFaE/QO7/smZCEaCOe0+eZFDGs=; b=OHnAWyYfj97gyIYYsqOBBTDoa
	fChEu9bhhhyfexu275hV713NnvWmfKwnH8u90K9E820TT3reZRqxY1aXurdqLqhQZ5WGxO4XQjsfr
	GMU1BdHBlURHcr3rktGQAjZJdrvaOhFZA01t/SlSNBJ4E5yDYMwmdq7z7x5SffA9MA4CyNCSLx5wU
	4Gd8Fl7uqU9fJxS2UZxpLUlPYbXeD+TqIgNJ0vNzHuty1CuFJI4oH0ojbUA6DO3w+Ih8pmPMlyFZw
	fYXv18d5AVMWPk74gD9Gc6D4fcFkNeyqUfF8dcdoVlOHEEQFP73Dnus+KPVBsm52iw4z938hUwwk/
	ZA7NbU+QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Usz-00087I-U9; Tue, 09 Feb 2021 15:25:05 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Usx-00086d-48
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 15:25:04 +0000
Received: by mail-ot1-f48.google.com with SMTP id d7so15519923otq.6
 for <linux-riscv@lists.infradead.org>; Tue, 09 Feb 2021 07:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ETOckpqhgtN1CWWOx8jueiJoxzKahbBsQfwx4pm8Tk0=;
 b=nJr4lpaxKBmPRlw/fCN1TAthR4nCu07dCrYcYE7JOatUD+y4vG4HNcAamU2b2EPSxj
 /wf9RRkyzu3+uq5TAc8QPBjEf4eQCsU5j7KHfkVuh2KNnp7P5fI9odJcGIJqVq7/FmB8
 wB1aT+GODIuBbrS0AODfPDivLF46phAAJv30Suz54L+Zysii58PHCIaKT+jtAUL/JVxA
 HJsjLhJbIOx+OJilYM4TLEUoSeL82m1zWU5mPxS8ZGjvsLIgL1h3Yd0aMFc58x9iC7Dw
 gCbNzsul/6EBKqpM0vGSopPnFwv57UGdw1Ol5h5hKkhu7J91f9DzSfE8O92cxmztu2Hf
 TzYg==
X-Gm-Message-State: AOAM533Ovu0S/GfoIZasVQP5jeZNblDSAmi8Z2pCNDFHXnbtCggFWoVM
 sTjN+BdQAAfML1LVOC/x6A==
X-Google-Smtp-Source: ABdhPJxjZbsbC+aYdLyJyL6JGkpXwUv0RmFQEzdoSCQTpuYVZ3NOYcUg9rgaSnpmpAgXY4KX3hPSxA==
X-Received: by 2002:a9d:961:: with SMTP id 88mr15549101otp.183.1612884302008; 
 Tue, 09 Feb 2021 07:25:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e17sm4573577otf.32.2021.02.09.07.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 07:24:59 -0800 (PST)
Received: (nullmailer pid 3785781 invoked by uid 1000);
 Tue, 09 Feb 2021 15:24:58 -0000
Date: Tue, 9 Feb 2021 09:24:58 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v18 09/16] riscv: Update Canaan Kendryte K210 device tree
Message-ID: <20210209152458.GA3785724@robh.at.kernel.org>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209123014.165928-10-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_102503_313670_0D7C405B 
X-CRM114-Status: GOOD (  16.17  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Feb 2021 21:30:07 +0900, Damien Le Moal wrote:
> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
> all supported peripherals of the SoC, their clocks and reset lines.
> The device tree file k210.dts is renamed to k210_generic.dts and
> becomes the default value selection of the configuration option
> SOC_CANAAN_K210_DTB_BUILTIN_SOURCE. No device beside the serial console
> is defined by this device tree. This makes this generic device tree
> suitable for use with a builtin initramfs with all known K210 based
> boards.
> 
> These changes result in the K210_CLK_ACLK clock ID to be unused and
> removed from the dt-bindings k210-clk.h header file.
> 
> Most updates to the k210.dtsi file come from Sean Anderson's work on
> U-Boot support for the K210.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/Kconfig.socs                     |   2 +-
>  arch/riscv/boot/dts/canaan/k210.dts         |  23 --
>  arch/riscv/boot/dts/canaan/k210.dtsi        | 395 ++++++++++++++++++--
>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 +++
>  include/dt-bindings/clock/k210-clk.h        |   1 -
>  5 files changed, 414 insertions(+), 53 deletions(-)
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
