Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F810C56202
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 16:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2D722409
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 16:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smR6urpM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTDbJKqp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2D722409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IaiOhROeeg7rk7cfyKUL70aCF5gv6fqL0z+F9OzDK1w=; b=smR6urpMlwWkL+2C1Rxim7gI5
	LoLqUp3C0xOrTKD/xfRjUOzzAgXUPw9dp1YbcIjz44jjInfqoqroTzAyofZ8aBkwFEjkauMkfClgR
	t+vVRISrFvOYU/+MpuTEtVGu62J5Va3sVeSoBvofWlU5g8kE/Ey1sE+GMPUZWpY1TjUUsJXcvZWl1
	EIGdYBsmii9E6tTNrqooBdcFbiPChBNvkPsRwoeTzE2varK50uT+Gj9YzMyPensbY7IZZ+mu/5qeT
	YSxoHd0CvzOaxpGakdVmPffvHv9hpcos5K/jAcDT4yai1lRqhFweLgbVaSDxGF7Xl9qMNNJn2rvTE
	N8Sy2rBnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keKTS-00040m-Mq; Sun, 15 Nov 2020 16:01:54 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keKTQ-00040P-Ay
 for linux-riscv@lists.infradead.org; Sun, 15 Nov 2020 16:01:53 +0000
Received: by mail-lf1-x144.google.com with SMTP id e139so1802313lfd.1
 for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2020 08:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z/o5dHQdupSX0LEpFJUfukdhv88jcnp6r8cNQQCHst4=;
 b=qTDbJKqporXAV7pI8syzKGLsGqEV6rOprWwaKQBz6n/nOoWeURU+hOyyOhVUHjktCR
 4MSaFijqG7s6V5amzrZH/HasaHIUw7fy67VScu6d+FHsVDXzkk/Kpb62fhgVj6K4D49q
 /Z4Jt14wxJXcggRcemd3o/eYKvXp2m/xqs0RJErcVvvIA7SxEA6QJiM3Wxb9Tk0KUibF
 CauFSkp78slSsNr76DHnyy97PsjDZL4g9ErCjWEvAuruQXC9eLl4r1I5R9UhB0A3hQP5
 W577j5NOpeDCg2N2ka/o1bIPSp0rADllV0cnqBFdu13PkxJMfILiIB1nrwLbxxdZDQ7A
 WONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z/o5dHQdupSX0LEpFJUfukdhv88jcnp6r8cNQQCHst4=;
 b=a91UyyA7bZ0yFmmm5ovbj8Kl0nCfvJeskWn5bD045GvOWf8ADIvNQ1//Sdi17K8396
 O4CHDKinUlzRyjWF/Vyw8cWKbxMa6sXIPXFfwonKK3YzRblRP1VRFDpTzyaemNqTN7IV
 oTwPZhfjDjKfi9hhkmX+SmKTq3YOFEfQPZ5jC1K9M2R190HMtLkQ34KZLurE5Wm9SAGt
 7TH23EjwatvypLZA64OYHmWD2ZYxRgdBeSF/38ssVNU21YmJjxwK5KO1dfNEUDJmbe7t
 NOTXveWxwsBcVfwQjT7PVSly3L/BtG/u8RduAVlohgJ1r5b9TWXyOdL94bpkzKX4MN8r
 O7CQ==
X-Gm-Message-State: AOAM53391sMghB0zhsUKc5uPWaMg6TJrjqWcEu23EvQTtCFsTz19wXZ4
 w5z0zddWxJKr6CTu5BOGVO4=
X-Google-Smtp-Source: ABdhPJwGzRPIrF+sBIOG5+BoQZRv3Bz6c14nq7V/gFYoEqGUPcozBm13x+jsjMQqI/lQzXoTRIaKvw==
X-Received: by 2002:ac2:5195:: with SMTP id u21mr4260598lfi.393.1605456109201; 
 Sun, 15 Nov 2020 08:01:49 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id b19sm2354172lfp.254.2020.11.15.08.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 08:01:48 -0800 (PST)
Date: Sun, 15 Nov 2020 19:01:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Message-ID: <20201115160146.efxcdjhm7f2nmivo@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
 <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_110152_416062_777C0051 
X-CRM114-Status: GOOD (  46.29  )
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

On Fri, Nov 13, 2020 at 09:22:54AM +0000, Damien Le Moal wrote:
> On Mon, 2020-11-09 at 22:59 +0300, Serge Semin wrote:
> > On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
> > > With boards that have slow interrupts context switch, and a fast device
> > > connected to a spi master, e.g. an SD card through mmc-spi,
> > 
> > > using
> > > dw_spi_poll_transfer() intead of the regular interrupt based
> > > dw_spi_transfer_handler() function is more efficient and
> > 
> > I can believe in that. But the next part seems questionable:
> > 
> > > can avoid a lot
> > > of RX FIFO overflow errors while keeping the device SPI frequency
> > > reasonnably high (for speed).
> > 
> > No matter whether it's an IRQ-based or poll-based transfer, as long as a
> > client SPI-device is connected with a GPIO-based chip-select (or the
> > DW APB SSI-controller feature of the automatic chip-select toggling is
> > fixed), the Rx FIFO should never overrun. It's ensured by the transfer
> > algorithm design by calculating the rxtx_gap in the dw_writer()
> > method. If the error still happens then there must be some bug in
> > the code.
> > 
> > It's also strange to hear that the polling-based transfer helps
> > to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
> > causes them. Both of those methods are based on the same dw_writer()
> > and dw_reader() methods. So basically they both should either work
> > well or cause the errors at same time.
> > 
> > So to speak could you more through debug your case?
> 
> I did. And I have much better results now. Let me explain:

> 1) The device tree was setting up the SPI controller using the controller
> internal chip select, not a GPIO-based chip select. Until now, I could never
> get the GPIO-based chip select to work. I finally found out why: I simply
> needed to add the "spi-cs-high" property to the mmc-slot node. With that, the
> CS gpio is correctly driven active-high instead of the default active-low and
> the SD card works.

Yeap, that's the main problem of the standard DW APB SSI controller
released by Synopsys. Currently SPI-flash'es are the only SPI
peripheral devices which are capable to work with native DW APB SSI
chip-selects. I've fixed that for flashes recently by atomizing the
SPI memory operations (executing them with the local IRQs disabled)
and performing them on the poll-based basis. Alas the normal
SPI-transfers still can't be properly executed with native
chip-selects.

> 2) With this change using the GPIO-based CS, the patch "spi: dw: Fix driving
> MOSI low while receiving" became completely unnecessary. The SD card works
> without it.

Hm, that's weird. MOSI level has nothing todo with the chip-selects.
Are you sure the original problem has been connected with the Tx lane
level? On the other hand are you sure the problem has gone away after
all?

Moreover I've just taken alook at the MMC SPI driver. Turns out it
has already been fixed to send ones to the MMC port when it's
required. So If you still experience the MOSI-level problem
then that fix might have been done incorrect at some extent...

> 
> Now for testing, I also removed this polling change. Results are these:
> 1) With the same SPI frequency as before (4MHz), I can run the SD card at about
> 300 KB/s (read) but I am still seeing some RX FIFO overflow errors. Not a lot,
> but enough to be annoying, especially on boot as the partition scan sometimes
> fails because of these errors. In most cases, the block layer retry of failed
> read/writes cover and no bad errors happen, but the RX FIFO overflow error
> messages still pop up.
> 2) Looking into the code further, I realized that RXFLTR is set to half the
> fifo size minus 1. That sound reasonable, but as that delays interrupt
> generation until the RX fifo is almost full, I decided to try a value of 0 to
> get the interrupt as soon as data is available rather than waiting for a chunk.
> With that, all RX FIFO overflow errors go away, and I could even double the SPI
> frequency to 8MHz, getting a solid 650KB/s from the SD card without any error
> at all.
> 

Please, see my last comment...

> My take:
> * This controller internal CS seems to be totally broken.

Native CS aren't broken, they just have been designed so it isn't that
easy to use them in the linux kernel. Linux kernel SPI-core expects
the chip-select being driven the way it needs at the certain moments,
while DW APB SSI toggles them automatically at the moment of the data
pushing/popping to/from the SPI bus. Some hardware vendors that bought
the DW APB SSI IP-core have fixed that by providing a way of direct
CS lane control (see spi-dw-mmio.c: Microsemi, Sparx5, Alpine
platforms).

> * This SoC has really slow interrupts, so generating these earlier rather than
> later gives time to the IRQ handler to kick in before the FIFO overflows.

I am pretty sure that's not the reason. See my next comment.

> 
> In the V2 series for SPI DW, I added a DW_SPI_CAP_RXFLTR_CLEAR capability flag
> to set RXFLTR to 0, always. That works well, but this is may be still similar
> to the "polling" hack in the sense that it is tuning for this SoC rather than a
> property of the controller. But I do not see any other simple way of removing
> these annoying RX FIFO overflow errors.

Alas no, RX-FIFO level value shouldn't affect the SPI-transfers
execution results. I'll try to explain it one more time. DW APB SSI
provides three modes of transfers (TMOD-es, see the chip manual for
details). One of them is TMOD=0x0 - Transmit and Receive. Simply
speaking the mode essence is if you push a byte of data to the Tx
FIFO you'll synchronously get a byte of data back in the Rx FIFO a bit
later from the internal shift register. The IRQ-based transfers have
been developed full based on that mode. So it's absolutely possible to
implement a stable algorithm, which would work without a risk of
getting the Rx FIFO overflow or the Tx FIFO overrun. Such algorithm
should just preserve a balance of sent data so the received data
wouldn't cause the Rx FIFO overrun. As you understand such algorithm
doesn't depend on the IRQes performance. No matter how slow the IRQs
handler is execute, as long as it's executed, the SPI transfers
procedure shall go on with no errors including the Rx FIFO overflows.
At least that's what the original DW APB SSI driver developer
implied when created the code and what I was trying to preserve in my
patches. If you still get the errors (you sure it's Rx FIFO overflows,
aren't you?), then something went wrong and either me or the original
author or someone else has broken the code.

What we currently need is to carefully analyze at what moment you get
the overflows, what really caused them and fix the problem in the
code. The capabilities flag isn't an option in this case. I've tried
to reproduce the errors by slowing the system down, executing the
SPI-transfers of various length, but with no lick. So it's only you
for now who observes and can try to debug the problem.

Anyway after we get to fix it, you'll be able to run the MMC port with
speed as fast as it's possible.

---
One more thing about MMC SPI. Please note, that using MMC SPI and
DMA-based DW APB SSI transfers might not work well. The thing is that
the DMA-part of the MMC SPI driver relies on the legacy
spi_message->is_dma_mapped interface. It performs some specific
DEV-to-MEM and MEM-to-DEV DMA-buffers splitting and synchronizations.
In its turn the DMA-part of the DW APB SSI driver uses the generic
SPI-core and the DMA-engine interface to execute the SPI-transfers.
Since the SPI-core performs the DMA buffers synchronizations
internally at the moment of the buffers mapping, in case if the DMA
accesses aren't coherent on your platform, the data buffers might get
synchronized/flushed with/by caches incorrectly corrupting a part of
actual data. At least that's what we observed in kernel 4.9... So for
now I'd suggest to use either the poll- or the IRQ-based DW APB SSI
transfers.

-Sergey

> 
> > On the other hand the errors (but not the Rx FIFO overflow) might be
> > caused by the DW APB SSI nasty feature of the native chip-select
> > automatic assertion/de-assertion. So if your MMC-spi port is handled
> > by the native DW APB SSI CS lane, then it won't work well for sure.
> > No matter whether you use the poll- or IRQ-based transfers.
> 
> Indeed. The GPIO-based CS does behave much more nicely, and it does not require
> that "drive MOSI line high" hack. But for reasons that I still do not clearly
> understand, occasional RX FIFO overflow errors still show up.
> 
> 
> Thanks for all the useful comments !
> 
> -- 
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
