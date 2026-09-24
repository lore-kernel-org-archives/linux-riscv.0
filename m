Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D03C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSWlvkCQoObSgoeUI1vJV+fG0Z8R2a3fU0oqeUlQZJ4=; b=DqpWiSSUokbwoS
	HOyK5viOxZEG/OddqGFsteF+3xDdP692XTFDYmdul5pARgCSL6WkQeIkiPc86GYLMalyHSgeIuhl5
	uL8QL6KRMs6As2jlWruZ7yrii3LgpS3PoeM8qfEEnT9ZUU46YzB3gMPS672Yx7TPQ3mRqbjT46kIO
	WXw/xj3iUl25JDJdJYd9BosQwSbbxo3D2CPFxwOMFTYVTG/L73vnGJs1yBIvmU44VOMMCvVDR9ku+
	5ku49ziBVrLYAADWZt6wN76INJ8S//NUYGnj4SX/sZ70Pb+YmPVy95xo3ptewSnvD6CqkGBPklbjc
	cRCZad+d0gDwJygr3SCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9exA-0000000AS5c-0QRn;
	Thu, 24 Sep 2026 08:37:16 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ex8-0000000AS4R-1Ehm
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 08:37:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgVZQPPJSQldUzi/W44klgnynBxQ+Qp3G8zHn1s6FENb4gl0+aghEIVNFA7v6VxNoOCXSJHVqyaqhpzif9x9fpI70eq1BFVv7Tvm6/VsxMgzBCMxdarTQKLDZbrkQr7chF0qm4cvT4DpUAjcWimg2Pe3A8rAiYl2Ie5InRegLlNY+mfigD/WK5oYDWTkKXryFsnkfTa26K0y4uh0KZ5SsRhBOfJWV4cAtJu4V/zgJUAkKjdavKLRUolWi0aK2SOhlIe8hFOwLckNGIBbutuRpwHTW9L6u/MYUaCgHLaczxRmK54iyfU9yAP8xEYmoZEybg+oqapfFVUoe7YDwlEtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/ZkOLmU08FYbuIo8XyUwXu60Ybk0YSiq629GQmtloM=;
 b=nZFrZ5FgZaWAHJ7qTfMK8TFeeopQmFALupeiouY1vYvTIB03cC0gRQ2A4NFLJLoezR57hmvqKjhQApg1t3iM/S1Wt/KfZ9J9xTo06RDk3weKV6tcZFnBRbT+ITAfXqGYuvzxOuH28/jzmIXO70pWVKBcdnVAzfZbc7pITQ9MZYtlKjbCAYC+vGCjJyQ+8Pll0ZQHVOOFc+fgxS71SJaIIWtZswOeaya+oA7L1viRXIhU2/6KO4xk+TqcSp2eXrMB41gejEijrJo0T1rNO0EbOj8miRA+LZQE3wMdaDcBSYltDwcHG4AeGO1LkagW1Gn/QGF8KxcEkowf2eEKMTojTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/ZkOLmU08FYbuIo8XyUwXu60Ybk0YSiq629GQmtloM=;
 b=sjwN956KagDPTFJY+fKLKrpQHADIAO+Q4GajfNNqUPkAcfvbNfIJpJVrAN/RogbjBbaqi8Rfd+fYXIV0I7eIQxR25/0xkW1Qk9Jzn51JWssi8A/FTP11e+fM/1XWE5vCpNW8ctnCmIcDO0v/YmFiArBOJl9A0ITuV0S1QA3rCnPWIWOozUj/GChiDAW9mNqZrfiOrwtDMCXq2oDNAmztncnijTwBTxro8i/BO9gE8e3S7DKO528Hed4HFSr78oNMRlSmJsbaO2mCnsJA5Pn6MQzfIBzKe0Phud7F18a6cH/TPD04wZ/aSBsDpt6YadD1k8CxE3vCvPynQcfoqIczaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI2PR04MB10286.eurprd04.prod.outlook.com (2603:10a6:800:21e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 08:37:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:37:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: tenstorrent: use regmap_assign_bits() for conditional set/clear
Date: Thu, 24 Sep 2026 16:34:38 +0800
Message-ID: <20260924083439.461769-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI2PR04MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: e22f2239-f164-40c5-07cb-08df1a170492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: RzhmynzIi6a976zZup3YBbstVj+htKcpS7H9bD7jv1K8JAEjcP+kZvxBeqqbwpN856pDtnSoSxOYYQu21CD/VnmthynnvaV3tEJaBgdYh4Nd6I+jZ1PUYYtqwGFTHLQ36H3X4onPi9N/TbDhvxMinL8gmpJvMyRSX6Tvp64s7Tppuq6mgYrSrz/Fj/FwZnFceU0OnhoOFDLR+vc4/sStluClRE5aCEJ6yyNpwD9QUbTBasKneTiM/KyQgPKd+UyziLTMLkFTIRdy0TNR72uA9lekFak/NTwnVwepUlbuzII60ImnGnSEkuHNeyvnMqIZ+gVl6W3ebPN2lEJ+I5wYtUYvHbLuDhnJIrwBpfTXVOpylWtP8I1BsiEytWJ24Vn6Ddjdj1MPiojB/0EHp4kWlWSSz2X6CJ3J+Aj/xxMafnX8XDwZroITCp+7L0jyDZgF1dnGztRdt7G0NG0WPqZmFeQsy6/Wp/7NFbbjvCGTukKGIzfk98g7n05nDSGCoT8056cIDB2sTco0RWG9tcq9J15z3QRQJPCZqom+o3Wpb6usWyDMT41QQO4rE929I27C+S2TxsTEJ6E2pjJ8WT0vy1hE5hNXpLI6GV/oRCKGZVaKluxcL0ZwxTAY0D6+VlBK//k0zo7AYHvjvK0xdcsh2vp8+WnXdI4cbn0al8SkzsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XtwpQ6LhXbTgIHZhFgzCPT8mFoCLubnbFR+mq5rAZZtgyE9lkVIzAouiZIWk?=
 =?us-ascii?Q?eDMcsIJWHkbhyPjWfpgzVAnGaQ7jdJ6sc+nW+jJj/fsKJD1TG/AUEJ6Z8Uem?=
 =?us-ascii?Q?EtH5iBddaFiEYartQ01s4fUGfDFSUa1IwhphNyqx07tEdCOkZ5cfIGEfZTss?=
 =?us-ascii?Q?bYUVOuATO7V1jyAP2xYVbk/4T/U2XUh6r4Pc8i3J+4n/vF+gUBy84jW9ibjQ?=
 =?us-ascii?Q?T1pqKWZynmE+j/TspXyTbejYyGA3YbSkV/9rjNGsbVC6HKobH8b4VC2caK9Q?=
 =?us-ascii?Q?iFGex7C8pELsY4KsAUaNAU/JVEFC3Yah/w3DqLS065xLmqX274LJmcnHBy8s?=
 =?us-ascii?Q?UghbEkmqRvL2R7EFlGcyZ5gxeraHKtEVrFYcFZtHea/8Z+Vbb9zsrJxbj44B?=
 =?us-ascii?Q?V8SgwKDxHvH7xRa8xFB9Q+3Z/WN3NhlDmelhUe1PFqDWh1O7A1oDZzDMu4d+?=
 =?us-ascii?Q?VM6H0APUb6ynAFCPvJvyd4195JaRE9tjlwS1Sqc/E/CKMPFJSq7CO83v+UpJ?=
 =?us-ascii?Q?VPwuAyBLcAJ6tFA41fiVrYwrh7En5x3EF8tW6PeJ7uMiCb+18KiOlMOLoAt6?=
 =?us-ascii?Q?LJHvV5Y8hm2+Iy7gd00sqklYw+rCpSf/LpUlSHhOE7T85ttbBwRTBwGLpBwg?=
 =?us-ascii?Q?k+8ZJu2npPJLF+dWtV+MLBkjgn0YqDStHB+4dQo6EdR1VpDsO0QNp40KabUW?=
 =?us-ascii?Q?FnxoKxyONzh7S63BNEsaPyoeV3+0NcERUKEwNiB+qsdL1JO+OX/gXPzwJ80u?=
 =?us-ascii?Q?a0Pj9F1IPkD+3GxufDbA9XMNUSHCd+bKBdjJRBcwnayU7MszbFV0USkG4scU?=
 =?us-ascii?Q?9x8GCVjI/joANTynu9jU6LgPzMF6fds2/hH6HDKgDAonD/xUa1K/dWD7TGKn?=
 =?us-ascii?Q?lDGm1xOpUwSaIZR/Lv856ZoXStukpb5R7Nv/4G6PVgyFE94dn6gTxV0SqaZs?=
 =?us-ascii?Q?MAoBQXpNggD4bNYnLQn5Uvukiq5CDjuX4NwRUNDxXP7POc0t/vKUXbCl7XY6?=
 =?us-ascii?Q?A6TI6WOOVoQZSBZ2/azw0Kx5mAaVXhhb5HzzQCEFE8PLj4KyDkC67g3R9h+/?=
 =?us-ascii?Q?xESNyD+/GrppXE0qt1Kt0TYEUDweDa44cwbASZ0bqkYUG//sb2yRA1SUOQVf?=
 =?us-ascii?Q?zJNOaXraEd7H7INv4ThqrYSVZIEHC2u6zVJIFCpRbvpk+mOqpTfw5g9/oBCk?=
 =?us-ascii?Q?ooqw+dKamPQnoYN704sTB5b+ZmoxAAXbAxF9h0Ss4rbTy9lpsMhrMf7JgUtk?=
 =?us-ascii?Q?ahycvZXFmagN/POfIs4AICjajqggSspLXoRbOaEsgIn5DvnfnWeEPGWrKp2f?=
 =?us-ascii?Q?PWyUDVPU4OquQWvZS1DXm90envyypuzTmgy4+XfdXvE1ogvnz9qf36+JJHpw?=
 =?us-ascii?Q?+mk7Zc5t26Q2hLepMdYLB1QBxjFjS8bATGVZu44GPQvJtK5CezN2JKvuLin/?=
 =?us-ascii?Q?pNdrQDBERsTwL71WkeIp3KctJRBL8caVlFmIE02fbxDT1944y8OPkZ7obBmX?=
 =?us-ascii?Q?bOT6fvhzMB42+HwuP9BjU+zge2yD+RrEpgU2rl/xrQ/ppUuznd/mqoRQEy1f?=
 =?us-ascii?Q?PJaypHy9SAqMNy2Dx55+xNUG0rciZmtI3/WxdUU2HoLMjzm5AXBMXbojnMNv?=
 =?us-ascii?Q?N5+xr/CLAmmc7MvafYodDQIqHZ9FF26Q9Ms4WNGJODHgHPwLroNEpSIwSEdt?=
 =?us-ascii?Q?g7ZHzVYX3k0spzDkncTBPb4b1pGMnHVFKeOq5U1DV+zgkcnHkMzR0pKffFcF?=
 =?us-ascii?Q?mUz6lhliKwVYdxWYjG9OLOY3ESJKsFAeCwPMHW1fBmPNNT0NiRQ2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22f2239-f164-40c5-07cb-08df1a170492
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:37:07.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9OLxD0HDFNKyacjIhSTI99mexSpvtGl2XoCn3lDcSRw7MSa7HyV9hJIbiR6tpjv8Xrz5ZEasQIJrbRf6jZsuxaHVGsM4wpkbEvtq/aO3VU2hUmVp/na/5/79Fnu3d4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013714_338726_6C9E090F 
X-CRM114-Status: UNSURE (   8.64  )
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

From: Peng Fan <peng.fan@nxp.com>

Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
the simpler regmap_assign_bits() call.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index 6d4386eeb7dae..854b9c48816f2 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
 
-	if (enable)
-		return regmap_set_bits(gate->common.regmap,
-				       gate->config.reg_offset,
-				       gate->config.enable);
-	else
-		return regmap_clear_bits(gate->common.regmap,
-					 gate->config.reg_offset,
-					 gate->config.enable);
+	return regmap_assign_bits(gate->common.regmap,
+				  gate->config.reg_offset,
+				  gate->config.enable, enable);
 }
 
 static int atlantis_clk_gate_enable(struct clk_hw *hw)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
