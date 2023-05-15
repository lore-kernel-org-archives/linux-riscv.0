Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A51C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/6iB9vnfHwMbPAIyoJbVZH+x46DcQjN+bTNt9UDSj8=; b=zsIbhWdh9R+KiA
	d1IWMEFanuz1NZGb3jsfxwDyorMh0gTY85TALhXswRubjIGQ5t0lp7xmQI/Z97k3Oatc7TOwVUofg
	aVns6b2fRdLrQbhRGgX6Nnz5+FWdmvOPPaUaTyyTqc3eexP9eo48r7XgQE7oJBqnVxmwdcwXG7hw6
	2eJ97UwNipHO8TJ519HJ8AiSx1zhC3Z808A8HU1jgTH25wKTlSXe2UtbpRFlsGELcvGAxOt5yXsx1
	mfOFO9upgzk+cfFBK2nM/gbpf6O55QO+4v9jk3eenxTzEgdP9is4z7pzwtG4+4Rmuh2J2uGt1tDTQ
	FjvBRkTM7lcoIowJPGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR0a-000yoU-0k;
	Mon, 15 May 2023 05:44:32 +0000
Received: from mail-sgaapc01on20728.outbound.protection.outlook.com ([2a01:111:f400:feab::728] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR0X-000ymf-2F
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyVJgnLzvUyr793xUbRITiwvnEELdJId5+gb65uLu9GRCQD7Z7iIvu08hJ69Dfr2coKvF9eS/IHhrkcQ6ert+2AzCed8GnNA8Rb6MKVLNODObvXIR9tridTWl+hZauLgm+6z0kJ+gNFxV/a7iuffwntlciF6VYRW/qLL9B0cHTe/fQwN6PLHltm6Bs8fVPVd+sqUvK6ZX4M/uA93FcPeQqH9ChYy1xKFZa3KH8fTGKHr252xN+JpjxYS2L07jv+pEBEJ+qOVOg7omYx/HABkv/Ssf3TMraepzSk03HUkczJvLrYoCVzoINg5v0IfJBNKcTW+ZJxVnMfvqiE8CXuXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDN4qYm81KtBcqnwJqYc7u0KrY7qHkg/+C7PG+gJ/Jo=;
 b=gu2OS4zrwGkGvfGCJFG7XlBQ+ydPYAc4s5XOfLD8S1hZrw7Cyk6vwCenpTsHLCfPqOPB8LQ5b6CfHrLcqs+EYneOPrYg52TWUe3lVoaZ98TBmMDcW4pd9ef1Zj8s84Nk3k4zgBoJJD/qDMt/AKqYbEFSRXRCW+RfqsAGEmOfGqhaTmhzK9EIF3Siv68hzDs2H7BS77rKKlT7HoAP3pKMsa/VgrnWKteOmkYR8JvG3RWqp6UP/+MDB83FBIdafoS+nKOaySOGXM1ZJf2gwB1bOD556fxNXEohfoVGY2YRfw6hluIXBL9ryDgjByamEGpQ+K265LliAUNPGpnYspF3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDN4qYm81KtBcqnwJqYc7u0KrY7qHkg/+C7PG+gJ/Jo=;
 b=bM0al73dMSl/JnwOoapo95wQZgbZg+x9SBeWnHaBh3jWoE5QLpkzHcDgJp45TPTY1M41eWCCuEV8sxt2uiSa454zhpWknF5ac2SgqWutzcBsFouiNsH6Go5eiNNVzF9xhSdE2OFHUn0Ib26wt0H9UOtyYqwNE4h23JPYfk+bSATfjQCIN53qJZNn+na61ncXOWW2LuwjwJ+kYnrLlNKctVlrKCJ70UoeAfp+6inMFVl4bDjkd6ORLnRHF4FzrYyrIC859BUayM58byTCgRjyrHUzd4NTlSXdhrmu58SEgPbIru3G8qYzpZUw8TXmWBBWLi3MAnjwm6od5RynoBCn7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6571.apcprd06.prod.outlook.com (2603:1096:101:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 05:44:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 05:44:19 +0000
From: Yangtao Li <frank.li@vivo.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Wei Fu <wefu@redhat.com>,
	Yangtao Li <frank.li@vivo.com>
Subject: [PATCH 1/3] dt-bindings: clock: Add thead th1520 clock
Date: Mon, 15 May 2023 13:43:59 +0800
Message-Id: <20230515054402.27633-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230515054402.27633-1-frank.li@vivo.com>
References: <20230515054402.27633-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:4:54::28) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b06802f-0479-42f5-3100-08db55076db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vtGQR6Z4EbexVg6uMm9prgh9+Mb7fc3FPbHJnxuHq5/4L02/gxWIs+t4bzELE99rco0rGHLFdodOtmlWZEcPBRUswwtb9il/rJ9b4mgraZA0be8z35bQVP8IDSvFUrUcnV0v7d6Kpa1E6asRCUTGZirCbVamQ2Akwz1NXmC1twA4DoGyV+oSIuYxOHitklhm23G7Yunjx7A3h+ObePL2BQh4R80HckUch67/sdH6tezntDJuhAGiqvteEuMfO5x6ngowdFB4xdPAa4GNeVhCIvNYInoyC1xVDfV04glWZT35cCae2oxfCdtlpNpt/jaR0rrsknRk3hAqvXqL6lODJvPyU2aArI+/O3MixI+JQ7Kl8d/UGGjwSzkqNNyfQkzzeggP+JzQ1/R1jzUSmq3gBV3R6YudsGzsT+9+7KlxoVpFF8neeCgdZGgF8DmqaKYp69GJo0RYmR5a6AtYu6MmFTTdcXcKC1Qbr+M/N/zVZX5VWEp8tGpIhgxLuYjAIfwPOnKIpnoRvGLta0LtGKqJ4NmGEf541Lo4nf2n7hv4rFWb+mCWIXb44CLtbPGNZEDvGGKEaH6IinzbnCQNBwSJrUmeIn3T1PrP8uJl5cVvBsw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(7049001)(966005)(52116002)(66556008)(66946007)(66476007)(4326008)(478600001)(6486002)(86362001)(316002)(110136005)(36756003)(83380400001)(6512007)(26005)(1076003)(186003)(2616005)(6506007)(41300700001)(8936002)(8676002)(5660300002)(7416002)(6666004)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TRIQFF3O4saVFVSRVvIFGPomrhYab0hBsmRdct4mHzY1lSZbyzOrX2ocUj8L?=
 =?us-ascii?Q?uWq9FdBsCwEM2jyrjQ3ibBMbUGSVWhWzyfmJWxrdaBtsibKutM8k10zkV5PX?=
 =?us-ascii?Q?YDic5CofxqC9iU1cezCoONrcvgbQVLJfyw2wU/XXXLZQYsCB6Iy3PN5wm/v3?=
 =?us-ascii?Q?or77jC5LYbmfVZAMYhL6T4eOnCn7ksTshBsm/NsUS/WCAhQVIPr+ynXw7w7d?=
 =?us-ascii?Q?W3FmujecHcVfGBAWDgyZp5VlbqCUuQPCs2G8mRn4O2xuqx9tk4FLQ2NhybJU?=
 =?us-ascii?Q?tEZyegd5TRvudEwXClwff+G7uoVHlMPDIAREomnoHGbuWj54SJDGOF2TRT0e?=
 =?us-ascii?Q?HyyOjydVy6MKa9GPZxKubQQNN0KIGB4HvnCAvrJIsFFvd5XDsHGFWv0DTmPy?=
 =?us-ascii?Q?dcGSdXN80VXBXZtOpGkY4fDq0j++Z/XGqz1Kw7HXkjlusJmbDpd+jx9okFlh?=
 =?us-ascii?Q?s7mJuNGrtN71Vf7VSfpKWeQxwsX47o3trBrf6DFL5+d+Bu8BDEVKNp6VcjOe?=
 =?us-ascii?Q?y03V4XP8LNzaiJL2NIzXWYrQHnPy8P6a/+JLKOr885tfYc6pa6J4KvpvKPvT?=
 =?us-ascii?Q?pZIB9CfFmyMuf4Nb227rwkaHm76v3Q5sKR9jQjBtOrwKrzQygGq86QjHgK0f?=
 =?us-ascii?Q?Ggq5ulgWDA7PVbLSQd2Fn9MdxsLOzRAd3OuRSIVzfesLHD4B2uAUJ1Ex8e2g?=
 =?us-ascii?Q?iyR9wwqEmtv6K9PB5pKyTHZaihADWinxPUTgfSjpDBC14yHKCZiCdtRQOW8S?=
 =?us-ascii?Q?kIWX+fTRZNOwH08Srv3Fh5JRSk64eY1zSbmeXDaz2frBG8KlBOFpmB4XPXVM?=
 =?us-ascii?Q?ZDK10H1ufnnOg+4hTJZQXiuS5GyConKVJTlPMooMSNjTbqKiFPoDSGQvuS3Q?=
 =?us-ascii?Q?lC1gqMSP8BIF7ThX90PbCh6IxFlwUS4rI3qkhyCJ3QBU5cPc0rT7qojgJkk6?=
 =?us-ascii?Q?vULWz93LkiiGe6XPqqUhjYW4OjyOlmp/p7FtLZZNzQV+3c7vpkas/dzOx4m2?=
 =?us-ascii?Q?72/PvqafFNGiWPverW5dop1o9qi+sAZBKVzozpzYy0xBlr5twSDlR2z6Ucdi?=
 =?us-ascii?Q?X5MFuy8xJzrIvEZkrswiPZNT621x7zye3TD8aF2CXYAPWUPMrbAzcQeITOU+?=
 =?us-ascii?Q?zG4RNzGgfQR7eVHAZJX2qTVbqvCimlcp21Q0FrHN88B95fJw+9RtuqMZfFRM?=
 =?us-ascii?Q?fIf8lmo1n/PshgZhOZGdLgBax9NHANB018hzo+d0cx3UiAPDtzIIBXQktOAh?=
 =?us-ascii?Q?AsjY5jxPFAKRuXkP9IZNM6NOiyLWbEOAFXOBqDcdVnSKb3+p7vv0IAkchmY+?=
 =?us-ascii?Q?ZHEOkDk+YxrvtmwOohdTNfYfybxdU11YL5xH3BRrj2zRTdbhuK8EDIYpTBac?=
 =?us-ascii?Q?Ncx0OYfA9zy2cPoK/Wr776hFfwzF5US0d2iVxFWItYnol9UpI95qNJcUPGvK?=
 =?us-ascii?Q?YWW1ATja2E32Aq1MQmGlODIpP9QbgM/P0Njy7TSUV35gGqCGOX50wiGiQ5MS?=
 =?us-ascii?Q?9wA5gkOQTDU/Bhw6b0RaNos3VeClfcEKHZL/KEwW7cX8nM8Wts02SYd6TcYW?=
 =?us-ascii?Q?1XB9jo5Nru7FYWTNNTaFQpsvJhXMoyQbggpREjSD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b06802f-0479-42f5-3100-08db55076db2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 05:44:19.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCdIHRT1MLDXsZdSB0XNX81ef7Gymrl6Ra0G6G8qyGq2kUZ4jbMTVC7bzI+uQZKwzEA7J5yDNX9pP9//Mh9sEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_224429_734259_525705A0 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add devicetree binding document and related header file
for the T-HEAD TH1520 clock.

Cc: Icenowy Zheng <uwu@icenowy.me>
Cc: Wei Fu <wefu@redhat.com>
Cc: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 .../bindings/clock/thead,th1520-ccu.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
new file mode 100644
index 000000000000..c3e2d8c7efa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/thead,th1520-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD Clock Control Unit
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+  - Wei Fu <wefu@redhat.com>
+  - Yangtao Li <frank.li@vivo.com>
+
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    enum:
+      - thead,th1520-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    const: 2
+    items:
+      - description: High Frequency Oscillator (usually at 24MHz)
+      - description: Low Frequency Oscillator (usually at 32kHz)
+
+  clock-names:
+    const: 2
+    items:
+      - const: hosc
+      - const: losc
+
+required:
+  - "#clock-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clk: clock-controller@ffef010000 {
+      compatible = "thead,th1520-ccu";
+      reg = <0xff 0xef010000 0x0 0x1000>;
+      clocks = <&osc32k>, <&osc24m>;
+      clock-names = "losc", "hosc";
+      #clock-cells = <1>;
+    };
+
+...
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
