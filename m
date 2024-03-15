Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C31C54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 02:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9DWhYa+E23iIuX+6SikJb0KjwZPsYjpp/v8gWtfVVE=; b=L58aUghk5b1/02
	j/3Do/Z8VaNRsrFuEwnYDsRShf7kQbi+mD0HpJhCjQjy4HlFZUIUQMnHMAJqpZU6o7EHQEwcM1TVw
	RfFutqXlxTRyUuAEpeu+c0XniDrmQlNFVk5H6CgIzVTbHvowIHvyAIpT+rA3zN0zYMXFXom3z/Z2f
	xkdt/3ablmQ3cEjrQ2upJfLtTWLU9IcTB/65f2AtzUuKHkhM/otoIgtlt1V6qWRGkfJ9MF+xFQxDe
	j3VCndd+GMDO6pA3lvpImGhZroUs2/uJjbsaa763eRu1lynw2t8dyanLzuryBp1RB6P3XkCtUn7mk
	nQlur1budOp8qhCkjQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxez-0000000GSm4-2BPw;
	Fri, 15 Mar 2024 02:51:07 +0000
Received: from mail-mw2nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2805::800] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxev-0000000GSjE-48G9
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 02:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZFX6EveWp+QF8SlV189DlP5F6zQopD1byf/sTTOmcTbpl73ZmC7BNwED+gY5J6hv4Dje77tCCmv3JmH25Y2BXDlLrL9y/K5W77SKi20fpCN4gUBxVeM/DzlGqZLzItMwEbRSYSvlm0AAck6h6vg3QOXEGBmp1hkmpcBmz3Viz06t/F3FXB9SX+vGfXDl9dgw3D1loJp67apAbOr551U4F04bd5VeDw3Yfp/kSlilzbudTlWiHwnn2CiHXHGS3WoIHIqQxey6cBaVtZfTywUUfjr3jTMZc56FDzm3CnXChQg/pJT0P3H3aoOLdqKh23W8PQIh2lnUu5HMGrIgymP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQULpgMEwzJRKBmdrdqkQCcdIvdUj5m/Ron8MOI5Dec=;
 b=LfCTso1upJXiJLz5mIxJR5oBziH+JmQoDRJZnCmHCA280p7vJem6XQ6qmE8hXhnuxQbxD/mB/KSSRPWi6sLF8IgqHz5h5jiWPinKQIeplqshH+IWw+R70izkt18BuBMAkIy4QILIN5rjRMDv7X1PMtQ8+br5tmiD8XVNuMTkqzI0GwwPxqKseJD0c8gJ6B8uF8m/grvb5IGN1Gkzc4LIzLxBUnxUKrd4dter+ia1JlW3jyUO8WLcQ4EK2stRI7KnkwJ8bgdBRn/6Bxv2MH6oITJbso5gBl4lyRn7PX7vV8L6nIP0DvvD06cEx4Ydl3VixKGy2lIX5EZ8L08qTBx42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQULpgMEwzJRKBmdrdqkQCcdIvdUj5m/Ron8MOI5Dec=;
 b=VfQMS+zqygfJl2jz5SmJddyMJU2sgvcqNXlNuBvkHFjybeh41oKhzTIT7Jd7SSSQgEIhIrE/4JQgm4jMZb4HgZjM3Fr0r8qHUVhVAvwMqL10iDtvy1bcNbs2s04Cpc3zxj7KMX4ExEtffcAmV00akOMOym4ggKgCvIfy3QLaLXWwcONIe3QA+m/fVekS1EVFwqxzRS92fq6hcX8OvsEEOoTpfyy3RNGO9a1xs7/x3BmNKFVowCDcZmLp57zjBSwVcdc8PMp1Y5l2QLISVYYTERO5ZPidVf5tiKS6CEAy3kvTpwaDVC2XGLKQwplk2i0JE99j12OaJeXZRUiJ4SAYqQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB6264.namprd20.prod.outlook.com (2603:10b6:8:ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 02:50:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 02:50:58 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/4] dt-bindings: soc: sophgo: Add top misc controller of CV18XX/SG200X series SoC
Date: Fri, 15 Mar 2024 10:50:33 +0800
Message-ID: <IA1PR20MB4953D930316266781A229E97BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953E7BB0B270157C8D1DDACBB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953E7BB0B270157C8D1DDACBB282@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [VNSnH8/L+DFnRInjFmPUEduzpznzPjqo/1JnUS7e/A8=]
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240315025036.554158-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: b8deeb4f-cd9b-4e61-8afd-08dc449abe23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fIKJIKgz6UZit/QnWfOuwDF6ex9Lkl9utBlxZD861FlwoQqQUGcItI5p0UnwboyOZpBd3CS50GPgOZwBnCmpwZ9nV1xShmsRgQ00bUsf2VTMy66Gdtzxc6h9YMoNKzO/IQGV+9kOPx2ezg20CR10YNUUFmLR3YA6fXCItnpeJgoO23HWbOqqhyBPKuCSsrFNGHGo86vuzIUeENg+rjs8ZWL2zaUkeo0N6D2yfKXGoG+8rfZm09AT3ynV1OAdMjNSa+vwG6drMBnCccbobTnfxLF+UVgcu5ya6fNyV1/6KMQP30PSxkHdyX8EwCHWliPDh/1SuLP2D2mv9UoPzVHs2ZtSEjEJDL6lubZbqsRpFcJX7giNcE8HcKjWjBQG2IQIBSHK/hxeFvcv866RJPT+7DnYn91JJBpMy6jqYp9YqzZuGov2Lqb6PxWLKWloOpYktfSZC2W4s8OoWOraDm+Zn06fMI4kM2zOGOQ1VqZBwNbu35YSdqQOR9Ut4+R4422hB2pB2ffhs1xu65PtR04sPMSbiNPCutmEzRdX6d8W4FByeH2qZ4DQlBJncI1yrXxLTIZAP8VV3CfxM72nhoC72v5Tylwr603SWjnceWo1xsOTk7y2SjW1QE7M7rBKySqcD1GT1oO8vhLCprIsqfewPE/oKqgtY+KnX1p/Hqzg2oIhT3mQSgXticdfvAAXEnoOQxdfKSKzBS/G9XPXVTgCpg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4MEBBwuyi7ijjupfupSxUnwpszh2oUdWqw2lZkQlGf+CbbFXH56lonz+5Hbc?=
 =?us-ascii?Q?4y0i8hxdIVdGzRXOAQKbzvzkE8z5F/JhKTuhR8t7ZQ+zKvHKQysbNjgy17gO?=
 =?us-ascii?Q?oynmeyjjnCjXrF6MmaoV6u0G9Jy2nQ6QL9L09ovVMAhyaY7RnciLbTvbah1e?=
 =?us-ascii?Q?ZgOggLwEIqaxw1nLOzw4ZPEgG+PDEWNEKBttq8b6gYSRqH3UYfPml6enXI3i?=
 =?us-ascii?Q?nEz7qaS5xd6CcoHZAVCEdQD7sUvHiD/RFv0kQgVqY5h99oKPYmP6sre0e6P9?=
 =?us-ascii?Q?u6kvB4wlUalWBVdG+6N1Dh1Ze1Li7zE0Hw5fcwsQYcf+eMbSw0xNVH9wcxRv?=
 =?us-ascii?Q?o/w8b/LeWVHgzqIXAW0zHfVT4+L1+QaoimkJzOaP7v8HagaOhjsPtunOwFvd?=
 =?us-ascii?Q?rPIs6t1R9prg2NuKW1t1V+rLLlkhwrP4RecLyrsK/5uHZ8Jjj/wqoOhQ6jbO?=
 =?us-ascii?Q?fxc18VWyoSE5I4xxozjdu43R1+aU7vQjlHb3EsLYtjJ7anpck+LmWUBJpam7?=
 =?us-ascii?Q?NihVhTEW2rzQl5QflcOZTJEKTYKVKuU+raJUEGE3tQd7Ra6JnxZHrhdslzXM?=
 =?us-ascii?Q?v0zctHMusSZRdWvMbGUEEiCnqucpsazgHxxdam3crgbanQ1BeXnKO1T3UDSd?=
 =?us-ascii?Q?GDA/W3hX0t3BJ+TxCS38foWbNIhhyf23NORiZPIkDJtM+O/JsRp8Ef6Zcp0b?=
 =?us-ascii?Q?oNP7uPgF393bZgmHd/gtpzU+h/uvFPeOq+J7lkzZ2kdwqYra8AsabYMi5LZx?=
 =?us-ascii?Q?LTfm1VIJohP/CLkpbuG52QSznCaHelA2Lbi5LNF2oTf8uSec8Q0IeePEU2af?=
 =?us-ascii?Q?8BsEY7LveSaNd+UUWbbd+AtrvwP48Ph4FOBq2K8VC0M1Eh9Z7XP6yIcUo86U?=
 =?us-ascii?Q?+zKBoeitccfGcHik4K3z0aQH+P4tkpxZoFYVSH2hTYU+WagpGazKiFYYSlO3?=
 =?us-ascii?Q?9Dul4DCyY+vjZIOC727UR7LMEdiNdSGlWvyaNJIO6Nzdrur3EPuJ/qYmBq+2?=
 =?us-ascii?Q?ErExJsxQuI24+bCrsj63oUz9VVelImtN0VXVADehkkgIk9i3YTrAay4CP7In?=
 =?us-ascii?Q?zF0Y41WAM/7661v2I+3LQH4C286SWcdL+ZqWz45Pb6e4Q8uk9JtwmdN77qC1?=
 =?us-ascii?Q?PLBafpBwSAsf2E91hozFE5xvHbLLTjKqD4SbCvFi3B7Y1poVp7ARw4riD6EW?=
 =?us-ascii?Q?aiNG3iIhp3Qwq8L9+1C+gV/RTlk0NHIKneZcRHdSWRj00gbq7abM+pckhada?=
 =?us-ascii?Q?hMmXVkvIufUVyeXPuQH5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8deeb4f-cd9b-4e61-8afd-08dc449abe23
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 02:50:58.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB6264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_195102_120182_C2402F57 
X-CRM114-Status: GOOD (  10.78  )
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

CV18XX/SG200X series SoCs have a special top misc system controller,
which provides register access for several devices. In addition to
register access, this system controller also contains some subdevices
(such as dmamux).

Add bindings for top misc controller of CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
new file mode 100644
index 000000000000..a78cc8f5a84c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800/SG2000 SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV1800/SG2000 SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800-top-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    syscon@3000000 {
+      compatible = "sophgo,cv1800-top-syscon",
+                   "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+
+      dma-router@154 {
+        compatible = "sophgo,cv1800-dmamux";
+        reg = <0x154 0x8>, <0x298 0x4>;
+        #dma-cells = <3>;
+        dma-masters = <&dmac>;
+        dma-requests = <8>;
+      };
+    };
+
+...
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
