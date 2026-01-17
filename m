Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C673C9830D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 00:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSXaUTUCQ0SM0GV5ARcrb51I7wsipkz8OmPU05MvDHw=; b=zj6I84D50GLdL5
	uv4ev+G+pb7RSYo6EdFcU8fjeQepUGr1Da/deZU67rVnP05BsDBSd/fFDjVqJfKVDSiDT4V8ykE66
	K3BmE1o6XqOLiPTeO7IjhaMWurh4OR6Y9AvSoq11TxRwe4pjDvkUZj4esX5yvAIJ7XpTc2R/3RqqF
	2fCjFPRzpdRReI4qc3XcvlLQKzn8cdLPkUiswsu3UIkY2kuv151/MzpnFIgmenD30ia8GBLkI3/pR
	QSB9Is/UkZrmpYTeNZifbqpjqqSEJa29JjvMwxLDSCnNe8oPvxhF2ogHrWMj3UCo4ycN0Qo/aWTnu
	31HWm8WsamEPOjcumRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguDb-0000000F3RO-1NWD;
	Sat, 17 Jan 2026 00:31:07 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguDY-0000000F3Qw-1DMt
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 00:31:05 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12331482b8fso1211413c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 16:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609863; x=1769214663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5JNJOduP9VrN/mhp5Hk2Svxk9TX1DeMUnmLosBKrvU=;
        b=TiFLwy2Z5YyccyBEgK9P4RD/nvoRISp+4/VBFxBjnXCcoZRd99AnirkBv1ahmkradA
         C8qIfoDjmToKsm126sx7X0HD3JjYsaKR71awzXeTzhAhx7eZId3K3YypLMA/DijIwGtq
         zREDNOhpPhaqWaWQtjD/AOOZbXI8gQK/Q+O+0fRR4vc1KVVMRxFEduAXXSi0DKMqbgV1
         rj99yt/AP1Nq8XaAl3VIx7z82M+4IetcfbaToiBO3GoJotxlw48jpCIJXOoMqamZITzn
         DlIDKwmLtGFkrtH8/I4ET0ugN/thWEpD909DAacOp/Qbm8bLHbp8TIVcpX25XUFvLbKT
         iExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609863; x=1769214663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5JNJOduP9VrN/mhp5Hk2Svxk9TX1DeMUnmLosBKrvU=;
        b=eiXJC9JDqbQzP9jLBxNHl4d4HqPIFRPaCsaGWyvVrTVPGlLuVZsU0SQF1DmVaIv2Om
         Ru8HfQiwJPObwUfGNt0UfXREwzr07LIecBPwNJEpE2XsqJpQI+Mr6+V7FCTCU8UtEqZv
         IXjp+BQMkVuc/HBX13VFe+4hAAjQl3gwuPceOKsdXdzZfG863Zau2YMdzL7yKXLFkYkL
         d+dDHxeE5smEBh1nt26glxvzN+WSx5c7ePezdynHXp3gQaEIkEILcV/VdhtncBKqWOvA
         hVoivpQpl417mLxkh0KBNb0+Lf05ObLLUmciWiq/E3v+uNhytTfeIs1dvQehVlQ8b5eg
         I5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ur3VZdhvq4pROFN/LmqYpDW6IbvKNREIHoZkCSaJr7oQx4gZKtjPuC0203LkZqpj7jy/NiwJemzOqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjls4rAFKMWqc7Yg9PFiQ3jMgTETz+/KPmYSEqiong1FSrctXH
	WDHoVGGOijOTmZjid6g5PSoOYYgI3W4rWJoBgCu6wMcUWJHuSajLaOGZ
X-Gm-Gg: AY/fxX5gE9ZN77tWrxXFcwI/cwoDOOj6LRg4Sq0GOhm7nSB6+sDqqck3DHGLGCYQck1
	Wm/53lYOWOjCTkY5mnYMMZSneVSutOX+flhERBSf7e2snWzBpAzWL7Yi3icXK/OfJQYepjnsxvX
	MgrEUbITZseDcUI7ndqG8wFnnGhAAwu9jheAUhHA5q8HBR02hH9SD7MDiWeOhi/T6Copc4WK9wf
	fnoK7zpFOg516cLaNipgfvziXlZTJwoe0nhEbOqzyqxRj1JvU5TxjICUXRdnulGBFuWauiZzbMr
	45OW1oRUrLY2VHyWRpJWATG+RjmzXDpoNgjudMUo+6SRJR8rQoSPFvUjMTtogWCGA9GQFncWbNG
	Fdf48NIrj9zC18rjSi5zp900qcm7eufRNY4kyfpjJ0YihX7CG2EtTDLQ/DMWX5hkMqFUChxrEU2
	QWIitfTixNJA==
X-Received: by 2002:a05:7300:ed0f:b0:2ae:5245:d4f6 with SMTP id 5a478bee46e88-2b6b3f1c8f1mr4513348eec.16.1768609863057;
        Fri, 16 Jan 2026 16:31:03 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a7bsm3938806eec.19.2026.01.16.16.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:31:02 -0800 (PST)
Date: Sat, 17 Jan 2026 08:30:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Frank Li <Frank.li@nxp.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
	"Anton D . Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B
 DMA
Message-ID: <aWrYMHdpSs4_kRCs@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <20251214224601.598358-3-inochiama@gmail.com>
 <aWpdEKVBjbq7Lrqv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWpdEKVBjbq7Lrqv@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_163104_332954_C55C68C6 
X-CRM114-Status: GOOD (  26.82  )
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

On Fri, Jan 16, 2026 at 10:45:20AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 06:45:59AM +0800, Inochi Amaoto wrote:
> > As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> > the SoC provides a dma multiplexer to reuse the DMA channel. However,
> > the dma multiplexer also controls the DMA interrupt multiplexer, which
> > means that the dma multiplexer needs to know the channel number.
> >
> > Allow the driver to use DMA phandle args as the channel number, so the
> > DMA multiplexer can route the DMA interrupt correctly.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
> >  2 files changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index b23536645ff7..829aa6c05b5c 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -7,6 +7,7 @@
> >   * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >   */
> >
> > +#include "linux/stddef.h"
> >  #include <linux/bitops.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -50,6 +51,7 @@
> >  #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
> >  #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
> >  #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
> > +#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
> 
> Look like ARG0_AS_CHAN is easy understand
> 

Good name!

> Frank
> >
> >  static inline void
> >  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> > @@ -1360,16 +1362,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
> >  static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
> >  					    struct of_dma *ofdma)
> >  {
> > +	unsigned int handshake = dma_spec->args[0];
> >  	struct dw_axi_dma *dw = ofdma->of_dma_data;
> > -	struct axi_dma_chan *chan;
> > +	struct axi_dma_chan *chan = NULL;
> >  	struct dma_chan *dchan;
> >
> > -	dchan = dma_get_any_slave_channel(&dw->dma);
> > +	if (dw->hdata->use_handshake_as_channel_number) {
> > +		if (handshake >= dw->hdata->nr_channels)
> > +			return NULL;
> > +
> > +		chan = &dw->chan[handshake];
> > +		dchan = dma_get_slave_channel(&chan->vc.chan);
> > +	} else {
> > +		dchan = dma_get_any_slave_channel(&dw->dma);
> > +	}
> > +
> >  	if (!dchan)
> >  		return NULL;
> >
> > -	chan = dchan_to_axi_dma_chan(dchan);
> > -	chan->hw_handshake_num = dma_spec->args[0];
> > +	if (!chan)
> > +		chan = dchan_to_axi_dma_chan(dchan);
> > +	chan->hw_handshake_num = handshake;
> >  	return dchan;
> >  }
> >
> > @@ -1508,6 +1521,8 @@ static int dw_probe(struct platform_device *pdev)
> >  			return ret;
> >  	}
> >
> > +	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
> > +
> >  	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> >
> >  	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> > @@ -1663,6 +1678,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
> >  	}, {
> >  		.compatible = "intel,kmb-axi-dma",
> >  		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
> > +	}, {
> > +		.compatible = "sophgo,cv1800b-axi-dma",
> > +		.data = (void *)AXI_DMA_FLAG_HANDSHAKE_AS_CHAN,
> >  	}, {
> >  		.compatible = "starfive,jh7110-axi-dma",
> >  		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> > index b842e6a8d90d..67cc199e24d1 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> > @@ -34,6 +34,7 @@ struct dw_axi_dma_hcfg {
> >  	bool	reg_map_8_channels;
> >  	bool	restrict_axi_burst_len;
> >  	bool	use_cfg2;
> > +	bool	use_handshake_as_channel_number;
> >  };
> >
> >  struct axi_dma_chan {
> > --
> > 2.52.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
