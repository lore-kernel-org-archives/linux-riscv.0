Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88816D5B149
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn2mhO/x72lGMJiXpDrTXVb5boA074bgTMnHsaYzmpo=; b=0j7SbW5FJLP+d4
	YcuxBNPSY6Q9M14czlBX7BE5goiFRfykMjIZJTWpiFJcMRs28vkJxQeX0tjhM52mjTtktTDgCJDJZ
	rh8jIYsMWOc2qg8MevMdFUCV3VbUMxHjP1umN6IW+ZoMZsJvJ+vkNKZjoOaQ6/YYZR+6YBN+FUHXC
	89oSvIpHesgqGA/FlLwXRGHE9FKKaJavBADAnCxb0M6d31xRQefMhQ+KhOTNvKh+tO+GHi3x+BecP
	XU9M6sh6YFSfziiLYVASmgr9eBMHvU/GMcRu9XvZ/5baGYsjtiD5Zbhr6Hr1cQ8TtNL+0jIaGcG1J
	xFxO0nXRUjrTfhHlMirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUMqi-00000001aSJ-2UkI;
	Sat, 13 Dec 2025 10:27:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUMqf-00000001aRy-1Dtx
	for linux-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 10:27:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a07fac8aa1so9417245ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 Dec 2025 02:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765621656; x=1766226456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZe6fXEstv7pAYGHzZssYL65WuRCRc7rX2Oo6ReALjM=;
        b=ROa9HCCl5QW880ynP7PjUzYKyAIKkPnGEWodk5LH1yrWOPicAxcb3RNo78pJY35IYq
         3o0oHS5mtIP5k+K2J5tUW2Ajo3uHqetxZz9QLMtSABsZJqC6YEXAN3zUz43p2n7ngkL6
         UYweVGDxNxbo8eBFXTuui69vP3mxIlnPFJYdpHNJeSlqTFKs4az4Sn6f6OY55w4Y99O3
         MSwBYgNCqXMcpXUwpkAvHWWmMWUFvuOg4QvTRT82vfNlSJ3vfN5eiriCorsYxe6NkINp
         8b/uI3V8pE7RdWMFDCE2kU9BznBjyvNOTUDzr2gwCq5bIOGq5GmaFdKT0F83HSZgf2dL
         M8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765621656; x=1766226456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZe6fXEstv7pAYGHzZssYL65WuRCRc7rX2Oo6ReALjM=;
        b=diATPVPVwSwnPrXsa5dm5Gmtx8dbf5aWbkeLV4flznwgIs4reaLXDzQ7fGS5FtsN+V
         tRP3DIWXof1BXSTC/6bFJpu/9GQB0CZ2bByqKi3ktxvzHy8vQh0DDG/wwBiJ06/gblSg
         1LeiHe+EEtkypjKTscuDUyUf3DHE2/ikrvrtZEa4j2Kx60ns72qnpE9ntnIC6X570xZ4
         gEMDcZqH40+9mYA8mOUfxyN0FmfqkywTD9p5fhBdGx1YxZNCpMRDWZlgMq5eGQd+VDM+
         zbaiIPiNpzAEWWNHiXRemY1UkswavrEa8xzDoMlvrX5/+YyvVGQSPaRr1oUw/po91PBn
         blyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI2FCysZSB/SeCP1XqrZZw60trMU+9/IyJlZgG98vDWujzgUSe6lJqDIRq9wSOjv3A/Ni4wSwf21VKDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4yuSeOywprnGAleFL7qG5pH00/UvsbYUtMnv1KUhSXKF091y/
	dJSmi4tc5ojSqgxp7ZbR8XbB3mBwXOSM8pwwJ89TmkiObl7xNRSomn5x
X-Gm-Gg: AY/fxX7jlch/bMGp0tKnQ7ZIbGAblENE4PrsZUDw/HWcIo5CzCjD+oMfL8wFvhCIWtD
	cJZUVvbL+NszcnLKpb3NhYez+MaKDNgUR7izLZjrgQpCJuc9FqE8M7MCL8WuE1OkGYereTDvgGu
	KCG0CUs9dCmQeFQ9YLhTGKsNlFGJNiO4okJQP9//69mCtI4607xwc08Z+nnKw2/TiuXAm2XPCsQ
	1G54giLu86Xd3WV0bO4SUud/4Tafm4DmKRjX0yuSfFyCXOc23YyWVCUufCzV03vnGsRfydFicJ9
	oc7muTZP3kaH1KcImY0BmbekvjKWvmf4jTwMKoHWdQ6IffaB0afmXmwJJ/qSrGdzjg6zcWEmNiQ
	bQsA7Pj/p85vBJB4GYlkFUxhz+GN9nXhbVbgLIih2XIX7dH5j1tXQONNz8JmjVg4ldgt32JOXoU
	YM+OGwny7XBA==
X-Google-Smtp-Source: AGHT+IEgdWNaLErL+Bv/4TEGb6my3L3COg4e3V2Q69toNrJl2ns4dPdMhDJIDV+5TWNQeiqW0B6fPQ==
X-Received: by 2002:a05:7023:a8e:b0:11b:c0db:a5ea with SMTP id a92af1059eb24-11f34c4ef0cmr3404454c88.26.1765621655966;
        Sat, 13 Dec 2025 02:27:35 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm26725752c88.12.2025.12.13.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:27:35 -0800 (PST)
Date: Sat, 13 Dec 2025 18:26:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Samuel Holland <samuel.holland@sifive.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>
Subject: Re: [PATCH 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Message-ID: <aT0_KFNqDraRodyG@inochi.infowork>
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-3-inochiama@gmail.com>
 <8a3d3db6-6614-42f7-a271-e6188391daf6@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a3d3db6-6614-42f7-a271-e6188391daf6@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_022737_358384_9696901F 
X-CRM114-Status: GOOD (  27.89  )
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

On Sat, Dec 13, 2025 at 04:55:06PM +0900, Samuel Holland wrote:
> Hi Inochi,
> 
> On 2025-12-12 11:05 AM, Inochi Amaoto wrote:
> > As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> > the SoC provides a dma multiplexer to reuse the DMA channel. However,
> > the dma multiplexer also controlls the DMA interrupt multiplexer, which
> 
> typo: controls
> 

Thanks.

> > means that the dma multiplexer needs to know the channel number.
> > 
> > Allow the driver to use DMA phandle args as the channel number, so the
> > DMA multiplexer can route the DMA interrupt correctly.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
> >  2 files changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index b23536645ff7..62bf0d0dc354 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -50,6 +50,7 @@
> >  #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
> >  #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
> >  #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
> > +#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
> > 
> >  static inline void
> >  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> > @@ -1361,15 +1362,26 @@ static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
> >  					    struct of_dma *ofdma)
> >  {
> >  	struct dw_axi_dma *dw = ofdma->of_dma_data;
> > +	unsigned int handshake = dma_spec->args[0];
> >  	struct axi_dma_chan *chan;
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
> 
> When use_handshake_as_channel_number is false, chan is uninitialized here.
> 
> Regards,
> Samuel
> 

Thanks, I also noticed this, will fixed in the V2.

Regards,
Inochi

> > +		chan = dchan_to_axi_dma_chan(dchan);
> > +	chan->hw_handshake_num = handshake;
> >  	return dchan;
> >  }
> > 
> > @@ -1508,6 +1520,8 @@ static int dw_probe(struct platform_device *pdev)
> >  			return ret;
> >  	}
> > 
> > +	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
> > +
> >  	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> > 
> >  	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> > @@ -1663,6 +1677,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
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
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
