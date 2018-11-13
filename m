Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A1EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 19:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40068216FD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 19:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWVfv3U0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DpwPsqTE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40068216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OjLRWoKWHfTYl+6GkPri3V+Clu21c1Aykx02utcT8A=; b=gWVfv3U0Dz5k8v
	1/EDp5T7dRqVMagfl+gQvx1hO7R+BF3rD7KRsGIEx7TZPiVibAwP2n3xZYRd4pNpLVGJSgR3w9w2G
	BHgnJMdD8qZPdQLB0hi+lHUheIc+sb7kieCvmkA7N50MWLolbFXGwZUzhIsK4v8Gj8veYQHSTjJK3
	QwbGpgaDXxZO+1t2urclL8Y5NndDjDB9kqCp8Nu6sYyy/kd6aueUWXDlOCACuwfsoffG52WQ2ay2X
	bnIGUeaTuhOF0+bcmLM5u0ugzF5C55AB3W/r1yjju2b5iuM/khcNek4JIfi5oq5th5XGN/yaKo1t4
	OKjBKakhhmW06LYOB8kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMegT-00074x-8h; Tue, 13 Nov 2018 19:49:13 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMegS-00074U-1I
 for linux-riscv@bombadil.infradead.org; Tue, 13 Nov 2018 19:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FTYl1YEZsWlo48zpcSGeS0opwdJMNJLCJODJ4Tvr1/E=; b=DpwPsqTEPVeWSYveTiKUHWUSm
 +q4WHPhcRfhgQZdNS/7n1g+opG1rIsOGVD9wFolE0vakX4bxsG3fglpl7ipwQAwzN2EelQCsseBAA
 kl1Y6mcqTPLd4xRvJG52+c/tKnv/x12RJQJOkIdr8xtU0KImX4p2bmSuAw+adBI+3SSvb84RZgGUU
 J3LCcIfBhE1ngtyK4g0lN1ODyJEziYBCneQSrqGaAfNq3M45x7p6iNmxjO08j80hUW00ymgCfULWN
 KTrStnLFa736LeXRIBIYgCAoqhwPvK3eM3x4XUXwlH+nOLrX/8rJvbQTIGP15ws5yS16otV1AbD7X
 viZMMcy7Q==;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMegN-0000Rr-St
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 19:49:10 +0000
Received: by mail-pg1-f193.google.com with SMTP id n10-v6so6169734pgv.10
 for <linux-riscv@lists.infradead.org>; Tue, 13 Nov 2018 11:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTYl1YEZsWlo48zpcSGeS0opwdJMNJLCJODJ4Tvr1/E=;
 b=dmXec06tW6hEaHemI91BaLDnghioSm6J103DxaJaZ1v3zo0IF0E8mBcRsdAapGdTGC
 2zAfqBq4IqFkDVY+XdH3VLpwdzDo9ggGCBcZ0/ytcrGEU+7f5ELNejFKISRHfnLHI2hm
 K2ARNgDIcxPPyBJtMuqJGHM1BAc2cokuGxQjWvJNXb1MSlrBTU9fvzxT6qCLsz+bx3tF
 boM6YgpEwEbrnqm7PVzBg2P9tHBgaPDO0lq1JdorOOrSaig1ADj2tmwWo5XBXRr+9jDa
 xs9CI/kMufQugsroh30KkSJHjEKdqTbjjn0EfGWM4+IcR4xGLj/0vsnWKK0EqrtLD+9W
 r1Xg==
X-Gm-Message-State: AGRZ1gL1ULKGSnvF4MffIaeuwuyDbS8XApVLiO1FJB+kg96tSaH1Fu9/
 Xzb+a3PsZ9cJ/BlrBzM5jjXH77VdvEr95LtIA8zqjA==
X-Google-Smtp-Source: AJdET5fv0h02rVrg3ksvYPdjXrHayvNi6L92+6zAvOEynNaI9fIqUqaIHqPc5ebAXyWjZR3YSE35fw+qMsK3F4ft6Y0=
X-Received: by 2002:a62:de06:: with SMTP id h6-v6mr6554715pfg.36.1542138534634; 
 Tue, 13 Nov 2018 11:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20181112142736.15009-1-kernel@esmil.dk>
 <20181113183527.GG2089@sirena.org.uk>
In-Reply-To: <20181113183527.GG2089@sirena.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 13 Nov 2018 20:48:43 +0100
Message-ID:
 <CANBLGcxF-WgsBVFHf4jGRR+Ox2vz=ewzhwGP1CZX-R5HpDAVBg@mail.gmail.com>
Subject: Re: [RFC PATCH] spi: add driver for the SiFive SPI controller
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_144907_949658_20E571D0 
X-CRM114-Status: GOOD (  34.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113194843.tTRXAgjeryNJGGjsB3O_LmzBMAfIvnGRkHJ8TWKXj3E@z>

Hi Mark,
On Tue, 13 Nov 2018 at 19:35, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Nov 12, 2018 at 03:27:36PM +0100, Emil Renner Berthing wrote:
>
> > I know the discussions about the sifive devicetree compatible
> > strings haven't come to a conclusion, so I'm sending this as
> > an RFC to get some feedback on the rest of the code.
>
> I've not seen any of these discussions or earlier versions of this
> driver so I've no idea what's going on here :(

No, sorry. This has been discussed on linux-riscv for other drivers
like the uart. See my last answer.

> > +Optional properties:
> > +- sifive,fifo-depth          : Depth of hardware queues; defaults to 8
> > +- sifive,max-bits-per-word   : Maximum bits per word; defaults to 8
> > +
>
> If the hardware isn't fixed yet making these enumerable from the
> hardware would be good...

Agreed, but unfortunately this is already in the FU540-C000 chip on
the HiFive Unleashed board sold by SiFive.

> > @@ -0,0 +1,442 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * SiFive SPI controller driver (master mode only)
> > + *
>
> Please make the entire comment a C++ one to make this look more
> intentinal.

Will do.

> > +/* for consistency we need this symbol */
> > +#ifdef REG_FMT
> > +#undef REG_FMT
> > +#endif
>
> We do?  For consistency with what?

Below all the register offsets are defined as
REG_<register name>. This is is a pattern I
copied from other drivers, but here we have a
register called "fmt" - hence REG_FMT.
If you have a better pattern that doesn't clash
with REG_FMT please let me know.

> > +static void sifive_spi_init(struct sifive_spi *spi)
> > +{
>
> > +     /* Set CS/SCK Delays and Inactive Time to defaults */
> > +
> > +     /* Exit specialized memory-mapped SPI flash mode */
>
> ...or not?

Right. Will add that or just delete the comment.

> > +     /* Set frame format */
> > +     cr = FMT_LEN(t->bits_per_word);
> > +     switch (mode) {
> > +     case SPI_NBITS_QUAD:
> > +             cr |= FMT_PROTO_QUAD;
> > +             break;
>
> Some namespacing on the driver #defines would be a bit safer against the
> possibility of collision with future changes in headers.

Right.

> > +static void sifive_spi_wait(struct sifive_spi *spi, u32 bit, int poll)
> > +{
> > +     if (poll) {
> > +             u32 cr;
> > +             do cr = sifive_spi_read(spi, REG_IP);
> > +             while (!(cr & bit));
>
> Please add some braces, indentation or something to make it more clear
> that the read is part of a do/while loop - right now it's not
> immediately obvious that this is correct.

Good point. Will do.

> > +static int sifive_spi_transfer_one(struct spi_master *master,
> > +             struct spi_device *device, struct spi_transfer *t)
> > +{
> > +     struct sifive_spi *spi = spi_master_get_devdata(master);
> > +     int poll = sifive_spi_prep_transfer(spi, device, t);
> > +
> > +     sifive_spi_execute(spi, t, poll);
> > +
>
> Why not just inline the execute function here?  It's the only caller
> AFAICT.

Yeah, it is. Will do.

> > +static void sifive_spi_set_cs(struct spi_device *device, bool is_high)
> > +{
> > +     struct sifive_spi *spi = spi_master_get_devdata(device->master);
> > +
> > +     /* Reverse polarity is handled by SCMR/CPOL. Not inverted CS. */
> > +     if (device->mode & SPI_CS_HIGH)
> > +             is_high = !is_high;
>
> spi_set_cs() will handle CS_HIGH for you.
>
> > +     master->bits_per_word_mask = SPI_BPW_MASK(8);
>
> I thought the device supported other bits per word values?

It does, but the driver doesn't yet. When bits per word is < 8
we need to shift the bits in each byte to be "left-aligned"
(unless SPI_LSB_FIRST is set).

> > +     /* If mmc_spi sees a dma_mask, it starts using dma mapped buffers.
> > +      * Probably it should rely on the SPI core auto mapping instead.
> > +      */
> > +     pdev->dev.dma_mask = NULL;
>
> If this is a problem please fix it in the MMC core, don't bodge it like
> this.

Gotcha. Will remove this.

> > +static const struct of_device_id sifive_spi_of_match[] = {
> > +     { .compatible = "sifive,spi0", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, sifive_spi_of_match);
>
> spi0 is a *weird* compatible name.

Exactly. Hence the discussion about the compatible strings.
Once this discussion comes to a conclusion I'll update this.

Thank you for the review!
/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
