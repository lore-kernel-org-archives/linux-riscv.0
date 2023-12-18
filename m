Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8DAC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpWaegEV2Zan0cXE1MFYiikNxg8jS7Q8wvnSCkoX1CM=; b=b8Qpvb2jC+g06q
	fpfuie+RCkDQXKrW1BTw0ivnqV0OOBPtu2HgGLk8zMJ9NMUAw0oVFTVdy0RrniiJx4m9lNY9Cadk2
	aZvJlcAA4YqgbzpZGL4TBo8B//9udb6np7J3Na05b9psEzSnyCVr2jm3cjad7G8mpTI5aSQLJz6QR
	HlmRcQ/G9e9zgY+gGAv9mFJ5eKZKOS+nixMpjfcku3twUR9v1I9dqz3xW3aEaThHsh331ZRFOlQ+W
	sDAEOy0Dow9R+SYI8+Q6OK5UO5rPA71Wyx5S/A++OoZU8Ct6mX634+/oJtvs5XhMSWj7ImcLcXDgw
	ZYfS8RoqcKsUDrBE6mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4u9-0091GG-1z;
	Mon, 18 Dec 2023 04:06:57 +0000
Received: from mail-bn7nam10olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2804::801] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4u7-0091FV-0y
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 04:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdiWDuuhkT0OwMdn/3pcr6gvLLqAK3Dsdj68UYGC1XCOUwO5BlROfDCfmBUQUT8b8S9RWIPeH1LGuTbBnP0Lmf/aP1mg+x4gvd5xYsAI57yskkZVFyk/2frjiE8vdf/fnkzxduvmXzcGowA6gWIwrzTuGzSJWd6Zh1Anp+nUljJG9Msqj29ole7SkUWnN3t4zgjaGlKSletNUPN59wvhKgMWoRIH6Up0yEBRru+haQAOMAljmEDijQeMWrbKivaiXp3GAyrhJ+d34+YYFsCemcv9cpEmi9byVz/uA3182+UeXVscRs06PzPnSbqz7d3jUP5uAU+BoM4ZKXNlo6uZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlKZ1ObwWbK2jcMFNVxzoz3p0EP8fERlePLmjIj1Wik=;
 b=LB76CQatTx+Q8R58/PwCfJyr1f6XIWR3/q86p4Yas0FaPa+/KV8EvYhUGZSzkUqgn/70NvDASogvCJXHX/yzUcIe8oC2KVG+n6E4k1hEvUDS+HesExQlE/h8O1pDVokTr3HmQU1DP7mQyjTKYaH5xFMbqe7Nw8OX112J2ahHygVb/S39O5vvwZsagh1ivxvTAxPIMbLIto2/bCn+P0K4QlV+bfcIY/4OqmdwZuJC7jvfahRh1ogMLi33EoYxQcIlXTfny9fBNwJKoalw4aS4AMfyY91u+BVY4vjTXOI375IJWkuFdW6+fvKmBB4edWv1voJC4iD+oDc2QaJiihOcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlKZ1ObwWbK2jcMFNVxzoz3p0EP8fERlePLmjIj1Wik=;
 b=dR3Ri75MLkWgPdSeEZeb1uLyv8LgMTVW2uW5/GDloQke9ouz8tjVRXPGe1WU3XGW87OJ4bG2/am51ROL6SBCStKxnGJErn99SUeRBK4CPeSQXhL003cUlAmonjjORL/1JIi1EW30pxu4aW83tfNJBvZPBwZmOQR/D3LrmW9D71z2C4xVZTTztaR2iRaL50xq3dkQnSqvX69eQhdYi+3zZeNiAdv/zt91bZNs387oylclIZINfQk4jKE0Ds5PDSfsk0NBK8RdXhEmGcVCWUOiFmFfBZznJ3Ait6nIx9rdn3SO0p75BQWYCkTvK/nN3wCLhcpGdzJtJF4FgI7rx7cuDA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6138.namprd20.prod.outlook.com (2603:10b6:510:2bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 04:06:43 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 04:06:42 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	qiujingbao.dlmu@gmail.com,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/4] clk: sophgo: Add CV1800 series clock controller driver
Date: Mon, 18 Dec 2023 12:06:28 +0800
Message-ID: <IA1PR20MB49535284E78A301FCFBB5882BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAL_Jsq+1y3mdfzLwr3sdeOGkRHaEPJo0Gr=g4Y6dAX=5AfTdfA@mail.gmail.com>
References: <CAL_Jsq+1y3mdfzLwr3sdeOGkRHaEPJo0Gr=g4Y6dAX=5AfTdfA@mail.gmail.com>
X-TMN: [5ciQcQKc3jxC3nmTSrQ8QnP5nWrdfzwwVK6f/PQ3ZUw=]
X-ClientProxiedBy: SG3P274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::34)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231218040629.574658-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 96131c45-4ca2-42fd-1944-08dbff7ebe40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l45pEuKkOL7M1WazgKRhhmHA5+0+9S+4BmIIiA8KLnD2zK1NJc6B8oLiRmRdBOwDYpWUVsqqFjFo4SnnFxmSd2l7gp6+Qy/l1gtFvN1UvExNEC6xcY2O3K6mPBTEm/adBBVCPSr1c4ww0iqgU13PagQQ4B9prEIvd/RGZ0jgqNjlfbk39zEaC+c/+uJsSqP/WEnV2YYah40kiiDMN947ZDuyK1IQ9Vd5fbsWUEYOpDN+cZoMWj02o9KvT1SLBsGUOvJsvH80Y0z6zNfhuzPY2HyqOhSy9QcCCynh3RexRmwL9oNhhTqmd8fWCJANUP8liXYVIHYH7vz2giTJ1accu0VgnpTJM3QmNcGZQ7BfW3enCAAwY8ZDM5zHks7Qn1EB8ZCz+K7zl7ww80C8z4mX0iNy7ig9tAKMMG+Gm7J54QCOsA9WTxZOLA/BH7LaSTVZGJSZRHBUEQ7xG+MoO7Fq+oaYqIyvNXWNPPjIAOYIZM0ADG++9sOEbzVxbZy+nwr+ihiEQr0P2bpyx67xyV9SFWqAWJ3KMq3a/IEn5uzmI2Q9b6J3Cx/JVWW+ZpZ8WM1pEF4DwAWkjw/rJ8vHndX6Z58k1bwR/U2e0flPCMK7IBoqNrUg6c62+MHSHUxkgHwqv2aWXiPzlDjRWABvwa5CIicNzM0Dz5pFLMAamURiodI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFPdGdERzBtTXMvb25VTS9KemtJVHpNeHNWZjF2QXZWM1Z0YXNDcGdSZWdu?=
 =?utf-8?B?RU9Va1FYRDFLZ3RhbzFuM1pIS0UvU0VyRFhiMTZQYXJFU1BseUZSRXRFZFU4?=
 =?utf-8?B?MXpEdGk5Zy9KQzg2c3EwYlp3QXd2ZW0ybUdvYlorbHpId2JMUkVxazFwK3FQ?=
 =?utf-8?B?RWZhRkwxb1JHeUVZVlBmYXlDTkphd3dCQit5b1FQK05GdTFLMW55WEpzSlhz?=
 =?utf-8?B?eDhMcWNEUFk4a2QrNFN4QzQ5MTRCdkVpMHBJZHNrODVkT0p2S0JHZG5ERDMz?=
 =?utf-8?B?VkxsdGh2VU5aUFFKREFSU3J3T1h3VzNnRzMyTHJabzVta01mdnNOUm1lRUZ3?=
 =?utf-8?B?UHA3YUR1T3FUS3RpVGxDVDlDeDFSYlEvdFZ3M3FqOFVKZzFGamRzUWtXcDAx?=
 =?utf-8?B?eEpFRDBmSVI1NDJzbVJ6Tk5zalZ0L3pYQ01YbkJhNi96dElPVmx3NnZSV3A0?=
 =?utf-8?B?aW9iNk5TTmFqalAvQUcvbjJ6UnQxZ09Ea20xNFBEN09wVXVkUWp5aUtCRGVW?=
 =?utf-8?B?NlZtRll3Uk9MeDVvT21QZFdYdXEzdmd2NG5QWGNEVTNUTlFLREJBZGVlaURq?=
 =?utf-8?B?RkVTL0xpM2J0VkV1SDNra3E3cWlOTURxc3ZCY1c0YXNQdnV5SUU4bEgvNy91?=
 =?utf-8?B?bUhtM3l6U2JqYmZtNmw0M1ZVa1lOSGd1SnVSdE0zRStRT2luaGFxL2xFbGZj?=
 =?utf-8?B?ZVBZN0diZDROR05VOVFqTDVyM0VpbGJWVFVJL21XYklkNmkvNXA3MUN3V2hH?=
 =?utf-8?B?dE02aVhNa0FucjdCUjFuY3dqYVRtTFdBQkxCYUVZVmhaUmJFdytjYlBhcFVo?=
 =?utf-8?B?czcwRXJEY1NsSWxkOXRRc1lCbXM1OUVUWC9oZnlJVWxCOWdqQ1p0NU8xTTVT?=
 =?utf-8?B?ZEUzT1RIMTdreWJWaFJ0QjFkZVpEWFZiTzl0RjJrRU1pL200RkRaMHhDbG1w?=
 =?utf-8?B?K3hRMjZsSytMSDJ1Ym1DWXhOLzdYUENvU29YS3dCNHhSOS8vNHNNdU1FSUNi?=
 =?utf-8?B?TzVkY0ZIOE9HYzVQUThPazZSbnpFY2hqQWZacm9LWEh3RFBaWWRLajd4ZU5i?=
 =?utf-8?B?MFJIY2tRSmtCUHVUYVRmL2NPbG5yZUNsVjNjL3d0QUdXRlc1V2VHdWpoOUNz?=
 =?utf-8?B?NitLVGJlS2s2ZFdzemRWaXlkTWsxajZjaW9sQ0hINXFyTEh6cWdsc2VzRDk0?=
 =?utf-8?B?eDNUY05CRVpHUnZnWWhRQTNoRlM1WWRBSVpnYzJSWDVydlQyVUNBRWxPakJv?=
 =?utf-8?B?ajNFNnRPUWRnc2JzdmhLOWRzZ0d5M0xhemppVzdTeTlpRnFHdlpoM0NDb0tU?=
 =?utf-8?B?cTA2aXJQYTNqbWViYjJwNkpvbHBTRWpuTExzK2hyZWNDZTlRbFMybUZuKzMx?=
 =?utf-8?B?NGlQSllnRE4rRjNESzQvL3hhUFhUZ3lId09Oc01qQnJnZXlYbHN1UTk1cnF6?=
 =?utf-8?B?V01EV0FHYkcycTZrYjNmRVdnaGxPMVVMemF6c3RnaEJoSlExMkVNWWRTV3lq?=
 =?utf-8?B?cVdZN3h1TlFKbGhGQmNmYXlmMWxySEpaYlFHbXl6UWc5SHRDbEp6eUI5bUMr?=
 =?utf-8?B?WlJMOWtWT2I5MEFpTWNqUUdQWHVBNDFsZVV6eFZrY2ZzV0ZtTDNQOWlxQ3F6?=
 =?utf-8?Q?rzWeBTTk6xiKMwKTAOvQlEMhCLOQVO5EN+XKTK+8Ihuk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96131c45-4ca2-42fd-1944-08dbff7ebe40
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 04:06:42.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_200655_338612_007350CC 
X-CRM114-Status: GOOD (  14.28  )
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

Pk9uIFRodSwgRGVjIDcsIDIwMjMgYXQgMjozN+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBkcml2ZXIgZm9yIENWMTgwMCBzZXJpZXMg
Y2xvY2sgY29udHJvbGxlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5v
Y2hpYW1hQG91dGxvb2suY29tPgo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbWlsa3YtZHVv
L2R1by1maWxlcy9ibG9iL21haW4vaGFyZHdhcmUvQ1YxODAwQi9DVjE4MFgtQ2xvY2stdjEueGxz
eAo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbWlsa3YtZHVvL2R1by1maWxlcy9ibG9iL21h
aW4vaGFyZHdhcmUvQ1YxODAwQi9DVjE4MDBCLUNWMTgwMUItUHJlbGltaW5hcnktRGF0YXNoZWV0
LWZ1bGwtZW4ucGRmCj4+IC0tLQo+PiAgZHJpdmVycy9jbGsvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgfCAgICAxICsKPj4gIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
IHwgICAgMSArCj4+ICBkcml2ZXJzL2Nsay9zb3BoZ28vS2NvbmZpZyAgICAgICAgICAgICB8ICAg
MTIgKwo+PiAgZHJpdmVycy9jbGsvc29waGdvL01ha2VmaWxlICAgICAgICAgICAgfCAgICA3ICsK
Pj4gIGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmMgICAgICAgIHwgMTU3NCArKysrKysr
KysrKysrKysrKysrKysrKysKPj4gIGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmggICAg
ICAgIHwgIDEyMyArKwo+PiAgZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4eHgtY29tbW9uLmMg
fCAgIDc2ICsrCj4+ICBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4eC1jb21tb24uaCB8ICAg
ODUgKysKPj4gIGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmMgICAgIHwgIDg5NCAr
KysrKysrKysrKysrKwo+PiAgZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4eHgtaXAuaCAgICAg
fCAgMjY2ICsrKysKPj4gIGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LXBsbC5jICAgIHwg
IDQ2NSArKysrKysrCj4+ICBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4eC1wbGwuaCAgICB8
ICAgNzkgKysKPj4gIDEyIGZpbGVzIGNoYW5nZWQsIDM1ODMgaW5zZXJ0aW9ucygrKQo+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9LY29uZmlnCj4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL01ha2VmaWxlCj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4MDAuYwo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmgKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4eC1jb21tb24uYwo+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWNvbW1vbi5oCj4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4eHgtaXAuYwo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LWlwLmgKPj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTh4eC1wbGwuYwo+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxOHh4LXBsbC5oCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9jbGsvS2NvbmZpZwo+PiBp
bmRleCBjMzBkMGQzOTZmN2EuLjUxNDM0MzkzNGZkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9j
bGsvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4+IEBAIC00OTksNiArNDk5
LDcgQEAgc291cmNlICJkcml2ZXJzL2Nsay9yb2NrY2hpcC9LY29uZmlnIgo+PiAgc291cmNlICJk
cml2ZXJzL2Nsay9zYW1zdW5nL0tjb25maWciCj4+ICBzb3VyY2UgImRyaXZlcnMvY2xrL3NpZml2
ZS9LY29uZmlnIgo+PiAgc291cmNlICJkcml2ZXJzL2Nsay9zb2NmcGdhL0tjb25maWciCj4+ICtz
b3VyY2UgImRyaXZlcnMvY2xrL3NvcGhnby9LY29uZmlnIgo+PiAgc291cmNlICJkcml2ZXJzL2Ns
ay9zcHJkL0tjb25maWciCj4+ICBzb3VyY2UgImRyaXZlcnMvY2xrL3N0YXJmaXZlL0tjb25maWci
Cj4+ICBzb3VyY2UgImRyaXZlcnMvY2xrL3N1bnhpL0tjb25maWciCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9NYWtlZmlsZSBiL2RyaXZlcnMvY2xrL01ha2VmaWxlCj4+IGluZGV4IGVkNzFm
MmUwZWUzNi4uZWVhZTdhZTkzZjg5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9NYWtlZmls
ZQo+PiArKysgYi9kcml2ZXJzL2Nsay9NYWtlZmlsZQo+PiBAQCAtMTE5LDYgKzExOSw3IEBAIG9i
ai0kKENPTkZJR19BUkNIX1JPQ0tDSElQKSAgICAgICAgICs9IHJvY2tjaGlwLwo+PiAgb2JqLSQo
Q09ORklHX0NPTU1PTl9DTEtfU0FNU1VORykgICAgICAgKz0gc2Ftc3VuZy8KPj4gIG9iai0kKENP
TkZJR19DTEtfU0lGSVZFKSAgICAgICAgICAgICAgICs9IHNpZml2ZS8KPj4gIG9iai15ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICs9IHNvY2ZwZ2EvCj4+ICtvYmoteSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBzb3BoZ28vCj4+ICBvYmotJChDT05GSUdfUExB
VF9TUEVBUikgICAgICAgICAgICAgICArPSBzcGVhci8KPj4gIG9iai15ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs9IHNwcmQvCj4+ICBvYmotJChDT05GSUdfQVJDSF9TVEkpICAg
ICAgICAgICAgICAgICArPSBzdC8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NvcGhnby9L
Y29uZmlnIGIvZHJpdmVycy9jbGsvc29waGdvL0tjb25maWcKPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kNjcwMDlmYTc0OWYKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi9kcml2ZXJzL2Nsay9zb3BoZ28vS2NvbmZpZwo+PiBAQCAtMCwwICsxLDEyIEBACj4+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsjIGNvbW1vbiBjbG9jayBz
dXBwb3J0IGZvciBTT1BIR08gU29DIGZhbWlseS4KPj4gKwo+PiArY29uZmlnIENMS19TT1BIR09f
Q1YxODAwCj4+ICsgICAgICAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIHRoZSBTb3BoZ28gQ1YxODAw
IHNlcmllcyBTb0NzIGNsb2NrIGNvbnRyb2xsZXIiCj4+ICsgICAgICAgZGVmYXVsdCBtCj4+ICsg
ICAgICAgZGVwZW5kcyBvbiBBUkNIX1NPUEhHTyB8fCBDT01QSUxFX1RFU1QKPj4gKyAgICAgICBo
ZWxwCj4+ICsgICAgICAgICBUaGlzIGRyaXZlciBzdXBwb3J0cyBjbG9jayBjb250cm9sbGVyIG9m
IFNvcGhnbyBDVjE4WFggc2VyaWVzIFNvQy4KPj4gKyAgICAgICAgIFRoZSBkcml2ZXIgcmVxdWly
ZSBhIDI1TUh6IE9zY2lsbGF0b3IgdG8gZnVuY3Rpb24gZ2VuZXJhdGUgY2xvY2suCj4+ICsgICAg
ICAgICBJdCBpbmNsdWRlcyBQTExzLCBjb21tb24gY2xvY2sgZnVuY3Rpb24gYW5kIHNvbWUgdmVu
ZG9yIGNsb2NrIGZvcgo+PiArICAgICAgICAgSVBzIG9mIENWMThYWCBzZXJpZXMgU29DCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9zb3Bo
Z28vTWFrZWZpbGUKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5hNTAzMjA3NjQyMDAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2Nsay9zb3Bo
Z28vTWFrZWZpbGUKPj4gQEAgLTAsMCArMSw3IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCj4+ICtvYmotJChDT05GSUdfQ0xLX1NPUEhHT19DVjE4MDApICAgICAgICAr
PSBjbGstc29waGdvLWN2MTgwMC5vCj4+ICsKPj4gK2Nsay1zb3BoZ28tY3YxODAwLXkgICAgICAg
ICAgICArPSBjbGstY3YxODAwLm8KPj4gK2Nsay1zb3BoZ28tY3YxODAwLXkgICAgICAgICAgICAr
PSBjbGstY3YxOHh4LWNvbW1vbi5vCj4+ICtjbGstc29waGdvLWN2MTgwMC15ICAgICAgICAgICAg
Kz0gY2xrLWN2MTh4eC1pcC5vCj4+ICtjbGstc29waGdvLWN2MTgwMC15ICAgICAgICAgICAgKz0g
Y2xrLWN2MTh4eC1wbGwubwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc29waGdvL2Nsay1j
djE4MDAuYyBiL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmMKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi44MTc2ZWU2NzIxOTAKPj4gLS0tIC9kZXYv
bnVsbAo+PiArKysgYi9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTgwMC5jCj4+IEBAIC0wLDAg
KzEsMTU3NCBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gKy8q
Cj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxv
b2suY29tPgo+PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9jbGtkZXYuaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPgo+PiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4KPj4gKyNpbmNsdWRlIDxsaW51
eC9vZl9kZXZpY2UuaD4KPgo+WW91IHByb2JhYmx5IGRvbid0IG5lZWQgdGhlc2UgMiBoZWFkZXJz
IGFuZCB0aGUgaW1wbGljaXQgaW5jbHVkZXMgaXQKPm1ha2VzIGFyZSBkcm9wcGVkIG5vdyBpbiBs
aW51eC1uZXh0LiBQbGVhc2UgY2hlY2sgd2hhdCB5b3UgYWN0dWFsbHkKPm5lZWQgYW5kIG1ha2Ug
dGhlbSBleHBsaWNpdC4KPgo+Um9iCj4KClRoYW5rcy4gSSBoYXZlIGZpeGVkIGluIHRoZSBuZXcg
dmVyc2lvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
