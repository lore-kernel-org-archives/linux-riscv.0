Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BCCCAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 03:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdtMJRHOKcCc3N2VLRTclvrH48eY3IKE4kpcyd4w/TM=; b=aldbkw7AScqomPDnL/RV8mHr9c
	PzIMeJuv4vczVNNriTxyQtc7f7SMA5UbiybG6tkWEl8gb6fVsYZyjR+TtpW0Uc5m4ZgzWzXbBB4px
	qt3fHAsCfGZ221lwd1Cjxr54hCVyiekxaRlHO8nQMFWl/Z0mTgALYhYgYCDEKuJQGP4gGwcWesTVd
	ZQEmEmCaMdvMGICYasUn8P/jHv+ZawXKs8FGOC78/bZAF/qQ5umnWiCTZRNrqAs7P0KJ1fly2nqKs
	MkrqkykMMcIqYZO7VNLc93vIziUmJZPsW9Q7u1Mq/rrqgOhXiM5gvNdJC7ufi+4qFMaSq90lKSqr8
	GtIWoJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBOi-0000000Bp0L-0HGi;
	Wed, 10 Sep 2025 03:21:28 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBOf-0000000BoyT-37rs
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 03:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJfZBThKIUxz6c1kXLPg3idJZZOS2MV/tBc3z8OREDOKpVqLWaQQbtA/6XSRSFDWQlFzqXn03ojhphXGInzRvEUAtwUbC1q3T52NYfJ/zOCfI7EaY2qYGq9XstOSCy400a+w7FZbzaKgeCfDzg9aGBbi4SrLgf9hX1VyUcpDG2tMQh5SdKd1/nWIdN0E09FAQ97d/pLOa5+nL1TAIqfVxqcFIfu5k/toQAG7+HAKvaJXqWs+4wR6nmFsCo2MNdIYwZ1xZaSy2Utn2KFIIrPLnoQDxM7B5vBQoFm4wplHmU1UPCCC76Cy/Si4aHo1DiKUqz/oaN6KD9QQWRqu5QQPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJGNrAkc4KIwLMfvnCdw2IejK4ZRwy4tABSe+MoJyxc=;
 b=A4TE9nUc/AolhJT+zyVxaQ5DL6WOtMVF1IaPUEm1E/zhkAjeDqqy0J1XCXr6L3GtPojUzGG5wQAcaBKF5mL7+6QHgu82JOLAiT/EHfoYYxImEHEPhNYYR79hxxBCCVcY2KgL2Wq2mq3akuwkZPa92qIr/wujWO948x9eChAjQyXqjjw5Ik9it4TeFTCZb+xHSvqtxBM+CN62ngP22pij3wgJWiIeQmYB6xpVpuabA6HSsf5Z3hdsd2y+HuGN4QluUj6oUKSP7ufb1nVmebPCqBeT+0r0jgOfYMy0khlfzHTpO9Gzj1E5NFsgaK8mRSsR+94c5wDec1NCBC+gt4jcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJGNrAkc4KIwLMfvnCdw2IejK4ZRwy4tABSe+MoJyxc=;
 b=ohAdzmitLBDLFcI2k5rLVPNlcjYjG7ZFYG13FqOnoMKEg9OhQ4/IGo2dRZ7lVA5Q0GOfcLNQz2mf5aMeaSxM2anF30fzmo2hxGxdW7XQ40TW47KaKENr/BR1x5N1LYDGa8ZesmDpcj/J+vbqm0hLO/V8XWymyNb0nHv9HqUzPOdf15BsduwRHYM9M0Jjio+z4y3ra0B/lxUayBYDg1RB6CfU0MqrWWaA8hY8KAplqdN7+FfLCSA8mLsqN/rd0Ps2lRrTMngqyFCOHfQ95TvUM532miBtjh0Lg6F72lHP8NHHDPwrl4Y+f7G2hDgstNLixkM4VqyG0urLal2TwDpJTg==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN2PR01MB10334.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 03:20:59 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 03:20:58 +0000
Message-ID: <MAUPR01MB11072EF3457DA48317FBFBB09FE0EA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 10 Sep 2025 11:20:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicornxw@gmail.com>,
 kwilczynski@kernel.org, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com, bhelgaas@google.com,
 conor+dt@kernel.org, 18255117159@163.com, kishon@kernel.org,
 krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 s-vadapalli@ti.com, tglx@linutronix.de, thomas.richard@bootlin.com,
 sycamoremoon376@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 rabenda.cn@gmail.com, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
 fengchun.li@sophgo.com
References: <cover.1757467895.git.unicorn_wang@outlook.com>
 <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
 <xmk5uvnw7mcizxpaoarvx2c2sejaz2skaiyyac7oo5y6loyjgp@5v3sldwbqpw5>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <xmk5uvnw7mcizxpaoarvx2c2sejaz2skaiyyac7oo5y6loyjgp@5v3sldwbqpw5>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <5292aef0-e2b2-46ce-8d3c-2ac9c80cb5a5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN2PR01MB10334:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b3abb4-1bf6-4ba2-3a1e-08ddf0190f94
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|8060799015|19110799012|461199028|5072599009|6090799003|15080799012|52005399003|40105399003|3412199025|440099028|41105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anVmZjlkYUJGQlpFellURUFNdGhCNHQ5Z0VndmtCU0lxb2hXQjNjZjdGeG5H?=
 =?utf-8?B?cEppVU9BTExrQWxDOWZxdXdJcjl5dklFOE8xeWJ4ajZGRFlUc0JKRVp1YVRl?=
 =?utf-8?B?UlZFaU1uQ01sbnBvcnk4cEhmbFF0bU1RVm1PcnVQa1lodjgyaTJOZ2tYcDNa?=
 =?utf-8?B?YWhGbzhRdmRULyt2S3dDdTZGSFpDTXFWdW5XUzQxREF1Sjc2aUh6UlBTTU1i?=
 =?utf-8?B?amV1RzRYSUdYUndVVjN5eW5vMUZmNTZRNDJJR09UY2xTOWt2V2l3U0RDTlJs?=
 =?utf-8?B?T2NzSXVMN3NMQUJ2WG8rQjVXa2NBRHZFRlE0UEtQRXFSSzN1VmtWQzVoa2hP?=
 =?utf-8?B?TjZKUnA5Rm4rNnBIc3BLRlVESDVXT25LVlJJWngyMXlaZUd6SDh2OEo3ZWxB?=
 =?utf-8?B?TTNFMG9wd2tEWkZjUWY0MWZOY1R2NTIxOGdzejYraVUvNEltVFdhaXlwdlF2?=
 =?utf-8?B?VHd2QzNYUGlDenNWSFNlS0MyejZjZVR2Y2Q0c1RzTmgvL0FTTXRVT0FWSXFH?=
 =?utf-8?B?QVNUUmgwME5VbytzbVoyTDZuRlo0ZEUzeS84VFdvMUFCVmUxa3pQd0FuZVhy?=
 =?utf-8?B?VFlJcnZYQVdwRUtLSW9rcklLb2QyZ0ZXVUFtUE9MclRuYlJzYmxPcms4bjNs?=
 =?utf-8?B?OE5DREZJWWozTjR4dHhkeGFGaG5OcE9GMVBsZUc1d3FGU04vU3pudy9OTmtW?=
 =?utf-8?B?bHlVWHZ4K3lId3lhRkhPd3IwOFdsbjh2YTA3SnhDYlV4VWk1VWlGc0tkUG9Y?=
 =?utf-8?B?SC9MSlY3OFFrQUpBd3FFRHh1S0NLMFpYdjg1aVBSUkJ4a3FaNENCaEZJcW1z?=
 =?utf-8?B?TFZPYjlUQWVReERVZjNad3c2YnVNZlNZVUxLZE8zUElFNS9pMGlxTUZacnZV?=
 =?utf-8?B?NUF4WlFENzhBT3VIbENWN0xFbGNrcUVINGY4U1RqVGx0WjhZcnN4eVBjcDNQ?=
 =?utf-8?B?aWZQb2VWK29hRFJmek1pSVNhNWk3SGY3TlRQZjlFeFVKWGRidFpoRkhZcDBi?=
 =?utf-8?B?RmxtUHVuZmlwSEw5U3dqRVlObmFnWkh4aDltWjQrbk0vb1RFR1FxaDhVUnR4?=
 =?utf-8?B?eEd6Z3JMTGp6MnFmS1p1b1JGZGtvVEI2WG5yc002Q0NNL29yekdROHBHbk5X?=
 =?utf-8?B?WTRoNGszSzA3NW9EeEZXZ05TOCtuSWdRaERWUWQ2aGdtZWxJM0VrV0x5RzA2?=
 =?utf-8?B?aWYveXI3WDcrNHh0QktLZkJDR0hKK2NTSlBydWNWM0VQaVplN3pZZS9maUpZ?=
 =?utf-8?B?ZExCbDA0a0RzY2pteVhKTnhOSGxRMTk5d28xVXlPbWNCN1JBUUpLSk1kNVZS?=
 =?utf-8?B?SVRsRFVvejZFTW9UMFpWY3Rsbnp0bzA4anFCUFNselhld0hVREdlWEFNSGZS?=
 =?utf-8?B?aVJhT3c2V2VnU2U3VlRZMGpFNkkwMFg5SnBGYUhvSG56V3oxNUtJSXBXNGZL?=
 =?utf-8?B?RHBsRWpSVmxsc1VhL2xiWnRLYVdjY0RaOVljaUgxYUhxOTltaFVWUTVrUmtC?=
 =?utf-8?B?czRHdVdHTlVDdkphczErVTRwMnk1akF3OTdydU56dWtIaDhGRytoMklJd0lD?=
 =?utf-8?B?VFFPWSsrVjI3QitldjNnTGRxbWRjVjVzL1dmR05aQ0JMakxIMktjTjhqTDhC?=
 =?utf-8?Q?h1CPqrlqOZ5e8+sX+R++5toX3iAgZ303T3E/Nz8rq8aM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFxdS9QV2prN0lIc2dFUzd3NERjNkNKQ0xGNzR1SEgxT1JOd2tJWmZhQ1pM?=
 =?utf-8?B?Sy9jL1NZWE05VEgza0pmSmt6NmZoZFVjWm90ZlZpTzFuYnNqUk1sY1VWZlR6?=
 =?utf-8?B?QTN1N29uTHFwb2I5UFlsT0RMN2RKM1Nob1QxVWVWMUt2L0dnbXVuUFBML3pl?=
 =?utf-8?B?VllkdTdIWENsRFVpMTVUVklQb3l3enRGZkEyK0Y0bnVMRWFoTnVHUWlIbTFG?=
 =?utf-8?B?UUxERnp0aEM4dWFVSm16V3Y5Y3QzM2U0b29zNHNTSDZZcjc4MTdRVnJkUGxQ?=
 =?utf-8?B?QUZVaklCNmlwWkZKWUwyOWxkdE4wL0RaTlVNbEdwa1Bla1YwNFF1UGdPWld5?=
 =?utf-8?B?Vm0zWXNDOC8zMWM0SlRISlNINTE3WHFIUG9zQUgvQi91UUk3VGVadVVXOVVy?=
 =?utf-8?B?OEg1eVhOSTl5UFo2Tjh2aU1iQXJuWHl1UjU2ZllLUTZEMTl5ZGl0ZnZIWGhS?=
 =?utf-8?B?QjNNeHNpamNFeWhVV2JZa2pSeTN2L2tlbXlBZDB0dktMK3VjWHV6a3lhcXBZ?=
 =?utf-8?B?cHZUcVBvcVp0TGdOcWVScTdQdjdXcTliZ2ROZitXVVZsU0NmcDJaMlgvRHQx?=
 =?utf-8?B?N2xCdHM3d2FGNi85L0ZUem1jOGUrdnoxVmNoWWkySU1qeGpJVTNoQVoyVFkz?=
 =?utf-8?B?dWpsdTU5YzZiY2x4UG1BRjhHYytFU0g3emZhdTFleTRPdlNUVlJQbVdrQnNR?=
 =?utf-8?B?NysyQm0vbHB2bEwrNTlidWgrTzRMd0dtU1dmMnAwWk44YWxTV2ZTVFpoc2ox?=
 =?utf-8?B?dm9pN3QxcW1SVWl1Q2JjVk5wSk94SDI4ZU94dXBsYlgyWHA4VTdTUHZiRG5p?=
 =?utf-8?B?YTZXTmI3dStVeGFvSWFsT0d0M0RxRjc4Y3Zld3NlMWtBYnlCR25COHFtdDNr?=
 =?utf-8?B?RmQyYXJtVEhVZFhoTHByU01uTzdDVGlIcTZqWXlralRSQ2tBWnBDbHNJMVZn?=
 =?utf-8?B?T3paaW9UY1dleG8rZXNid0ptalZmMTMrMFpJR1JiV1RQNFdEN2RzZmtCaGZZ?=
 =?utf-8?B?dS8xOVpiNzQ4aUZvbDJ3MDRxdFEwMGJJU3BrOFBJajJkT1NOR0swM2VCUzdp?=
 =?utf-8?B?K3M0a3RGclhtN1Y4YjRudXFxNXdBS1A2YWxISVV4aGkzNm9aZ0lNbjYvTW1W?=
 =?utf-8?B?YUR3QW5uKy9rYUtEZDVvRXpoWFh4OWtuUk41djdNTU9zMjE0YXhxZUg2c0VT?=
 =?utf-8?B?MzNXNlUvdlhzTXRIRHVzQXE4aGRSQVl6Tk9kT05yTmlKOHc1VWZYaHV3N3Bt?=
 =?utf-8?B?ZlIzdG1XOHYvRjRvOHB3K282VVZIYW5mQ1M3Rk9sZk1nb2hXQkRkTUs2VkpR?=
 =?utf-8?B?V0s5aDFsSUdwRERwVHNMWjF0TmcvRGRJZ0ozQnFIb21LVWRaS2JrV05KbmpL?=
 =?utf-8?B?MlkwQzI4dlUwcjVPT0l0MEw5YlVocEJaRDdDbzNnbmpuWWNJdGhSQUVSWnJZ?=
 =?utf-8?B?VTRVeFQvc3B1OENHeWQ2ejdTMDVlVG1ERlQvT290N2ZaQVdVWkV2UUtqN1ZX?=
 =?utf-8?B?SjJiMkRoSXNOUnF3K3cyRDdmeVV0elhZVDUweUVCeUdXd2pEWXVCTlA0SU81?=
 =?utf-8?B?VjlQSUZhTStlUjAvOEtXamw3ZUcwaTJaOThqUlJjakNkTGxueTZiekplMW1n?=
 =?utf-8?B?d2x2aG1odHVoZnQvbFg1Z2wvQ3psc2hINVlVU09aZlFCVlMzK1lYenN1N2RC?=
 =?utf-8?B?ZWh3N2hmZXdsQllLRDBnQkVmQnhzaVFJVFlwUmVROElLT1h6TmdkL0N1NElG?=
 =?utf-8?Q?gEKNB99vV5rE4b1JzBDndYfKeCgpiIxDKkHKvUf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b3abb4-1bf6-4ba2-3a1e-08ddf0190f94
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 03:20:58.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_202125_783752_63CB5985 
X-CRM114-Status: UNSURE (   9.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDkvMTAvMjAyNSAxMDo1NiBBTSwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBPbiBXZWQsIFNl
cCAxMCwgMjAyNSBhdCAxMDowODozOUFNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6CgpbLi4uLi4u
XQoKPj4gK3N0YXRpYyB2b2lkIHNnMjA0Ml9wY2llX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+PiArewo+PiArCXN0cnVjdCBjZG5zX3BjaWUgKnBjaWUgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsKPj4gKwo+PiArCWNkbnNfcGNpZV9kaXNhYmxlX3BoeShwY2llKTsK
Pj4gK30KPj4gKwo+IEkgdGhpbmsgdGhpcyByZW1vdmUgaXMgdXNlbGVzcywgYXMgaXQgaXMgYWxt
b3N0IGltcG9zc2libGUgdG8KPiByZW1vdmUgYSBwY2llIGF0IHJ1bnRpbWUuCgpJIHRoaW5rIHNp
bmNlIHdlIGltcGxlbWVudGVkIHRoZSBkcml2ZXIgYXMgYSBtb2R1bGUsIHN1cHBvcnRpbmcgcmVt
b3ZlIAppcyBhbHNvIGEgcmVxdWlyZW1lbnQgZm9yIGNvbXBsZXRlbmVzcy4gU28gSSBhZGQgdGhp
cyBhcyBwZXIgcmVxdWVzdCAKZnJvbSBNYW5pdmFubmFuIGluIHRoZSBsYXN0IHJldmlldy4KClRo
YW5rc++8jAoKQ2hlbgoKPiBSZWdhcmRzLAo+IElub2NoaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
