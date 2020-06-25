Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED160C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:05:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3420206A1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mORpfI/P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Oko6Vl1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3420206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qIpaslJ8rChic4+uhBtILzKKe2ooTRKQ7Z4vQQgP+VI=; b=mORpfI/PMF64XJt5Vtr1YPDt5
	EGkQ/dRSoLZr7DsLzrpoFttJ8Azq3ei7OLuUD6MuTCPhQuZtJIvVfb1mFM/helIRQlXLraCVvfDNk
	mhHphK4/yRa24kpLTpUhhwgVZo8an/CmpiZGQWXLYWCLe5PKBipGK/Yn7JP5Kih8scurjwHCLyBiZ
	G6fol0Gfunm0S4nBKXJ+nH+usgFPgwF3kCEZwSnY7EHU1pJ4XNMaF3nU4oEGJpzcTEq6HDToGJl9R
	Mmw1hgvXvsscFVlHt8T6OVrlvl1SmlViHXIg2aDyyIxfU1Q6o1QBMIqqxA+jRl4hGpbpkd8kT1Bqz
	uN/84bShQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jon6P-0003o9-HG; Fri, 26 Jun 2020 12:05:05 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolYC-0002bz-Jo
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 10:25:56 +0000
Received: by mail-vs1-xe42.google.com with SMTP id o15so5185847vsp.12
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FMi8HIRU1bG/4UKbi/g8kAakUuymPAGSF1dal1jHofU=;
 b=Oko6Vl1ZWjGZjshO8+lPnQThRx9YYwShYnNUKrx7CUdQYx6IRY3ypg7+C+dedQ+0NZ
 VUXhc25D2S58HhvMLRC3+rkawPp2KXuMxhrgmV7wufv7y2JhgGr81olTVnO1H/rc1zxa
 1xS0taC1jUbnDdmjOl7lpOdMbdc9hedBmQUB0xIA0Hvf1DT1NEK2W0HEI1YdYN1e6Acx
 sIVcsQgH89aELyW3Dxb2xiEsfMUd0RQo91pEXnosZdcRt4Nk8rXd02a1lerGZnQ1tuVc
 ypD5+YyZvsUiNLIDZpc/kbKsGpSwPDorSDp662Pba97ZLUoa+ZVsuQrQBAOygiJXzz6h
 ijXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FMi8HIRU1bG/4UKbi/g8kAakUuymPAGSF1dal1jHofU=;
 b=bNfLlz6ISnBqD8ILOHNzyygH/Tst7hlMPrxVWfeTC/H2KGQR4t6d9dbSlfzd1JQhuF
 otst7J24Ut09nF4Lbu4n2xaAnWaTedNxAGreLPDf3hotI8sPjxfXjQ5/LOYGYkPuLucN
 cT0NUzZTnXZG2IbB+fMAETWNecsqOzq1x1XXSCZquIy4bKw+DCz58TDBEKIgHQ5D472b
 9DXeu8hrawbEdM7Cw6Z5Wb2iDvdQRy9uyM5z7o7YpynS4lPSEEYT1dQYdfQROTQfRbiA
 AFRYdFiykQAwSe2TC18svV7wvqqM2FSk+GEYJEk9Jv6gTZuiw20ob5DsmHRkqo66jjf/
 Blvw==
X-Gm-Message-State: AOAM533Q5uinzEZb83VLUqBS0H7k44obwE3SQnrrflEpPZ8X2e68Bmi0
 Bvc/7+/QAvybWnYupuhxKTlH/rrna74o9A==
X-Google-Smtp-Source: ABdhPJwnNaFD1edXu6LP5kTdhLILkBE9maEiAmnp1ujt7nO01MXFGDOlI/t55tREGWqTqwAeK2XUwQ==
X-Received: by 2002:a17:902:8344:: with SMTP id
 z4mr28515512pln.280.1593123220342; 
 Thu, 25 Jun 2020 15:13:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s23sm19673299pfs.157.2020.06.25.15.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 15:13:39 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:13:39 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Jun 2020 15:13:38 PDT (-0700)
Subject: Re: [PATCH] clk: sifive: allocate sufficient memory for struct
 __prci_data
In-Reply-To: <1592875458-5887-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-af462151-9be0-44c9-aeca-7777d4040d72@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
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
Cc: sboyd@kernel.org, schwab@suse.de, mturquette@baylibre.com,
 stable@vger.kernel.org, vincent.chen@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jun 2020 18:24:17 PDT (-0700), vincent.chen@sifive.com wrote:
> The (struct __prci_data).hw_clks.hws is an array with dynamic elements.
> Using struct_size(pd, hw_clks.hws, ARRAY_SIZE(__prci_init_clocks))
> instead of sizeof(*pd) to get the correct memory size of
> struct __prci_data for sifive/fu540-prci. After applying this
> modifications, the kernel runs smoothly with CONFIG_SLAB_FREELIST_RANDOM
> enabled on the HiFive unleashed board.
>
> Fixes: 30b8e27e3b58 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  drivers/clk/sifive/fu540-prci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
> index 6282ee2f361c..a8901f90a61a 100644
> --- a/drivers/clk/sifive/fu540-prci.c
> +++ b/drivers/clk/sifive/fu540-prci.c
> @@ -586,7 +586,10 @@ static int sifive_fu540_prci_probe(struct platform_device *pdev)
>  	struct __prci_data *pd;
>  	int r;
>
> -	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +	pd = devm_kzalloc(dev,
> +			  struct_size(pd, hw_clks.hws,
> +				      ARRAY_SIZE(__prci_init_clocks)),
> +			  GFP_KERNEL);
>  	if (!pd)
>  		return -ENOMEM;

This is on fixes, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
