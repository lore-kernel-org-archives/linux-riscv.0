Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D99C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 17:57:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B3420665
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 17:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXD/eP85";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNK0dlAG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B3420665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HwjzaPtJZMnukOJG3VyBAD9wVOv2Lqg2YUAnqZxNk/Y=; b=JXD/eP85zAhHYdr8qOr2cK82g
	gi1DkdXqYSpSdK0b+j0l9VRKc+m7mlgt4qhCQSJWO6ZVPjetBgZwvlFjFyazzQMsaB/2o+0ifJoLC
	C0KiEwai1M0cFqONB9l+ItRvvC+PXUxfMiAAHjsHmPc3Gg0O1tJVoeWPEBH5L0roVamGNxnQhc19U
	tw5QfEr3p1b1aK/mRaeh1XNa8jmo7XvoABdqd101c2274QXf3Kkj1Beaaxkv3VwN0tHWokN5P92Yd
	Mw8x06IdCUOEMvDDzUJD+s5a3XrP39Y6kWHHTqzFp6G/62zg8Ns8d/UthTbxBJoc2TGVsE8Q43oHG
	fIY4UP27g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBPe-000301-4G; Mon, 09 Nov 2020 17:57:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBPb-0002zM-Gv
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 17:57:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id y25so10553933lja.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TDdC4VBGfaC0YPU2cbDOK4oEgDaGnWxSotX0J+aYafA=;
 b=tNK0dlAGukcobevD3Ui+HanJ5riK4b1RuGctsi5HUC4wHixUwR1xO8UhDLrhZQrdTY
 /KLcXfNq1bA767lZyiQb6FEtsW2ZhsbJ5SzmVA3x0xPNagUVVQok9UHiyCEGW6iVget6
 l4D2GKlaE1wkwSRVG3AK0D3nY8cvReQ9uQP+rpl3FkJF3m7fovsnpTqkYAYud4C65C4b
 zMJnuZZPzQb+XDbUgja0PPyr8nHS7MFHvQO7OZX1E8cRZoTVCgfMCIvN1a4XbsI6Zh8a
 +ERtWl41HCUZcubdLhor/DRHOvFD2k3d3TMKKKX7XUvhbQcYkdH3OHLk6oHCsIdgJ4lk
 d31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TDdC4VBGfaC0YPU2cbDOK4oEgDaGnWxSotX0J+aYafA=;
 b=r3kfZ9LePCWF/50tGjhwDOumIR8BkonUYZ4I/mDWJxWV+sty3FDTav1887+xBpR19N
 aBWb3kb59OdWfHIMjfJrqife4xeVKokA5YtIsC0fWtYNd2o6OM6O3GlQHPOutgXGnXI1
 xVl+0dZtup1VrqXyYPENy2qmE9VW/gqaQhg4YxiW15SNi8qR99bvFmzF9XCJ9NnjcdqC
 ahByDRXcfsiHyRJg21qtw4XGpo8X88yInUusF1h3w/Tj43hApbkMsXaush+2Xu8kCKts
 G3B5FRn7/4rh+YispB1+HpcYleShfHsd9/YgRDsa9HX3KW8u/ZG5zkwGOR0U+w1zFWRS
 WZYg==
X-Gm-Message-State: AOAM532F7EZVX0Mhyz9cdqSUWChbxrunLRjxnL/0NfqpVrGDAQXUUo/y
 OaELVMcv0Se0WQmXhwQ29PI=
X-Google-Smtp-Source: ABdhPJwvCfO0zF+eiVJC7NsRyveQflGTHzieevzbazcb7Hmkk2IwVNnSGrnYLDnE/vzo823wANymKA==
X-Received: by 2002:a2e:8e79:: with SMTP id t25mr2425977ljk.133.1604944621826; 
 Mon, 09 Nov 2020 09:57:01 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id w18sm1813942lfc.5.2020.11.09.09.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 09:57:01 -0800 (PST)
Date: Mon, 9 Nov 2020 20:56:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
Message-ID: <20201109175659.hqr6qq5qwk4sd775@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
 <CAHp75VeXT8CMumY2fif6eBX0GRWvOV_47rETTbL5Yud+zBV0XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VeXT8CMumY2fif6eBX0GRWvOV_47rETTbL5Yud+zBV0XA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_125703_618275_CE062288 
X-CRM114-Status: GOOD (  26.19  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Andy,

On Mon, Nov 09, 2020 at 04:36:51PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 9, 2020 at 4:25 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > Hello Damien,
> > Thanks for your patches. My comments are below.
> >
> > On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
> > > Synopsis DesignWare DW_apb_ssi version 4 defines a 32-bit layout of
> > > the ctrlr0 register for SPI masters. The layout of ctrlr0 is:
> > >
> > > |   31 .. 23  | 22 .. 21 | 20 .. 16 |
> > > | other stuff | spi_frf  |  dfs_32  |
> > >
> > > |   15 .. 10  | 9 .. 8 | 7 .. 6 | 5 .. 4 | 3 .. 0 |
> > > | other stuff |  tmod  |  mode  |  frf   |  dfs   |
> > >
> >
> > > Th main difference of this layout with the 16-bits version is the data
> >     ^
> >     |
> >     e
> >
> > > frame format field which resides in bits 16..20 instead of bits 3..0.
> > >
> >
> > Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
> > manual for the 4.0x version of the core, but according to this patch:
> > https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
> > it has been ok to use the lowest four bits for DFS setting. Is the commit
> > message misleading there?
> 

> 20:16 DFS_32
> Data Frame Size in 32-bit transfer size mode. Used to select
> the data frame size in 32-bit transfer mode. These bits are
> only valid when SSI_MAX_XFER_SIZE is configured to 32.
> When the data frame size is programmed to be less than 32
> bits, the receive data are automatically right-justified by the
> receive logic, with the upper bits of the receive FIFO zero-
> padded.
> 
> 3:0 DFS
> Data Frame Size.
> This register field is only valid when SSI_MAX_XFER_SIZE
> is configured to 16. If SSI_MAX_XFER_SIZE is configured to
> 32, then writing to this field will not have any effect.
> 
> As far as I can tell it's an extension to the existing one (which one
> in use depends on the SSI configuration).
> 
> 
> The comment you are referring to is about DW_ssi v1.x (vs. DW_apb_ssi v4.x).

Ok. Thanks for clarifying this. Now I see the way it's working.

-Sergey

> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
