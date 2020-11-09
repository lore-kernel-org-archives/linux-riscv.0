Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BE6C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98156206D8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IrM3+y0P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8lkBhEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98156206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LRxAhHlSbIAWIdLofnTMWOvRl2kVg0GRk4GG5ETre/E=; b=IrM3+y0Ppsm7O7+AA/Ma72bie
	JkM2AlmpFskwAWVEb7nIw0dujA2LQzPPwYOJb/f62SA6XFEU43o358snQAv+U738GFVUPOTKoI1Oz
	XX2IWnhsxyqSOw1nIm/201ux3eLirSGc0PjX2wy47Fs2enoX2nh/snfDxOqgvLRBW0irqTzpnqOGZ
	e1SgUD3t2P9Vo27BGVS/rZxknDRSWYWIX4NOTKOKGHMYX83vYD0TM2/CCIuNc7vggyENMh5ic9yyx
	fqXLF+q+j4mjVgABgU23s5UpGgunOZKFCDwTuQlMGh/Sb/Gv+HuQLBfgSogbsKpNfblfgUcYzGHfF
	betG2cvXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8H9-0005d1-Hz; Mon, 09 Nov 2020 14:36:07 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8H6-0005bY-Nw
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:36:05 +0000
Received: by mail-pg1-x544.google.com with SMTP id x13so7302127pgp.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xilNWeTeSex4g4HDHalLR+J43P0h5RyAhWrk/nvF07Q=;
 b=J8lkBhEa8lUdD57OmUPSRsc6XdBOXWf9otsprjZJgrNXX/rtXIY1xlJNBzxgNxADgZ
 KeYdaMBEawlOXDQEyLQpByo3pCD1ouyoWJEMykJVHUeIve8WBerVveYZF0FIXv5UNNkE
 irsMLx2qvu+nMMFkyjNlf+TBXwCliLAaR4s+DcfiQzBY3hMADgKpB24+WRJmziJ+PqAr
 BJV+gbund7ykyY7ZZ27YX1OYGIowgA6+cl2UhwIXYZ9mK1W14flVV6zyxzHbXy5fqO8P
 o4wHWJUcljoscxY2Rj9ad/2YBbVOQBDAKpkFasRt2L61EDvWnFsavoGMnMfsis83Y59L
 85Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xilNWeTeSex4g4HDHalLR+J43P0h5RyAhWrk/nvF07Q=;
 b=ihFMeMmOdoHs90+2bt7dTUo2jAHDRanBXJDbPz+RidxeJg6hrWe5zpS2kPTIh0E+pZ
 2yEULzztmUl3uuTsHR2PoreA4PtEzwgFPISO7Es21rEVSX6GNdmEDsLmE5W00BoT212d
 jUlTQohfP1i5xFxr7HmlUq2UQdt161JjyCCXHwqs3YvPcDguEtZg3dK3oj82KuGlJkfe
 mSDM5eB6AWGWy2XXVYoEOxPXIVtIFteeB8OROHF8zaxr9yBw5CBavZeP+KQRgeOMV7jS
 Wz9QcW3Havwd2fgMOrWf7WoJrh7Q2bN1GH7iYi0QHsrSdcTwhZ0j1fidU1CJcgCIPiUm
 koqA==
X-Gm-Message-State: AOAM533GIfIdTBuyiVFKJXYrAbu2h/VMW1Pu39g2uz9rG1zz3Lwt/zrW
 yO/805NYVSgMqb4MAFs1Jc2O0RJtboSNP5t0tvk=
X-Google-Smtp-Source: ABdhPJwzwK9MU3KU7H7nhMnajS0MWTHr1ZqqSAX4On6SXXYvXxfNoTYFAoquD737Dk20mtKRVd4egDZF4KTi8c3SJxc=
X-Received: by 2002:a63:4511:: with SMTP id s17mr13056707pga.4.1604932562378; 
 Mon, 09 Nov 2020 06:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
In-Reply-To: <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2020 16:36:51 +0200
Message-ID: <CAHp75VeXT8CMumY2fif6eBX0GRWvOV_47rETTbL5Yud+zBV0XA@mail.gmail.com>
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
To: Serge Semin <fancer.lancer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_093604_840505_40B9B818 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Nov 9, 2020 at 4:25 PM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> Hello Damien,
> Thanks for your patches. My comments are below.
>
> On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
> > Synopsis DesignWare DW_apb_ssi version 4 defines a 32-bit layout of
> > the ctrlr0 register for SPI masters. The layout of ctrlr0 is:
> >
> > |   31 .. 23  | 22 .. 21 | 20 .. 16 |
> > | other stuff | spi_frf  |  dfs_32  |
> >
> > |   15 .. 10  | 9 .. 8 | 7 .. 6 | 5 .. 4 | 3 .. 0 |
> > | other stuff |  tmod  |  mode  |  frf   |  dfs   |
> >
>
> > Th main difference of this layout with the 16-bits version is the data
>     ^
>     |
>     e
>
> > frame format field which resides in bits 16..20 instead of bits 3..0.
> >
>
> Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
> manual for the 4.0x version of the core, but according to this patch:
> https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
> it has been ok to use the lowest four bits for DFS setting. Is the commit
> message misleading there?

20:16 DFS_32
Data Frame Size in 32-bit transfer size mode. Used to select
the data frame size in 32-bit transfer mode. These bits are
only valid when SSI_MAX_XFER_SIZE is configured to 32.
When the data frame size is programmed to be less than 32
bits, the receive data are automatically right-justified by the
receive logic, with the upper bits of the receive FIFO zero-
padded.

3:0 DFS
Data Frame Size.
This register field is only valid when SSI_MAX_XFER_SIZE
is configured to 16. If SSI_MAX_XFER_SIZE is configured to
32, then writing to this field will not have any effect.

As far as I can tell it's an extension to the existing one (which one
in use depends on the SSI configuration).


The comment you are referring to is about DW_ssi v1.x (vs. DW_apb_ssi v4.x).


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
