Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFBE7C4C6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzNvFbnUh98gCmJvAnTaBRje+jLJ7x4aVmoOkA6TdWs=; b=T/gW4gjQF5JfeqkWoC1rDG5ayX
	CjhIkPUSnnmA0dA1WZuMEh7iawPjoryp4+chDL/XGb+54/tpgARY2ipmfUds/wsccx4FQAsPqOhNU
	VIp8n/nxqKqSLZTd7C+ucuGvZ0LWiHY1+ioyHHYry3hhRWTlJBxg8jyHjvrcYhApebET4SC550kAH
	feOa1axH7k7f+bkPdCek6qC/N/fia122Hd3jtIuLE88DRQDi+nq9Af0KtjqV8Wqv/J1wPr5UOuVe/
	NCUDRC8QuOk0qdPXMWw2L6HRfa4Bz+hHFh02arLIKoK0TQs5fuqrQoejEV5VbgJALncQ75TmkU6xe
	b137tZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo35g-000FVZ-2a;
	Wed, 04 Oct 2023 14:43:08 +0000
Received: from mail-bmxind01olkn20810.outbound.protection.outlook.com ([2a01:111:f403:7011::810] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo35c-000FUu-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNjZvhYcxfwVH+664fwFLci9ixeaqe3c5IhMLvSgRvEefjZBINIw3Bxot2BArlgFl31QvQAahkasmZky5G94gyplrJjC3eKGrw5wQ37SpG5LPj3glJb/yx4qidHadDkCgI9PBffV03ScRkKG9am1sPi56amkd9bvum1jQqI3lD0W7pEUCH7n2uzDi8m74Ee6Ll9VPSDmwjZ0sxSVfVkhRSNtym2ZWw3sc49Fm9ItB4rBVKkDly855fk6MNZjjvnajOXRNBaBzzIltPa1Uu8kUDGWEucubPwIVVjeNpg+cLYHs51WaZMGIi1jDuNpRlGYK+I/fKx/wLHZhOd8s0zd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgLXzx6ULZ3UGgwmfYU4LzHumCVe8Rg1UHAmbBaRcDM=;
 b=RsCxBn8bDsYjonEi24fGvoPck/PjODbef6IRqnwA1abQmpndLoSakiLMJr3DSwapVbEN8uRGP2zsv1+g0ydqWYtPQM/GRnCb8VbHErzuwZD1tENvHtCvFo3axUTiJp+epPuLcjUAGPGBRgr8goFRPJCNXRLXvqH9na1Ya70QOtlbMvTPrxgHBcd/7PaVY8OU4Y3Kn4NrdlnrbD0rLB8EPXv3dW8S6c3kjpA+6RPciW/xH2ey4YPLiDwerUU43j00v7iFTFw3wV9M3qdVFslQDUaBuu/APjbw+fxrdfrH7SSwGYeqsVbJWf4Vp2YQuVju4DbdLay2k20AXGLNSXcECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgLXzx6ULZ3UGgwmfYU4LzHumCVe8Rg1UHAmbBaRcDM=;
 b=AcT2xSzx5aiVqCB3B1eUxWDti7EIa3l05iJjlXnb0OBx8MIh6s+co2odeUkxbL8C0+W8uPCaGWfDyF0RVxfQMG6KdV0m1k31PMspdNycRBcgBsHjUsoPGkhNWTJXnxKwyu2SMDTZrQTt7eUe5cVLtxFSDwo4n2bxSek6Sxy/VFXBeGsFtAYWsQO5Izbxxl1tujTh7sq+ztRiHDvGrZy9wZttSSo9O0L7owMcVJQ8n+5MF/Z9ZRM1XnHD/cuyzrjtE/rTijnHD9vle4FLeOhOaCfeqDAMqhSGEWFPtnQXQwe7hXdKs/2FUy1+WXm77apuKTV8qGUTmIaXdBMeo7BWTg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB2337.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ab::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.30; Wed, 4 Oct 2023 14:28:00 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 14:28:00 +0000
Message-ID: <MA0P287MB0332EDF53C7B61C3ECDF8F39FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Oct 2023 22:27:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] riscv: Add SOPHGO SOC family Kconfig support
To: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 devicetree@vger.kernel.org, guoren@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com,
 apatel@ventanamicro.com
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <cover.1696426805.git.unicorn_wang@outlook.com>
 <MA0P287MB0332F61F4FF161D1BCC2E659FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <MA0P287MB0332F61F4FF161D1BCC2E659FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-TMN: [OVjyqm0uNGDDfNdV/9CpIuIEfzOwf1Rh]
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <db89197c-0214-475e-b302-8de63e97de5f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB2337:EE_
X-MS-Office365-Filtering-Correlation-Id: 56179e23-e587-4b34-6549-08dbc4e61c32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8WHom9QGik6DTzEaPBsZ2g1ockXkU57d5fPImE9fd2fzmCOj5WdDKOI86PSS4Vqwb65Icn1Tfrtv7XqR2hBslUR2POzkhDAOpMCRZVD7T+5RYQCfB7RE6vd31FvQEJziICdniN61KsEFyIB1IAyU1L205bQeHana/xC/pBJ1uj2RX+f1XuyBedyXncA0vDawqEIEs9U8DhALrM4LThqAQbr9JHyYai/vO2ElDS7yc+ktNNy0Y5hh6djG0SDGPmYWm8JR5BLLmeRZBtK8jtwVS1sbW7QVvCjO2wTcQZ57P8DHey2kYSLxDF5SuBMKAw239y4EN8TnYf1BG0yrtrM7AT4s4P8oFz7qYl0mujlQAVjkuWa9AbO+GV4R+re1sOlFRugyYYY3Glg50B3O+iFJ164E0FZgoQlvpVdRZiE2qeUUxhhFbbl+NwKF/L+8elY8Rw+8yCV9O640CnCSHMT41+v6DQApFVJH9qZnwYEswx089d/VunRYOmtQuUWRKQJU+su4x47Lhp8Bx/Z+IdjD5APOdrvFG5/sD2ZP1mTBgz+TNEIz5qb86Q+/GvgdD2A
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlpWEk1KytjMWJONVBlNHpuRG9JZ2FkNUs2TitCcndjRHRDUDlzU1VyRDZZ?=
 =?utf-8?B?T0F2UGlLMVN5ZHpTdFlnK1N1MmlITVpyNGRGcG1FQjM1OUI3amxOQlJpNkdS?=
 =?utf-8?B?U2hOc3ovdy9zVk9CUCsxWWNORXZVNDRLaGpkcUcwZytpQXl4bng1QW1EVU9j?=
 =?utf-8?B?WU1VQWlscEEwK0U1eFBrVEN2eit3NDRHR3lxOHFOcFNpVHhvNWFJcEYxQ2E3?=
 =?utf-8?B?RmVOcmk1QjVZVW5GNHM0WmNVWWJZeStoQmJEZ2cxNlA0KzVBNzJFYk9DUFFH?=
 =?utf-8?B?WXk0YWtic1pqd2p5RlNXdUtrYWZqalJoVGpEMi9ISDhOSGwwVFpBK3VWTkZl?=
 =?utf-8?B?bE5OdGJnbE5nMUJaTnQ3NTJLeXp5M3pNUC9NYldDcVFZSE5aaTNtY0RSTVFy?=
 =?utf-8?B?Z0dCcjVNT3hWaDQrQmxJb0dLNHpOeWp0aWIxaFp3VkFEU1k3eSsvUjJHWlBD?=
 =?utf-8?B?M2VQZFg0QjJnY0RncEhucy9MRUNua3gyN25qNmUranVxay9UTTZQTHhyZkhC?=
 =?utf-8?B?VzBvbnVmYmd0SXFhbkFjcG52ZUpmMEhsbFg2em92VlZheEtLUGVrRmtjWnJO?=
 =?utf-8?B?dnhGMnkrMW1FYjVWTXRrdHJJdU13L2VvNUl2T2FnVzYwdzZZY1Q4MlZYTHRz?=
 =?utf-8?B?WHlhblBBb3Y2NlBSYUNMV29XcTB3Q3kxS3VSZi85Vm1kbE9YRTkxd0pScVpL?=
 =?utf-8?B?bDdZVXZzOS9mY2NJdUJZUE5IY2IxT0VEcGEyU0tFUWtKU0FScGhYay9BZFFZ?=
 =?utf-8?B?dnEvMXNITWhudnFDb2h3QStXS0kxWHVsSjhqY2FhVHlnUEVlSksxcGI2UCt1?=
 =?utf-8?B?VGlhREpsK1Z6YTJ2aThYY2kxbmdHazBJN2tQMGJvcEJFeEhDckdrSDRIUUNh?=
 =?utf-8?B?WllkWDg1blh4MnhmeEtQQnZyUkdFU1ZpV2FqczdGS2V4QjRsdkFNNzhGMEhm?=
 =?utf-8?B?ZVRsdUNWamdHNW11em5EZE9kN1FtWG5XdU5QNWUvV1hLVzFJaTBVSHBmSFBa?=
 =?utf-8?B?SU9pSUR0RHlleklyemNyQ0o0aE9CVXo2Slg2YkRCeUlKS3hwTGFUU1hNT0dn?=
 =?utf-8?B?MVl6Q3RSeENyWERNY2w3ZXo1b0o4d1NaQklVTHo3OVJyT08vMDlEK2VNWVZa?=
 =?utf-8?B?L2dmSC9sNE5Qb21YQmhMWjQ2QkRZVE1maGdIRXYybGgzWlViVDV6QmNoKzdY?=
 =?utf-8?B?cDJ4ZVVTSjNraEt6SXRPNUhTR3kwUEdRSmZSZnpzV2hwTm1NaWE2MFdKeWV5?=
 =?utf-8?B?d0RWV20zMmVLQ003Yk8waHdlbXc5WXc4UEZWdnRlL3R0UyszeXNiQXk5S3VJ?=
 =?utf-8?B?d3lxSklnTUsrdW43MHJseUorK3ErU3AyTFFvbHhkK2JLa3FPbzU0ZlVvUytR?=
 =?utf-8?B?TVFlOXdtbFdISEpNYTFLbjVlT1VZK1A3M3RNRmx4cFlsYWZTTTNVS3NrQUwv?=
 =?utf-8?B?ZGJObmdlamZuVDQxKy9NVkpSRkNTMmJ4blBKSUt2eDdRbStsOC9TQ2lMZVN4?=
 =?utf-8?B?NThqY2xkZXVibTN2OXRSNG5NQnd1N2swbkpwcXIvS1VYeHhraEprS28yUDJa?=
 =?utf-8?B?QlRvZmJjdWpDK3MxbzlJdVNPZWtKcDNqR0NhcnBHaXNzd240SHM0d0pPbXpH?=
 =?utf-8?Q?aTZNyxMlBwbihckagKyM6gShRyEeRx+4o9gBpTrTIrE8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56179e23-e587-4b34-6549-08dbc4e61c32
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:28:00.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_074304_242342_4DA4484D 
X-CRM114-Status: GOOD (  11.22  )
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

Sorry, please ignore this email due to not sending out in thread.

On 2023/10/4 22:20, Chen Wang wrote:
> The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
> cores.
>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Chao Wei <chao.wei@sophgo.com>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   arch/riscv/Kconfig.socs | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6833d01e2e70..d4df7b5d0f16 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,6 +22,11 @@ config SOC_SIFIVE
>   	help
>   	  This enables support for SiFive SoC platform hardware.
>   
> +config ARCH_SOPHGO
> +	bool "Sophgo SoCs"
> +	help
> +	  This enables support for Sophgo SoC platform hardware.
> +
>   config ARCH_STARFIVE
>   	def_bool SOC_STARFIVE
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
