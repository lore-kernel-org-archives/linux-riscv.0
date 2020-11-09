Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2101C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:10:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66FB92068D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1nAopg4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="un3OsxyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66FB92068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2sXo/TXJJPFk0A8JNqiAmRCqj93tKvPpDTO7O+6ofxY=; b=g1nAopg4SDxLff1Wmn9udYwr/
	uc2/zb1fQ8tw/OYPHIckbW6o8BxCUyBzG+c9uHrA73dikFYBQgg8WfDcMapNq0zg6/xNArs6HTdi8
	pJ4M0Lmt5n+zaKQibFE0GJxrT4C7O1sLqHZEBwXz5G7a+DSJ3ZtG6igpSdxrv6TVJzMtEwhkuks3W
	BvrCB63JP6fiqpDIyqbV5aBi5bgvIEorLnrUkdCIlrKr4Ure8BoF1rPvDAM2JptMsa0owC4WNDIQ7
	Hxzc44w8CNDgrXIAGhGSZ6zyiSoafbQVA46cybOKfBYqaDJcnbUJ2Y9X1tz/D2C2tIzmzq2FJ/7Mr
	Gh6a6tXgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFMn-0006p5-O6; Mon, 09 Nov 2020 22:10:25 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFMl-0006oZ-3F
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 22:10:23 +0000
Received: by mail-qk1-x743.google.com with SMTP id y197so9576793qkb.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 14:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H0PQ6nyLYrfffzbRL92Wcmyqh/B5owqtAHhzB8+J5mM=;
 b=un3OsxyTQew89BMnf5RxUUNkXvjQYFjMyu9i99n7lkmO2jC+R88urYmD/z7geCeVB4
 LGQrOyhf3zQcDcCnJRPlW/CSiUI/ESp00a3OOGZN0IjMX1RNWdxO/CnxmfRPfoHARPg2
 MKQ6q7NqZ5XAeRsgLXzK413k8Ru0QWs8p8ZRja+IvQz7TMe1FSipb0ZHZqt54uMJ25H1
 pJfrnAmIsB/6hBqJkDU11Th2Qsxzjwh4CAZaPC+6dD54pUN1EqI1y98dNlWUtHIj3h/4
 Splsf3IXqlcizsoo+REF5NJSW85edH0/M3bA/qHP7mfxijxAtDoowdEJipI1hi0Nb75n
 Ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H0PQ6nyLYrfffzbRL92Wcmyqh/B5owqtAHhzB8+J5mM=;
 b=uJVaGfLhjTYfCJ6TBgUO17oI+xJd2VcmlEYDS1IXMyMOKuwSoTI+wBT6WgvhDbg3bB
 OfkQhOVFSG8YBwhc8eazFSlMwDdULcStSLNlBIJFT91j7uukPV+aK4mnkyth3MDUf9bP
 fKRLGkPdWP71hUToiLW0d62j0qJoqoG4qHWIeFPPKbWhBAO5uGFDnYw+Zd7J1/OLHHe4
 iZxwr4tNJAoG8olaDUjJS2T1nOTRpZJuOy2X13u/6AFr6JUMINAioynWjWwbmhFZ2X2Y
 XlfWEbJQakbHgZ1QK1CjMpAHG/9cGq8Kxr90DI9DyDwDf+L+lc+z6fxQqJstGGcExbal
 x3mw==
X-Gm-Message-State: AOAM53171jommIsxahGx/5vgDN4iBkajQ19HR4j1TsDrrabb0aeOKdlR
 tv4DzoeIQqomSlpGwujeJjY=
X-Google-Smtp-Source: ABdhPJyrw67HyLeeROH8ErKI8NEgL0YMxtjGYRNFy5TuUE5m/WkUtUwyhFHei5Fji+8zhX1Cn0ivgQ==
X-Received: by 2002:a05:620a:b13:: with SMTP id
 t19mr15341378qkg.3.1604959821374; 
 Mon, 09 Nov 2020 14:10:21 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id o4sm6593550qti.97.2020.11.09.14.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 14:10:20 -0800 (PST)
Subject: Re: [PATCH 15/32] dt-bindings: Define Kendryte K210 sysctl registers
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-16-damien.lemoal@wdc.com>
 <20201109215913.GA1828781@bogus>
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
Message-ID: <9e0bf865-99ff-3ca4-c693-34fb3d155c80@gmail.com>
Date: Mon, 9 Nov 2020 17:10:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109215913.GA1828781@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_171023_158452_1B720A91 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/9/20 4:59 PM, Rob Herring wrote:
> On Sat, Nov 07, 2020 at 05:14:03PM +0900, Damien Le Moal wrote:
>> Introduce the dt-bindings file include/dt-bindings/mfd/k210_sysctl.h to
>> define the offset of all registers of the K210 system controller.
> 
> We generally don't have defines for registers in DT.

At least K210_SYSCTL_SOFT_RESET is necessary for the syscon-reboot driver.

--Sean

> 
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  include/dt-bindings/mfd/k210-sysctl.h | 41 +++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 include/dt-bindings/mfd/k210-sysctl.h
>>
>> diff --git a/include/dt-bindings/mfd/k210-sysctl.h b/include/dt-bindings/mfd/k210-sysctl.h
>> new file mode 100644
>> index 000000000000..5cc386d3c9ca
>> --- /dev/null
>> +++ b/include/dt-bindings/mfd/k210-sysctl.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2020 Sean Anderson <seanga2@gmail.com>
>> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>> + */
>> +#ifndef MFD_K210_SYSCTL_H
>> +#define MFD_K210_SYSCTL_H
>> +
>> +/*
>> + * Kendryte K210 SoC system controller registers offsets.
>> + * Taken from Kendryte SDK (kendryte-standalone-sdk).
>> + */
>> +#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
>> +#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
>> +#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
>> +#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
>> +#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
>> +#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
>> +#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
>> +#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
>> +#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
>> +#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
>> +#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
>> +#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
>> +#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
>> +#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
>> +#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
>> +#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
>> +#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
>> +#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
>> +#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
>> +#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
>> +#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
>> +#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
>> +#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
>> +#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
>> +#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
>> +#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
>> +#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
>> +
>> +#endif /* MFD_K210_SYSCTL_H */
>> -- 
>> 2.28.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
