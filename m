Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2DCDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKXYKPjJPhYUZGnDthIuHmQPtWIokucy/unC4POO5fo=; b=jsnZf/mu6GIKqU
	0BDr+vO3ak2JqP4c2PSewC4006WbHZ1m1G/jXg5T3s5ZigSnkcPacydjdTctC+KCSA/rZKovhdDhv
	+RCGW1aMm7om/adfgJsJQahqtx4Gjv8bqUe5WPzDsQ7Jde4I2lqEJy2m5vhyB5KOS2bkTGPt/tn0T
	BeiRB7yZOHhKZUw72Z3uIfjfUoLgT1ftZDDNzrsXYLFNcYzuZurwztGcBKrqLr+YXgUYRIFhAGRmL
	8EGNi+56qNS6FDXoBKSGyMt7P/tnLd8Eb265A+NDqYcYeYbhPOK3BlM5vsyPtmkAalXm74B074PvK
	zDBemQ0gsbKESSky7sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFoo-00Fu2Q-2k;
	Wed, 18 Oct 2023 23:19:14 +0000
Received: from mail-bn1nam02olkn2080f.outbound.protection.outlook.com ([2a01:111:f400:7eb2::80f] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFok-00Ftyj-3C
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 23:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ssj8Uh6tJ8Sare2wDcaaiKkmpNWPKUWzBFlhrEDZa/Ta2zntYf093AkFjSoowmnDxkbsKUVrXuquuXxKvSaufK8MXGv1jt8DALBKHZD8Bd6x/kBTPLB68vv/IF4ZCojGfkNOn+hwO/afN+Ke746aYRDVDWiLdqOmwkLcOwjSWzdt57bcBC+oqA0SHpvmoC1YgFNBh6m+kJLrglMvuuLz/wLB0Cc/Du90vrnb9vJ4LUO4sFzsC6KSXIxsaplmcteBIP8fr9A8mh8eungT2pWeAySYvh2x9H3dUym94oDuZIpGTLadY+OWvf/YzSU6DMmQSY8r5mxzfAbaw73SCGjFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxdFQHva1tIfHsLwtonuuEUHgRqniT4rOOd7FVoCvqE=;
 b=evauWTYv4jCyLEHY6CJ/xdNMCOHpDSX9Qm12+6vHP2B1WbXMVInD8xHgkAP43E8WBgOvJAUB6Ok29IvdOe8cw1qrL5vilasc1awJH65EOB6vDbgq7ZdZNZ6A2sopoIM3ybOUbXEhvDQOhUg4pSwA5cSHZUrxjNrHV4cd4KSj+uwAP+ilVw/sHCeHkmxoKT0p5ERcY2tFOpLyPRIVcVoElAEy+YDJiJLIZ1fF/iLBpk2yoxC9QdUXp1CEEZ3ryOu55qhj+jA2gISSqbG7iKP5qmfaz3I36Z5ivKHeoVy2hcK/lpO9FzTSJKOquoltpu3JeV/VkJWHRuAAlBwWaDuUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxdFQHva1tIfHsLwtonuuEUHgRqniT4rOOd7FVoCvqE=;
 b=svR9+i3/IRdAuPj0zLooYMJyH+LFNF1wvwUimigPlPdCkcOPMh3NxX+rnuKcippGtn3yaN6jjrgFlbdDE7ZeWN/OnZjUFzCYcISLaT+OFmKdi2y3m0CbjTEKl70MP+YaRNhwdMdWJPDeHixhpgMM+E5EbDYqnxWkyqWq7nSVLjP6mjlhhVkBrYSDpEjDkrSCJFiKofjvXnASjTZDzK49AtPDAn8PNgtsaXYc09dgOZMJAu77khSALngzWRTLcgkC38QGJmFST64Q2GR5h/P80h0iw11+UQaz2KYPwMF5i45GH1mkZWK2rpOXWaF7FGLKQVbAHkYqHY7A07nRwlVoyA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB5087.namprd20.prod.outlook.com (2603:10b6:8:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Wed, 18 Oct
 2023 23:19:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 23:19:08 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: sophgo: add Huashan Pi board device tree
Date: Thu, 19 Oct 2023 07:18:54 +0800
Message-ID: <IA1PR20MB49539882B957DF39AD77E539BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [bSMmR68jJ1sZl1ot9mF5lVTw/eCBTF7XCvkElPvY1Xs=]
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018231855.28472-7-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 209d705b-9c31-4ccd-10fa-08dbd030a132
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTnKcGP1HFiJw9DpkbKs5RKSynQR0EIUP+AFHPRC6TcdZawDKj37BmGSDvMP8kzbYX5aDrcyMtilEhhlnZ0puelZZsjy7dQooA/+ehldOu/8RQrZy2WTKhLz0AKBr4iJnRdh4E2cQ+TJDyxeGWTLBay78hD/dP9Y4wO4ovgP3l0XCawJvRLqTAM8BRcicsC/KQwhsJLA7stSEX3JCGlnAzwHp9UM/m0MgEaLmMjxZJcQWtTdGrGkbV+FAhJoCAPijvrXtF/O5KcL8dBCBgeAUt75q7vCoCvV517O2Gni/IM2RCoEMDoRWv3GpntevGnEFrfKTgHAzr4Y07kA1E5R36qcrVkH0Fq5vnl5rZxoMNQ6+KboPocRV+WtPXi+d7rSXpQNq/Aelqn5GXxTFrcRkhTVSAsGklWgct5WWtmos9wKB1GVcU/FiyayH3ePKBLhNDOrKLKGk0kMApnJokCtsR6x+Ilki0rkI3RtZG0L3SDKlWBBWeeyQsJvPFdePAuJbH3imZGOodG9cZC1mKRjSCi2j+a/3Qi4zTVzBN4nY5pP4loEZlR+D9vY3cuYURLZgzduqT6nelJGwoi67204XLfs8bbZJa2OUtruP7DbRQsfcEeQsQjgMlfW+ClG1Nh1gopJUSvqaSe/IFo60mgYNFK8U9o0cA9fghRiI0Nwasw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NxpKA+DAdQky1Jc7TBKZrk0I2+EL2v4eRPJ9lE4D1uYfsSqMWbE8XOgHQoKk?=
 =?us-ascii?Q?a6+w7qOfii+3n7ROqZaK6i4xk5+ce7CjPBnpSH3wGe40yQxfF9qOz5JHNipX?=
 =?us-ascii?Q?5CO1qyTvz2FDH+FKV3cWtRXc1kaLw4SxWBoAOcRl3wG28DMBSxPTKq4/EWD9?=
 =?us-ascii?Q?BzMVgykOZ24x3mTaQw+QlbKHC0TCxTTapkmnaRQY21/qfBMwI/IdO/6bE55f?=
 =?us-ascii?Q?BCBGzrbBSY1mnwrOvlHDYcVaHaNXKaplWJrjqwOCeUoTYbzLMEX6gKPC73w3?=
 =?us-ascii?Q?+akISOIeTX/4D+mdRDlUFQg4u2oktYsNH6XvP9KtmQTgdjtWODUFRurZbMoT?=
 =?us-ascii?Q?XkmRr0lvk1jVgKQhWJHZ/6LpVQ973iWsN2GSWXgd9OYy+61zF2JavEXR0K9u?=
 =?us-ascii?Q?qIzmTTRRAGfjRF03k1AvNXNVh9fw6w9YheAnN75YYmoXVuDl+VJfyx/L7aGG?=
 =?us-ascii?Q?oy52C7Srq8VsGkTph7789BjuMeYmYQt+YBJfSh/Mnt4CqTqmxRnuheW+oN/7?=
 =?us-ascii?Q?fGnH9uD9itck23p7kjkIuW76qAnjhhd9/nyu+cYPDrPd00PQ673zuQF+3ayv?=
 =?us-ascii?Q?fEKiWffNrAO3c4I6V8hQmTE9AUlGuoexwnKMCo9VVoRO36b+Qk0LDv/RmB65?=
 =?us-ascii?Q?ADeFo8h9x71FcSTHdO5QmWJ8m32zLpNAPnPxN54gE4GNV8zDzW44ILZ9FTtO?=
 =?us-ascii?Q?iPluc/9ybfARBDcCuCTNwrnWVfPRzb1HYveFaAw6/O63ZehgFsc58/WJKzPy?=
 =?us-ascii?Q?7Z2ZxBClgwgT2Dy0AnHlSfY71JvN+1hYPDZl+Vpsm3ryvMLlrflBh/N2RfhN?=
 =?us-ascii?Q?1DOFZanpgQL/NrQCjaya6gVwK93MHel6MQLBrR7uOJ4/0XoHN3rIkziFN1sU?=
 =?us-ascii?Q?YufD/FrPTR8PRzhHbmyvQk9oMim5uW/n0vDs2KVPhiVCnU5YEsCJxMxwczcV?=
 =?us-ascii?Q?5zhFb64ZH+m8xEeaNbu5FljILHC5NhHne5fuR9SkHhfz0bKe36YvQwE+0wlV?=
 =?us-ascii?Q?gwvllWeJqJtmF3vSrJRyhXSq6Q0aUNXEmsPNZtqtZ3FOLH0NMxr7jsVUTZOG?=
 =?us-ascii?Q?H9brGexMhZi1OvFN5jKO2I555M76Fz85tgv721Zu+RTgBfd4wE3KBQ22xRz1?=
 =?us-ascii?Q?Q9c83fE8bqv2DGz8L9b7jQ2kz9mltKzohKXfcLlLAUGQqD84q8Eo58YbZvzD?=
 =?us-ascii?Q?qj40c/1OwL7GOdIk8FeoSefkKV8lXQVEDUWr+nkM0VYwycsIw1Hv6Ns2xTA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209d705b-9c31-4ccd-10fa-08dbd030a132
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 23:19:08.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_161911_029104_794A08C8 
X-CRM114-Status: GOOD (  12.59  )
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

Add initial device tree files for the Huashan Pi board.

Note: The boot of CV1812H chip needs a rtos firmware for coprocessor to
function properly. To make the soc happy, reserved the last 2M memory
for the rtos firmware.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html
Link: https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/build/boards/cv181x/cv1812h_wevb_0007a_emmc_huashan/memmap.py#L15
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 3fb65512c631..57ad82a61ea6 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
new file mode 100644
index 000000000000..aa361f3a86bb
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/dts-v1/;
+
+#include "cv1812h.dtsi"
+
+/ {
+	model = "Huashan Pi";
+	compatible = "sophgo,huashan-pi", "sophgo,cv1812h";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@8fe00000 {
+			reg = <0x8fe00000 0x200000>;
+			no-map;
+		};
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
