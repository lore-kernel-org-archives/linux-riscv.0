Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C56C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B78206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="je17/fff";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4ZZvfCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B78206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z94xOnt7UDjV3vjXcKQfI2sMxTqjHldoaa4EFhMA/to=; b=je17/fff2AbFVT9OiELrJ86Da6
	iJc5UT51cELD8MeCC77jMQAXuB5jY3F+IPTarrF7JJ16xaTBFwKj6ZDn4lAPaGQ0rPHOSe88LXG/Q
	V7eT7X9kqjvvmZRvW5s3fOmj3fdPMv00VqmoL8TBN1Necoai8wC2QNfpXLHS4lknv8pHIY/AEX2BI
	kPRoDmUvlaz4v8oqLUpiCnPMDR7T5gWpPf4cFECWFZnhDxWWRk2N2aevugFfe/QAVnpXdpMdbgYaX
	ugzlexLMSGxRxQvgCro7KO4a13S3fNpK+7CSD/vdIR9UQ5CfY+/s+LYsMGrRikZmwlb0EBouwrkc2
	PIcGoGqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOM1-0003pp-PX; Sat, 07 Nov 2020 13:34:05 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOLy-0003pI-LT
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:34:03 +0000
Received: by mail-qk1-x744.google.com with SMTP id h15so3739187qkl.13
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cgygmZxcrPCaXUcxy5sWPsLyE59i3yYRAYjJcbg36cg=;
 b=P4ZZvfCj5FfPAh6P+CzmqyCBwg6kbvlcDf/0KQYIUFmcCoH96dUrKTT9dgPaa8nXr+
 QZuqlPuK6WemrdAczvusuEXIsqEROhVM2y10wIvvXxt1Rp+l1qjM/ASmi2AvNlByOXsW
 X1KY945fhjFilMlibsrAaEPpVwf4P3p4fQOR8yBeM6J2+oNZxdiuqrctY87LpW+8H98I
 wdoh5hu1AmpOIG0jv91TVqL01JvePdyuSoC1MI0LWKtsWN33orcp41VG0LpmCOibjAKF
 laErLeWQQ3UNyVHA5bEteRFTTWpm0CKnAoY3cZ+iHfvtYBz7pA0rKtGuTIc7YARaT2uT
 HpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgygmZxcrPCaXUcxy5sWPsLyE59i3yYRAYjJcbg36cg=;
 b=lECGjT9pfQbpZ6mqadKcLmm+jS8E29n+TY8RGVBc1ATyeGWgU0xNQLbjCjZS/olReH
 xQNrlU8BZeU2+GKyMNmQNP4h42Iqg2XsUrMuf8gpoBJn3dv9BAYsVeVkFgm2kPrYHjlU
 pxm0Ak6jyOj1j/1l3nX6FGjwjJzjmylh9dsCRSSNZFYJhjd6HkroLvniB19rSTJSBuWY
 /11HUmoGHKT/IeqnwwFV0JG23emZq66aD7XgOHY5u48oK+aZxD+BJcW6g22JksoxlYlm
 wyPUz1WQ40FUJVTIptgKU9XZ4iAoRoT6+pyvlP1A7wiEPq17V3CfNaC3qmRZmbD1mnw9
 ITYQ==
X-Gm-Message-State: AOAM533kz51WI+Hw294YkMRTxazLyayIMGWkmU2SDDLvkEsvx+C4jIqD
 eYwuHCyfvIHM2WRdd8ncESc=
X-Google-Smtp-Source: ABdhPJwWwStW9USc+7zEAiO3Ay8nV6LTJWVF1ojxBwaVaHGmQZV7m9sY6fFc75YFBHI4sY/TBgF16w==
X-Received: by 2002:a05:620a:1276:: with SMTP id
 b22mr552113qkl.256.1604756041288; 
 Sat, 07 Nov 2020 05:34:01 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id k11sm2480644qtu.45.2020.11.07.05.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:34:00 -0800 (PST)
Subject: Re: [PATCH 14/32] dt-bindings: Define all Kendryte K210 clock IDs
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-15-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <af85a79d-547f-b948-440c-756456576706@gmail.com>
Date: Sat, 7 Nov 2020 08:33:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-15-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_083402_762324_BC918686 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/7/20 3:14 AM, Damien Le Moal wrote:
> Define unique arbitrary IDs for all 44 clocks available on the Kendryte
> K210 RISC-V SoC in the header file include/dt-bindings/clock/k210-clk.h.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  include/dt-bindings/clock/k210-clk.h | 61 +++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
> index 5a2fd64d1a49..8d7ab2f0737c 100644
> --- a/include/dt-bindings/clock/k210-clk.h
> +++ b/include/dt-bindings/clock/k210-clk.h
> @@ -3,18 +3,57 @@
>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>   */
> -#ifndef K210_CLK_H
> -#define K210_CLK_H
> +#ifndef CLOCK_K210_CLK_H
> +#define CLOCK_K210_CLK_H
>  
>  /*
> - * Arbitrary identifiers for clocks.
> - * The structure is: in0 -> pll0 -> aclk -> cpu
> - *
> - * Since we use the hardware defaults for now, set all these to the same clock.
> + * Kendryte K210 SoC clock identifiers (arbitrary values).
>   */
> -#define K210_CLK_PLL0   0
> -#define K210_CLK_PLL1   0
> -#define K210_CLK_ACLK   0
> -#define K210_CLK_CPU    0
> +#define K210_CLK_IN0	0
> +#define K210_CLK_PLL0	1
> +#define K210_CLK_PLL1	2
> +#define K210_CLK_PLL2	3
> +#define K210_CLK_ACLK	4
> +#define K210_CLK_CPU	5
> +#define K210_CLK_CLINT	6
> +#define K210_CLK_DMA	7
> +#define K210_CLK_FFT	8
> +#define K210_CLK_SRAM0	9
> +#define K210_CLK_SRAM1	10
> +#define K210_CLK_ROM	11
> +#define K210_CLK_DVP	12
> +#define K210_CLK_APB0	13
> +#define K210_CLK_APB1	14
> +#define K210_CLK_APB2	15
> +#define K210_CLK_AI	16
> +#define K210_CLK_I2S0	17
> +#define K210_CLK_I2S1	18
> +#define K210_CLK_I2S2	19
> +#define K210_CLK_I2S0_M	20
> +#define K210_CLK_I2S1_M	21
> +#define K210_CLK_I2S2_M	22
> +#define K210_CLK_WDT0	23
> +#define K210_CLK_WDT1	24
> +#define K210_CLK_SPI0	25
> +#define K210_CLK_SPI1	26
> +#define K210_CLK_SPI2	27
> +#define K210_CLK_I2C0	28
> +#define K210_CLK_I2C1	29
> +#define K210_CLK_I2C2	30
> +#define K210_CLK_SPI3	31
> +#define K210_CLK_TIMER0	32
> +#define K210_CLK_TIMER1	33
> +#define K210_CLK_TIMER2	34
> +#define K210_CLK_GPIO	35
> +#define K210_CLK_UART1	36
> +#define K210_CLK_UART2	37
> +#define K210_CLK_UART3	38
> +#define K210_CLK_FPIOA	39
> +#define K210_CLK_SHA	40
> +#define K210_CLK_AES	41
> +#define K210_CLK_OTP	42
> +#define K210_CLK_RTC	43
>  
> -#endif /* K210_CLK_H */
> +#define K210_NUM_CLKS	44
> +
> +#endif /* CLOCK_K210_CLK_H */
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
