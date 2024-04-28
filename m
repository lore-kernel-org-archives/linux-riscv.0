Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA63C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 01:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt+dGal7HbSeeh0nx0KZMdF/kPaf2hxdfetUcuKTp8A=; b=N2tOL21r+PtJNC
	BGLsx52wLpIX0FlT5Wo5GzcyCzWxZD3WRo01huoxAGHx39MWwBE7gwXkkyFQC72RDvEvEgVN7kau4
	nCByEkCQeYcfayFQUw3V2TqmiFqA2YafGc0yradlVtcVyV7xlooT1FgTageSv40gxpN1DUdn7gkTf
	NPNCvN9uJ3Ey8iq0dTBtZWD7ygH+42reOJDdwJxyowc+l+YbjS14fPkytEdMBqFb78KVtUfSerj00
	ybW/K437qsF3M9DDC1fb/gzNvO85B9BFzJeuAm0SQN6Y6GdEAj9AuOZI8okZ9bUsbGFI62/DMajVZ
	s0o5mNmR0qVl8Ky7KzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0tN1-0000000GZe6-0fWo;
	Sun, 28 Apr 2024 01:30:23 +0000
Received: from mail-bn8nam04olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c08::801] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0tMy-0000000GZdB-1B96
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 01:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmLaz4+I5Ki1K3BEeUdBB9GMA7gJyhzratqvH03N3TtjGEQJhvpiGsXm4GdbtIGI8Adsg/AewQmnVHAgZpwxZes1i16aY94mzUq63aIsxj1OUfBcyds+G4acNo/eJ1T73WHQGDmK+ntebuODj+MgDwoxho6NRhRcGfiqHQz0BvUt0JmmfqfrdiMjolRct8cRYlNjO4wlfeMYq9mkRVkREGRPgJoC1AVNxaQf0nNoo3oIYs84x9+YyVcZUghpWv5qu0kjZC3+4mplFqp0frGp8GRgNZpDsIpkEX6DNZEHILexdNbo9r54UC4pfOcOkh4pZuYYB8iXBAf65g58yZ1PHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0q+hwDMmfrw1VZ+rC0cbtlHvY63tpWnYOZIS0HyiO8=;
 b=P1GHBKXdXfWwY0fPj2c/emgVzEhj72NptXN8PKZMk2ynPnuZmzWgpQvUJZWe7+0a/fwJ9UGn7MF+ntkXuwRw7Mh8XVrDynIrD9dEpoXsfLa2/bSURjFiPG2ldHE62u+LBHSxjfuJVcg65l3miqxc4F413oHJ7094I9Lm1deyv745JJVsGM0oZ/U6gGarlA078BaHvYAo/idlhPnlU1mTNzhfjA8PUEHwFAXjXtixiSmLlnR3Esl+y1wQbEclHdhmRIHYPQed3i+/F2M+UvLucxJ6E+Yyu3rm2/6PIigTsaBYhssDLLSz7H1lfK777PZjYg/SsIFrKONmdfgqV+NJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0q+hwDMmfrw1VZ+rC0cbtlHvY63tpWnYOZIS0HyiO8=;
 b=YRQMczbVKFgnptBPeefLSK6/lyR+yJxRuFjvzAqaPLh2ym0uN2ART+r4i9H3aBjKuD2ODxj8mjZ382mjFyTl7Mxun1+fITJtQOxngRJC73OLkNgfhY17vXTgujKG7XfRg46rU/MKF7lSzkc+J1jaCyxixb92zYHJF/bUEY0daE5zDT5+24EAjWKUW9hYT2CW9e4AzT9rPN8/ZBZU6N0dBZo1s6m1XcVT2nOPEiJmJcQuUi5gDQCkh9ExWbuo3QcSOx2Aum/A/BWtHo7VqXNRlU3LrHFguwsCWvxVHI5v3sXco9WZpQlVAKK9K7Pv8ZRyLrLag5Wf1SUdkbhulbynhA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CYYPR20MB6663.namprd20.prod.outlook.com (2603:10b6:930:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 01:30:12 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7519.030; Sun, 28 Apr 2024
 01:30:12 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Huisong Li <lihuisong@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: sophgo: Add SG2042 external hardware monitor support
Date: Sun, 28 Apr 2024 09:30:39 +0800
Message-ID: <IA1PR20MB49539473E8E4B0E6B9B9E431BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB49532A8A0C52FE5C599B6D13BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49532A8A0C52FE5C599B6D13BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [xyBPXC2pFa0tfXHnBdUG//JvLAk33ztjpjYaXyhF0wA=]
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240428013044.477027-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CYYPR20MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b82ee3-20eb-4a7f-e084-08dc6722bfb6
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: CQlxDfkfJ62zvm6Dh3CWwK9TAc0ZSNvKE7NvBgHF6kNuD/XdXhQ2AdspjaMN7WDUsBleJOisEFRPU1RUHmEzEV5Aco0Vd1wS4ljZ994hRmNQv7Tn6WmQehByxNom1BgIwkeQHAIZIAI9xVxkRs6stOv4r7Qz9KENEVAteopNOdL1dnvpwNgD66A1tzv/EQIDlquvL0cGPm7x+4+6zqgwXpVPoDvau+ERDzOCX3qhHt1qa5sx82nPSsubCQbtLRH/WEcT9q6wJB7Z0OBeeO5rw04iXLmnspxo/gjMmIzQziEZpr0AfKxsHP50nKV/x3kjZOPduVF/rMvoctsKLr/AD9eBoH5tXIY2sOzp4gZkQrKiPq35QDLbfdlEPVVxlufHz9W+rLz/eChY6mGY8+n+mGUBtZNJNXFUkqMN0CcO6bE6Bs3vI1O3b9HbNBcTuefTeKXunIOTUY4XbAYxGACsMfNw7yI993HK57HK8LBUjjTefEUAxK/MH8U7l2AIvo16o27q4UknJSmIj9BHP4qS4s5qHRaRTkO9YQLqMeayJt5K3U+BqLzfYN3kdFovEQsUd+3Xe4n0VXlyPZJNjZB1Lq9XdBfin2QrWV/mIXAM/DWkcrd8L7SymPL5Z1Tz6a7p883kuPCOxVezClB3dNYj3cZCtsuzsHLWsdoZIKcSGmjhOshrB4aqXMmrygE8tpkM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uITValSZkgKA6aNN+O9Wj++Y+VPdwalCp05p2GvUxzRoYNgOA1bjLaNysDH3?=
 =?us-ascii?Q?Ax76d8aY0av/B3WYDJh40Ze3HKrJZSE3lorQjLi6XdnujG+sIPBBGCwFtQAK?=
 =?us-ascii?Q?Y9o1WZy3BZOHIWAtpbZgSrp8e8+NN9St5ox6bQDR8TccHP9vHoPsbtUSwmSd?=
 =?us-ascii?Q?ZmxND3FAl+ty+BKhU8IonkNtwBR2IARxslF2uGkTCLHKK9zKrsP52CT5CYtS?=
 =?us-ascii?Q?d3V7XllUKzv9IURpjEjcoan1i9C6uRHOciisEwQTTjX0V9gnCRZZhSpTS4RV?=
 =?us-ascii?Q?W6FRKT1RAYDCJAdzN9iLxfbdkumPi1kSjkxyRV1RxPf381RPu1ydfvlLSn6S?=
 =?us-ascii?Q?nA2ApFD9CYYBnZzioh0M4dM9Xmws9ULClD6mgonqiVbzSyXRIwEsAYCXcZZe?=
 =?us-ascii?Q?0fUG3uF2XiML08NhC/dotuNb+dH4M6niQGaEI0XL0k5Jqm5q4cJWciuzSiMo?=
 =?us-ascii?Q?IYJ9v36gjuHCWxtLY4xl9p1x7PqLq2lhQOaDFuJlmrsUyjmpr0iylIwNfJQB?=
 =?us-ascii?Q?f6sYjgVmgyFWQev/bLYqPso7i1TROHjzqU7StBixVuXAVcMdluQiA1yPGp81?=
 =?us-ascii?Q?y1RgDU7gVFIMymE1fy4T+StbCzpZp/PtWc0Wv2rk/ZfIJByQnomZqcPWczuw?=
 =?us-ascii?Q?hbJifZmjSgNStYbHAddGePREmFdzzaMoxWFXfj8GlsT/F08BcXZHXcFUFBaR?=
 =?us-ascii?Q?Xtoh1z4G+D2xDfbEwEpt1w6IXQ6+f8ctC6WsvBYMlVFKAVAy0NUraqxZg3qz?=
 =?us-ascii?Q?PVUl3ahFlCDTY5Q+LG25CDzjzgK7H/IHoN7IlzT3lDlXbpzTMAh4B7HkxPlt?=
 =?us-ascii?Q?1RMCFlaDAG2ci9hgiidxGsiVrAIU3pc1gE8tDsvY/A/uMQBbHrT3mU/Ko8Zz?=
 =?us-ascii?Q?ivCIMaO0ZPQt6nPMT0NSb3v0Q8GxYyUIflupreytWKWyFm6JvSw4PZ1oX9Er?=
 =?us-ascii?Q?5aLDZUefBkjRAXChKByWmKIh2hbOjSbVHE2eSyTj8ACRNZ52J/IPAcM67qai?=
 =?us-ascii?Q?PtGqCaTfIC0w6lCeIgVptpzFHldhS+HOu/dSD1pyO+We8THTxGwExj/MiJid?=
 =?us-ascii?Q?M2EKHrs0TbQ0qNLV81aIOlSsBIFmYa9yxmb7psSFu5kqeWc26+xtkP+3JW0c?=
 =?us-ascii?Q?a53CwDtG3N2bD6ZpYjUNyuLSEuJtCSUjt29pyalv1WoD+hFIdY1vZ1wgxr3l?=
 =?us-ascii?Q?JK5P0lOfZiv3p4M46Yhdk8gNbEQZiYjqZvLlIDh/Ji02YI3L0B6S0hP83aPf?=
 =?us-ascii?Q?1EI7QjsbI5EKmHxX6Jub?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b82ee3-20eb-4a7f-e084-08dc6722bfb6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 01:30:12.6091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR20MB6663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_183020_347199_E7F5D092 
X-CRM114-Status: GOOD (  10.73  )
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
 .../soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml
new file mode 100644
index 000000000000..6a0383b7e3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml
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
