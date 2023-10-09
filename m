Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D8E95A96
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4F5Zbiih3IZrVzMIdS1d0ZbHGtWcup0EeB72mOLax0Y=; b=L2y1YmV/D6sPk+
	yDrwUNJH3i87PdZbk6qafspWJb4boGwDRAuHXbz5JFressilkegEyIL0h+S0b8RGl38rTWI6JTBWK
	vIB/sO/gUKwK1R5DGmrm5BvFcNNefw8rpEB7o/I3N8xfSBhBQ++OMjcdaIKdkodqrw8CUtuSz5k5w
	D0SHmMLHoaDOROGz2oJTvAFuk22BzLzOuQ9DqN9WMDXgHoX8KPWcfKQcCIGgYcEntim+ky8nxJ5Os
	uTZEdBPRViP95W4VT0hm6RC13D0OinbemGq15E+8I9LpmwkzPjvwxJqMl/gN7hkvlzZRnCVuQADKT
	eSuWowulvLtap7nSntBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPR-00ASBf-0o;
	Mon, 09 Oct 2023 11:26:49 +0000
Received: from mail-sn1nam02olkn2082d.outbound.protection.outlook.com ([2a01:111:f400:7ea9::82d] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPN-00ASAN-31
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWZzhb6/uqbP/lBr9qQ89LG6dh4N7qYQ7pj/MRrbpDtyHMLk2bRgAM2DvF5U7AyL7A/KbmAcaBPn3ZG/fThDe7EHUnmUmW5D+ypUcJ1Vloll5R8AzP9JWVb83OpGpuhh558wgBiLcQeHAcco3OD0asVuK6owMOa/PLC0hDGKbfCHoRv4+tFhX8kL1+0WinD92K1glTLGcKKnY9dfBjckklx25vgv189N/aJ0UcIAa8j2LCNf8JIem0CYMWrXxs5Oxqb3dteS3xtLXJYm7ftoeMIMFVuQ9THsb8jCT4NAOctu9QCaLl6cEzmYYu68x03P8jbTGVjXKRzlc7fLiLIv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtwkXgfjjAMMGmqZ4jdTF17vl4PA8wSYTG1h7/LKznI=;
 b=kX3qtVpxAYpnHU6a3zLAiklx++XNbZqqo/zvQZLqpu49q5FdFb0iMl/JXCoHpFARnyxIhbt5brB5o8CxjSrt0KYMPYkKPwxm3xe0k4E4oNuvPApk48rN+J5QS38vrX3wWgK0ZRLdd28FUBQxpOeTX7ZhiyipX3VS8FaW7C45Uaoahp3V/J1K9Uziur9ECgS8XoG3+SEwW5PxE9nlsEZGSlorS/g3tL5cCxVgn0QLh0XrPxnV6kTwRppnswBeusOuy8txQ0xn9awvWbwTPuNs5REdxd0v5JqUvtPTqSb4Nmu8O4BhlO1M7fQ4scZf6EbifvoAQBkptAYcm5auJl5fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtwkXgfjjAMMGmqZ4jdTF17vl4PA8wSYTG1h7/LKznI=;
 b=nL0ilDIwtC/AaYZJJ9+yYkoO+MutqI7l2AQzwhuLSH3ceucoFLub1uBpjeqMr3f8MF3psdiQfZUTM+ar2ifaxc1Y/VMNhG5hyoPc4x+X7QA2PzQqEIEMlgiy1AUzOf5tzE81uqQIlYNMjQGmhaEPZUSDp/EsOd0tVwWddsvpXkTlnJL8JmYZrU+EdV1TfwO99R8g5+4C/cy9dzWvIyNzZAXgjnD1P5Ngtqg+sl7/8o/+wFiI19qD9mv6vY+V/0K0hrLunH7b74mm+WixHR6GG6+6mH+fV2by0+CuHd+7t78VJVjjdHW5JC8UoR/JORFUXGQnH5cj+3QlWrA298BlDQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB6129.namprd20.prod.outlook.com (2603:10b6:510:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 11:26:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 11:26:37 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/7] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
Date: Mon,  9 Oct 2023 19:26:32 +0800
Message-ID: <IA1PR20MB49532BB419D59F21978A651BBBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [9hPR2qAoCEH7Tj39OQjCs+Lfcn7XW0AnRl3MsReTXJo=]
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231009112642.477337-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 39761a63-0be6-495d-1968-08dbc8ba998d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1kU6Jy+pQCQAvjzE0L1GkbgG230bCxTXu3a2etQY3mcznEA/kpixjGJWEUZAESlmhTAWPNPsOcOZBxXp5fQUryEsKBO5alvt0ScFHcbnFOv3dhd0Zk8BFHqOefqYX9EltL7aEQlcv5MgCVI1Z2JRgQTq9SX1mAPF41KzVCNSwb6AhRvWWBUAOr7jmPb/Nq7jK9eJkU2ZRBHFnNtTmr8YFkpf6wUKPjr1989fLaSPqtJqnIXdAlvRtxd4x3sndMlmiGXAfrhg+kHn5r/lTYwLl8hvPXpTl1VADLjoQKc6HqVFdICYExo/mBe4MfMQR05qowf2inN8aCktmP9HzFv44MTocO+Hfk8iGT5AZBxyiiRSZAbIfxif4LXJCG33zLa/ce5uu7pEe8aG1ctLrdWYmHGJq48750sZFcnXoWzOCSBp70xdh8SUiMnskGluu/ZAk87KhP7IsiT01Zn0tizxx0k/vpcmWleaNFVz56soaqfkd8Z1L7rWuGe7LeqK76w7xA2ChGiYNGbk2YHcFmdvVqw3TeUDp34Or210fD/nVcpe2IZv5OmiAYnB/Dbu0iNp+J1TyuC0hioqaOT8bj3E4phkJB3Iq8M9K1/tZUJ4c1j25OGwyT9LKKNMcdd2h1D
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+oH9eXMHM5tyMlczHWYd3GImIeFdd1PArdrZANVcrs+O22VR3OKwDbYb3yq?=
 =?us-ascii?Q?3mKilXql6h3FxVKyri38mAlJopdwtgm9loh+cfnkB20dB6dMi7XjCuLfi0jR?=
 =?us-ascii?Q?yH4g8NYMIFBgij8Poc6cREvf8/mDdzNi+gkXQZLf4kEMYSsVZbOvLIWUPvSQ?=
 =?us-ascii?Q?E2UiQrXtJJySVCFBCpiVPpCz2bl/Gsx38L3jVGns8VvXDkNTUe9aD0wDolby?=
 =?us-ascii?Q?RAIABqtS/AYoqrscmZYAFQBzK/pOqE1HqiVH6ah8FFNBcArHX21Rhp7renJ/?=
 =?us-ascii?Q?4dlFUVHSz5kv/xo87TKNshEotbyuJHWZCw86IpHOkjyd46ZIGQ7YJVNnkabE?=
 =?us-ascii?Q?JCe7gOI9hS68D3E+51CjYJgJ4AiWYIXKuPPSDbhB0AKbonTTXRqK3u4lpSq6?=
 =?us-ascii?Q?MWFzP/zLCQmrXeWv4Lkdge2MEmOKK72pgowH5K0bhMa6d0vua09v2nfX4fMx?=
 =?us-ascii?Q?7McsRh5aWS/sDVST6g0jNzqUhbW4MvEQUMh5Qshcs+vjGMHXSIeqXR+ly5LO?=
 =?us-ascii?Q?PS8ebswPD61ol5RAd62J0a8mdNe1GKG7ybbTBF0OdTS96OC8cstq2moiJg/X?=
 =?us-ascii?Q?XmawgR7UIwGzsSpyzTinZG9Q8GgFLtkQCNA6UxdVCtFNWb4/RsFtQ1BBXCp9?=
 =?us-ascii?Q?nKuHoAx8bbA1YG60PjD1cl6oi+leL4Q7O4vxmQUZFeQjRwdFmIQDkYla2kFa?=
 =?us-ascii?Q?SNVc6kYpmX4QEHuaCjgklqB98yU2fg9JoScltN3NDMhCZm8WhdLGpbQBSpU6?=
 =?us-ascii?Q?QAmMddJSAu2O/SFyO1z4HmvehlDXfO45usNfGGasvkf8GAOvTIpqmxukODMH?=
 =?us-ascii?Q?2NoZVEgpQFYdAgyq7Rt2MTGV/OJdw62vLe6SwgAtRt5LU4UGkVYJaJJ2F8SK?=
 =?us-ascii?Q?me9GgQfpbj7L0a7BMVvy9dS2O+f3fib4ENJnYXrNZtd5rgXbsJswWCbTHBq/?=
 =?us-ascii?Q?rq1GtVnZQf7lQGazJ3zO8QVIqKaDsH68UGNHlZdPWOQ0ZQxLe4scKS1k5WLH?=
 =?us-ascii?Q?G0NyRdW2UxfrB7JPdoSR5diyuHGX1llLtPWNl4cbQ7X2ALL4+Q0gvgUy1Ti8?=
 =?us-ascii?Q?nEWMPePJ6DcvEerKTC2gPAO8HWWFJjjzpesJeJjjjNVYWMTySTF0//5gE8eF?=
 =?us-ascii?Q?WnTsgJYySYCF2UHafYH1cahVlpxMGmE+JqymJPbiCeRc9sU1A7JzQEzzSlmu?=
 =?us-ascii?Q?O7xvwZNr2sav2bf8kMn5gZDExprtCcK5zXfadrEfQ0rFOQUsPdHaEXANKEc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39761a63-0be6-495d-1968-08dbc8ba998d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 11:26:37.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_042645_977321_A349C254 
X-CRM114-Status: UNSURE (   7.54  )
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

Add compatible string for SOPHGO CV1812H plic.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 0c07e8dda445..709b2211276b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
+              - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
