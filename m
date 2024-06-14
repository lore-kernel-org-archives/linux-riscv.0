Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8987C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4G1H1OQHnqNfb+kYTmgzsESdvmsZXKvq2hCjfaHPYQU=; b=g66tekIDuin84pqhr2ys0yCmKE
	pEVpUN9fxdT8BYTOWsNb/wq2KTep3+iXzAzFKFokIL3z9hxbbJSa2Dyhnaabupis911Y+5vW/Di03
	9eoE4/515Vo71nrGdEEwyoNBpdPRXt97pfMamU5Q1bqR4XqHP9IxuTO8wtga9ODNMcu2xmfQZFeDM
	w6kxyODiBWafAWXPSHnduUS7VJmXJ//jht9Vtff9fSYgirYN12eQx4OMqBMCHcQazSi+hztCnKtqh
	TZIxmGKoHU5n/0UgaNy0IZ4si+bj65r9wMA61wJjYckZCxDwiU7NpCHOIqNC1dkaweBkmHgKc0YgU
	Z+Xt4eRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI10E-00000001hzQ-0DRX;
	Fri, 14 Jun 2024 07:05:38 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI10A-00000001hxb-3LUZ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 07:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4K1U0N+bdheGn3afld9e0UMw4gFiT2sqL3PO922Zn2csNF+7HVr1nGns8vtvq/vJSmmWbu7x5SFYKL2GGhhjMzBmXDmAis1y7yoFVRarzzic0Qfu9N3wHjWjzjX1sXpAorJakglCf0pt6yUh+WlIrPBb9ioICXQ5NzDWPnTp2W7Uf9Lb8DkGzaIu84nOhysirtNRFqg1I4oQDIBZL3rS2CvSsewgRHSzm4GDyFUFQapirtVATRqzi5GqGbvLUomRPJ/DHFJgNPBMaX8vyJGk2VLs1Tmy7W4VdhoezaCJ1EY96q45dg6/7WKPfik9dYyZbEyt7wZcTS9cVJMhMLUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gWjo353oZ/i0X+Gm3CxBXqNIuuOMoo6TI9jFc0/EBE=;
 b=T4pvJ9GRhkJbbsC0wq8xxKdzf6o4/UkOBmummXFcej/PVfrQ5w5oVZ+AvDqDmCn6yWEO2pFyoop2aD7Ix1AphAvmL6k29uKlT8phjyj4M7IzCdpGtGmEzpuIm0N3gIygYlJR4w5Wy3qyoEAm07NW5RzJYqg/DTnJ8EkJBV/om6pL8SRl/cELEUFUxf7ljVQSlOQV1+92Pb4fSAbJ8ecwvL6vc+a/KzWWlDsYgTI7Y4vZzVLypbmrQjKPXxv1T7H3uHdRhbq2k/OZ6GOF9A2/WrZQCUgQ7kOeWlAqB78ySo+TqM4UpaW9iMAbImDSpWuaO+nOhvX0HR30QAvzkbzRLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gWjo353oZ/i0X+Gm3CxBXqNIuuOMoo6TI9jFc0/EBE=;
 b=LxF65KUT7jwGyrIpQ4RqFUFo8qe6yTSpGKcpIAts77f273Rnw1cYQd7/UNAH76MGnlwp/FKERBVN07VaeNJvcTKhndFxOTpmbSmfgt8gD0BaJ/yU47PX127KG/ur3EZZG1Lhu6BRh3goG8KBPwu4wjiavQPXZI2mM5ET8xMujpPstfxtsOZeV8R4k4Opvw58r90AOCmkgCe4A7ECHgThGGREYzw+LEZPyAOtuHTBYrXMHWD1v8y6c/sojK9+rtFkLXKx/oQTyK7PsvzwD9cuvLY6B5e1AmXQrd4+7ZOxLL0ME1UlETi2DpkMf9/Eoj5GW90Xq8WCUoMZ+jPRF6iWWw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PNXP287MB0077.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:05:10 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 07:05:10 +0000
Message-ID: <MA0P287MB2822FAB6825487FEC3756241FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 14 Jun 2024 15:05:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/5] riscv: sophgo: add clock support for sg2042
To: Conor Dooley <conor@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1717661798.git.unicorn_wang@outlook.com>
 <MA0P287MB2822B36985A6EC138C2A97CAFEC12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240613-partly-closure-b473efa8fbce@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240613-partly-closure-b473efa8fbce@spud>
X-TMN: [3JyLCXtZpAw/f5Sn+BCcTElAUlqo3CNI]
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <25e2c5eb-273f-4755-9fc4-e80f96996bca@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PNXP287MB0077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc92fba-e9a8-4a15-93a7-08dc8c40545a
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199023|3412199020|440099023;
X-Microsoft-Antispam-Message-Info: yofAFqaTpwyVaMbA32IAKs1hnhSjHPLH8bk4cKFSi4v0+VFqyubfFhcQd0Jz+ddlJESqPp936rEqxt2IC4XrSwx/WpVWL7nxlQbNmxvA4+TS66OYGSJlM3lfCgvsBLQN+8jxLfsOAqzUXxztF7PJl4ysnotvSW7QYb4yL2LPt+XBT+qj9GmAFktgIlekm/lQIusbyh2BfsH1t3j4BUGiXMYa3IHypfF2hHaD/VNu9O8Htkd5wdtXxDhbNIkdyswEWNdnmbLd9VC1eS8VwbxEOX4+G0csx0tqXLp1IdhUOmAWMdAOrsySDeCYQno+LNbqqDjgd8gy/asUGyeJOILw1bbaJSP8nEPHo3gfP7KnOQg0Psldu/B3D5wVcpceT56lR/V0msL3m/GCfeKHMxXUlca0aZlUxBxeKszfUDVu5+ajV7RpZngOqiPP3jVqRJodDVBxjNnCSoZbR5mLEZJRbtNVP9JZWj4hmuOeQK8n/e/QBt9Ctd0/poQfLvv0Fg2KE57IavpFTHn1AqUzVYnJGgpZ06WmFlTx3m1R06VmRcH7aUGr7BianZT0xs8DQk5/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGo3TVdlWUZWSVlmb0NlalJKUDZnQ044cGtodTREc2ZlZ2I3cTYxS2tKVTBo?=
 =?utf-8?B?SmFJd2dSSGVSQ1lNcks0bHk4TzIweUFSbkVEVWpxQW9VU09ZYy9rWmdFU2V6?=
 =?utf-8?B?RUY0R29Vd1RqZXRFTVlMYVpXdjMxaWp4V2xNNi9jTXJIOGQ3TU9jNldxWWh1?=
 =?utf-8?B?YVNwOXRWU1E1dEw2Y2VrYVMwUm1CbzBzbjM3dHE4UVN6cmE3YVZjWDY3UWhJ?=
 =?utf-8?B?MVUya0xlRldZOE1CRFIzNmFZV0x0em0rSlR1VTBFL1EvaTMvQ2pLaE0ycTk2?=
 =?utf-8?B?N2VnMGlIWVIrQ1pPamVYemhnejNNWHdUMHR5YmlkSndqRlgzNmY1ek9EVVpn?=
 =?utf-8?B?VmFOT2JDZE5yS0J2a2haMmhoQ2lNdmExUFU2SHBmRWpTU3dzVlJheGc4Z1cy?=
 =?utf-8?B?SzJ1Ri93R1pydDJmcUNuMFZ4SU1WbWorMDNEN3JweXNyc2dpTTAwN2RMRW1C?=
 =?utf-8?B?ZzNJYjk1S08vckMxN2swNWFOSFlIZVJnUGtMMnpGV1U3QU5DU0JHVmFaWjVD?=
 =?utf-8?B?TGhlKzdsc05hUk12TFc2Zk54UVBBQ0VLbmd1SWVuR09CV1BsZ3RONHNpSWpm?=
 =?utf-8?B?b2FoMkNlT0RNVWx5aUtxRzc4Q0xoR255b3VPaVh3S1gvV0lVOTV2K1N6L1hk?=
 =?utf-8?B?dHVxSjd0NmdUUkVaVGFXY3lCK0N5NnZTQzVHbEhFc0V1ellnaU1uL2g2OFlW?=
 =?utf-8?B?eUdHOUk2ZGpxRWJuQW1Rakc0T3NVeUdKVnIxajRaVmJxeStmZTA0WHRLM0xP?=
 =?utf-8?B?eWI0SGZBYlQ2Wk5oRGRtL2J3MW9GOVJpRVNnYWI2UkJaN3ZQRFBDRjdUaWZ5?=
 =?utf-8?B?V3lQdmJISW9RaVN2aTZ0M2FVV25QTHlZdXlNeitkWVpHM1kraXFyQVdRTVk3?=
 =?utf-8?B?QUhaczNwN1M4UFNObzNVTEpuOEpQbFhVV0Fkd1Y2aXRDbmN4TUpCVHB6WkRm?=
 =?utf-8?B?S2dadVZsRTBhaVVYc3ZMK3UvNTdZT3ZDdXNMMFJiUjAvanpHejFDSlVydnpp?=
 =?utf-8?B?cGVPSmdlb1NYTHljNVByUjViS0VpUlRNRlc1Sy9mNThkSk12WUJtbzVBTlNt?=
 =?utf-8?B?ak5WeHJ2TmxodDBIeDlEaGhKeWJDdmE4STdxSGZoV3BackU4OWk4NG1qL2VE?=
 =?utf-8?B?ZTVrd0RVWnZaeldyUEZuNWo1TGMwSU5td0UyZjlVZU14L2s1Y29RMXhoLzRX?=
 =?utf-8?B?dU50YnFtOTJ5dWJhMk4zOWJiSTJPOUM5QmdqWWFVVGlIellOODlnNjBXWmlX?=
 =?utf-8?B?M1RyckF3WHhXa3g2Z1psM0tFdGFiS2VGR0R0emt5dFJaQml5TjFLams0QmVm?=
 =?utf-8?B?Zng0N3o1YUZQZEJQNXNrM09XQmx3ODVrblFVWnpBZUc2Tm4wRlBqc2RLMjZU?=
 =?utf-8?B?ek9HcytuZll5VFgyS01YSm80YnczbGZuRkJ5djYzb3VYUWhpcDYrRk5GUU93?=
 =?utf-8?B?V3A3a3hrNk1nczVGZjh5YU1IZzRSeHJ5RmJ0QjhiRG5qaThSa2dQekVXTkZs?=
 =?utf-8?B?eHF2UEgxUmVOcGpWN2NQS21pM3g3LzZkdUowQ1FhMkkzVnhFVmI3M0pJL0Ft?=
 =?utf-8?B?TEVjcUZqckMxSTMyY2lCU1k3UTdyc2tMb1ByK3E4RjRoL0tJQUZDL3B3T1F4?=
 =?utf-8?B?dGFhLzhrK2szdGJSQkhCam5OK0RqbE5iYmxQSTlsNENEMWE3YW1UZlBnZEF0?=
 =?utf-8?Q?7lzRQ1n9v5HuMH4fCzbL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc92fba-e9a8-4a15-93a7-08dc8c40545a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:05:10.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB0077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_000534_878547_DC955914 
X-CRM114-Status: UNSURE (   6.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2024/6/14 0:45, Conor Dooley wrote:
> On Thu, Jun 13, 2024 at 05:34:03PM +0800, Chen Wang wrote:
>> ping ~~~
> My suggestion is that you, as platform maintainer for sophgo, apply these
> patches and send Stephen a pull request. That's usually the best way to
> expedite patches for clock drivers.
>
> Thanks,
> Conor.

Thank you, Conor, I will try this.

Regards,

Chen

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
