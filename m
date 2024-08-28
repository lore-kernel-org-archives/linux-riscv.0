Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA9BC54734
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZf68yT2VxFTN1GybBTIi2IO4VSoJK8LHLi50qz/Xtc=; b=rgeu9Md5qZgvQF
	6ImO1bEwhlyjPpc7vPif/JBcIRTBxBT2kptnbXMDW2DnOPMjp7DwUs4F2GA5thpxYXoaAfvSkN132
	/y+RbeGwBZbnbRsdRK20zuEG46CZEnWhC4xgJSysTS0os5wuoIA3mHzla5OauuxA13wtrTFyqKjl6
	m5tFQINVLS+QQQxDVISsNfl7Ka7NmmJtD5FiGiCiwuw+QygPzgYETMVJtLXnZ9SqA/RR/WOd0J6WK
	psu1N6dEauAA7HP9SvSH8Lo5FMBpQPDFKub/TXIJrPb+fY5ZBt67IYbcHR34SHjdM5ZsV2c4orGq9
	pujyXg6pUPKbSj10VIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDoN-0000000EUB2-1oE2;
	Wed, 28 Aug 2024 08:13:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDoK-0000000EUAV-47nz
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 08:13:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso273324b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724832828; x=1725437628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEeuJ6OEQj6tArNvQ3MuOMDLK/qII+FALymrAkia2Aw=;
        b=drXiN5QEm6fJmowtd1YzySdpvs/XJeZFq7w18yBXNGsmxpci6/jCxy+2xb05xxdznl
         FQFlbn+refFmcLJT8JK35QHaOyO6lRdbxvE/xxj0KPyI8Rfr1R7UM2QkrCEm/SOIrORS
         gaNVEtapunhheKWws0zsGuFrWq1tdSuv7HA2NksLT9GdgryHH+/Upw3EyQXKXXbbOCJy
         //lnp9LaVeDDWGCxk1hXza/qARwT8lUWy+spgRPR3SLLoGOuSY/7SoTJwira3Bhqu9yJ
         /XUhE/KUvRawcQ5uYmrC4dzoGp6eGKJYv1KfwS5Lk9U7AYMPWazm/TjJjDaylZelbtHl
         Beig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724832828; x=1725437628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEeuJ6OEQj6tArNvQ3MuOMDLK/qII+FALymrAkia2Aw=;
        b=NVcsqaGx5awXiJvCBfg9lsIaGkB10tHGOYyMCCljKwIOKat13Z18PzSeY75kDNS2su
         gpriGxiq1GQCLM/QAmvvv5BNlTza7XXSdv2w05f8RmGhb4xSdq7TfoxKJGt1hiKVlqmp
         KWm+xnNKK57O1kWYfN7Qadxs2fHWDaiJzltmUC3clpv33Aw+FGTeJZYPFH/uSyFK5p4v
         bn0oBSTtCXGbj13DHnt/p9C56P771jcpcqhPHiTPazGex+59p2Q0gl7Ygi/KNb2EQdp3
         Lp5eq5kAJgkxDc8YuFAVdKz3xYnGfl5ELBqeGEUnIeA3dXuy7ocB9Za029a0VCOnFO1p
         hGxw==
X-Forwarded-Encrypted: i=1; AJvYcCW0hzbm/leN5Tuc3fG92PWeL8ZV4E3GpjHavsYJwh7x8ZzfrHWThW711+qE3oYE0DyNSx2uY7/ogABF/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwICsrpwiHGoQkWZCCLhGXGweL4hqm68mDqf48sZDdUwU4L3GS6
	vnBb1eLt/yW8zrW2pydf7CtuSRUx6p5awVdT80KRr/kpjB+SPoYX
X-Google-Smtp-Source: AGHT+IFzeLbkxJqoDcVup/+Yq5NuZ87lSZ1xmGqjPADirUwgzOQ2oAhBgnGc7o6r9zLTS4dgJIKtAg==
X-Received: by 2002:a05:6a21:7783:b0:1c3:3d23:c325 with SMTP id adf61e73a8af0-1ccd1b54bdbmr1797433637.24.1724832827990;
        Wed, 28 Aug 2024 01:13:47 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com. [54.193.105.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422ecf9sm9641427b3a.20.2024.08.28.01.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 01:13:47 -0700 (PDT)
Message-ID: <1a689627-851b-4929-aaf8-3dcddb57af6b@gmail.com>
Date: Wed, 28 Aug 2024 01:14:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: sifive: prci: Add release_reset hooks for
 gemgxlpll/cltxpll
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Pragnesh.patel@sifive.com,
 aou@eecs.berkeley.edu, erik.danie@sifive.com, hes@sifive.com,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 sboyd@kernel.org, schwab@linux-m68k.org, zong.li@sifive.com
References: <cover.1724827635.git.ganboing@gmail.com>
 <e47b943c0f685cd028ebd477e97e1706f184a7b6.1724827635.git.ganboing@gmail.com>
 <20240828-duplex-skillful-752582090412@wendy>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20240828-duplex-skillful-752582090412@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_011349_070747_8FEF33F0 
X-CRM114-Status: GOOD (  33.86  )
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

Hi Conor,

Thanks for replying so quickly. See inline.

On 8/28/24 00:58, Conor Dooley wrote:
> On Tue, Aug 27, 2024 at 11:55:20PM -0700, Bo Gan wrote:
>> This patch adds the release_reset hook interface to __prci_wrpll_data.
>> During clock enablement, the function (if present) will be called after PLL
>> registers are configured. It aligns the logic to the driver in u-boot. When
>> there's a previous bootloader stage, such as u-boot, it usually enables the
>> gemgxlpll clock when trying to PXE/network boot. The kernel boots fine, but
>> we should not depend on it being our previous stage, and the logic within:
>>
>>   a. We (linux) can get directly invoked by firmware (OpenSBI).
>>   b. U-boot doesn't necessarily have to initialize ethernet and enable the
>>      clock (when not enabled in CONFIG).
>>
>> When the kernel is the first to initialize gemgxlpll, it must also release
>> the corresponding reset. Otherwise the chip will just hang during macb
>> initialization, and even external JTAG debugger will lose control over the
>> risc-v debug module. (Observed with my Sifive Unmatched Rev.B board)
>>
>> The patch took the dt-bindings and logics directly from u-boot with some
>> additional modifications:
>>   - Use __prci_writel after __prci_readl to have barrier semantic. U-boot
>>     has the strong version of readl/writel, but linux has the relaxed ones.
>>   - Use pd->reset.rcdev.ops to access the reset regs.
>>   - Split reset bindings for FU540/FU740 and use them directly, instead of
>>     looking it up through reset-names.
> 
> The macb driver already supports using a reset at boot time (see zynq and
> mpfs) if hooked up in the devicetree, why doesn't that work for you in
> this situation?
> 
> Thanks,
> Conor.
> 

That a good idea. I never tried it. It's probably a cleaner solution, and I'll
try it some later time. I used the same logic in u-boot partially because the
way how sifive people coded this up. Specifically, PROCMONCFG is set between
the releases of 2 resets. I assume there's some dependency between those regs.
If reset is triggered from the macb driver side, there's really no proper way
to set PROCMONCFG. Also from the FU740 manual, I can't find any mentioning
about PROCMONCFG. If it's not needed, surely it's better to just let macb do
the resetting. Perhaps I should wait for Sifive folks to fill in the gap.

Thanks!
Bo

<Removed Yash Shah and Pragnesh Patel. Looks like they left Sifive>

>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
>> ---
>>   drivers/clk/sifive/fu540-prci.h  | 16 ++++++++++++++++
>>   drivers/clk/sifive/fu740-prci.h  | 31 +++++++++++++++++++++++++++++++
>>   drivers/clk/sifive/sifive-prci.c | 23 +++++++++++++++++++++++
>>   drivers/clk/sifive/sifive-prci.h |  8 ++++++++
>>   4 files changed, 78 insertions(+)
>>
>> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
>> index e0173324f3c5..9d2ca18f47a4 100644
>> --- a/drivers/clk/sifive/fu540-prci.h
>> +++ b/drivers/clk/sifive/fu540-prci.h
>> @@ -23,9 +23,24 @@
>>   #include <linux/module.h>
>>   
>>   #include <dt-bindings/clock/sifive-fu540-prci.h>
>> +#include <dt-bindings/reset/sifive-fu540-prci.h>
>>   
>>   #include "sifive-prci.h"
>>   
>> +/**
>> + * sifive_fu540_prci_ethernet_release_reset() - Release ethernet reset
>> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
>> + *
>> + */
>> +static void sifive_fu540_prci_ethernet_release_reset(struct __prci_data *pd)
>> +{
>> +	/* Release GEMGXL reset */
>> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU540_PRCI_RST_GEMGXL_N);
>> +
>> +	/* Procmon => core clock */
>> +	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
>> +}
>> +
>>   /* PRCI integration data for each WRPLL instance */
>>   
>>   static struct __prci_wrpll_data sifive_fu540_prci_corepll_data = {
>> @@ -43,6 +58,7 @@ static struct __prci_wrpll_data sifive_fu540_prci_ddrpll_data = {
>>   static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data = {
>>   	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
>>   	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
>> +	.release_reset = sifive_fu540_prci_ethernet_release_reset,
>>   };
>>   
>>   /* Linux clock framework integration */
>> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
>> index f31cd30fc395..dd0f54277a99 100644
>> --- a/drivers/clk/sifive/fu740-prci.h
>> +++ b/drivers/clk/sifive/fu740-prci.h
>> @@ -10,9 +10,38 @@
>>   #include <linux/module.h>
>>   
>>   #include <dt-bindings/clock/sifive-fu740-prci.h>
>> +#include <dt-bindings/reset/sifive-fu740-prci.h>
>>   
>>   #include "sifive-prci.h"
>>   
>> +/**
>> + * sifive_fu740_prci_ethernet_release_reset() - Release ethernet reset
>> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
>> + *
>> + */
>> +static void sifive_fu740_prci_ethernet_release_reset(struct __prci_data *pd)
>> +{
>> +	/* Release GEMGXL reset */
>> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_GEMGXL_N);
>> +
>> +	/* Procmon => core clock */
>> +	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
>> +
>> +	/* Release Chiplink reset */
>> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
>> +}
>> +
>> +/**
>> + * sifive_fu740_prci_cltx_release_reset() - Release cltx reset
>> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
>> + *
>> + */
>> +static void sifive_fu740_prci_cltx_release_reset(struct __prci_data *pd)
>> +{
>> +	/* Release CLTX reset */
>> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
>> +}
>> +
>>   /* PRCI integration data for each WRPLL instance */
>>   
>>   static struct __prci_wrpll_data sifive_fu740_prci_corepll_data = {
>> @@ -30,6 +59,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_ddrpll_data = {
>>   static struct __prci_wrpll_data sifive_fu740_prci_gemgxlpll_data = {
>>   	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
>>   	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
>> +	.release_reset = sifive_fu740_prci_ethernet_release_reset,
>>   };
>>   
>>   static struct __prci_wrpll_data sifive_fu740_prci_dvfscorepll_data = {
>> @@ -49,6 +79,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_hfpclkpll_data = {
>>   static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data = {
>>   	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
>>   	.cfg1_offs = PRCI_CLTXPLLCFG1_OFFSET,
>> +	.release_reset = sifive_fu740_prci_cltx_release_reset,
>>   };
>>   
>>   /* Linux clock framework integration */
>> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
>> index caba0400f8a2..ae8055a84466 100644
>> --- a/drivers/clk/sifive/sifive-prci.c
>> +++ b/drivers/clk/sifive/sifive-prci.c
>> @@ -249,6 +249,9 @@ int sifive_prci_clock_enable(struct clk_hw *hw)
>>   	if (pwd->disable_bypass)
>>   		pwd->disable_bypass(pd);
>>   
>> +	if (pwd->release_reset)
>> +		pwd->release_reset(pd);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -448,6 +451,26 @@ void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd)
>>   	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
>>   }
>>   
>> +/*
>> + * PROCMONCFG
>> + */
>> +
>> +/**
>> + * sifive_prci_set_procmoncfg() - set PROCMONCFG
>> + * @pd: struct __prci_data * PRCI context
>> + * @val: u32 value to write to PROCMONCFG register
>> + *
>> + * Set the PROCMONCFG register to @val
>> + *
>> + * Context: Any context.  Caller must prevent concurrent changes to the
>> + *          PROCMONCFG_OFFSET register.
>> + */
>> +void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val)
>> +{
>> +	__prci_writel(val, PRCI_PROCMONCFG_OFFSET, pd);
>> +	__prci_readl(pd, PRCI_PROCMONCFG_OFFSET);	/* barrier */
>> +}
>> +
>>   /* PCIE AUX clock APIs for enable, disable. */
>>   int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
>>   {
>> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
>> index 91658a88af4e..825a0aef9fd5 100644
>> --- a/drivers/clk/sifive/sifive-prci.h
>> +++ b/drivers/clk/sifive/sifive-prci.h
>> @@ -210,6 +210,9 @@
>>   
>>   /* PROCMONCFG */
>>   #define PRCI_PROCMONCFG_OFFSET			0xf0
>> +#define PRCI_PROCMONCFG_CORE_CLOCK_SHIFT	24
>> +#define PRCI_PROCMONCFG_CORE_CLOCK_MASK					\
>> +		(0x1 << PRCI_PROCMONCFG_CORE_CLOCK_SHIFT)
>>   
>>   /*
>>    * Private structures
>> @@ -235,6 +238,7 @@ struct __prci_data {
>>    * @disable_bypass: fn ptr to code to not bypass the WRPLL (or NULL)
>>    * @cfg0_offs: WRPLL CFG0 register offset (in bytes) from the PRCI base address
>>    * @cfg1_offs: WRPLL CFG1 register offset (in bytes) from the PRCI base address
>> + * @release_reset: fn ptr to code to release clock reset
>>    *
>>    * @enable_bypass and @disable_bypass are used for WRPLL instances
>>    * that contain a separate external glitchless clock mux downstream
>> @@ -246,6 +250,7 @@ struct __prci_wrpll_data {
>>   	void (*disable_bypass)(struct __prci_data *pd);
>>   	u8 cfg0_offs;
>>   	u8 cfg1_offs;
>> +	void (*release_reset)(struct __prci_data *pd);
>>   };
>>   
>>   /**
>> @@ -290,6 +295,9 @@ void sifive_prci_corepllsel_use_corepll(struct __prci_data *pd);
>>   void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd);
>>   void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd);
>>   
>> +/* PROCMONCFG */
>> +void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val);
>> +
>>   /* Linux clock framework integration */
>>   long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
>>   				  unsigned long *parent_rate);
>> -- 
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
