Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD375C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 19:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30738206D8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 19:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pQvWczjf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZtplO94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30738206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ml409i48FoWBa4JwyvmMQtt9YGO/4zFtzEm8/8M0YF4=; b=pQvWczjfLP0fgjVTCrVdmXypo
	vp8lfWzm+laywMJRJGXUYXslDX89d+5EqBkGHCxLLmJhtCWBGQBGsi/GACyTG2mZ3X92T3iLFOUDR
	e0B+7gS0d7+iSUP9PmjJ6r2Ur2LFUtnZQ/8hoTM0Y9JBemOrcJ6nhpBVINs8Mmu7wgHHK6x6hzM/+
	daih7TjBzKBmw8IRrV2l/vSGrF7Jw6c4Gdi/b9gGYqaOOqzsud7Sl7ZnpWyLAdr8PCTt+KqO1trwS
	0UdWnERj8bmeQNid5fMgj5BUq5X79TlUcTMLuf8bMHou70k1buFMrePQiXtOQliw74IPTSF5O4FL0
	XKEhD3S/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcChA-0003gr-DF; Mon, 09 Nov 2020 19:19:16 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcCh7-0003gU-Ia
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 19:19:14 +0000
Received: by mail-lj1-x243.google.com with SMTP id q19so10035149ljc.10
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 11:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r9d7dXS9UxJQZPpIorblG/IcIk0uXkJw79U3kSgMOhk=;
 b=OZtplO94Wt9ecWyv8oYMp5JKwvjXA+daO5t+WaReAkLrGlHgLq+RM7QH6jQ95okGVO
 4kXLHt3IjiYkImJt6KMd72nQOioIhyKvP+QKi+GQ8Ewmpwx4ceWLPuP9pKd7oq0PbSoM
 rHgNtSEtk+b0GznCh4vGTUbCtrloZrnT79gmFpmx5krNBmwgBUPggTSWH/JDQSfd5sUu
 CmzLWXPVjf2Pe844CBkTqgluv3YqES6vdmdzlyARc/slgVO7iiT1C3Iv9xb5LTQf/UTZ
 hvynAxc/37Xvc/g3MP/nvTgfbZSNaeQwfk53tLRmP01mePGCNuUmNU9EW6pBXEZRUnu2
 ycPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r9d7dXS9UxJQZPpIorblG/IcIk0uXkJw79U3kSgMOhk=;
 b=HnT4OPEVFmbfiV+1Mt7qjNdu1RIpEBXluxbFsrYxJOLiqdj1bEemwd5uxRjzXQETZU
 NuJNdnCcPyW9tsjd6bvMpqO6rZ5J/PjmBCquKHPGpYy40yfk1/nSv0RPekF+Zp9ngB2o
 n4FbG7NpsMGQivxi7pcDfCWySynS4h9ZYcIsW2XAUyNd1xgL1pTLIGMrQfQA+i5Xu4K8
 W6PHTXSdDyxA7fk2FG8eE/K6ePseArK7zPfZjlkJHeleTuxx7cNC9V/5IiPYsOi5ZcEu
 lFdEiFUFAc1JIG87jbFrp3s/0x0CrQHA6nzdEGpPdqYUaKpQJUMj7Vax/TRgdDTOROHm
 Bw9g==
X-Gm-Message-State: AOAM533lbij/5i8lmgxUwq3MClHXHEo23GfZwZlpvZdgrqVZyFFOWGBJ
 dWG6uzTAxwFMzFPY4YIcVpY=
X-Google-Smtp-Source: ABdhPJysV4HArNxJWnmNnrRZDrlhi2BXsPTRITKipRHlzWi9l4KAqb+DSLRqHJPmUN4GB2gASmc2ZQ==
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr2948208ljn.220.1604949551996; 
 Mon, 09 Nov 2020 11:19:11 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id f1sm31595lfm.184.2020.11.09.11.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:19:11 -0800 (PST)
Date: Mon, 9 Nov 2020 22:19:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109191909.wfuwpddng4rdn4ca@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109141422.GD6380@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_141913_669044_D25DD69B 
X-CRM114-Status: GOOD (  39.04  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:
> On Mon, Nov 09, 2020 at 08:47:10AM -0500, Sean Anderson wrote:
> > On 11/9/20 8:29 AM, Mark Brown wrote:
> > > On Sat, Nov 07, 2020 at 05:13:51PM +0900, Damien Le Moal wrote:
> > > 

> > >> The resting state of MOSI is high when nothing is driving it. If we
> > >> drive it low while recieving, it looks like we are transmitting 0x00
> > >> instead of transmitting nothing. This can confuse slaves (like SD cards)
> > >> which allow new commands to be sent over MOSI while they are returning
> > >> data over MISO. The return of MOSI from 0 to 1 at the end of recieving
> > >> a byte can look like a start bit and a transmission bit to an SD card.

Yeah, that's what we've also experienced on our systems. We've worked
around the problem in exactly the same way as you have. But we haven't
dared to send it out as the solution seemed a bit hackish.

> > > 
> > > If client devices are interpreting the transmitted data then I would
> > > expect the drivers for that hardware to be ensuring that whatever we
> > > transmit matches what the device is expecting.  We shouldn't be putting
> > > a hack in a particular controller driver to paper over things, that will
> > > mean that the device will break when used with other controllers and if
> > > different devices have different requirements then obviously we can't
> > > satisfy them.  There is not meaningfully a general specification for SPI
> > > which says what happens when signals are idle, it's all specific to the
> > > client device.
> > > 
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

CPU-wise. RO-mode won't help in that case. Moreover it will be even
more errors-prone for the systems with small CPU bandwidth. As I said
the Receive-only mode will make the SPI controller automatically
receiving data from the SPI bus and putting it into the Rx FIFO. If
CPU is either busy with something else or too slow in fetching the
data from the Rx FIFO, the FIFO will be eventually overflown with
data, which we need to avoid at all cost.

As I see it the Receive-only mode is only acceptable in the next two
situations:

1) Rx-only DMA. But only if the DMA-engine and system bus are fast
enough to fetch the incoming data on time. (Note for example in our
system some DWC DMA-engine channels don't work well with the DW APB
SSI working with full-speed, so we had to set constraints on the DWC
DMA channels being used in conjunction with the DW APB SSI
controller.)

2) Rx-only with atomic CPU utilization. In order to make sure that the
CPU keeps up with fetching the data from the Rx FIFO, we have to
disable the local CPU IRQs while performing the Rx-only transfers, so
to prevent the Rx FIFO overflow while the CPU is doing something else.
Needless to say that such approach should be utilized only as a last
resort, if we have no choice but to run the Receive-only transfers.
Because locking the CPU for God knows how much time may cause the
system interactivity degradation. For instance, a possible use-case of
that design is when the controller is communicating with the
SPI-devices with native DW APB SSI chip-select attached. BTW You can
also find that design implemented in the kernel 5.10 spi-dw-core.c
driver in context of the SPI-memory operations (with my last patches
merged in). In particular I had to use it to handle the CPU-based
EEPROM-read mode.

So in all other cases for normal CPU-based SPI-transfers when
GPIO-based chip-select is available the safest solution would be to
use a normal Push-Pull mode. In this case we have no risk in getting
the Rx FIFO overflow unless there is a bug in the code, which is
fixable anyway.

Getting back to the patch. In fact I don't really see how the
Receive-only mode will help us with solving the problem noted in the
patch log. As Mark said the problem with the Tx data on Rx-only
transfers should be fixed on the client side. If an subordinate
SPI-device needs a specific value to be received in that case, then
that value should be somehow provided to the SPI-controller anyway.
So the native Rx-only mode of the DW APB SSI controller won't help.
Currently it's possible to be done only by executing a Full-duplex
SPI-transfer with the Tx-buffer being pre-initialized with that
value.

Another possible solution for the problem would be to fix the SPI core
so aside with tx_buf being set to the NULL-pointer, a client driver
would provide a default level or some specific value being put to the
SPI bus on Rx-only transfers. If an SPI-controller is capable of
satisfying the request, then it will accept the transfer. If it's not,
then the SPI core may try to convert the Rx-only transfer into the
Full-duplex transfer with the Tx-buffer being initialized with the
requested level.

-Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
