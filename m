Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D40CA0FE5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44ZEMeyi8msILR/cBnOP4jyIFKPGRTpx+OilVl0pS1M=; b=4zrHk5Jyo257IOi/BtoYeWiOFw
	iAoCJ7laNcvkfebcfQtFrZqAchf788bOmcyQKuDFW1N99GSGumY8KoERQISEyLqF1y0PXIp1iT71B
	FrMHlAZgmhhnJc+kwIqt1SUqCucPdIr3XeXGYnbuR21fsA0BTHPqLSQiCgvIVUjdvoQwGxSchDslY
	TyDJmeO3+k6p1x8E5jHJXy1FaX4UwLDyH1eKKiPnf31dtL+4uRK1X0FSRCf+TMBNMBL/dzvpPA2pj
	RBPm6dsS+fkLK5zi0IUGJO5Cq5e+nWm3xUUVNROO67OFHFQ8t055XvkAmDf6+X2Gvtl/7K4yT3VoS
	g5SnNx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHH-0000000G1v4-2lTf;
	Thu, 21 Aug 2025 07:00:03 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyvg-0000000FyNG-3oiU
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 06:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcAkSg1PInwkclibbrSK4nvra5sOmnjibcCvwRPxNh9+VNV2IAr6Lp8ackczcSn9ye1VqSmCRz0Hc2WeRS1/Y73xEiMpINM1bug114ea1WY4Tys3DZqxZD/btihV1azEvA+HKiLDdbc6pdySiwmRLXhGD+NUYxEEaQVK8HxqMjGAEuMG1z32+YRlLXOF1m2w3kFFu7toLaFeGpSPJ550xol95jWhzUTpbfKNao7MjBXniIe1a4NjntnT+ASyHIjm+P1nYvMXhO7s+20UYQM1Of5eO+rgeSFn9FZcw5VwPkTzzHcc1ZBWj8wGACooTgAPnXmZdvoXDrhUhX6eQTAzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLFrUjMld994qj3TKJkFRPLU8/7FcVMcW6e3REww3Xk=;
 b=oI4y2VvHcqLA7O7FTbOzE+zCez9MqXsh7E23gZiVcIlQ4X2CJLH3BGO5pA4We30o9fW7NIN+UI0ehurW+88gKXXpnMHH5IalpD3J6yO20LqXmONFANoQZ1JrUlHkeu++B3LLZyi07Wvhq35NS8r3SqDGnZRlPLhkqlYUGOtQcOfahoMIFX29zO+ZVZL3SDO0//Z38OC7sD7cEMp6GKgKwzjbTmjIZO/RFHnXwL3v+LJ7wxefoIxYODKZC3K5TPwYPNZEDbgT4Jk8jPz5r2UTUEDoXikPjZDp+mVgvndN/KbVimlNTk3dqpfMVayd5cgDWwaxmv7ffRlDUSgX7OwjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLFrUjMld994qj3TKJkFRPLU8/7FcVMcW6e3REww3Xk=;
 b=LdIl2lW5+JvE1TI5eA+xn1zjcTj0FeM82N8fGLzjaE1UQ58JQwxzk5TlZlkHwlej7NKUAKf4uOYIC8r09f6A39Rdy0VtTs2gnEAWzBURjfgvN2cqt1bvzVES+rkN8C4ki2Dm5PssCw6FtMpCfFODsCe/r5yp/frkrln3kYqjKboyOPPVbWUxMNlzm9hr2Z3lw0DiqV42VNx8jorHRf/erM1RNQeX+mo1p58sDCoD80L240jlX4NLmxArHWwfOizO3tgbCVI/rqfA3foo7rWIaDrHP9zZEt21UhCaZMybCB8VDvb2IX258761qFPm5e/D8arc8OdZLw9EwvA/Iuh2gA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PNXPR01MB7353.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 06:37:30 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 06:37:30 +0000
Message-ID: <MAUPR01MB1107213FB5E04569DC6010DE5FE32A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 21 Aug 2025 14:37:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip/sifive-plic: Respect mask state when setting
 affinity
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Nam Cao <namcao@linutronix.de>
References: <20250811002633.55275-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250811002633.55275-1-inochiama@gmail.com>
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <85005b4c-da92-4429-a152-ce4e706719b3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PNXPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: b86743f0-64e7-4309-101c-08dde07d339d
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|5072599009|8060799015|19110799012|6090799003|15080799012|23021999003|461199028|3412199025|53005399003|440099028|4302099013|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlFjdnpITHRBbDhUUlR1RDBEYU9vY0VXaXd3ODI4bWlSMVVrNERIdE40Njlm?=
 =?utf-8?B?U2xCTFFITUJhRjhkY1I1MVgrV0V3RWd4cjdtT1QzWndoQ1JXRmU1OUVRdFd3?=
 =?utf-8?B?MDFjbE1mWVhvUEh4S2JhSkREeFdiMkNxcVhNQWNJYUhUc0tMOGVuTXZjTXZk?=
 =?utf-8?B?ZEtxbjZ3ZC93akNCTzk3VHY4MUZGWnl4YlhyY1RTZ0lISEJMZGJtbis2UW0v?=
 =?utf-8?B?N2VKTmsrd0JBZGFlRWJCV3pSVlFjU2xTZTFpRExTQXo5NHhwWVJQME14OElI?=
 =?utf-8?B?QmFucjh6SnhTRFJ5NDZldmZSV05lcmtRS1R4NnJvOTdDVXVqeHVJOEVOYXZ5?=
 =?utf-8?B?Mk1tUEYvZDNWclUyYTlvbFpCL0c0ZW1vQU91OVZPTDV0TTlnN0VwdDk4aDh6?=
 =?utf-8?B?ZUFaUVdIcUNzVEJqUHdMUGFCSFJwTGNIN2R0dXd4T3hKWmNPUjFwWmllNWQx?=
 =?utf-8?B?a0xOMlZhMWljeXpsZkNKOFdOL1lleXJobUl3RGZMZkVGS0xuWi9qMlBxZEFU?=
 =?utf-8?B?UXJaN2Zva1ZzdGMyRUZIMlpiRnZJU1RkSUNIYXc0T0xtV2RVUzBJV1RCWEpW?=
 =?utf-8?B?UDRuWUhrYzNmUHYzUzNZN01kYjk2V3BYTVlrUGZPR20xZjR5K1ZCK0tLemxj?=
 =?utf-8?B?RDBndnBVRksxaHZhR25ockphRkgrejhUcXZzQXBHQWlNNERMU3F4dHpLWS9v?=
 =?utf-8?B?Wm82TkkyenQyMDB6YWhTdHI3ZTQrUVNDZUl6RTV0UlRoZVhuUUx1cVF3Ukk0?=
 =?utf-8?B?MUZyTlBqTkxJLytPTUdZdXc1MU5JZ1hRYmk2M2lhQmNlRUozQTF6Tlp5WHhp?=
 =?utf-8?B?YndTUmlGVHdJTmh2YXEzQXJGaDYzUXBnU0Z3MWRRR1RiUi8yR0Z5MHRrMGEy?=
 =?utf-8?B?TFhsK3VBNlZsYnlCS283YXE1SUlFNzYzS1pibGVnSVh6dU1QeUdTOGQzVDJl?=
 =?utf-8?B?dW1hVTVJNVFOemc1VXBpREZKOUxEZ05kVjIvaTF6VFhoWlI5Wis0Rk9iNDhY?=
 =?utf-8?B?bjBqRENOQlVnQjVWa1B1M3B0djJRTjhGSnZNdWZ5Q0hEOTI0d25pMlpzdU1r?=
 =?utf-8?B?cVdvZXRIc2VFclhHbms5N0krb1d5MXlyVG9OaGh6U1NkRndsMURIZ2dwU24y?=
 =?utf-8?B?R0hmZ2N4c3hQZDduL29kRldLb2VkNWJMRVFneTB5RnBYblRXYlorSjFGTWxv?=
 =?utf-8?B?NFBIRTIrUTdIcGNCM1hOdk1ReUFmNlorWW5hcFJXQ29BZS9hWHRPWmV1am0x?=
 =?utf-8?B?MEx0WGRZVnZ1ZWk2Wk5LWW1SbkdTL3lXODBsTVhvcFU0amZvcGt3UGk3Qzc2?=
 =?utf-8?B?blRPRHBQMXJvLzFHMFR1dUZKSUpxN3FMbHR6Z1U2ZUJCbG5pMDZDdnBUUm84?=
 =?utf-8?B?dkIvTEZvKzhlZ1JrVC9qOEVxbTByQWM0QlNYL3JvUjlEK2xsakk2YUxHNlpJ?=
 =?utf-8?B?RXA0aitUWndTeHpONUN1a0ZSdEpvcms3YUNFUHhSdFZhRGZFTFNzNGVodW0z?=
 =?utf-8?B?MEtQL0JVek96SG9CZXR6TXVtbm81NjhnakhYdC9UWjVuOExaQTBaTElPQjRV?=
 =?utf-8?B?Q3QyVDVxbWU3NExqWEM2K2pta2hOK0w0ZXBWei9tL3NWRGx0bVdFcklHTHRy?=
 =?utf-8?B?T3VlK2ZrNU9qNWsybmh3UTlQZzluTHF2NXhVczNiQkl6RjhDTXMxeUhzbDFj?=
 =?utf-8?B?d0V1U0RPOFFjb3JOVFh1cGk2NjJOa2VOSmJBeHVhZ3BPZjZEMEFqSml1S3Jr?=
 =?utf-8?B?SCtLQ2pVZ2pyMGh1eDRPc2lmcmJFQi9paFZwNnFYMHVjVHE0bURIOHFlNFVD?=
 =?utf-8?B?eWtFeWhBZjRacFBabkdLNUJSOFBKSnNWSFdiei8ybHdWRmJMZURkb0N4VXdv?=
 =?utf-8?Q?2DXKKHa17Z0nb?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdqYlJobWw5U3FBcUcycXBZcWFvWnkyL0VaTlVYRkVCWHI4b1lTWU9jU3NV?=
 =?utf-8?B?ME90RGl1Vkc5ME0rYXEvNk1ucGZYb0NpNC9YdWYwU0JMY01HbWo5eHRjQVM0?=
 =?utf-8?B?VngrQWdiMXhkWS9meE5XclFLSk9nWEgrMGtoQW9QV3A0c2pncHFPYkNFaXBE?=
 =?utf-8?B?UUhqMWh1T0pLVjgrV09TQkZVRU81UXhqa1lTSjR0NHBmUThMbFdROVJBdDBS?=
 =?utf-8?B?VC9KME95Vnh0OGFMUFlITHZ0eHI4WmJ2WEk0MlRvNHZHUktNR0hRN2pLeFow?=
 =?utf-8?B?SzZDWWo2SC9VUXBDYkRmWTZKd2loWTNQdlJpMWw1eGVMdnZMVzFnaVh5QldV?=
 =?utf-8?B?Q0xTc2FNeElBYm1Cd3RpR1IxRXFsb050NFRrei8wRlJCZ21USjU2MDdvTUE3?=
 =?utf-8?B?RmNYeWwxTkM0YnlQeWZsUHdzR1MzcEN5dmNlcjhmcjBjano4SUVTWlpNYzFC?=
 =?utf-8?B?YlEyMVpCcnV4bm54SlF0ZURxZVQrNTBCQi9jTWphK2xISHRjbXVuNTZYMEla?=
 =?utf-8?B?ZHVyUkNLdEJXdHBBcENHSjlVRGFybjFwc3JPbElTZEtPdERWUHVoR2M3dzVS?=
 =?utf-8?B?cnZiWmIxTFZ1ajVMazJrMUQvVDZBMytnYnh6ejhxMzRDNGpnaWlRdTBIenQz?=
 =?utf-8?B?Q3lyYjRmMExVV205RHVtU21aMHg5T2hTeXpsN1gyQ0t2WHZ5WkRQdU5BSG1k?=
 =?utf-8?B?YzhIclE2SVpBb0xla0t2TERNb21VbERxZUIvd0FVMWR0WStYNk5aczRxZHJu?=
 =?utf-8?B?UHpQbmxEemt2dmJFcDBUbytEbzk3MCsyUklINVVJb0pNTUFJaitIQnB4MnNn?=
 =?utf-8?B?WVkvVm92eHB1NnVPdW5RS2VmZGNxaWt5OWNTZkZOR0dlMWFNcXArdDBOYlI2?=
 =?utf-8?B?bWVWcTJEUzZtd1RoN29ua2Y1MXlMYUV4L1pJNTVsRXVNMjNmZ0NNVG0xckxY?=
 =?utf-8?B?akcwZW5JLzdPa1d2M01ld0xoZS9sb3Z0ZkRBVVVQNS9PWGxMTzRLZUpVdVFh?=
 =?utf-8?B?bG9lbU1weWFiTEtWZW9kS2k2Y1dyTE9oNSs4eDE0YWlReUFSZmN4bmVVTXVz?=
 =?utf-8?B?WHcwdHZlUkNmajVOZ1hwbkVUMTI0Q2svUDhBd2dKTVZlZUVZQ2NoNW9MT0h0?=
 =?utf-8?B?amJzQUZhQXErRDZSc0lWVWdsanNQTVRGN3oxeHJiTnhzUERzWkY0TlJPbW5t?=
 =?utf-8?B?V013YisydmtaK2RMYzdkMGllSllHOHRKbDQ1WFFBZzdFR0I4ZU9jRGZHMStC?=
 =?utf-8?B?MHc3ZThtYnlHWlNId3BHU1k1a2VxdU9IOW5GUXo2MFQxcWhqa21wU3RjLzFl?=
 =?utf-8?B?K2J1QTNaUDVRWm1PajNTaUUxMmgvV01mZDdDZ1I5Yy9ELzRkK3RyTDBoc1Vz?=
 =?utf-8?B?MzN6ZHZPaDIrbWlBaUNadWlZS1BMZVU3RXJ1amM2dlFvOWVwYWx6NEU0OHdI?=
 =?utf-8?B?a3NaQWNjOXc1bDVmSWlPNEJmWnZQUXkvcXB1WHlZNXdQZUIyOVlYaUVUYmZm?=
 =?utf-8?B?UzQ0K0cxQTExMmRBQ3NiMVVxeENZOG9LMDVsWmlNOFFkdW1xYll2b0VybDk3?=
 =?utf-8?B?QmJKcVIrc0NLcGZlNDI5TFcrcG10WHF5SUllTm5mZFJZUlpVTFF2Zno2bytT?=
 =?utf-8?B?dHZVZXY0Wm9vT05OOWVZV1A4dVVMdnl1ZzJvQlRhdlhRVmJIbmZ2NGJuTGdz?=
 =?utf-8?B?SW1SOFJsTXJpRko3ZVN4aHcxQlJGNFl4d29lRzdGKzF0UmdmSTZlSlNlRFV1?=
 =?utf-8?Q?af6vBrNfEZKUc7jHUjGZHgdniLJdCRKTHrqPiij?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86743f0-64e7-4309-101c-08dde07d339d
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 06:37:30.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_233744_950872_79F35344 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDgvMTEvMjAyNSA4OjI2IEFNLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IFRoZSBwbGljX3Nl
dF9hZmZpbml0eSBhbHdheXMgY2FsbCBwbGljX2lycV9lbmFibGUoKSwgd2hpY2ggY2xlYXJzIHVw
Cj4gdGhlIHByaW9yaXR5IHNldHRpbmcgZXZlbiB0aGUgaXJxIGlzIG9ubHkgbWFza2VkLiBUaGlz
IG1ha2UgdGhlIGlycQo+IHVubWFza2VkIHVuZXhwZWN0bHkuCj4KPiBSZXBsYWNlIHRoZSBwbGlj
X2lycV9lbmFibGUvZGlzYWJsZSgpIHdpdGggcGxpY19pcnFfdG9nZ2xlKCkgdG8KPiBhdm9pZCBj
aGFuZ2luZyBwcmlvcml0eSBzZXR0aW5nLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxp
bm9jaGlhbWFAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBOYW0gQ2FvIDxuYW1jYW9AbGludXRy
b25peC5kZT4KPiBUZXN0ZWQtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPiAjIFZp
c2lvbkZpdmUgMgoKUmV2aWV3ZWQtYnk6wqBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29r
LmNvbT4KCkl0IGlzIHJlY29tbWVuZGVkIHRvIGFkZCB0aGUgZm9sbG93aW5nIGVtYWlsIGxpbmsg
YWJvdXQgdGhlIHJlbGV2YW50IApkaXNjdXNzaW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSBmb3Ig
cXVpY2ggcmVmZXJlbmNlIHdoZW4gdGhlcmUgaXMgYSAKcmV2aXNpb24gb3IgbWVyZ2U6CgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNzIyMjI0NTEzLjIyMTI1LTEtaW5vY2hpYW1h
QGdtYWlsLmNvbS8KClRlc3RlZC1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5j
b20+ICMgUGlvbmVlcmJveAoKPiAtLS0KPiBDaGFuZ2UgZnJvbSB2MToKPiAxLiBhcHBseSBOYW0n
cyB0YWcKPiAyLiByZW1vdmUgdW5uZWNlc3Nhcnkgb2ZmLXRvcGljIGNoYW5nZSBpbiBwbGljX2ly
cV9kaXNhYmxlKCkKPiAtLS0KPiAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8
IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+IGluZGV4IGJmNjlhNDgwMmI3MS4u
ODY2ZTM4NjEyYjk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBs
aWMuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+IEBAIC0xNzks
MTIgKzE3OSwxNCBAQCBzdGF0aWMgaW50IHBsaWNfc2V0X2FmZmluaXR5KHN0cnVjdCBpcnFfZGF0
YSAqZCwKPiAgIAlpZiAoY3B1ID49IG5yX2NwdV9pZHMpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+
Cj4gLQlwbGljX2lycV9kaXNhYmxlKGQpOwo+ICsJLyogSW52YWxpZGF0ZSB0aGUgb3JpZ2luYWwg
cm91dGluZyBlbnRyeSAqLwo+ICsJcGxpY19pcnFfdG9nZ2xlKGlycV9kYXRhX2dldF9lZmZlY3Rp
dmVfYWZmaW5pdHlfbWFzayhkKSwgZCwgMCk7Cj4KPiAgIAlpcnFfZGF0YV91cGRhdGVfZWZmZWN0
aXZlX2FmZmluaXR5KGQsIGNwdW1hc2tfb2YoY3B1KSk7Cj4KPiArCS8qIFNldHRpbmcgdGhlIG5l
dyByb3V0aW5nIGVudHJ5IGlmIGlycSBpcyBlbmFibGVkICovCj4gICAJaWYgKCFpcnFkX2lycV9k
aXNhYmxlZChkKSkKPiAtCQlwbGljX2lycV9lbmFibGUoZCk7Cj4gKwkJcGxpY19pcnFfdG9nZ2xl
KGlycV9kYXRhX2dldF9lZmZlY3RpdmVfYWZmaW5pdHlfbWFzayhkKSwgZCwgMSk7Cj4KPiAgIAly
ZXR1cm4gSVJRX1NFVF9NQVNLX09LX0RPTkU7Cj4gICB9Cj4gLS0KPiAyLjUwLjEKPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
