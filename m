Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C1AC02196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEGZnWzoovVp4oISOsV0xSDZRRtoaLwrWN9Hcwep6/4=; b=Z8squ+mcwcEakn
	i/YL1fTKwcPa6qibBDuTsvimzVdZZJmsaIOmbzLHzDUISDIMjCmZK8VxWSR+9jgKw3O/F0UymSqgR
	Nb1H5WHXf8C4Y0NMFmBrR28wjgyhMQ85vnm2e0QA5qlqhdSXy03Rx2DfQvBEtW9yOnqW7G1M9l0EE
	nGOm4mNYSfWyE1oik8lk1+rQu0cH4q4U0qiu9xCJuChq6Zl3Kjdxqs5r9kbJN8WWHbzgt0SIdNbfj
	BcoU2O9HSxopciCbiX4/o5pp65rDe/Ba1QioQl1ge3PoMyhuvj/Hityv/Zcj3OR0tGAj/VbM7oTNK
	HhGcfEjSBxMaQnH70QTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJnM-00000008pfY-0PnV;
	Fri, 07 Feb 2025 08:33:04 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJnG-00000008peg-3Rai
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 08:33:02 +0000
X-QQ-mid: bizesmtpsz4t1738917093t6p35lw
X-QQ-Originating-IP: F3vYl0ctFhV2QVNdxoiZ+gl2R3+YyxEuwE/J1iVBRD0=
Received: from [192.168.60.235] ( [183.27.97.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Feb 2025 16:31:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5179800746963532279
Message-ID: <05B9953079BA21AF+fffef577-a880-4ed6-a71b-14ec82aeea97@linux.starfivetech.com>
Date: Fri, 7 Feb 2025 16:31:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: E Shattow <e@freeshell.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
 <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: M1zv3ViCPTTk1ePHphXj+cnm8Qo/jTgUWdS6Pm1n8ejKocCSbm4th2Qm
	Pr2D7NLHdDlicoStsbKRSHlXRqFVnDW8aVfSiAv+nLeIWFX2G0G+bptMAs868FEeLH6f9Y2
	W1gUkWZrpH4PKlLH6Uc5vRu1CD+/SS1yBhWu1bcB4UsnIHMeIkTkCKMEYYfeLbFjlccorSm
	vEgj6WSyZfIpx2L/SKedQyu5z+ZGDxYIlGtCbTwvQZDove7A/HRLCf/D4DSdmFo6WLZgWr9
	dDC7Lfn38xwKn7CQ8o3kzlRAKlaei0HWBBhClQdjcANi0r7QZAIK1cscDARoaRrW0RX36z1
	QIxt2iA/mfkkvNBoTs/DPDYjYn26ClkgTFwOTPWoMPTI3o+7F8BkDpFml4U8rKnRiXQm+dp
	Fm7+OsF1XW33kBqlvegxFdjCz5yaKjnzeAF379HXXdWC7S0qG+EX1MhfPQ7j5vWP3O7yfgz
	H0f/a04C60mWi0lsaFDKBFB6s8aU5dW4ORfP13b8ER4NR1zeZMKQnMYDE9ZcnKpIgogk3PH
	QsJ76gBBFhmvnPLhCKQTfoAof9Azy3oyc+Efrp9zrIUxAexZOQbiPXXrzg3wd1paJdoIvgH
	8WpDmD08PjZJ9Y3erdt36bev8toaSmgm2sQomogABj+v4+bvXzcIZ9hcP0NiuXrYHRjbdAx
	CcnWdGbm/DmvK0nG9p6hyRdZojiSj+JQprUexpHPgbquv0CCF7SNKJWffl1DWgYoHaI4tpK
	A2oYqoa3U65HIOO1arBZ+djfbr2h7Yna8yGoVCuE2V35ubjW1OdS1Y6wNvaHqb/v+RkjL99
	mMC0J4IvbxOqtCygFjoCJoJ1/NyxtXZoGeSlYH0H7A6EEkyTWHzsp7LH/I/2+Vr/Zci82o2
	hcNiKULaLZ5O6rp1WUaDo0WFkAHbd1xepzJYxvmmn0QrgQ5y2az0Tjx7wTOLYAfgF5Kaxls
	MQUeCIYE3j4TFrHVWX4axSiVaHzft38448Lg=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
/bin/ln: failed to create hard link 'reaver_cache/prob_good/20250205_045309_156119_468548BF': File exists
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045309_156119_468548BF 
X-CRM114-Status: GOOD (  28.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/5/2025 8:52 PM, E Shattow wrote:
> 
> 
> On 2/5/25 02:16, Emil Renner Berthing wrote:
>> E Shattow wrote:
>>> Replace syscrg assignments of clocks, clock parents, and rates with
>>> default settings for compatibility with downstream boot loader SPL
>>> secondary program loader.
>>>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>> ---
>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> index 48fb5091b817..a5661b677687 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>>>  };
>>>
>>>  &syscrg {
>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>>> -	assigned-clock-rates = <500000000>, <1500000000>;
>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>> 
>> I think Conor asked about this too, but you still don't write why it's ok to
>> drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
>> respectively. You should add this to the commit message itself.
>> 
>> /Emil
> 
> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
> the frequencies and increasing core voltage was ever needed.
> 
> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
> 
> Since [1] I have had problems with several passively cooled Milk-V Mars
> CM Lite systems powering off due to thermal limits. My experience then
> is that the specialized 1.5GHz operation is not appropriate for all
> JH7110 CPU board layouts and applications.
> 
> Hal says I failed to get these assignments in Linux to work in U-Boot
> because U-Boot doesn't have driver support to increase CPU voltage, and
> Hal offering to add this to a driver in U-Boot... but that's the wrong
> way around in my opinion, unless there's some defect in the JH7110 CPU
> that it won't run reliably with hardware defaults.
> 
> 1:
> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
> 
> What is the correct thing to do here?
> 
> -E
> 
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A24C02192
> 	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 13:10:59 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
> 	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
> 	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
> 	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
> 	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
> 	List-Owner; bh=GY86gaXkDRjEBAUNvogHkHuyO230wjLSabDM8v7zKQQ=; b=Un7uhhDTAT8/9N
> 	FxyCZTIeuEf9Tz2EWguoSASPTIRzVsA8OD+zansoq7n0Em+ejnESLoVicWRdNflaSCojelA6mxlZr
> 	79fy10oRgiIKMOAb1fwJcsq+rGF8jSdXwi0a2zKjGYb4u4ZNy/uLBiIynsSH/VCYysTKQK6p7wAiC
> 	7RYsK3WfvbZKMTBmH2vKxA7ERtfZGfNAJqRjHzBM06+ZfEDf9V2UQ3pGUdGPoTZYkQoS8smFEx47Z
> 	U3KclAiQD6NRzOmPD/VXwUGXQEpLonSaLk7kbAdo3cWww6Wyou3w4XqxHQpym6FyLsKAWWSk7d4vx
> 	ZbYQckPNKc65NmLst1TA==;
> Received: from localhost ([::1] helo=bombadil.infradead.org)
> 	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
> 	id 1tffB9-00000003Lk1-2ly8;
> 	Wed, 05 Feb 2025 13:10:55 +0000
> Received: from freeshell.de ([2a01:4f8:231:482b::2])
> 	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
> 	id 1tfetw-00000003I2R-42Et
> 	for linux-riscv@lists.infradead.org;
> 	Wed, 05 Feb 2025 12:53:10 +0000
> Received: from [192.168.2.35] (unknown [98.97.25.24])
> 	(Authenticated sender: e)
> 	by freeshell.de (Postfix) with ESMTPSA id 7ADA8B4C01E1;
> 	Wed,  5 Feb 2025 13:53:01 +0100 (CET)
> Message-ID: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
> Date: Wed, 5 Feb 2025 04:52:59 -0800
> MIME-Version: 1.0
> User-Agent: Mozilla Thunderbird
> Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
>  syscrg clock assignments
> To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
>  Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
>  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
>  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
>  <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
>  linux-riscv@lists.infradead.org
> References: <20250203013730.269558-1-e@freeshell.de>
>  <20250203013730.269558-2-e@freeshell.de>
>  <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
> Content-Language: en-US
> From: E Shattow <e@freeshell.de>
> In-Reply-To: <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
> X-CRM114-CacheID: sfid-20250205_045309_156119_468548BF 
> X-CRM114-Status: GOOD (  16.14  )
> X-BeenThere: linux-riscv@lists.infradead.org
> X-Mailman-Version: 2.1.34
> Precedence: list
> List-Id: <linux-riscv.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
>  <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
> List-Post: <mailto:linux-riscv@lists.infradead.org>
> List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
>  <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
> Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
> Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
> 
> 
> 
> On 2/5/25 02:16, Emil Renner Berthing wrote:
>> E Shattow wrote:
>>> Replace syscrg assignments of clocks, clock parents, and rates with
>>> default settings for compatibility with downstream boot loader SPL
>>> secondary program loader.
>>>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>> ---
>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> index 48fb5091b817..a5661b677687 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>>>  };
>>>
>>>  &syscrg {
>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>>> -	assigned-clock-rates = <500000000>, <1500000000>;
>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>> 
>> I think Conor asked about this too, but you still don't write why it's ok to
>> drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
>> respectively. You should add this to the commit message itself.
>> 
>> /Emil
> 
> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
> the frequencies and increasing core voltage was ever needed.
> 
> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
> 
> Since [1] I have had problems with several passively cooled Milk-V Mars
> CM Lite systems powering off due to thermal limits. My experience then
> is that the specialized 1.5GHz operation is not appropriate for all
> JH7110 CPU board layouts and applications.
> 
> Hal says I failed to get these assignments in Linux to work in U-Boot
> because U-Boot doesn't have driver support to increase CPU voltage, and
> Hal offering to add this to a driver in U-Boot... but that's the wrong
> way around in my opinion, unless there's some defect in the JH7110 CPU
> that it won't run reliably with hardware defaults.
> 
> 1:
> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
> 
> What is the correct thing to do here?

Please see my reply in
https://lore.kernel.org/all/ZQ2PR01MB130736F5C893337606FD6937E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/

Thanks.

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
