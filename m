Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61416E77170
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 02:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7vmKcK8a+6FexBfmV24C7T5dUZoE7UZQgwp2nxnmz0=; b=tv/PGltBo5tWZa
	ZjYvrLlEtvys408sW012tSMoCn6pM4Bw1CG+EU+Gz7988BefatftWNYYlaEFCLEXoccmmLShASTUt
	3YpLigfTdBY7jHVxSMCeXJzxk3gXbuHvQPUFFR+XhYAtRX1EwRMm1VqmMdUV+hMGa+f5ajJCcBuQ3
	MirfWnaRQhjNjFVKcAyZNFXF67LgyXzS24q4RtGlcCcUcPkCbHGjq9ZqJXa8RvuYqq8OinrBwQHQO
	dKI4jxJeH9ypey81vVGCuF0yRt+xTxhC8Ut+sxGOPYlAuWfBDEnR8SkR1+7ovFqZq2HpsUUUx4NUW
	806wEKFVu5mTNt1F3fDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNe2-00000000HRC-1heQ;
	Fri, 06 Dec 2024 02:00:38 +0000
Received: from mail-dm6nam11on2061a.outbound.protection.outlook.com ([2a01:111:f403:2415::61a] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNdx-00000000HQ1-2VZQ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 02:00:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez75l5NHx8sc4DEX760uoQP90x24H6WdVHiLi+4l0GRhYFungLzh7tOTkzsrQUeH9tmrwET8y90GVQNujf+0fKWTVbxI3jzlH4xxF3evx8nnPk8EQB6uM6cBDJGCBvLEp0ddGbMbLjoV7l24T4OupO/xwkD5rDw451AeRBgfvkHkTILLHqYQqxbjxG7Uazc4VucavW/HcLgPn2h+33o/i3Q1njlsogiCBGDAjQS5ZrP3ndvw5a6TlnoA5fx9RXMa1vmqm7R6rKOZgDOKKMMUZHmQTrI4B4cSs7MTD0nxitKkxqFU/ibJo94385TkklZ1yFWYkrQNzsRxsiCFBo0Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGmpe1JfegYhnTyngqQstDAcwclKiVUAhHp1O0js9S8=;
 b=qrcgI/V5hSklkjCx22Nt/gIg68Nxx81Effcay4N828SgQw4joFqKpQrGgL79QtGxM/uW/LxkaKYpT/CxFzFPxtmhl5JiwGnyqIkFf+EGp3K4wyFu2wem87Vjv7z/UfSh+cG8eMf8cxWkhD8gAEBRu5wAtF0351jAn0jpqo06TC6kf3nS+94dSuyioCmrIa5fftnayG46KkyIwEKeaLSY7ntoERVib1BkX5rReq8tYv3euTOncSbbnOfAC1gmXOdL+Bm5c2hzeRoiZ5RzPwUy/I7zCsmvveCUq8aeGEeh8JJlxYZ6EypMxnpp+npmViEqWgHZY6gWl1x0JbzUZaxGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGmpe1JfegYhnTyngqQstDAcwclKiVUAhHp1O0js9S8=;
 b=oSy91qau43lWSUyMDk0NGTR/ffV+mME/JzPCAhJRtGrezYDmZ7iUrBnf438i8wSiYWppHUQ7WK2gJSXp5Evg4LEtBJSe6/URwUTeg0tvFlomdjw3DlkH6ILIOxxnr4PX3Gr5xt8jyyna7XhLIXkOOX8KaNSVqiH3gRkFFSpqbDeGsQpdi9FQTVphUjlqFriq1zezqeC0wqLNCOwCy0zeFb046gUxrnvl1ysHVD8X4/0/euvjfVyFWzCn9e52nMV33vjiSeIJobq58/gEX4nNzsmBcwwrfYYtDJfwwZy+K5HPAiJwmwTpoxXkJaBO6aBMY9UJJF6nagYQAIo7r2vRBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Fri, 6 Dec 2024 02:00:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%3]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 02:00:25 +0000
From: Zi Yan <ziy@nvidia.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
 xieyongji@bytedance.com, lihangjing@bytedance.com,
 punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Linux MM <linux-mm@kvack.org>
Subject: Re: [RFC PATCH v2 00/21] riscv: Introduce 64K base page
Date: Thu, 05 Dec 2024 21:00:23 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com>
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
X-ClientProxiedBy: BL1PR13CA0346.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 3397f996-8082-432c-e1bf-08dd1599c045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXhPUitEUCtqS0ovSWN5RklxdGNrM04rRTdJMmJYV0RTUEdLalJVRG5xN0dU?=
 =?utf-8?B?Slh1K2VEc1pjMzViR1lFV3FFdGRLWWhPaUV5ZEFXc1VVWGxaUVdZZlRrWnRt?=
 =?utf-8?B?MDFlZ1NQMXorR3NOemlJaG5QV0Q2SVI4WEh6ekN5b3VoRmxKcXFXWDlHS3JS?=
 =?utf-8?B?Znp6ak1NcXM1U3U1V3l2bUhVR3JGeFgyc0x3KzVDWk5JRUNwU2Q5a0dWbmEr?=
 =?utf-8?B?QTluZ3FUNmhMczNBTXBwSTZtZEZjN3k3REtlcGtsMWFLUU5Kb3RNUE5NdGdq?=
 =?utf-8?B?U1JSNjBLd01jbDc2TENoSWVrSGNXdWVmb1ZDL1JUMkFYQ1NweGhVSE5IMzV0?=
 =?utf-8?B?T0lRQWR6MVF3K1VCWU5GUUl0OWliemhlN2VJakhWWFV5OGp6WGk0d09JODVo?=
 =?utf-8?B?eG9lcHEyVExUeE01N1M0NGdmY1NyRXpMV1hJaTViaDljR3ZPVjN6UVMrMFow?=
 =?utf-8?B?bFZGZG1TTlR0YlNKSkpUbWk0S1IxZmptbjROaGVmWjhqNndRSWlzcVJ5Zk90?=
 =?utf-8?B?Y2FMUjlEdm5rVExYdEpOZTZ3eEhIcHRnSkpvNlBtSXUxL3RWaDFoZ1lsRmMz?=
 =?utf-8?B?VkF4UnM3V2tvMDlvbXZqRTcxUkN1MmtPQWZ0bndYWDI2bFVtOUx5UURzQkRh?=
 =?utf-8?B?YThoclFLT01KSHJJNFQzS1gzWGxDTklyVUJrUTFVUzc5WUk1T1EwcjFVSzRP?=
 =?utf-8?B?WUJKdW9kTGFhTmtFbGJLVHVtalllOExXaVYvcDZxNGs1aHZRU2hxUlc1MHJE?=
 =?utf-8?B?d3E3cmZKUFNpUWpyZGNsQzhSeDFjVVBrdmZLNjFJRUxYdThIeUhsRnp4NFM1?=
 =?utf-8?B?RUpXeEZraGY2Ym5CU2F4cURBR1lZSENXZEx6clZvSWxnZ1A3ZUxiQy9oU0xW?=
 =?utf-8?B?VVFQLytITFVpcHI2RTRKM1hGQ0VsVDZ6LzNnSjQ5R1RScmlZSDNKa2FveW1w?=
 =?utf-8?B?cGJ6UC92SW1JZ2NBRzYrS3huVS8rd25TaEFBWm9JbUNEemdMR1pDWWRYTXBX?=
 =?utf-8?B?NVVacXdjSG9yNkRLSHo4MllvY0VVQTltaFRZMEUzcDRqa0hpTDJlVm9TY3NT?=
 =?utf-8?B?SVBPanNEc3EwT3loTi9hTi84QmFRcFZVTFhseFRsVm1VdUlXeStkMUkrV3VZ?=
 =?utf-8?B?akF6MHhjV2pzQVcrTkRINldJU3BaeFM0Wk05c1UxRHA0OUYvdU5sU003RkNG?=
 =?utf-8?B?NjZkR0RMMGMrYUxObmF2QUg0SUVyMzN4K29LME1JdlIwK1h4aHJzdVpkbTNZ?=
 =?utf-8?B?RnNpNDY1UnNrMHRURnZuR0F0RjlZT3lPVjA4VWtUb1VNb2R6Rko0eWZLMHdw?=
 =?utf-8?B?a0h4Vnp6ZWxOaTdyZEF3SWdPOVl2OXRnaEpPdXJaUzEzdXZPOGVrQjFPQ3A0?=
 =?utf-8?B?MktpY2MzMGZ0cFNBUXZqaFlPZ1QvZm5UVFRJVWN5dWdFK3FwNmFORjh0cU9o?=
 =?utf-8?B?eWdtU2ZSN1FpUlA4VFZEcHpxWU96YlhLTGVvZm9TQTFuQWI3dTVYTHBxVXQy?=
 =?utf-8?B?NUlqckg2Z1J5cmdleU81aHYxNGR3UnB2b0oyZ21SVEZrY0pvUVBaSUhsWkdo?=
 =?utf-8?B?d0NiL3JWbnUrVXFzdUJOS3hJSDZBL2FrcWlQYkt4U0p5UmZGQUxaWmkwSHZi?=
 =?utf-8?B?aklWRE1LemNuNlE1T2dmeTZmWXlXYVE4UmR6WHMyUGV1UXN2VW51Vm8zdFYv?=
 =?utf-8?B?VlovZkVjeWZvZWlHTTRKYSt4MUdVdktEL2x3TXFrajM0ekxwbGhUU2pCQnI0?=
 =?utf-8?B?QzVmS2xBR2JxbVVLRzhGMHhwbjF5YXg0M0hDVXhOZnlTeXJzNUNMaFcwaXFp?=
 =?utf-8?Q?d4txTnKHhizqeCiPDwy3CcIyj/YNQpp6/T6qs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q000VDBxeDZFLzlsbGsvQnRTeDRuMkkwT0V4OUI2ZmxJRS9TWGFkZUJVc3l1?=
 =?utf-8?B?dVVaS0tBRTRmMDZibGFrUHhjLzhiQnU0REN6VVRZOHFFMjBhS3hnRU4wV3o4?=
 =?utf-8?B?RjUzOTBadS9BSHQ0cEdxamxWQkcrYWZvWHVHMGRIR29udUZhTExISmlCaExF?=
 =?utf-8?B?RXBiT0tiWm44UDVzUjF1TmNMaW5heDRQUHFndkZrRUdzM3ZNQzJrSDhEYjVG?=
 =?utf-8?B?MU5IRUJ4UFZmcjNlYnFhS1h5TDNROUJ6ZHlwVm9SbVhBcWtWc3M0L05EaStO?=
 =?utf-8?B?T3hhZ1Z0N0Zkd3l6ZkJNTTNtQUFiaGN2MUdDaGI4MWFIV29nME5WUHBjNXQr?=
 =?utf-8?B?Zi92MXhuTTVFTEZWNXZ0WVp0Y3lqVGV5anRwY0ZXc3VNOE9uSHBNRkxZb2ZX?=
 =?utf-8?B?K1BPQWh0elVPeHRSMjlWaDRnSzEyL1Zka2dGRldSZ0NnTEVMSzBzeVdTRSt5?=
 =?utf-8?B?NjdCWlJ6ZXRiek01WXRRckFLOUtMTmxPQ2tCRDRYUmQzT2doczhvTDk1cXBi?=
 =?utf-8?B?TVEzNlBnaFFwOEQ1R1ZmeldNc3hJQm5CMU5veU8zYTJVNkJqR0pMSHRRRVNQ?=
 =?utf-8?B?bEd0OUlMM01sZ2cvb0hzV2Nha1AzOHZHNDBuMjluQU1PZUJOZjNJdTVFVGZj?=
 =?utf-8?B?R1ZSb1pIa0JxZFNEYXoybUh0RnhxOEdnN0o2ajUwU0JwUkdsOUJabE44RWhx?=
 =?utf-8?B?TWEwYjhGMzN2UWRaUGkzd1RCejk5V0pNTFZJMm5YMDlTQStSMnl0aXhvUWUr?=
 =?utf-8?B?M21Eai9EOGlLRjgrcUFpTFMxbFBpVnNPRHVvRkw1Vk5rR0hzRHdvWFFxUE1H?=
 =?utf-8?B?ZnRuZDFmMUdsa2NQa0NpTVRvbWhDajdIcUtsZkduUmlPZWlJN3FvQXRHNVJT?=
 =?utf-8?B?bW8xYS91aTNCZU83dVl3c2FvMkp4SG5WbmM2ZEIxQTRVZzdoNTNjUXc3WTZk?=
 =?utf-8?B?MnFxRGVoR0dnM1ErVXl4dTVaaTZtdDk1S0JCKzljeFFVM0R5VWtNbXpWbExI?=
 =?utf-8?B?SzNPQUtyd2pFYnVHNDNrWXBCVWs0d2tNQ0UyaFBVTmZaZVVKa1JocHFyWmoy?=
 =?utf-8?B?MzVIUnJ6aFBTOGlZL1NrRTdPTHFtdXZQYjRFb2FOdlRzaWF4d3ZxYnpOcTZh?=
 =?utf-8?B?OFJDRStxeDRwRkpORjJoTHkzM3lxUDhNYWFFK3gxbTNGYkJXNVhLNWhvN1pm?=
 =?utf-8?B?SEFZaWRVdGdEZ014aklrblJZVlVnRDBZUVdwMU56emE3aGo4ZFhnTDJOSHZF?=
 =?utf-8?B?b3BxaHg1YThKV3NsTTBQT1RaTUZHU2NvUnF4cFB6cEd6VDlLbzl4T3ZxVVp3?=
 =?utf-8?B?Q2ZMa2dLT3BKVmdQelFiN3FRWVVwektzckdyS0E4aHI0UTVtVTVpMTRCUVlR?=
 =?utf-8?B?YlZLbzlCOGsxRTZWUzV1YXRUVlhOaFdWcW12SmlrckVxa2dsRlZKMHdBUlhs?=
 =?utf-8?B?cEMxWVFzdS9STEZvQnl4djQwVFRzeThIR3ZITXVrZEpUNWwrbTRCT1pTeHpO?=
 =?utf-8?B?TThTa3RZNmo2VzZtWXRyMHlUbllnaFlaekFpL2t1eXNicXMxdmdiMStnUnpY?=
 =?utf-8?B?VVZWam1pNDhtM29Na0lnbm5LWUVZYmx4OVRHcmsraEE3ZS9zbDhyOEEvcVNz?=
 =?utf-8?B?Zy9zNXA3eXdxcDgrdEZETVV0TGhFQ28rTlZTOGFmY3RPaStsenRxRG5wQmVL?=
 =?utf-8?B?dUNhMW1GbXRRVlVaMUhKYm16alNOT05ORW5jMEpBMXlnU3l4ZnF3aThQOUg2?=
 =?utf-8?B?WUxRNm9LbVdTKzNhQmo0ZzdoQkVjQ0tYWnBHK3gyUHBJWUlXRUpaQm5vUGl5?=
 =?utf-8?B?NVl3elQ4QU53SEJOVG0zZmpGU0JORmZLZEJkdWlPQ0k4S2s1NXR2WnNmR0dl?=
 =?utf-8?B?WmhiejA2ZmdpZzFJRG1mY3Z6OEVYUlV0cTBjYVlCSHFDS0M4eHJTeTNDTjYx?=
 =?utf-8?B?dW11TUk4OU1mSXhyd2FBcWpjcGRka2FFZTNySG1FYzBBMTd0V1grcWEzTXZx?=
 =?utf-8?B?NlF6NWF2akF5eWkzbjMwNkhJL041eXpNT0MrRTIzblEvY2ZaYzNxbi8zdFJS?=
 =?utf-8?B?OHVqZHZ4T3lNOERwaUYzbjdiZFBVZEVuQ09XSnFwanRKWUxYcDNDcHhzOEZ2?=
 =?utf-8?Q?mNmk6xqL2Tngovpg1HuNOxhcP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3397f996-8082-432c-e1bf-08dd1599c045
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 02:00:25.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhB0qFliwFOofWT/hw3Ta+GgFuTyBP90v+AhXaWpwNDpwp9/m+TuMimiUvaM4P4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_180033_656620_C7A2956E 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNSBEZWMgMjAyNCwgYXQgNTozNywgWHUgTHUgd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggc2VyaWVz
IGF0dGVtcHRzIHRvIGJyZWFrIHRocm91Z2ggdGhlIGxpbWl0YXRpb24gb2YgTU1VIGFuZAo+IHN1
cHBvcnRzIGxhcmdlciBiYXNlIHBhZ2Ugb24gUklTQy1WLCB3aGljaCBvbmx5IHN1cHBvcnRzIDRL
IHBhZ2Ugc2l6ZQo+IG5vdy4gVGhlIGtleSBpZGVhIGlzIHRvIGFsd2F5cyBtYW5hZ2UgYW5kIGFs
bG9jYXRlIG1lbW9yeSBhdCBhCj4gZ3JhbnVsYXJpdHkgb2YgNjRLIGFuZCB1c2UgU1ZOQVBPVCB0
byBhY2NlbGVyYXRlIGFkZHJlc3MgdHJhbnNsYXRpb24uCj4gVGhpcyBpcyB0aGUgc2Vjb25kIHZl
cnNpb24gYW5kIHRoZSBkZXRhaWxlZCBpbnRyb2R1Y3Rpb24gY2FuIGJlIGZvdW5kCj4gaW4gWzFd
Lgo+Cj4gQ2hhbmdlcyBmcm9tIHYxOgo+IC0gUmViYXNlIG9uIHY2LjEyLgo+Cj4gLSBBZGp1c3Qg
dGhlIHBhZ2UgdGFibGUgZW50cnkgc2hpZnQgdG8gcmVkdWNlIHBhZ2UgdGFibGUgbWVtb3J5IHVz
YWdlLgo+ICAgICBGb3IgZXhhbXBsZSwgaW4gU1YzOSwgdGhlIHRyYWRpdGlvbmFsIHZhIGJlaGF2
ZXMgYXM6Cj4KPiAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAgICB8IHBnZCBpbmRleCB8IHBtZCBpbmRleCB8IHB0ZSBpbmRleCB8IG9mZnNldCB8
Cj4gICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
ICAgfCAzOCAgICAgMzAgfCAyOSAgICAgMjEgfCAyMCAgICAgMTIgfCAxMSAgIDAgfAo+ICAgICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiAgICAgV2hl
biB3ZSBjaG9vc2UgNjRLIGFzIGJhc2ljIHNvZnR3YXJlIHBhZ2UsIHZhIG5vdyBiZWhhdmVzIGFz
Ogo+Cj4gICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgICAgfCBwZ2QgaW5kZXggfCBwbWQgaW5kZXggfCBwdGUgaW5kZXggfCBvZmZzZXQgfAo+ICAg
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgIHwg
MzggICAgIDM0IHwgMzMgICAgIDI1IHwgMjQgICAgIDE2IHwgMTUgICAwIHwKPiAgICAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gLSBGaXggc29tZSBi
dWdzIGluIHYxLgo+Cj4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIGNvbW1lbnRzLgo+Cj4gWzFdIGh0
dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85NTI3MjIvCgpUaGlzIGxvb2tzIHZlcnkgaW50ZXJlc3Rp
bmcuIENhbiB5b3UgY2MgbWUgYW5kIGxpbnV4LW1tQGt2YWNrLm9yZwppbiB0aGUgZnV0dXJlPyBU
aGFua3MuCgpIYXZlIHlvdSB0aG91Z2h0IGFib3V0IGRvaW5nIGl0IGZvciBBUk02NCA0S0IgYXMg
d2VsbD8gQVJNNjTigJlzIGNvbnRpZyBQVEUKc2hvdWxkIGhhdmUgc2ltaWxhciBlZmZlY3Qgb2Yg
UklTQy1W4oCZcyBTVk5BUE9ULCByaWdodD8KCj4KPiBYdSBMdSAoMjEpOgo+ICAgcmlzY3Y6IG1t
OiBEaXN0aW5ndWlzaCBoYXJkd2FyZSBiYXNlIHBhZ2UgYW5kIHNvZnR3YXJlIGJhc2UgcGFnZQo+
ICAgcmlzY3Y6IG1tOiBDb25maWd1cmUgc2F0cCB3aXRoIGh3IHBhZ2UgcGZuCj4gICByaXNjdjog
bW06IFJlaW1wbGVtZW50IHBhZ2UgdGFibGUgZW50cnkgc3RydWN0dXJlcwo+ICAgcmlzY3Y6IG1t
OiBSZWltcGxlbWVudCBwYWdlIHRhYmxlIGVudHJ5IGNvbnN0cnVjdG9yIGZ1bmN0aW9uCj4gICBy
aXNjdjogbW06IFJlaW1wbGVtZW50IGNvbnZlcnNpb24gZnVuY3Rpb25zIGJldHdlZW4gcGFnZSB0
YWJsZSBlbnRyeQo+ICAgcmlzY3Y6IG1tOiBBdm9pZCBwdGUgY29uc3RydWN0b3IgZHVyaW5nIHB0
ZSBjb252ZXJzaW9uCj4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHBhZ2UgdGFibGUgZW50cnkg
Z2V0IGZ1bmN0aW9uCj4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHBhZ2UgdGFibGUgZW50cnkg
YXRvbWljIGdldCBmdW5jdGlvbgo+ICAgcmlzY3Y6IG1tOiBSZXBsYWNlIFJFQURfT05DRSB3aXRo
IGF0b21pYyBwdGUgZ2V0IGZ1bmN0aW9uCj4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IFBURSBB
L0QgYml0IGNoZWNrIGZ1bmN0aW9uCj4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IG1rX2h1Z2Vf
cHRlIGZ1bmN0aW9uCj4gICByaXNjdjogbW06IFJlaW1wbGVtZW50IHRsYiBmbHVzaCBmdW5jdGlv
bgo+ICAgcmlzY3Y6IG1tOiBBZGp1c3QgUEdESVIvUDREL1BVRC9QTURfU0hJRlQKPiAgIHJpc2N2
OiBtbTogT25seSBhcHBseSBzdm5hcG90IHJlZ2lvbiBiaWdnZXIgdGhhbiBzb2Z0d2FyZSBwYWdl
Cj4gICByaXNjdjogbW06IEFkanVzdCBGSVhfQlRNQVBTX1NMT1RTIGZvciB2YXJpYWJsZSBQQUdF
X1NJWkUKPiAgIHJpc2N2OiBtbTogQWRqdXN0IEZJWF9GRFRfU0laRSBmb3IgdmFyaWFibGUgUE1E
X1NJWkUKPiAgIHJpc2N2OiBtbTogQXBwbHkgU3ZuYXBvdCBmb3IgYmFzZSBwYWdlIG1hcHBpbmcg
aWYgcG9zc2libGUKPiAgIHJpc2N2OiBLY29uZmlnOiBJbnRyb2R1Y2UgNjRLIHBhZ2Ugc2l6ZQo+
ICAgcmlzY3Y6IEtjb25maWc6IEFkanVzdCBtbWFwIHJuZCBiaXRzIGZvciA2NEsgUGFnZQo+ICAg
cmlzY3Y6IG1tOiBBZGp1c3QgYWRkcmVzcyBzcGFjZSBsYXlvdXQgYW5kIGluaXQgcGFnZSB0YWJs
ZSBmb3IgNjRLCj4gICAgIFBhZ2UKPiAgIHJpc2N2OiBtbTogVXBkYXRlIEVYRUNfUEFHRVNJWkUg
Zm9yIDY0SyBQYWdlCj4KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8
ICAzNCArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZpeG1hcC5oICAgICAgIHwgICAzICst
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgICAgfCAgIDUgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgICAgIHwgIDU2ICsrLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUtMzIuaCAgIHwgIDEyICstCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS02NC5oICAgfCAxMjggKysrKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS1iaXRzLmggfCAgIDMgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggICAgICB8IDU2NCArKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggICAgIHwgIDI2ICstCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9wYXJhbS5oICAgfCAgMjQgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5T
ICAgICAgICAgICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5hdGUuYyAg
ICAgICAgIHwgIDIxICstCj4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICAgICAg
fCAgIDcgKy0KPiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICB8ICAxNSAr
LQo+ICBhcmNoL3Jpc2N2L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgIHwgIDMwICstCj4gIGFy
Y2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgfCAgNDUgKy0KPiAgYXJjaC9yaXNj
di9tbS9rYXNhbl9pbml0LmMgICAgICAgICAgICB8ICAgNyArLQo+ICBhcmNoL3Jpc2N2L21tL3Bn
dGFibGUuYyAgICAgICAgICAgICAgIHwgMTExICsrKystCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1
c2guYyAgICAgICAgICAgICAgfCAgMzEgKy0KPiAgYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2h1Z2V0
bGIuaCAgICAgICB8ICAgMiArLQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL2h1Z2V0bGIuaCAgICAg
ICAgIHwgICA1ICstCj4gIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oICAgICAgICAgICAgICAgfCAg
MjEgKwo+ICBrZXJuZWwvZXZlbnRzL2NvcmUuYyAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4g
IG1tL2RlYnVnX3ZtX3BndGFibGUuYyAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgbW0vZ3Vw
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ICBtbS9obW0uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIG1tL2h1Z2V0bGIuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgbW0vbWFwcGluZ19kaXJ0eV9oZWxwZXJzLmMg
ICAgICAgICAgICB8ICAgMiArLQo+ICBtbS9tZW1vcnkuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA0ICstCj4gIG1tL21wcm90ZWN0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KPiAgbW0vcHRkdW1wLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQo+
ICBtbS9zcGFyc2Utdm1lbW1hcC5jICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIG1tL3Zt
c2Nhbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgMzMgZmlsZXMgY2hh
bmdlZCwgMTAyOSBpbnNlcnRpb25zKCspLCAxNzMgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcGFyYW0uaAo+Cj4gLS0gCj4gMi4y
MC4xCgoKQmVzdCBSZWdhcmRzLApZYW4sIFppCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
