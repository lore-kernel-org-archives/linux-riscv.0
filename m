Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC30FCF9C6F
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Sep 2024 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJXbNNHQex3wqr7zLroODO7aRRR0zSVjtRnVse0VOeY=; b=zLXqgFFlyJopum
	QRlHzOUPD8RwCLAHdNZnv/KwwBrG/yacR9ivsoZqAOOO0cLZuVMnYT6OPNUCbY/RFP8rNEr/yHifc
	y4uk9+71bdI7Z6Uz3YCxFdA6Bahs5h/nBYy6xODfcuSO6JER69NoyNpFR04RUHT1S4CkYm4U2P0tx
	3iMieqLQEpl06nLj333F289iUG4kB6M8j8putY44MqNcBG2SSeKn349QQ6ylC1mHNlOvSoB3+ZktY
	ID3AQgsYb7ySy5EImVhDkMXhjQCskOf6q+8upazIhR7ts7txFVbnzNqQtcFrWXChbEik/GB+9qRS9
	Mk4RVgVoyCHl8jE7peYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssNwr-0000000FI6f-2NSN;
	Sun, 22 Sep 2024 14:52:29 +0000
Received: from mail-sh0chn02on2072d.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72d] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssNwo-0000000FI5N-2Rbw
	for linux-riscv@lists.infradead.org;
	Sun, 22 Sep 2024 14:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQBMmz//yHKlxlQVuDg0IVB5pod/w86lhiRpy72T587UkILabLWk55h+eiZIPKftm4pAi6l5dSX2S1IondGr3CNvF45UKjGaU8gm0aSmwaoChyGY9e5OU8cFT48UmUzHVSy9hlr/Cn3YMm6k5x8nkeU7M98rspiqo53csODmWcN/3b+05kGmLVFpgfIicQonSe8+iayPLGAkOchVufDHzrs5rPzR4WTdxOqT3aSpaNwvYCduJUKAgG+sHuULV7ZeRffik8t4OKvF7tePcjcgi/eIcSoKyvV0BU3EDS7O/+9gsOsVmEfs0miVOHu/2wIoTEUY3nLtzCqielpl59NH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ACs4imNmP+48Q+YvftxnYh+ZhqiqBENJ65iamqQZVo=;
 b=mmBrMYVYhdGihA4iWT4AyQvOdB1ygfF0EaMrmStJeGCIH9U1FpjmBv/JKY0Ww0uXruj74rWlgInT4gi7xamcs8eCEJU7aTYigwkqmz1jbI9FnA5vLS14NMlKIW3Rap+ESPVP6JbbMct0vua24qZM4ldjmdn/ou8jUGpxK2pmPkKc6LP74rG0tl6sYupqPXkHXILrL9L3PXlxT71KNGNt7QvUzJg9fh0qfdqNY3pf7tiC9huiPaMRDyTA3x69w+CufhrB5ckDEMayM9UEOIaGStGQdBsTMTQ9N9Zl/J54jsidE1hKEt9NPLomarfLIXJ/pQhshvxuuK4aJwbY+abH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1145.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30; Sun, 22 Sep
 2024 14:52:00 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.7962.029; Sun, 22 Sep 2024
 14:52:00 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add cast vendor prefix
Date: Sun, 22 Sep 2024 22:51:47 +0800
Message-ID: <20240922145151.130999-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240922145151.130999-1-hal.feng@starfivetech.com>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::36) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1145:EE_
X-MS-Office365-Filtering-Correlation-Id: 7442d9bb-711f-439c-8363-08dcdb161d0d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|41320700013|7416014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: XtVbNfD8s3hyLk7Cnze0YekiR1Yf9Yj7MWyLjiXRQVa8j8ndZj7maPFgsvhSXsq+RlmAidAM2XtfHqvpDt8vUEPnuWKKhW75q1V/Lat0xjHuCTtqCgbyNzjfNX0Zcw2krMwwOXOiRiZDndf+U9kDEXuAIjoIZjKslu90NbfbWBk7kngKR8FMNiwGTKdHwKLsMgOlD5Khg7lEqT8MTMHVt6d/htohM8hJBXAiWat6Oq80PGX/OX4A6zmi3sTP6Q+vTxIZjMwrJMMW9brwZIWpghO/++27Ci6zDz1kTnTzo2b1QZ59z2aPqw439UoOWh3XKj1YaD3Jr6DsFpEctaD6yjIo2e58IObjD10Nz4OYTJ8Z/CRy2FVi5j64941gKRFvjtR0pX+iWUIgU2eSMTWbBF/TuueXapnhMVqSiCwAzPKy8+P9zbnmxdtFkOu0ohO/z3cvjXYFzbQWC8HPbfTFZWKLTJLhVX5km4yeRTDZ5ggDyeU8Up21iiVjeA0X93x9xZM7sh5rtwXwhgzhiT0JTBF79g/HMi+WdzKGFhRDbuSB8cQszodR47ZXzpMIUVS+1grzj5aNDvEnG31GC6NBwLxOmWUrdyq7bOy8MWuuJPXf2KrateAotxbhK3uS0kanF5u74Sd45vRGyE1Ob49s4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(7416014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nPNao4tjlbTqZ+ystFvQ0KLJcfZb8IQOqp3/I+i7HpHOo1ZZjk28NacWpK6w?=
 =?us-ascii?Q?cr7sTQUFDi4IIRLCqlWDFIoYOt0OZV3j0EtHop91SJs5VfpxgAZjutdemcn2?=
 =?us-ascii?Q?1+bIn75aZTDa+mGZpHkHIuItAXuETCoLReZkCrHyLCA7A9KrfyDe6Tgb3JEb?=
 =?us-ascii?Q?9PpNXotRI0obE70RhQ1nrwV3sAAhGsyawJa+yAneijf7ZhueU+3GVmUS3EWQ?=
 =?us-ascii?Q?umeouktAqFobFJ9t5n4xoA5Rz8ww6AZ1G9y2bqpKAXTMEKsyHk3dXtWfhRyj?=
 =?us-ascii?Q?QRsvd/XiaLafBF9+KHEvfzOeBl1retf6J7kqkzp/c6ky+BxNLOrF4WP/390N?=
 =?us-ascii?Q?1QRpP2PTR/bFt/a63yEM7GiJH7fDWlB2VZNPtP+sT11kjgyEqJxr+BrbWztW?=
 =?us-ascii?Q?ZQMbZInG4dhrc6GzpIuob75ZIKdrB4zSZuxUhlNr6BWbv5N5RpFVuPGqWMWi?=
 =?us-ascii?Q?h6XaSFgTe1PIBYUDLmkKup8Y+F2cUmmAX0mRTi5fDP4G9sGxm4pdqrRchVVK?=
 =?us-ascii?Q?WM//t1RCSdMZ+tnZ3qFELR7jGbGazFMiQoCR0NyoPS5z64/fc4gWmeHsXns2?=
 =?us-ascii?Q?LT4tsOyaYVp6d/g+5vUboaCWYZ+XX/6aPvHGH02NvInR7tOI6TRPMXAsfsTw?=
 =?us-ascii?Q?lj7wAlDiBzF15lVW6rCdc2GcoZtlIZfkoRzupCAc357/wfBAoE64TlqK6mxs?=
 =?us-ascii?Q?rkDmHCSBFkuCKS84SJfD740n/UYth/WCL7cXNeokAG+LQdo7yLGgubWmTweL?=
 =?us-ascii?Q?k5WjNqkOKSY1o8Cz8HILhGfJphlHNr2RAxD5FG22NQWky5oi7razw6Dsj78N?=
 =?us-ascii?Q?agw/s75lh5nJI6HkRuC8U9e0edeA+QKiQQhOF4MJ2LFlTY57wV6KXqd9n+ry?=
 =?us-ascii?Q?VU3tSAZVIFvFW7Hw3WOzsPRB+7GoGkzBzkTMKUwtvMPOsVkguIxVOcfz87fa?=
 =?us-ascii?Q?jvqBM/UXWrkBaVHR4fTZ9VYXpeMithU/807p/kS36RRMB06/zN7i0nro2SNM?=
 =?us-ascii?Q?5uW3wa3XEs4yAD+ch21ExT/ybtu7J58qFFLnOts6jYXvosEAWUd5Zl1TJisR?=
 =?us-ascii?Q?SHd0Dng1Kx0rPJa/+OWdOO/pdEUxm/nKp4bWe1b/nV6bxPTpvyoedDckRlN+?=
 =?us-ascii?Q?+ikbWhYT1fD/dV55PTg2YR74XfdZjh8K+jHmDeAWBEFPxlPXOTE3fVsRwZfW?=
 =?us-ascii?Q?/kh+yMAxr8i98m2syKXigbwF2git3IfUCWaFIyukJb03A5QLsfLx12saqqIS?=
 =?us-ascii?Q?sBSvaqWmMlBY/uIUPhVg+7gZxAK2zNrfOLU/DVWGmMCze8zhtIxTp4aXmSNz?=
 =?us-ascii?Q?lpihTGo31gw+8LiWCpSAZK1O3EQiO92HhQBsgOCglxmJOX2/WHidJ83yBFMF?=
 =?us-ascii?Q?iYb60ww5pZPelKe+yCqCnt5VmwjTuvVrrQi6dDYRqr2mmIJkIlCcOCEMrS3R?=
 =?us-ascii?Q?yJ6kPeenHggAs5oolwB7E36Stgz5CDT8fWZ0yJYXLmtdDIav5vxiNvEI5K9B?=
 =?us-ascii?Q?7bHuKHsa3bEy45z0u6S+vq3b5+1w34FSx/HuURpNCWIS6Jw93TSB4KCYCuj1?=
 =?us-ascii?Q?7QRdbOpuRC24E65H86fBkxV9utIuPsofF9SyB+J4EqGy6OFsbY6zOHRVTy6U?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442d9bb-711f-439c-8363-08dcdb161d0d
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 14:52:00.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OYA5/0ThzkZhJMZzOAgRKB3zhRYl7MABGdjBityihhnlPTLk5Fg2A2T8I+R6uLpXpMp9qAJcc5945Nxwr7FwcIx/Ry9U+wLjYb955lCprk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_075226_650958_D0B83B5E 
X-CRM114-Status: UNSURE (   7.10  )
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

From: William Qiu <william.qiu@starfivetech.com>

CAST (Computer-Aided Software Technologies, Inc.) is a company developing,
selling, and supporting digital Silicon IP Cores for ASICs or FPGAs.

https://www.cast-inc.com/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a70ce43b3dc0..9bfb0156bc8e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -256,6 +256,8 @@ patternProperties:
     description: Capella Microsystems, Inc
   "^cascoda,.*":
     description: Cascoda, Ltd.
+  "^cast,.*":
+    description: Computer-Aided Software Technologies, Inc.
   "^catalyst,.*":
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
