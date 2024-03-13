Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646F1C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZ3jDyCmcToUyGyhsOeuHq/gYGgvlXPEVHyNfinAeBI=; b=lMe0HFcpJox5kS
	5tzyEOl/ed3wgsWC56Ko+Sl87Zp1vKFV74w0nGFMWOHHC1RZ6IsXT3DRvl08NVojq/0onJKtwwBZ1
	5t9peRs23v8FTZxy1E0bNh//+RlXbG+o+sDIVtITF38E1X9eFR406gFXMk9UJSgIzxo4gredlwWuw
	LoSQ258Ht//ZcApvOb4WuIi/rSTU1v8DrOYNGpveHSPUwnOGV0j27jv7uVhNWOxrcEHXqz+PNiv/1
	9P5RITAM2XepOTU0N6Wl2exp8S+Ww1SKgaGra71uwuys2XIUabEUEKpGuHjYAM3oG4Ii55rNCAPmf
	OdMhJH5NViJHYNvXNwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkWS8-0000000C0SC-0BLb;
	Wed, 13 Mar 2024 21:48:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkS0r-0000000AutU-247z
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Mar 2024 17:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4mRSPJZDse+FhtPX2JihRkhT/GhaNNgYU4Y77qF9Kzw=; b=kYQhXJqrtFReqC45Zp0qQYqHQv
	KWg/ZFQEoSRg7FR76XnmTIAicrQAoz851WY0K18R/FrwdxVwwg2303ykubmh6epVyD9vRGcndqTR+
	QZkaMx8oK/UoLBMTdyjazJ9u/ieyvqu3UrXYePrw5as/yY2F8uwg7/HciJlgSiDJPaM8cCTfZi10x
	cYjOy/es+kMDrc/MIgB0GG2lLW3xYQEJ1/FROUhP5ueQqu3VXoksSb/1cg44m56Lrj5LVocaX1CHT
	/fk7+dH0lh2LUirqbcfBR23lafhQuQMdBNzNddH7DMJ0MIwKLC9utp8Pg+4yvvqYieZwIKhsT1RsC
	RDoGBv+g==;
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkS0l-0000000A5xf-1DPh
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 17:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1710349389; bh=4mRSPJZDse+FhtPX2JihRkhT/GhaNNgYU4Y77qF9Kzw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=I87OE8RHR/r0sUnCrNDiP7FLO0YbdTNqMUzjz5oMVKujJwBczMPlTNLEMPk0zjrYx
	 WT292a9LNtYSG5xKKBj5Twca+PkFkf724mdyr3D8v0XsZKvmxZehr5/sx3Y3OYKYAm
	 yBXHWb43tsyH2rFWbVRKOfSvJYWUk0303wcZYRo4=
Received: from [IPV6:2409:895a:3250:228a:f4e8:af77:3451:7f84] ([2409:895a:3250:228a:f4e8:af77:3451:7f84])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id E3880A3A; Thu, 14 Mar 2024 00:56:56 +0800
X-QQ-mid: xmsmtpt1710349016tdgirfa7w
Message-ID: <tencent_9543398AE3BAC424842837CEF01508D6680A@qq.com>
X-QQ-XMAILINFO: M7n9VusxZAlPGPlIJTfz+AwavCckFRj2HUU3AOQkRKR3XtavbiEmdSuF4L3odh
	 /Psq4/fDQdHLPq60YoajvAwdidSbmgOfpu6Qb563mgepuMnWB0QcdwJzqMwtInTnoca+qGnRbUHe
	 BQVvOd0qGPKYFJByULOLf0p+K0nnPVT+7Q3oFLLpmh1FaV2zHRkmio+AQcERHR5wwUwt5rIiNpor
	 QmKRrml8t+exuyJM4SsGRbMtqMjZbx2NjgIa5wUA0pTfv8x/5Q5GbRtpJByfEnTkQo3oHWk7PJxZ
	 645kuUUzk/q1hofDL90U6MpuDfCpB6pTOcmCWI+bsypDaorCpUkjJQY/qQZR8a2dOK5LaSp64Myi
	 PTKnJmBgaoXbkx8kKBJhIgaWJfZ4euhgcPayzLh+d2eGsAsKW/Vp+sJGFk8BrekPB/4jIMOSdARU
	 D9lR8p7QrT6m1mypBVHm12dTeCuQktWhIHVIcWtc9JrPWRHa6T+YNx+EZJ/8/+ni38kY9hN5uDMo
	 ZDcgelIa1YM5jLTSr3b0+5q9962ImY6VJAtCu+zfe2rYHOiACvbY9OyjSjVyBDgQMNOinx2UvmQZ
	 7zx5O9GKZhOhbkwk+mMq0VGUc527RItu5JcXveEpXLFndjDstmsEXbeTREzk6t8+Xo5u4zGMP8yp
	 jM2aYyVgB9odzxKraf1Xd2Z/yXHY0bF1se5iaJMvNNqTx6uxgqFMDMilIs/a2XTRb+rs1S4ERRLV
	 iIXAbDQjUVWL0rP6yPIrIuMQkpofEQ7ZohjjifkonZc7xyaFGN4qPtSaJN8a7r5v+0XCP5beEOJZ
	 CFd6OB9PYFBMcN+EnoCOIGh7W8waHIU/wnXPWxO6nLR6a78J83NkgmxxbCGqywimrBD1SsCaaGbU
	 miIEto9zMso5YBz1kvDT+9IEozOVa4EhnxhOd4Sio9Oom2FPdraSc6XHsTl5TPQnF1fdWSIgb6w3
	 pdGSO3G2tHqqEQlx7vr4Uav/1kDtVe1SQFlYIxN24=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-OQ-MSGID: <0425a7b7-95a7-4f16-b1a4-4010ae1c3e6b@cyyself.name>
Date: Thu, 14 Mar 2024 00:56:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
 <20240305-fascism-enrich-06483ddeb149@spud>
 <311bdf17-c16f-41d8-8366-10f9b00adf27@kernel.org>
 <tencent_FF86EF51905CFBDF1102F721663984B2F105@qq.com>
In-Reply-To: <tencent_FF86EF51905CFBDF1102F721663984B2F105@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_170328_565578_5FCB08ED 
X-CRM114-Status: GOOD (  33.76  )
X-Mailman-Approved-At: Wed, 13 Mar 2024 14:47:54 -0700
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



On 2024/3/8 05:03, Yangyu Chen wrote:
> 
> 
>> On Mar 6, 2024, at 07:58, Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>> On 3/6/24 02:20, Conor Dooley wrote:
>>> On Tue, Mar 05, 2024 at 03:47:15PM +0800, Yangyu Chen wrote:
>>>> On 2024/3/5 07:46, Damien Le Moal wrote:
>>>>> On 3/5/24 06:05, Yangyu Chen wrote:
>>>>>> Since K230 was released, SOC_CANAAN is no longer only referred to the K210.
>>>>>> Remove it depends on !MMU will allow building dts for K230 and remove the
>>>>>> K210 string from the help message.
>>>>>>
>>>>>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>>>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>> ---
>>>>>>   arch/riscv/Kconfig.socs | 5 ++---
>>>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>>>> index 623de5f8a208..b4e9b7f75510 100644
>>>>>> --- a/arch/riscv/Kconfig.socs
>>>>>> +++ b/arch/riscv/Kconfig.socs
>>>>>> @@ -75,13 +75,12 @@ config ARCH_CANAAN
>>>>>>    def_bool SOC_CANAAN
>>>>>>   config SOC_CANAAN
>>>>>> - bool "Canaan Kendryte K210 SoC"
>>>>>> - depends on !MMU
>>>>>
>>>>> This seems wrong to me. The k210 support does require no-mmu. So why remove
>>>>> this ?
>>>>
>>>> It just allows SOC_CANAAN to be selected when MMU=y. With this patch,
>>>> nommu_k210_defconfig still works.
>>>
>>> I think the concern here is that this would allow people to build a
>>> kernel for the k120 with the MMU enabled, not that the existing nommu
>>> build will be affected.
>>
>> Yes, this is my concern. Apologies for the lack of clarity.
>>
> 
> Hi,
> 
> Thanks for the review comments. After thinking about it for a while,
> I think we don't need to change it as we have changed the help
> message which deleted the "K210". And the dts on k210.dtsi shows
> mmu-type is riscv.none, I think if someone noticed this would know
> why it fails to boot on the S-Mode MMU Kernel on K210. The only
> special thing for ARCH_CANAAN is that a loader.bin will be built
> when M-Mode is on arch/riscv/Makefile. However, Canaan has no other
> M-Mode chips except for K210. So I think we don't need to change
> it.
> 
> Another reason is that SOC_CANAAN for K210 is somehow hard to change.
> If we continue using SOC_CANAAN for K210 but not for other Canaan
> SoCs such as K230, it will cause some confusion to users. If we
> rename SOC_CANAAN to SOC_CANAAN_K210, it will change many drivers
> in many subsystems like my patch v5 [1]. So I don't think we need
> to fix it.
> 
> 
> If we don't change it, A concern for this is that some drivers for
> K210 will be built when SOC_CANAAN=y and if we add this to defconfig,
> all riscv builds will also build some K210 drivers even on MMU. But
> I think this will not be a problem just need some memory/storage
> for a slightly bigger kernel. Also, we will enable some new configs
> in defconfig when a new soc gets supported, it's normal for K210
> SoC drivers.
> 
> Thus, I think we don't need to change it. If you have some other
> opinions, please let me know.
> 
> [1] https://lore.kernel.org/linux-riscv/tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com/
> 
> Thanks,
> Yangyu Chen
> 

Hi Damien,

I'm waiting for your decision before sending the next patch revision.
Please reply to this when you are free.

Thanks,
Yangyu Chen

>>>
>>> Maybe you could squash in something like the following?
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index b4e9b7f75510..75d55059163f 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -72,15 +72,19 @@ config SOC_VIRT
>>>    This enables support for QEMU Virt Machine.
>>>
>>> config ARCH_CANAAN
>>> - def_bool SOC_CANAAN
>>> + bool "Canaan Kendryte SoCs"
>>> + help
>>> +   This enables support for Canaan Kendryte SoC platform hardware.
>>>
>>> config SOC_CANAAN
>>> - bool "Canaan Kendryte SoC"
>>> + bool "Canaan Kendryte K210 SoC"
>>> + depends on !MMU
>>> + depends on ARCH_CANAAN
>>> select CLINT_TIMER if RISCV_M_MODE
>>> select ARCH_HAS_RESET_CONTROLLER
>>> select PINCTRL
>>> select COMMON_CLK
>>> help
>>> -   This enables support for Canaan Kendryte SoC platform hardware.
>>> +   This enables support for Canaan Kendryte K210 SoC platform hardware.
>>>
>>> endmenu # "SoC selection"
>>>
>>> (Which reminds me, I really need to go and finish sorting out the ARCH_
>>> stuff)
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
