Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9607AC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CF223DE4
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08CF223DE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DLNs0mxUSnUo4wwWUzPPEFZ8+sXv+P5yqw92sjPlmdU=; b=SiowXXeM13avezEA7bBcV1cCs
	83ANCwGPDuZ6ykorE5knfLuabaylMTAxP3ikDPVSbJRYwrv+rPBqO88po6eysooBG7H34VjCAwY2t
	cb2a4xl+N70XUWLL+gOxsdrnQQk0p9yS9tlZVUzCF7IRNjySGqxE6QyCAoDII3tuEIT4yiGWlQpts
	qkSGb3pEDrUzYXk3InPkXZZSKVjgbJD9QyBRn9aSDtcsk398kWs3MCE79QvJl9vqFagTUg4LoB1Je
	+MX4vR/1Afo7hYXn1F+5C5didnuuxq8FmDyV95sQDe/zUBSaI0DL5zxLAXtCQpeybCQnTEF16OFqV
	f9GB5qZTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXsP-00067E-Kd; Fri, 11 Dec 2020 02:09:45 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXsN-00066R-I5
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 02:09:44 +0000
Received: by mail-pj1-x1042.google.com with SMTP id l23so1512498pjg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vDb71w6uljZJayxlxiJgmuJdK657O4Ga+wyoAs72qjk=;
 b=IaFxJDeWY3IjASSHDaru//dwrwZwddeNAKJv3YQuDt9Z5vUTYce6N3n2sY4Bf0c957
 hwPzzvl/295YL2vbv7J3+v2tGny70sLdhhK9H5e1xYixjlTatjLA0IPi7P9nYXFOH0yF
 NTKPuV9VDL/1vWDK8FJpI5geUSgeLY5/+wwjGXqW9CDNVgqucENlTRVRxp6rVt62KYLO
 lTEAwqxMncm4g+GYwb0t+QKnnsB3ksgFwr/e8AM/CicJbxEb8m05RPAMLhLItJKt3aRR
 evlvIYZIv7Tmjlm0zIQ+lO2rUgKO9hRe8gX0rSRkc0jrd97CKOUXWum81Vccn+wxQkN/
 de1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vDb71w6uljZJayxlxiJgmuJdK657O4Ga+wyoAs72qjk=;
 b=kf0Csq3MVaenoJ2hrixjmxG39kYSm83ifwgAx4e+xqo1kgEqfZQGjdcgaNZX0QQ70S
 lYGw9MUMY7gL20SIMFeCXABJtisChBCYn41EcYzrm29/RXfSngVCCFTY1R7X1z4dSGYL
 6HFv4MSw6pWSSPSM4ePF+WFi5FAW7vPNph7DMALIPce1PRx/RSw7xYC6Jz+KeRnJ9gww
 1WJ961APfHJIKzsEBQZPJKxWC3jgFTDJlQvy9KIY99LbaWzpktgGMThRhiPXj+VFMUC+
 jgmvwSuryGgKfi8afY0d6qcDeSQhoq5S7siMGzXPOc3C7uIqMOOjq0+qiFsk0DYkPpn8
 3ktg==
X-Gm-Message-State: AOAM533FHSSqrf6lJZa9Xfl6j7LZrQNuKbySAXRuHBdNaiG9bafRVwrd
 YpVUbb4GG1BOosEFi4qnuvEllhPGw/xAz+/m
X-Google-Smtp-Source: ABdhPJyZX1D9EzbjZxwXU1FI05UoaddizqsnGZZuS/SqZXszdCZT/ZD1MhKs4XCMpNaq8wV1nPdGJQ==
X-Received: by 2002:a17:90b:19d2:: with SMTP id
 nm18mr11136016pjb.159.1607652581296; 
 Thu, 10 Dec 2020 18:09:41 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id er23sm8095980pjb.12.2020.12.10.18.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 18:09:40 -0800 (PST)
Date: Thu, 10 Dec 2020 18:09:40 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 18:04:43 PST (-0800)
Subject: Re: [PATCH v8 02/22] riscv: Fix sifive serial driver
In-Reply-To: <20201210140313.258739-3-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-b369aaef-f262-4ca3-bcda-5bd4ee893332@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_210943_669741_0066F2B0 
X-CRM114-Status: GOOD (  22.59  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
 seanga2@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 06:02:53 PST (-0800), Damien Le Moal wrote:
> Setup the port uartclk in sifive_serial_probe() so that the base baud
> rate is correctly printed during device probe instead of always showing
> "0".  I.e. the probe message is changed from
>
> 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
> base_baud = 0) is a SiFive UART v0
>
> to the correct:
>
> 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
> base_baud = 115200) is a SiFive UART v0
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/tty/serial/sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 13eadcb8aec4..214bf3086c68 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
>  	/* Set up clock divider */
>  	ssp->clkin_rate = clk_get_rate(ssp->clk);
>  	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
> +	ssp->port.uartclk = ssp->baud_rate * 16;
>  	__ssp_update_div(ssp);
>
>  	platform_set_drvdata(pdev, ssp);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

As an aside: is this an intrinsic property of being a serial port, or specific
to the SiFive driver?  We seem to multiply/divide by 16 quite a bit to convert
between baud rates and clocks, so if it's specific to SiFive then it seems
reasonable to name that constant in this driver.  If it's a serial thing then I
guess we should just do whatever everyone else is doing.

Don't think that blocks this patch, though, as it's all over the place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
