Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00813C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPND1cpqNqgiukbtSRFQa8WNIR2UivGQkkb0ufeLFX8=; b=Azlh51D1SmsOGL
	SCkoBP/dcFnuD2noj5iUArYymmRHOp3Fkx89oA4iEvqHHzMeIQPb4FCxzpsbygMWcLMUqG0FOXNmF
	HcUqtojMf6a/2rZC4OAH7omLMpplypBD+F1kUaJ/0ShVaYVNLlrWhPmIIPIYpG+Cp3PR9wFaFtg4a
	10jzAfuT7P1y7KjolyLJI/G7Efqkie+0oL9YAaBBRqMRKfdyqJxHFQWfqSzZPRw+YIvAdMwfiHDqa
	pq3Dpt4qR3bCD2Azl+vqWN5HYEWHiTWdUCKg7/bHf895ZDqDxc0srQ6BKtnjjAV+js6sDCaFqs/fz
	9bMCwVsBzEaCFNXG4mBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHiw-0000000EYYA-4Bqc;
	Fri, 24 Jan 2025 11:19:43 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHiu-0000000EYXC-0gtO
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 11:19:41 +0000
Received: from [IPV6:2605:59c0:20f3:a400:5304:e921:4d34:736a] (unknown [IPv6:2605:59c0:20f3:a400:5304:e921:4d34:736a])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id BB842B4B446D;
	Fri, 24 Jan 2025 12:19:35 +0100 (CET)
Message-ID: <b62cfcc1-5d10-43a1-80ae-f09a53c739de@freeshell.de>
Date: Fri, 24 Jan 2025 03:19:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/3] riscv: dts: starfive: jh7110: add timer node
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250102204137.423081-1-e@freeshell.de>
 <20250102204137.423081-2-e@freeshell.de>
 <20250113-monotone-maybe-97ae1d171710@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250113-monotone-maybe-97ae1d171710@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_031940_383567_57446AEA 
X-CRM114-Status: GOOD (  12.34  )
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


On 1/13/25 10:39, Conor Dooley wrote:
> On Thu, Jan 02, 2025 at 12:41:21PM -0800, E Shattow wrote:
>> no idea if this does anything useful; not needed for boot
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 0d8339357bad..0bc922b3ae8a 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -344,6 +344,15 @@ tdm_ext: tdm-ext-clock {
>>   		#clock-cells = <0>;
>>   	};
>>   
>> +	timer {
>> +		compatible = "riscv, timer";
> 
> compatible has an extra space, so won't do anything!
> 
>> +		interrupts-extended = <&cpu0_intc 5>,
>> +				      <&cpu1_intc 5>,
>> +				      <&cpu2_intc 5>,
>> +				      <&cpu3_intc 5>,
>> +				      <&cpu4_intc 5>;
>> +	};
>> +
>>   	soc {
>>   		compatible = "simple-bus";
>>   		interrupt-parent = <&plic>;
>> -- 
>> 2.45.2
>>

That extra space is my error and does not exist in U-Boot. Good catch! 
So, when corrected it appears to boot either way with or without and not 
any change in functionality that I can discern. My priority then for 
this series is to drop this patch as something unnecessary.

Thanks, Conor!

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
