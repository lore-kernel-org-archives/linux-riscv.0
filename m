Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63518D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELdP06gXtl0NhQbX0k4tn0H9o3hPrI000U3KuaWMLB8=; b=iiYOS67ykZjx9MpZ0XE5DeL4L1
	Uq3wWbdQJFTFSqO2ZnLqf8ysMJeaSLrcCPdrAtS17k6H7ZtCOCaJvJh5Xo8gXyC+Ff6CsEG9ZwGVV
	RRT0yjCDc6hGGiFuGFgHiYi/2gKijGpn523cMj1/ObObZHLXzLJwtybxCiGQN+iYiAXEOM5LVCyVv
	HtuN/BnenGAlOMbaND7fTsMlb9Pw9ykNovlyorhgarF86F8EZ/H//9J3lDGM1Cj8+Cvl5lqkuH1vH
	+oiK/9/Q4dyAAro5nCzVsgaD+QDtJoj1O6rmlnTDG9ZdDWsp9PYUxmruLhFxZH/olZqBKSF00IGyt
	toyvOYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ38o-00000003Z1X-1yVr;
	Mon, 01 Dec 2025 12:36:30 +0000
Received: from mail-southindiaazolkn19011036.outbound.protection.outlook.com ([52.103.67.36] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ38l-00000003Z14-30Vr
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 12:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esCyIAsQhPdIK+qYJILZVTrj+coJQZjxcd8cAl4fLSv8Af/PJkhZLdboiNtXTHGeGgNZ4cjYEZTgJC0zqtHO5jv3ZFAMtvP+4AbsAoFTwy3Fk3477fMFkUygvD1sIYT6NRroVHrZVH9r96WbZkJ37h8etztWk6ZKIlbhtD8BHBBLMvilh7Th8LWREh/kdSY7NcQ4ARRSn9j7FinJlfUFDztdcnf7QURYd49zN5rri+XgJaCisfoWPMZVVQxIHdxbEFq8yB4St1Pxst05oeRqT+TGS/QbSINnFcCe7/gwjtUd7GL8sDTbELA3v0jpYPsIuaBiWzDuaDGiPGmgUkBpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBqJRRLIPxLjtiJ/nCB9734RrOU8lnK+ZeHiSLCeHfw=;
 b=CyPs8N8MDM31H4aRMa0RtvXjw11rbxNYPHSmFiOTkshXE1MkZnCQzXt169PAWLhiD+enmYoecGfblvDcrF2kq1/JET6cFVl3O7MqdsRsug00iwjY3KWr/JT07c2Xq6ugKWpnRbzEbfEQBUE5UoUe6D751z7fa2BFAty0k0tTnwikE46P6bdryNYyh5DNF4NjaquZGQPRvKrU9GE4uoVQS4cY5xjgeY6mNnj7u0N23VqEYhcLkOcc7pcSMDWPFMr9FzTCiYVHB8B6ITJpfAxQE45KWDecwl7SaYP90oOzegfeZ/aubYr/zvg+f+jwUBH2E0anDT9pOQBwxH2KDhlAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBqJRRLIPxLjtiJ/nCB9734RrOU8lnK+ZeHiSLCeHfw=;
 b=qCd4jutnKHiMPVd3Zbafdq6hghTsmHs4NOTTC/WUNtU/TqK/YNRbjbf6URYGKo6XaY4jFrvfYhnaTVrDjMu8AegkNnMVeWTaRMBwIC30dvBn6Llr6LOqYvz1+cnboRx11BSFzVZIivJcDEBc2DNMgwPtFY/g5i5qZawED7SKKmU3S3p4ZG1T+Q3YDMe+dR7N9DQeJCUILon0CYWZ3vEZROdp2dP7BPmfGS5kkO6X51w/CxJ4LwhhC+IdS7sb1TsOk4Q3M6JlxKS2H2tgZ38xowrYYeTGdTDkxAx48RI8HumuJ7/36YOZodRbZsq6dfj5qxA6SOP5GRqQMKBsgy+/qA==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by MA0PR01MB5587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:36:16 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:36:16 +0000
Message-ID: <PN6PR01MB11717C796975CF645B54F11A1FEDBA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Dec 2025 20:36:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.19
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Zixian Zeng <sycamoremoon376@gmail.com>, Longbin Li <looong.bin@gmail.com>
References: <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID: <f5b2eaf2-07c4-4afd-b913-26487d1a2a87@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|MA0PR01MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 23379ae2-d98d-48e8-68f7-08de30d63844
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TV0pYzGwjM0bQROZVqV3svNRsWBFtp4uj3Ltes5CbQkTpiwH53YTBrGyj7P3fR4QOCkpBeVgHpt63XqkVU/ixMI5FEYI/FiBxMS7A/Irfog6M94eoIcMm5S0Cz/8WnxT1F5XVHV6wI6sZu67cHx3DjgxMqV4Z65/32+KnkLb+EuUqrZBFBJVUa/4h4VZquJsz6DcrQM96K6wHuuTuCkpQIITy3TWaEiPlk32FsTk4VMif7BKUYivqhX0n52hQFTn2rkmRbwZuHI096UEGxY4VzVNOnqJnZTeNqAHhPpPY0VPi91ktBLEmyap+1AqsDE9QYhMYYkByK9wTb5GjrkO82ox50rNKo0ZUBBC4YTDoXMw73UBES3r0HN/A1xSDdzgUaHsWaYymYtPAkkdWiYk8gTtK+CiulmyyPTlNpBREDwRZSzShz/6e/sxvBBbAI7G/2ZK2PCGbB3ol0XfqiEHx8c03tiOX/vc44oCdxkg3TcNsMLfqxXRyDHbo+NEPgHi0pJ73RRH3+eZzhw5Jst/0JlW6mw+ak3no5uDyhnxEPT70EE6IQOPn2k4ucEC7HJcMedrL78JIE5r9K5uBTNmjWaHesSdFh7w9ZauBjkN8zNGxkl6PUxh2UIzGX4T3ahpas2xuBovKY30OjmKeQC1NvqP4TDq8MbY+K3mh2Xf9EmjqaZA6bu7mtBN8Rm+ipK35jEVkf+17+WqmFUVf8auTgyO6/6P3+HNE4EAaLTG4aFZzq6GW4t/TFLMQuNZ0QxSbwEyTmxwoTnURZuBRUfmAz68BlCwUbSnqo=
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|461199028|23021999003|19110799012|15080799012|6090799003|5072599009|440099028|10035399007|3412199025|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czhLRU9weGVhcGtWNjJFdHN3Nis5dlRUSndWWTNDU3Q0VFV2Zm9nNm9RUHFX?=
 =?utf-8?B?YzE5NERjOUxnQncyOGFDUjYxbVloSER3VkxMWHdXOXcyN0h6RUswNitjNGhs?=
 =?utf-8?B?YlUwNkRyUzlNdmFJK0FFdnZRdWlUREJ2VTUybVUrUk1FQnV1cmpaL0FPSTUv?=
 =?utf-8?B?OHhCWEhCVnJBNStpb2RBWmh2YUlaNnord2U4Um1pMzRScGMrdDJXNmtRbU5V?=
 =?utf-8?B?Ym82WUlsSms5aXdja1J0UmNUNVprQjhQdExvbzFGdjJxTWYyZFVnSTJYcm9C?=
 =?utf-8?B?SVRVTWEwZVp3OVJiZGRYWmFvMEpBdXIwc3YvYlA5cE4zdDVGem9RZWdxbk1R?=
 =?utf-8?B?aURGblRtYllqejBpUVBCNGx3ZWJTRHdzanBxS1NEMDdEZld3KytieWp1NTdX?=
 =?utf-8?B?TTNSSFdmUmN3Q0tJNWtGRmtZclBQc1NjTXRFWGJyQ3ZQSVZBdG1yOFpMY21k?=
 =?utf-8?B?eXNIRUhDeTRTdmgzWWhkS2dPbG1NcnljOVh6YjVtMzlTSUNiejIva1NhQXNW?=
 =?utf-8?B?N3hxcnhzZmt2ZjRTWXNHeDBhUVNGK08zVHd0L3kxUGNTV0FWKzYzcHY2Snl6?=
 =?utf-8?B?YStxWmt4aUNNRzZSQ1FZLzlqRGxFd2ZHWnJRYnM3WTl6M0QxeFYxY2RrbU9q?=
 =?utf-8?B?ZmxQdzhJcFc5Mnl1UFhyc0MrVmJDSEk4akxGMzlBMlExMCs2SEpoZnk3dzFw?=
 =?utf-8?B?TGJGem1VK2xub3dYT2VEY2lIeTkzQ3FndUdvaW5OVVJ4em01LzhCUFhWVkp1?=
 =?utf-8?B?emtrYjA1MENOL0g0U1l4KzVmY2MxaGJ6WnNZMGZoaVowemxFQ1lrcFdMdzNu?=
 =?utf-8?B?bU96bkZkQTJHZ201cVdxVUtBcTdjRWo2Q0xmcDBiMmZqNDdZenlyNWp3WG5u?=
 =?utf-8?B?eklzOXJLbHp6RWlJTGxTMHBjbU9oV2l0Z2NYdERxNURldEkrQ1ZOYkhXeWd6?=
 =?utf-8?B?bU1vMnkxY25qcGc4TWQzVEhyZDNnRUpLRkY4R0VIdHFJTzhTL0xNZ1RhTXgz?=
 =?utf-8?B?bi9MOWoyYWllUkE2TngremVKUlBFNXF0RzlRay80SVV5OFFtN3laN1ErS2ZF?=
 =?utf-8?B?ODRjV1MvanFjek9kTk0yT0I5Z0dDYkVCQjJtMG41SUNCbi9SUDJINDl0bnYr?=
 =?utf-8?B?OW5XU2ZMRThYV3RaOUZRYmhwVjRKSTdZa1VFb1k2Uk9XSHRRWjZZMGN3MnYw?=
 =?utf-8?B?bXRDeUt0eUF6SHBXYmxIVnE3di9oSkx4akp0U2FJS3kyWXF4TFJ0SnExVmFu?=
 =?utf-8?B?bUxpT2dxNXJacmpBek5kZ1RuVTMyN0ZSdjRrWDhSYWF4ay8wQlU4ZTdNZUJz?=
 =?utf-8?B?OGdEZE55ZEE4MUpJU0Y5VW5BZlFWQlBkekt1VHNBM2gwcEZEV3BZWjNJbnY5?=
 =?utf-8?B?QXlCRjVVc3YzV0ZxelkyMkp1RDk4VGduTnljR3dzMlRkd0g4Q0wyRVlJdzRW?=
 =?utf-8?B?NjMwK1RHM1JxMUVWWG5GZ2w5ZGtpNjg2RnY2UVlXUm9zVVo5K2FjeTR2eVI4?=
 =?utf-8?B?bHlBdktQTE1ZcDczNjJValVvYW93d2NvNXRNanlWRHFEQ1VEZXZaVzdVdHFN?=
 =?utf-8?B?RUVYWWxON25BM05wQ1NBc2xKMFIzNzdpeWs1R3hqc1ZrRFJoUWVmWGt2eC8z?=
 =?utf-8?B?ODdOU1ZHUXR5b20xd01zdEgxYnNva1o2ZWt0RWlwQm5wZXFrZnNkbFVyV0ov?=
 =?utf-8?B?bXNCNms0UnlNNEVtbVdPWXJoNVhhTU8vZVVkSHNJWjc4M0l6VExyVnpnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZkMDNFYlMxajd6OFdFZDN0TWIzOG1heXdIYU9kL283aXFUWXB5ckdRVCtG?=
 =?utf-8?B?eWhjUGtnRWpOMk9pVlBNNGxmRHRsb3c3S3FxZW9kODkwNEdIS1JlN21GT25j?=
 =?utf-8?B?clpETXJGeVppVjlsdGdSVEJuTURBZ0dISzV3WE5FY3dhMGtQMlVwYXhLTnAz?=
 =?utf-8?B?UjIyMWtKQzNodThid1hXRjBwSlNONzhCaU55b2hrY2hDWWlvMnFTa3NURmc4?=
 =?utf-8?B?ZytsQXhUT3Bvd0xSRWtUekFkem8xbHpmZTdkUmN1N2x6SExGOTRxRFZOdGN1?=
 =?utf-8?B?WklYTGlhQ1dYU1dUMTBvbXVMb2tQMkJUMG01MjFNMXlVOExrck80NUhiMDlv?=
 =?utf-8?B?dXBYbkREVm5LVHdrMUJMa3VXT3NNaHNTK09pb0xzQ1QzVHdNOWd3OTByVkw1?=
 =?utf-8?B?UG4vdnNYRzdoazFvLzlhRTNON01kOWh1WjRkcGVlcXdOSTVsRC8xdkVaQUg4?=
 =?utf-8?B?eXZNM0F4U1UweDB5T1VqUzNaWFhMRGV5MlJPZGNhVzB3WkFySzdmckVUTzJk?=
 =?utf-8?B?R2RoN2JmWEp5TG91LzNqMmsza1l3WTJlTFVtenBidEJMTDFCdzZlTjh0eXpm?=
 =?utf-8?B?VVh2QjJVYkkwdUJSWEJ3dEpLWVJMOTc5dXlURG04d1BzaGZ1eWxuKzdpQ2Zk?=
 =?utf-8?B?ZkRBb2tnZ3BvNVVEZ005WiszVWtDRjc4Z01YKzZkMWx3RlJHa0h6cE1Da01Z?=
 =?utf-8?B?QjNzODNrMXFXbmtMaVhVc3hSOUpvYU0vaTBEVHZKYit0Tk9wL25KMUNKOFRC?=
 =?utf-8?B?K2piUTlaKy9yeUgwV0NFcnJrazh6U3RCV0Njc1FqWFhuTG45TlVZRlA3cTFr?=
 =?utf-8?B?alpwdS9Jb3hEUFFjdXM1THU0SStqL21XK040TVR6V3F4MFUzdW1selNCcVVp?=
 =?utf-8?B?RU1qOE4veEV2UG5taFJhcElQQzgzSFFicEpzczhjVVYzSUF5N0NPM0ZabGhX?=
 =?utf-8?B?Vk5UUklEZGxJelZGdEVhbWFGZUJYSEhPbmNtNzdNMUlvVG1QaUZEcTFONEVC?=
 =?utf-8?B?RjJ6VDV6V3duTEVUY003clRvSkxkdEJEVzNEME1vdVVPZFdMMjNROTJUMlo1?=
 =?utf-8?B?T2NGSlVhdzZnQ1paVlJhMnJHK254YTdydW9tRm9mQlJZK1JSSGVST1haN25V?=
 =?utf-8?B?S0Q5M0krRFNBdnRiSlRiV0pFaDNqWmh0WUNjcmJOWFZkK1QvcW5YOWdVMjZx?=
 =?utf-8?B?NHV1c01wbHNZSHlEZW9pYkQvYTdIYlB2alY1TmFvRFM5S2dtOGVWRmJWaUFn?=
 =?utf-8?B?eEpVenlzSzN6Y2hBTi8wN0tDVDF1REVzMGdESGVMN01RcHdFSVFxR3AxYW5i?=
 =?utf-8?B?SFNRd3R4RmRIb1VWdytLc0pPL3QzL1l5UjRGRXJ3d29yaHR5L0R3cGFHWjU0?=
 =?utf-8?B?R282NFpyZWpUZHNDWHN1dU5ZVFNHNXF0YklNVzJiWDF6WlVoZXpuY1hrRk1D?=
 =?utf-8?B?dWFFTFRYTmJhVVNWY1lrWHM4QVgvNlNVYUszWmVBQlF5SlIzWFd3TC94V1dT?=
 =?utf-8?B?YWt2bzg0Y2tobnhmYXpGOVRIQVNEMHJDZStXVzNQcTVjd1h6QlZPc2ZyQjBz?=
 =?utf-8?B?U1RHTUlCSkV3NVhMdkRpTStqMVg4WUI0VWZCTmhyOVl1VlFJSVlva3BwNGFH?=
 =?utf-8?B?OFlXT0xTNThFU2kwMHRFTnlqaEFvYWI3OUFmVGcwVjhKTEsxeEVndVZLT0pZ?=
 =?utf-8?B?YU5QbWhrNjkwQ1RONzNzSW1BQy95R2VwYWxWUTFtRXhwdCtqa0ZFVG9QOXIv?=
 =?utf-8?Q?L48eB/Fvr/t7xu5w3RsoMUVQPgoIGounJl0yCBG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23379ae2-d98d-48e8-68f7-08de30d63844
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:36:16.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_043627_787948_FD5CAA61 
X-CRM114-Status: GOOD (  15.69  )
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

SGVsbG8sIEFybmQsCgpIYXZlIHlvdSBwaWNrZWQgdGhpcyBQUiB5ZXQ/IEkgc2VlIHRoZSBtZXJn
ZSB3aW5kb3cgZm9yIHY2LjE5IGhhcyBvcGVuZWQgCnRoaXMgd2VlaywgYnV0IEkgaGF2ZW4ndCBy
ZWNlaXZlZCB5b3VyIGVtYWlsIGNvbmZpcm1pbmcgeW91ciBhcHBseWluZy4gClNvIEknbSBwaW5n
aW5nIHlvdS4KCklmIHlvdSd2ZSBhbHJlYWR5IHBpY2tlZCBpdCwgcGxlYXNlIGp1c3QgaWdub3Jl
IHRoaXMgcGluZyBlbWFpbC4KCktpbmQgcmVnYXJkcywKCkNoZW4KCgpPbiAxMS8xOS8yMDI1IDM6
MjQgUE0sIENoZW4gV2FuZyB3cm90ZToKPiBIZXkgQXJuZCwKPgo+IFBsZWFzZSBwdWxsIHRoaXMg
ZHQgY2hhbmdlcyBmb3IgUklTQy1WL1NvcGhnby4KPgo+IFRoYW5rcywKPgo+IENoZW4KPgo+IFRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgCj4gM2E4NjYwODc4ODM5ZmFhZGI0ZjFh
NmRkNzJjMzE3OWMxZGY1Njc4NzoKPgo+IMKgIExpbnV4IDYuMTgtcmMxICgyMDI1LTEwLTEyIDEz
OjQyOjM2IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
Cj4KPiDCoCBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNv
cGhnby1kdC1mb3ItdjYuMTkKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhZjVl
YjE3ZmY4OTNiZjZlNTI2ODBhMzEwNTllMTgxNjc0OWMyZDIwOgo+Cj4gwqAgcmlzY3Y6IGR0czog
c29waGdvOiBFbmFibGUgU1BJIE5PUiBub2RlIGZvciBTRzIwNDJfRVZCX1YyIAo+ICgyMDI1LTEx
LTE4IDA5OjE3OjU1ICswODAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFJJU0MtViBEZXZpY2V0cmVlcyBmb3Ig
djYuMTkKPgo+IFNvcGhnbzoKPgo+IEZvciBDVjE4eHggc2VyaWFsczoKPiBBZGQgdG9wIHN5c2Nv
biBkZXZpY2UgcmVsYXRlZCBEVFMgY2hhbmdlLCB0aGUgdG9wIHN5c3RlbQo+IGNvbnRyb2xsZXIg
cHJvdmlkZXMgcmVnaXN0ZXIgYWNjZXNzIHRvIGNvbmZpZ3VyZSBzb21lCj4gbWlzYyBtb2R1bGVz
LCBzdWNoIGFzIHVzYjIgcGh5IGFuZCBhIGRtYSBtdWx0aXBsZXhlci4KPgo+IEZvciBTRzIwNDI6
Cj4gVGhlcmUgYXJlIHR3byBjaGFuZ2VzLiBUaGUgZmlyc3Qgb25lIGlzIHRvIGFkZCBEVFMKPiBk
ZWZpbml0aW9uIGZvciBQQ0llIGNvbnRyb2xsZXJzIGZvciBTb0MgU0cyMDQyIGFuZAo+IGJvYXJk
cyBzdWNoIGFzIFBpb25lZXJib3gvRVZCX1YxL0VWQl9WMiB1c2VzIFNHMjA0Mi4KPiBUaGUgc2Vj
b25kIG9uZSBpcyB0byBhZGQgRFRTIHRvIHN1cHBvcnQgU1BJLU5PUiBmbGFzaAo+IGNvbnRyb2xs
ZXJzIGZvciB0aGlzIFNvQyBhbmQgdGhlIHNhbWUgZm9yIHJlbGF0ZWQgYm9hcmRzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gQ2hlbiBXYW5nICg0KToKPiDCoCDCoCDCoCByaXNjdjogc29waGdvOiBkdHM6IGFkZCBQ
Q0llIGNvbnRyb2xsZXJzIGZvciBTRzIwNDIKPiDCoCDCoCDCoCByaXNjdjogc29waGdvOiBkdHM6
IGVuYWJsZSBQQ0llIGZvciBQaW9uZWVyQm94Cj4gwqAgwqAgwqAgcmlzY3Y6IHNvcGhnbzogZHRz
OiBlbmFibGUgUENJZSBmb3IgU0cyMDQyX0VWQl9WMS5YCj4gwqAgwqAgwqAgcmlzY3Y6IHNvcGhn
bzogZHRzOiBlbmFibGUgUENJZSBmb3IgU0cyMDQyX0VWQl9WMi4wCj4KPiBMb25nYmluIExpICgz
KToKPiDCoCDCoCDCoCBkdC1iaW5kaW5nczogc29jOiBzb3BoZ286IGFkZCBUT1Agc3lzY29uIGZv
ciBDVjE4WFgvU0cyMDBYIAo+IHNlcmllcyBTb0MKPiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3Bo
Z286IEFkZCBzeXNjb24gbm9kZSBmb3IgY3YxOHh4Cj4gwqAgwqAgwqAgcmlzY3Y6IGR0czogc29w
aGdvOiBBZGQgVVNCIHN1cHBvcnQgZm9yIGN2MTh4eAo+Cj4gWml4aWFuIFplbmcgKDQpOgo+IMKg
IMKgIMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogQWRkIFNQSSBOT1Igbm9kZSBmb3IgU0cyMDQyCj4g
wqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdvOiBFbmFibGUgU1BJIE5PUiBub2RlIGZvciBQaW9u
ZWVyQm94Cj4gwqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdvOiBFbmFibGUgU1BJIE5PUiBub2Rl
IGZvciBTRzIwNDJfRVZCX1YxCj4gwqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdvOiBFbmFibGUg
U1BJIE5PUiBub2RlIGZvciBTRzIwNDJfRVZCX1YyCj4KPiDCoC4uLi9zb2Mvc29waGdvL3NvcGhn
byxjdjE4MDBiLXRvcC1zeXNjb24ueWFtbMKgIMKgIMKgIHzCoCA4MCArKysrKysrKysrKysrKysK
PiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0c8KgIMKg
fMKgIMKgNSArCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzacKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIDQyICsrKysrKysrCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MTJoLWh1YXNoYW4tcGkuZHRzwqAgfMKgIMKgNSArCj4gwqAuLi4vYm9vdC9kdHMv
c29waGdvL3NnMjAwMi1saWNoZWVydi1uYW5vLWIuZHRzwqAgwqAgwqB8wqAgwqA1ICsKPiDCoGFy
Y2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1ldmItdjEuZHRzwqAgwqAgwqAgwqB8wqAg
MzYgKysrKysrKwo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWV2Yi12Mi5k
dHPCoCDCoCDCoCDCoHzCoCAyNCArKysrKwo+IMKgLi4uL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9z
ZzIwNDItbWlsa3YtcGlvbmVlci5kdHMgfMKgIDM2ICsrKysrKysKPiDCoGFyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDExMiAKPiArKysr
KysrKysrKysrKysrKysrKysKPiDCoDkgZmlsZXMgY2hhbmdlZCwgMzQ1IGluc2VydGlvbnMoKykK
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCAKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL3NvcGhnby9zb3BoZ28sY3YxODAwYi10b3Atc3lzY29uLnlhbWwKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
