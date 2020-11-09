Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095ABC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:05:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF8F204EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHFRWTjX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4ngB+Vm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF8F204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EVWZCBTs5xLkhQZwtiIpGc9GLxXgHg3RmXeorcINdXQ=; b=KHFRWTjXj6eYpcB8jDcV9VNWx
	pNSFG+uz3/lapK+C5A3rKnclei9MQBvMseLhmIY0iJXwEgG1QERFvp+Gd+fXS2HvSnvj8u7vAyM+U
	E4JOA9n9SHVEf4cLMsCdgNJNuKB6F7f/Kv70lZGkRrNo4WPhJ1gwuSFOdyAeFVMTn6NLNpqD3WKWn
	GSwslFFEQdwcgYCljfBC6GWh0D+59uGuEouWE+lBScnh37XimJMG4IImFlSfWCImS77R4U5rWvN2t
	T7KGdGkwW9p9pYO0XLKmlY3jItSnYOQSxLlXlQ8VUgCDKEmsthSirmFH9qiCe6Lg9BxrDlmhQS/b7
	3e4lifp7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcEM6-0006ur-7f; Mon, 09 Nov 2020 21:05:38 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcEM3-0006uP-UB
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:05:36 +0000
Received: by mail-lf1-x143.google.com with SMTP id e27so14441752lfn.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cOCI4SBuOxmuGoq5//5OC6v0o3RKmJwbRqP0ztXYBPg=;
 b=n4ngB+Vm9o9xmuhSrzJl37tTI/Ijz0DVTxm+2jswEXS09Xx7G9FcvVjduKzPqiR/6h
 erDLxVVBC2QuOEu6vUTQgNya971tH04Oe9/LQGtt7kQOwtNI5M/r6HNRxC6HRlzBoApi
 XElf7F9mhweqy1Y+2XC2fV+oCNMrJ8SGHADBgSw4t+S3tm2oth/xtrBlbuKiS9spOAY4
 HR6npPXPi8Zir6MXXqZFGIfL48LIdrpGIMf19GOJT6DTOI7WaIeNZLO6dl+d0Ja45sGW
 Ds+hyyz06ryoUtyE5hwiFb8vSmYSCWM48PUDhXQKThHFTBKpNB4KIUYE6GHwV/gU2tLv
 0ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cOCI4SBuOxmuGoq5//5OC6v0o3RKmJwbRqP0ztXYBPg=;
 b=TrC6A62P2v5UB+usRWDqg/Tn84WUlX7BQoQQd1LvkU8hiYzaniPrLkMpGPxPhWx5UN
 UtlUatGGUYyn3Ma9ouoIc9hc1ZwQMtp8YdSDl24YTEooUYiZuqCmTjCrZCO+HwfhYQJd
 OQTYuaSPv350m03FNVvs/TlJD808BuXel2jdJArImKbrDOByG2LL+1KjxG6V2LsWgsJE
 EndtoWbt65X6+zob279iaiHbcvdXO6t9lki/DZA30fDJqTDGFln77vwKVJNs10jCfa+b
 10UeThkD0+z4BrOo69/CgwB4YYc6EJSqalVVtmXJSIAJF7CH3fWZyeSpFmHdb/4t196S
 AMjA==
X-Gm-Message-State: AOAM531oy1JFmUDPaVncKHN+3Y+0dKICIx8gZmpDRr+TeMTwnZ13EgLX
 bWmLVIv/LvudPncSeOgeIWE=
X-Google-Smtp-Source: ABdhPJxTsyoxQb7yCq2ZZTuh56M+VCAlvJvsmViI1PeyAplkpjFzX7nVjgWcN9JR3sBC8wg31tRoZA==
X-Received: by 2002:ac2:4216:: with SMTP id y22mr6171180lfh.169.1604955934247; 
 Mon, 09 Nov 2020 13:05:34 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id p5sm1920225lfj.0.2020.11.09.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:05:33 -0800 (PST)
Date: Tue, 10 Nov 2020 00:05:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109210531.wp4dmug4w2r4kh4p@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
 <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
 <20201109141422.GD6380@sirena.org.uk>
 <20201109191909.wfuwpddng4rdn4ca@mobilestation>
 <20201109202052.GL6380@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109202052.GL6380@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_160536_016502_B29CFCAB 
X-CRM114-Status: GOOD (  35.08  )
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

On Mon, Nov 09, 2020 at 08:20:52PM +0000, Mark Brown wrote:
> On Mon, Nov 09, 2020 at 10:19:09PM +0300, Serge Semin wrote:
> > On Mon, Nov 09, 2020 at 02:14:22PM +0000, Mark Brown wrote:
> 
> > > I'd expect it'd perform better, especially on systems that are
> > > apparently struggling for CPU bandwidth like yours seems to.
> 
> > CPU-wise. RO-mode won't help in that case. Moreover it will be even
> > more errors-prone for the systems with small CPU bandwidth. As I said
> 
> Right, these are two separate issues - one is that the client device
> has requirements on the transmit data at times when the driver isn't
> defining what should be transmitted, the other is that the controller
> driver is using full duplex mode even for single duplex data.  I just
> happened to notice the second issue while reviewing the change - there
> shouldn't be any code for setting the dummy transmit pattern in the
> driver in the first place.
> 
> > 2) Rx-only with atomic CPU utilization. In order to make sure that the
> > CPU keeps up with fetching the data from the Rx FIFO, we have to
> > disable the local CPU IRQs while performing the Rx-only transfers, so
> > to prevent the Rx FIFO overflow while the CPU is doing something else.
> 
> ...
> 
> > So in all other cases for normal CPU-based SPI-transfers when
> > GPIO-based chip-select is available the safest solution would be to
> > use a normal Push-Pull mode. In this case we have no risk in getting
> > the Rx FIFO overflow unless there is a bug in the code, which is
> > fixable anyway.
> 

> I'm not clear why we would have issues with the FIFO overflowing in PIO
> mode, especially with a GPIO chip select - even if we're forced to tell
> the controller how big the transfer is if we're using a GPIO chip select

> we could just tell it we're doing a series of FIFO sized transfers?

Hm, you are right. Splitting the Rx-only transfers on the chunks with
lengths smaller than the FIFO size indeed would have solved the
problem of the Rx FIFO overflow with GPIO-based CS hardware. Don't
really know how I missed that. Most likely because when concerning the
Tx-only/Rx-only/EEPROM-read modes I always think about the native
chip-select automatic assertion/de-assertion, in which case we have no
other way but to provide the SPI-transfers/message atomicity.

> 
> > Another possible solution for the problem would be to fix the SPI core
> > so aside with tx_buf being set to the NULL-pointer, a client driver
> > would provide a default level or some specific value being put to the
> > SPI bus on Rx-only transfers. If an SPI-controller is capable of
> > satisfying the request, then it will accept the transfer. If it's not,
> > then the SPI core may try to convert the Rx-only transfer into the
> > Full-duplex transfer with the Tx-buffer being initialized with the
> > requested level.
> 

> We do have support in the core for creating dummy data buffers for
> controllers that can't do half duplex - that's the SPI_MUST_TX and
> matching SPI_MUST_RX that I mentioned in my initial reply.  Currently we
> always zero fill transmit buffers, the expected semantic is that if the
> client driver isn't supplying data that means the device doesn't care
> what gets sent and it's not clear to me that it isn't sensible to just
> keep that like I said earlier,

> I don't know how common it's going to be
> to need this since most half duplex transfers generally are half duplex.
> The whole point with the SPI_MUST_ flags was to remove the need for
> controller drivers to open code handling this, it was adding
> complication and supporting configuration of the dummy data feels like
> it's adding room for things to go wrong.

If by general Rx-only half-duplex transfers you meant that the client
SPI-device shall just not care what the MOSI level, then the only
acceptable solution of the noted in this patch problem is to fix the
client driver. Since in case of the MMC-SPI client device sometimes it
does care about the level.

-Sergey


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
