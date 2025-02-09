Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5C0C021A0
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoF29cVD61G9na9VdbejIOduqVZsaJMKfKRU07SCkMQ=; b=1hYQDBacxp2G+fTyvEpnSgMKMp
	vHeVYl0JXBo8ihvChhCWeMudZ71el2Sq/FsQYl64/gpyzRz8GdxQ7sy6TrnorQByi5I3dcJt3Gf+c
	PX5yMRhAMJK2bee2QOZG9JOxe6p2IGlKM1l/WK88vw2LyZbyKNg/3Z/aTGqjoMSNTqT3wlDTlrsaS
	EsDN8YKFAFph2s9y3jVB6l38zKLOUR88iPuzQHwnS1BKQvCL0J+cIoyLCnfDIuy2ujzA4+dnUM9sr
	jWczW93brk94sqfWhGGXuna8Us8aW2sEMviIWCWX+Ui0ID8zCokN2pYprtCMCz6JB9zj4Wyu+oinC
	hOGUB2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6a6-0000000EsU3-3Wva;
	Sun, 09 Feb 2025 12:38:38 +0000
Received: from mail-am0eur02olkn20808.outbound.protection.outlook.com ([2a01:111:f403:2e06::808] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th69h-0000000EoDe-1FJF
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 12:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9Z9xeDmi5H2Ed18RmUKcHvATZslDAUn2CQIfvmXiZWXzQSuKZ/OghBBPsXAwYl4Vma05z7iXvAxvHa3QQ2gidug1BwbchVO6QOC49mm2c1q7camfOoTMV+oFC+hUk0Je/LFaK28W5mEHc4uV3Y0ewisGZqnddXQbtGOa49wl++a93c4P6rSUgq1+GpSrDSWqtgrq5rSmxyTOd3CrJEC5WNCv2Kk0XX46RCgxm6MVwbvLNwjldUHGvj3x3Z1G6Kahjtjwn1NBzfsTfliks3ynnyz1CHI1wAa80QzAoOiOhooWV0FHZyYQERL3PWpzaF0Xgvg24U5ogEwOo9BfTwbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Caa3bEyIMPqm1cyP6wUgJ9AYkiz3USg5T6V01spzVFM=;
 b=FxGgLF0AcBTYilkHFVqUT2R+OzRUSRcmTNKHNOMsENuOl4DwHV+RHrahNmebhfQG1BOJ80O9H4u3ci4Qvj+Uib8hhUn3H1cMBmAhEbDF47M5OG23xvAjo7Fi/nI+GDqVGYybVqi3iW/ATwvwzb1/vlcJpdve4ye+hi2UsvuRgsY1rsqbfihfpZcZtqjPbaLWsX7NoIE2/bc69QG2xCGK/JQaLxwdNnMSJkmcCusccnn32lxK3ZwoF0KdJb+eMQhJYilvSzBF8YapD0ORtZD7IyA1rQ2CM28J0n3qobDiYhuQPRGbzm9rjjgMoaCTYjgyp5Dur+VVYI96fkPhbuwqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Caa3bEyIMPqm1cyP6wUgJ9AYkiz3USg5T6V01spzVFM=;
 b=r+Ge3xMN47p9LaWbATpp/vzXstDk4ZVnJqTd7P+7zL1mXty6i9pSv9BOqr4XapvCoSTdmNn563gvBIU2aTACBcDtsfgtAHvb+Z6JewNwRWVOV4gGR9OIEypWcN0wOSfWVVMeg51dNAUTfnd468Be3mvOUqcFRuSjk9c/smUQD0BwIamHCLuE7MFWZPiLgB+WfTb/S91RDeAO5OcuUQQRH5tsqJnPEXlLiaLFxCG/yjXj01q71TAko+RatWuWdMK93Ec9m8RSann727oxWLEU3+hQ4jd/Edkc9MPi+YhPot1MksPr9tvd3MziIGD3O70pPeUzGaxPKc+PH/sjXMMRkw==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM0P189MB0820.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Sun, 9 Feb
 2025 12:11:13 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%7]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 12:11:13 +0000
Message-ID: <AM7P189MB100992851E58C8CE0AD8EC38E3F32@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sun, 9 Feb 2025 13:11:12 +0100
User-Agent: Mozilla Thunderbird
From: Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: enable pcie1
To: Sandie Cao <sandie.cao@deepcomputing.io>, Conor Dooley
 <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
Content-Language: en-US
In-Reply-To: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
X-ClientProxiedBy: AM0PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:208:1::43) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <c307034e-6d39-4792-9be3-70ca80e19f2f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM0P189MB0820:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cc10af-7218-4fd4-ecfb-08dd4902d89d
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799006|5072599009|19110799003|8060799006|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBRU0dHUnpQOFdQZTBpb0hMa0lFWHljQ1NXQXVaS2YwSmhOTElLODJseC9x?=
 =?utf-8?B?OVVjK0x0Z1k5ZTl3bXM2WkVNSUJmRjk0N2VXQzVhOHV2MFgyRFFVZUFhVzZW?=
 =?utf-8?B?UEc4QWVVOWgyZVdWY04wR2V0azIxVUdWa29FMjRERTNySU8rNU5rZjc1UG9Y?=
 =?utf-8?B?RzdwNTRaR3NpWW1oT29RcnlOV3BRcW5TUWxrTlZyaVpNNjREaUVvZnMzOU9I?=
 =?utf-8?B?WjJiZGJPdTF1UlAyWXc0YU00TWxtUjQ1MGxma3NwZkZHSU9TZ1JDZXVMYi9T?=
 =?utf-8?B?WGRCdGxXOUFlcTFJdUQ2OHIwZytMSS9TeXpCNVBsRXBwdzl6SXpsZVpybkNE?=
 =?utf-8?B?MFo5ZjAxSG5OcWhyV2Q3Q2g2dDRKSXpRbXVLcElVTUNJWTJkUEt2TE41eFQ3?=
 =?utf-8?B?dGU0VmtTVVFsU3NHdUZhcnBUMEhJVUwxUG5ua2VKdGVUcFFGUU1YcEljNXJ5?=
 =?utf-8?B?azg3T1JrSkJxYUZWNUt6SmZEUWhCNUhyMk12NXNFQStCeU44eExySDRQNmF1?=
 =?utf-8?B?NEpDaHRVeE9VQk0weTRIbVhacXlValNmYkV3MmhSZDlBRHprK0l5RWM0UXZU?=
 =?utf-8?B?dm1aaHQ1alZTNGxRZ3NZMXBkUDZRU2NhOWtzRi9tRVZKREdwQUVzckxaQk1F?=
 =?utf-8?B?cGx0QzNvcGFPQ2tvL29Ja2srVGNnTVdORjlwMmRvY0tKM2RnUlZLVnNFRVRB?=
 =?utf-8?B?d0RyeG05RlI4NkE5b21Sc1QrRXNpdW1ROW9nVG5nTDh5c01zSklXenRrVXhG?=
 =?utf-8?B?MVMwbmZlUHdKKzF1cm5TQmxWb3FuMFVOalhJcWZ4QzRWNmNqSUgxZEpsSHBK?=
 =?utf-8?B?TUVQVW5FdHM1eTFobFk4TkxEQjVmN3FzL3ZHMjFvOXMyb1ZJaXNnbkdPQWs5?=
 =?utf-8?B?K2haUTNyRVM2c1V6TCtmVzBoSHh0TFUzV1h0bmtGam1PWmt3UDI4RzJrOXJN?=
 =?utf-8?B?MnJ2Vkk3bW1FeC9FNWtQZFVpU0ZiSmxMR1FDUkVMRnRJOVBlQVAvSG8yV0Z5?=
 =?utf-8?B?cWxjNFBlNjJpbXd4Qy9BYWNUZFAzWm53VDZIbDh2ZGdub2xvbzNCSDVRcFlO?=
 =?utf-8?B?UTdBNU5OcGMzZUFscnRNa1FHSVE3ZzB2ekdqMTFLSXhnK2c0S0NpSVl2b3Za?=
 =?utf-8?B?bE41MUNYaGErYk9jRTF0UnNEa3VRM1F1ZUJHM3hwcmxza2tlVXFxeWJLNm15?=
 =?utf-8?B?MVRHblZpbTUvVXFTMmQ0ZzBjb3FDek9ZUHdtajY2UDZ1RkdtdG51cVpnVXB4?=
 =?utf-8?B?YnlMNTlxYm9GMkViN3dRQXBsdllSTGlFTXNudzUyMEtHYTdVd2JTZy9kbzZD?=
 =?utf-8?B?Q3poK2ptMjYyQUF4NU1GZk0rUExRODdEeGc0VEc3dFhTUE5tbTlRZmRlVHMx?=
 =?utf-8?B?QnJaTFd0bEpIN2lYV2xrRGRnRlFKZ2dyN25wQkNIdTRDZ29QRThvRW9WbUM1?=
 =?utf-8?B?L3ErSGV5QlNTMGFZNjk5bUE3TFFQZ2loaFpVclVBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWFzUEc5SHIwSnVIT1NVZ0thd1phNWVsa2J1WGc2UFhuL1A0cVFYWFpCdk44?=
 =?utf-8?B?ZG5yb1VlYTBFeUpFRnRodkIyTC9hVStNakl1OUViWHArK28rZXpCM25UYzYv?=
 =?utf-8?B?MkYxTXVpTWgrSDRQdW1PZHpGMFBDU3p5d1VDQWF2RUJINDlHVEYycXBMYmY3?=
 =?utf-8?B?eVV5ckc1QTlVQXlPTmx6TTVYQmpaZU51YkhGZllIbHZBeXBRQzh0c0ZUYTNI?=
 =?utf-8?B?SjJJTG1XZlFlR2xBdm5LcmtDa0hraFphSHBya24yelcrcUowRGpmQkdxRHFG?=
 =?utf-8?B?dG9SaE5UUENnaTA5eTk3N3VBSjZBZ1JLNVRua3ZCQXpHaE9JUUtPbVdNRExw?=
 =?utf-8?B?YThYbW56SEFZQi9SKzBTa1cxamlYVjVUb1JEZjVORGxWc1oyejRYSFMvR0hh?=
 =?utf-8?B?ZDBNeG8yTU1FS2srN0VUVk9oR29VS0NzK21neTBjZmVua3JjUEhXUGh6ZXda?=
 =?utf-8?B?TGg4Sk9zQ2IxSWExdEtHNU5XWVlzYVlqU2FoNlJFb2NaenYxUlhEOUpKQ2Ux?=
 =?utf-8?B?TDNkbFRTSlJkWTZWV29oVmFaT2JzcUprWHNFQ2xLVDdqSkt4SUpJUGpuQVZx?=
 =?utf-8?B?M3JkNGt6VGRxL3I5ZWJMUEZUNnViRFRuTHk3b0hnZTlCUXREQUZBK3lkMzV1?=
 =?utf-8?B?c3dPQmVtN3VOYUpjc3BGV1ZNSWJLeTVmWjFKV2kyWkxxcmVlb1dvS2t2TnEr?=
 =?utf-8?B?VEtTL2ZxcGErWDZ2SjhHdVNNL00raDZQcUxNRGlOZzZVRTYrVnM4OEFHRytF?=
 =?utf-8?B?Uk8wN0pMcjBTaXZmRDlGWjlzTEp5eFJJS2xQdkV2aFdSQlpKWDNUWlNvSU41?=
 =?utf-8?B?TXp0d0hQaUtGT2FYV1h1Q0dST3RpbGhUamtzT0tlM3hlRERFNWF5OG13NCs2?=
 =?utf-8?B?eEUvdUxmOW43UHc3Q2VwSWVyOTM2Y1FhSlFCeGt6SUdLUXREUWFoRnEwQUdq?=
 =?utf-8?B?YjY2WHF6MitreEpqVEJRSE1ZYmViNDVJZ3N3MmtyeUk2THhnV285VTdIWjNR?=
 =?utf-8?B?aHBVMDdCR2RKZVBQa2ZEc09mSGdqSnc2cXlISGZ2aFN0OE55YkR5ejM5NE5l?=
 =?utf-8?B?Sk45MWMxVTd0RUJoL24yWitwSnVHQlZzbmpTVG50VTZJbk03WEYwLzJveVZH?=
 =?utf-8?B?L1o5UWs1U2E3akRXVVlXVFo2UmRWWkhQSkcxZ1EwaS96TFJYSDc1QXo4K3g4?=
 =?utf-8?B?bStaQ1htQmFHK1VoTmdOVGNmWFpzY1BsMHNHdkkxZ1JrUWd4cS9ucndrQ0pP?=
 =?utf-8?B?SU8zZzBaY0E0cW1QN1JvN3NmNnNQQUtpbEYyTW1wSDkxZWprZGk2VWV0c3NG?=
 =?utf-8?B?UzkyMExXS3I5VC81SmRPcWVkSTdPSUZBaGx1RStjTjlDbStqVWVFMjErdHZp?=
 =?utf-8?B?aWRvS3FMc2ovUjhPa1NYbEttNWZoODc4MVlTME9jMVA5UmN2OEJiWTFjdWg5?=
 =?utf-8?B?S1ZFN1dadWFSMnBWZWkybFFXV28rQ0xXNnVaVS8xZmpCc2lveG9JQkQybk0x?=
 =?utf-8?B?RTF2NnRtMUJ3WUhiUTFXT3Z6dGxWd3pUK2VvN1RFekF4Y2x1ZHBVbGVvTnFo?=
 =?utf-8?B?MHRmMThqSmkrREx0cjBvZ3l0NEtHT0IycFpBa1lrRFB5dHI3STN5YjdmT2M4?=
 =?utf-8?B?cjMvSnBnU2tLVkg3L0ZRODkwNTJQMm01aHJqV0Q3OTZDOFpEVFY1bEFwNUQ5?=
 =?utf-8?B?V2lDNGR2ZU9HUjlJMUxaM3ZqSU1nWXlsVm5KT1Y2SmtVd0RPY2l1L1VPK2dH?=
 =?utf-8?Q?lRE0MQwXEXJQPgZizLF8gfteFklj8qmA/Rlrkyt?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cc10af-7218-4fd4-ecfb-08dd4902d89d
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 12:11:13.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_041121_353770_EBFC4876 
X-CRM114-Status: GOOD (  12.15  )
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

On 2/7/25 10:36 AM, Sandie Cao wrote:
> Starfive Soc common defines GPIO28 as pcie1 reset, GPIO21 as pcie1 wakeup;
> But the FML13V01 board uses GPIO21 as pcie1 reset, GPIO28 as pcie1 wakeup;
> redefine pcie1 gpio and enable pcie1 for pcie based Wi-Fi.
>
> Signed-off-by: Sandie Cao<sandie.cao@deepcomputing.io>
> ---
>   .../jh7110-deepcomputing-fml13v01.dts         | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index 30b0715196b6..8d9ce8b69a71 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -11,6 +11,40 @@ / {
>   	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
>   };
>   
> +&pcie1 {
> +	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_pins>;
> +	status = "okay";
> +};
> +
> +&sysgpio {
> +	pcie1_pins: pcie1-0 {
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(29, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		wake-pins {
> +			pinmux = <GPIOMUX(28, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>   &usb0 {
>   	dr_mode = "host";
>   	status = "okay";
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b


Tried this on my device and it works as expected

Tested-by: Maud Spierings <maud_spierings@hotmail.com>


Kind regards,
Maud


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
