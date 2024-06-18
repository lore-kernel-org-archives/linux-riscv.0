Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C45C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0SIFQACFo5JI5OUMLqb6sGZ5WCk97rLzXlb5wJCbNo=; b=l0E5gwQ3i2y8m+
	LgKiibv8H2JQrVGytmPsEC0jnkBKgvR2xTTNmY1Dy+D55FaRl2V53Ud/tCCC0px0MybcLi/OnBP1U
	oz5eDMD/R177M9/LzGVHZW7qgE2oxW3JQbDcA9R/yFSbl0MJVZuixRSgxUGlfmhk59TGVXWfBWplg
	/AEF/KIzlrv6bdifoyn49pOs1k95AM1IVYQ3O9Cqtb240TKOrgpqRBiuAcmffPEIl9NjB7wImz6n1
	P8z8j7q47OJdBi/8FesMr2n8KjKrNIFvcleTq6B1Xj8xkymNLPQt0L07n3IovSkX+92FGpAdMeOn1
	QbKVEiE3LXxWge0DfM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaWT-0000000FYvQ-0tTJ;
	Tue, 18 Jun 2024 15:13:25 +0000
Received: from mail-me3aus01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2818::800] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaWP-0000000FYsY-0TEB
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E91G3qBiW7Aeo/jHIc8LMiO0vZQxgIO80zwU3216e/byIulmtDXHPltLLcuBF67is1BMJK0yA7xRZOg5oSsQV4jx5LThX6CDEPsG6nM8LsE7058Jaig8Gc6pdunjvjJTt6dYhNClr/NJuraDx9N9NDC8AWuY13VNvWckVwe6oo1Jc34hgNoSQUg1jIJui/LYSWeUAVQ+i+qo3pdqUrIHOIckpE5C91OmWlNIXFCne1n+w4qwznfXfBDKctj7qssq4PGkESTlzRm+IwwkaTzX4fghkUT75oK6sYe1h/E1qbdprd+wCmdGE+oLzd7NVpC9JRAOmaNft+kYZBzRnwi1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKTCwDIG8pgERnO8qAnoPLFo+Gwfzux11mjqdeBWce4=;
 b=SeZXUJJzo+XhtRdg9V8Q0uKb/2XSGxhmO3Hi4IzLovEjxfCnWt2gYiV6ivLDUdDcN7BdpB3RHf6i+4jtPxSAWLlGU4zaLuTCCWeceP8D5kQDGsQcrUr2ZuWNTDMrUPHr1ie0HgSUbqmcfDwnsWhK4Eq572WfHXPCDZb6xkedFfM9PAqwPjSwIqVWrSLRaQ/MjXl8TUto/X0gUISaa6mmsibIijSJnaXVVdzSSA9+TVGZ3lHygckMZ4/0+qUyHxSa9u08HQw7ThnCyl2OlFdNe2IxBrDhepNmCCEpH8Sz4R2SanQUq1ZQrK+OOVsXa5tr3T0NBwtQqg8NuCGJtOf2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKTCwDIG8pgERnO8qAnoPLFo+Gwfzux11mjqdeBWce4=;
 b=QJ/s0HbbSmALNm0Yshrft3KLuVEHpKNwcdSskPY7SK1DPakxHHmnTYdQHFBsSmEfmi4XdHTBtBLd9Q2XvTXpeB768mpyt88lr1N8faZaUB70SakNpmBfTsNvjtQAJGuWWN+9+jLfW9KYoUE9cx51+WsbFFqtvVlNGZgnfuq0riVJueLNBT7/bdCtwqelUgzJstilsUv0q1h4tJD/j4C9aLuzvpNIM+TMUl1fj5h/cxrY02nDX2MFnGzEE234hF3Ieii+vYCOV/a20GQYFcpTD7sq3eN+hAnfVO3eg07xIyx8SlXsZ4F6n2Z6k4ONxsjeK7VdujiqFFkuZ6AKWCG8Vw==
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:9b::8) by
 SY7P282MB5268.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:2a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Tue, 18 Jun 2024 15:13:03 +0000
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3]) by SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 15:13:03 +0000
From: Yuntao Dai <d1581209858@live.com>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Date: Tue, 18 Jun 2024 23:12:33 +0800
Message-ID: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
References: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [ya4n5REVWOzKP9qb85v9Qjesqs2FEZkm]
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:9b::8)
X-Microsoft-Original-Message-ID: <20240618151235.5846-1-d1581209858@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBP282MB2238:EE_|SY7P282MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afa7c5c-eba5-474b-f3c6-08dc8fa925ca
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|3412199022|440099025|4302099010|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info: A69YsiXfAwnkK2REcDdL3iBqSrLwxZiqpomZwJWxOS85yoFXysMOu40XbHZExopnEk+wTRUE/w8NVfmZN0vF0ATRFhg33raoZrYkZzYitJiuAzHhGmS0aCXcEkgUJcYpNhQrAacFvotQfLN1LS9HgtWCWi0r1t3VAzmaxSkxjR7H404n50yzqJHuCNyH/Dis6W2nFNBi56f507be2j0Zg8effjnB5Au/DLh8EsVlNMvWlYT0GjIRe+AkjDVpaK1YBGbMQBl746fo8kvQA8An/CC8+UY+LjV6SoSGrEx4HKS3/udrRCea4AUIWPwEqN2AHeHAb1dVrl/NUfh3doPK0ndAR0dyiJWgOXZNOODZHuas4n69uTQWa2FdwN4+SSpxX7n5SD7iLGI6eeyTCsqwoeJexCY4jEXJj2ZUkEtUzcIKGqqIYLjGn2whUgPNDqNE2JAIP29+AIBRcNZJezpi1S2t+js2Gh280GzaCjBHTRNfjlJjbuDVQvI9FoRnkwP/Ep5OB/cDROTlpr2zxM+giOyaHIbLKo0p0ssmTBeSweqd2N6fdCHVw6ytRzpxJq/kbH+fPl1DPjlp1v39pvrbp40fPT/Ns/BOFXlVz5vk4CadQDpX9KZyhOr3ttTjFaXCkAZbCi6hO3PHgU3M1XcryA/lQYWqytPsxyuw7WTIoCsJbN0U7hfKId/UM54ojZmitBNu2jg/ZH0SurlsyCpUjwVOZ1FBFlUoIDyOE9381lA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5Obq+QQMaaIeLMKpCq/jL2PJEf59tHjleMwN+dpu35S94YBRNcwZ4KUpWDQ?=
 =?us-ascii?Q?K1o1Dqth3bE+Kv7nVUiSXiHBUsMjW2ubUY/uo8GWygtjkHNg44KRmL+W2Rom?=
 =?us-ascii?Q?w6V7Z7PW8Kg1JrCk5/4uFZhfZA7MQd0azaovg+fV4abex6hnmHp6n4/M4ibJ?=
 =?us-ascii?Q?Jz66Xsmv1pKBInEk0nxnixgUeHfjgy4jmwfAM71AYbAzWrmlzEuc02//SbCl?=
 =?us-ascii?Q?fNthah+cuwclyLJiUEQwI4uM3TCyTskY844tWCL9EcQbqwo3Ov4AUk4S4O7F?=
 =?us-ascii?Q?dDmcG0Fw1Ixa35suOLw+B7l28VZiThyuEYS+XPQCq/nKZV6bWJeG3XV1cUx4?=
 =?us-ascii?Q?1Os8KvtxhTQqgg4VA4KbxyzJfoXOnR1mwUaBcnEhoB41d12pzg8cisMuGa+t?=
 =?us-ascii?Q?PJP2rrHt4dIKlON39B7BuTirxgfQTs5GgjIiEOUr1sIEQa/fEYsqEVtELz44?=
 =?us-ascii?Q?FQW9U72dhJ5fWHM2+LMNmaeEPT+RzxkR9Y7v0Ymyp9rBUtQEnY/HmXWq2Wyt?=
 =?us-ascii?Q?Qw11gteTyXMCVHwrvXnkuB0Rz7z8sYnmRDnduSKdnn0ly8cE0I69f6+JvBzR?=
 =?us-ascii?Q?AowwKvhwlYZBycllQ/y5SPp/CiWjFsneXX+tGhip6gNqrB7zrg6ZHn285Q7c?=
 =?us-ascii?Q?A4KSCHq7QZm9m7jrgFHrxc3Vadvfdv8ao3DET3p1VAgTs4gIT86lqik1Vozg?=
 =?us-ascii?Q?6XKPxk2Y0HV7zejOPpI+5JX8AOUq+HQRODcD9em9vjPlOAEteLRWlC6xzWzC?=
 =?us-ascii?Q?rtNecY6D5jr3x67ZH/j9cfIJP6ZAf5YY4SpFC+ptdrcKl9cmwXEkvHofxby6?=
 =?us-ascii?Q?d7gJvsG+ZTNw0nSu0aOXqsFRvyQBaofgnXiGYmdi8fiQ1BPXyyE5uqeoHBu4?=
 =?us-ascii?Q?O/zVIoPxWgshGGQQnZeDg5NXHpJ7fQ8jM68LB0SJyo0OfiWy0lDY5o1yNYa7?=
 =?us-ascii?Q?8+5qlKfDaaoGwo0qOIPj3A/vqx/RIOx382LyAIclBbXgIqCujYyNpAXx7uuu?=
 =?us-ascii?Q?5LuW0lPsADOBjxBywzvofas+OfQTek4Kg5xLcqJftZZ73KMkJFT0NLglHH0A?=
 =?us-ascii?Q?nChtYnekn3KeSBY1qTgS61rdsaYGIN6WxWHj2f7+Pewr7XfzX11tIBK45MF4?=
 =?us-ascii?Q?2VbPrfJs8oaVSDM1N7FQcRUKipHnEMmnj3IRVtDnu0mTddCaMUUojiPzmSs+?=
 =?us-ascii?Q?4qExuemIMr0Il2Dt/qObEjt5ajtTRW0vxEoQ+cBzP6WcbCtQVdpw5cpBGi4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afa7c5c-eba5-474b-f3c6-08dc8fa925ca
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 15:13:02.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB5268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_081321_175261_5AACD872 
X-CRM114-Status: GOOD (  11.52  )
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

Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox

Signed-off-by: Yuntao Dai <d1581209858@live.com>
---
 .../mailbox/sophgo,cv1800b-mailbox.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
new file mode 100644
index 000000000..e1868aaf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo cv1800b mailbox controller
+
+maintainers:
+  - Yuntao Dai <d1581209858@live.com>
+
+description:
+  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel for
+  different processors. Any processer can write data in a channel, and
+  set co-responding register to raise interrupt to notice another processor,
+  and it is allowed to send data to itself.
+  Sophgo cv18x SoCs has 3 processors and numbered as
+  <1> C906L
+  <2> C906B
+  <3> 8051
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mailbox
+
+  recvid:
+    maxItems: 1
+    description:
+      This cell indicates the mailbox controller is running on which processor
+
+  sendto:
+    maxItems: 1
+    description:
+      This cell indicates the message sends to which processor
+
+
+  "#mbox-cells":
+    const: 1
+    description:
+      This cell indicates which channel is used
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - recvid
+  - sendto
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox: mailbox@1900000 {
+        compatible = "sophgo,cv1800b-mailbox";
+        reg = <0x01900000 0x1000>;
+        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mailbox";
+        interrupt-parent = <&plic>;
+        recvid = <1>;
+        sendto = <2>;
+        #mbox-cells = <1>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
