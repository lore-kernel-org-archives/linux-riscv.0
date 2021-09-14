Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF3CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 03:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFC260F6C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 03:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAFC260F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRf1A8UTO3m+gChgKTSXjN3qxgR1v4/1ht/jUDqChfg=; b=uAyaxZbc7WsFUpoXcscG8D8uvP
	lNoQWeL8/VhmIMJ4jy0vRkX3sS8ybrlzI759bgkC86N81EO3Xqwnuuk++LlcNtMgtwGdkUnE7WJoW
	7Rqrja1P9+ZIFOWCk19OrgGxUEBFBdVeM5su2t+oSnctb12qJtsIzuSn4EL3H4tEno/adDxZ1Jd0E
	VMRN/xWYYqZ15w22xf+jc7us0jJ+qWTL68C19WGuzrpQ2HKXdnWfHVmVHXBpwdxVHqlqHfHkiZCvw
	x3F/MuHmQ/cLztQQyNhx9mH+LynqQ/HxIMIV6fcPCPjrr8qgPVqmVCULW91H2dzz9dE+PzYyWcQ09
	aJwT5jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzSS-0045VT-OT; Tue, 14 Sep 2021 03:50:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzSP-0045TF-OS
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 03:50:07 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4A04E40260
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 03:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631591395;
 bh=HI7zQXcihg2fy5dwCYrDgeNZBtRGWofDhJtkvOD6HGQ=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=I7CqaaEWKD+u8Xx92tTRcf1W5088CiPYsB79UsJjNp5Ah8yYPxd0LvhyNFd8K7meX
 wUGuIcNWDaKOvbFHHGK+fhP2k84a44xC1Nf5AgDXOVCIyjYJ2mBOJlvTekVZuH1dCl
 8VSxjGRLsxwV83iwz61Zm9nOZKUGFTITVd0/XdAuZG177ztWMcWbMr8LcY8sE1Bjd6
 Tuxop2wJxRWgsaw0688ra/Q7qLQRe1r1WAYeDC0og57iqSRB0bW/nRVPAlkEoM3bp3
 MWk+uR1ERTe/BJErE0kEtijI6ST/ZZlPfzgC3MPDN/Yokh/IQVSAwgrxNn4+8vKnYJ
 BzYUQVgTYTBOQ==
Received: by mail-wm1-f72.google.com with SMTP id
 m4-20020a05600c3b0400b00303b904380dso268836wms.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 20:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HI7zQXcihg2fy5dwCYrDgeNZBtRGWofDhJtkvOD6HGQ=;
 b=lgMrVoFyzSRg8Cauv5QdmFnBiDjfDYJZep3OV4r/54fbXAbXHQxoJPJQP5XqzU9ZTK
 tkfy43OjDVzaiZNdfj+v7lBHQtwLJ0reo7WPT+Me+HqEXj8+xB62qSm9/zdYrVKdPkyC
 1oMTdPtlvvm8moS17LIKr1F4aAUcCmGLvPxMQmLQNXGGpIPBALuzJbef+JRZdyVX66M6
 NSrEeoHnMtTigTaKaYFYyST5O7ognMwj0P+l4CAnnjkaZEdvpT4D6NStP9LK1aKcaDu9
 MHtMWopfjsWub/+3saffXjispgCEgtYaT5XyHwsUUbQUz8bfsFXgd9wHsEB6tguQ6XIK
 rQeA==
X-Gm-Message-State: AOAM5327isLIsn8xA37yuLyyAHX9WYiEZx7x6qACVVK69rMABZJfQaFb
 a+YyxKvrsdE7KoCuS/VWSESYUJQicJ/5YioHN6c9N8N82NS1KQUAL6f5Al8EegIYysrIRsdG8Rm
 lKb1CIYqLJPG7wXC4gZMk5SgEHOmrRU6xMuqYPbYszsq9Jw==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr16188868wra.439.1631591394893; 
 Mon, 13 Sep 2021 20:49:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsO5Q5kY8Baak47Z/dM9JRQYNve65e5T72yYyoRiroYEO20cQg0HcDjZhu/ZwygPR7LKR/UQ==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr16188840wra.439.1631591394671; 
 Mon, 13 Sep 2021 20:49:54 -0700 (PDT)
Received: from [192.168.178.189] ([46.253.247.67])
 by smtp.gmail.com with ESMTPSA id q128sm10172520wma.27.2021.09.13.20.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 20:49:54 -0700 (PDT)
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: guoren@kernel.org, Liu Shaohua <liush@allwinnertech.com>, wefu@redhat.com
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, lazyparser@gmail.com, drew@beagleboard.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-ID: <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
Date: Tue, 14 Sep 2021 05:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913084520.kkbsupogkzv226x3@gilmour>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_205006_151418_62904C1B 
X-CRM114-Status: GOOD (  24.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 9/13/21 10:45 AM, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
>> From: Liu Shaohua <liush@allwinnertech.com>
>>
>> Add Allwinner kconfig option which selects SoC specific and common
>> drivers that is required for this SoC.
>>
>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
>> interconnect issues for dma synchronization, so we set the default
>> value when SOC_SUNXI selected.
>>
>> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Wei Fu <wefu@redhat.com>
>> Cc: Anup Patel <anup.patel@wdc.com>
>> Cc: Atish Patra <atish.patra@wdc.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Drew Fustini <drew@beagleboard.org>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>> Cc: Wei Wu <lazyparser@gmail.com>
>> ---
>>   arch/riscv/Kconfig.socs      | 15 +++++++++++++++
>>   arch/riscv/configs/defconfig |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 30676ebb16eb..8721c000ef23 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>   
>>   endif
>>   
>> +config SOC_SUNXI
>> +	bool "Allwinner SoCs"
>> +	depends on MMU
>> +	select DWMAC_GENERIC
>> +	select ERRATA_THEAD
>> +	select RISCV_DMA_NONCOHERENT
>> +	select RISCV_ERRATA_ALTERNATIVE
>> +	select SERIAL_8250
>> +	select SERIAL_8250_CONSOLE
>> +	select SERIAL_8250_DW
>> +	select SIFIVE_PLIC
>> +	select STMMAC_ETH
>> +	help
>> +	  This enables support for Allwinner SoC platforms like the D1.
>> +
> 
> I'm not sure we should select the drivers there. We could very well
> imagine a board without UART, or even more so without ethernet.

The draft of the RISC-V platform specification is available here:
https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-spec.adoc#uartserial-console

The specification requires in section "2.1.5.1. UART/Serial Console" 
that on platforms with a rich operating system (e.g. Linux) you have a 
serial console. Hence requiring 8250 support for the D1 CPU is justified.

In the riscv defconfig as of v5.14 we have:

CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
# CONFIG_SERIAL_8250_DW is not set
(Support for Synopsys DesignWare 8250 quirks)

CONFIG_SERIAL_8250_DW should be enabled (=y) in the defconfig.

As the specification requires a 16550 UART and marks 8250 as deprecated 
I expect that future Allwinner SoCs will move to 16550. Calling a 
Kconfig menu item "Allwinner SoCs" which includes all future Allwinner 
SoCs irritates me. How about CONFIG_SOC_SUNXI_D1 instead?

Why does the patch use 'depends on MMU' and does not 'select MMU'?

Best regards

Heinrich

> 
> These options should be in the defconfig.
> 
> Maxime
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
