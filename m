Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F84C10DC3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8hwqzKiZaYEP/CYCwqTA+wvQGJlLxV+seSJpaZFqSM=; b=s1IijVR8p+lWys
	zhfgeJYO5mAQXKy2/j9XZ8lNl3AyMRa10efeOZFHzdzlq6gVMU9E2EchdJvcxCR2ZwIHQ1e1kz4Fp
	pxgGh2JXF/g7FvFF2T20oNKgBDSdncUgrpRC5TEWlnBAwU1tHY6idCOxhfJZXLkSHl4SViNV53PLN
	Vgb1UUczcWZffrS5c5h60MUc8XsGDBUMyAvD35C5Prg1Kc591Q2xRvxlZjjcZWmd0c8PFyM9X0LBG
	/+lhMxv0La4sgMmHDM3NTSn9KVCh5n8JqingwJyI4DRjYwf5ZiE2wDQ/II5YsGKL7x0b6r2Y4dn5W
	avrLeamf0AfBLQWWhmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPR9-00EQxo-05;
	Fri, 08 Dec 2023 01:13:51 +0000
Received: from mail-mw2nam12olkn20812.outbound.protection.outlook.com ([2a01:111:f400:fe5a::812] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPR6-00EQwQ-0j
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAlzTNrCwnIMzLXIf1BDKnFTMXlefbnNY7AKjIsB8teSWFiUbxb5tksEXdgDONKVNl8idX/NwCO4d3oWzi5RwT7Pcg1iH+u5fNj2uiwZTJinSvf0I8UEPAAajnWYkvkuOaRqIZFDeyHP+wrk5n7HGG7y4ItHuz69eqh8LyekEn5LESBrB8rjCRt3yo+yQ1BguwPo++FyP+PCW1lTdphE8lFh2C2K2oMiDyyAZpPPK7jza6X90KBxOmbBGECLb++ZTMGnKOzhMrGxBHXirKN2U2FlFKH5hs7R5CuECZNNXDcWjFCVVUdIltJuINkLE1B5sATd1pa4USVdeshViatmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnbMr+vPdL0vWzY+y0MoKZgR77QA3GeqrMjLI5hgirM=;
 b=azOZ25JDoGQdv3wuCZI4Lzk0k2By62U8bvGUaR2uho/C/Q1OKhFuMBvy8YFtvBJ6hBBaOJ+Ayno62ZJ0Mj9VPyeaWzOtofJIGKD0DuGVWDF5m5V7eMk6TdEMzh6B5YawCY5C8xvTUBg3R+NUYa8FfFY2QyQ8TxOxrEKqNdAE5FZnghBTbH1IqeTzGJuENVBaFJW+mKuKiOsGYolF84ZvohX3GQoX+RxjzBDwzbifL5p7PZhqmRoBhOGmhe/UnIH9X9mNQSwRrx6kqGeRUYosz7zOKs1Jb9L3EH7yoGy54iJkyx8UfTYBWety81VzZHJnrAvhUjlKC0HRLooNd+jdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnbMr+vPdL0vWzY+y0MoKZgR77QA3GeqrMjLI5hgirM=;
 b=a33erikNCF1u8mEpc14vfCGf+B28fjmdqdWQ8c9F1/ZX5Uzv+HegaiEnXOLBeyEtx2o1N8PNQ02XrQfO1F/PIKHk1AplnUSUMAiqJFl5Jb2WqZgl866LHbvvbJVOP1qj2mcQLV9wEm6AtEqZ9qgAROFLpqiRzEb4shdF4t9OQpdhY04Aaph4IqIz0xV0747kWrmV6v5ic+pmUudzBbcMEKCgnan7i57k4Sq2/4V0Yki174TTVC0NXbqHQ9SYF4fIiRWBWBYP/y2Km7LS85Gun2ddUjS3+XLOGwgSwzsWpW5X2i4t7GGkulWlEauT3RmP37k5jFseU3xJVPoAfK3ufA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB5345.namprd20.prod.outlook.com (2603:10b6:806:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 01:13:35 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 01:13:35 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
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
Date: Fri,  8 Dec 2023 09:13:34 +0800
Message-ID: <IA1PR20MB4953889EA91BCA3514965E2ABB8AA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207-doze-spinster-0bfad3b1441a@spud>
References: <20231207-doze-spinster-0bfad3b1441a@spud>
X-TMN: [MqlJQGZRLLlZULUSHG2bvMMqy/ifxAsGKcElEDA0pcU=]
X-ClientProxiedBy: TYAPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231208011334.69325-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: eff68aa5-dd6e-48b5-69f5-08dbf78ae65f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yv+AqrwmRoqfvXvZxnzihOTZ9/aMo75+v+YvqXfZlH7kjYqfJDYJa84DkiHWREbctAHvUOtp3bEfCc6yC1WTjLJKWcQ+SaLxNWIZ6H978ioQUy4C+UcEXaMdjB8dLnrJqEyqmW2fC2ZVqQGC3k5XThBilnKltlK8rtBlTYUiuYwZbFo3Ub3/z+Xo2GkMOKC1NxAdSzLBWiTzwnqUecWCc9u8u0yPezUVdC8eSLDt4f1Le+IYY0WF2Agyy+tx9v6aBiBFB0mtw9YoEgZ2SSQgLB4mDhnChVjbjIkpjthZFSFpkzPxeyqH3giMvVHs4CQOCgWW0lup8I14PVdMQgNdUoG2g3kIvxJe72QbpKpjgKuH2o7hEFg/ssjEI9NHFO4+VSDMUH+YP7E3BJvIq8u22HMNhd9QUTzKVcADnL1APp/BB0u05I7MN3MxY8Wb4ZC6ZlRTJmvWofAf61ZzF9hhhsA4rIPmF+enad5y0zFVd5EATM9H2b1q6ycZPgVm63uAWDBpLmpfUrW6MaXPhutMk2RRlrEC4VNmIpTMngrRLjpfIh1G3aCUycUYNr1hwanZclU1cgLDVSM+8+IycBAwnRlOrSQti3O2Btwb24Cvq3lIQpyjMEZoWgE7zG4SCRHl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O3/45yKNuMC+fV04+0vGi75i0JQPRDiHzSPB91Ilm4sHUL1x0KWa0Rnm9ryA?=
 =?us-ascii?Q?6Nc2w22NOvl/4DPDvP1rhTqw4Sowyzpl/1nW6O4DNhZWs03D/HMs1cidrdIf?=
 =?us-ascii?Q?sf+QBEaBahecLHmy22SutsyRNg8u3DLZLcGe42NOc23nIO0yddPQuXS4eVM3?=
 =?us-ascii?Q?VwI+WJ9dMyo74c6yXzOqID5PzUWsiFJXBZI+mPbW28BjTmu9KjgigDed5ObU?=
 =?us-ascii?Q?xE2C+L+Xe5j8YEUsphC+7f/1raA/L3qgLuxTpN0WjRskc+ORzIraR2PMu7Fe?=
 =?us-ascii?Q?swZ6NXcWiWscPkCaT00nMWrEN16wIxS0sTYRFw5xk/VKD0dcotd1gEO2Dw0I?=
 =?us-ascii?Q?plfXL8KBoezoYOUqKq+fVjNdKZoo7yEWYzsipJuBBm+wZgrHujJ0dApncIku?=
 =?us-ascii?Q?o0AoK5KaaustnHUQNe+jOkhj3GhZhIxz/FyYvntInZ3uAUGMWkkhfjXjSx9h?=
 =?us-ascii?Q?EVlrM/hKic86W9bvHeDIB6+QRP8etmTDllem6+6OWCMvcs8T8EIWl98T8Thy?=
 =?us-ascii?Q?U1dZZQ1xSJiqKhuqdjM+Y9pk7xnFRpKyTp24PbWEcxpa5Li39cVly1gJVsio?=
 =?us-ascii?Q?PIChRcBJ9cX40ZwWKCAxH2FrJtWREvhRzBfOU9u6fZy9HdM7+nk2kAhafoBn?=
 =?us-ascii?Q?JwEPlH222KTwGH6QGq/BMP8Fz2MYZ5IuYOFH2GMOKvhgKXnFF1i6DCVv4EjM?=
 =?us-ascii?Q?3ORfUVaTMvMPuGPbmrdvx/ihzwD5Z3ok0OxIcJbtn3ZBbpcfkFmKDJKeZ6m1?=
 =?us-ascii?Q?PHL7qZISgReXIT3doWrwEDajXfZFfoYcBAqT/IMZ4krZbtYLGiDWyNQFSvce?=
 =?us-ascii?Q?TdLx3miJU5r6GWe52eSRJmn1+hqnfoYSPCBrADL8lOKUEe8a9bBu5U9nSsQ2?=
 =?us-ascii?Q?5nwXs8sZcXVfrrt7gZ0crqL0xX+b8AIdlVXPM2DV9QmZ7p68JbL1ARlZJmEu?=
 =?us-ascii?Q?VIVS4Vm2QGUc1X3BSFu2DKs7xUnZrzaZQ+47jmHXHhCZHy3870GIMEafXEFD?=
 =?us-ascii?Q?NoERalGnRD9oQeIqKPzXy3QIE0Jl0mPa1pUkGjYONQg/eYR50ApouDAv4wbN?=
 =?us-ascii?Q?8t/V65+N+jPa6JBVJO2eEVI06ITRs9gD7a8g270bN3F0EiOHLpCd5qDe4NH6?=
 =?us-ascii?Q?mqN4JowPxctzDQiW+t7BzZo02Z65ZqONAFL2IMsTTu1P7FkYDvvrBauektbt?=
 =?us-ascii?Q?puOhzOAxfGWhnK10VZ2O82SQmR80WhAlArNiE1otkCkxt4IUgk0vazgiU/Q?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff68aa5-dd6e-48b5-69f5-08dbf78ae65f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 01:13:34.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB5345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_171348_268323_BD229C47 
X-CRM114-Status: GOOD (  14.84  )
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

>On Thu, Dec 07, 2023 at 01:52:16PM +0100, Krzysztof Kozlowski wrote:
>> On 07/12/2023 10:42, Inochi Amaoto wrote:
>>>>> +&clk {
>>>>> +	compatible = "sophgo,cv1810-clk";
>>>>> +};
>>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>> index 2d6f4a4b1e58..6ea1b2784db9 100644
>>>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>>>> @@ -53,6 +53,12 @@ soc {
>>>>>  		dma-noncoherent;
>>>>>  		ranges;
>>>>>
>>>>> +		clk: clock-controller@3002000 {
>>>>> +			reg = <0x03002000 0x1000>;
>>>>> +			clocks = <&osc>;
>>>>> +			#clock-cells = <1>;
>>>>
>>>> I don't find such layout readable and maintainable. I did some parts
>>>> like this long, long time ago for one of my SoCs (Exynos54xx), but I
>>>> find it over time unmaintainable approach. I strongly suggest to have
>>>> compatible and other properties in one place, so cv1800 and cv1812, even
>>>> if it duplicates the code.
>>>>
>>>
>>> Hi Krzysztof:
>>>
>>> Thanks for your advice, but I have a question about this: when I should
>>> use the DT override? The memory mapping of the CV1800 and CV1810 are
>>> almost the same (the CV1810 have more peripheral and the future SG200X
>>> have the same layout). IIRC, this is why conor suggested using DT override
>>> to make modification easier. But duplicating node seems to break thiS, so
>>> I's pretty confused.
>>
>> Go with whatever your subarchitecture and architecture maintainers
>> prefer, I just shared my opinion that I find such code difficult to read
>> and maintain.
>>
>> Extending node with supplies, pinctrl or even clocks would be readable.
>> But the compatible: no. The same applies when you need to delete
>> property or subnode: not readable/maintainable IMHO.
>
>There are apparently 3 or 4 of these SoCs that are basically identical,
>which is why the approach was taken. I do agree that it looks somewhat
>messy because I was looking for device-specific compatibles for these
>SoCs.
>

I agree that this may be messy. But it might still be acceptable if we
limit the number of devices in this format.

IIRC, only clint, plic, clk, maybe pinmux only needs different compatible.
For more complex device, such as tpu and codec, I agree with duplicating
nodes and make them SoC specific.

As for this patch, I have already adjusted the order of clock to ensure
the compatible among different SoCs. This will make the clock assignment
easier.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
