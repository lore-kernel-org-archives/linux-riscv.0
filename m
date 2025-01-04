Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB264E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmIao0AYs3cu+JGQB7AYXb0zKCWjqlyjzqcS8/9N8t0=; b=eUPN1StRZFz1TP
	PjqpbI/8umD2BgHQcwYR6M9aUeP9rcCb5JuNEQVoj4ND/P90L2mlu5ObKB3Gy24BFM75bU2KnZjr9
	op9CILXc9rErl35+BOEocAUljKiNZp/dOh8r3zO8DZ6BbE3F8BsSmffHNLr7LJqD1eSJKNdsGb0Qv
	9DCsFhhoQGzMmblR6VuNpwLIj51Nv5uw05FEfoe6SBOOy5GelV3AjGu3ZhwogJgCmcXXncOhboRsF
	O+owoJBAvZBw+VtG4Y85hECTuXAJFOB7DMgLS3WQNjYc82m6bece/uTyvCh2NeYFmBqLENp/5Cu5P
	ioeUVWXd/mBbFiRpW8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBK8-0000000FcA7-16tL;
	Sat, 04 Jan 2025 21:04:44 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBK5-0000000Fc9N-0s2k
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 21:04:42 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id EB837B4B3C99;
	Sat,  4 Jan 2025 22:04:31 +0100 (CET)
Message-ID: <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
Date: Sat, 4 Jan 2025 13:04:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250104-mutilated-unpaved-008eebdb200a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_130441_397084_F64A9E20 
X-CRM114-Status: GOOD (  13.70  )
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

Hi, Conor  (added CC: Minda Chen, Hal Feng)

On 1/4/25 10:33, Conor Dooley wrote:
> On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
>> Replace syscrg assignments of clocks, clock parents, and rates, for
>> compatibility with downstream boot loader SPL secondary program
>> loader.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 48fb5091b817..55c6743100a7 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
>>   };
>>   
>>   &syscrg {
>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>> -	assigned-clock-rates = <500000000>, <1500000000>;
>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>> +	assigned-clock-rates = <0>, <0>, <0>, <0>;
> 
> Why is assigned rates here 0s, rather than the property just removed?
> 
>>   };
>>   
>>   &sysgpio {
>> -- 
>> 2.45.2
>>

Assigned rates all zeroes is how it is in U-Boot. Removing the 
assigned-clock-rates property as suggested does work in U-Boot and Linux 
both.

For context, U-Boot fails when replacing assigned-clocks to 
JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT (1500MHz) 
from Linux. So I tried to merge all properties together and in testing 
then U-Boot failed (or I did it wrong). However replacing the Linux 
properties with the U-Boot configuration (above) on Linux does work for 
both.

I do not know if this is correct but I can test any suggestions and 
report if they are working.

Do these changes make sense? Are there other variations I should test?

Thanks,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
