Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A284BCF2567
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NiSkiGU4+psgBlHTIi4IRfAafiA7niM26O3vAYnf04M=; b=buYafkmDglw7KBEQhaF1rIwshV
	ZUO27ATEH0JEHd0sgvjWV/GbBFPBvp6ooC4Yn02nAfi+yydxNQmFk7305o4i7Y9qr4B9pvqO1P+jo
	Ec9zlPZqiT7pMknG3Cd5u4SSPagjsENGPyfGyiq1nsf+d4+e3YhZNUiPytOrP0kCpbRee2NQVDmr7
	xmYj4m2UH9mg068uBo3tw9//OsG5LlLr1t1EsVXfujbAzxKbDSNtz0WShy7G/H+lyCWOC6UC5HWoA
	hd5Wt2kL+WBeSCRWGNVeUbtKHF95lclIPa1gZQ1Xx0i+n+yf9wtOyd0Z8OMYhybFyRExq/ME4nTQF
	+zmW9FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYO-00000002h1F-0Zan;
	Wed, 19 Nov 2025 07:24:36 +0000
Received: from mail-southindiaazolkn19010014.outbound.protection.outlook.com ([52.103.67.14] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYL-00000002h0l-39wx
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 07:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtpDoJhWzdGtjmQkk7Cxl+wUPehOWfSJCgOOY82zg5XdIpW5KUk1A40XEhiEaEjGAwSzM3P9zmxTUK5tjvHOqC+SRWGkiFBXiSlFsYVa9jezaE0dVFLP2HXiQvc/7J1gBNU8L6qNWVdz3WMSl6CKSSLlQYw0Re2iGjza0wwTTkYrLW4ViPo1r0/Etmro9eKTTdimXe+WVMGpzUY+wIcbvOb7Gs5O0yumeYUfy6GWEpQ+/k9dpG+Iw0pkR7U8OuLMwmsARolWCHVkOgUe+wwNOBgZ1CjEnNxRH/prAUaThWyL9FalAnSmgzzfWyCK4aBYqRMzjQop+AUpnuxsLt6g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNuL44HrdXqSmIvmgOa3V+FD29y+sTIIOAioBM2ycKE=;
 b=naDgCJi9n26GgWMjenKFyW6+q8bs8nLZL4i4pZbM1I//NpeiMv0Z7kDKM08OiVl+xk4JQXq5MbqUUWZEcNs/V478ulUoNOM4gxhHLT6/rB3Hmk+r8H1hw6dk0PcRL9pZZGUr80pZjqgR9AXzhzy4baf5/ccNpbcolwfoLYBg2okeMUp60PCTaZPYVzzeMK+vlBDUzXDZ2rsewLdbjbfSDx72WqzSHc/0DajuHA2ooK0eRp/bhi4c4X9H0JwLGGId26sFNOMVbft5GiNBAE7Kb0HGoYzvkCVI+pujRuvMTOFoJe94hZfs7fvgL5/Jg2Kk8hLURJ8pZHmoPW3Fd3ZsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNuL44HrdXqSmIvmgOa3V+FD29y+sTIIOAioBM2ycKE=;
 b=l6sBQMKVCwLT0caErztjFOnhY05zswqO+X2urRFE91mf/pI+sp/MmnMiZSAl679/JOIri5HC0zrFOsaBkXxMkZlg/WgSAeB9EtjdR+clIjgGuApZLjMfB7fYCwcus/uTCwOGA8jFhPjtJ2hQ1NrYBfVQHhFx2jb4jR7bE3ntVVJpmWpg686miZpeHDFX83We3f0hMkWMiMTeVXbDZjmP55spEhbq/d77HMTfDItotpMglXcJo2zXi8E+EjZd6NxRPOC4ExEpSkb30qp766MatcSN+lkbL5/MUIynWSm/jehNr91kMn6Or/NKS4K92QbinMD38lqHBtYrXavCcINTLg==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PNXPR01MB7057.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:24:24 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:24:24 +0000
Message-ID: <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 19 Nov 2025 15:24:20 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <unicorn_wang@outlook.com>, Zixian Zeng
 <sycamoremoon376@gmail.com>, Longbin Li <looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.19
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID: <93615a35-2989-4162-9f1c-dcbdd4671c6a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PNXPR01MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5285d9fe-bf9d-44e0-1359-08de273caa44
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TWnHr2aTc7oye/bilYJDP7yfsIDR2Wg9EZ1PUFgVmNwRWXoo6HLAnUuN1zc0CkZbj7jOE6wAI3Fq0jgSut+ZLTARY3+FBnsVcHYnwB+o9hGOBjFcQcxvsJTdnQC+QdpBe9/f2+2kOiYxyk8NCkTJrF32Zqqm4u9zS13+GCRFzYMWsiZQnu3NpmvbOR0aE4xdJ0ENvS559V8SqtPNkq+ojWZHaYG9B4WxIIw0Gjyytux3UO0FSuqCe3yZMwdzByPbPaII19nyQhDP/46IZiuqZTn+xsO8QEq45XxFfembNwz4wOYEJWuc2d1qaui2ov/7mJshZERsfhpD4fUEKkbetQi6PN5mnuAZ6rBLP/3UId8+BKo8zCOxNw4efdn34ETIWLjYpbCK1hWDVn+DyuW8cBAjRpWAZrm+CGyVQSALELqrFizO3wIrxFHpPosc+hcpflrx9obJcr6DnxZSmi6BB3B/I0eTbWCVeoxyaDUAEUWIBMMELH8iVh2Pu7jGzMw8HhYrKjXA7DAhw2lV4yL11BqP/yncjWMabI2qOPYHhKtyN4TgTZLujGz0pGas4aO1jPdKOgq6kZFaRtDwpAxYY/26p7+Py0hUL27YMyowpptkeGOlnehidengZmjoUPj2lNWbDf8o+SMMF3oSKTajGHuJvS/+J7Q9jqBz6gPxKv8H5fFhA4W2muuLa2RafuDVmyBh+7wJTYXtL6G3G01DgSqKzG8N+9gSYa49NQRi6I2T8XQiX6xldLtUg2nyPzmDqdO1oLciBkPgBZ7ajU24Qw0Qh130qUkss4=
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5062599005|19110799012|8060799015|15080799012|5072599009|6090799003|461199028|52005399003|40105399003|440099028|3412199025|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVxRzFFYS9xaGVUR3lEcVVoR1RDYktSdHFaWm42WURjY0FUMm9MNVJ6OTIv?=
 =?utf-8?B?YTNrQTc3VkVLOTBZQWJ2cGN4UDRmSEMwR0lEK0RIck95MTgxMDJEY01SQXFB?=
 =?utf-8?B?WDVVUElmR1p2T2lLV0dkZlBHcDI3dCtYNGcwVTh3L1lHMy9SUEQxb3JxbGpr?=
 =?utf-8?B?Rk14TU80UngvM3VYUHNsTmpxTGNnTkpoNnM3Z3l0VHRCdWE3c3lSYTFvQ1ox?=
 =?utf-8?B?aFh2ekdmeG5zWHg2c3oxRFZRV0VCbHlTQkN0L1R1YzAvdnFNcy92WWpaSWpS?=
 =?utf-8?B?SGVLalFZaWpBMUI3a1F2bUVuR3MzbGxET1lkb04zOGNyTHl6TGpPb24vRWtm?=
 =?utf-8?B?Mk9VLzNYZkRId2VCZy9CNXZ5dWNibTBlMmd6c3dTeHk3Um8vQ0hxdlN1N245?=
 =?utf-8?B?a2c4enE5Y3BXd0YwM1FnM3V1WlY0S1c4UHM2S2JSTzBydEFLOG5nSGFsYnI5?=
 =?utf-8?B?S0M1cFhIb3orZFlranI4UkRSNFlEajdxcTlDc0F6RjNaaWFLTFNNYzlHN2g3?=
 =?utf-8?B?Z1d4L1B2aEszbDVkbi94Wkp2Q2s0OWFhZ1VsRUpZL0pZRmd5RmNDdHhoam9T?=
 =?utf-8?B?d0pWRHpVNXdqeTM2WXFzczhsY3VEdFJwangyUEtsK1haS0NGaHE5cHFkSTNT?=
 =?utf-8?B?RkgxQmlBL0hvbXJlMTg4UE9Od1Y4YlVIYlVFVlVYd0FMRjJXNXBUSTNFaHAw?=
 =?utf-8?B?d3JZY1lIdEZSSWdYRmY5R3ZiMkVQd0lZaVh6dWpsSFRkUEdxaHFPUDBqc0Ni?=
 =?utf-8?B?YU1Va0tlVnQwaXU5bDVjaGlwOUpRc0tZd1FMbEEzWFhnVHVYeTNvUmtjNXIy?=
 =?utf-8?B?QVdaNnVZVjBIdnJlUUpwNm1mUVhpZ3NRVEI3cUZaT2N6amx1R3U4S0JyYVNP?=
 =?utf-8?B?aFdyaFF4UG5XVWJVZHJURkE5QXZibFJra0VUcFdSdjJPeGkwV1I3ZGJzUjNQ?=
 =?utf-8?B?YUZOVkxXWEVxUkpMNzhzTW1NblpIYkJ1K0k4T2cvaXZwL2J2cDF5Qmx1REZL?=
 =?utf-8?B?ZWZ5MTdGMC90L0R4a0VNb3N6UFNoVXNUUE9iYUNyYmVMMVhoYlBVaEtwYThn?=
 =?utf-8?B?NGUvMWxEWFFPKzIzLzFzMldrWklvS3VhcnFVN1VrWm5mOGJCU0p4NVpabmRM?=
 =?utf-8?B?NWtaL3JQdkJ3cVNUVjlES3diOW1HSlRCdXNqby91eStUWHFNM2xJRCs2eHF3?=
 =?utf-8?B?R1FoWVNLQnRub0tlZG1leDlSRzZsd0ticEZNUGdMTS9lRlZ0dmU1aXJSZUk2?=
 =?utf-8?B?ZnRUelNzZkNSWm13bHJTTnNNbVg2NHJvK1BOWmRWeFF0TFZlcGRNZDBrdzVP?=
 =?utf-8?B?MzdZWlVNaWJVa3U0ZkpVaEhIN0RIK3RCY3Vwdnl0TkNtODJZdDEzbGhoTytN?=
 =?utf-8?B?NjE1TE1RWXZCYU5uaDA3UTRuVEwyWUY4VVdBSkJpME55aExEQkczMVRhOXJY?=
 =?utf-8?B?SEZYWUlpRTNvSW45N1NaazVQMXZzSGh0QzZ2TWJ1OTZPZzZheFp2Mlo3SVc5?=
 =?utf-8?B?dGozSzhFVXRQNHVVcDlmUTFUZXR2SkpjeHlwVXJZVlMzYmRyZ1BqQzN4Z0hO?=
 =?utf-8?B?M2lZTVNwWTZQWThRQmdzSVp6SllJRkRMY1NvYk1FRVR1dWNRWUVTckFua0ho?=
 =?utf-8?B?YjlRYktWdlBURUhuZnRoNnkvdVFLZ0oxeWZSQVRFNjNuS0hRcU1SZExsZDMw?=
 =?utf-8?B?OU9DbkJBSmRnUFZBSjYwbEVJaWJwV0lVcytHdTBNNGgrdGVFeFFLUzlhL3lp?=
 =?utf-8?Q?DZG+uIj27PeVqeLxSM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em5ZdXZ4YitGa2ZqQU0rRUJwdWpTUm92NGl3WVJDV2dQb21FUllQNkJwa3kw?=
 =?utf-8?B?WVh2RytaZmhQcldhcCt5czhESDJkNi9zbkF0TUx1aWhOQWZ6aDZ6RXN6OFBh?=
 =?utf-8?B?WkhNR24yVHV3RjcyTkZLemNmdU9Hb29XNGQzdDhUQ1VCQ0ZDTlVTOEZ2bXll?=
 =?utf-8?B?S3plOVZMcmJEcFo1K3VWdWhHdXppRms2cmZtN3NMeU5tVGNlVk9GUHByY3U3?=
 =?utf-8?B?Y01WZm5ic0pXRWFZenFub2tnV0tmbDZLTVI2bW9jc0h6NndYQWxNcGQ1SVNv?=
 =?utf-8?B?K3hwMjlJQ1RFYVZGMHl0VFI5Y3FiS0FaVVZmSjJEVWxBWFZ6MWVhTXB5NStM?=
 =?utf-8?B?aytKNi8zSFpPT2oyYWZFa3ZjbnROQlkxVGRneExhYmFYck5CT1hRZTIzMG5n?=
 =?utf-8?B?dk04L2NTa3hpYmVHY3NkMS9xcDJCbDFaQ3puNnpOUFNRYTFGTlZ0eGRtL2pG?=
 =?utf-8?B?emNIMC9CQ1J5YXFwVnozK29qZ0xheHFkTHRCWHhkODg1b0hIT3cydnhpRmd0?=
 =?utf-8?B?ZC9PS0hkeGlHQUxZd0kxS0RDOENnMGc2NzNIWE44elhBTjJnTWwwVDdWTm1Q?=
 =?utf-8?B?aGNlK0tGQ1VidGpjSW1GSTNkcXl5RldOUlVzZm5PWWc5L3VsaHBaNnVCTFg1?=
 =?utf-8?B?VFlZVTc1alB6OUF3SzYzU1kvRlZwbWVXTVQyZ1ZhN1RENUswOXBaU2tIeWdH?=
 =?utf-8?B?aXlYUUJiNFJlc0d6YTQwOXVSMjZYRFg5aGZycjgzL3FDTDNJVXc1U1NCMXJG?=
 =?utf-8?B?Tk5EbkVUWUlHNHFGMDJEcFJTakxFUkNmVUN2YXZObUpkVkQrelRncFdCVm5O?=
 =?utf-8?B?UEJJcm9NajdtcmdhNlFDbkFSdm9RcVRYVlpYOG5XSFN0QW45TXlLMmVYKzd1?=
 =?utf-8?B?M2JhZExzd3FCYUp3S1JXM3VpSzhxdDZJMUJwTzdrZGJMdzc0UkczeWx3czZP?=
 =?utf-8?B?NkFGWURPVXl4VHdXTHJ3LzJETkU5RWxVU3lmakpSWlNFb0RDU1h3MEdRMU9h?=
 =?utf-8?B?SzNQcDVkYVNGUEUya0xxaDNkdk4vRTBPTVdVUnJGcklTQ0VVYnNWQ05HSDhh?=
 =?utf-8?B?cTB0WmxSc255L1BKdHZ2VmN0MERWdTMzS0FHUTVITnV6WVRtdjFaUzJWdWEx?=
 =?utf-8?B?dlphQnZ6cWlWUTJ1N2VvQUlPVFMvRC9uZGNNRTFiZ2J6c2lyRWh0bkxyOUZS?=
 =?utf-8?B?OW1UOWZZTm0wdVJaMTN6bHZab0dFM05KR2RhQTRBcW1hS3pCYi9aZ0hENlJu?=
 =?utf-8?B?SnQvbHdFZjljbUpsb2tBbmxtT1NueDZEelZHSmpsbkl0MmtGRnp1allheDZ3?=
 =?utf-8?B?WkNPVG9ybldLQ3owdTFkc0RmRnoyV25WcGV3cUlsQUNvQ2paMHpQZ3o5WTRi?=
 =?utf-8?B?YnlZcVg3WFlET21UaU5BWWg3WUN6RzdNellsczNLN0tLdm02bnlPSHdPYmFa?=
 =?utf-8?B?K0I2Qit5NkNMTjYvUXhJNTNuTDhkNllvQUphWGV6WjJneG45N0VmRjNaK3E4?=
 =?utf-8?B?eU4zT2hWMkoyTnlzZ3hRaEllVVBoNEFKNEVJWGVsRnZnM2lWN09mOXZkYm9V?=
 =?utf-8?B?OEFKbWNEQ1gwbUFFMGZ3TlAyc0twYzBJZ1NlNUZXN0VrVUFCd01URzE3cER3?=
 =?utf-8?B?anR0SzBJN0JkclVJZVhiV2lrT0IvNFpCN3hqcGFVYmFrWU96WUxqSVNvWncv?=
 =?utf-8?B?MkpWZ1pxbi96L0c3NjFFZHI2QWtCcTNDTUw3bk1UZDhxSG9XWG1oMTdLZDJq?=
 =?utf-8?Q?pumz1aDtf6APwq733JyIumDXsJnZdtw28shX3gk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5285d9fe-bf9d-44e0-1359-08de273caa44
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:24:24.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232433_812465_93EA8B87 
X-CRM114-Status: UNSURE (   9.36  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCB0aGlzIGR0IGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28u
CgpUaGFua3MsCgpDaGVuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDNhODY2
MDg3ODgzOWZhYWRiNGYxYTZkZDcyYzMxNzljMWRmNTY3ODc6CgogwqAgTGludXggNi4xOC1yYzEg
KDIwMjUtMTAtMTIgMTM6NDI6MzYgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiDCoCBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdz
L3Jpc2N2LXNvcGhnby1kdC1mb3ItdjYuMTkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBhZjVlYjE3ZmY4OTNiZjZlNTI2ODBhMzEwNTllMTgxNjc0OWMyZDIwOgoKIMKgIHJpc2N2OiBk
dHM6IHNvcGhnbzogRW5hYmxlIFNQSSBOT1Igbm9kZSBmb3IgU0cyMDQyX0VWQl9WMiAoMjAyNS0x
MS0xOCAKMDk6MTc6NTUgKzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJJU0MtViBEZXZpY2V0cmVlcyBmb3IgdjYu
MTkKClNvcGhnbzoKCkZvciBDVjE4eHggc2VyaWFsczoKQWRkIHRvcCBzeXNjb24gZGV2aWNlIHJl
bGF0ZWQgRFRTIGNoYW5nZSwgdGhlIHRvcCBzeXN0ZW0KY29udHJvbGxlciBwcm92aWRlcyByZWdp
c3RlciBhY2Nlc3MgdG8gY29uZmlndXJlIHNvbWUKbWlzYyBtb2R1bGVzLCBzdWNoIGFzIHVzYjIg
cGh5IGFuZCBhIGRtYSBtdWx0aXBsZXhlci4KCkZvciBTRzIwNDI6ClRoZXJlIGFyZSB0d28gY2hh
bmdlcy4gVGhlIGZpcnN0IG9uZSBpcyB0byBhZGQgRFRTCmRlZmluaXRpb24gZm9yIFBDSWUgY29u
dHJvbGxlcnMgZm9yIFNvQyBTRzIwNDIgYW5kCmJvYXJkcyBzdWNoIGFzIFBpb25lZXJib3gvRVZC
X1YxL0VWQl9WMiB1c2VzIFNHMjA0Mi4KVGhlIHNlY29uZCBvbmUgaXMgdG8gYWRkIERUUyB0byBz
dXBwb3J0IFNQSS1OT1IgZmxhc2gKY29udHJvbGxlcnMgZm9yIHRoaXMgU29DIGFuZCB0aGUgc2Ft
ZSBmb3IgcmVsYXRlZCBib2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5f
d2FuZ0BvdXRsb29rLmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQ2hlbiBXYW5nICg0KToKIMKgIMKgIMKgIHJpc2N2
OiBzb3BoZ286IGR0czogYWRkIFBDSWUgY29udHJvbGxlcnMgZm9yIFNHMjA0MgogwqAgwqAgwqAg
cmlzY3Y6IHNvcGhnbzogZHRzOiBlbmFibGUgUENJZSBmb3IgUGlvbmVlckJveAogwqAgwqAgwqAg
cmlzY3Y6IHNvcGhnbzogZHRzOiBlbmFibGUgUENJZSBmb3IgU0cyMDQyX0VWQl9WMS5YCiDCoCDC
oCDCoCByaXNjdjogc29waGdvOiBkdHM6IGVuYWJsZSBQQ0llIGZvciBTRzIwNDJfRVZCX1YyLjAK
CkxvbmdiaW4gTGkgKDMpOgogwqAgwqAgwqAgZHQtYmluZGluZ3M6IHNvYzogc29waGdvOiBhZGQg
VE9QIHN5c2NvbiBmb3IgQ1YxOFhYL1NHMjAwWCBzZXJpZXMgU29DCiDCoCDCoCDCoCByaXNjdjog
ZHRzOiBzb3BoZ286IEFkZCBzeXNjb24gbm9kZSBmb3IgY3YxOHh4CiDCoCDCoCDCoCByaXNjdjog
ZHRzOiBzb3BoZ286IEFkZCBVU0Igc3VwcG9ydCBmb3IgY3YxOHh4CgpaaXhpYW4gWmVuZyAoNCk6
CiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3BoZ286IEFkZCBTUEkgTk9SIG5vZGUgZm9yIFNHMjA0
MgogwqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdvOiBFbmFibGUgU1BJIE5PUiBub2RlIGZvciBQ
aW9uZWVyQm94CiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3BoZ286IEVuYWJsZSBTUEkgTk9SIG5v
ZGUgZm9yIFNHMjA0Ml9FVkJfVjEKIMKgIMKgIMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogRW5hYmxl
IFNQSSBOT1Igbm9kZSBmb3IgU0cyMDQyX0VWQl9WMgoKIMKgLi4uL3NvYy9zb3BoZ28vc29waGdv
LGN2MTgwMGItdG9wLXN5c2Nvbi55YW1swqAgwqAgwqAgfMKgIDgwICsrKysrKysrKysrKysrKwog
wqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLW1pbGt2LWR1by5kdHPCoCDCoHzC
oCDCoDUgKwogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzacKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIDQyICsrKysrKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdv
L2N2MTgxMmgtaHVhc2hhbi1waS5kdHPCoCB8wqAgwqA1ICsKIMKgLi4uL2Jvb3QvZHRzL3NvcGhn
by9zZzIwMDItbGljaGVlcnYtbmFuby1iLmR0c8KgIMKgIMKgfMKgIMKgNSArCiDCoGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1ldmItdjEuZHRzwqAgwqAgwqAgwqB8wqAgMzYgKysr
KysrKwogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYyLmR0c8KgIMKg
IMKgIMKgfMKgIDI0ICsrKysrCiDCoC4uLi9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1p
bGt2LXBpb25lZXIuZHRzIHzCoCAzNiArKysrKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL3NnMjA0Mi5kdHNpwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDExMiAKKysrKysrKysrKysrKysr
KysrKysrCiDCoDkgZmlsZXMgY2hhbmdlZCwgMzQ1IGluc2VydGlvbnMoKykKIMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9z
b3BoZ28sY3YxODAwYi10b3Atc3lzY29uLnlhbWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
