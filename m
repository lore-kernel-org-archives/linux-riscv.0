Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF76C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYiQHPqLqIIyjSDCpxvASLjA8r2xYgmExZ84OVIi5Ik=; b=KQEfx/wZm1VsH+
	tBb+rEwVIJUZkpjf/OBwhjE4KrJPAz9duIa9/mcWIg1IFSX+Y0kYBTpE79PKlQ66W+heciJEsExqM
	BTBuFZ6jLff5Q/zlHyZC7KrzJoKL3SutJjHmVs7HpSi81YZj8AZkNhczGql2PtJXqigrjjnxUE/DT
	0kNwxviQCVDUeqCPhw1qrbn2fJtynMbgzFZVs+gCFpkeS112fZg82oCa5vYmMYuroz9V5+J+ceSqk
	bry+gdIW61RK4Ek5eq0R/8cwCcZnmbWuMm0/i8126yyV4hXiaIUl+dechHPDhC7ngKHs998cWbXnf
	+mXddXM+ezqLMri3VQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBnGU-00Gyo8-0w;
	Sat, 09 Dec 2023 02:40:26 +0000
Received: from mail-dm6nam10olkn2080c.outbound.protection.outlook.com ([2a01:111:f400:7e88::80c] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBnGR-00GymT-0h
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 02:40:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPQ2kNN6KsrnygJZ1/P6FP62hNfrMUX6fZGCcj4mM6CabLkB4uA1/vVhq2kjJC24wKYKCGijBmaxnfO/2ovI2f2CCXogOHUgueepmIVRAHIj3kytOU2rgzEbKMRp2LeVVfOhtR7v5wSOBBbM3p2S5QBXfsShlHKRvTJzfvLNi2kdpOgOAiXWQ0tmRJ3XZetMLosZkn/MzhfiRgdX4nnDfkkxm172hGS/ez0pPfROMXbLrGGLZbf93e4ryC1CC+TncOm/MU1YLaBFtZ+Cfv0MJhgcJ8zEF3/wIiubp2zOytTa2YtZgd1TttHqsANROsx54RCEnGN6TVLA7PpO/sLs6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmfhCQl0t3MqMem9Iod9wuRlkbu29Ec9PLNzLBwwq0I=;
 b=I2GFUlcsKBD16xrcgJ9PxE5zLknaTKezF8Eq5qmp9otu4uCtHGsm1/YFFmzgq+597xvYKZEPcrCTAYKZHpeKpIy0S12ZxFL13KiEFbGy5S4Sde5bFb1P6awEtnMMsC5kvdPTuN2UC561h0o+2ZnRh5SdGSeso/dEfhbeVQrlxDnijWD69TdyfkOoS+grJRxNyU1IPulq7IUDKYNVxRws2gd+5LcW+bonhkwftH8O9W+rwub/tU8ZSHCerX/a6nid+oBIx06jK2zN9VXXYTp5sjZFgIJ+JGcZ5JEelSLfc8/Rbfr3RADgVeNdAN/8kGwjV9Ml/KLbHr1WBBcAkOIYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmfhCQl0t3MqMem9Iod9wuRlkbu29Ec9PLNzLBwwq0I=;
 b=nRBiFT/KWU1xZfWd2hZHUTf1buu6ya/+y2osvY9AJSKGg2dVJGk/RIxYdILvidsTFBYqifxUfwptXCdYEzqxgzr1W4xFaLLwDjbOsTD6CG1CvsyCEw8O1BTLT2LdxrBF6gJ5hFC1U7kaNS8fMApTg1XB09WeQHfoZfwOTtuA6e0fAvYQyfG4h7fkAyKXR35IWD1C5apms10FQcqmLPUP8X4SHG5AW9suIHeI1yJXFG2t+LqGrkgalmHTsLuwz3ZoGShXSQXal5hoQrKxxDEuxKJ2z5As0m28Npa2xfldU9jRzFBSO7Zk9j9NweQ5rKW5JIRZrI+9rAdnzWH3xbdb6A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB4538.namprd20.prod.outlook.com (2603:10b6:806:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Sat, 9 Dec
 2023 02:40:10 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7068.027; Sat, 9 Dec 2023
 02:40:10 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	qiujingbao.dlmu@gmail.com,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
Date: Sat,  9 Dec 2023 10:40:11 +0800
Message-ID: <IA1PR20MB4953AFF3A49DCEB60A624488BB89A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208-overdue-reapprove-4b507f5f4262@spud>
References: <20231208-overdue-reapprove-4b507f5f4262@spud>
X-TMN: [QDO7VcOQqjDAcrpNnn8W3lmul3Sz0taK2ziP/3WGd0Q=]
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231209024012.289516-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9caa7708-7aa4-4ff1-1409-08dbf8602986
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5mq3FNnvFjA7s/s9W9TGKnMfeDHd6S7p/wVMyCAobrvEm7wILc9sKakWocNn2ZgcurlJ79P7xlmG1HisCsvNwmXcSV5synlwhH0pWi8P3CX3r9KtK2Nj/DPxFoakAPVBecH9w08RxFbTU5mnCSU8B5YH9GoB6x+fuBnQmwkN68CTkcwrqOf9q6duVnkQ09kkqfj4bl4pV/lTDXt45wY0Mqf6ualSa63mLQdsZrxso5dBcNu73/jivQ8AViqSIyHKimLaST6nLdVxZVj+L46jUuzDy9J2uUY3J7Uq1DO0jmq1jHiskeTr0l87RaXDc9JeKn5w/oKC1u37+I1H0AukCCWtCbgrmUQXmQIsmJzTfZgHGp8f8RSgGo4ipS/dS3OJ02MwqCgBLsugEJGWQV+DaYS2XQJEx1X3sX1yttFeTXDt7M3PTQuURaElTROoiJ+1mUGqVSO3y3qPLY1Ry5JUDijt9WSXq1bBGEI38Xtf/0dqPEYSmlYHGKsOGwsijKODDariXqHjHuQDnh/ZQbWSU5dc8XVAulF9yMhCgfsQjMR+4x8sFS602g5NE/KV0pBzsgNf+xCyWkF6uplI3ajbmcVIHtMWP8LeCMU26BEUXdtwVTWVWGhvO6aGeksBXPF
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dq0leT+lrdBubbRtYr0TqDChUC92ANdM10oOWMK+PdqX3Yc4HTfHkPe9vEk5?=
 =?us-ascii?Q?CVNICeY8/nh83uE3wHB/Tl4fOq7trtcs09C4bier4mtdvlZOqmne0Om9dGzO?=
 =?us-ascii?Q?8fvz/l1/PQLMDEqzCE7bwo1rS3j+X7y3utwbluOQc8jRoUVK02Kz1jqH1ECw?=
 =?us-ascii?Q?pUetk8kmyO5lPMqqlMbTxXzNBDbri9Xyn0BDk6zc5Ri5K1f2l1pAXVulekyZ?=
 =?us-ascii?Q?Tjm/ur3jpb8mrgRdIaw2EtbgBtAtyRkDjb6lnZc/gPYcvlO1kqIbozuqhvao?=
 =?us-ascii?Q?FudGTKIkBnb5HPG8uCC1LfeZ6sDaSo8AnfupSr8W6SMKwsdbGmqOJpNkSPvH?=
 =?us-ascii?Q?UJ5r/y5GNLGEUs7twuttLFJWGVJPAlVkJndJtMkzf6ZpJq/rtxSyS0MqD8AE?=
 =?us-ascii?Q?ebENo2sJvg35jbP9b58dC4lE0GOuzEeSSVMyyj5MNJFAv6+7ifaaJDs/I9CF?=
 =?us-ascii?Q?JDRM4ECGciyaQeNBGOiM9xviGx+D4RgdQn8TOSKpwBSSMg2IZaLmrU8NQYiB?=
 =?us-ascii?Q?NJQuKn/2KzxkWpaK1JiQzcYKBpZxXoQz8gvbRRxrMkPMb/mwkvBH4Tg9DzRH?=
 =?us-ascii?Q?/uiJKzvpbCW2Kk4wpzBLsJBfxrtc1h9R00lQZaCQRK6VdSkMvW7/hXYpLtt/?=
 =?us-ascii?Q?I8yDAM+UoFCw8QgO5tgTCSzDTmWOegfaZG2t6g3EdfkhoY3A/bC+i0aNOHql?=
 =?us-ascii?Q?Qg+pfa4uo3lG+/oeyDZiuE4uqWdzKZYN9BsjOSRvTCc8K8ORZt0qH9+8FoY+?=
 =?us-ascii?Q?pkdxsfUeLNU/asDCqNWoiEW2tUUjNQB2X79cjEHHxHW4PqUwf6WMMFr5EBBV?=
 =?us-ascii?Q?zJxetxpVnOhMbJ8Lbk67vbVshGGQzdOEdrci2w0G8FarNq3TyJzhdeq0s8or?=
 =?us-ascii?Q?/eqPnbLZzM3Ea4jNv6HoL3pxUmVg6K/qrUic+uLQG9GLVK5cWGUA+vYv82Ks?=
 =?us-ascii?Q?Oj4/DoBwvTlR7jrOuFiJZZKBH2vNDdtsHm2DvtS/GTn05G78/RJ1TKp6dgWs?=
 =?us-ascii?Q?CtSjmnuWxCqt2wIgasD7aw8TBHcro9tShZ8nxZmbwSmWJ3Gkx3yogxtCZepV?=
 =?us-ascii?Q?y6tTm8CC1a8YhiPgheLrRapo2BaJmmStrrinqlBdnc33j1vJWdOy84wSx4CR?=
 =?us-ascii?Q?YHPBML76vm7BXpBbWaJxM51G7IFu2v074aE7FvGR63zZsvTPlE6kLje/TWLa?=
 =?us-ascii?Q?Bwpt+4i55MuKSwxi7k796sMYY+wWFs5WAie/gIvZDd1oztt+EYgEh3ONbQA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caa7708-7aa4-4ff1-1409-08dbf8602986
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2023 02:40:10.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_184023_388429_393F56C0 
X-CRM114-Status: GOOD (  19.45  )
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

>
>On Fri, Dec 08, 2023 at 09:13:34AM +0800, Inochi Amaoto wrote:
>>> On Thu, Dec 07, 2023 at 01:52:16PM +0100, Krzysztof Kozlowski wrote:
>>>> On 07/12/2023 10:42, Inochi Amaoto wrote:
>>>>>>> +&clk {
>>>>>>> +	compatible = "sophgo,cv1810-clk";
>>>>>>> +};
>>>>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> index 2d6f4a4b1e58..6ea1b2784db9 100644
>>>>>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> @@ -53,6 +53,12 @@ soc {
>>>>>>>  		dma-noncoherent;
>>>>>>>  		ranges;
>>>>>>>
>>>>>>> +		clk: clock-controller@3002000 {
>>>>>>> +			reg = <0x03002000 0x1000>;
>>>>>>> +			clocks = <&osc>;
>>>>>>> +			#clock-cells = <1>;
>>>>>>
>>>>>> I don't find such layout readable and maintainable. I did some parts
>>>>>> like this long, long time ago for one of my SoCs (Exynos54xx), but I
>>>>>> find it over time unmaintainable approach. I strongly suggest to have
>>>>>> compatible and other properties in one place, so cv1800 and cv1812, even
>>>>>> if it duplicates the code.
>>>>>>
>>>>>
>>>>> Hi Krzysztof:
>>>>>
>>>>> Thanks for your advice, but I have a question about this: when I should
>>>>> use the DT override? The memory mapping of the CV1800 and CV1810 are
>>>>> almost the same (the CV1810 have more peripheral and the future SG200X
>>>>> have the same layout). IIRC, this is why conor suggested using DT override
>>>>> to make modification easier. But duplicating node seems to break thiS, so
>>>>> I's pretty confused.
>>>>
>>>> Go with whatever your subarchitecture and architecture maintainers
>>>> prefer, I just shared my opinion that I find such code difficult to read
>>>> and maintain.
>>>>
>>>> Extending node with supplies, pinctrl or even clocks would be readable.
>>>> But the compatible: no. The same applies when you need to delete
>>>> property or subnode: not readable/maintainable IMHO.
>>>
>>> There are apparently 3 or 4 of these SoCs that are basically identical,
>>> which is why the approach was taken. I do agree that it looks somewhat
>>> messy because I was looking for device-specific compatibles for these
>>> SoCs.
>>>
>>
>> I agree that this may be messy. But it might still be acceptable if we
>> limit the number of devices in this format.
>>
>> IIRC, only clint, plic, clk, maybe pinmux only needs different compatible.
>> For more complex device, such as tpu and codec, I agree with duplicating
>> nodes and make them SoC specific.
>
>Okay. We will see how it goes. We are not stuck doing it one way, we can
>revisit the decision later if things start to be confusing.
>
>>
>> As for this patch, I have already adjusted the order of clock to ensure
>> the compatible among different SoCs. This will make the clock assignment
>> easier.
>
>
>On Fri, Dec 08, 2023 at 09:13:34AM +0800, Inochi Amaoto wrote:
>>> On Thu, Dec 07, 2023 at 01:52:16PM +0100, Krzysztof Kozlowski wrote:
>>>> On 07/12/2023 10:42, Inochi Amaoto wrote:
>>>>>>> +&clk {
>>>>>>> +	compatible = "sophgo,cv1810-clk";
>>>>>>> +};
>>>>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> index 2d6f4a4b1e58..6ea1b2784db9 100644
>>>>>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>>>> @@ -53,6 +53,12 @@ soc {
>>>>>>>  		dma-noncoherent;
>>>>>>>  		ranges;
>>>>>>>
>>>>>>> +		clk: clock-controller@3002000 {
>>>>>>> +			reg = <0x03002000 0x1000>;
>>>>>>> +			clocks = <&osc>;
>>>>>>> +			#clock-cells = <1>;
>>>>>>
>>>>>> I don't find such layout readable and maintainable. I did some parts
>>>>>> like this long, long time ago for one of my SoCs (Exynos54xx), but I
>>>>>> find it over time unmaintainable approach. I strongly suggest to have
>>>>>> compatible and other properties in one place, so cv1800 and cv1812, even
>>>>>> if it duplicates the code.
>>>>>>
>>>>>
>>>>> Hi Krzysztof:
>>>>>
>>>>> Thanks for your advice, but I have a question about this: when I should
>>>>> use the DT override? The memory mapping of the CV1800 and CV1810 are
>>>>> almost the same (the CV1810 have more peripheral and the future SG200X
>>>>> have the same layout). IIRC, this is why conor suggested using DT override
>>>>> to make modification easier. But duplicating node seems to break thiS, so
>>>>> I's pretty confused.
>>>>
>>>> Go with whatever your subarchitecture and architecture maintainers
>>>> prefer, I just shared my opinion that I find such code difficult to read
>>>> and maintain.
>>>>
>>>> Extending node with supplies, pinctrl or even clocks would be readable.
>>>> But the compatible: no. The same applies when you need to delete
>>>> property or subnode: not readable/maintainable IMHO.
>>>
>>> There are apparently 3 or 4 of these SoCs that are basically identical,
>>> which is why the approach was taken. I do agree that it looks somewhat
>>> messy because I was looking for device-specific compatibles for these
>>> SoCs.
>>>
>>
>> I agree that this may be messy. But it might still be acceptable if we
>> limit the number of devices in this format.
>>
>> IIRC, only clint, plic, clk, maybe pinmux only needs different compatible.
>> For more complex device, such as tpu and codec, I agree with duplicating
>> nodes and make them SoC specific.
>
>Okay. We will see how it goes. We are not stuck doing it one way, we can
>revisit the decision later if things start to be confusing.
>

Yes, now let's see what will happen and then improve it.

>>
>> As for this patch, I have already adjusted the order of clock to ensure
>> the compatible among different SoCs. This will make the clock assignment
>> easier.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
