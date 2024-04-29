Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE25C10F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=selWJ52RZYNc9T9QsierBigasprWSAOOKSwXf/5cU48=; b=E6+VuCIImEW/9J
	IwCxkfOChHrd4FFof5WPCXk0fDfi2fn+ox1jouhxGleiZCMPdrewk5W7Ez8TS0ByRYaEoTxBgiuV6
	bWsvJxr+HRChSKCNlwodiR/UYsmr2HBiG1Dhw7LKR5yBqwPJ4OKN07FJPcWNQZRpcOwY/NiaV6gne
	cMXBisLYOadt1Md2t7StcC67ekDXtUfYo9dzKOiCvn2Jl+uLh03QoXu/mTn7NLtMFIeIPQcUYVkQz
	wPGeEtEK2OcLmzbUnUqE8WsocviN/vCzDnCQCmdJyrdNhjpm/SC/PaOkgqsAZrQiPTYsLnPBwOXFK
	p6rZIK2SqsY+IxmNLwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1FJY-000000016QT-2StO;
	Mon, 29 Apr 2024 00:56:16 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1FJV-000000016PR-0Xqn
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPcGt3pDWdX/vp70x9EPOFmXBvaWUKedV3gdzZJMb4XLQ/60DpaEKi0Tp9dtQh56RJyRmy94bGYrnpJBjSW40jAAWAvt4CsdzDU+ml7JluoMJTHMGO2hfgaioFuv6vEHzv+8Z3GeCn5PtJwvrWWtQwRQLM/6zwzyjx1o8Ct5eGBv8U3/NCrMd+jlgpGvX6w9ffMAzgQ8ZFMxeqkoAg5K7WSafaKqjakCvx1rxPbNUeUvfsEiRyk1sou1O71txnSYNzAOUOTOVmpQPO6DCgoDq85YewXVQSiIVEkv5AWAkF8PcsFoE0iy9mZpFP+7aRFAwFVgYZxHfmi1pVy2jg2ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47cxn3CyuytgDw092/8StgzgFgb4M38YjFtr6yA+eWY=;
 b=eI12R5wkv1ZksgYoHl/hXoGTTdVNDo5OWXfnpj1MzkDSR5NXNVDfGpoMKrfO/7Xy+gW1LQaRSpyXMGW1b85eKL+fQlBZ/1e0arzxHsZcB33DDQoI3Eyzb/c1vNupI3ZejlDPkm51+tuOF1vhsaIecp7vzEtU+zk8N5jrIF7vvukfxBJGaGKrr5gDMZB6HGmJIA8jszXZBCE0r7Kp4sR7iC36EihTolTS9t92/3LxCIaOpZ0nKZW+ykA01bfQ3SXWhfPqrSdM48YRt9GRS9uQj04lBswJNhTyQZAT/WFiz1GRCGcYjEibIeIzWExTdKlCh1jpaYaqBNZYpIgFNfFyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47cxn3CyuytgDw092/8StgzgFgb4M38YjFtr6yA+eWY=;
 b=ao7fltkZ9/s5cuust5WWeZC6lORW8ms3uCA7QSx/9YhaWY+TNN1YHiovDr5bZqM1iaMd4ZFH8K+lqF5s7aalE6rDSrHPM2KFL3BhM4Jf8Zbw7tJz7KTK3D8jeZwvlRj2kAG95vPMjgYw4sKPHK1SMcDayzK2ci5K44TE3P9eGtw9jRm3Ou1/5oEhXFoqV9h/haQWQuRI+YhKSq6bs/cgAEDgszoGvq2xyXr++JDIf6k7C6Ghn7c7dW1lebbANRgKVtKywm3vCMnGWgU5b6HaiwlgHyIZfUlf04jPpqiWKAcOdv76olmncdBp5TdA5F2iosIC7n2JLj6lTKDFTN+HjQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB4345.namprd20.prod.outlook.com (2603:10b6:806:228::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 00:56:05 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 00:56:05 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor support
Date: Mon, 29 Apr 2024 08:56:34 +0800
Message-ID: <IA1PR20MB495302443F9B18EB1A0DDF65BB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB49533CA5A5D0036F373308DBBB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533CA5A5D0036F373308DBBB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [07r0BAw2tyqwbxDbIF3AjHhPGpqohp0Z2beMdYTeaDA=]
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240429005636.160596-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: b50df17a-23c7-486d-c335-08dc67e7260d
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: v+pY98kwTF8CESDDhcAF0k6myj3dH6gIn3U+4uUWId99dntNQQTbRGPUvGb79lw5q6uZ3LQwEhn1XQ5t2WFn8KCknXJh4sa4m3lcdUbZBVKvXD/239wkXd+u7vbcFIMPZAX3PHnT6sPrXYmV8qvHOfzvCGYMLtiJO+UdD/NoqalG6QVg3GjVLsjeOJxV1lcrIsM0uue0l5ZNowxYdunhyEBYeFEETgvsDj4+DxhdlzaGMQS8KwfDbKIvONOynOgP1KmX3pI8W2c5xB/gF840RWGlPOWEfnbE0w/Q7YAx6aXYtJ2M0ZCQ9Q0SDPhHrHlDSfyCHy1TFWktbx42rcdOGm2mXpgen7/bqD8RjJVWeCi9t/ZWIsd9n1UZjcHQIxCSH3fUbHYFtexLr5DvDZIOaxEzmHXYKwkQcapzvLeCMzLdjUce0v03OTyt6ufN5gdZ2W2QxvbIkV4wE4uLQME55hkE+RhuELGVeR0Ghb0wOvp0xeLr7RduDMakJ85vzICQMGvhebi3YBpCPIla0LBs938JmonbTBiO9hYP1m+QepVeCWOm41bGA4tStlzgxwUSqKQstn5d2rnhDNnudTqZQLTSYT4UeLU9zs0V7wjkOeNLoJ/yjnLuP+qS++5b4tfVWrTz7gVjgq+QTP1L4+scbIiPDa835WoB27gc5tkgwj8ZDej4wlOG2dYkrCJEAFId
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xr8vMZCmeXxbvsXlSazQGo4/EHXN1X0SiV2dSAfZ1Wm8erRoTlJEMpnHJlq1?=
 =?us-ascii?Q?ndszmmKgdWtBMLHJNFmYl7zaE0IhnZ/IV5iC08JRWNwFbo9I8j2zSLWYVRS9?=
 =?us-ascii?Q?L/dG5SyKPRplgeNo6P6yg/8mLJa7oWL0lmIDST7rWYIMw4TuBdn47rz+Ysqb?=
 =?us-ascii?Q?IE1imyvlRxRZPO+B8/J+P4nURGzISqz6ayCZtqQvPqInOElF9Nd66goD333J?=
 =?us-ascii?Q?XpcdA7lmL7IidQmQD9okH1wPf691+tdA+FC2rOvU/LQvoW7Y0lfFe65SKFgG?=
 =?us-ascii?Q?tUL/JyGZG25u/gNq472IfJzIVIV+Cln5j3yboKGfvKe/NAKttAL6gz0YtgLf?=
 =?us-ascii?Q?gvNaXbWcJltMJr3bddpTIc2BbMwURzMDMQHjVCrM+XN99h7fTHVOBUMIDInQ?=
 =?us-ascii?Q?S8o4Wb+l5zbtIhBKWOXAJIyhsWhBv9OR/FgflEr/aHcL60OaRpBQz51YRlm5?=
 =?us-ascii?Q?03yyzG8WZc+5eoSRoiZxcSjq6H8DohQauecr9BtAqBIwHU+ykyYRBCF3qxq+?=
 =?us-ascii?Q?zYhyQGd3+G/n/Rgcuo9gSM2woRXLDpesH1SN9f5Y7IVm8LXk7syB7+MiEU6Y?=
 =?us-ascii?Q?Ov50mUpN2wz8KTqm8SkURgNsop2+DG9ops1twXhECVhiXoTHtLCWGCp9F/9Y?=
 =?us-ascii?Q?Hn1E620D0xyutrX+Qy5vJzaSxRnwATxRAYq2KFk3zxzed6uy2lXLiyzICeyA?=
 =?us-ascii?Q?NdA3Ryin/d+/o7em6wDX2GIDhtFkFHtrKxO21RZV2Kfnv49xmdPNIciiDR9y?=
 =?us-ascii?Q?r4Mrj5XcLo+5bB3LSeDwM801hb6Zj62WG42ka6ZwhgqX11b+U/UCdb+DdbWc?=
 =?us-ascii?Q?5tQNFhUYENjkS+vB9sO4sOTRycnrrWVFYKr+h8a3AvAl1gRKdCbMY7kgEU7c?=
 =?us-ascii?Q?WcgzSYCgoWYWYax2/CmMnATiuEi0HqdZx3Lu9LvTHfj7k40NE1005RA5H5X2?=
 =?us-ascii?Q?fV3hIVeFmbj9TNSqx70nfObfs46F0J5NcK3hDxb49TuO1oYSmTLLvQL9+y+j?=
 =?us-ascii?Q?O39HAbF6d3B/LVLx9rYLZVctH5G+b18Sou+tXl9SDwG6E+5/wUsvAWBgK6Df?=
 =?us-ascii?Q?9H5AjQcvGgqZeLXb8U2FG+mrn9AzhI5CsIfAa5JAvsUHZoNLT49HyGOETZra?=
 =?us-ascii?Q?e8Y60w5Lf2qXvF/3FAj5US6N48o+xUxbNSg/Bvo3UwnjujlyOsFIGJWvgvEh?=
 =?us-ascii?Q?qPhezSpLRM/XKBeUdvTy2e3uoaoaTseyUs6XQ9DzhOkzXTIsDFVPAztJYyHt?=
 =?us-ascii?Q?cuzDcwG0rG64dloeojnx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50df17a-23c7-486d-c335-08dc67e7260d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 00:56:05.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_175613_206206_7D214425 
X-CRM114-Status: GOOD (  10.67  )
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

Due to the design, Sophgo SG2042 use an external MCU to provide
hardware information, thermal information and reset control.

Add bindings for this monitor device.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
new file mode 100644
index 000000000000..6a0383b7e3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 onboard MCU support
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-hwmon-mcu
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        syscon@17 {
+            compatible = "sophgo,sg2042-hwmon-mcu";
+            reg = <0x17>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
