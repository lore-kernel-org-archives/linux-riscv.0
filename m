Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C36FC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:48:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F7B206E3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xytLdggw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6evJkKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F7B206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5RNDfK6N7IpgKHn3J8gfPRZAHydSfGTUNoxoxI+b/xE=; b=xytLdggww0GrZ5wAuhJWfHGpW
	RljXrHNVHaznp9SAAIMCx534ou5yQvA2HZzVwKL+SGup5E2gEaOQcxHka9Pu0YRxupIrvN0+3FDul
	1THoMzeSNBUHLgK5cMrvcQok1RIrVBcByXbZmloaz9ZSOqx82fjM6eXuT02AdNWKcnS+nM3OcSIFr
	8P9FVWSmuUmHqTPSb+nczDQJM4pEXDsVRuq3bVWCC3rSX5wWwfXyA1WZLDsszTC0BkS6hK7mJuVEe
	DxcTWmwnleMI7WJNtuJh/GSfdTslW9j/Kry7mCo9P/MM9lhsaPRuydvGEeXTqaWTd5bxWsYb1d1rw
	j+HXn1inQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8Su-0007pv-I7; Mon, 09 Nov 2020 14:48:16 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8Sr-0007oi-8o
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:48:14 +0000
Received: by mail-lf1-x142.google.com with SMTP id l2so12811444lfk.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K0FA6hn3mgfs3nr4Tq0aLjhCMC7Ar/moVNi5BoLwQZ0=;
 b=l6evJkKbqsoNee9rn/v9Uq+TWjJuWeQ6uKAIo58ktqGngWVJhFv2/I+GhDxG2BciPg
 WxgmObUCndcHUXQPIyJTC9bvoaWIgljVw4chV42s4idasbBz7QUcNcKejlio7Q6hbbiS
 3bwMsM1ZkxLJ5t2e56/m2a3zjtix5Wzp16UrqPsvTrIZC6aj9+OymGA2DnApkl4kzTwE
 jG183liWmwY8GRRmf/wIHUugf7QyBbXNTOBkXzL7gUFMLlbBKOr8+//182rj0eFTNqMQ
 3wgjQ1g7h9DiXPEQ3tAOlZ/hWbvtyMS9ZnXrisDeih6aHBWXLbN7a0wjZuLhm6Omdraa
 1Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0FA6hn3mgfs3nr4Tq0aLjhCMC7Ar/moVNi5BoLwQZ0=;
 b=YL5CHcWwODGx4P2ItYiSAwufOXnBKsAjDQ67M4k52/4ebBjFfaQf93IhzHOBWZsRRQ
 i8BILT82VTa3tv0I/3rHNR7fuxGGxXTbyCl57HPmOWaV4VV/TjUfCVdSsglrtwZEp9zd
 4LKQBuRY8bGZxp181eAexyqNSBja4IgmHWHdCp6T3iSwAVlv1C373w5s2J0RCmlUMG/p
 lZL7ntipe0kNVOvI0InRYLgjEYOgMlWmxGEl2//NFrrgIyxgyKHVFILbB6MDEMo8nirb
 9IwiL28w5KukXcb3vz7ZGQl3l87uhAa4yQCApP5g8WIx9+XYZoZ1quLORlfTS5ut4Ed5
 n+Ew==
X-Gm-Message-State: AOAM533JNKAl1R9DOVSWz+nDsRZy4iv10V5FmgfRxAMByUbe82sBWaFM
 cXcjAvPwMaobc8LgdkxIkRA=
X-Google-Smtp-Source: ABdhPJwAYSC7luYDcL7xMZ5Pf3F7g3S4iKqCFXZDtrfHDwHahR6oW6F/q1A+lv8u2Laa/2TruqAzRw==
X-Received: by 2002:a19:7b06:: with SMTP id w6mr6263479lfc.260.1604933291552; 
 Mon, 09 Nov 2020 06:48:11 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id t22sm2200248ljh.89.2020.11.09.06.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 06:48:10 -0800 (PST)
Date: Mon, 9 Nov 2020 17:48:08 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Mark Brown <broonie@kernel.org>, Sean Anderson <seanga2@gmail.com>,
 Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109144808.mvttq2f6st7xd7sm@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109141422.GD6380@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_094813_328969_03DF5355 
X-CRM114-Status: GOOD (  26.26  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:
> On Mon, Nov 09, 2020 at 08:47:10AM -0500, Sean Anderson wrote:
> > On 11/9/20 8:29 AM, Mark Brown wrote:
> 
> > > In this case it also looks like the controller hardware requires
> > > transmit data and therefore should be setting SPI_MUST_TX and just
> > > removing the in driver default anyway, though that will have no effect
> > > one way or anther on the issue you're seeing.
> 

> > There is a recieve-only mode, but it is not used by this driver. Perhaps
> > it should be.
> 
> I'd expect it'd perform better, especially on systems that are
> apparently struggling for CPU bandwidth like yours seems to.

Well, it might seem a good idea to use that mode, but there are multiple problems
you may get in implementing it.

First of all the Receive-only mode is having a limited number bytes to receive
at once. It's just 64KB. So in order to implement it you'd need to split the
bigger transfers up, and feed the DMA engine with smaller chunks one-by-one.

Secondly the Receive-only mode will make the DW SSI controller to constantly receive
the data from the SPI bus and to put it into the Rx FIFO. So your DMA engine will
have to keep up with extracting the data from there on time, otherwise you'll
end up with Rx FIFO overflow error eventually. The problem will be actual for the
DMA engines/system buses, which are slower than the SPI bus speed, second for the
DMA engines with no hardware accelerated LLP traversal support (like on our DWC DMA
controller). The second problem can be also fixed by splitting the transfers up as
it has been already implemented in the spi-dw-dma.c. But the first problem can't be
fixed, but just workarounded by limiting the SPI bus frequency so the DMA engine
would keep up with incoming data traffic.

-Sergey

> 
> > > Please also try to avoid the use of master/slave terminology where
> > > reasonable, controller and device tend to work for SPI (though MOSI/MISO
> > > are going to be harder to shift).
> 
> > Here I use it to draw distinction between the SPI master and the SPI
> > slave, which are both devices in different contexts. 
> 
> If you find the use of device to refer to the device being controlled
> confusing consider also using something like client device instead,
> there's a number of ways to do it (there's a list in Documentation IIRC).



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
