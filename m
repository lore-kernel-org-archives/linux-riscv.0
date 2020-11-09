Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB37C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC482068D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1DbtLOtX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtJOr3n+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC482068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LAFX4aFKHrIMSsiYSIftMSpxfE+q2dtgK/WypL12t3Q=; b=1DbtLOtX64JDMQ/UuxFAaMsu0
	cplmgtei7enYWv9smU4WCHDwTxiiya8ChD+Z+b0BjqBlKQo4I3ImwTwjbci/GLN32PeH4yP498Ur8
	gZk1cNNn31bpUhqteK9qMGKtYp/JTDTjOjWSOsdgdy5xP/JPYYthLRtWJKiI6DIcTExnDJxL8DMQq
	2gNTahUcWDYRF74NqKo90qwB3zZlvhWeZyeapEQQ4AgmeCIA8FJioB2fu3rtozuUP1ceT7+SIRRTj
	vRiaf2S9aarMfNFCkRgSaNJYGC+rBYsc1RSo8ctGouRq+QM99aQw6wX1gorf14XdjyD/9+uRtb+Jm
	1wx6jIXuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcE2J-0004VW-Rw; Mon, 09 Nov 2020 20:45:11 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcE2G-0004Uu-OH
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 20:45:09 +0000
Received: by mail-lj1-x242.google.com with SMTP id s9so10323353ljo.11
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xleOeNICgG0vwSm5hJnysiXKM3yQ5B3QY8UUY+zBMgU=;
 b=BtJOr3n+oEvi29MidTbCXT7DDDOg8dn1y7D7gereDVMHC0EljuUpu8DAvhNHjMQGyZ
 zIjF8HCv+xW8ZAUP8dVlP/fJeHcnM34A0S2ZBY9pDiQsQUdGeQPr6ADaATbSQ228YWz+
 XXXayw7srrvzjZyicsNXxFgY/ODh9gsl9QeLuSzRyVD5jNxWdFrVoH0SctAS/fPhJUUl
 gtr2mqPgWcbj6XsYK2QKg3PK0D916/M5ZX63w6Lp62o5kJ7HHOzW3z8wp2D7xyQqXO31
 AYmznFJbrt15o3POcJzyYrcONEHVFRqEvCFGctEmOTbU/elIWynnQy4IpnmB0qo6RuVX
 Ci4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xleOeNICgG0vwSm5hJnysiXKM3yQ5B3QY8UUY+zBMgU=;
 b=oIeLbGUHAIUr+mL6YeHwJC1FKS0VLC05Pm35YdWDiO8E9fFNgiVfa6AOkbQAZ6fBMl
 BbetIjp2gE8v3JHeRHNXqEQMyQsRG3xJ0Kt0iGcETqtz6sTtwkGI0j7AWErdG4coSNkS
 OF4g6A5J436LyIlHWN2mtfgxnilQkqu4Lje+l0tIJprRxlOHHmUpPDvRwum1sDOrzN2C
 JQ8zSpZ9CEV+kWTFTYxY6gdhFvA89ItTazBwdLHLoa7ai+uWa6tux2myAqmOCzO5uCSe
 kmSb4qKeMNE9Txe9dOj6dIi/plLCHjjfinAWmWO0fmWLbmWKKSFHGqfiYvspnj0lrzFj
 I6rg==
X-Gm-Message-State: AOAM533OL3YGKqD19s212Sz+co5eQ/VH8Hq+ytsfmVT6sDQKvmLu8UKk
 l0n4eEqL5RNNDHFtydmCvD0=
X-Google-Smtp-Source: ABdhPJwPfo9KB6YtEoJkeHK76OC4rgJuIhLlDo2MBXl0lJDnZj3HCkxJEr0CD312vs0esIJMUMVsEA==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr6453285ljj.250.1604954707454; 
 Mon, 09 Nov 2020 12:45:07 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id v22sm251076ljd.9.2020.11.09.12.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:45:06 -0800 (PST)
Date: Mon, 9 Nov 2020 23:45:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 05/32] spi: dw: Introduce DW_SPI_CAP_POLL_NODELAY
Message-ID: <20201109204504.npjdxnxgzkngif3s@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-6-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-6-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_154508_830977_A1A301E0 
X-CRM114-Status: GOOD (  24.26  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:13:53PM +0900, Damien Le Moal wrote:
> On slow systems, i.e. systems with a slow CPU resulting in slow context
> switches, calling spi_delay_exec() when executing polled transfers
> using dw_spi_poll_transfer() can lead to RX FIFO overflows. Allow
> platforms to opt out of delayed polling by introducing the
> DW_SPI_CAP_POLL_NODELAY DW SPI capability flag to disable
> the execution of spi_delay_exec() in dw_spi_poll_transfer().

Please, have a more thorough problem review. Rx FIFO shouldn't
overflow even for the CPUs with slow context switch. If it does, then
most likely there is a bug in the code. So it's not a good idea to
work it around by introducing a dts-property in any case.

Just to note in case of our hardware no matter what CPU frequency I
specified (it can be varied from 200MHz to 1500MHz), there have never
been seen the Rx FIFO overflow error even with heavy background tasks
executed. I am really puzzled why some context switch causes the error
in your case...

As I said in another thread, some logical MMC-SPI drivers errors may
happen if the native CS is utilized...

On the other hand, if you have a DMA-engine utilized together with
your controller and the Tx DMA-channel is tuned to work faster than
the Rx DMA-channel, then the Rx FIFO overflow will eventually happen.
So replacing the DMA-based transfers with the poll- or IRQ-based ones
shall indeed solve the problem. But the better solution would be to
balance the DMA-channels priority if your DMA-controller is capable of
doing that.

-Sergey

> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-core.c | 12 ++++++++----
>  drivers/spi/spi-dw.h      |  1 +
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index c2ef1d8d46d5..16a6fd569145 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -385,14 +385,18 @@ static int dw_spi_poll_transfer(struct dw_spi *dws,
>  	u16 nbits;
>  	int ret;
>  
> -	delay.unit = SPI_DELAY_UNIT_SCK;
> -	nbits = dws->n_bytes * BITS_PER_BYTE;
> +	if (!(dws->caps & DW_SPI_CAP_POLL_NODELAY)) {
> +		delay.unit = SPI_DELAY_UNIT_SCK;
> +		nbits = dws->n_bytes * BITS_PER_BYTE;
> +	}
>  
>  	do {
>  		dw_writer(dws);
>  
> -		delay.value = nbits * (dws->rx_len - dws->tx_len);
> -		spi_delay_exec(&delay, transfer);
> +		if (!(dws->caps & DW_SPI_CAP_POLL_NODELAY)) {
> +			delay.value = nbits * (dws->rx_len - dws->tx_len);
> +			spi_delay_exec(&delay, transfer);
> +		}
>  
>  		dw_reader(dws);
>  
> diff --git a/drivers/spi/spi-dw.h b/drivers/spi/spi-dw.h
> index 48a11a51a407..25f6372b993a 100644
> --- a/drivers/spi/spi-dw.h
> +++ b/drivers/spi/spi-dw.h
> @@ -130,6 +130,7 @@ enum dw_ssi_type {
>  #define DW_SPI_CAP_KEEMBAY_MST		BIT(1)
>  #define DW_SPI_CAP_DWC_SSI		BIT(2)
>  #define DW_SPI_CAP_DFS_32		BIT(3)
> +#define DW_SPI_CAP_POLL_NODELAY		BIT(4)
>  
>  /* Slave spi_transfer/spi_mem_op related */
>  struct dw_spi_cfg {
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
