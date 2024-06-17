Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB97C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFHDtF5f7er5VIW/vrHF15mNvpLCavlaARvWoJGYZ2g=; b=uzz4/FG/Xh3vHq
	7zs9EKt1p+Q/0VQ7fGLbY0cTaH7FcteMsKbjaGZRFr57vls8Y+N2lwoZBeFxGUSvKrDxM4dEFTdMX
	f7sQAIz9eWVasomlZk4IYNEbDB9v/eJYm0uFG4tXZiJMxPiMovBU8mbxEvrc+Blfca+fIHPlJchTy
	7eMkP7g3QqlfY1OXzW7kizoHGngG/XMsUUJOoQAqvJFlSKYzzO+o8IyQFvgGSocdmnWaphEr8Gadr
	XmCkuhb/5jFAtzccC673J58fLKkuvjQz/3/Ccg337OnOmXZmDdRIzunzNFyY3q7/h3rk3JUwX+zV2
	BZCrzbAVydrg6hiU9M0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Tm-0000000A07I-3GCY;
	Mon, 17 Jun 2024 09:16:46 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Tj-0000000A04g-0pif
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 09:16:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53061FF804;
	Mon, 17 Jun 2024 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718615797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWiLB1H/el64qMPYokxKIuSo3yitbl9iDJ4QLffkaTM=;
	b=Kkao4WwsvjbCNWSEo1UTINUchJhVT+f/G3cY4QYNPK0h1XWnIHuanNcbPmm8oc3UfiQp3G
	MaEEKqw7Tne7mFSyz3Q2WqvguQd/sbEhvlBJBG1917rfvb2w3pAIQSFmIK9lRkh9JiXDho
	+kbm2cXY8gol3ubTrKgsySjvYeRPr4Vg3wwUjRE/F/SAbM3OX8Ec63toljJb5ZuIS4o+bA
	uNSkjrhxtqD3f9Y6BBV15BuX89QE8vtsbO0jBGysCbt0V7CCzuw0othg9vtWzeor+1sGwy
	brPnaujQcOB1JjqCh6nuyHNRNt4AtywZ2nFrgNbQIwhRVTkOPU/xbvE+4LS5qw==
Message-ID: <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com>
Date: Mon, 17 Jun 2024 11:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
 <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240616235829.GA4000183@ofsar>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240616235829.GA4000183@ofsar>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_021643_696653_6AA4F13A 
X-CRM114-Status: GOOD (  20.69  )
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



On 6/17/24 1:58 AM, Yixun Lan wrote:
> Hi
> 
> On 18:47 Wed 12 Jun     , Inochi Amaoto wrote:
>> On Wed, Jun 12, 2024 at 10:02:31AM GMT, Thomas Bonnefille wrote:
>>> Remove SDHCI compatible for CV1800b from common dtsi file to put it in
>>> the specific dtsi file of the CV1800b.
>>> This commits aims at following the same guidelines as in the other nodes
>>> of the CV18XX family.
> is there any URL of guideline? or did I miss anything
> couldn't find any discussion about this in v1
> 

Not explicitly, the fact is that I had to use a specific compatible on 
SG2002 for the sdhci (it is already defined mainline), I had to choose 
between :

1. cv18xx.dtsi : compatible cv1800b-dwcmshc
    cv1800b.dtsi : no redefined compatible
    sg2002.dtsi : overwrite the previous compatible to use sg2002-dwcmshc

2. cv18xx.dtsi : no compatible
    cv1800b.dtsi : compatible for cv1800b-dwcmshc
    sg2002.dtsi : compatible for sg2002-dwcmshc

As in the plic and clint controllers, the second option was chosen I 
consider this as a "guideline" and reformat the dtsis accordingly.

>>>
>>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>> ---
>>>   arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
>>>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 1 -
>>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> index ec9530972ae2..b9cd51457b4c 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> @@ -25,3 +25,7 @@ &clint {
>>>   &clk {
>>>   	compatible = "sophgo,cv1800-clk";
>>>   };
>>> +
>>> +&sdhci0 {
>>> +	compatible = "sophgo,cv1800b-dwcmshc";
>>> +};
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> index 891932ae470f..7247c7c3013c 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> @@ -288,7 +288,6 @@ uart4: serial@41c0000 {
>>>   		};
>>>   
>>>   		sdhci0: mmc@4310000 {
>>> -			compatible = "sophgo,cv1800b-dwcmshc";
>>>   			reg = <0x4310000 0x1000>;
>>>   			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
>>>   			clocks = <&clk CLK_AXI4_SD0>,
>>>
>>> -- 
>>> 2.45.2
>>>
>>
>> Hi, Jisheng,
>>
>> Is this change necessary? IIRC, the sdhci is the same across
>> the whole series.
> I tend to agree with Inochi here, if it's same across all SoC, then no bother to
> split, it will cause more trouble to maintain..
> 

To be honest, I agree with this to, but as a specific compatible for the 
SG2002 was created in commit 849e81817b9b, I thought that the best 
practice was to use it.

>>
>> Regards,
>> Inochi
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
