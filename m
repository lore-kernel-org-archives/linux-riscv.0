Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFE9D2E014
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Subject:References:Cc:
	To:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCEo2BXlcMIYpOui+Ko65e5ESN4Sm1izCDwNSDMMRnE=; b=rSFrIxHPjMoaU8Vws35yEb9ukq
	KqVUBnxvs+9jGcZuohnIwb2i/IhXjYj968vv0fEPUZW2ypFqfrabmAAZTfGwu2E25JrVeiVppeiVU
	PYgzW3NKCdlj47Id3F9HAurtwuVEDaTbflcL8jRXI7gnKLrJ+5QpfMcSWL7y5KIm5vmphO6zA1RI0
	kzhjEfQJNs8GIwCqaj2xIrynOoBiwV6sGLGKTzzg2LyyIKhJ4coFUiMbEqmtIIyXtfdrDdhBcDP9K
	m0BCLUCUG4H/eUE+9BO0Kh2ppr7QjHO1nNp2I77wTjYmaENw1lH7jWlwRtJ9kwSOMD3jBKHuLdN4K
	REoL67Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQ9q-000000099ok-2Kix;
	Fri, 05 Dec 2025 07:23:14 +0000
Received: from mail-northeuropeazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d200::] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQ9n-000000099oC-1Hvj
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 07:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y954yobr/HKArAQxk5Gca6fhhyxTAIrn/t+b8d54Ew2gylEgliW4EKA2CIxo6CyVdiBdvQscXrs0ShXCXUVL7uenlY7m6p/rJoxzr71AZqWz6Jr1F6mizC8QavRROAljQ9afQm0OzANc8WFTuw56POnV4mPypi5gcglDpQ+SxrRy8Z4dvEsvgAf+gKjkTLtawFFO8C0V+Nt+HCU6nn5fo83mjLKluw0t1tQwN48m8GMlqdHzV0FC8sXes/N+CpvwbY2X8krcHLf4IfsiSWaebONJtZQyPmSk5A5VKvTMt8EW6zzdJ/SxbQiWTHecVC3olL5d5CDOydGeUr6grf0MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmQVHYwcXq6nYL1O45y73iM63OFW2YXlhSMEgCruLLs=;
 b=tTlF55r/NcIJB0PEmVB/vZWQweoZQWkL2xsAM0wxOLkdRGKhOZOtIJDsZ5IPtgybjjlnfmvRwuDei9v9ncPNiw/wu5AMN8bBC52kuECwCW4XqCC/qZ0Z+IqcsfueusFmXnFSy6/o1vn+Xi0u05iVstQeeF/14FMP50hoa/DU1aHAY5iGb9hZ7aROtphMVKXM8lcp+DWJiJdbFO7C5/qnYT/79Er1t448OMQeDpkrvEuUm3jyxCK7LkXoMjY9bWuU8WupeGqSMMvWEAIi/D5xQibzX6LCkt8UoLnEbMhG7+XVeql2QLlHf2pM+vDuG3KxLj7Rzyg8fbXjcVAVc4yRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmQVHYwcXq6nYL1O45y73iM63OFW2YXlhSMEgCruLLs=;
 b=iRBUbfsR+ugBg3DG7wiR6/3/6AFGVE36Hfn7V7SE7JwjS/JxT0OzXq0zOegEaLRL7C8EogwHCQLaUW/3NRmsLuV7279EEjKgK0ZNcoEO3Nr2ahUQh+weVNIf2Hkuzu+Spe5diueW9jOwkLUNFtKvia3OTk/F2Cn8CjdwC6OBbVTDYfPTz0rhr0/zEOTKP1KUP59kUm7NYuQILL6M2a3mrbgDUBgfz50kXzdHCPvS1QPcTaoq3159q9sZqL/7WQhJEBx++sW2kdyWUt1ZemfAqHQ5jCDEQZOeLdmh7zum7bzm2ZulPA1Rz/Sr/CB0bnMb2U/rCMKEiwrm6jfq1hBljw==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM7P189MB1124.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:172::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 07:23:07 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 07:23:07 +0000
Message-ID: <AM7P189MB1009B900894F02496519B2F4E3A7A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 5 Dec 2025 08:23:00 +0100
User-Agent: Mozilla Thunderbird
To: linux.amoon@gmail.com
Cc: aou@eecs.berkeley.edu, bhelgaas@google.com, broonie@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, e@freeshell.de,
 emil.renner.berthing@canonical.com, hal.feng@starfivetech.com,
 heinrich.schuchardt@canonical.com, krzk+dt@kernel.org,
 kwilczynski@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 rafael@kernel.org, robh@kernel.org, viresh.kumar@linaro.org,
 sandie.cao@deepcomputing.io
References: <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
X-ClientProxiedBy: AM9P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::6) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <4872c1d7-3b2b-4aa3-8e26-dc545dbcf405@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM7P189MB1124:EE_
X-MS-Office365-Filtering-Correlation-Id: a1274434-e201-4eb9-9abe-08de33cf22e2
X-MS-Exchange-SLBlob-MailProps: Om8TgR6f4EAEdu9ieeuz9F2E7JYqAW/XV0cDlwYjtBaLfukcLLujA8gEvuy4jspSjxX3tHpWSnY1ECA31Iop/HL3F+wNVp7a6AkFL1YQo0on3Ik/qQIOUBVbtwxZ5Qt9WuB2qpjDuHFpsQgUc79HCU2tUKzfp8hKlTxkZymNw1RPsHFj6VGO7uIuFsSbIjITFFJiKs99wM50P+PZVKf6/J9sXWl0OrWvMj8A5u3VCsiVckeJ5QegfzSumEQltzl8qIovnYM64pgqn/kGujocuARLLHMgXXj3kwX4sIw5rcy8mdlE6mgichWsXSiW1M7pyharcjdC07zIJqqcSaVL7L3NDLwwXYmXTOStIBtMDpGty6tKU1eg37bJZqt77z7ZA//zZUynjm3in5ZGPNpTMZKwN4VUOFwJLLOCqwGOJk61RHmsO9tUXgqndoJKKRZmfq40xS06RrRyEwjBRGjxAZpwgM6pwYT4cCOCFESnlLzSV0OI3YJVpLFwuef4tmUSh/Z9WKrWuiQZXw8d8NQN9HxBKtTTnyJ5sO3Pm9vGt6GRsG2z5GGeN97m45mjiKlWxoU0B7VbQbibfaizfB3FMSL1cr+Y5wLT9vnhhFQigclV2T49r7d1C7s5qlR560HW2RWkRDU5A6pgKj/03GnbWcpNsKuJgbagC3sPovk6H1P4O55cShvYZkng6EiNFrotVCh41Kjsk0NW3vj3WHxQpCyAlroRQylg8AbDcpT74DoLaYudf8kcbgp6eOpJVyRgj/9iwrag7ONzbREkgK+cOXWGXa5t/vTMeLYuq3MvRSC622OQWT4nSUoH6rnI1YcVKEfD8Oop/rn7S+o+DGlRyQecEgUJv21+
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799012|15080799012|8060799015|23021999003|6090799003|5072599009|1602099012|53005399003|41105399003|40105399003|3412199025|440099028|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWVWa3g4NE0vQk9wSU56Y1pTa0JTdEltTHdlVWYzTm5ObnBtcVJBWjN0eWZn?=
 =?utf-8?B?cGxGNjF2SnlyTnRNRkU2eGd2WTR3eDV2WkxiNm1mb1hoWWJiek96L0VRZ1gx?=
 =?utf-8?B?emFZd0ZERGpkYXR3QXBCSFZXTEpXanlRTVZtUlIvLzVrSFJvK1k0UUxwdFJ4?=
 =?utf-8?B?WnYxcGtmM2U3WDdvU0ViK2x5alBLTUkxNGg0K0d4KzdrWitRYW1DSnVJUUIv?=
 =?utf-8?B?OWRnbU96Z1MweXFyQWlJN2ZEK1RGcmJsNVgzN2FTYWY3cWh2Q3ZJNy9xMW44?=
 =?utf-8?B?VllxVkEraVgweTZhM0h3ck1xNWpYbWJvL0dpSG9mQS91dHhWSENUS1FkYXB5?=
 =?utf-8?B?Qk9aM0JjVE92NUI3c2dsOW1XU0ZnZUVRRUpXUU9yRXVlMUdwdTRDamVzQmtL?=
 =?utf-8?B?NVlqSUVzNm9QelNZK21ReDVEa0h6ZHY0dCtZVXBuVXB0dlExOUNMVFVFNngz?=
 =?utf-8?B?ekF1TmtvVGhaOTkxNU50OVFiMGxPL3AxRUpVbE9uQU1WeDVaS0V2Q0FiQnY1?=
 =?utf-8?B?djZEZ25DYnRuRUp1VXUvYzBvY21sbXVHd2RWMVVjeFNCNFBMdDQzSE5ockJz?=
 =?utf-8?B?Sm1tUGl4K2dFcXJJaERsRDdkYzJpZlFBUVNaWGFlTEpFOHN1WWZCVE1VSUpJ?=
 =?utf-8?B?b2ZIN3hLTHhBbWlNaUFMVzVYeldKMVpLTTliS0xoYktROHQwcTl0ZlNLQ1NR?=
 =?utf-8?B?ckc3cHY3VnVHRVZYYmg3bWdDTmVhcHpiS3BwdlFpUjQwT2FQN2dXVks0bG9l?=
 =?utf-8?B?ckE5UFZxc0tTOG05THZHYUtqWDBjQjRZV1hPZVplK05jU2JqbHVnSld2M3Zh?=
 =?utf-8?B?Q3B0QTZObWtQVGFULzVlT3FTcE13UFJrT1p0aENONzJmNFpwb3MwMDFWNzY0?=
 =?utf-8?B?dUpZaTVOZkpSeFZiaEVDeXB2S0xGd1Juc3ZHV1BHMFZVM0lUbTVMcU1yc1Y0?=
 =?utf-8?B?NzdLUEE1RHlzQm9kQXhId1ZEcWx3QUYyd05nUXlXM1IxTU8vbHpCdjJFK3ps?=
 =?utf-8?B?WXpEZ0w4UXk5MHV5WHl1MW4rZHlCOVJYbnVFV0JwTHZpYlJ6SDhRdTZvUzkv?=
 =?utf-8?B?NENwUUFoWXVFbklUMEh3anFqRVFra3V2bEEwRXVFL2ZjOTUxdytEN3pncUF4?=
 =?utf-8?B?ek9kY2l1VjNjSHZpV1dBV3pxQm9kU0VVeU5FbSs1K2owdU9aVkhHOHdqWmZK?=
 =?utf-8?B?cFVOWDk0MC9ReWttNzJiUk9wcVFaZElBeENSZVY4ZWU0TmNrQUVGZURuQ0pM?=
 =?utf-8?B?alJKOWJrQVQ2Umx0UFJPVnY4eE9BUCtkNFVGWkpYd2xaNUdqaU5UM3lGaC9H?=
 =?utf-8?B?V0JPUDIycUxuZFRnUnZhQjZqbjBXQmsva0hOZ2ZueW0vNy9TeU1Zd3EvTm01?=
 =?utf-8?B?RFVnWi83TlZSWHRZclo2RkRxNFJtbXdESHV1TThOaHFQdnduY2R0MVJFSjA2?=
 =?utf-8?B?ZFo1R28zNnFsWXo5cWM3Q1VETXFvZjVWRjhUL0RnNUlycHZKbzhIYUpSREJz?=
 =?utf-8?B?RGZHRSt3dnlvTU1qQi85ek9pR0k0Z3VsY0JRQSt1Q1BDYWZpUG1IOTA2M25T?=
 =?utf-8?B?L2pyVWhFSUFqa3lyZEdBckVibUswejVJZktBTGNiTHRuMjNDeTA1L0JJN092?=
 =?utf-8?B?UVc3L2tnMGxjL3oxQzUzcjRIQXIxdVlDSlIwRldpTXVuRkdIWFFVaEhNOTl1?=
 =?utf-8?B?b2xZcXVDTlBIRWUxZnJJSkpsOXNJQ01KbjVjNXRMb1BVZVlZMlRsenZoK0Vq?=
 =?utf-8?Q?Rxmg2eNXYxsITNURWThISbwPYK4g2KU4KJY1mly?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFlR1BHcUxxN1RBeGNKVkZpaGFMNnlIYW55TGVLWGI4Q2RKaklWeUJnU0JQ?=
 =?utf-8?B?NG8zQzEyQkx6V2dmcFhrVmFTbUhQR2xDOE4xMWVncXI2UjlkenFXVFZnMjRM?=
 =?utf-8?B?YlpxU3h3bFRydzdYSFZYZ1E5TVpEcElrY2FGOCtGQzBSNlR0ZU5sQnFHNGtI?=
 =?utf-8?B?YXVLbm9mV2l6QkZLa1pWNStmVFZpVnRvR0tUTXphMTA0d1Z1TmYrVUhYcStF?=
 =?utf-8?B?Q1A0QVd0RTFyY0ZuVEtibzVsUWJ4SUd2N01TTVA2dG5IdHd4NHZKVUZHNy9K?=
 =?utf-8?B?RE54VEk4RjhTaFBXMzBabGFRYnkrR2tVYlVXWisxaEdDcUE1ZHVUdXJYMWNK?=
 =?utf-8?B?OU1mNXRIbTFFTnhLenZGR2JsY21PTXBYQXVBT1c3akZWOU1NbGNNV2RQNjh3?=
 =?utf-8?B?VTNJTDFBTFAvd3Vocld0cmsrenQvMjl4bVgrUTNUeDJwa2JST1d5S0V4Q3RS?=
 =?utf-8?B?cmlNMDNpUWJCSUF0MUpCZkVrKzFaVnBqUU1YNDRNMlVrY1B4bngyL1AyNFA2?=
 =?utf-8?B?MmZtTngzMkUzUkhhR0huRnNDdVlKem5zRzFFNmF0eTArQXJySEljNTEwaVU4?=
 =?utf-8?B?OHJiQUZDTWczTHZVY2hLY1loODA4eUc5eFBONkNQSTZIU2VKOEY0Y2RkM21O?=
 =?utf-8?B?bytuR2NzcklLSFNSWk5sbnNLamRLbHIxK1JRWTBDNnVIemc1WmlsZDBhN2c0?=
 =?utf-8?B?Wi9zZTY2TEY0QVVrSktuREtVaHczQ2pqdmxuOEY0UUJJSnJFSkt4MUZudnl6?=
 =?utf-8?B?VjlzaVNJcEZGTmNwb2c3YlM0bFJLSHkvdlhCRHRLS0tvcEJSZnNLWWNPb3Zl?=
 =?utf-8?B?bUVMdVU4NjZKM2U2ak8yWGc2YlNlekpORVJZTGU5bzVueHJCNE1hdndkYURB?=
 =?utf-8?B?TjRnMml2SWNsdmpRankzVjAxNzVuMXJwTm11VWYrbXJQTmZKcFdEZitIbmgv?=
 =?utf-8?B?bU1DTHJReDVFbkU2c3VxMFg2ZmxmbFBBTU9mVkEzWWpqUUhrcHZmUllBVWps?=
 =?utf-8?B?UXlCTFFDU3VlTFk0OWxHa3MyKytaK1Z3aUJUenBjNjc5amR1eURpaVNJWVJS?=
 =?utf-8?B?RTFVT09jZTVRdVM2UG1TZUtVNlNSNDFCM0ZzdEN3V3BMR2xCYnNNcHhrNno3?=
 =?utf-8?B?R2hwUmE3VjNJZ015QU5XWkhRaUY3cW1TN0orNHh5N0pmRnF3b0NJOHRieXZX?=
 =?utf-8?B?SUpGUFZqYnQwek1OM3gxK1h0NHFuTHdocFZBdnJXSHpFNDhQcHYyYWhMK3dS?=
 =?utf-8?B?c1F3ak10UDZuRndqUEhzaXdMb3NXbzVpU1F6Z0FJTlB2SEdKREJNYUlETHVB?=
 =?utf-8?B?L2NFcm5LbjdHcmlISmtObHA2QS9TOXUzT3l2STJmdElldWJzU0lZK24xM1BH?=
 =?utf-8?B?WWVZV3lJMTdkSkhyUDhoajdySVNOcWphc013eC9SMTZLRldXOGlyYXd2YzFn?=
 =?utf-8?B?Z2pLMWMrakE2SUZxMTYycVlCbVBvc2l3MnF5OVlsVUozWHFQSllaY2RJbVBh?=
 =?utf-8?B?Z0lqa3QweHQxNEVXTDJHVUpUUW1uNkNGZHpXOHRQcVc4Ri9vWU0zckZiQ0gx?=
 =?utf-8?B?d1NkYU5VbStkN0RmRmppZ0dHa2UzbVJ3SnE2dW1aU1o1MzNSQTBPZGNidXpl?=
 =?utf-8?B?OXFvajEwc1RkRTVHUlFUL2wwcGFneHJMeTdaQnBsZ1hPbTcvamN5SXQvZUdW?=
 =?utf-8?B?N2FMQkJxaEUrdG5VZ1FiYUQ1VnJrdyszYjFVT0ZpeUVHbE5oTTRrSW54NkxR?=
 =?utf-8?Q?xlwP9/o8rfC1LoBbOUGHazTmVz8asS5KuGUZxGk?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a1274434-e201-4eb9-9abe-08de33cf22e2
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 07:23:07.5581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_232311_411712_90EEE01E 
X-CRM114-Status: GOOD (  15.65  )
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

> 
> Hi Hal,
> 
> On Tue, 25 Nov 2025 at 13:27, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> Add a common board dtsi for use by VisionFive 2 Lite and
>> VisionFive 2 Lite eMMC.
>>
>> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Tested-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2-lite.dtsi    | 161 ++++++++++++++++++
>>  1 file changed, 161 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
>> new file mode 100644
>> index 000000000000..f8797a666dbf
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtsi
>> @@ -0,0 +1,161 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110-common.dtsi"
>> +
>> +/ {
>> +       vcc_3v3_pcie: regulator-vcc-3v3-pcie {
>> +               compatible = "regulator-fixed";
>> +               enable-active-high;
>> +               gpio = <&sysgpio 27 GPIO_ACTIVE_HIGH>;
>> +               regulator-name = "vcc_3v3_pcie";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +       };
>> +};
> 
> The vcc_3v3_pcie regulator node is common to all JH7110 development boards.
> and it is enabled through the PWREN_H signal (PCIE0_PWREN_H_GPIO32).
> 
> VisionFive 2 Product Design Schematics below
> [1] https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf
> 
> Mars_Hardware_Schematics
> [2] https://github.com/milkv-mars/mars-files/blob/main/Mars_Hardware_Schematics/Milk-V_Mars_SCH_V1.21_2024-0510.pdf
> 

I'm not sure if this also holds true for the deepcomputing fml13v01, 
sadly as far as I know there is no schematics available for that.

the downstream dts [3] doesn't contain any evidence of it, neither does 
upstream.

I wouldn't be surprised if it is there but just not present in the dts, 
but it may be nice to get some feedback from someone at deepcomputing.

adding Sandie Cao who did some of the upstreaming work.

Link: 
https://github.com/DC-DeepComputing/fml13v01-linux/blob/97c64fe2832b6826914b6da7aa4febcdd4d3d444/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts#L416-L432 
[3]

kind regards,
Maud


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
