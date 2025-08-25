Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77399CA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikF1UTzKqvJIu3mpL1eSKjysvjNwWdUM8tglcNfjbbw=; b=3SIVl6MeDKO1iZU7AgRbVV4Kct
	8XJZq3hk458WiPfXusrnFw6VbASxPV4G2pEM7uXDwGkuGG5uYVdMYGfMVl6iEY7jYLj4Pt8YK/Fco
	cojjAeEKBqJ7oFz304qtVcqp07e6A1FBVFXCzMIr30oG6VwheyVenQwlH0GLuOCme1AdcSKuyufT4
	dzSESnkhBezW0Awa0/w0k+UXevVdNe/PyTgw4M0ud0JwOoo1aekf6I14WuZAyRx3oag+HuXMFoyet
	Cq6X9Miwcb11XPfJruBGEL9Gb0EXRWYVh4+wlJRyDSmyH7nSQFJVv54IXOEalLAhss5j3I15Y5Ntn
	QFTt+Ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRem-00000007Ab7-1yYD;
	Mon, 25 Aug 2025 07:30:20 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRCG-000000076I7-47p8
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 07:00:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jkm930hRjSPcF5nrQOSINJI9yMn48cPTKOZbS5IQZYpne73xyqAG3ZgPzmBvw49D/w6Q1FNm4u1XA9BbR3zsWUh0l1rzvDPt+Yvlibla6UqImXfGZZI0o3Rl9PRzW8w1lcqlDBIZc9CKQU/i8522aDyidfA0AVpwSxf+Et9LZd/PSd9ZIEw8dad5dDCd3vaVdD91s+1dkXpOM5b+jXNxqO+46lnVCbM9Xzhn3l+tR259ca0MS62Ays3JjzglNY/fvKFAcXkXt5QNGiaJUW2ojUvTRQisHPKDEZ1LC/4koaCTpvZPnw55QHQhGenCG6CG1lrDF9LDDH8iF+OgdrPZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8aetLae86XuAG5W0u5vLH9fvlhz7EDjJf7c7UW4JFU=;
 b=UEHzy6Zyps2J0J/YJCk3OPRgtYahUSjwBpqFV2qWK+OSGwlugGWpaq2j0PL44fSiDPg/9RQOsF2AR+JkCNVqVd7J752rrfearTu/Ab7VLHqbybJ+Y6fnmK7DA8eugVw2f6S/Y7oqshpoRj441fg6+k/pirh2djAuJ20c+3qUXibPSy9rLAyoW99AaVxHEBMaUVThWg6H63cJeNDC5uDhIsFKk7achLVq+cu7UeZF/RTnmrJpTFB/2hkAE14BmFb6xw+EKCegiFjg0Tk3usmgK2YG3mEPO+fcurq8Hc/ukI7MKzVjjeu0Dg3wuogNQYVhlBJPUSNTuOcY8tEf0lbeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8aetLae86XuAG5W0u5vLH9fvlhz7EDjJf7c7UW4JFU=;
 b=cJHFcNq3oWCsFwMlMuQXHTN+heNA1J5BIYbMm+2EcDPkiMKMK7B3s67w5KAhD7A/Fh5InGZnY127Blm2IAjtfWKzapAAeFZJQOzyXgBCh3t/tfY0p18p8EU02B9g7lJiAcprK9VCFf/QoJrt9JhOYYChPMeFfIE3WDUMqIVHg5hDkHYXgKcZCTFGL1RWlHP8oqomHGg5Ko1Qb0K2fs0JlW+8Nj0/vsYfltq/5dY0eQtcgpi3XDUzHtrIWPc0vEVWHp4gJSnTRed7SlgUx71LaaxTqaMUvXarVx23asoKj7neeSR2EYYz/G7Njw8V1IO7H/51Rv0YN9rEVghPfuA5Wg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN2PPFE1AA473C2.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::5ac) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 07:00:26 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 07:00:26 +0000
Message-ID: <MAUPR01MB11072A30DFBCC8E1F8CD7219AFE3EA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 25 Aug 2025 15:00:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: sophgo: dts: sg2044: change msi irq type to
 IRQ_TYPE_EDGE_RISING
To: Inochi Amaoto <inochiama@gmail.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
 <a0ddd70d0658a26a24a9ae48d7ea9e59dfd7cb6f.1756103516.git.unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, inochiama@gmail.com,
 krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de,
 sycamoremoon376@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <a0ddd70d0658a26a24a9ae48d7ea9e59dfd7cb6f.1756103516.git.unicorn_wang@outlook.com>
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <1602d346-9b2a-4196-aaf1-72400ec12496@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN2PPFE1AA473C2:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca0cd73-201f-4307-1d9b-08dde3a51141
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|461199028|5072599009|23021999003|19110799012|8060799015|6090799003|3412199025|440099028|41105399003|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlh5cktuOUMySnZ2cDcra2J0aWsrUHNuL3dVd1Y5WEt0cmxPSlpWcVNMLzM4?=
 =?utf-8?B?a2ZpdE1hUU1YQjdhR1lSay9MeW14d1N2MUY3NGlIS2V6aWVMS1RvUFNZWHN4?=
 =?utf-8?B?UitjeG01UWtqOGtLU1VrVXVlSXRROEgvdWZ3S0VtRFBHeElQd0N2b01pdElG?=
 =?utf-8?B?QkFvc0hjczZZbHYwWGpvNXNkenJ2UUJsNU95Wk5DTUwrTkl0ajNFbTBFMU9D?=
 =?utf-8?B?L3VvYzdiSklsWXpTMVdyZzZ2eU04cHdYU1d3ZVRJS3NMSjdzOFUrZmJnR1Zm?=
 =?utf-8?B?RzhlMGc5emNoRWlyUm5Kd0RVblZQdFovUFlnNUtFME4rTklPS0E5VjgyWmNN?=
 =?utf-8?B?Rm5GSlkzd1p1a3BJNGhtbXJjeFVZZnBFTUdadVVlSWFPVU5xczQ5dEpUN1hJ?=
 =?utf-8?B?Wkg3cGxZc3hHVk9PQkgvaWIrWmZNdmJtRDJXSkloWGpINEJlaHozN3J2aXRO?=
 =?utf-8?B?a1ZvcEhFbXd6aHk0T2Rpa25JS0dYdm1qbTAwdGd2SG5kNDlMWHhwZmI3d3FR?=
 =?utf-8?B?b2VCdi9QVXROZXpBL0RpZy9GSk9LZ1R0Q3UwS1pBbkl5RW5uSDZPY3hPdi9G?=
 =?utf-8?B?cnVoUm8wRmVKVE9wblpIY1RtVWVkSkVvVC9DMkZoeXZFUHFlS1hmS2ZDaXFs?=
 =?utf-8?B?V2JJbThEbndtbmZISHFqOUN4VG9wWE9Zd2JYeVZWWkUxOWhWdXcrbGw0V2x2?=
 =?utf-8?B?b3dUNU5lQTdaVVlISUtVdGdjYW1ySUpldnFQK0QzVFBLald1YytpYmlNREJM?=
 =?utf-8?B?Rk9GSk1EM0Z5UDVwWHFuTUdQK2tFZUl4MVNNNjJaMDFzTTJmRlpTRVBVVmIy?=
 =?utf-8?B?Z1FzSFRpMUdzZ21VbURWODNZL1I5MjRBS2tESG9rVEZTaFlFL1gvOGZ3Rlo4?=
 =?utf-8?B?T2ZJTlVLbS9KcFIwaVY0SFIrYWg5aGhpV0FNUWw5d2JQTUZLaUVPN25CTXJI?=
 =?utf-8?B?MTRGMENQbmRiNTVqN3YyL2RHcDdOdjcwUUxqKzNLWDdkbDF0U3p6L3hpWU80?=
 =?utf-8?B?M2pNT3BIUEdpQnlsODhOMUZ4Z1pZTHdHZllpRlVHQUkvOVBpSXQ1TmhzTEpP?=
 =?utf-8?B?eTNzMUNyR2M3QnNwNkZzc0ZqSmxyc1hSaXZWUjdIa25QU0hlSFJTT2pKcU9a?=
 =?utf-8?B?TTBjUUZycjVTR3k0eXY4NkIxQlo3d3FyUllYbXFSZVlDdG1aa28rV3ZqTEVX?=
 =?utf-8?B?eEJmZURzQ0tLS3JxTWN3bUtUNTlKNGljalpQNVZwU043WVpYaTFpTWxxTnZv?=
 =?utf-8?B?VHZxSFVWalRMdEpQdXorajF3TENMbEhXcjJ3Y3pmeUpVSDBSa092THUyZDNK?=
 =?utf-8?B?WENsRWRRRGdRVDZSZzdwV3dwMHdlU25HNSt4MFlZazVYb3NlM0JHSUlBbWtC?=
 =?utf-8?B?NVNadHhnNFhYdWgrdy9nd3NrS2hGcVlRVnNrd0VwOGliMHB3NmtxYzJEcmtY?=
 =?utf-8?B?UHhQcDAxZzhXSVNFcGg2dnhIMGNoWjlCakRBZm5maHQ0WDRVVmpoUFV2MVFi?=
 =?utf-8?B?bmJOR1k1dmk4SndBUTNvV1k4S24rbG04OVpLMXpWYzdIaFhqVEx0V0tQRWJ1?=
 =?utf-8?B?VTAyS2UzVDU1T0tCSzJVTUtIN0JEVzZLakNDLys3MG9ZTmhrZ2Fid3duK3JG?=
 =?utf-8?B?SzZZSzFxLzZ0NW15b25EbDhnUGJyYWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2I0Y0piQTZSUlVNaWh6TVI5N0U1eXZ2RysxU0J5bEVGZHM1TkRBZ056NkZV?=
 =?utf-8?B?ZDlqVW9uUmtCMkVreFhxYWRTYkFtRG4yK09qYmYveVVrd3Fza2p3T0NVMG0v?=
 =?utf-8?B?YW4rM3I0K3pDaDdKM1FFOVEyT3lVc05LODExWE5jSmlsWkhSejZxVmI1Si9V?=
 =?utf-8?B?QTcxbzc3RUw0d1ZqanZnTmxTTUwwSzlQb0llMUdYYXV6MzNWazF4Q05jbnZU?=
 =?utf-8?B?RVVXaERuaGcrTjBma2dKZEhKc1NRQUdUUlQ5TlFTUm5sUTEyd1VISFdvMGNJ?=
 =?utf-8?B?bit4MGFldVgxWW4xOFlScDJoVVYvY29aaFlRWmw4dzc0ZWpxdDZ5bjEvejFZ?=
 =?utf-8?B?U3UwOEVsZ0gwSnJoME9wZWVNWThheGZVenBGcnFrTldNRmFxbnBVM0hONldx?=
 =?utf-8?B?aDcyWEswTEYvcTdwS3k4Tkw1MWplR2ZLSlJlY09EM2Qxc3oxTGFJUUVOeXN5?=
 =?utf-8?B?bFBxOEMxTUtUbW4wVGJhK0dWSUNOcVNHOTE5UGdRRU9DYnRFc2kzMlc0OEFN?=
 =?utf-8?B?RHZNSzJEQ0tuOFNiR2h6Y0pkS3VCcXRpYW9XN2ZObHRrLzVNQkVNWGtWKzEy?=
 =?utf-8?B?RzI1WC9nakFtT2VYaVp0dlBZb3h0QXNxdnBnbmhpZHpEZHJCTmlGZVU0UGxn?=
 =?utf-8?B?Qm92OU4wY0ZjeU9QTUJxQXQ1RnkvK3pZSUVybFplVTZZRzNZZUJUSU1GYzVN?=
 =?utf-8?B?RmhyVDRlM0NUZE5MbkE4cytIV2hPYk9vVWZyaUdUZlV5T3FNU1IvMHZ6bDA1?=
 =?utf-8?B?d0dKQUFUaDljeEpyZjA1aEVaTDRyVHgzdnVCZU1Qcnh1ZmtEWHF1eDZRaGpQ?=
 =?utf-8?B?a2g0TXdPY3FhQzRaWTI5ZVdUZUlDeEx0QW9iWWpGb1lIYlgySXdGL0ZhR3c1?=
 =?utf-8?B?a251RTVMRS9XOWFVQ1p2a3FCNEVxaGlMOVlXVENWSDJ3MzBwTjZoL2pFOTdB?=
 =?utf-8?B?SVhoQ2laNTZZdE5LY0tkZk1vNU5VMkw3cmMrWDhBdmttWVMwRGdZSDA1S0kw?=
 =?utf-8?B?ZlNHdE9jN1RTdVpqUGw2TXhyMFY2SFFxY21Ua3N4TXBERzBWV2RTYXdOeVFw?=
 =?utf-8?B?OGhlc2xFalYwS1BSRTRPNmFGZmJkTmxEaURFSXNKd3VNQVlndUE1dnJnQ294?=
 =?utf-8?B?NWFrS3RUaWZPL21uNUk4TjRPWkhidjFVRGVDazRxRVdLbVZsUk1EMDJQV3dK?=
 =?utf-8?B?RUZYOXBha3NPdkFReHVqam1tSXlpRTdONEgrTjltYm0rTTdJaXJycUZ0Ulgx?=
 =?utf-8?B?b2hrcUpvbnhQcHJGTnQ4SVVVL2NRVHZFTksyK3g3RFZsT3NudTRucmg3VzRv?=
 =?utf-8?B?Q1N1WmlOMmZWempmMzZLcUQya0szdUlzbDRweFRDZXRSWFhWNlZaMzhoRk9H?=
 =?utf-8?B?NytiRVdlU2ZFV2Zoc3pQMDB6clQ2NGUwdnJpbGtLQkxwbjQyeUM2UG9nNDZv?=
 =?utf-8?B?dENzUFFIeS9Iek5mQXNuekprd09ZR0dZU2gzaXRXb0ppSDZycnpycGhPTlQ1?=
 =?utf-8?B?cnZ1bk1EMG5iT2tUUzUrVFBlT2ZEdjN6SXpIUUg5cjdhMVBvdEtvZzNkeG5j?=
 =?utf-8?B?U3FISHRsL2d6U2xXUWVyRmRKeFpwUWFjTWFIbWlwZHFFNEw5dWQzb3BkaUVV?=
 =?utf-8?B?ZkovdHgzMmhMQjlNdUFwNGlXYnRYTnZaaGREQ2l6T24xTXU1MDByZ2lZSDAr?=
 =?utf-8?B?UEtNNEU4T1BJZ0U5ZHhXVnV1V0RrRkUzb2RBY3NjSFVFMUU1RUU1NEZxdDFn?=
 =?utf-8?Q?wc/fvWL/g/TPNJWOm2qB6FgpYbtUBJ4S9uiKlFT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca0cd73-201f-4307-1d9b-08dde3a51141
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 07:00:25.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFE1AA473C2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_000053_038297_5B108213 
X-CRM114-Status: GOOD (  14.67  )
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

Hi, Inochi,

Please help review and test this with SG2044 board, I only have 
pioneerbox/SG2042 and it's tested and works.

Thanks,

Chen

On 8/25/2025 2:56 PM, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> The latest MSI driver will read the DTS configuration to set the IRQ type,
> so correct the IRQ type in the DTS to the correct value.
>
> This field in the DTS was not used before.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> index 6ec955744b0c..320c4d1d08e6 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> @@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
>   			reg-names = "clr", "doorbell";
>   			#msi-cells = <0>;
>   			msi-controller;
> -			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
> +			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
>   			status = "disabled";
>   		};
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
