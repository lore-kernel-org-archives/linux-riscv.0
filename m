Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1761FE95A67
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC8Bic+L5nYcco//UjuL5ekmV/8hRiFbcPwf0Wjj/L4=; b=QDQoEBKIjelf2M
	tTzx4RQ8wyWRyshNq1PqpqJDp3ooLQIek69yQ8t4Uvdk0uunmcmGuboxZl+nukqVLhCm9XKolMPlL
	soIBAIsZpUiAwZHwEKc0LWIPoHXr7zJoMAbc7xdLJBBCdUOhAkp/fjO3/ZFgKRxC9Ag+yL5SOwxIC
	6LOLkpEiKfdRa/E3zmEoskkfnNw+Lb9M9dbCroqI31LKZ886ADRStpDhJj3Zmo71pSQbkY70PBXbr
	ug+QK735cIbJKhNZwEOPEXUT/uHBsgM4BO4t9jmf698g5Xa/bm+pP7TGhD1AEV9g83kunnQMb7IKC
	4ZV8G/rVS69mze6ni/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmD-008n0i-0c;
	Sun, 08 Oct 2023 11:16:49 +0000
Received: from mail-mw2nam12olkn2080f.outbound.protection.outlook.com ([2a01:111:f400:fe5a::80f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmA-008mz3-1P
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 11:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3iWNDdhZXzrTAf2P65J9P+bBFpAagsl4+Di3FVzL8AkQ8PJpNwqL+pPLQJmTXO0OxyqJZownNct4WgHU17lRej+w42eQhFVTdxJnYKYg8zpGfFUBn8bn0ey/Ecwo7iKJx79IQItkA7LroeCPYgjn2CbO8xixtuCiUWS1sGi+DWgfXO3/135trQ20OGIEBbCtAcOPtnnl30zZX+eoF3PYcDKi3mk5rNTxcIp5Xd/626MsrvV0YtqO+5OqvIWRTFOxtKqy4gBPNKsFZqqVKxuFJQdZhMbII5j2ADCFUCDRnd9Hqo58BOavEpU+Zmtz2evEN85FbHkvOYca4eaK6Wayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mjT0GHZRjHAdTvckJslAsHSeKgrdYR/YRReQ5ZgSmw=;
 b=RwuokgnT6wxTquzqtiNcF+mtdZB7aW8IMPk+/Cd+vk4LkuKfEQQjhve2Om5El7dVKWl2/lFVY0eI5GOezEg/tTE8JD9UATcccWCU5TpeDBtAM1fTmZfcxGjs3AoFTZmoX/y7yDwp5nSIFKtJPcWXRtMTlV3Wb0YKacleCbvdUIcSN9fsR54nFCmvxbT+QjXOdS6d54td6jD9sMoTzbP2p5NRdw14/uWkANulT9wHD1uu+O6+YXXBzIQpMge4ffccQjXmYY26OLvSCtjg5+N9T4NdEjc6eEtH4cIHMeDffL0HeVMOZZAzuhr16VIFvk8khL1coZkwbDEPsQLCoWLw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mjT0GHZRjHAdTvckJslAsHSeKgrdYR/YRReQ5ZgSmw=;
 b=FJ0/D6c0LdhYV20PVunx7Up04ZOgk6jbfeX5LJBSXbLTvjNzst52zMYKdaShNyJd86KPsm4/PcDRsNl+U6vyPZ+vS0lnjSDm+3KSAo9t65pDfEoQhhLMAW9k/uaindVEdaUYZs9QXcRRGDOOtrb9cM4Z+aKs5nr10MulczhXI3IO2IOnfcIaXFDgtlnvoX0IxRBxeh6lt3osfWbVOdY1fFJcP/Bc6Otq44FOxkQTgrOnYagHuTDfidhwoZFeSPph6Vyfvs0Dcm6WYySSWfa+58Y7zcXX6IqCmc3UJ+XppSFe9OovQiqv+osyR0CMauGAGOSz0eb+2IC+FsPmjTZnuA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6969.namprd20.prod.outlook.com (2603:10b6:510:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sun, 8 Oct
 2023 11:16:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 11:16:42 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: timer: Add SOPHGO CV1812H clint
Date: Sun,  8 Oct 2023 19:16:20 +0800
Message-ID: <IA1PR20MB4953858B0550E039C22093D6BBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008111627.325468-1-inochiama@outlook.com>
References: <IA1PR20MB495337659E69ADA1A8B1596BBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231008111627.325468-1-inochiama@outlook.com>
X-TMN: [LS0enXtfkEQu4PgE5qbYkyIHAYNxG3rEn+XZrGR9h5Q=]
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231008111627.325468-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3d07d3-086a-4b5f-b146-08dbc7f00bfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OE3JZSzgUVg43XzpLimBYzjl+rZBlLXXLzSOKzq5OGqNzC0uV9R7DT9xQL+YtTTvReuOIyWkfOHEJD4QYERZkGM3Ll8QqC7LdnpkzVxdPdsRLLt/68JUBRmFlD/59KwcP3fMZW2YdtZcUaMNExeB2zV8xEYtD+WCoMQEtgQqdqxodR8yDuRGS7gH4KuNhiM+Lq6BN8PQ472BSIDbJplswpCiep/SmDr9TWo6mqrQRqo0Yx3I+8uJwMLDSf22R1GidrVngN8vBhR9hbqU4jhrUYAw+c4oP4itnDEiLbC5RwKO2i0EnTDYdIToaccr40lJaz0NS0jpzKNr2hDqyIfvhGVoXswi1M08mRCL6dJ9BlwCpod1uM+tJrAxVYN5KPGE6Qu1BpxzgjQsnaJqQrCdvaUJ7sqo1vJCyfSd0GkEnn3sX5XB/SkRi/XIbHFkPNeoCfAVeDJhSYRTmevJs3cPVsXXoSxrQmhcJ9VePAvMsfmwYG67EVBMtjL/lhR7KAS0GvzeMrFWN0IkwTlodzu8JR651qA8JmnDUk6rGMiF7kKr1OKT5lG+etZP2YTiYkvLoTcXaVzNmnARe6nmQo4fYsYvC3weHI3iimWKsTfmkrr7pwBGhbaLgrpJn+LqKnOp
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7E613xFt1f1Smcd+8MRHeYL7Wn7MHEFq7J3F8lqDHG5OlRkq5JWG6j1bErGd?=
 =?us-ascii?Q?YPu6MHnwatx57A5OBDBvAz8yQRfPHSprpabm2P2betQquSAkL6Hg0+qOWlTb?=
 =?us-ascii?Q?rjL9RE2e8PM9ncnz49UPwhha7PHRqqfdPUJggt5RDbTMIIcSJKnhwCTWQGpg?=
 =?us-ascii?Q?gpAYGodTVTzZiWY+7WEvQPvju2PY+fFsa7B7usjaDb4se+uXmvH0UTiSKvwH?=
 =?us-ascii?Q?5qOuVlFNWtif4KZ1nmwwRukizx/l7fsh2x5e83NupShPLgu4Xndip01tfzmT?=
 =?us-ascii?Q?nTm1dG9ADFLJs8xbWD/M8uvjU7fUfOW9HPvhJPULz4FrmlzQdFKnh+3x0nI5?=
 =?us-ascii?Q?5sHQXYkKEbiOP5MPtcn9774wak9DObeMg3UjN8ac7LAek1LOZgpp2FMnNh7G?=
 =?us-ascii?Q?FI2S9hJtHfGf4rVhsmmfqyuIYLfME2ilaqH4indcD24LH6jipIIEgur0owGU?=
 =?us-ascii?Q?urXXKKvhyBDnUx146glJI/cweCldlLcQlMHQurPwdbJrKKsHuJonlEM3zPAy?=
 =?us-ascii?Q?+v2dE4YNoWdVJNjm5dIno6Vdjfbi4psJ4/GpnFMHxvzIrRQQlNe3RKGktoED?=
 =?us-ascii?Q?z9iWeNq0gSN/uOMjQy4iF2doF9CxryKFPpVvBktgFem271Fsqz+ydQaVCyK4?=
 =?us-ascii?Q?hOB+HzYDnOFNpaSOb+J0KyFZtnCDb1sfqmvPfpRyX+nvq/DCPR1xZWS+wZnc?=
 =?us-ascii?Q?TQMdOmGW/WoT7yFAAbM4L4nuBAbEwnCWC5CkXWzr1wdBt69nCFSq41iria8n?=
 =?us-ascii?Q?VjMYQ6a99XuYGwnKxcdLRIwdroBbdawXi4iWA2ARWdnjxtv55mKYsVyV5G8+?=
 =?us-ascii?Q?NvVsdlPnujUGxlJZcMaz638HT6KfNS9Kk6laJ3y5wInvjQzgunxDHVpw/a+I?=
 =?us-ascii?Q?5oIWHTHjukzaiO4JfcfyHkZkPJtH/YClJZQcZ6OE002HYk4VMsEihO3lVT9M?=
 =?us-ascii?Q?F6Utw5rv61zzc9S9Mth5YakPeFaFCW7pkcAnIqsLljJRu00KDjm7VLLkFXMd?=
 =?us-ascii?Q?cHJcb8YARQKVo12pQNqoZ3gqSeWbFvadJA2i38iq43c3bgr1QTQDnPLpSLTJ?=
 =?us-ascii?Q?fDGeCSMG8OjNjQItTMaOLza3nObF/eVeE3KN2NnpZvuzvwEYS3PFhzkCAzC4?=
 =?us-ascii?Q?pXrpHyycfoCnbUIoKGsvqi7uszrhopnp9qqRFy6ihu3CuObOosYXMMp5oVs4?=
 =?us-ascii?Q?qYF1G5PNC11SJgKjW2NJLkROWOh71Nol5v7DXur0xISuuuuOwGrE6RGcKho?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3d07d3-086a-4b5f-b146-08dbc7f00bfa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:16:41.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_041646_472184_849D52DD 
X-CRM114-Status: UNSURE (   6.80  )
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

Add compatible string for the SOPHGO CV1812H clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index e8be6c470364..4b6c20fc8194 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
+              - sophgo,cv1812h-clint
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
