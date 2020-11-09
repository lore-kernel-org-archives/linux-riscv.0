Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A46AC388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:18:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC28D206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLW7ftHd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+tLe7nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC28D206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P3tbY1+b8BNR8/35X+ZIrzbqWw/gB9y372Nfrq4Uk5I=; b=PLW7ftHdl9kTwR2Y4hxi8i1iO
	tW7/fA88Art7to4uptMAquCXPRpCXM0IsDV//skx3XZfE2KtmSe9n73Yt1hzHZXTohf53SZ6M2DZH
	RHkWBbwkTEBTLww4aCWsnhdNP+n0IlQ8ouZNpxncHj9R8h0HrLDXFhEBKJTkNNMNXqG7YbwKTW+Zv
	6xc2hGzVMXGA2jXppUpjXIRRLaUwM2k2+Od0AxeVBZaKmNZYlXwaBdKMBqzUkqY0yHTynqYYttVYO
	6rj0FXVT8SokFLwuY2P76ZvrqglNZZy4iVhZAl+LD7aM9GkjmMUGZ9LhlblBIh0NtSaI5v1rk/deq
	wtwB2PKrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcDbr-0002Qj-F7; Mon, 09 Nov 2020 20:17:51 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcDbo-0002Ps-8E
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 20:17:49 +0000
Received: by mail-lj1-x244.google.com with SMTP id o24so5277799ljj.6
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 12:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=39IRg2jSbMkxk30nBeMpPpnqXXb5weUeM3ki0KRmtXw=;
 b=p+tLe7nrrRRz6AT3ZKbFb1QzBpaFAMM3+X3HJ06XGx18X/XfM3ehCHHwjk3U93TS28
 Y8ulIRXTdGf7h6OBjE5qrSuKnNXM6rOI/OGxCvN/MDh7UzTjKxQOEKRp4Ae6+ooG+SCZ
 KFWNJcY5DOW6DbD5maxgkFuW069b+oI6UzOj6SF1jJoCslAW2Ic4GIFoT/3fx2Qg+cZT
 qHS7yMNasGCec9rgzfGrJBaftKrE5ZlTx0d+fFNfHoUOVJnLl6bS+mykX1a5KN3RQqLZ
 Mz/+xqKJdp91/RCeyaHsVrckk3Aa/naA00mCPT7pbMApY9ziGhjBp1O7iQepL8vdGd7K
 VZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=39IRg2jSbMkxk30nBeMpPpnqXXb5weUeM3ki0KRmtXw=;
 b=BwRjhm7l8UcdVxlMgEJcD58qF+CTOwOz+WckMXJQIRUqmuzKDDZx5X6co/XBva1djz
 9yIAb83s5UEL1MLj5vDJ7/TagPoFYY8yh3M+sORhAHbTP44Zf7jL0IoSWljey3Ryk1h1
 vagotDMVTwASjjGJoE76vBpY20dmfLsd60AXoPx5UXwJ/42hEMGXgCZcJeIQpskhlRXa
 0qVucpbQU/H4GouokUONfuTJXuY3F+h42YnJwjJPsGoTUI3o+wtoC9dks8ub+kVvWEzw
 e84LYfjE4yDZ9EBejj5A3klYrSdkcZlzhLQs9S1Ebiq5i+7Cl704alIBctSzOJ2cMTdq
 ZY4Q==
X-Gm-Message-State: AOAM533FPyOu4z/mr5pkGAj6GuRBcHYIyLv1rBYfm6LCwjsyWFHAfJp6
 ckM01HSQKNvUHbhr/pfE9t4=
X-Google-Smtp-Source: ABdhPJwuoRdhlj8Lnwz+dXtVRMjzbV5nJxA24wh6QyJBwjZalEeG2zoyRrt3AFE+STvjCj9VrkvhOg==
X-Received: by 2002:a05:651c:103b:: with SMTP id
 w27mr6562923ljm.323.1604953066991; 
 Mon, 09 Nov 2020 12:17:46 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id m10sm1867427lfo.237.2020.11.09.12.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:17:46 -0800 (PST)
Date: Mon, 9 Nov 2020 23:17:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109201744.zlxwur4p3ejbraup@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109191909.wfuwpddng4rdn4ca@mobilestation>
 <5808c9b9-5955-4733-2c56-b93c627cb556@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5808c9b9-5955-4733-2c56-b93c627cb556@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_151748_351778_3BF1FC00 
X-CRM114-Status: GOOD (  48.94  )
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
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 02:40:01PM -0500, Sean Anderson wrote:
> On 11/9/20 2:19 PM, Serge Semin wrote:
> > On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:
> >> On Mon, Nov 09, 2020 at 08:47:10AM -0500, Sean Anderson wrote:
> >>> On 11/9/20 8:29 AM, Mark Brown wrote:
> >>>> On Sat, Nov 07, 2020 at 05:13:51PM +0900, Damien Le Moal wrote:
> >>>>
> > 
> >>>>> The resting state of MOSI is high when nothing is driving it. If we
> >>>>> drive it low while recieving, it looks like we are transmitting 0x00
> >>>>> instead of transmitting nothing. This can confuse slaves (like SD cards)
> >>>>> which allow new commands to be sent over MOSI while they are returning
> >>>>> data over MISO. The return of MOSI from 0 to 1 at the end of recieving
> >>>>> a byte can look like a start bit and a transmission bit to an SD card.
> > 
> > Yeah, that's what we've also experienced on our systems. We've worked
> > around the problem in exactly the same way as you have. But we haven't
> > dared to send it out as the solution seemed a bit hackish.
> 

> Well, the way it is now is equally wrong, since it is driving the line
> low.

Alas a lot of the SPI-controller drivers have got it implemented in the
same way. So, yeah, all of them won't work well with the SPI-based MMC
interfaces, unless either the client driver or the SPI core code are
properly fixed.

> 
> >>>>
> >>>> If client devices are interpreting the transmitted data then I would
> >>>> expect the drivers for that hardware to be ensuring that whatever we
> >>>> transmit matches what the device is expecting.  We shouldn't be putting
> >>>> a hack in a particular controller driver to paper over things, that will
> >>>> mean that the device will break when used with other controllers and if
> >>>> different devices have different requirements then obviously we can't
> >>>> satisfy them.  There is not meaningfully a general specification for SPI
> >>>> which says what happens when signals are idle, it's all specific to the
> >>>> client device.
> >>>>
> >>>> In this case it also looks like the controller hardware requires
> >>>> transmit data and therefore should be setting SPI_MUST_TX and just
> >>>> removing the in driver default anyway, though that will have no effect
> >>>> one way or anther on the issue you're seeing.
> >>
> > 
> >>> There is a recieve-only mode, but it is not used by this driver. Perhaps
> >>> it should be.
> >>
> >> I'd expect it'd perform better, especially on systems that are
> >> apparently struggling for CPU bandwidth like yours seems to.
> > 
> > CPU-wise. RO-mode won't help in that case. Moreover it will be even
> > more errors-prone for the systems with small CPU bandwidth. As I said
> > the Receive-only mode will make the SPI controller automatically
> > receiving data from the SPI bus and putting it into the Rx FIFO. If
> > CPU is either busy with something else or too slow in fetching the
> > data from the Rx FIFO, the FIFO will be eventually overflown with
> > data, which we need to avoid at all cost.
> > 
> > As I see it the Receive-only mode is only acceptable in the next two
> > situations:
> > 
> > 1) Rx-only DMA. But only if the DMA-engine and system bus are fast
> > enough to fetch the incoming data on time. (Note for example in our
> > system some DWC DMA-engine channels don't work well with the DW APB
> > SSI working with full-speed, so we had to set constraints on the DWC
> > DMA channels being used in conjunction with the DW APB SSI
> > controller.)
> > 
> > 2) Rx-only with atomic CPU utilization. In order to make sure that the
> > CPU keeps up with fetching the data from the Rx FIFO, we have to
> > disable the local CPU IRQs while performing the Rx-only transfers, so
> > to prevent the Rx FIFO overflow while the CPU is doing something else.
> > Needless to say that such approach should be utilized only as a last
> > resort, if we have no choice but to run the Receive-only transfers.
> > Because locking the CPU for God knows how much time may cause the
> > system interactivity degradation. For instance, a possible use-case of
> > that design is when the controller is communicating with the
> > SPI-devices with native DW APB SSI chip-select attached. BTW You can
> > also find that design implemented in the kernel 5.10 spi-dw-core.c
> > driver in context of the SPI-memory operations (with my last patches
> > merged in). In particular I had to use it to handle the CPU-based
> > EEPROM-read mode.
> > 
> > So in all other cases for normal CPU-based SPI-transfers when
> > GPIO-based chip-select is available the safest solution would be to
> > use a normal Push-Pull mode. In this case we have no risk in getting
> > the Rx FIFO overflow unless there is a bug in the code, which is
> > fixable anyway.
> > 
> > Getting back to the patch. In fact I don't really see how the
> > Receive-only mode will help us with solving the problem noted in the
> > patch log.
> 

> Shouldn't it put MOSI into High-Z like when the device is idle? The
> issue is mainly that the idle state and RX state are different.

AFAICS the manual doesn't say anything about High-Z, but only: "In
receive-only mode, transmitted data are not valid. After the first
write to the transmit FIFO, the same word is retransmitted for the
duration of the transfer."

I don't know for sure what "word" the authors meant, but it doesn't
sound like Tri-state anyway. So some value will still be put out on
the bus. Most likely it's the word written to the Tx-buffer to
initiate the Rx-only transfer.

> 
> > As Mark said the problem with the Tx data on Rx-only
> > transfers should be fixed on the client side. If an subordinate
> > SPI-device needs a specific value to be received in that case, then
> > that value should be somehow provided to the SPI-controller anyway.
> > So the native Rx-only mode of the DW APB SSI controller won't help.
> > Currently it's possible to be done only by executing a Full-duplex
> > SPI-transfer with the Tx-buffer being pre-initialized with that
> > value.
> > 
> > Another possible solution for the problem would be to fix the SPI core
> > so aside with tx_buf being set to the NULL-pointer, a client driver
> > would provide a default level or some specific value being put to the
> > SPI bus on Rx-only transfers. If an SPI-controller is capable of
> > satisfying the request, then it will accept the transfer. If it's not,
> > then the SPI core may try to convert the Rx-only transfer into the
> > Full-duplex transfer with the Tx-buffer being initialized with the
> > requested level.
> 

> This is probably the most general solution; is there an existing way to
> specify this sort of thing?

Without touching the SPI core code, as Mark said, the problem is
fixable only by converting the client-driver to executing the
Full-duplex SPI-transfers instead of the Rx-only ones. The client
driver will have to allocate a dummy-buffer and pre-initialize it with
the required default value of the MOSI lane.

-Sergey

> 
> --Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
