Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF1CF855A
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PuZc9c6cSdKN/ttN6kMMtdEab87g/y6LPJCNsF33iU=; b=RO3EyjuJ6GpI0L
	Ljw6u+uMPoEqdp2kTRymVfIhq0TGwMRap40C+lRSsSyQxc5zoX99pTRqnQ/52E0l67z7JzIKI+4wD
	atc0hYNKJiUXO2UOZae70A3wCDSkpitePcSroL6GMvSMrBWEpvRSXaICZ3wfO+FE6zgZmPO1cNXFl
	RwNIBQPs88wzL5nNqCu7kJzXvKKzASpMGNNYbH+SWvqM04bS64jz4Qtb0TExCYfvOs8HO/2FPvTEL
	WLHtHfjYer9yC36S2pUnPwE3g/KV9VRItYuQnYulXJhRlg0uaBPw27tf0sI8dgipNoIgUQw4eXzoO
	SvWuzxmsoXZh4qFedvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03U-00000006M2t-2RJe;
	Thu, 20 Nov 2025 08:30:16 +0000
Received: from mail-bjschn02on2093.outbound.protection.partner.outlook.cn ([139.219.17.93] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03S-00000006LzI-0SDi
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 08:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKoPhbLRtBDFQZOaVo+0orPu8Qcrtc/xzfJmPG7DZG1q8tJ5Yvhu2Fk8FZHvLLoGObtY4t5zdyoi2Mv2NL7SQN6sK3zjW1OPg3GxZjF1Wz/eyFncPp09tmiV+nohig1YBBcKEWGMlyCuRUfIZnW6Erx/lKienKvI5+haFUAOl8vTO6JdMH48TDoSwVMompKHizfC5HMs7VWdjYsgLtrzT826pdmXSFzGe+Jy/sYqsGmnOmXwI0tXswffiSMdYc+UN9GnC+aw7nTNSg1zEBdXDoTgnxKF8722afzJi+WjTLw7bRayGq1OQcEyC0GEbymj5ObB4GjQoSZ7L2EXkG431A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kXPRul5UgqNQ91FZuNxL8MCd5ZCkwkQkOLYKss6ByM=;
 b=Wl5thsV4a2vmhIlt7p3dnMLxjvWNZ98k3qrZpmi7cOwZzx+L1OW18HMvPaA9ewxi1fS1JPRpgCgv2wLjWRS1io/0jcb+9UYt1hrze89pcPbaJ0v4KyiTBZ+qB6WpXTQjT6nofF6UGj2CvyBZCLejppIOlZ2ZBG+UluGynAHstANJVVFwn4N16Kra5GZBb1fON7xOck1PR79pUaS+XQvRWDJiHknR9VIaiIk0BwsDJLhaAssNbdufaddwZHOONWeUQI0dhEbH/GZhH0tyhGEsooGAnedaa8moDpfMsQCuZMgsOqgH1B0CPyUZqIb2gE5H2ceE2ixUtc8FQOPeW9MDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1275.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.24; Thu, 20 Nov
 2025 08:30:01 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 08:30:01 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree
Date: Thu, 20 Nov 2025 16:29:46 +0800
Message-ID: <20251120082946.109378-6-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251120082946.109378-1-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::20) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: 86458f39-78d5-4090-c2dc-08de280eff91
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: O/Xd0dzkltbSJv5ba5l2uGEwFRGyyhDHJ17X3+qwy+ffXraCYIh84xsXWTEiy9huVABENY84DDTYiM8tzgSDhJ3WcXoQt6kJQpQRqbYrI0f4kIwhOV3MnwwFkz7gt6HHniL/W3SRYAtnodn47fW/sp91ahqfjdaFGtFYWdRQGIBmfFO5dOmGMJjEYme9MQMIGMA1lQOfvLMAZ9tgI9fvWTWoBWdXN79L3q8O0/9SH8tqbJ+QD/vaSSYMV6SzN2PV4gGnlKYdnYH+6PCkFm1yTwBndd0HYW6VDNM9uhtSUlJjPk6rfgo3Gh2500WPuPoVMe+XAOxq+YuKqp4c8LTdeTCsKtqDRmPhbqVT+nJ+V9K3JcXcHXwnd0o1V7UL7KB970/r9M0TVWfziM5k7HyC3o5XTuF1zJs2BBZS72E8u1q+3fygz/BdOjOWL+Z5z8vCcv0V7Q3aszjKURvidzsqgj7zYgd/0kQuxFoSPCELvp1oMlbni6vTaBFIcYoZ77OHAf7NhZZie0VaEKW0AbNOFPJdwc3AJdpdFpFWWWHSXn15EtThgY0X4tXZNufOacb6yeu9fsfRGjvrF+T41zj7WU1qyN4tOehkcfJMsAcftIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MgZXMTjihZST7y1d0RtUl5v+BMPdhLMGOT5GInDoULpXHGKLVg6v71ySRoBg?=
 =?us-ascii?Q?buJsEwDEqg/Sh04MUTvo93pQr0zz/bbTWpIhM0ysiX0mqjll/JwkkvIfAHGM?=
 =?us-ascii?Q?4VzGYtFF6U+ODFuTmAH2jIqQ+V1juU23BRYdLEQaUTM7VOjrDBlk9aBlIM7Q?=
 =?us-ascii?Q?ohz5nHbC5gvU/Chh/O/3oJHh1sqlpwbHGaPGV+QHzujUwcmQxWs52VBF6xHI?=
 =?us-ascii?Q?RcF0Nm5R4EtBTXHa6iHlELEH2YpYtctaEb+a/JEIHIRVJO59cx4VOEdkqhZJ?=
 =?us-ascii?Q?+Mcp5efTwDl/rjLIRgiMoD/fzl1EUMA7Pt8lheulnWK2vF1GVVkrm5uueR6i?=
 =?us-ascii?Q?uAnuJbRHRvBtPmiym0eq8Dp1ftfMEL/X4f6mDqvhbu2NYJeT4NbgMZyP9h58?=
 =?us-ascii?Q?6VtW6AkCiaMwDi0RbV3aBYTmQRUwqzUkcdc0hlXG1xG40qMKKVMqWsAByBla?=
 =?us-ascii?Q?HE0F4IpHl5m87JVRRWWoa8X5fl/KpXLsE21xqctH+Ur6OpyiDmdyi0BPHcJS?=
 =?us-ascii?Q?xTub3ESlxgqp+Qxm15vHP0tcFFYaMgd96XH88Yaa7fb+hDxaxcchFchl4asl?=
 =?us-ascii?Q?MlB2yqyqP/hC07lDxun2/ea9BTGTLWByVYM6p938Oz2PxsmyP2i1EX8a6f5u?=
 =?us-ascii?Q?8LyQOI0S9qnD7ilCa4wqTbos71wv+870uR3p6+xZ/+umrrfpTM3pDrRwSbiX?=
 =?us-ascii?Q?FvXJ4kRGJSBHh62j8aXHMXgXLvtywFZQwaodEno86qdNMMsDeBhXrWlbgyg7?=
 =?us-ascii?Q?D3hnK6G+ezb7wS2tssLRPdEm/IFcOTJfrLmL3RN6tisbIpgcJO7i1hE0dBcl?=
 =?us-ascii?Q?374sq5pDlA4mISji/QO1ouvS6TgZHadeO8sUSBVWIlRHsnt5H16LRGpanAeT?=
 =?us-ascii?Q?rfMc+OZZj+hRoMte8Weg1syU9QctwURl7gxQ7Aro2CT60n/Ab3HUADN0ZAN9?=
 =?us-ascii?Q?tkgtgpuLMghF3C+3K6cbuS/wIe+5y4wJ2vVOLUQUATJEHf7it1S1bCqMffoC?=
 =?us-ascii?Q?cb5fD2aGCWBRjxUF39BwZygab0ztzXYZCurS4MJnbUGL9Z7G7OYzcXGrJoUU?=
 =?us-ascii?Q?KFo0/JZnPyK0SRwLfSsPpHF0FFB+mXQisBd0y4PVt4ArV91U7E1kJ4V9gwzV?=
 =?us-ascii?Q?eZzhHPTQUPJpFA8zTQiSmx1LsOk+lW+eiLPXO1n/BAVQOYPNsoElh3zvPq6G?=
 =?us-ascii?Q?VhusDL4GMft5ewA1v/Kjlcoq15mzgl9wql9x948t48pqwMoQE68CUBYoad2S?=
 =?us-ascii?Q?bQ6wWK9uE9gxmAE8HaNPvcPnKnXVQp9TARQKy2OB6BSoXEqepkqRUckZo8Vs?=
 =?us-ascii?Q?wHRROwvJ5KU8Tgmorhs/7sxMeRGmdjiaAIl94evWZO5p/AFk+SHonSHqflGJ?=
 =?us-ascii?Q?V2wrwDJu8/Vi+L5TcLuaTO1lLbGFtVwenHEXb3aXP9o6+eL40QiKkijBLTXI?=
 =?us-ascii?Q?fdroUpCJ6ExeoSpI8yY7itzj+pGfDupHz61lz2Uk/rUwougnFw9dXg2v9n5c?=
 =?us-ascii?Q?ls9faU3jUZ4NVSmzF/RAOOVXL1eINpxK/J0nVec0klHFje8th7uJOD93VIpp?=
 =?us-ascii?Q?P92sfUnPu8cjCG8iHzs9xnxUbJlYLy3LuI1lFl2UcEgaScJ/UxI+UltL3Fex?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86458f39-78d5-4090-c2dc-08de280eff91
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:30:01.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdjJ5LS+/PlKRPf4Z+zMVWspv/8vxzv5HPT25Gm//+VWnd2J3ttbmoYy7ndK3c/8JtGyFde05V8d8OodZO/Nvf/W6Eodo7V+NHzhCRdCXLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003014_148766_55F89A44 
X-CRM114-Status: GOOD (  10.82  )
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

VisionFive 2 Lite eMMC board uses a non-removable onboard 64GiB eMMC
instead of the MicroSD slot.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 ...h7110s-starfive-visionfive-2-lite-emmc.dts | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index f53109253d41..a60244803829 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -17,3 +17,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110s-starfive-visionfive-2-lite.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110s-starfive-visionfive-2-lite-emmc.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts
new file mode 100644
index 000000000000..60ce2753f2d1
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
+ */
+
+/dts-v1/;
+#include "jh7110s-starfive-visionfive-2-lite.dtsi"
+
+/ {
+	model = "StarFive VisionFive 2 Lite eMMC";
+	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s";
+};
+
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
