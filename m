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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F73C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:35:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5797B206D8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCzaGn2b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsAzBmpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5797B206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RFh88/UY4D+jdctXmpY0WQHxUbCfzr1WTauDiP/CiSw=; b=fCzaGn2bQEMiveeq1I8K+GKnx
	jLzAJXciIlxGST5XYFgqaPjgx3h6frW/JXppR78u12yipkmorJo38RfZaNJxcmAOMt/fNWpZBR28C
	bkdX5Fk6x1PLkkC4I53pVgvggFxeTtJP8tartPT1TOjsz4IZ4YrMOI2KXRrMXYEK4sVmG410q6HCw
	xyhMts1DDGpOTkRoifNK1yerIX7GCd57ad0brc56A43ML2WdahzDiKlT95Yd9+DSg/WPDVUdc7G2m
	Wo3hOvsxfesS7uOeR9xsM5MGoJlRhx7bnVuB5l5X5khlHAKiiP7cVwZYrdcIjE7ITbHxvKyMqqlPc
	gcXeKFZmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8Gq-0005Xo-Eb; Mon, 09 Nov 2020 14:35:48 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8Gn-0005Wh-L1
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:35:47 +0000
Received: by mail-qk1-x741.google.com with SMTP id r7so8042746qkf.3
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qXRA0PIh9f93SW3eTl4YxqYYi6eYj6ARKRU40lZ2pfw=;
 b=UsAzBmprlPnYpiglLtisTLBNsOfnjLMWNrcblHKQ9yWjvk0KGQoSqaBafOYHjFgXQr
 v9ZnYu0MmvDZUVdClEq5rymnLg9twHIdVzSBXCLK3bnOUpB0uvnWTxqtJ/sPxC9OH0aX
 ilnhPM5p/YLucQAzeKHcshXXM6ZWFeRa83FW/NmZDfk11srfmXmzjyK5VVKPrGDIMmgl
 NCJshjbM0IRa0LHvfbOoD1jcXbN7DH6DyQcEl+YVDvLdEZKDPp433Q0vFtQJBzv3kWGm
 VUsKxbf5n9zDWhI6U25fL0mtbdwzmZbKya5DWHbZ7fjYBabhs6BNxNV0rV3R1+Cm1XfR
 F8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qXRA0PIh9f93SW3eTl4YxqYYi6eYj6ARKRU40lZ2pfw=;
 b=clrAC7+CeOg2okGSon1a8rVSv967b6KXxAJO/l1KA1h3BJtNoy+ApExPNOUYqwUI8k
 /+T/JW7EpTrZ5f4JDNyLah+ICsjLrn9nDlT07ahAcCfkl46s56MEj/qnVrNDOVGIcIEp
 lTlAUemZ17B09wdvznGhrpvFKZRtx+gTUIpwub0eBBKCP6OARH6pKvEvTFu5cGoFqZxO
 OfAMsCe8J6l4RGzdifb4Bsv7y6lKk1+y6dUHSDN8A9fdmZX3H3KVHJpdgzNDd9F36SfB
 zhq2D6vUn201AjwPWnyFUHWMnLxqEE4eA1j0M4j3nkIN9QPNaNMAxd4drJKFYpAtgYxy
 zXfQ==
X-Gm-Message-State: AOAM533GZaI+nO0KbMoai9QieZuGVBHtAHNYmSCYLF3vr1XYr40qS3fQ
 87wRDsUzC0FUIV3WFeorE5U=
X-Google-Smtp-Source: ABdhPJz6akwrzQdTYDhmljXVQ13HwJuNaCPGswq4sMdxjVnric1/lydJL5eWVWczXFCUuRvLEolLqA==
X-Received: by 2002:a37:6fc5:: with SMTP id
 k188mr14326504qkc.317.1604932544138; 
 Mon, 09 Nov 2020 06:35:44 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id l34sm1437444qtc.20.2020.11.09.06.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:35:43 -0800 (PST)
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
From: Sean Anderson <seanga2@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 Damien Le Moal <damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
 <6dc6d52e-a39d-c351-5280-71b9e8eafe37@gmail.com>
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
Message-ID: <db69fa51-80fb-ba6c-97e8-82ebc650ffc2@gmail.com>
Date: Mon, 9 Nov 2020 09:35:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6dc6d52e-a39d-c351-5280-71b9e8eafe37@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_093545_827032_0F1FFBB1 
X-CRM114-Status: GOOD (  29.78  )
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
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/9/20 9:33 AM, Sean Anderson wrote:
> On 11/9/20 9:25 AM, Serge Semin wrote:
>> Hello Damien,
>> Thanks for your patches. My comments are below.
>>
>> On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
>>> Synopsis DesignWare DW_apb_ssi version 4 defines a 32-bit layout of
>>> the ctrlr0 register for SPI masters. The layout of ctrlr0 is:
>>>
>>> |   31 .. 23  | 22 .. 21 | 20 .. 16 |
>>> | other stuff | spi_frf  |  dfs_32  |
>>>
>>> |   15 .. 10  | 9 .. 8 | 7 .. 6 | 5 .. 4 | 3 .. 0 |
>>> | other stuff |  tmod  |  mode  |  frf   |  dfs   |
>>>
>>
>>> Th main difference of this layout with the 16-bits version is the data
>>     ^
>>     |
>>     e
>>
>>> frame format field which resides in bits 16..20 instead of bits 3..0.
>>>
>>
>> Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
>> manual for the 4.0x version of the core, but according to this patch:
>> https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
>> it has been ok to use the lowest four bits for DFS setting. Is the commit
>> message misleading there?
> 
> This commit message is a truncated version of [1]. Importantly, DFS is
> valid when SSI_MAX_XFER_SIZE=16. When it =32, then DFS_32 must be used
> (since DFS is constant 0xF). Since SSI_MAX_XFER_SIZE is a synthesis
s/0xF/0x0/

> parameter, there exist devices where DFS must be used, and also where
> DFS_32 must be used. 
> 
> [1] https://patchwork.ozlabs.org/project/uboot/patch/20201016225755.302659-10-seanga2@gmail.com/
> 
> --Sean
> 
>>
>>> Introduce the DW SPI capability flag DW_SPI_CAP_DFS_32 to let a
>>> platform signal that this layout is in use. Modify
>>> dw_spi_update_config() to test this capability flag to set the data
>>> frame format field at the correct register location.
>>>
>>> Suggested-by: Sean Anderson <seanga2@gmail.com>
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>>  drivers/spi/spi-dw-core.c | 8 ++++++--
>>>  drivers/spi/spi-dw.h      | 9 +++++++++
>>>  2 files changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
>>> index 2e50cc0a9291..841c85247f01 100644
>>> --- a/drivers/spi/spi-dw-core.c
>>> +++ b/drivers/spi/spi-dw-core.c
>>> @@ -311,8 +311,12 @@ void dw_spi_update_config(struct dw_spi *dws, struct spi_device *spi,
>>>  	u32 speed_hz;
>>>  	u16 clk_div;
>>>  
>>
>>> -	/* CTRLR0[ 4/3: 0] Data Frame Size */
>>> -	cr0 |= (cfg->dfs - 1);
>>> +	if (!(dws->caps & DW_SPI_CAP_DFS_32))
>>> +		/* CTRLR0[ 4/3: 0] Data Frame Size */
>>> +		cr0 |= (cfg->dfs - 1);
>>> +	else
>>> +		/* CTRLR0[20: 16] Data Frame Size */
>>> +		cr0 |= (cfg->dfs - 1) << DWC_APB_CTRLR0_32_DFS_OFFSET;
>>
>> If you extend the dfs field from four to five bits, then
>> controller->bits_per_word_mask field should be properly updated too.
>>
>> Alas it hasn't been done for the DWC_ssi version of the core. So I suppose it
>> should be fixed for the both of them.
>>
>> Just for the record. There are very handy macros for setting and getting bit fields
>> to/from a variable. This is a good place to use them instead of manually
>> shifting and defining the offsets. The macros are defined in linux/bitfield.h .
>> Alas this driver hasn't been converted to using them. So I won't insist on using
>> them here. But I hope someone will fix it sometime in future...
> 
> I second that request.
> 
>> -Sergey
>>
>>>  
>>>  	if (!(dws->caps & DW_SPI_CAP_DWC_SSI))
>>>  		/* CTRLR0[ 9:8] Transfer Mode */
>>> diff --git a/drivers/spi/spi-dw.h b/drivers/spi/spi-dw.h
>>> index faf40cb66498..48a11a51a407 100644
>>> --- a/drivers/spi/spi-dw.h
>>> +++ b/drivers/spi/spi-dw.h
>>> @@ -9,6 +9,7 @@
>>>  #include <linux/io.h>
>>>  #include <linux/scatterlist.h>
>>>  #include <linux/spi/spi-mem.h>
>>> +#include <linux/bitfield.h>
>>>  
>>>  /* Register offsets */
>>>  #define DW_SPI_CTRLR0			0x00
>>> @@ -72,6 +73,13 @@
>>>  #define DWC_SSI_CTRLR0_FRF_OFFSET	6
>>>  #define DWC_SSI_CTRLR0_DFS_OFFSET	0
>>>  
>>> +/*
>>> + * Bit fields in CTRLR0 for DWC_apb_ssi v4 32-bits ctrlr0.
>>> + * Based on DW_apb_ssi Databook v4.02a.
>>> + */
>>> +#define DWC_APB_CTRLR0_32_DFS_OFFSET	16
>>> +#define DWC_APB_CTRLR0_32_DFS_MASK	GENMASK(20, 16)
>>> +
>>>  /*
>>>   * For Keem Bay, CTRLR0[31] is used to select controller mode.
>>>   * 0: SSI is slave
>>> @@ -121,6 +129,7 @@ enum dw_ssi_type {
>>>  #define DW_SPI_CAP_CS_OVERRIDE		BIT(0)
>>>  #define DW_SPI_CAP_KEEMBAY_MST		BIT(1)
>>>  #define DW_SPI_CAP_DWC_SSI		BIT(2)
>>> +#define DW_SPI_CAP_DFS_32		BIT(3)
>>>  
>>>  /* Slave spi_transfer/spi_mem_op related */
>>>  struct dw_spi_cfg {
>>> -- 
>>> 2.28.0
>>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
