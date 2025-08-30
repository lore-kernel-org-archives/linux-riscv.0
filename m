Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E62CA0FF9
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 01:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov/RoYq02j1Cc3HID/up7cfvOQsMvoUtdt+1PGxSooA=; b=sH25vaKK4/YqUkh3AgzZqaFMYA
	Pau9hj0/PUXnhfP2bpMHBKdPJp/m8LOyoS0w+SKRCDIbXJYnww4mi+OLYVX/QxRef1mfU86nHZEFp
	xHIFpC+NEvYoo2Qz+J0O3Jsk5cJBVRXfDS+1iv0ObQHPMrtmS8WFGl61gKVJ1JaJb2tw0oFZCqKXW
	ELk3gYuP7PBq2HO6bJB5vel18FQuPXUPfNxvuxOgrANetLnhHNnWHKZPhf/VhUgXPLGqSn5Ncf8UK
	u+v6z1NkgEAu9WHhvJR0WqqGwIjme/IB1jXv7hqOGZzleTp+R/PCG10PnLHNOYhtb5vvnxU2wBC36
	x8+82hVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAcH-00000007IHn-05Ws;
	Sat, 30 Aug 2025 01:42:53 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAcE-00000007IGH-0zV2
	for linux-riscv@lists.infradead.org;
	Sat, 30 Aug 2025 01:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qr7pEOgB61EUHqRzfIt/z7eeyDe7Dce7+iKczKLk2mexJFbISGpS2yW35KY6EQGobhkMZja2bCpxj3S+Pnh96UXG1y8UYSzilc/Lj56jFJ1x9HBPqPEwIcZjV4lRqoBte3XCuPm1jWTCSJDlJJFjBmi/rLeyQvrWiMwBd/VSK++RmtLFM5qDi24HF5zdEqbAIL9hYP/5i7fwi03EOZGn+5JTB6LOSzyLQryfwygQM+K+GEam2aiSGCZtymwZl5KQijRfIS5YmJ4tOuMp//bp9ARcl1V45fXQAGrz3wMtd13dYpHWiABhQMFkrB3gw8A6QTDVFniy5r6YGpqQZUsx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE9dSgSuniW1/yPUJUeWUKT9+0D44fxOydGxnHf70qY=;
 b=l/tbFYce1OT0jMxitB6LYFB5+MUOYs/+iHpqQ1cV475knuM6GDTK6HPzuvpAf2rjvJefoj1KHuKP3FNByfZwrIV9SDqHK9MMrQ2mU7u43PgWGnpClcQI78DixiKTjadh1D09vG6GAaId24UxrIO745iaRTtSchivud3jfx9i3zCNmBn1chJgsVQPskVpaMjWh8Z4gEbBJREz8/dWhXLEcY0jQCqBPDDxtty+w88JTFk6RjSKbcqumbgtZf5ZbPLexPhbsnQBPqCzFYs4pRqdtWbQer33g5dFtGTiT/1P4tF+bFW6+ZtxOfD3vjvsjw2aSurkWIk24cjeaYIO0kWcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE9dSgSuniW1/yPUJUeWUKT9+0D44fxOydGxnHf70qY=;
 b=ChxEywsvjj/FsjYEffJHDrYmM8XiHnDuC5tLqDg0ANYYJCEHmAxYEMSR8rL7lsBWKUJYBp7c+/uINPGGFovbEOjNPOmgbflh+SELXS1TcjT+FFcJHThUYFjO2WsKqDht0Edw898OXNV9/uKB2Pqeag73issbYmZ9IpRnL3Cx9Q5OjX3AKbuhdg1PTqk1DAV6cGSi7qsme9UkXYvbnWxx85yS7pwBRRiN7Sow8wMsj+XfZhGXvZwDCmP/WQSqjCrdR9TCeU2Kvsj7BQhLd9h6B/5FyLBKPoZQga5AUGKObxOt9VvZLFWMtbRxh+wJGzA1Uj70keDB+ESAtTPwcgkspA==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB6686.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:77::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 01:42:21 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Sat, 30 Aug 2025
 01:42:21 +0000
Message-ID: <MAUPR01MB110724EF2C8233B40B1E485C6FE05A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 30 Aug 2025 09:42:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Rob Herring <robh@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com,
 bhelgaas@google.com, conor+dt@kernel.org, 18255117159@163.com,
 inochiama@gmail.com, kishon@kernel.org, krzk+dt@kernel.org,
 lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, s-vadapalli@ti.com, tglx@linutronix.de,
 thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1756344464.git.unicorn_wang@outlook.com>
 <1df25b33f0ea90a81c34c18cadedd38526a30f01.1756344464.git.unicorn_wang@outlook.com>
 <20250829170908.GA1016165-robh@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250829170908.GA1016165-robh@kernel.org>
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <4ad2e897-cd56-45a7-99ca-72903bf1e535@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: a7997005-f405-47f3-f6ef-08dde76675cd
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|461199028|15080799012|41001999006|5072599009|8060799015|6090799003|19110799012|440099028|41105399003|52005399003|40105399003|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW02V0RFdlBhd2Mva2NFSjNGbFFkQXU1bHZ5eHdMRTFsQXVqZUdRcXFNaWpi?=
 =?utf-8?B?UEMrdjJpTUJPWWk1M1c1R0RqTU1KN0c1VG8vVi9mbTRhbEd4ZC80SWZibnM0?=
 =?utf-8?B?SlE2QmxnQkxPVG9xNlNpQnlJbUVSY0krY0RxQ2xaRFl1QzZrV2hweVRlZjhN?=
 =?utf-8?B?aVZ2dEphamtpQVJzZHRLNkV0aG40NnE0N1d5bWNRak1HUllLNy8xSHg1OE43?=
 =?utf-8?B?TWZnakdPcXhZbDczSjUyODUrajRiNVl5UGdwV3RXY0JxVVlRd044MCtHQkZ0?=
 =?utf-8?B?Sm1kN0ptOGVKSit2RkZIOXdVSGdVQndOWTNjYXZqcyswQlZlUFlsbWJCd3Qx?=
 =?utf-8?B?TFVHeWpnRXFkVE9tR1hDM0IrNWxrZWlJTHZSMWl6TWd6NDVPNFV3Q0d5QWQw?=
 =?utf-8?B?YmdBc0pzSC92S3VuSGJIS1FUb0c0MHFYZHhwSGh0M1hwK3QxRUFvVGxEL0Mz?=
 =?utf-8?B?Yjl0cTJ1Q3UxRnFpdzNVWkJuaUtHaitmWThjU2lncG50SjFqSjlJcWl5dDBC?=
 =?utf-8?B?eUtpVWsxUmc4SkUwVzFta1hNaUZoYTJLalg5UVFoQ2hHTzlzK1ZCSGp0R2I2?=
 =?utf-8?B?dXBIZTNoV1NrTVNUcndBNkR1UzJYTDFzVTFmaUxlRHZEdklLWHo1MEV2MzVX?=
 =?utf-8?B?cVFkV3lPWkt4djB3N3BUWXc1MUZCZDNMblZGRnhDZ1Zudk8vOUpFdU5xK2lz?=
 =?utf-8?B?MkZ6bjUyRE9HR20xYlQ3UmpyNHFPYnlPSkRTZTcwai92U0J3d1R5ZnpKVE1y?=
 =?utf-8?B?KzJmb3cvWnNVMGpYd2NtVHNRUjRzNHlRR21oL3pvQWF6bGErSWZod0ZLZXhB?=
 =?utf-8?B?UmJEWXBGQkpqRlhaMlJwTXBOQ0xORkFDMlZxVHdBT1lweHdiTHlpT0taclJw?=
 =?utf-8?B?NytLZlZYenBGVkpMUXFkV1ZCMlZqVEJyUVkyRTBDTDBoSE9qeXRPSEoyYXkx?=
 =?utf-8?B?bEFLOHpqemxCZEJFY29QTWdNUjZHTmtBclZCbGU5dGFibUdXb2JwWksrNjZD?=
 =?utf-8?B?cEZvUXRiSmtZUGtVQzJ4Ui96SkRlSG1zcHhLZm9MQ1k3dGcreEQxa2IyaklU?=
 =?utf-8?B?VnJtQzFIODAzUk1sWmp1WVZsOURadTVSN1l2ZnBnWnBtK3NMcSsvUDFrc0JO?=
 =?utf-8?B?L3E0S05QNW1pKzdHTHZzWFdJM092eXc5ZFEvTHJveVNiYVEvNEpYS0FiRHdV?=
 =?utf-8?B?R2k0MDJ1R1hQMGFKN2JCVUEvazBGNFhzdG54L2c4TlorS3hyUVhZbkRQRHhj?=
 =?utf-8?B?NkN3aWF1d0RqYytkamlyeU5sRzhBQXduemhDcm5EcnhPaEs0RlVLcW54YVdl?=
 =?utf-8?B?TlNuUS9vaHI3U2NuOWNzMElpR0svNGZacXFvekNMc0lDaEwrRGhZZDNVVnZ5?=
 =?utf-8?B?OWFqMHRNd3l1b0c0SE93akhNMTJ1S1E2TVBYQlUyV0lsZHBWOXlRcHpzRm92?=
 =?utf-8?B?UkNHVzZYbS9IUXFyZmc3SnZZZmRPN1VpVFExUU9vNGZhMjlZYml5ZW5CQVJz?=
 =?utf-8?B?M3FEQXZuRlRyeUYyV0dSbkowYmJrVm51Ylo0T2IrZDBOWWxmbmxkTkt3dmJh?=
 =?utf-8?B?ZlFzaG01UmpjS1dIK1hpdkpteUpRZUQxQU05WXZhTkVzU1NFK1BmT3U1ZUNW?=
 =?utf-8?B?SE5BelNzMG4wekM2R3JaSTUzOUREWm9Tajd6MmhNQTlJS2pMT1NtbUp5eStX?=
 =?utf-8?B?Q2wrVk9ZSmN1WmVZaHEzQzNFWWU5MXRuVUdIeTJPcFZBUm5ocERIb1RBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0t6bmZGTnQ1Q3hId0JBRkE4clBSamhvUVBzY3FrdzNRMlVwSXIvcHhxQjN2?=
 =?utf-8?B?ejR0NERkMHRwZy90UEtXU3NYR3NqOERaMkp0c2NYSWh0RmhNRTkwTHJCdGlV?=
 =?utf-8?B?OWNCeWZWbXNJRGtTRnlMUFV6NmJ4ZGlmUVA3aHFZYkttblUwS1hsWXBxcDhV?=
 =?utf-8?B?SzVET3B1d0w3Q1psQmVFRjVsN1NWRlZzcDhpTUs1NXF3b1VpM2p6NUUvbU1y?=
 =?utf-8?B?emlQQ3hLMmdwUlhETDUwaVNZY2lpVDUzelgxOFFPc0FuMjFmaDViTjkyY2hD?=
 =?utf-8?B?NTVXZkkrR25rTUZVWTdPOVh0SDZoR0hTN1g4Z0dqc3JtdXBSOVMzdjEyTmVB?=
 =?utf-8?B?M09jT0VsU3BOUDE0VzVwUFZ5dk5XVU1JbkRNTmhSM0Znb1l2NXM3azZHTXoz?=
 =?utf-8?B?OGpSMS9rNmExWExJbWdhWUwxbCtBSHRkUXk3Qjd6YWxpVWNjMVcyai9WeFYr?=
 =?utf-8?B?a2cxYkNtVE9SWDNLVGQ1endtSHBlNVQrMEkyZFlhMlMvb1ZGaTUzLzg3T1Bv?=
 =?utf-8?B?QmxnaDZOR0RaNHBZdE9pRUZsS0E0SGNVYlE5ZkR5SXJtUDE2Q0lub2QvV3VD?=
 =?utf-8?B?d3o4NFNiTkhqQUJGWUpqa3c2VE1yNUxYUHZLeG5FL2pnK1dEVWlsRHV0MmpX?=
 =?utf-8?B?RlRERDhTYVUvT0dWN3FKYyt6WXBrdlhneFRVWkxQZE9pNWgvNUZ3bUJETFVn?=
 =?utf-8?B?YWFueEdHcEFtUFI5S0krbWdhRmNrRGxrRnU4a01LeEpBTW1hQnFMWTBQRStV?=
 =?utf-8?B?eGZhQjhvbEhYRndNTVBQUGFZMFB1eXYra1Y2TUVPWUQra01CMjg1YUR0d2Vk?=
 =?utf-8?B?VG1nd2NKSVRxSUV5QzZpU3orQkRXOS9sWXd5MjlQZmJCYm9DdzdtVmR1Y1pW?=
 =?utf-8?B?dnFyQ2ZEREd0T1BxRFBveG90STR4S3hRc1plV05IV1hNOVQwNUkyK1RYWGJB?=
 =?utf-8?B?bjRkeGRBSUZBT3VERW84OU9Fc2QycnliZW9iU011SXhuL2lDV2ZyaHpwRndD?=
 =?utf-8?B?Z3ZKNGJ6d2JRaW4vTEJnb1ZVNWxwT2g2VWltUmNwVmpNcHRaOURMek9BUlI1?=
 =?utf-8?B?cmRPajgwR0h4YkJDZ3ZtS2RvdjZzMk5YVlJuQjM5S0RhajhERUdoU05uL1ZC?=
 =?utf-8?B?N1dCT2p6M2tnZzRMWVl6NCtuTkFSVFgwTCs3MkxyOHRmanMwNGlPV2d3S25U?=
 =?utf-8?B?N2llZTJtYURPcXM1dWt1M2QvZ2JmOW4zZnhRUnk2eUd2K3ZvOEw4NVdzZEZG?=
 =?utf-8?B?SlJZN3ZRd2VxaEliMWtIcjJkK3NyRmhwZ2orZHl1L1JuOWVzSjNKZnZGdElV?=
 =?utf-8?B?MmdFZitCMGFsejRnbWFVMW9RRTVPY0I4ZFc5NzVxbUdnZXVaRFZGSEFqVk5s?=
 =?utf-8?B?a21sbG12ak81UUJHeWEvaFFMeHR6Q01BQ0E3cGhSM3RWUWtrMENlb3hhMHYw?=
 =?utf-8?B?WDlBMk9LVkoxdFQxeEQva1k4azRNWG9lUjRxdldoYTdtTFlOUU0yUmx1NHk2?=
 =?utf-8?B?d3RpcDFZMDNvUlYydktJblZReHJSK3lEVklnRnl2MmlMejFIMFgvVytLNDFm?=
 =?utf-8?B?MlE3dUJzODE0Zlg2czJQbUIvU3F3WmtlaTl2M2cxRVNnellDUGhwenlST25B?=
 =?utf-8?B?RkNtZkh1YURmNVlXTW5iVW5XSGVYdlF5Y3ZFMzAwblBiRzl3bHFRL3g4RFJk?=
 =?utf-8?B?SE0vVTUwOG5ubk5xcThWdlN0bzM4SHJtQk9zYjV2VFhWT2JSMDhkODArejdr?=
 =?utf-8?Q?Jv1iZCdL1t6Nepf8+k=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7997005-f405-47f3-f6ef-08dde76675cd
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 01:42:20.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_184250_287010_305E0871 
X-CRM114-Status: GOOD (  16.08  )
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

Ck9uIDgvMzAvMjAyNSAxOjA5IEFNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUaHUsIEF1ZyAy
OCwgMjAyNSBhdCAxMDoxNzo0MEFNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6CgpbLi4uLi4uXQoK
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLXNnMjA0
Mi5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtc2cyMDQyLmMKPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZTQzNGRjMjk2N2UKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNp
ZS1zZzIwNDIuYwo+PiBAQCAtMCwwICsxLDEzNCBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPj4gKy8qCj4+ICsgKiBwY2llLXNnMjA0MiAtIFBDSWUgY29udHJvbGxl
ciBkcml2ZXIgZm9yIFNvcGhnbyBTRzIwNDIgU29DCj4+ICsgKgo+PiArICogQ29weXJpZ2h0IChD
KSAyMDI1IFNvcGhnbyBUZWNobm9sb2d5IEluYy4KPj4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBD
aGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gKyAqLwo+PiArCj4+ICsjaW5j
bHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiBMb29rcyBs
aWtlIHlvdSBqdXN0IG5lZWQgbW9kX2RldmljZXRhYmxlLmggaW5zdGVhZC4KClRoYW5rcywgSSB0
cmllZCBhbmQgc2VlbXMganVzdCBtb2RfZGV2aWNldGFibGUuaCBkb2VzIHdvcmsuCgpUbyBiZSBo
b25lc3QsIEkgYW0gbW9yZSBjdXJpb3VzIGFib3V0IGhvdyB0byBrbm93IHdoaWNoIGhlYWRlciBm
aWxlcyAKc2hvdWxkIGJlIGluY2x1ZGVkLiBJcyBpdCBqdXN0IGJhc2VkIG9uIGV4cGVyaWVuY2Us
IGJlY2F1c2Ugc29tZXRpbWVzIAppbmNsdWRpbmcgdGhlc2Ugb3IgdGhvc2UgaGVhZGVyIGZpbGVz
IHdpbGwgY29tcGlsZSB3aXRob3V0IGFueSBwcm9ibGVtcy4KCj4+ICsjaW5jbHVkZSA8bGludXgv
cGNpLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPgo+PiArCj4+ICsjaW5jbHVkZSAicGNpZS1jYWRlbmNlLmgi
Cj4+ICsKPj4gKy8qCj4+ICsgKiBTRzIwNDIgb25seSBzdXBwb3J0IDQtYnl0ZSBhbGlnbmVkIGFj
Y2Vzcywgc28gZm9yIHRoZSByb290YnVzIChpLmUuIHRvIHJlYWQKPj4gKyAqIHRoZSBSb290IFBv
cnQgaXRzZWxmLCByZWFkMzIgaXMgcmVxdWlyZWQuIEZvciBub24tcm9vdGJ1cyAoaS5lLiB0byBy
ZWFkCj4+ICsgKiB0aGUgUENJZSBwZXJpcGhlcmFsIHJlZ2lzdGVycywgc3VwcG9ydHMgMS8yLzQg
Ynl0ZSBhbGlnbmVkIGFjY2Vzcywgc28KPj4gKyAqIGRpcmVjdGx5IHVzaW5nIHJlYWQgc2hvdWxk
IGJlIGZpbmUuCj4+ICsgKgo+PiArICogVGhlIHNhbWUgaXMgdHJ1ZSBmb3Igd3JpdGUuCj4+ICsg
Ki8KPj4gK3N0YXRpYyBpbnQgc2cyMDQyX3BjaWVfY29uZmlnX3JlYWQoc3RydWN0IHBjaV9idXMg
KmJ1cywgdW5zaWduZWQgaW50IGRldmZuLAo+PiArCQkJCSAgIGludCB3aGVyZSwgaW50IHNpemUs
IHUzMiAqdmFsdWUpCj4+ICt7Cj4+ICsJaWYgKHBjaV9pc19yb290X2J1cyhidXMpKQo+IFlvdSBj
YW4gaGF2ZSBzZXBhcmF0ZSBwY2lfb3BzIGZvciB0aGUgcm9vdCBidXMgYW5kIGNoaWxkIGJ1c2Vz
LiBEbyB0aGF0Cj4gYW5kIHRoZW4gc2cyMDQyX3BjaWVfY29uZmlnX3JlYWQoKSBnb2VzIGF3YXku
IElJUkMsIHRoZXJlJ3MgZXhhbXBsZXMgaW4KPiB0aGUgdHJlZSBvZiB5b3VyIGV4YWN0IGlzc3Vl
IChyb290IGJ1cyBiZWluZyAzMi1iaXQgb25seSkuCgpZZXMsIHlvdSdyZSByaWdodCwgSSBsZWFy
bmVkIGl0LsKgVGhhbmtzLAoKPj4gKwkJcmV0dXJuIHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkMzIo
YnVzLCBkZXZmbiwgd2hlcmUsIHNpemUsCj4+ICsJCQkJCQkgdmFsdWUpOwo+PiArCj4+ICsJcmV0
dXJuIHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkKGJ1cywgZGV2Zm4sIHdoZXJlLCBzaXplLCB2YWx1
ZSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgc2cyMDQyX3BjaWVfY29uZmlnX3dyaXRlKHN0
cnVjdCBwY2lfYnVzICpidXMsIHVuc2lnbmVkIGludCBkZXZmbiwKPj4gKwkJCQkgICAgaW50IHdo
ZXJlLCBpbnQgc2l6ZSwgdTMyIHZhbHVlKQo+PiArewo+PiArCWlmIChwY2lfaXNfcm9vdF9idXMo
YnVzKSkKPj4gKwkJcmV0dXJuIHBjaV9nZW5lcmljX2NvbmZpZ193cml0ZTMyKGJ1cywgZGV2Zm4s
IHdoZXJlLCBzaXplLAo+PiArCQkJCQkJICB2YWx1ZSk7Cj4+ICsKPj4gKwlyZXR1cm4gcGNpX2dl
bmVyaWNfY29uZmlnX3dyaXRlKGJ1cywgZGV2Zm4sIHdoZXJlLCBzaXplLCB2YWx1ZSk7Cj4+ICt9
Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX29wcyBzZzIwNDJfcGNpZV9ob3N0X29wcyA9IHsK
Pj4gKwkubWFwX2J1cwk9IGNkbnNfcGNpX21hcF9idXMsCj4+ICsJLnJlYWQJCT0gc2cyMDQyX3Bj
aWVfY29uZmlnX3JlYWQsCj4+ICsJLndyaXRlCQk9IHNnMjA0Ml9wY2llX2NvbmZpZ193cml0ZSwK
Pj4gK307Cj4+ICsKWy4uLi4uLl0KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgc2cyMDQyX3BjaWVfZHJpdmVyID0gewo+PiArCS5kcml2ZXIgPSB7Cj4+ICsJCS5uYW1lCQk9
ICJzZzIwNDItcGNpZSIsCj4+ICsJCS5vZl9tYXRjaF90YWJsZQk9IHNnMjA0Ml9wY2llX29mX21h
dGNoLAo+PiArCQkucG0JCT0gJmNkbnNfcGNpZV9wbV9vcHMsCj4+ICsJfSwKPj4gKwkucHJvYmUJ
CT0gc2cyMDQyX3BjaWVfcHJvYmUsCj4+ICsJLnNodXRkb3duCT0gc2cyMDQyX3BjaWVfc2h1dGRv
d24sCj4+ICt9Owo+PiArYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoc2cyMDQyX3BjaWVfZHJpdmVy
KTsKPiBXaGF0IHByZXZlbnRzIHRoaXMgZnJvbSBiZWluZyBhIG1vZHVsZT8KCldlbGwsIEknbGwg
Y2hlY2sgYWdhaW4uCgpUaGFua3MuCgpDaGVuCgo+IFJvYgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
