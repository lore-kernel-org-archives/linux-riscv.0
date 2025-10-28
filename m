Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98CCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDxP/uah6g5lwsKpoFOTSKtSg/4SrU1bp0oQeJFiMiM=; b=X1tWhmGLTFcswD
	gTkfDglhvgAAW22oJQgxzYBqoPXHqHoCQ1+ia+3XeioIZNULjA26h4TAWoJMgnj0CcFz0B2lGTwxi
	tlxcoewEjNsp8vkoLLmUIB3KKK1tzxgXNMcFd/lRxjJWqOt4W8qWqys5l1CpUnANM4PW+zKP2pJwA
	LxcXqOGcWOIZvRxAGA9BqN9JmxWCXT46b7BIQCkGypJeC3dSIiGOEqa+wNFPj9munDCs1CufQkjsq
	63MBlXs0MYW8gK0Bl4B8QlRlpeWPgcjKKiS760rwmQrcfvu+JWUcYLrcjDNxhJzKSNOpphJFpI3/h
	hlI+adlB+6OKSUCkg44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDex9-0000000FXEP-07Yc;
	Tue, 28 Oct 2025 08:21:15 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDex6-0000000FXCb-0ume
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 08:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNqOfJmHjq99XFD2b/iH0QXlH0AdlsPnkt1Lm4jIRc2wzZIihCqzqltkn7BXElnHDcmXhBzx2Guibj2lvkUR9qrjpWBMIsedX6d83g/IvDo/AtD5J6qIxoF16aO/xnbJ+4LxJ197kfAyzQLSf3lRkf8U+c5nPmg1TtcrohY2I7PPTiTetClHznI60C+XzNZi1JkOkHbgMo2unD4ICFoS2TjrcRp7JJLm7KSZr/t+/F/RmMU2ChQPezmwd9EwQ9HiVamE8Shh2G/NtD2TXN9LgEdLYshgAE+F3UYXNnnqsBFrjVgdD8aEMkBaQT7DMqZQiEBlU4Lmq7FztqnKjLKueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiCND9U4OuxTnGhlbrAw/FIPcx5hIm1mcx2z0JjqLrw=;
 b=HGmtVTFKU/PP/7S0YEOiqkebzl9nbHkUz26LpD4bulbR95LqMC05b3BjbSITodTlJ2SyNTr8Ssw4qYvrbCFBXuURpJPl75/D8YmdRjIOM/iTllv1YWIKMVaSUlROxHsI8BnjyCRjIoBuHRHifbT3dE9sBVTcK10NZAiR0rswb+7fVr2J+0BbOyp2MG+rB2hOwRk31ZmYe7gpMeYAazCZxSNflhfiMjyrGzpgsFbxJqiyhJnLvAwNwTQ2AA/C34Ko8DAUNcliSdWVC0j0fUsQlsNWC1k3iUnDB+8PLj4ZNl8CXD9Xap0961CcDENA4m6evehYKBvOLmtDvPbnwu/Skw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiCND9U4OuxTnGhlbrAw/FIPcx5hIm1mcx2z0JjqLrw=;
 b=stQ19PvkCMRE1wrPGSQin/7qrXgrM1C9aYwqxKvrYg4rDOT+dJGrNU9D5FtnVWax4B1NQ+J42DtbQ3jD1SAQsDzXfhhaSgwn3cJwfMFNDg1JXEFp+LgRvHNGxYAJeNKzhn/P1b0xwEb8u7VIG5Utdo8i8GR40lKHsK40xUSdlOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:21:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:21:04 +0000
Message-ID: <f8e9766b-b813-42d1-b03b-563850130949@amd.com>
Date: Tue, 28 Oct 2025 09:20:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: Paul Walmsley <pjw@kernel.org>
References: <20251020053523.731353-1-uwu@icenowy.me>
 <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
 <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae15a27-e002-44de-0547-08de15faef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFFZYjVuZ3E0RE5MTGRZQXZwdytURE1Db0FsVW82UFdRd01IT2psL2xEblVL?=
 =?utf-8?B?Z2hKUzdUWnNvd0lCOHh1RVhnZVhpclZXeGVySGJNQWExSmJYL3pITlgyUEEv?=
 =?utf-8?B?YUEyd0VPK29ub1A5YUxoMDJZSUo4Ny9Yd3BXdjF6WDRqQ1pWZEtkZlBrb2tT?=
 =?utf-8?B?V1NkVzR2RUxLYjhjcVhaWTdkVFpRY0VVd1N0akRLb2xPYUd5TVcveFRQTmxW?=
 =?utf-8?B?V1V2MGVEVHk4RXFhUnVGYTIyZGhPbTBkT0l1Rm1IaTRoQkZRNUE2OEtLODJq?=
 =?utf-8?B?RlhBS0ppZmRPZ0V5M0JqUDllb1RxSXM4UjczUjVoVkQyMGNkNCtueEhBZ3NM?=
 =?utf-8?B?MnZUbmtpL2JSUXB3bGU4WWl3RHdvTXNGUjNVUjlYSXdWeStJOGZRUllFUld2?=
 =?utf-8?B?ZG1XWHZLSWpWL0x3YTJTT0RRSFAxUldlZmdWYkFLSy9CT2dlY29VWjlqa2M1?=
 =?utf-8?B?RktuZllVdWpiK1NoZ0RRb04zdmhZOXA0b1QvcnMwUFhUUmxtdm5BZnBBK0hJ?=
 =?utf-8?B?akFUSmdEZndxZXJPTWx3L0JMVkVhUW5VV21BVG9FbGk0QkNSZ050eXpMeVh5?=
 =?utf-8?B?N0RrKzgvMGI5QU8zK2h5eHpNTGFsOWhVaENzbm9peWJreHZNbE1rRUt3azIx?=
 =?utf-8?B?N3pBT24ralBSZi81c2NyYm9hcUR1UTVsZSs5SFh0eXFRbGk4cGl6dFhWM05C?=
 =?utf-8?B?Nnd5SXVHYWtTM0JyNG9lbjhvb0RheDBRZWxad0YwT1N5SWNGVkZzRFNaSVl1?=
 =?utf-8?B?VEFoZ0tRZjVGWHZGNk5WNGJtQlZMWk9ObjNTNXlCd1hQL3dwSmZtNWVraEZ5?=
 =?utf-8?B?enNuY3phU1RYNWRqKzZRNTFISjh6bEtjY1NxWXFvbEJpUFZ4QXBJaytuc21U?=
 =?utf-8?B?U2dDOTVrZ3d2NFhheG13aHZEZ1FtZkh2NENXQWs1TmsyT1lZalloVWhhYVZh?=
 =?utf-8?B?RG83ME8wSURwdTNDcmxqdm9JazhwVzRtSlg1ZjBHdllTSG1XbVQwSnZ4THZl?=
 =?utf-8?B?N0g2cnhhUXhEUFNhSEp3K2I0UjBFcTA0VEhQL09aYWlHeFF2VzhjT0tSS3Q2?=
 =?utf-8?B?bUFwY1hHUUwxYTk4VFVNMXhXNDVkcVk0TEMzb1pmZXpyTzAxcVJ1ZGd1emtL?=
 =?utf-8?B?dktBeFQzS09lRnRxRmYwZFl0cy9HV0dVMVh6VXN3dG5WTHloaVZjNncwbGJq?=
 =?utf-8?B?L1ZIL1BRTmJhdlRsa1A0Y0FEczhjeHhPclZWOWRXZER2QnkyZ1VjdlZ1aTVy?=
 =?utf-8?B?VFF3ZEU3NVgyODI5eTNlS095ckxWUE55R21yVExURzN0akdRVXB6K1NrN25w?=
 =?utf-8?B?Vi9tSG4rL1pkckxOY0lHOUNqNHdLS09qdE4vYlhtdUpMQ0UxL2FmaURYZ3dj?=
 =?utf-8?B?dHZYVjgycHRMNHAyc1RnK3JMV3pZMTlqbEwxZnNkemIyb0JveUNVZFh2L0Zl?=
 =?utf-8?B?Sm9mK2R6dTFlOUIxcjRtRnlpNTJDSnZFR3ZyR1dnZVZjL3ZtZytPQWtmWTc4?=
 =?utf-8?B?S3J2MndXSndSeDVmMXUzb3l0dENGSU1HaDlkblNuYmhKR2tRWDgrRkltMWVX?=
 =?utf-8?B?Sk9RRGUvSHBzYldkRFZlajBzaXZPL01GTWVOc2szTjB6ODltdWQ5cTBvbURn?=
 =?utf-8?B?REJOdkQxZjRrb0hkOCt6ODIvY2F4aWlBcDZoWVpSQTIxMVIwa05PZGgvRW9M?=
 =?utf-8?B?K2w2eTlkYk8xL3FkUGxKMTBna2dGbHovUHdxaVdXbHoxdituNEdXTm1uNlpJ?=
 =?utf-8?B?dTdBRUl0REtYZ0Z6VDcva1ZkTjVkOGdwb1RiWmxiWjYybVhwYVdzbTNuOVox?=
 =?utf-8?B?MEJQYXFTSEFSWkp3SWloaWMyWE5SYTVxNENETkI0cVlsbEhEMERRTmhTODBt?=
 =?utf-8?B?eXFsOFk1QnI3anVNelVzZDlicTJBQU1heFVxRk5ab0w2K0N1T0pVd0EwM3hD?=
 =?utf-8?Q?gkla+dWLAEMGq4LptCQE/p3fYtmPOU3b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajB1UGR6c3VNaDVEVjE1bUV6ZnkwQkphV0lpQStZdFhhemo5NmZzamdDclhn?=
 =?utf-8?B?aGYxY01HeUQyZE1sdmpibUhEZmovZEk2bVp2WkdnYkxYekRVZThTNWh4TWM4?=
 =?utf-8?B?d3h6anhvZjVTdGtvMjNKQVh3VTdzQThpZWNoSVRiTFJYY0dpS0FhQzdrbmpF?=
 =?utf-8?B?ejZsU1RHd2dPMk9MeW5iWG4wbitZaEhTSzg2M2JDWjZFVW5kUGhnNkxkdUY0?=
 =?utf-8?B?RWx1ZE1OUGw5Nng0bVVrREFYeGd3YThobUZZcmprSEhlQ1NCSUlPUmJkRHIw?=
 =?utf-8?B?YlkxeWFnQ0NtWkVGRkNZbUhJOGdJSXM0Y0I3cktQMHQzQjZ1eVJPWm53aGxr?=
 =?utf-8?B?RHVLc0tJbWFkNE5ETnVZRzhDcEdHZEMvajh2VWdmdW1LcUtxdXJ3azgwTzNU?=
 =?utf-8?B?aU4vcC9ja1Z5ckdPelNtR21od0pzalJCVmY4TFhpbVo4VzFGaEVobHF2aHdX?=
 =?utf-8?B?SnBIRjM1OTIvNlpPSEJUR3lkREFybGlEU0VnS1MvcHlCS1JKN0oyenpYZ2dk?=
 =?utf-8?B?V2lWWXgrTjdwQ2xOQnNSOVN1V3BNQlpCN1dkNGVCd0tnV3R2Nyswci83aDI1?=
 =?utf-8?B?SnVWQ1FKRnpQMXQwY3M3T0drcjdOS0NYUllNNTQ1VlJGZDNlVnhRdUM1ODBL?=
 =?utf-8?B?VVdMamp3OGEzejdrQnc0M2FCRGNwNytpemZpZ3EzV1VpNFljSU1TSnVnQkti?=
 =?utf-8?B?NnVrNnBKTFFqNG9aZjBXWlFSbGlEV0YyQkc3dlNocWdDeWt6Q2QzWU90SzZ0?=
 =?utf-8?B?UVFOK25RZ1EwdTlodFNaVTdwcWlrSE5kcDlmODFrV2s2MjQ5VVJvU2ZiTERn?=
 =?utf-8?B?NFNoUG1rNHhUaWF5NXdlZTJIdXFNcG1IVC9ha0V5a0lRTmU3VEt6OUswSjNZ?=
 =?utf-8?B?TEtTbFluQU1nU2F1T2tET05HRmcybDZpZCtyQVJLSjVKbjUzc2ZxUk1Xam1t?=
 =?utf-8?B?WGd5Z3ZDdFlWMUlZRFRRT28vOVdBelYrUEZhdURhckpVWHJUMUIzZVMxRUdT?=
 =?utf-8?B?Y1pmNXRhbzhFSFp4U0lId3JtQU51aituYks3ZWhuK1BXTjc1R3lSSjlrZ0Jt?=
 =?utf-8?B?K1lJZzIzbFpxMWxkYWMrSXRHQ2traWMzN0dCaDZGaDZLNk1wZk9vUGx1bTVm?=
 =?utf-8?B?WWcwczN1a1FEYm5uUXFDQlFWQU1lcXk3cmFON1B6YVFhYXFtajM5cURta0NO?=
 =?utf-8?B?VEJDQTlSMDdDWkJVSHNWTkN0eTdEb2VjK0x0cGVrUStDdWxtSElKRUprSmZV?=
 =?utf-8?B?RUZUVlhPbUFvRlRwUktzN2JYbnFGMldSZGdyc0s2aHNDN21ZdVptZ1NuS3ZJ?=
 =?utf-8?B?OWUwQjVXazVac00rMWtuTUM0ODh5NGQ0TCtYL2NkNHJwSWVldlpKeThBN1Fv?=
 =?utf-8?B?OXJhK0xHSUdFTDVpY2R3N1MxUEk3L3Q4L2MzcVB1Tm9tWkR2SElhRDlBc2NU?=
 =?utf-8?B?OU85b0ZQNWJ4WnRHNFFQT3pmNG5oV0hibUZtNmkrMFRRVDh3VEZPUEk0K1pj?=
 =?utf-8?B?b2t0TVhaNHQ1NkxrU3hmNkk4S0p6NVRsREdVbWpwZWx6OS9yKzYwbERmdWU1?=
 =?utf-8?B?MXlBazZ1dVFjUHNIMnVyakdsU0RSS2FsQW16amNTckN1bG5DNmViUGNpQkwz?=
 =?utf-8?B?a094SDByS0FHU1l1TkE3Yy9xNWVrMG9VdWhaRVFSOUlELzRFUm5Hek5adFdF?=
 =?utf-8?B?OUljc3FvalovcGcxWSt5L1RQdDBBWlBVcDJDRUsrYjNEMjdaOFk0eDVtSGZk?=
 =?utf-8?B?bXk2eXI5YWZxMUxlOUtJOXhTVU5COHZZR0FkYWVsMkFlUkRNZHVGVXR1L3Bx?=
 =?utf-8?B?UDVmamQ4eXEvc2hnbFRnS3lJeXFzcTRXaFgwUW9EVGlUT0NwdGlTaGxRcXAx?=
 =?utf-8?B?VGc0V2RweHZHeXZDME5yNUttTml2SGN1M1BoYmJHb2NieHduU1lGSVY1OERY?=
 =?utf-8?B?UHZlWHRNcnlrTFlwREZGYVZTV1JNQ0YxSE9udG4yMFVneU05bTBYSU43ZXFu?=
 =?utf-8?B?czFLbGdQT3Z5bWhFTU54QVgxd3huMVd0YXprTk9CajJxTmxqL29qRTJleU51?=
 =?utf-8?B?eGpjVU8yblJob2t6SUtSLzY4UnJqZXFtOUNqTFA4S1pDUFQ5bEpPUFBzdkZZ?=
 =?utf-8?Q?BepY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae15a27-e002-44de-0547-08de15faef63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:21:03.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCv1yurtfLZ1I8t0dJB8wn7F1JojS7Fj+TFkOf9kMLFKPAyQgK0nIopAxa5UvItk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_012112_258560_86AE5B08 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Matthew Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, Yao Zi <ziyao@disroot.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Huang Rui <ray.huang@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMjcvMjUgMTc6NDEsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gT24gTW9uLCAyNyBPY3Qg
MjAyNSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiAKPj4gT24gMTAvMjAvMjUgMDc6MzUsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4+PiBUaGUgUklTQy1WIFN2cGJtdCBwcml2aWxlZ2VkIGV4dGVu
c2lvbiBwcm92aWRlcyBzdXBwb3J0IGZvciBvdmVycmlkaW5nCj4+PiBwYWdlIG1lbW9yeSBjb2hl
cmVuY3kgYXR0cmlidXRlcywgYW5kLCBhbG9uZyB3aXRoIHZlbmRvciBleHRlbnNpb25zIGxpa2UK
Pj4+IFh0aGVhZG1hZSwgc3VwcG9ydHMgcGdwcm90X3t3cml0ZWNvbWJpbmUsbm9uY2FjaGVkfSBv
biBSSVNDLVYuCj4+Pgo+Pj4gQWRhcHQgdGhlIGNvZGVwYXRoIHRoYXQgbWFwcyB0dG1fd3JpdGVf
Y29tYmluZWQgdG8gcGdwcm90X3dyaXRlY29tYmluZQo+Pj4gYW5kIHR0bV9ub25jYWNoZWQgdG8g
cGdwcm90X25vbmNhY2hlZCB0byBSSVNDLVYsIHRvIGFsbG93IHByb3BlciBwYWdlCj4+PiBhY2Nl
c3MgYXR0cmlidXRlcy4KPiAKPiBbIC4uLiBdCj4gCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fbW9kdWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUu
Ywo+Pj4gaW5kZXggYjNmZmZlN2I1MDYyYS4uYWExMzdlYWQ1Y2M1OSAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9tb2R1bGUuYwo+Pj4gQEAgLTc0LDcgKzc0LDggQEAgcGdwcm90X3QgdHRtX3By
b3RfZnJvbV9jYWNoaW5nKGVudW0gdHRtX2NhY2hpbmcgY2FjaGluZywgcGdwcm90X3QgdG1wKQo+
Pj4gICNlbmRpZiAvKiBDT05GSUdfVU1MICovCj4+PiAgI2VuZGlmIC8qIF9faTM4Nl9fIHx8IF9f
eDg2XzY0X18gKi8KPj4+ICAjaWYgZGVmaW5lZChfX2lhNjRfXykgfHwgZGVmaW5lZChfX2FybV9f
KSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSB8fCBcCj4+PiAtCWRlZmluZWQoX19wb3dlcnBjX18p
IHx8IGRlZmluZWQoX19taXBzX18pIHx8IGRlZmluZWQoX19sb29uZ2FyY2hfXykKPj4+ICsJZGVm
aW5lZChfX3Bvd2VycGNfXykgfHwgZGVmaW5lZChfX21pcHNfXykgfHwgZGVmaW5lZChfX2xvb25n
YXJjaF9fKSB8fCBcCj4+PiArCWRlZmluZWQoX19yaXNjdikKPj4KPj4gTG9va3MgcmVhc29uYWJs
ZSwgYnV0IGRvZXMgdGhhdCB3b3JrIG9uIGFsbCBSSVNDLVYgdmFyaWFudHM/Cj4gCj4gRnJvbSBh
biBSSVNDLVYgYXJjaGl0ZWN0dXJhbCBwZXJzcGVjdGl2ZSwgeWVzLgo+IAo+IE9mIGNvdXJzZSB0
aGVyZSBtaWdodCBiZSBhIGhhcmR3YXJlIGJ1ZyBpbiBzb21lIGdpdmVuIG1hbnVmYWN0dXJlcidz
IAo+IGltcGxlbWVudGF0aW9uLCBidXQgdGhlbiBhZ2FpbiwgdGhhdCBjb3VsZCBoYXBwZW4gb24g
dGhlIG90aGVyIAo+IGFyY2hpdGVjdHVyZXMgYXMgd2VsbC4KCkkndmUgYWRkZWQgbXkgYWNrZWQt
YnkgYW5kIHB1c2hlZCBpdCB0byBkcm0tbWlzYy1uZXh0LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoK
ICAKPiAKPiAKPiAtIFBhdWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
