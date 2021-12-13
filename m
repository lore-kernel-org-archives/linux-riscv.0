Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oaf8T5Ygmz9DFSIyaGZxfPAjfSqm2CDmaqnyPOHu8cQ=; b=mHJp0H1EeWw5VV
	w8jRZFgaBHGLYtAPhcl707HnyPYaTZjXON3oGULZnB7uGhfDErkM21C0ZrwDy6whmeSAJIH4+gSXM
	af+9hp8jWkSMTyAQrsoJ79C64Zw+2qb+X7NvBIOdmaHXOf+ViXu3BUAwNsR5E/AgBROQ0Yhldikrc
	t36DoY1+W7GJkZ+mQjHrMjPX3PG9fJG6TsAruNL6vZ6jnG2caXxra5PTwPmm8sKuAr9Xcdyn3E+qt
	p24/JFy8IxeFakgvJ+bxmy31yi8sU3qKDMIDqCP0rK2qPZaHFSj5lcc28qQqRyiPmimO43wpYXBUo
	RrQcwUnP2+I3nUl/CJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwemN-007wAz-FM; Mon, 13 Dec 2021 06:25:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwemK-007wAM-SG
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 06:25:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 709B7B80D1F;
 Mon, 13 Dec 2021 06:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3D4C00446;
 Mon, 13 Dec 2021 06:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639376738;
 bh=L1hIT+XO170lUVQIX/7fWBAEJb38HWLLhtx4zVYZW+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2+1gFt+ivU59tiorEA3LrYnK//SIBrOMJRLR/E2h9/uzdUIxeaqOraEmOLNe877H
 Ml2x7VWCKiF20gn+Tmk2XrtQRIIvTXyG8fgCOyTkfjlFgeQLKwgb/+9h6wP5FoY1Ii
 B2TuNC0t47I5nICVPsyr/fiRqL4WYJdoYxu+aJSMIarcdq7Efe+uIUu7EjYr77KiA2
 OlhXjtResjpnIn5Elvyixe/olhE+6mvqxxRrd6XCInsbSXngnCZJoYDhn3FgY0EVGJ
 XkBWZMer5HzqxA5+JOyGydAE4ZVhRIUJdti5LWBuR8ygq05w+VG1gb2NVkl6s87Nb0
 tFGT1yFkYimkQ==
Date: Mon, 13 Dec 2021 11:55:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Heng Sia <jee.heng.sia@intel.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: Document optional
 reset
Message-ID: <YbbnXuvtSwBJoUT2@matsya>
References: <20211125152008.162571-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125152008.162571-1-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_222541_078525_C2D0B2B9 
X-CRM114-Status: UNSURE (   7.96  )
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

On 25-11-21, 16:20, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>     arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: dma-controller@50000000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	    From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> 
> The Synopsys DesignWare AXI DMA Controller on the Canaan K210 SoC
> exposes its reset signal.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
