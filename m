Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C854EE95A67
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anYSWVIOuTgwWQbL4ImIS/B9e9tWCQL5pcfGcvI9+Lw=; b=IkBky/QBN1p5mz
	agWxZi6mANGyatIY0S4x40F0XB6vm2XfimvMePLzKBpdjCy2WQqZToOmQ3LU6g1182kGwYf1a/9Ys
	LEOdai8afNlYsejQvH8m+lcm3lnrexYXo+ulNOgRYnpPNofAuVbwOC1rx6AUqf7incpBr6Fx55TR5
	rwPoXWYLGDzFbDunliIyWNcDuamW9mHteEbtrEtMKeNeoSEiVuAlj3MA/wJRESRnf4532VMtQ8Wyt
	TWLMKXdADsCggHRNHIUMoKLlnDwhiLGyKmMK8OfePOO3zuMPe75zMnbCr8PmnQOBkHeEELnBxfF+5
	BuuFrKvfzRs1Y69LVpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmN-008n3o-05;
	Sun, 08 Oct 2023 11:16:59 +0000
Received: from mail-dm6nam11olkn2082f.outbound.protection.outlook.com ([2a01:111:f400:7eaa::82f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmK-008n1s-08
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 11:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSxCePhxfriJq2jOesVHlcdnqWtAdkLXrJaFuT3L8CaLPeoarlQmlr8ZRN68tL+mS7hYwNaFqfnenucLEsuz7wzcC226SNw4PMxTyILP0MU+JyFQJ1MXd7mO1dRs3qrC0wLg8LqqvyFrSC8DST0RsxLsDz3iWhgK2S4nDGXPQCzixSptinkEa0ozb1nNSya49Jgfil6IHUi7aH15ipKpu9hXufa3xbq5LoU3y8iRIvFUMv1Y0Vk8rBwOD6W/62NfTQvJWZcRk5zbGcALA7vhud2w+X+y8pJ/Gb0fCq3/6nRtolxNNqZGchU4ytjmR1gSY9sJaf4gpm8gcMpOvL08yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qzlcoXRdY7yPY9WbVJ07hQJ2eb0IYdvzbZcXCJR8lc=;
 b=Oh5yZOt7HTFJgk+F6RT8+fD0FxfEPSDmxZO4m7pZ2zOhf2Ppx8+B3EtdxyrAvtNhhj3hYWuOXJ/oVPoFaj05gOJM68O8ZxkIxOLTbd0WWkEiqWTcp+tMTnkVpXmylaj9Nf1xKUsDXS6b1Hi/QOSk1Ayh5d1biuASMRu3E5413dkhh/t2hIrDuhO1CuX4cxxJF8Y92dqHhrItnuKjsXcK1bSFSh/hSIEiIbvk7goyMy0DHGMDLnun1bNzkuXG69D84/X6i17gKmdzfBDhKrBxkdIKwHn+L9KUbO0Hocx9fQGDluMH6XlxOU3pKXCx3qBjkll3AvN4OZ2X3wVmX18Ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qzlcoXRdY7yPY9WbVJ07hQJ2eb0IYdvzbZcXCJR8lc=;
 b=cehB3v+esmpSA7ZrWF5+15AUtoSuGyJZd+CkMNwHa+cBqJmMkcWJ653pBy34ndNUYOEGeb0kF1IQ1HfEaDXco9MAb0J9WBYu64uAljR6NHoZw2CLz6mwSZsUKGrslmRI4WOHRt9aWKz5/Uzr6KZN9IpSo94PVYNWAiLC2hibnXjuPUpG4idzZoTyu2uzcsAdNCrrWNQy6wcI0oYTjw7Gg0aHkLc++LIvZYN5wLE18MbjGwKEbzBoJkBZaCjJSyOV1yPWUZHQgfqSGMgh9wKKO+Alu9LqnydvQ00+kHwY3jcTXYet3d146YjdC4E0xGhokgFjhi3HVMg1Ear2h0T/ww==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6969.namprd20.prod.outlook.com (2603:10b6:510:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sun, 8 Oct
 2023 11:16:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 11:16:48 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
Date: Sun,  8 Oct 2023 19:16:21 +0800
Message-ID: <IA1PR20MB49537E0C8B54A237B3472C6CBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008111627.325468-1-inochiama@outlook.com>
References: <IA1PR20MB495337659E69ADA1A8B1596BBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231008111627.325468-1-inochiama@outlook.com>
X-TMN: [9f/YyODfe4ywrtBCRr/T2+AEoyiPE5bgs/j9K8cj01w=]
X-ClientProxiedBy: TY2PR02CA0062.apcprd02.prod.outlook.com
 (2603:1096:404:e2::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231008111627.325468-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c7d60f-37f0-4be3-f08b-08dbc7f01015
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSkViVkAjMn8ia3Z9QD6N3oKuQgfBWnkUE5AygxbI0Rv/TJ9asgZIA6SrPcyWgEgabBzXDEm2CSEXGzkiH2bZDuLnBc0mIoTGw37dHL3e+gVf0bT4PqY0Gfd8THmKSI3rNG66W0+66oPhBKtaQYS++raAHZI+02W+eJCkOBebCmtBREIvAmIOHF4fG1dkFwdRt7m73q/Qg/8pcV1bG9erzcV/JuquTp4iPqUB0Vc78BMISmbhydRkkUgIuJ2nexju3D+t6mU8+DCdU8ow+UaassfZjoCnd8o+zsqehGMD9a/uYaWuJD5PuaRzXhka5PuIv1rehh/eq/uYGzM6enbu7wRNrOjJeWiYWdSIkxPzMeaGrs4CylOFc7ONTrG+POEP3sOz6r1naAVHDNx62wXgGKoht1C2HXbjeaUPn+QXvOXstsJK69d5kUNEaTOYjnBNL1944sazbkIX+94xMNPzVL0rdSJDcGxO80GYINOllSOicFVif9Sz3Loo5xRS31LCY4BgyZmJKXLiSjbDNlguoNUdM+gEvUVgJEBMsomO50+f4gkscCVeAl3e9vtPhXSdfpI2+S8FUKm1cpjC9sj50ZgFDr212G+rYm5pYdgNg2yBcFSREULdti4rx/2WDF83X56ECZv8dt8Tk9d0KEiRKHtw4LSbWGSHvQ1FTGKXj0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wYmtAKgGuYPV61CgF49+UAi87T9J838/Nk6n6SSxeRLNgCoRDI2rCN0kddGj?=
 =?us-ascii?Q?zuMQJbOqReRbeBjk+IxrUUnRSk81qfjdj5cJaWP/kzbfKX9Urll+EXa63L0O?=
 =?us-ascii?Q?Brvvh8cFF4gMvEct7SEx1EPhVeld1e5aacfUHiDqDHuN3aV6EYn6QosgySxK?=
 =?us-ascii?Q?5cxevppk/EKf5b23gwvBWofKm7OhZ6BDAPc/5QIGNuYTDwK0mOfjEKQBW1E+?=
 =?us-ascii?Q?IPhr93LMjtugdI8hTAq+F+xF0DknhCNK1CCuja+bOPQoPqJ5kAbrwsCeipVG?=
 =?us-ascii?Q?MTf7lmEg1moT6KSG/r/IjVhE22vtuDTfayGymkKjTYKPUPAloZ3poynP+z6f?=
 =?us-ascii?Q?6dxr3gwrYsRJ9H9XlE6mSxaVe2fAE5MvK2BuvHvMNFZztDiY9YXTim3YrapQ?=
 =?us-ascii?Q?l5+dFNEDOpPZbh3ELJ7iNPtO+L040idRQn/XfKDy7qqc1jYCx+vTgfyImgwf?=
 =?us-ascii?Q?30OGgpEJZRyWNCoUvQEFHbvs7inYVWSlHmMco5frS0sR7MQ3eUOyPUpf9ZRr?=
 =?us-ascii?Q?TxkbtVqPlWHCIZ4LNKekTzj+N0X2qTtmsmncxoXFAy9PoO99qzw5gygkuvEC?=
 =?us-ascii?Q?PNwWKqIIE3PX/5BpWYO51Y7X8A7HeXUCUgAVvPvx/dNk6x1wfi1b+HGn9V1T?=
 =?us-ascii?Q?VW4wrBn92M7g0y/4XhzfzYTHLcKwOHbL2EOxlBk1AHEXgdemsOSL/Ory8yv6?=
 =?us-ascii?Q?SHn2aGzvMNZzXjWjCkZrim4sXpZRP6KgumVDp+u5Vj7I90bSKSSO1gSNID82?=
 =?us-ascii?Q?+Aqz0X6XefONsHYwtVwROegvBC7t5WFAPVdZEJdc+ICJPUAd8iEqBhkgf/je?=
 =?us-ascii?Q?AVlanfN4eIZ97rBg7S0SNDB2ZL4aX+KO3+kGn7vsMyi5UVTdcuIM+uMflkPU?=
 =?us-ascii?Q?fvvl/mh1bm5RhAEKt/TOTTW4+SzhI0+qxykgleM3qX4Q8rhvg7jXNH4mRYSd?=
 =?us-ascii?Q?0+JCj1BIbEZ7woB47m7Kqhe9fJZNB5y+pp2giuAsaU8pdUP1i8Iao3+qN/8x?=
 =?us-ascii?Q?42V1zHwHAWObQ1gZoxE865SnR2ImZTkeYOikvDKeH6pQ7VQ93uSfiJaB5CZQ?=
 =?us-ascii?Q?KOKNG5DtoumkpvTdVtrdyjOfKSH5RJ4r2PjXH/hxspMo704k7xHMbxHdrngF?=
 =?us-ascii?Q?ZhCVViJUyN6LDV7ukIC7ldcJBmqaSBnaLjA1zos5xqhdtbjdwbvG0afiOIsZ?=
 =?us-ascii?Q?3JISezil7qmuAR9PgNbuB0nYPdZBZnUTnf+Wlw+RdMdeyWi2nODorammbkw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c7d60f-37f0-4be3-f08b-08dbc7f01015
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:16:48.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_041656_079237_7B914AB2 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the compatible strings for the SOPHGO Huashan Pi board which
uses the SOPHGO CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 86748c5390be..9bc813dad098 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - milkv,duo
           - const: sophgo,cv1800b
+      - items:
+          - enum:
+              - sophgo,huashan-pi
+          - const: sophgo,cv1812h
       - items:
           - enum:
               - milkv,pioneer
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
