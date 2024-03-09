Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB74C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 09:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwo2PcrwlnxAoclWHNmuk/QZITfJ/St/PFp2iBju758=; b=yjVdcAPOPwQMlq
	Pk7idNdp5Hevaob6DdrNGlnR/noIG3OPbt67igjYus9BnBSU7GJFcLTOcEB+tZbDaMIT2SknYI/Qx
	YNjol5vxXTs1+MoQ/nVzKRoiziYw6AhVEfI+i8l2LyBASTL9WOJ+psEthGHFvmrXpvKT6j3tlm32H
	cYD//PgDutnp8t1Ybxuzz0XHFdjTmKrlU+E+p2tRPPRNAH4/8XtfQGq/RtC7leCFrHEBIzLl08fRV
	Vh12fvaRaRSllM2KDQ9MaXAzBsT8YnDIhcArNltfPNAf4Cc8fF3ib2A6x4aGsuFPM9BWUTcp+xvIO
	cNdO9er9nEjALYtNY1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riscC-0000000CwxU-105x;
	Sat, 09 Mar 2024 09:03:36 +0000
Received: from mail-dm6nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c15::800] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1risc9-0000000Cwwd-0KHN
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 09:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbEnAVBu55gUQ6sNYjLyF1PuoZMkcRIUFmE/BfPNWPZ0XQBHW+lTolYworYq+pR9ckmYy+ZvmNGwznFvMOGOCxIGuWgw1c1Roy/H5M7GHGbqPZMcp9Zm6YW+IZ1A3vI3e1GrtI1PtWSTjUpQj/ukrVxMaSlQ6h7F7v7yFclr8zj44qI4zbhBRPyXUxUdmxLWYSiLNfUWiraks2Txe2Bk2iLU/7oH2wMbaYABmSuMsaI+9iauOhgvEX9gM/gonM9qgIWE/MQBnsGql5lf0UPbLaNAaFPKI+BdIyKOHaXoDGtPJFcWQX3T5/by1pgYRbZJFOJnHoNkTGtA1YVcnxfrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iMujijFR/4pzHanJd/2Pi0CZb/HTc2Y5v7YJZ/TPLk=;
 b=P2T/M07pcFSgzd6i1hNn/cg1HRbVNSaSXN+SMED/umuzKLo2PwWEyZTpLu/dwkKhGVjgQ07TWrX5IGIVv9dl68jqiscQS5gM2YuUHyUx//0m5nvlo6vK5vemLhY9DqbIJ2X2JIAYYZQcKBnKzJSyk/aeeLL34lCceUf64vg5O1VKxGv/FOMhLc1U658I0WgjHWVvcy9lxk00AqlX2Y/YV4DeIyLpPUIxkA+j8UYrHPlmoZ2rZcTJ12WsfmoaXqhwIoqO7VrEVFhVSijX2SJM8jqkzDKEaMrNO+p+0NgXMT0HJuT3IQfAaBauM1iVk3+OJLkblPXi40W9NBBLg4viSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iMujijFR/4pzHanJd/2Pi0CZb/HTc2Y5v7YJZ/TPLk=;
 b=oEPVsSuYpsQIXfZOU09CI3os6d2x3adTqOFMFQr1SpgudKuWpcxvK3wM4boD5pk/zTR+57aV3jW7IHdiW6DaC+7SaLxK+w08Go/QOQNO1kNLQOOKbrvsYWn3lD55rtx23jI2cfHAkO9kUK58HHzZPVz96T0mVK2k8E2q0ORca6UixpxzzoRIatKi4eb/U0VaVNf2upFXmhM1knwj0knONW8rrrwgC9EFKZbMvUBF1SfYANzDvy9EADtUKxd2uhQn96N5tgunXaLHYA8s2N+6eh9RuQuNnYFcOq+BaSyqPYCfRddZqLTeKE9pIBZhvy5Pu0BmFa3pZIAXt45TTCucgw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW5PR20MB4260.namprd20.prod.outlook.com (2603:10b6:303:191::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 09:03:23 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7362.030; Sat, 9 Mar 2024
 09:03:23 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/6] dt-bindings: clock: sophgo: Add clock controller of SG2000 series SoC
Date: Sat,  9 Mar 2024 17:02:51 +0800
Message-ID: <IA1PR20MB495368F185E018767CC6714ABB262@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [oBEFszK5/VxeduZY3LUv8hpCAMAUMaNKrt2qp5sLeIg=]
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240309090257.927623-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW5PR20MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8c4ca7-5fe2-4732-d255-08dc4017c64a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oW66+oZ2jpPV7IIF+oQKyLuIqirRW5fGgPUJuN7Zxdx3IPwV3htQf5eZRKYwkUabPUPUbnFVHlZLj/9WQCzMXkEAduDVVfy7BfXsf1fPI6q5k8rauMBQ9V93drwGzo1a5zMdlgJ3W2yK1OZodvvkv5KkMTrHr9GWSXul5qhK2QzVM7xAT8jgg/oeG0iTC9vVBLWXj7OFHYU+/AaRY3b5gwawQlYLocmOjRc+JTNZIGuqNCRWdKQfvbyx5c6W5cCBD0AsfhxyFKMTYxU78ctwBidDD3FzCOeCTAR/FbCfkSYz0FZUqxjau+ayVKWhSsKG1TdTz0XnR2RnJDfI9FbPLjT4Gnc8SjGdJ7gYptM5gWQKPwgLBKKJbhPQ2CiWTV48tb+G6Vcq3AvDYoSXVILZbxAWpDqG+cOycaogxrsy+6aBdkVX+2Fkhv6Rbn8v3NGntamzehKfUNxBsAVM+YSY8TcQUNA37bURkqZkXr8dW5KN8+/3OiTDnZmxBRSFL23HgHG4FdTOkWX0CrnDIuxFnRZzNA9pfuxxz3ek9wq+1dgF+oXClYk9v8Tp54bMszcqVQYycv6XojeFPt2kfwIxtY7A9oXB7vtyCPsv6cdIdcSa7ux1EnINtCEmxOlEYlHL/WkBQbNtvow3XtRpMulZWeIy7uslW/M/HrlkSbXhVfXiNOg5j8qCVXt7ajsSvXsXJCDZ0w3YE2HzS+U0iWXrwg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuit9otlLmWPaxvDmuwH5T2eLTVv5aHpfnX48ESqB/9bYRuo4neISvBJn2Qq?=
 =?us-ascii?Q?Iqp+sVDemvPUSQTeyOhY+CJHn69IoeLn4jMAcCN9gFl3kWhsfL8jP9YMrr5Z?=
 =?us-ascii?Q?HAFSmSvpeukLCpMao+cNlBuWQtFRMaW+BD5E3MCia7GdbyNsU5L6WwaxwCtj?=
 =?us-ascii?Q?7DuLLZIWMqaraoSLmMWOUGIslEK4+7mLZ9KlfL7JNAkcxR4GyqcCuHgw782W?=
 =?us-ascii?Q?wQWDx3GjRs3IlckJ6Lfdh6bAhXdoTHOFt4ge0ScolwJS62FzKoVW/7hT2gvH?=
 =?us-ascii?Q?4fCJ0sJwBiwmxk5TcufxKR2flCiNRHqzNMStTEjAcPFpJDroa64LqM0OOJKQ?=
 =?us-ascii?Q?AqKRTha6t24dROu4ZZK7Dg1gYRPhLMnUF2lzRGZJmDYaLAtUjOtQQcjgmMJh?=
 =?us-ascii?Q?EiarQDsrLOXolGXskTXrb6rTVzWjLALe9leYTF/rU0sd0CGhC1ZleoVPWPWJ?=
 =?us-ascii?Q?gIRfDjWnC7xchAmE79P+lnT+te41W8QgS8as9x6+4yjtawgES3keZ+Y3538Q?=
 =?us-ascii?Q?RPF8T8E+9iSTDnDI+L5SO9su2Yyk0N1pSNDGWAVDMT5iSH0hdh5/WzrdBf/7?=
 =?us-ascii?Q?a6rVcLZQnSlJ2Jor9x/Sv85B5Rmr2BV60v+mGC01oLYFgJEVP7I6tD7FSjDd?=
 =?us-ascii?Q?uZirjib5Udd6QtoLdmnDbE5GonlUR/yoonJTB7CLr3uzHWlIlK9FpMqrUQU5?=
 =?us-ascii?Q?zF4dy69KyKVlcV6gtOhckhkdsPJdv9WC3ptcHmlplIy8SHhcpuXBZ5mhWtrf?=
 =?us-ascii?Q?WVb0/Z8IKWcC7xw5N09BqUegPXY4/GPlFvPgLuKUSKItxpvqHs0SWx2ItUim?=
 =?us-ascii?Q?6ZSPp6TU/fkiH9rHiwMshgpW2j0oR6nEb8npH5i2YIPJcFAU0cddaEf2mf+j?=
 =?us-ascii?Q?h6bZQ0ahoce/K1d17HYomns10X68hPMaDTy6OIw/E35rVlzs64yhdxMXeyBm?=
 =?us-ascii?Q?jPLQm3jH+2AJmbHFgIsfOkMDtMkbn4Nxj+b94dsIDVfIVK+g5wSW1Ngp/KhE?=
 =?us-ascii?Q?5jygnqE6m+yjl+aEUj6BjWBB1MI2eFBUDZz5hXLt5RFx987FxprCjpsKhL+M?=
 =?us-ascii?Q?L0jLmVPnmbPRtiqwt+gbJYOoN18j8iHmHh0TheIUY5qrgKB8pqJPtA8hExrm?=
 =?us-ascii?Q?1K4YCr8rMshQWBEs5guR/WheaP0gqFiPep/Cn162nlZxuVdLO03G3UZOzzgr?=
 =?us-ascii?Q?qvKauFPP2csjZ+eCa0Y5ujcs9WlCD1o+LHz9m7RV7UiN5gNBwIBHFCFtZg01?=
 =?us-ascii?Q?LxDKjxw6chX/mm28nRQ1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8c4ca7-5fe2-4732-d255-08dc4017c64a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2024 09:03:23.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR20MB4260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_010333_332822_7F60FBC9 
X-CRM114-Status: UNSURE (   9.58  )
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

SG2000 series SoC has the same clock as CV1810 series, but the clock
related to A53 is functional in SG2000 series. So a new compatible
string is needed for the new SoC.

Add definition for the clock controller of the SG2000 series SoC.

Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-v1.0-alpha
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index c1dc24673c0d..59ef41adb539 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

-title: Sophgo CV1800 Series Clock Controller
+title: Sophgo CV1800/SG2000 Series Clock Controller

 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
@@ -14,6 +14,7 @@ properties:
     enum:
       - sophgo,cv1800-clk
       - sophgo,cv1810-clk
+      - sophgo,sg2000-clk

   reg:
     maxItems: 1
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
