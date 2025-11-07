Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1F8CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QxNZb08d2StiJh0mwPFDnV5OU9LWfGaZ9u5k/o6g1M0=; b=V9VoucSk4Vo/Yr
	JTQAQ4ZxbeQoSjSdtleDovLwNxcSj+m58w0hWitBmCYblbgi37MdsVOSDJuPoO9lbm7qIv91aYhyM
	6vJ9af8moszAbymoDTLJdxH7WNc/e++Eui8PFN+qUxTE6NHYDwCqH8sxscwnfZ0XLir/lAyQ21IfM
	cOc+nibBLqchTeBfTQ9uQS0mF16gzBwXA6WApuna9QQDaWNjok0kQPruYBwp0MnKSFRCA7Fuo1/Sh
	wgG91Hyru9szwxMOahZwkPyeHt202nbRZBiqpwr4/xH/oh0nd0ug9Y852o5xerVB/EkWKRUb7wcIy
	QlzbghliTM67MwIVoysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJR8-0000000H2zy-0AgX;
	Fri, 07 Nov 2025 10:11:18 +0000
Received: from mail-bjschn02on20730.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::730] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJR5-0000000H2yU-23jC
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:11:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2i09JXVeY+2u9wVzJqjvXc+5L4Gxpi4ViHcXmenOu2+GwxvuIwvW4g+F77UQW5UHnRN4uDC2PG0EVmk9eOMEdZhNEPqooppvda+oWY+vcN1m/eoL4AafTjYZeAqt2dQ6bI/w8aCEljvPYJh88z2QF5M1wGwrMRmb8VOrWwQn569z0dRnYGcxcrYOwlwtRFO89XPYq6SqgxFngrygmeDGHbZjWqcQbJF05XcBcE0N2JuYAFVDiT+rkQnSz8OWr1S5R1b132zj1IqSXHTUX6R2lLom9CpvNUIACKbO6YeIkL8E+wOWY/D2dHCrsTi/yYzi6tTKmdCrs1VC7rK0tP+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B36uPPFaxJrl6AYLQbISFQ8hcy+svDrisgnkJ8kLHNM=;
 b=HQxG4eoYFEMk85wJ3a2wCTn8PPM7hIozfCTv4VDsKHUC3n7ezRt7GOE1/9yyAOwwdmqCy7Rl0av5O4U3lxlDcrja9b7HEzIH4+f5c5X5UZCFTgQ9eWUZFWdykoC/vRUD/CkzGFJrUltdTDhm1FZZP1K3072atR3pFgXyMllF7U/+QLvua0nHPeqX97LS77QaVFdmGPyGYuBmjZwWddLzygkpopUJ2pMmBEZawhetoZeTA5t0nMEFKBonU5LzZo45d5zcr0wBM4Jcui/3d1fE9BqeXh0s2+AMctL3lnrsp1u4sOArSlxge88KTvMELcj5IiwkNXG9blg07wMwbtDKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1305.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:55:38 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 09:55:38 +0000
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
Subject: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Date: Fri,  7 Nov 2025 17:55:22 +0800
Message-ID: <20251107095530.114775-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
X-ClientProxiedBy: ZQ0PR01CA0014.CHNPR01.prod.partner.outlook.cn (10.2.0.83)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1305:EE_
X-MS-Office365-Filtering-Correlation-Id: 798507e6-e299-4257-7f9a-08de1de3cda7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: dul1ggSlDsHQktjofgMvpqeqt1gLdlLE1RL3U9ppszTIvYDg1/ZkBOpoNlguqBBb3+Qb8N+wVmkTLnfsE/J0eay4QiSBZlUCC/CtxHhZGriidVyPGjULgsAZbp3TQAc/zFyRqdl/TkKlF9R7RdZBlSRbED8OcpVvUIBjWhB/fePzbUh4TVmYzrhpy2KKa21p4t1J07sQ1SybdGpzlM6z3kxYLBUDwFCWGIwQefVB7ooLC579fiogget4r8Sc/jis+mM5i2/Garz/JR3u41E3/Gu71v4VB7wUqvfQMIWooU39r8lGHgFZ0EaR30e1Q7fP0i5jEFBcwAwU2q1TkCtRieIprYn/z+DR26pPfmJI3IXZEEUFuWDY0Z9ZZ9gQv8ZEtjPswa0x5QI5hBgotpH9QlSb7AsVEeozqkEegqDcPeiupFWrfZf1XNrAtrIcWUtVMXU2qB0OxgOVdpQlI1s11tOrVeo891ntjZmZyth0t7+GozlELBDD67KW/IStIlim/xOQe+SEb5+KwV+FEH8B321yWNGbrF3Kv8cU6ALcNYfHo8mKbYKRLwGlqRTcYr0U6MyxGJ3IgcmxbN4XVFyUWBd8BRVMQUoVlObTjZcdu9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4STfA4W7heBRiBx3pItkEu4WLrE45RI9afh4PwsfFNlpBzBc8JGKRv7xhQCG?=
 =?us-ascii?Q?GZp/g7YGgG7/Nxk1lEb5/Pm3YkegcD2P2A0ZS1GC43OmR2zZQSFcX01oIzB/?=
 =?us-ascii?Q?dDzByjKfjVhCihWQMWPpq0hbbfp0vX7TU+LB7j3wpbKZb6ow6IxlM8n5ThlX?=
 =?us-ascii?Q?aftXT3Ct9k3u2PXIgVG58nf6t3e2cjFFj3x54Phc/QYRRV5h1557j0HO0fpQ?=
 =?us-ascii?Q?r4mrEnt+XFTpWUIk05m7JhmC8gu3cEg4Y0G4EFTXNhVbPNIuwZFIvRMwX92+?=
 =?us-ascii?Q?Ot/GQYcMPKoB5BFDuoqdhajOesRBnJ+Bray9c9StINOOd77M6JWNChU0uWLs?=
 =?us-ascii?Q?TMlctgs87AdhTSCahjEsVaRzDravFg4bMwQxT36UlgRUcG+G1dN938rJB0JS?=
 =?us-ascii?Q?99whnGgZ/5B299D1j9E4vU5Gxv9R4Ach5yIy5VkDHHo5cGBu4pw3oeXw9a0N?=
 =?us-ascii?Q?s2LWLVgkJ16NxRJu/4KxqMbCGzpC2fKIW4S9qfI3TC4eb3WGBoLTzsEkCEay?=
 =?us-ascii?Q?CXA9IJza9sxxq5uOfmSezzhI+7vvE/p/PRtOam9z1OZMK3jB+wENiJuvtj8h?=
 =?us-ascii?Q?3ajJvGgrP6CPAAbgJVeAy3Jgjzlq72VAPS2+f58eiFiKTQZoIq+8XywlsCDM?=
 =?us-ascii?Q?8b8L0Orq4iFdyoMMjeal8DZfeZwnhc6l8Zg3/DztcT5N3qBF7DoHMFay1U21?=
 =?us-ascii?Q?1cw34o9qrsrpo2+aQUAEM2uIv+RtCIwhJZrGvwJQzzH9wDVspUFTj2QF6RJU?=
 =?us-ascii?Q?pZUVHtU1to9gWp/jEG3bXBUJjL6jCmENpM/WChUV31ONkP/jjp+OtEzkgT+F?=
 =?us-ascii?Q?rJ3oFAT9lTqO+2R6JbafvwUrWD3Yy8tQaJon2SXwdJHa1ifNHo4B1jEBKpov?=
 =?us-ascii?Q?6MY/J3yGCk6S09vp5wAieXXVVuNfHNSmDB00HaiRoiC6RTYY3fP8sQb/s2HZ?=
 =?us-ascii?Q?B24q+buTWfXrqrhIBFuxIvDvzxgxYsu+0y9mnkKlnKN+3IkBYXwNaV10vIJ+?=
 =?us-ascii?Q?f25r1Nf2o5dszTnJS+Zfq3ANrVsxw9O6vpCp57E65dUkQoYmPeKFdsRhTogK?=
 =?us-ascii?Q?/vu/sVqcIqbKgwE+ugw+aKXzW4PnL2a7VmmeU5SuAoeB9TbvzpIiWHY4JODR?=
 =?us-ascii?Q?KgCseogY7kxSC3uWplRwNzFRv41tt6URwWhc80SneRgQ5xUAyjaCT8n4pyMb?=
 =?us-ascii?Q?95b7rNBsOKf9f5bsPGhFXMXzk0w6rdZZRqEiH840KxG9BqrB1bZoW2HrsgUX?=
 =?us-ascii?Q?Idf2zDWXTOre+UEVkFWiJpN4BOyaeAm2fWo5z/jcasHRSvZV5dc4XlhNOl+N?=
 =?us-ascii?Q?HyKAWQsX3lr6soubb/AYIX5rISCOt8Q7qtXMCS6Yi/POIU/XPwDQRjtbutGy?=
 =?us-ascii?Q?APCg2pvyC+t6eGgKRlwHXM8chVhZBaDGCv/6ZQYHV1Z8mP7Ld3PakaeU35fQ?=
 =?us-ascii?Q?wGzxNDuXj3aB8WpnMNSFhMwIJSwlpzUhbNtBmJ12FgrIGPrBW+HYtM+LXHvv?=
 =?us-ascii?Q?1owkbOUgy9Zq1Sw171Y4fHrRd7hP9zI6kzwaRmH0sJD560Lg0JOp7sWyJXRi?=
 =?us-ascii?Q?9eOlrzqzo77k4YcIXc9rv0xIblwMFrOe12hVlZkGnbQihKADpgzHGFEop9X+?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798507e6-e299-4257-7f9a-08de1de3cda7
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:55:37.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpsfoeGIE6zm9z5ndMhIcexrqRmEfb1Nekh8I9+hzZjEdYBMwXFpxK7z9ETtDmE8AyZFeFS0cDZb8tk+Mx/Xz1Je1I9tgTjFfrlsrxXfJUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_021115_523122_359B8ADA 
X-CRM114-Status: GOOD (  12.81  )
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

VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.

Board features:
- JH7110S SoC
- 4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 1x USB 3.0 host port
- 3x USB 2.0 host port
- 1x M.2 M-Key (size: 2242)
- 1x MicroSD slot (optional non-removable 64GiB eMMC)
- 1x QSPI Flash
- 1x I2C EEPROM
- 1x 1Gbps Ethernet port
- SDIO-based Wi-Fi & UART-based Bluetooth
- 1x HDMI port
- 1x 2-lane DSI
- 1x 2-lane CSI

VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html

Changes since v1:
- Drop patch 1 because it is applied.
- Rename jh7110.dtsi to jh711x.dtsi.
- Move the content of jh7110-common.dtsi to the new file
  jh711x-common.dtsi and move opp table to jh7110-common.dtsi.
patch 4:
- Move the uncommon nodes to jh7110-common.dtsi instead of board dts.
patch 5:
- Add jh7110s-common.dtsi and include it in jh7110s-starfive-visionfive-2-lite.dtsi.

Changes since RFC:
- Add jh7110s compatible to the generic cpufreq driver.
- Fix the dtbs_check error by adding the missing "enable-gpios" property
  in jh7110 pcie dt-bindings.
- Rebase on the latest mainline.
- Add VisionFive 2 Lite eMMC board device tree and add a common board dtsi
  for VisionFive 2 Lite variants.
- Add usb switch pin configuration (GPIO62).
- Improve the commit messages.

History:
v1: https://lore.kernel.org/all/20251016080054.12484-1-hal.feng@starfivetech.com/
RFC: https://lore.kernel.org/all/20250821100930.71404-1-hal.feng@starfivetech.com/

Hal Feng (8):
  dt-bindings: PCI: starfive,jh7110-pcie: Add enable-gpios property
  dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite
    board
  riscv: dts: starfive: Rename jh7110.dtsi to jh711x.dtsi
  riscv: dts: starfive: Split jh7110-common.dtsi and move opp table to
    it
  riscv: dts: starfive: jh711x-common: Move out some nodes to jh7110
    common dtsi
  riscv: dts: starfive: Add common board dtsi for JH7110s and VisionFive
    2 Lite variants
  riscv: dts: starfive: Add VisionFive 2 Lite board device tree
  riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree

 .../bindings/pci/starfive,jh7110-pcie.yaml    |   4 +
 .../devicetree/bindings/riscv/starfive.yaml   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   3 +
 .../boot/dts/starfive/jh7110-common.dtsi      | 653 +----------------
 .../boot/dts/starfive/jh7110s-common.dtsi     |  27 +
 ...h7110s-starfive-visionfive-2-lite-emmc.dts |  22 +
 .../jh7110s-starfive-visionfive-2-lite.dts    |  20 +
 .../jh7110s-starfive-visionfive-2-lite.dtsi   | 126 ++++
 .../boot/dts/starfive/jh711x-common.dtsi      | 656 ++++++++++++++++++
 .../dts/starfive/{jh7110.dtsi => jh711x.dtsi} |  16 -
 10 files changed, 879 insertions(+), 654 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh711x-common.dtsi
 rename arch/riscv/boot/dts/starfive/{jh7110.dtsi => jh711x.dtsi} (99%)


base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
