Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E3DC388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:39:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC36206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0u7hze//";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6tkULQ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC36206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGO3AKLWBv966dQ7FIYtSU9ogMY6rzc+wMPKYrnh9tE=; b=0u7hze//wbh3QlQAa/1jchcKGc
	0hQ1pIb6Kl3+lkUvXJi/JlGQaKwKAPneAqcM/avlPHZOaz6W5sytG96mL4KOH2is5JYWRykZUVWBL
	iIuxZJ/uwkhBpjjGpkJ8LzprnvVsGqF0CoYiF6DQny2stqlDj6trfPJRsxXLylz21u3uTGxgDTQAh
	zhAyGuze2zwzX2smyTL+ACL2SuFoU6qmTNGaH0T/BbFggFR4VwrM0WcXskm0lFheT+zUluedQovBD
	47YrXWRN6zy0e7tEUDJ+EGG5eNH65OiiJwEEZpB53ByD6CpcbfWUjC1tbdSJ3QWOvsUAXXbC950sZ
	XJzh4Jbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOQn-000482-RP; Sat, 07 Nov 2020 13:39:01 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOQm-00047Y-8z
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:39:00 +0000
Received: by mail-qt1-x844.google.com with SMTP id h12so2824488qtc.9
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mN57aF3uFwRKik5ZN1WZ9zgD6+iSPvQKkG2jBob0/z0=;
 b=L6tkULQ8G3ScoNOjbnTPIfkea8pDu9nEYT1Kc0JSpO/Ed9ioWMrlKrjdAwGpxsecMK
 mAQW80EpW6fU69D0iWnhUcesxXkgpfjvT4KfoIlsqb2W0XN24YMuAgRVfZUJMru3tqhR
 KX94LACPelo2ZX43b+A/AkapJ+rovZTsuDxz+zXsKzy+1i/bbXiTkMhOuiuhT9KyKTbT
 JBfytyG0zkaGupBpq81koZYCW6hNbmwf7shja3uUeCpQD7dft6WKVKanovpmmBRGXqvs
 AJi/NJLwXhItUj/icGDCffOcocLxgwrCnnRi+pdaC6uaT5ndfzVQ9SZdSMX8/8abE5mW
 hq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mN57aF3uFwRKik5ZN1WZ9zgD6+iSPvQKkG2jBob0/z0=;
 b=g+eEnTJZzpKq1qZ8WMwNT1hO1wEbJ+ZXz1jqvYBvbcQDwCtaG3Eg8VP5DhZt6AqG9q
 4UaKMJ+MZUF4uxIyMnx6b5zodqDe57sNdVtWF4zLri/lIgmlM3KP+mu2doQQlpG/TOX9
 PHjkJIameGEqoRYT6MolfSYl4ioOPwvFWNEZFm/UkMANSn7OvWR2JR30cS/WjqJSixyh
 CkU9fzjk6IQZ9jcdjJdOXkEjnu1L23vqYF4HuBU1EQNpS7OBs1C4rDYMUSZMWoXtkyj0
 Ktmk4G04ZlCao7NeVhzcWc2gWd65kGqmvzWEN2HMDw4U+rIhmKvvpHfwaNKm8zngY1R5
 e0ag==
X-Gm-Message-State: AOAM533sZAdPprDqFkIP48rcel0uJ9y9jkJIXfPGpHnpVvyGCo/IMqrs
 kFwlZmY6Sx+FMwLE/MpQUWk=
X-Google-Smtp-Source: ABdhPJyIp/972JuRNtCAX5kxeFqzif/DydCJUgMtgNi+VPFMt5+yf/OzzVRlPd5tDeGRlxNvkxENJQ==
X-Received: by 2002:ac8:6b06:: with SMTP id w6mr5912684qts.6.1604756338588;
 Sat, 07 Nov 2020 05:38:58 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id o19sm2566333qko.3.2020.11.07.05.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:38:58 -0800 (PST)
Subject: Re: [PATCH 17/32] dt-bindings: Define Kendryte K210 reset signals
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-18-damien.lemoal@wdc.com>
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
Message-ID: <c1d4e336-2f18-1c06-bfe8-feac9838532e@gmail.com>
Date: Sat, 7 Nov 2020 08:38:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-18-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_083900_345039_0D437B52 
X-CRM114-Status: GOOD (  17.81  )
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
> Introduce the dt-bindings file include/dt-bindings/reset/k210_sysctl.h
> to define IDs for all 30 reset signals available on the Kendryte K210
> RISC-V SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  include/dt-bindings/reset/k210-rst.h | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 include/dt-bindings/reset/k210-rst.h
> 
> diff --git a/include/dt-bindings/reset/k210-rst.h b/include/dt-bindings/reset/k210-rst.h
> new file mode 100644
> index 000000000000..883c1aed50e8
> --- /dev/null
> +++ b/include/dt-bindings/reset/k210-rst.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + */
> +#ifndef RESET_K210_SYSCTL_H
> +#define RESET_K210_SYSCTL_H
> +
> +/*
> + * Kendryte K210 SoC system controller K210_SYSCTL_SOFT_RESET register bits.
> + * Taken from Kendryte SDK (kendryte-standalone-sdk).
> + */
> +#define K210_RST_ROM	0
> +#define K210_RST_DMA	1
> +#define K210_RST_AI	2
> +#define K210_RST_DVP	3
> +#define K210_RST_FFT	4
> +#define K210_RST_GPIO	5
> +#define K210_RST_SPI0	6
> +#define K210_RST_SPI1	7
> +#define K210_RST_SPI2	8
> +#define K210_RST_SPI3	9
> +#define K210_RST_I2S0	10
> +#define K210_RST_I2S1	11
> +#define K210_RST_I2S2	12
> +#define K210_RST_I2C0	13
> +#define K210_RST_I2C1	14
> +#define K210_RST_I2C2	15
> +#define K210_RST_UART1	16
> +#define K210_RST_UART2	17
> +#define K210_RST_UART3	18
> +#define K210_RST_AES	19
> +#define K210_RST_FPIOA	20
> +#define K210_RST_TIMER0	21
> +#define K210_RST_TIMER1	22
> +#define K210_RST_TIMER2	23
> +#define K210_RST_WDT0	24
> +#define K210_RST_WDT1	25
> +#define K210_RST_SHA	26
> +#define K210_RST_RTC	29
> +
> +#endif /* RESET_K210_SYSCTL_H */
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
