Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D8C5519F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 18:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AF72222E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 18:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4Baghe0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFo+EIIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AF72222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Krn5gghfGNNjCOsSsCj8HG3gAAo46KFdKUkZq1lDxic=; b=J4Baghe0uGTHjihLWgup3tvl8
	OjDsrk8cE5Z/KtqWWrT9tYZaOeg8VUg+tbm7O7eGHiOzXGtE2OYnn5CifL6e6Y346a1Qr86gRM/AZ
	3wKIeeg4Gkt4aMJAdXa/QHkH9b6DCMa9sdRmcd6wIzHtWUc4tgmNJDKuPcKvK5bisShrI/yBqH0gB
	DbAVrGH9Z2URTyKn4pNNzeVK21xpqWhP93UO0zJK1nU06MTq63ex54W/HZqjtGdGdoRE24KSnZBV0
	s+Yr+7UW/P4zLNtbn3GgPDEA6Orth/z462VBGJ8U9qExGwItUkHNwTpNY7HzD7pFii3D7/5wQzKkG
	Idz7htndQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf5jo-0008Ur-Vg; Tue, 17 Nov 2020 18:29:57 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf5gn-00070p-Mu
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 18:26:57 +0000
Received: by mail-lj1-x244.google.com with SMTP id b17so25367915ljf.12
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 10:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C3dvz/P9TXVMhGJc6R48+GdvqzGzrr3Wp6d2c8ypfZY=;
 b=XFo+EIIgyJM5X336vLyeEXn5zHTTmXB6AynT8DspiNtD7Md9/zqNIRhU0BRWFKUtBc
 tHmg4Iheq3hjZLjhDRcI10j7SenTzgnWNR/VA8E2jnpZXVPKPvCKlQMPxHzuuVsBoPVZ
 IazmdZYQV+XOSBETK/Bu3ZuDjmcUyh+/DcKweFeu3MD4vyv3uRQeNNe4X6oUJj9iTo9M
 u3CrpbO+czImzuihyeD+LnRdLS1gYKgVrSGpq/9f6Y+qQSMbXgIF/ws8ofx1ZcbEg6oM
 no8XvJJUBG1h2gKWFbr9OL5vEnNvF5P1uqf2zXuTtoHIb+WWiiRvxKwEyRu6g//VXKhT
 cccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C3dvz/P9TXVMhGJc6R48+GdvqzGzrr3Wp6d2c8ypfZY=;
 b=rD6mLWm95+zr3UjFbuwvoHLEPQIIQefD8RHCLjrh4OVunPfefNSg5hr/WlXigi9Bqe
 M9u3HmvUJOzTOOZWT8PtuQfDnBgl/GRb5ROy6LDy1Y2dHsLeBb5QfiCEP3+7rj3aLEE9
 Vri7udW+XJs+aS7qCGS8sYiHAY1OWC++4Q/8Y+Cj6mIafC8gNxv+i6CybQhM2rgpXc17
 FvrNGGIiIG0uChBxlUmh6ic+K17ZnncdrdFz0AZGzJusAqHfAmsT1gC+fQxFoE1Zd4XK
 Uf7DEWG+yTlYKA1L0YMaPjUJVffwaeZvh8Lo5U4Nb645GD6jRMf+9frnkIrZjMQon1il
 qA8A==
X-Gm-Message-State: AOAM533eUmRA47lrCjF+y42ki+85P5N78JA855ijzzFG8DZH5GzmTA+o
 zFNCDy2lQjTj53dGC4fX8nA=
X-Google-Smtp-Source: ABdhPJwEI+RE3BFXIfHPfb7lQCv06PMMNu2hirRc4GMdK4vs+jabsPsyRJnMXoAKw4GiORZBtExZmA==
X-Received: by 2002:a2e:8750:: with SMTP id q16mr2251555ljj.53.1605637606517; 
 Tue, 17 Nov 2020 10:26:46 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id r7sm3262287lfm.88.2020.11.17.10.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 10:26:45 -0800 (PST)
Date: Tue, 17 Nov 2020 21:26:42 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Message-ID: <20201117182642.qz3il63x6lcx6owg@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
 <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
 <20201115160146.efxcdjhm7f2nmivo@mobilestation>
 <BL0PR04MB65149D8B62167C11B26E0EA7E7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
 <20201116215505.enelrzxaxb2457a6@mobilestation>
 <ea6a82e27a66600e7d4eb1668282d42dbaabf4b0.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea6a82e27a66600e7d4eb1668282d42dbaabf4b0.camel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_132649_928877_59022B8E 
X-CRM114-Status: GOOD (  66.79  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 02:44:13PM +0000, Damien Le Moal wrote:
> On Tue, 2020-11-17 at 00:55 +0300, Serge Semin wrote:
> > On Mon, Nov 16, 2020 at 07:47:47AM +0000, Damien Le Moal wrote:
> > > On 2020/11/16 1:02, Serge Semin wrote:
> > > > On Fri, Nov 13, 2020 at 09:22:54AM +0000, Damien Le Moal wrote:
> > > > > On Mon, 2020-11-09 at 22:59 +0300, Serge Semin wrote:
> > > > > > On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
> > > > > > > With boards that have slow interrupts context switch, and a fast device
> > > > > > > connected to a spi master, e.g. an SD card through mmc-spi,
> > > > > > 
> > > > > > > using
> > > > > > > dw_spi_poll_transfer() intead of the regular interrupt based
> > > > > > > dw_spi_transfer_handler() function is more efficient and
> > > > > > 
> > > > > > I can believe in that. But the next part seems questionable:
> > > > > > 
> > > > > > > can avoid a lot
> > > > > > > of RX FIFO overflow errors while keeping the device SPI frequency
> > > > > > > reasonnably high (for speed).
> > > > > > 
> > > > > > No matter whether it's an IRQ-based or poll-based transfer, as long as a
> > > > > > client SPI-device is connected with a GPIO-based chip-select (or the
> > > > > > DW APB SSI-controller feature of the automatic chip-select toggling is
> > > > > > fixed), the Rx FIFO should never overrun. It's ensured by the transfer
> > > > > > algorithm design by calculating the rxtx_gap in the dw_writer()
> > > > > > method. If the error still happens then there must be some bug in
> > > > > > the code.
> > > > > > 
> > > > > > It's also strange to hear that the polling-based transfer helps
> > > > > > to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
> > > > > > causes them. Both of those methods are based on the same dw_writer()
> > > > > > and dw_reader() methods. So basically they both should either work
> > > > > > well or cause the errors at same time.
> > > > > > 
> > > > > > So to speak could you more through debug your case?
> > > > > 
> > > > > I did. And I have much better results now. Let me explain:
> > > > 
> > > > > 1) The device tree was setting up the SPI controller using the controller
> > > > > internal chip select, not a GPIO-based chip select. Until now, I could never
> > > > > get the GPIO-based chip select to work. I finally found out why: I simply
> > > > > needed to add the "spi-cs-high" property to the mmc-slot node. With that, the
> > > > > CS gpio is correctly driven active-high instead of the default active-low and
> > > > > the SD card works.
> > > > 
> > > > Yeap, that's the main problem of the standard DW APB SSI controller
> > > > released by Synopsys. Currently SPI-flash'es are the only SPI
> > > > peripheral devices which are capable to work with native DW APB SSI
> > > > chip-selects. I've fixed that for flashes recently by atomizing the
> > > > SPI memory operations (executing them with the local IRQs disabled)
> > > > and performing them on the poll-based basis. Alas the normal
> > > > SPI-transfers still can't be properly executed with native
> > > > chip-selects.
> > > > 
> > > > > 2) With this change using the GPIO-based CS, the patch "spi: dw: Fix driving
> > > > > MOSI low while receiving" became completely unnecessary. The SD card works
> > > > > without it.
> > > > 
> > > > Hm, that's weird. MOSI level has nothing todo with the chip-selects.
> > > > Are you sure the original problem has been connected with the Tx lane
> > > > level? On the other hand are you sure the problem has gone away after
> > > > all?
> > > 
> > > Not sure of anything here :) But removing the patch changing MOSI level did not
> > > prevent the SD card to be scanned & accessed correctly. Before (with native chip
> > > select), the first command would not even complete...
> > > 
> > > > Moreover I've just taken alook at the MMC SPI driver. Turns out it
> > > > has already been fixed to send ones to the MMC port when it's
> > > > required. So If you still experience the MOSI-level problem
> > > > then that fix might have been done incorrect at some extent...
> > > 
> > 
> > > OK. Thanks for the info. I need to rebase on the latest SPI tree then. However,
> > > scripts/get_maintainer.pl does not mention any. Where is that hosted ?
> > 
> > I meant the drivers/mmc/host/mmc_spi.c driver. See the "ones" buffer
> > being used as spi_transfer->tx_buf sometimes there? That's what is
> > supposed to fix the MOSI level problem. So if at some point the MMC
> > SPI driver performs an Rx-only SPI transfer with no ones-buffer
> > specified as the tx_buf one, but the MMC SPI protocol requires for an SD
> > card to receive ones, then the protocol problem will happen.
> > 
> > > 
> > > 
> > > > > Now for testing, I also removed this polling change. Results are these:
> > > > > 1) With the same SPI frequency as before (4MHz), I can run the SD card at about
> > > > > 300 KB/s (read) but I am still seeing some RX FIFO overflow errors. Not a lot,
> > > > > but enough to be annoying, especially on boot as the partition scan sometimes
> > > > > fails because of these errors. In most cases, the block layer retry of failed
> > > > > read/writes cover and no bad errors happen, but the RX FIFO overflow error
> > > > > messages still pop up.
> > > > > 2) Looking into the code further, I realized that RXFLTR is set to half the
> > > > > fifo size minus 1. That sound reasonable, but as that delays interrupt
> > > > > generation until the RX fifo is almost full, I decided to try a value of 0 to
> > > > > get the interrupt as soon as data is available rather than waiting for a chunk.
> > > > > With that, all RX FIFO overflow errors go away, and I could even double the SPI
> > > > > frequency to 8MHz, getting a solid 650KB/s from the SD card without any error
> > > > > at all.
> > > > > 
> > > > 
> > > > Please, see my last comment...
> > > > 
> > > > > My take:
> > > > > * This controller internal CS seems to be totally broken.
> > > > 
> > > > Native CS aren't broken, they just have been designed so it isn't that
> > > > easy to use them in the linux kernel. Linux kernel SPI-core expects
> > > > the chip-select being driven the way it needs at the certain moments,
> > > > while DW APB SSI toggles them automatically at the moment of the data
> > > > pushing/popping to/from the SPI bus. Some hardware vendors that bought
> > > > the DW APB SSI IP-core have fixed that by providing a way of direct
> > > > CS lane control (see spi-dw-mmio.c: Microsemi, Sparx5, Alpine
> > > > platforms).
> > > 
> > > OK. Thanks for the details.
> > > 
> > > > > * This SoC has really slow interrupts, so generating these earlier rather than
> > > > > later gives time to the IRQ handler to kick in before the FIFO overflows.
> > > > 
> > > > I am pretty sure that's not the reason. See my next comment.
> > > > 
> > > > > 
> > > > > In the V2 series for SPI DW, I added a DW_SPI_CAP_RXFLTR_CLEAR capability flag
> > > > > to set RXFLTR to 0, always. That works well, but this is may be still similar
> > > > > to the "polling" hack in the sense that it is tuning for this SoC rather than a
> > > > > property of the controller. But I do not see any other simple way of removing
> > > > > these annoying RX FIFO overflow errors.
> > > > 
> > > > Alas no, RX-FIFO level value shouldn't affect the SPI-transfers
> > > > execution results. I'll try to explain it one more time. DW APB SSI
> > > > provides three modes of transfers (TMOD-es, see the chip manual for
> > > > details). One of them is TMOD=0x0 - Transmit and Receive. Simply
> > > > speaking the mode essence is if you push a byte of data to the Tx
> > > > FIFO you'll synchronously get a byte of data back in the Rx FIFO a bit
> > > > later from the internal shift register. The IRQ-based transfers have
> > > > been developed full based on that mode. So it's absolutely possible to
> > > > implement a stable algorithm, which would work without a risk of
> > > > getting the Rx FIFO overflow or the Tx FIFO overrun. Such algorithm
> > > > should just preserve a balance of sent data so the received data
> > > > wouldn't cause the Rx FIFO overrun. As you understand such algorithm
> > > > doesn't depend on the IRQes performance. No matter how slow the IRQs
> > > > handler is execute, as long as it's executed, the SPI transfers
> > > > procedure shall go on with no errors including the Rx FIFO overflows.
> > > 
> > > OK. I get it now.
> > > 
> > > > At least that's what the original DW APB SSI driver developer
> > > > implied when created the code and what I was trying to preserve in my
> > > > patches. If you still get the errors (you sure it's Rx FIFO overflows,
> > > > aren't you?), then something went wrong and either me or the original
> > > > author or someone else has broken the code.
> > > 
> > 
> > > Yep, 100% sure it is RX FIFO overflow error. The bit in the IRQ status is set.
> > > Checked it. And that is the trigger for the error message which exactly says
> > > that "RX FIFO overflow". So that would mean that too many bytes are being
> > > written to the TX FIFO, right ? Or rather, that when the TX FIFO is written, it
> > > writes more bytes than what is available in the RX FIFO ?
> > 
> > I'd say that in appliance to the implemented in the driver algorithm
> > the error has been indeed caused by writing too many bytes to the Tx
> > FIFO. But that in its turn implicitly caused the Rx FIFO overflow.
> > 
> > The error you see in the log specifically means that the Rx FIFO has
> > been full and there has been more data to receive, but due to not
> > having any free space in the Rx FIFO that data has been discarded. In
> > appliance to DW APB SSI driver, as I said, it means that there is a
> > mistake in the IRQ-based SPI-transfer execution procedure. We've
> > written too much data to the Tx FIFO so the balance between the sent
> > and received bytes has been violated. ISR couldn't handle the
> > interrupt on time and the Rx FIFO has got overrun. If the balance
> > wasn't violated or the ISR was executed on time we wouldn't have got
> > the overrun. Supposedly that's why the error hasn't been seen on my or
> > other platforms but only on yours and only with normal RXFTL register
> > value. The ISR is executed on time so the balance violation doesn't
> > affect the transfer that much as in your case. My guess that the
> > problem might be connected with the off-by-one bug. But that's just a
> > hypothesis.
> > 
> > > 
> > > If that is the case, then it seems to me that tx_max() should be modified a
> > > little: rx_len may be large (say a sector), in which case rxtx_gap overflows
> > > (becomes super large), with the result that tx_max() returns tx_room. But that
> > > may be larger than the free space in the RX FIFO, no ?
> > 
> > Yeah, I also considered the tx_max() method as a first place to blame.
> > But alas I failed to see what might be wrong there.
> > 
> > Let's analyze what tx_max() does. It may get us to a better
> > understanding what is going on during each send operation.
> > 
> > Here we calculate a free space in the Tx FIFO:
> > > tx_room = dws->fifo_len - dw_readl(dws, DW_SPI_TXFLR);
> > It can be within [0, fifo_len]. So if Tx FIFO is full there is no room
> > for new data to send. If it's empty we can send data up to of FIFO
> > length.
> > 
> > The next is a magic formulae, which makes sure the length of the sent data
> > always doesn't exceed the Rx FIFO length. In other words it preserve
> > the so called balance: (rx_len - tx_len <= fifo_len).
> > > rxtx_gap = dws->fifo_len - (dws->rx_len - dws->tx_len);
> > (rx_len - tx_len) gives us a number of data which has already been
> > written to the Tx FIFO, but the corresponding incoming data still
> > hasn't been read back from the bus. The formulae above works well
> > while the next statements are valid:
> > 1) rx_len is always greater than or equal to tx_len. Indeed due to the
> > SPI nature first we write data to the Tx FIFO and decrement the tx_len
> > variable accordingly, then we read data from the Rx FIFO and decrement
> > the rx_len variable.
> > 2) (rx_len - tx_len) is always less than or equal to fifo_len. I don't
> > really see when this could be incorrect, especially seeing we always
> > send and received data by no more than the FIFO length chunks and
> > make sure the difference between the sent and received data length
> > doesn't exceed the FIFO length. The reading is always done before
> > writing.
> > 
> > Finally we get to select an allowed number of data to send. It's
> > the minimum of the Tx data length, Rx FIFO free space and the length
> > of the data which doesn't let the Rx FIFO to oveflow:
> > > return min3((u32)dws->tx_len, tx_room, rxtx_gap);
> > 
> > Alas currently I don't see at what point the algorithm could be
> > incorrectly implemented...
> > 
> > > 
> > > I think I need to do a round of debug again, tracing these values to figure out
> > > what is going on. I can reproduce the errors very easily (I just need to crank
> > > up the SPI frequency).
> > 
> > Yeap, that what I would have been doing if I had the problem
> > reproducible.
> 

> Found the bug :)
> The fix is:
> 
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index e3b76e40ed73..b7538093c7ef 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -828,7 +828,7 @@ static void spi_hw_init(struct device *dev, struct dw_spi
> *dws)
>                 }
>                 dw_writel(dws, DW_SPI_TXFTLR, 0);
>  
> -               dws->fifo_len = (fifo == 1) ? 0 : fifo;
> +               dws->fifo_len = (fifo == 1) ? 0 : fifo - 1;
>                 dev_dbg(dev, "Detected FIFO size: %u bytes\n", dws->fifo_len);
>         }
> 
> Basically, fifo_len is off by one, one too large and that causes the RX FIFO
> overflow error. The loop above breaks when the written fifo value does not
> match the read one, which means that the last correct one is at step fifo - 1.
> 
> I realized that by tracing the transfers RX first, then TX in
> dw_spi_transfer_handler().I did not see anything wrong with tx_max() and
> rx_max(), all the numbers always added up correctly either up to transfer len
> or to fifo_len, as they should. It looked all good. But then I realized that RX
> FIFO errors would trigger 100% of the time for:
> 1) transfers larger than fifo size (32 in my case)
> 2) FIFO slots used for TX + RX adding up to 32
> After some tweaking, found the above. Since that bug should be affecting all
> dw-apb spi devices, not sure why it does not manifest itself more often.
> 
> With the above fix, the SD card is now running flawlessly at 1.2MB/s with
> maximum SPI frequency, zero errors no matter how hard I hit it with traffic.

Hm, what you've found is the clue to getting where the problem lies,
but I don't see fifo_len being calculated incorrectly in my HW. In my
case it equals to 64 and 8 bytes for two different controllers. Those
are the correct SSI_TX_FIFO_DEPTH/SSI_RX_FIFO_DEPTH parameters values
our controllers have been synthesized with.

But I've just realized that DW APB SSI controller can be synthesized
with Rx and Tx FIFO having different depths. (Synopsys, really, what
scenario did you imagine to provide such configuration?..). Anyway is
it possible that you've got a controller which (most likely by
mistake) has been synthesized with Rx_fifo_len != Tx_fifo_len? If so
then that will explain the problem you are having, but everyone else
isn't. The algorithm thinks that both FIFOs length match and equals to
the Tx FIFO length. If Rx FIFO length is smaller even with a single
byte, you'll end up with occasional overflows.

Note if you don't have a manual with the parameters selected for your
IP-core, you can just fix the fifo_len detection loop by replacing the
TXFTLR with RXFTLR. Then just print the detected Rx and Tx FIFO
lengths out. If they don't match, then, bingo, that's the root cause
of the problem.

-Sergey

> 
> Dropping all other patches (except 32-bits CR0 support that is still needed).
> The MOSI line drive patch does not seem to be necessary after all. My guess is
> that it was the fact that sometimes one more byte than necessary was being sent
> due to fifo len being of by one. With that fixed, there is never any "0" byte
> transmitted, so no need to set the value of txw to "0xffff".
> 
> Will send proper patches tomorrow, only 2 :)
> 
> -- 
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
