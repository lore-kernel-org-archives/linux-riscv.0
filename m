Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C098C982D3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hvk5Q3EUzbTWsH/crmbRm4VeEoG2/abqyCLqiSuJ5Dw=; b=16DkzMiuCWjIyi
	uNwR7ooX50h8hzTteYGMAw52P/20q8Z408GJhYPr5wyaFDCe5bz2Mah0bBBSzjTXv0VDZUqEY4IHA
	lp/vXwjKRc2ur3LP2SRkkxODkP57UxwzKVrFIODw4qgVhJeRgA5PTDWg2jKvC8yxo0q2un9U1Op/F
	ccvROwFElPN3Qaje5yjXU6GMkHmsxXct3Uw3qp9FELVeOBzfUsYBOGN9F2cNjV+vh2UHMcxPicP0f
	JLwVfWYlA7FxT1G6VZBvLiDvRDdHXUl1NA4NY4ByvoD+YmmR1+sUjkrZLBq5NIuKUZFht7BQEQWOp
	XbHQn3Z1kctalrgKTJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglyh-0000000EO0B-1qpz;
	Fri, 16 Jan 2026 15:43:11 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglye-0000000ENzm-250C
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 15:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuKXvYzjZu2JtH4nSNfmU9ZpxBOsLY05slrQlT4T/qSTsTbWXKoxqEmp8oXw5dBY/jB8xnceJtHI0MT6TOaH/Ug1/Q1BA8BLpIGBz/U+p0CDP+at8Gdoy/pCLKhLSmSXZ7gAQHb6kyeXJ9P31ERqC/0u65CU+XXSlkp7DO+n9+UBs4IX+hYZQAxo+96qmNKJTy0iUxqyU1FJjuRmRc7CQKMwwpAiVIViQAKm2vxJcKxmkrAAKAUj6YTQWyjGFODiMy0QbiN/rWVVV5PnKkqQOUF60dOkgtrZuTERmp7gO02me7gfwow4YzIxswZ270BhN2c0P3zWmugToIc6Z0A9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuLYBJ4NXhVskwDDL2M+S5I33n7q/vpYfTCFM5D05ZY=;
 b=ETE+x8DbhwTCUJpr2vG7Og1howzvmI4Lwgz2lK+lBxIoebPoIfu3lASVxlUseL+LUpHByqc6HWiT8Hl+WvO0gZCTckJi72Xrgc8gbrSnIPRHdL6n17CbDrYWUaLKUtOA7SOM11oJTeCoOV2s4uDYbV8RqRSuNPolp2SJ+9p/HFyQLtXCzU8G3tG9L+629IY/psMbOitBCGpwoSsJO8bm5CN4s36+bHJ8fsHB8mXrkR1x/imz91BW0y9TnRY4UABIGTgrIYvw1XwmmHv2KAkcTLGc3lyJTrxGunlvcCQpsumkB5XX8was2k3/cy6eAZwjMdP1+XJgjsSos3VPJrF4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuLYBJ4NXhVskwDDL2M+S5I33n7q/vpYfTCFM5D05ZY=;
 b=Nm1vkJAJdPHNv+WsqpYJeTuUQkvgQVepNP0/UPQhiRV1s3Nn5RrAsNmkW0Ehqj1kDx08MjsyQpRRBys7l5yLazQZiuSOs5ZPmjEv1tqlUD8ce+DbNgDSja77ViOQf2QWZbpqmEEXiT/aZVo4C/CA0I3coTf3ORSR0QOClWrlIHWJWxyNtyRUN8eyfUsy67nT++OFlkYbT8EGNgJNqiW66Z69Aq/bZ179qlVf6wWLWyaFSCWjyKYlHFYHHfIC78kL/O+BwjSCWJUNBWl/MelcHNF/TLR16o7YxLjA3S5AveOnfhZSbPD1KcWl60HqLdfimuBcn0NEOdQ9ieerqTPwxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 15:43:03 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:43:03 +0000
Date: Fri, 16 Jan 2026 10:42:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>,
	"Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: cv180x: Allow the DMA
 multiplexer to set channel number for DMA controller
Message-ID: <aWpcfqHDFaq8Lsv5@lizhi-Precision-Tower-5810>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <20251214224601.598358-4-inochiama@gmail.com>
Content-Disposition: inline
In-Reply-To: <20251214224601.598358-4-inochiama@gmail.com>
X-ClientProxiedBy: PH0PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:510:e::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd746f1-5184-434b-e530-08de5515efb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/eJnA+lYwqOZcDcg48+3DEK+a3pPJRAfi6hHyl1r/r9L5Df/9P1+jAYLpyR?=
 =?us-ascii?Q?flCe/GH45nJn7EsLAJ9r74jEhz3jKXj5FBbPrgS+p8y9e2wX/YWFxr453IbP?=
 =?us-ascii?Q?a1J4i9wE2ojJpCOXbrxbVG28vXJC2WfQREIGvjn643Sw65OIne6Jsf6nU7GI?=
 =?us-ascii?Q?Byb/tKGfetnpToP55g1LC5NtWsAiSvMqFXa4zZfMlMXNwsIkpYma78RRmaGB?=
 =?us-ascii?Q?QuYzQuLLz2mgn+G/L+d+egeYFTAaCSW/GWQrIYHEltUeaubrK6C9QmQZoDEV?=
 =?us-ascii?Q?EPFitDBBCvD1XsCnA9kjCZF+YId50xAHU7jETiIqHn6qdcAxuRK9rqYeWB9C?=
 =?us-ascii?Q?WEc9uqHhOetrulf874fwG1qK9t/eFpkFN59wMIZwv05TccUH1BbQkEL3Zpin?=
 =?us-ascii?Q?EnUDFeDFeHDZQux12StSLsVM+xYU+yFMl3wxfbwsTfQr2uFFkFBSR19N5spF?=
 =?us-ascii?Q?rkz6bAd7PMFQ6zSOKzilYxr5RGxUQ3YRZmhQzgrVMYiAzWzABkI8VFuqw5Ul?=
 =?us-ascii?Q?CEtotEhJglTF1NXSAj5icAy5TR5w3PNEViO3oE8W1b/V3f4u7SDSdSJ8UETJ?=
 =?us-ascii?Q?JWiMzAeVkM3hpyu9sHcYuQX//oaJCtKvMqNVDNki6yoT5khm53YUOHrGy42O?=
 =?us-ascii?Q?HdB5mYxVnn+JfyUKap8zlbpIYk0rQtbFDRcUztpjeJhX1AhvyBw0t9EHXW8M?=
 =?us-ascii?Q?84KzLWTi9rKdFXKTVC2U5mIyCt20c9dksRhrNDi4t0/Jc8tJJBdK33rurlsW?=
 =?us-ascii?Q?npXthZcjnf7WdqUYhfiOBFz9qlLbagM7j6vVjfD46go3LA8zg6CaZbSi30m4?=
 =?us-ascii?Q?HBwCZxiwwik38ADRoHjIz2F54rdqvlWwEPNmJUlG2zOkUXMjixulEHJcGflt?=
 =?us-ascii?Q?Jeb08y85ipjVQyaPzMZF5CX5O/n7GxpF1b3qGrJkaVIzEwIbI09rvJNoljGv?=
 =?us-ascii?Q?v+aXYzwJqfIluJcAhRdwVxkwjvsXIcw/krizIf0BY1PY3DV+MrYtdu3b0Qcg?=
 =?us-ascii?Q?gCOEo8t1/SwCpdabMeIt/XSroy0TG3Uwq01uH+9IWK7HItXIdrAgK7vgw8ld?=
 =?us-ascii?Q?SgRTn9H6SaYsbNb+TAFc1elEPHNr6DntoULJE/GZxrar7Wz2WjXHIW+CnCEF?=
 =?us-ascii?Q?hc1amXT0kAr8tprd7pXDvm3Zh8J9EoxfUsuvy6Akd5N48vBRdy76ImLwovir?=
 =?us-ascii?Q?l7JwIeY2KzaQuLL6xj7SnpbXsi771XTmF6ea8NDizQERj4HBqIe69A8xUgBX?=
 =?us-ascii?Q?Bbe2ST/G6/YSbDyMIss40MJy+pCoigxbZ2pwy2e9rfI9cv+j+zG+9ZlaCV6f?=
 =?us-ascii?Q?TXEySCW+Ipg52P0yNLdXtK52pEdI7ldBxJIfOVVclsB51//R8BrLWloughlX?=
 =?us-ascii?Q?Uw1c4JKTbZ5uATrLYeNh4LWM/EEmQpTzHYxXl86o0HIWLbSDKjW9rMh8Sf9s?=
 =?us-ascii?Q?Xr+HU7+06d2b2Q2uRUOhp2hIq2ol5W2F56HaMGcHXWJiEo/1Bu5mhwW9EXzb?=
 =?us-ascii?Q?u1FgOJhmiLnTnq6dDlR+OnshOXsBrUqmYm70mdEcj6lDVEtx0yPmnmOsc2vq?=
 =?us-ascii?Q?K9KXhgW4rKZ3csd0r2Y8DVKqYgTcYieIcOjrESdVNcP82vh7YEIL4FLWo1ve?=
 =?us-ascii?Q?HHlWs+DCva/JLFUAzjdb54c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J0EwBKHgkbf3wLUDSOENmWJKYHPoEM1KGtrw2+Ium6YiXebyyizkNdCzLHf3?=
 =?us-ascii?Q?m6g6UgVs29qW0epXnH6InwcwfSYmnpX+mVmd1yAA0wnc3Rrb55javQ7Qk3f5?=
 =?us-ascii?Q?8sBDuB43UcTAUQIVQGbKvwmAEY3pWjN0o+0hs1Nu78NcsNmTBhlqlRz+tW1z?=
 =?us-ascii?Q?w2TrTxZzTLNHl9RaIDwQz7/XhNcbMi5ehcKHHlfTgf7GCI3xsaT0+sXlsOEt?=
 =?us-ascii?Q?kHEfKufSqj2mToH8BbfVMnyMULNS7zodm84550sEWqclyIP7+j9gso2fSh4H?=
 =?us-ascii?Q?qm7sZzo6PVpTEpYiMGfGcP8KbjFwp7HrkSoWGXShLlE3fUdjkh1sQ9/Tmgl0?=
 =?us-ascii?Q?wqolpLL1XIjs8JBqDoJPkRS2X3A9Trlou/MvcbKw0xDOQjfqwHnbZAiMDmS2?=
 =?us-ascii?Q?vT7xGNLCJOiUwoKZxnq1DE3qpz/8yjmVBcnuq4ZwIQfAbiU9jJXWImhuzb91?=
 =?us-ascii?Q?fviDAoIkBlpUVmvqka/UOf2EdLfqNfz5aak13mVDWy+A7gENFrRc4pJT877+?=
 =?us-ascii?Q?GZ2AFXUcXjC03EtHzU/1jiXaeDtngOXUrjjAtMs6FUGygHDZTdlWA83VsjRc?=
 =?us-ascii?Q?wsjE/CkZ26yLE89zWIuV1j23vi2pOx+VsIirHeq4m3LuxQVJiq+R1rjPatYf?=
 =?us-ascii?Q?BNRQ9bitsFkd9L9cl0Xq9PCyoqX5ueT25CD3Rp5/B6leK099P1y8acgnfap0?=
 =?us-ascii?Q?/gfFsiVEY4p1/qNlIv5NB0XOfdXwzeJxK1y2msnYoTqhyLxEG1TBOzyxIBMv?=
 =?us-ascii?Q?u4bA8HC0+nnPBgUDSGzyNmQTQ78PyZ4Ug7yzMA3ENbVEPuztVcrgfJaLswS0?=
 =?us-ascii?Q?rj/1r6og1H6ZAzqOoG18gSRABEHp1lYqi1ogx5vGPRDy8ECfaLP1cn/l1VvA?=
 =?us-ascii?Q?qkCWGyCa6DyvQUNkdRfhdEqk8Ki+VswuwfgALibh4MO8wXZtBJdXlVRTf0ZE?=
 =?us-ascii?Q?UJ+gyuEyy/7KtBsoiAqMf1UWOq2NGmynl/ktyPMPFA+0u/SQ8ho29EAuGbSt?=
 =?us-ascii?Q?0hi7Tv3bwh1O0IVlf2eO4vZsdP0bStCBOBoXjpvzMzjXcUDfd/QTSj2Jiq2s?=
 =?us-ascii?Q?+PddN7tXHnzS4FPHSNspqgz0qmjMAIClyI9CsyDtJ95JgedSIN3S4f+ZVWzw?=
 =?us-ascii?Q?vF+XKoNR5M5vkBNBhCB6HJEM0pko9oNguFIJypscaCtsLemmNuwSzH9UE7WO?=
 =?us-ascii?Q?A+qZehfmBKqjFG+rvYN0dnH5Gvrx+z95VI4vn2xF6AGkj4DNR29nYd6MlzAp?=
 =?us-ascii?Q?mg7XRCDqybrsxq4fCR80l5yYMrEkZq4ZHd7OnjmvCmRS4rNhNbGaXfDMJVms?=
 =?us-ascii?Q?w6vpmQaBK6pEmxgYsrwnUQiDeiUVnupFcQ0i7hM5cnxQVcIdipH8IKxtb/2c?=
 =?us-ascii?Q?uuNzxH7KfBqj43HMdfPfze4J9B6sMDuohg/KBjkmDgbnJnl00KdzZQP4qtKR?=
 =?us-ascii?Q?abL4EP5LhtYtJlA7N29/NoIxaL2VWHUycziYqNvOQth86Q8WDKa9SkRMsg3S?=
 =?us-ascii?Q?rUZT7IALAJHuei6UCKLpxl1TRFqRsmHthVVBivO1XMj0nqKK+ooyL+c4CIsb?=
 =?us-ascii?Q?e4Pp6O3DPgaDfXYykGs3jY5emYAxe8C6eZ1WV3xyCj26Pipshmq1qDKR1h6j?=
 =?us-ascii?Q?+oB+3VZQId+/+xmQCucojeBNXcQfP4R1PinXkhtdvXq455+S5ZqQN85aAzLs?=
 =?us-ascii?Q?3b2g21yrKbnPrJ2q9PaO9yGUcaNc84Z2DKZbTukxnHID3upvZitT/cOaNGYR?=
 =?us-ascii?Q?ivoYl9An8g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd746f1-5184-434b-e530-08de5515efb6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:43:03.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmHnHOomJySm6hiE85tOJSpzUi/f4G+aMO6wLE85pkKLoNUgLms/RI5tCkmickg3cGIzQcDzRY7DppG+YhYFvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_074308_535914_2CC8AF86 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 15, 2025 at 06:46:00AM +0800, Inochi Amaoto wrote:
> Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
> which supports setting DMA channel number in DMA phandle args.


Does it need update DMA comsumer?

Frank
>
> Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
> Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
> Closes: https://github.com/sophgo/linux/issues/9
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 1b2b1969a648..e1b515b46466 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
>  		};
>
>  		dmac: dma-controller@4330000 {
> -			compatible = "snps,axi-dma-1.01a";
> +			compatible = "sophgo,cv1800b-axi-dma";
>  			reg = <0x04330000 0x1000>;
>  			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
> --
> 2.52.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
