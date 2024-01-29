Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F15C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 03:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMVzrZ+/UtQDQSKjpkmq81q0Bx5w4GfVQiisfQZDBh0=; b=sJbgS4F47cZLiZ
	QQsItsQ0OL8SYaFSWZTLhBQZTL/MEQzhII9f8GXDCYpLffsUax/SGj9PqIxDxihEwaCJDedYMn2sg
	e107B95+RXrm3GlgH6MG1mwz2X+YsO6oiIxcVGPADpS6dC2+GiMguSw/G2J7hhCUQmFXP5amIZxbN
	KBC8YTzJCD+rOiuBEGLpTTmeQhuM93/C3XM7tRo2iXD5mj+JUDR7TlhzfWyeWL+BhEUJD6xOA2HVC
	NmeVoW6+szT+kiZzXECkVP3G46QnFXtYXqCxsD5jbCXw9uJ2DN+u85NNKNqE+au9LYdgA71bzBqmU
	HIaqueY31ZQzzDcFHcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUIcr-0000000B9yJ-47yb;
	Mon, 29 Jan 2024 03:48:02 +0000
Received: from mail-bn1nam02olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c07::800] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUIco-0000000B9x3-3dVG
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 03:48:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1SbFo0Y73M+haK1y9s1vOwHQ5Xe2bMwsleiVjQjL17EaTDQizhHN349BvcpdALWYDgdvQxcbewHGaOW9wXFwhJfz0YntjheCOcifpbwHbgoiKoHnZPh1BcbUwtbzVK/ljXLzhoxloZlTOsVVG6owWeGlRsc9XiCx3WHTn2awbabPX170JJiJn393lwxkuleAfmpeUlvogud7D+scIBy+eZ7dRwmIbbDnluGIjuL+sicT0ECWrwPh7EYNW5kHw3HmTkOE8tTuedXSiVmVJn6KOsy/UddXwUMRLNGe/R69s/hEwGWmqRwHre6kqojhbFWF1kQmbHreMYdPpyhzPUymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEGp9XcjIJbY02mZ78n/ICpQXtQa76336IMc/d55imk=;
 b=TEh84JqEn6vUNW9hoT9WMrr5/b2qTf1OIzOT8ZgZ3Asu9z3iSjBnAdOnd+vxg4V47xDs4boL/88Vp1aWEUtrzOe0fxq4J0+bfVJAPw7S/3tB8siYxy6OtIhc+4Jsy/GCPfNmcs/vtmb9EBUkJq1Z7AeOwl+BRIaBTPwrerwjW3w1rdU1bFeuHoehZjPCTcbNoGp+hfMk4VSr3QvWqcgs3RC5IscN2n8JHjwOugK50s+z6tJMEaCcpNvQJYoDM3XRrSrvfsKF15jcfc7cOsLBOL6CU2+CrWpkoWnKEOZrrBf9ERW54nYRksBJKoia2nBqTY51dBMXrdmIwGWa5+wXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEGp9XcjIJbY02mZ78n/ICpQXtQa76336IMc/d55imk=;
 b=cPWriCexR+RDrcx+nFIJLHTQA24HO20UafLAoRVELq10v8iqOfc8BHuIL5CvhI+vk+4CFPZpnfAJvMxxQVcGYd/8oCvKlYKNm54W2hIXQfjZByP5MuxU0+b2plw4mQClbVV1Zxm+g6VvoKenD9oRhCBYSJcmBLG2hlobh7npGr/ZnUGo9DYDBf2kf8V5Ubdt02Lh7WS7+JOOSiVAcWT1rw1PeEv5t7ZbWg84xbR9/LMMdGBGdjiQ7m8PdC0Fxt1FBvF1hb8mylgTY9v7Aydw6ZtXCiiX2XzTGOzABVrZpK35N/US9ksBVbvg6KEbWLYy8HBeziGDd9WsQxTaH4L65A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA3PR20MB5935.namprd20.prod.outlook.com (2603:10b6:806:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 03:47:47 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 03:47:46 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: cv18xx: Add spi devices
Date: Mon, 29 Jan 2024 11:47:18 +0800
Message-ID: <IA1PR20MB49532962D49F119F355EC55ABB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129030115.GB1097489@ofsar>
References: <20240129030115.GB1097489@ofsar>
X-TMN: [PRJ7Ta8LhVgYjwnJCc6XaaQL4J2CntZRLvH+Zsa6DTygPIve5hvbFak9oQ5ZpYOd]
X-ClientProxiedBy: TYAPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240129034719.15928-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA3PR20MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7a0efb-cb81-46f4-f88c-08dc207d0e25
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT8PLw9LS0xFHvWB+TzQT4pmIItFBh9s9AsQlNNhyFYFAJZ15D2og5CSYerTiIOhAUGkY3CPcIrk2QwXgyQaC8cacnRT6jV/ltuJWECO1MOSLVoxH03hh913itZttpUa5urA1A2ipoOzTQ8qn9U4rya6tkzQh5xVeguL+3Mi2LEYDNsuf3HHKLZGQ+VzP3PXWdRkXQw8DWhAySG/yOOGAfnzaolAj2qfCqf6efYQWtR3U66kGCTx4ltMl5TJJOW1GcVCOYfNWsQpScCn1GToefgz4RxjUdts/3zcEtQRcYss5KLVHN3LyuLbvx4frZj60vTY4XCmZqIl8JB+J49FYq3enySgTmKQ5FUqouqTctbNl76BHHr8AgRY7sB0d6g29LWKGwkACL7DgFRc+wpWh7toFyqV/FpyGbM/rhBEjhIsyuFrNuHPpQLTaD6rrJA7RC91yaIRI7l008/LJVrEGCrVl6r4Yub9Y6nABIPw95WcMq6gsbr+dnL7DUR63G9sGbGD57LNKaW7QZAXSGi7+740cJx2VmH6Rhfo2Qd6QO8I6TvNgluhHldQmQgS7fCiMc93o2zvpe/IZmx79UVO91Lc+/CC/55fjuAB6FIPEDVBrsW87413Y94YeVC5bOrDIbwOdHHaM2RcSn9Teh4YWB3oXQqjTj1xg19Jg1Moi77b33D3PnWZ76YEEdGqdySIkMjbg0cFGnoyZRAZdZ37HpROtrusnTzOBnP6ogGP2g0Eotu2YPsD0lYWcToGMaGwyH2sC1l0XHhHVeLeaubjWFVb518ZHKil83smrvq+YLwikHYFVJtu5uzb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8WJ3jBXfTKtNNjktwTZI3qQWuoWOL5Oej5GWabShAMHRtEPNWuDDrOEhUtZ6+SI6l6Pk/2WWOLZWTgj4XmJUXV//dcft67lAFd9sZRe2T7x3Q5+yzJnV1+UL/M2xl6mp8AKM9ONVjGBq9s1YUox254/9H5JpPNzpFym+F0blOo/jFk9XpO0T9YMbeHYPPoUd8T6j4L2N5q7XA+TYSYHTOOZtNEYSsASxpvcngkJrJDp1cN9MrFWXGejxYQ8moLcbmfB4eLIza7X8thARt4gdTb9xrnEMrwG1WP50FS5DBlThkO/vz5wwfWvjl5nY/fc4KbZ7pH/QKiy5PRjFASwjjEQh5PyKnU+I37Sn7a21I7BnC+KkXaCuiaqJBnfAf5hDLzaYAOld4eaZPTlkjLP5DV9R0Xdf5dzr5/kYlq3ktB2Otw2umZla5+G/OMC3c8voBlDpioLG5VUZKd4HA7MOurxL5+O6YsPotZ2O6CcI01GqXlvQuI7wNz0LSOq3K31lPxxGVg4jIg6mcP586BC5VsZRBfZPIb+y0zFexSCJaomCH430iVNLZ63u8iKNdSKUmTLnTmypU3kOPdiAH2kAjAXw5za+7BBZptJaHsFKmIJeI+po/hfs58fUoeKWlD5Y
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NelfE6c3dOrgIz+8MBmlVmUh9SjIvfbpI1ge2CBXBLona9Izd0g7kCWO+W51?=
 =?us-ascii?Q?JvMKzmpgwJc66Pv3I0F8iySXadKudKivGV5BvEbu0JepEAwWLz6PQ+gj30nF?=
 =?us-ascii?Q?xhETn/wRlwF9iQLVSf3yJny13XVsLG3nSON4xJ7AtwZZwZACsXfMp7l4jkzw?=
 =?us-ascii?Q?miYB4GxBlGIPeoQPd9gal9obp8iHNDL4GQEUYxnMBIY/MiO7JIVJTKe12vgE?=
 =?us-ascii?Q?QSaxua2wErlesSYGzrqu+HIKGks1QgzVpVwTvKu/jWPgN2qY2CGVgsv20WuD?=
 =?us-ascii?Q?4tQryjPNg6ammNWfkFxBKG9kVcXhgSw+HrxhRfA9JKKL3FtuZO6PTshRHQkN?=
 =?us-ascii?Q?pP/LSzh1eC5XD57G26Jg8PHH+OAoKSWUaiDyol8B5BwmWhkC+c0rirm16q1v?=
 =?us-ascii?Q?lew4mwJ/wVLp2c+5RbCa5bYJZTfuQN9woeMb2weR8PWRmwiSlSjvuBLXZ+PG?=
 =?us-ascii?Q?sNTmp/uvdRNFasUvBQJ3mxmwwHKun5Zz3gN4Beb5MfEu5zuOmQyrY/NHXQ8V?=
 =?us-ascii?Q?jkpzcS7sVbPSKGUaXuWx6htEK+yg9sw650bsvVYICHsV8OaQj4sI9u4ckGPG?=
 =?us-ascii?Q?XSbbm3Cm7ApQXCtjoZL5ORFDEkDTwJImSkIE1Yhi+pCYnAD0uR/0hfiI4rto?=
 =?us-ascii?Q?Ox9evJWQNR6ea5yYjaH09VoxykeuQj4IO3k3ngA9LCK1FJG1fz/KSSQ81sRY?=
 =?us-ascii?Q?U+NUOShTYZgjC+gljk4j3FXrqGGx/yYT0HVuu3e8yZDqHhV6L5lPxKEwolRu?=
 =?us-ascii?Q?qeb6072zjJLgKHr5z8mVVwzO6elHiNd3ege0TCCeK3Sn/Z2PZF3Yg9abFbC+?=
 =?us-ascii?Q?IRDPpK52ICwY6jUS13VKMbZgazKr9ae2YWrEa+p5lEIVbe5WCvdmivqfjESI?=
 =?us-ascii?Q?CQmZSMerYphKwGNxjR2uQR4U37G9OfflYMqyWr/q8VkKAVBEIsbap7dZNdMf?=
 =?us-ascii?Q?h5eM+dUUBC/o8ccSY3tcm1h26IVPlIQZLUbzGbaA5pHvWwo8xeZmMWXkU6qt?=
 =?us-ascii?Q?qUKpsy2JR7MbqPV/hKx0SxFyx18RZomXzxD0ypVP/0cS4l0RqUYWbh9A5XE3?=
 =?us-ascii?Q?KfPEY5ZL2K8VK72HXaYrQgGtIxuT2FjGL05cw6eeVXqXSRCu3bT2SVzz1dGL?=
 =?us-ascii?Q?g8+O3cmGsBLbMvVVK8kMkdgx51lJuqVC2KacOmzQw/XqU25iBczk3iyVAj+o?=
 =?us-ascii?Q?S+XgwaWOA1SgXyTOoXz2BKrZuubzXHmjmm/1+Go2msTG6KYehH1fFLXWujP+?=
 =?us-ascii?Q?4q02rYMVvrO+eJEcMurZjl1X6AZijW1hYryueS0uuQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7a0efb-cb81-46f4-f88c-08dc207d0e25
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 03:47:46.1954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR20MB5935
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_194758_950860_844E2864 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

>Hi Inochi Amaoto
>
>On 10:26 Mon 29 Jan     , Inochi Amaoto wrote:
>> Add spi devices for the CV180x, CV181x and SG200x soc.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 44 ++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> index 7c88cbe8e91d..e66f9e9feb48 100644
>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> @@ -176,6 +176,50 @@ uart3: serial@4170000 {
>>  			status = "disabled";
>>  		};
>>
>> +		spi0: spi@4180000 {
>> +			compatible = "snps,dw-apb-ssi";
>> +			reg = <0x04180000 0x10000>;
>> +			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
>> +			clock-names = "ssi_clk", "pclk";
>..
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>I'd suggest moving those two above 'interrupts' property
>
>there is an ongoing discussion here..
>https://lore.kernel.org/all/20231203174622.18402-1-krzysztof.kozlowski@linaro.org/
>

Thanks for this info. I will take care of it.

>> +			status = "disabled";
>> +		};
>> +
>> +		spi1: spi@4190000 {
>> +			compatible = "snps,dw-apb-ssi";
>> +			reg = <0x04190000 0x10000>;
>> +			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
>> +			clock-names = "ssi_clk", "pclk";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		spi2: spi@41a0000 {
>> +			compatible = "snps,dw-apb-ssi";
>> +			reg = <0x041a0000 0x10000>;
>> +			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
>> +			clock-names = "ssi_clk", "pclk";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		spi3: spi@41b0000 {
>> +			compatible = "snps,dw-apb-ssi";
>> +			reg = <0x041b0000 0x10000>;
>> +			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
>> +			clock-names = "ssi_clk", "pclk";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>>  		uart4: serial@41c0000 {
>>  			compatible = "snps,dw-apb-uart";
>>  			reg = <0x041c0000 0x100>;
>> --
>> 2.43.0
>
>--
>Yixun Lan (dlan)
>Gentoo Linux Developer
>GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
