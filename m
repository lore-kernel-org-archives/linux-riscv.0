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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9715C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F351206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgExj76n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmorHa1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F351206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIpdbMXTOalO57LUhSo+mJ3iGDY4CnyWYybTDM/N3Qg=; b=NgExj76nH5SZLkIUAU3dIrC7bo
	eGe3fLLC/SMCsP9mvzS6uLNGnLGBnwjuI1NlpsOWjFEfDpaUAMjwmuSYwh+PD+5S1p9SThHIzOMTL
	Ihu1hqfyFWcyCxLnaGEe1ULo5WFCHUpt8xfMT9pK1OItWROeBH67WLSBKNKPvJuZqA36CcvlFcNch
	WcRng2vnNqikqOBTo1YN7+gW9Yp+iZsHgLSf2dlC7TWQAwQn02SvlvkoG1Tb62oqbVFxmNHMHI2zZ
	JaT92WsR6SGro9huOLLrYi851/l6BBrFCdKUYWdqx7ElX1ba3cYuCWjtB04mjENekM263xQhqWtvd
	NkQ7Od4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOMJ-0003sN-7W; Sat, 07 Nov 2020 13:34:23 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOMG-0003rW-PU
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:34:21 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 13so1819423qvr.5
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=44ZrDKfH3x7ZWkU/9cqJtBpMieXFvYfttGTFzMae91Y=;
 b=OmorHa1pXiHiyQxGplOwQtnzxGiWgKgTCwHvH5vfY0F7IuYfik5JlUEyg4Zp+NGMBM
 sk68SwanQsEpg2n2OXw2114orITDj2nJ2JCf/LmRs6BydxxIuTFZCveOYG5Z39N96sL/
 at+bD+9lSBUQtl7/Czl6HTbh5X6T4LmvG7TCj+91U6m7PV4Lf7iNS6jzil/HPxJtHE9d
 UrpR/IuJPXZ4MowAP2QuFhpSnmIi2s76g355owIAd1pQ9pDdSDUL6c4DXBZYs7BC7ybI
 5X3cweZXxpwy3Xt/22LZJoboEsGnoDoVZ8gZEiSyyb8X86YcSqFK/cGqgr6WcXugPyDL
 khkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=44ZrDKfH3x7ZWkU/9cqJtBpMieXFvYfttGTFzMae91Y=;
 b=V1T99hSjxkkAw42r8kCTqrTdeOlkXaoWziCIPsC58bzdawsEaN0RdRan5beo3ZTw7e
 4noLVye8v5kMKlLQZY1qqQqX5o5YegzBnuS3FnQgodCOkx1tp+bW/oSa9D5E/dMEdc59
 9KbJPMV5RaqRSyXJwdW8eR0FzUkqHXeRXJu7Cw9ZtD7dBR4Ug7q8nn45iXuaUuUk4Q2a
 NP1apsKG14oYO6n/+0WKqYB8YAiFoV9muh0TbQsFkjCEbC7lPRrzNPEsffy9SIpoEc7z
 nwTaP8UgAKuugO1un7bsL4uX2E/nklx2PTxmWhoiTitkzZ9Hhuay5GD+04pAnLsO02WS
 VciA==
X-Gm-Message-State: AOAM530dukKgnQnJKyuSgPxCtGsbZfPNDGcEnMLeNBMliHERXIDOpDS8
 zArpcM1vI02D5sfv+oUEhcc=
X-Google-Smtp-Source: ABdhPJx4/Iu1kjdK7aNO5xPmFgJDKkeSY6ycB+bhid2xfRsbEvur41S7FP9EbPhN2X1JGHjYDjv9EQ==
X-Received: by 2002:a0c:fa50:: with SMTP id k16mr6129700qvo.41.1604756059104; 
 Sat, 07 Nov 2020 05:34:19 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id z2sm2588780qkg.76.2020.11.07.05.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:34:18 -0800 (PST)
Subject: Re: [PATCH 15/32] dt-bindings: Define Kendryte K210 sysctl registers
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-16-damien.lemoal@wdc.com>
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
Message-ID: <7d8a869c-df9e-7a26-4049-8de543dabe33@gmail.com>
Date: Sat, 7 Nov 2020 08:34:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-16-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_083420_863328_9DCE0630 
X-CRM114-Status: GOOD (  19.29  )
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
> Introduce the dt-bindings file include/dt-bindings/mfd/k210_sysctl.h to
> define the offset of all registers of the K210 system controller.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  include/dt-bindings/mfd/k210-sysctl.h | 41 +++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/k210-sysctl.h
> 
> diff --git a/include/dt-bindings/mfd/k210-sysctl.h b/include/dt-bindings/mfd/k210-sysctl.h
> new file mode 100644
> index 000000000000..5cc386d3c9ca
> --- /dev/null
> +++ b/include/dt-bindings/mfd/k210-sysctl.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2020 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + */
> +#ifndef MFD_K210_SYSCTL_H
> +#define MFD_K210_SYSCTL_H
> +
> +/*
> + * Kendryte K210 SoC system controller registers offsets.
> + * Taken from Kendryte SDK (kendryte-standalone-sdk).
> + */
> +#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
> +#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
> +#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
> +#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
> +#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
> +#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
> +#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
> +#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
> +#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
> +#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
> +#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
> +#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
> +#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
> +#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
> +#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
> +#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
> +#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
> +#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
> +#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
> +#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
> +#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
> +#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
> +#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
> +#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
> +#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
> +#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
> +#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
> +
> +#endif /* MFD_K210_SYSCTL_H */
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
