Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F62DC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tds4ZnlzDkxMAv3GrJ6+iHIsadyIFVD58X7ifSPtvk=; b=jFf5TgDxkh2sYsKl+ly+S/lMU8
	CTECyjtwJsoqb4blXKMFxOdNRydHwn2OOrudMlBLqF0I81TGl6XWzqoUgpAFTkj74C6SU0cRMsgNL
	bDykQQ0kdprOykIdpijBkuDNrZaIAMC32rMx4XHho+gSu21XUY2Go+I3g04OnrRZQ2vpsMTm51KKu
	6f7SMeS436ri1zeCDwLW8x6lrng1+cZdUUWJBeOXYXCU+kjG8QDImEX8q/fShR0E1fw0VC1UxORi6
	rOJ45xKUa6f7uDcSnQXLcj2iMw2hrY6uCpWzo5SV1ZPrmwzRrY4o4uTxaovZ9FPrqUzf6nGHTrBZk
	cjsoAgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD0n-002DUp-1q;
	Fri, 12 Jan 2024 08:35:33 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOD0l-002DTs-0D
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 08:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjP2Dl2eedcpRhimDuCoJ8gVMx77UYgH9L5jEX521fMeuvYXcZcSj+5qL4PUisIkMPiaf7B09L1Xa2C2BWX3uW6BUU+zOCkHa8j159qYblRK77wR+YjkTEwNVNWMRgHOK5Y6YSgh1W8/RTRqx/62CEsmH3S2sthhKLIi/DN7W2OmefxX1PsxMji2fgPS0xgIO2ZuhtA9KfKLHZedLABmRltSedFSnurJuRU8jYCf+meiCYqSmzCc6dQI39wHkBbqihffZSVJC37XGEUPfQGK0lLFAV1ILIbEOwCS/S6e2N+6CRH6+2RJW+TMMrJTIQanoE1cgxT6pKOB0BzoUiS2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUzhEnFR+92kajQgAPVLJZPtcIZOuIAYDs3ZJ8mkkm0=;
 b=NrH8W49WrMgtOPJPzfQOnZ3SvV8ZhFREaTyDd8EfZF2MMJDPjw7bdZM8nMaoGxEq6a5wzWeEJOjsOlMK5X7ZZFQs54JenQHdD9cx4pCLjRpdwuJqLHCezN9WPOC3D6NQr5p/h1XFYauGowiGk0rTTL3BvIVBbsZHgvCVz3E7sk6qBMHcOvxw334zUvH+VxrtaKBjOV6x4VvuZdZ0xup4AFZMtGF1jA4rt68TdoDvoGEHetU3MErdGZdoPEO9UMbuiE/+IncZcPXmUGeIlMV/zhWalHkXN+HKGWUJr/YX8V46E64HrOwlvrIH8b06h/B/1ZJEKg2xCG9bFaxV9vyuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUzhEnFR+92kajQgAPVLJZPtcIZOuIAYDs3ZJ8mkkm0=;
 b=sRmvq4Hu+hGvKIt5OJ/derbL6eToNh30+jABIqRlxBBR6Fa0fO/PwyG7zJ5yT+1sxscDnYeqk1M/7NZkqBZq+HArlrvhwfalprLJdciVH/FriRUEwG5u6Agzk5SRJqOluVFfAHXhpsSfXSY3fggpwPmi6n6hH6Agw/dhtTCmig8/GmpTDteggP2yy4zXcmk661z5O1mx1IxQ0ErVr3cg9N0wORiLlQzuXNAS1RqQiMav95/cD1DiAIO43yyDzZAOG9bkPOjbsYHymgiTzJa52lqFAALc2N8Sc5CNRfemeyDO8nEaH+7ttB+9dx0xStK4KGS8Oo8E+E8rXWxYAnRCjQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1505.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 08:35:11 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 08:35:11 +0000
Message-ID: <MA0P287MB2822A18C53C4EDDEB2DAF42CFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 12 Jan 2024 16:35:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
To: Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240111-jolly-prize-930931cc648a@spud>
 <MA0P287MB28229BCC9EA83507B99A9F3BFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240112-overhead-disallow-8c2a4b97c36c@wendy>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240112-overhead-disallow-8c2a4b97c36c@wendy>
X-TMN: [QYCvGXN62KQDz23u836fR2J+ZxV5k+9P]
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <1410d7e2-1e46-4a27-b574-881fec8fd214@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1505:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccf027b-97a2-4ff4-6d59-08dc13496415
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyYSoabDyfJZD2K+jkaKuMThzWcBn2OdCisAA7oJuIzS12WYMHEECheHYN3H/uUTliSMFxSav9mqevb8vC/81jTKQOLnuPAG45fHIcKMwxsTYvlB00nWQ2+y8rJI5cVerEAAu1QmQXra7ycXrRr2UoezEkvvc9MXT/AOpCkRhkxd86Ehndvk04vMq6CyOEvHQJsdF8apxszn+IN4DbdKSHzK0q5FXo3SR+nn3XHzWTH81SKsKRO27ZHyh8B4ZNzDapxE342QDG2WT/j7qHR7IfOn3Wm9tMdJlm2OpcYeJDyAyuugwVYPWS2pjWE7JKQCbidRNoXGVC/dzQC84wYTA119aF8sJ5OtUCXQnQGCovyJMOuKD+SdnzHGdO4UBGc9nEls5qdD7nnEjhIfKODYdEVOpkX/++QX2ud5GL+ecCVXwAkOLHqcN7tPL+ariImaPoA9Rj6Hy9n6ArckAMsxR2iKzCrI6kpphSRHAtgCx0N8peKWCe91MY5pP0Hi0ue6QwwVwG8979LZ3k4pA5vLhP09fl7CGtxfkHe/SqHzQ3M+JrAz0t24N2xTO0UAQ6oW
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJtYWFjMUtSQnZqWTJod0NPY2gvMnlLd2szMGRDWXJJTHhVWGRvM1FRV2RM?=
 =?utf-8?B?eGVOb3IwZGljaUx0UTB5ZFdkRWhRbHBjdEltS081cEdGMHdGM3JOU1hFV01U?=
 =?utf-8?B?SXVTWXhjWWZ1bnFzYVhuekFpTFdsZDk2cU5jY3JyV2FuT25ZRkZNWWQvNUNZ?=
 =?utf-8?B?bXZ2Wk5JVFBJK3BZa3hqMGUyakZWUE1QTXpWQkVhVTdsZGordHdzTUN0elRV?=
 =?utf-8?B?QklKaHQ0dlYwNWZTaE1qUnJ0QkpFQWFaUzROWE1EOFRBVG00ZHl0MHVsbmZO?=
 =?utf-8?B?Vm1KRkJmQkJ2WW5yc2NJTG5tcVpPc2hHblFWS0Q1MzhabWtTL1FiTUhPcktN?=
 =?utf-8?B?eVhlQ05vQmhVOEovKzRycGRZTjdXeUZDOEdSS01FbVJLN3RXRzJjTmh6RXFE?=
 =?utf-8?B?UEt3czN3R2tvYzF6TVlqZkFTd29UTUNIcWkwVkNVUjVmVUw0eEpDWFlXVEV0?=
 =?utf-8?B?NVJGckZkWXVqTGRTaFB1V1B3M0xwQlBnV3VHaTA4cE45aTBwK2VqNmNncHp0?=
 =?utf-8?B?YVl6bGdaMWFsbXRPSUZKc2RFRWkzbUYyN0g4RTBjU3k2QjVXY1ROMkVtYUhS?=
 =?utf-8?B?bnJ2OG1NTy9sdnFzdzNWcHo5dkdXNHFNSHdSM3oyV2JwQUc1TWd2TENuOEZN?=
 =?utf-8?B?SXBFeXhlcVJsREkycFRhU1FJbkFxYlI4SnNHUXkyRFVkQ2hQczBsYmNjN0tT?=
 =?utf-8?B?emdpS0lkTTJvLzQ4WGZTZ1dUejRCajJZTU5sV3hmWE1Fd1JHTTUrYVpUYzJl?=
 =?utf-8?B?bmZWQTg1L2dTUnVtbHdOOFpjYlUwUENxcUtpTUV3aENoZVB3cnhaRFBEYTNK?=
 =?utf-8?B?REdyTlVXQXAyV1MycVZiWmhxNm1IRkZJdEJPQkg1Q3dOZ0dNdkd6eHd3d29t?=
 =?utf-8?B?UGN5bEZBMWNkZTVScWtWNlBWRVdXdHJxU24vM0RSZ0FXWHYxSzRvTGFySUVF?=
 =?utf-8?B?S0ZTcXBsT0c0ZExkRzdGY1B6OWxBUVVTdDVOa3puN0VRRlVMWThSRnFwV212?=
 =?utf-8?B?M2ZFZTdIRlJ4dVZTYm42RVZVcHRvY21MSzVMVjJkU2tnY1VKTjMwTEhpeElP?=
 =?utf-8?B?VTFIWTB2QXlqVGZ5dENYNUdMeHE0SDlEV2Iva0FGZmd5Q2VTcnc2blRvOG1G?=
 =?utf-8?B?QkV1YllvWFJuNkZidVVLdTNtSlRNMnFqNW8yYkNuTkpaZ0wrcFNrbGNvQmZN?=
 =?utf-8?B?dC9NajFRWHJxUnRaVzR3U1dLU0xwKy9IWDE2bFgyNTIvcy9uYkJBSittRzNk?=
 =?utf-8?B?UjljMDNzNGZpTFNIOU0yeW1pTEw3a1pPREJXVlZIUlI5QU1QcUNCK21WVDFl?=
 =?utf-8?B?ZVE3WXhyV3NoTitiUGdUZ0ZnRnhsdXppVGYyNzZFMERQaG1lZ3hQN0ZldDlS?=
 =?utf-8?B?REpESi91ZkxtL1o1TXV5WTdtempmcXhaZWh6N0YyZ0hPRSsrV0paU0d2TWZl?=
 =?utf-8?B?czBjR3cyZ3pXZmNscWtSWDhEVDNXS1ZZNEhsazgwV3kxWGVuWU9RdFJsZHJW?=
 =?utf-8?B?THpRdEtnejRBc3hncU56cEtKMmVZTU9LY05JQjRRcmxqTm1TMGk4QXlwRm1p?=
 =?utf-8?B?eVYyQitFbWVXRk9BME02cTFlaEw4WSs0MjdkR2RDN3liekRqNEhzZFBoUWhv?=
 =?utf-8?Q?HWSy4TMAOcbqgOpFLXG4mLDm1nEhNucln0QETO8JhZiE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccf027b-97a2-4ff4-6d59-08dc13496415
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:35:11.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_003531_119513_186B6EE8 
X-CRM114-Status: GOOD (  10.33  )
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

Q29ub3IgYW5kIEtyenlzenRvZiwKCkp1c3QgYSBxdWljayBxdWVzdGlvbiwgZHVlIHRvIEkgYW0g
cGxhbm5pbmcgdG8gY2hhbmdlIHRoZSBiaW5kaW5nIGZpbGVzIAp5b3UgaGF2ZSByZXZpZXdlZCzC
oCBzaG91bGQgSSByZW1haW4geW91ciBzaWduYXR1cmUgb2Yg4oCcUmV2aWV3ZWQtYnkiIG9yIApy
ZW1vdmUgaXQgaW4gbmV4dCBwYXRjaHNldD8KCk9uIDIwMjQvMS8xMiAxNTo0MiwgQ29ub3IgRG9v
bGV5IHdyb3RlOgo+IE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0IDA4OjA4OjE1QU0gKzA4MDAsIENo
ZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNC8xLzEyIDA6NTgsIENvbm9yIERvb2xleSB3cm90ZToK
Pj4+IE9uIFRodSwgSmFuIDExLCAyMDI0IGF0IDA0OjAwOjA0UE0gKzA4MDAsIENoZW4gV2FuZyB3
cm90ZToKPj4+PiBUaGVyZSBhcmUgZm91ciB0eXBlcyBvZiBjbG9ja3MgZm9yIFNHMjA0MiBhbmQg
Zm9sbG93aW5nIGFyZSB3aGVyZSB0aGVpcgo+Pj4+IGNvbnRyb2wgcmVnaXN0ZXJzIGFyZSBkZWZp
bmVkIGluOgo+Pj4+Cj4+Pj4gUExM77yaYWxsIGluIFNZU19DVFJMCj4+Pj4gRElWOiBhbGwgaW4g
Q0xPQ0sKPj4+PiBHQVRFOiBzb21lIGFyZSBpbiBTWVNfQ1RSTCwgc29tZSBvdGhlcnMgYXJlIGlu
IENMT0NLCj4+PiBXaGVuIHlvdSBzYXkgInNvbWUiLCBkbyB5b3UgbWVhbnQgc29tZSBlbnRpcmUg
Y2xvY2tzIGFyZSBpbiBTWVNfQ1RSTCBhbmQKPj4+IHNvbWUgZW50aXJlIGNsb2NrcyBhcmUgaW4g
dGhlIENMT0NLUz8gT3IgZG8geW91IG1lYW50IHRoYXQgZm9yIGEgZ2l2ZW4KPj4+IGNsb2NrLCBz
b21lIHJlZ2lzdGVycyBhcmUgaW4gU1lTX0NUUkwgYW5kIHNvbWUgYXJlIGluIENMT0NLPyBJdCdz
IHRoZQo+Pj4gZmlyc3Qgb3B0aW9uLCByaWdodD8KPj4gSXQncyB0aGUgZmlyc3Qgb3B0aW9uLgo+
IFRoZW4gdGhlIGdhdGUgY2xvY2tzIHRoYXQgYXJlIGZ1bGx5IGNvbnRhaW5lZCB3aXRoaW4gU1lT
X0NUUkwgYXJlCj4gb3V0cHV0cyBvZiBTWVNfQ1RSTCBhbmQgZ2F0ZSBjbG9ja3MgZnVsbHkgY29u
dGFpbmVkIHdpdGhpbiBDTE9DSyBhcmUKPiBvdXRwdXRzIG9mIENMT0NLLiBZb3Ugc2hvdWxkIG5v
dCB1c2UgYSBwaGFuZGxlIHRvIFNZU19DVFJMIGZyb20gdGhlCj4gQ0xPQ0tTIG5vZGUgc28gdGhh
dCB5b3UgY2FuIHByZXRlbmQgdGhleSBhcmUgcGFydCBvZiBDTE9DS1MganVzdCBiZWNhdXNlCj4g
dGhhdCBtYWtlcyB3cml0aW5nIHlvdXIgZHJpdmVyIGVhc2llci4gVGhhdCBzYWlkLCBvYnZpb3Vz
bHkgeW91IGNhbgo+IHNoYXJlIHRoZSByb3V0aW5lcyBmb3IgdHVybmluZyB0aGUgZ2F0ZXMgb24g
YW5kIG9mZiBldGMuCj4KPiBDaGVlcnMsCj4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
