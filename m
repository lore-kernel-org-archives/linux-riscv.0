Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A95BC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6XhFeZll6E/GRTuWCKo4xNwFLdXq+k5fuN4Lt/2EkI=; b=kZhN6cgCuudNSA
	NN0Jxsz+hSbyeg8eo0h990KGMIHeqg2KKFOrp1cxY3dVUNLjWCktGq6fTawQ7mHj+wkY2+7p7IUR6
	JR/es7mPoVgAHUEgdhOQezeZpy2d9peyRBOlDeQKS0iSpFTjyxp/AOmscIOc3D8a9a1VGicsDR3d0
	CaPVobzfcjR7G8AmQ8oqgieQvxdSi2OtCntB+V7X3U+E8M3K3AFebBdwX+sZaR9zu32uvo8PT6QjJ
	t6z6aNQgAsH7AOsk9+l+pB2EsddPwYULi46uAKm/Pez8Bl3qt5Ab89H4a7JN8QW9txrlzNixfd8rG
	GHH1mVQB8AL7WF9QCsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo4P-00000008OiQ-0bXr;
	Tue, 13 Feb 2024 08:23:13 +0000
Received: from mail-mw2nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c12::800] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo4K-00000008OYq-3mVU
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 08:23:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuM4lJA4hQxsn3oTmYpPI42/dYLVdfebQ4DXaYQ7qCZvMR2iqCwWBIyhiryUVR7bpph8TlObUBgN2lmgjaRfWZVORqEHBtTiZH53ya05pnLUD04i7KlPkeSYUPch04XmMkIbCt9eKaRnsyFBYfeSBMVtAMLHRl4vxnVygPmdxuGsG1qU1HTyzNiu2gwvwJjzjD5x6hrJ0dW082ssI61EsdypoUVXexlkE++PoO8GkrPZQJ9Xk+NidQe7ONm3bEP5GoK8AMa0NrtZXVh1Nxg/KF3TYt5+1wwtTDtntQ9pLwZJ9vIdKfoKkclS8EjCsBXFA0+KBXgQU1R8tO4UTAGBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5EVYPyMQ6Ssb1pi2mYOBtHJm5bApOCfDNS9pVj47SY=;
 b=a69/6LnkKv772wO+626f+4Mp6zLh9/kAK1HjJ7p1iyHYbjSKy+hMim35/Ye7QVT44ze5BKFc9EIDtRdjJNISY2WaP3kRisn+GCHuh5Kz/BXxU+f3LuPpSwEk9gQ6rmoKz1vHRgu6X4hNixWJgI3OzZEMybYfP49r4ru0jF6YUTcCFmAL27d8THonKBfoV0gN63oXomu1UXRwq5KxeUTR2OvykoVLuob8ke9YRdQj0yzhrY0brdRth8EWfFo5krSqAm58CwfZbTOtR1RufeICGLcvzWK27xCpmnQh1pVPIpoJ51JdKW1VvdhWg0cyHtYIY2Fo/rbDFZnhmeufiHoKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5EVYPyMQ6Ssb1pi2mYOBtHJm5bApOCfDNS9pVj47SY=;
 b=hrrGPtDXAI1X0pjw7joXJbha7VgDZPWuIkttEoCboglrM9UXdl3ij7Yo94iUmodjYzKkbD0edbp78eCHq/L11UTY62vqJe/R+nhCH6WM9faexXa5lmEL1vtsWhDfnySJXM25h1p3oSVXaZhkUrBU9K6BFS5UXeolJU1BS2S6fBdUmonVG1Pr3Ca29hY2JBtLQ5T1qGAJaU15+1/I2x8aajTm5pwpcxzij3Jdo5KYSNG/bwNXyyOK8dwzOCDSh/eAKjMdAREV57+nd1SziZ1KKTDoGOjTmsXv+eUGbRxdPOc7z6yf4mflKA7sWxLxX9tGzT+3Tnt7dgUl8ATEM9bUGg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB3776.namprd20.prod.outlook.com (2603:10b6:5:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 08:23:03 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 08:23:03 +0000
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
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 5/8] clk: sophgo: Add clock support for CV1810 SoC
Date: Tue, 13 Feb 2024 16:22:37 +0800
Message-ID: <IA1PR20MB49536B032E394A0977EE5288BB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <IA1PR20MB4953366482FEBFC5E7F6F34BBB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953366482FEBFC5E7F6F34BBB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [VBW7kpSrGdknDZW0f38glutdFmnrGEKpSDsOjXPhKVLEhl/K0ordBBUM/oUvdy3y]
X-ClientProxiedBy: TYAPR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::33) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240213082243.591875-5-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB3776:EE_
X-MS-Office365-Filtering-Correlation-Id: bba5dbf1-ea59-4f21-cad0-08dc2c6cff6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnDNGhipW2Lmj+PKXFGq1GFXdn7vXJxijTnC1eZaWbKj4mrcC8TdRIar8oP/PkPfNLwHoD+zLmL+PrZnSN6BOSGxKTI+0Z/Wh6uKQH2s8FDRDPXJrmMA20PaYowxOCrJH9PK1UFa75gkKLJ4QdeYcg4uesQMDmbhqtUDspG4LQz3cFxqBOLwNjA2jFfbzJAyXky9fAeSJYK1GY5RDlH6+Gey/Bq4/bwdIY4RNYXCnsdiuuOhPW8dQpEch/7vk3aBvHNqSYtXNayDVVv75CT9OENt1W5HWOURuREl9I1FVkpwVG4gcdX8hywE5t8eDj6Gc3GDYhUMX3Prym455E6pEcdaR+fXpBXntjzhmq1XySml05XUPxT3j9syOglL661Y3hRtlcRzTpwosTGHboIakxGeoTaX0sxavfnNaJ/vGUJm8u1Pmfzbl5ndWpVP8W6BRofA7vyCdHFiVhE1hyoeGaSaKjdWxvxS7dgxIwxSytFyA5KJGl1DvXTQSt6MIEXSQUCxRD8rJfzg1PZ5R2s7QkbbTUgkSXiV0TgFSFSJBS5NwGO8uAY0dGYlvPcdeF3JE0OT3fihRbuCOl9VuPb543zp3HwEWm4gd347uyWrP0GeRkXORemq/37LXChPSztQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KHnW7GW1Scn94lfFj+yQroVSyEvqPDy4KnRQ9OB9jKOD7kDSCJj2W0L8Ehy/?=
 =?us-ascii?Q?QIapi2LA2G97KE88CZS5q6um4mkntNI4al7TMYn1RUxbCbupYO92Wuwl6xaW?=
 =?us-ascii?Q?5SqChB8D2ruporLpN4tqoyXZCJOK+hX0DdpnR8cOzHcyFaksXUG7AddepJbE?=
 =?us-ascii?Q?QdXP/8ExFRuGHUZYx9X9uA2WHPUoIR+7n/WALrKfUHJ0zohuglMhR4y51iQG?=
 =?us-ascii?Q?63PibJCvUgFRjtMLOptsXBClpALPvMmITz5IMG1ckip8/41bicMC/6HFHHlj?=
 =?us-ascii?Q?yNwEVLie9riSMhWxlSqFLKbSKMaRA1CkyzPtCxol3f/pPrb/fUdH/R3cEENQ?=
 =?us-ascii?Q?EG56VldwPxKtBsfHh/fCxNAvRaBQQs9d5c6iKekg2soZC1rVSeqa3CEXgOvq?=
 =?us-ascii?Q?WsndLW+ahMNop7WEq4pCtquoN68LhUk5gH91ntsOHSQc45EFe0Tc7EfZHgsQ?=
 =?us-ascii?Q?4NpoA8RUr/R38AKMr/jglCRd/TR/0qMzSnsuigq+rCATzq18aEsFE2CpMvsV?=
 =?us-ascii?Q?Ira/+Te4NhyrSzdc0qZCdecl2uFR//Wu2Yyt378KooEnUPAq8H4aosdNYDaN?=
 =?us-ascii?Q?zbbS7Hhtx87nlsHoI/XsxKhxXO7MXrg2y1IFsZcZBY98k5Z++QXjF1wb7Lz6?=
 =?us-ascii?Q?EhaS74eMd+fSTRqUp6qamV8JfzSqZwE6bzNar2Z+NFhkRBOR/jtCTQgQd8Bx?=
 =?us-ascii?Q?bYqYAP+D9JUZ4VEk98NbLdsTEtdgz5KY9/uGiNY6AwuD5CburcXgGonQKsar?=
 =?us-ascii?Q?E/T3aEingcciaN/KHrZbYkyJri6TQ9c5Ve+3Pt7bDXvcaTzP9mkS5zV4L3wL?=
 =?us-ascii?Q?eO2MKgQcPhaRpIXzAu3dLrsQlYJ2pmkwwAb5P4t9DfPdAxfkw3LP1JA5ev8+?=
 =?us-ascii?Q?wHSJh2c37uGEwxBdWxHYoW5jR7LNQrFgm6wDuut07MMy5IhfS6h1noha5R7L?=
 =?us-ascii?Q?5tICaUJTVni9ISjz/MdfhbYnUHVySPnzlCnaje68xwff4/5Xm78d7HpCvF0t?=
 =?us-ascii?Q?jBZacShzEkQPofFITB6O+1rIAG51wc0pj55yAz6HKLcANRjvAJWFizoI0A/3?=
 =?us-ascii?Q?Pz13vlnLCQVxFsuIAklksXWZHbPJL7Zh81RzK25amEvJfJ4ydCT9TngsoTTJ?=
 =?us-ascii?Q?GYr55tAv/LY3nxGer2GZjCzx4/UPp3vMLSR99hDg/jJyIx+Q26DvFXILG3Me?=
 =?us-ascii?Q?XjvJOy/CbqN7KeM8gaiNnn3Q0/T9XfBc9gs8slQnLShtFto8bz3y0tMieNmt?=
 =?us-ascii?Q?L17XOFQdyuddsDTXpaxx0q2tuN4LPH8Mo60HhmCHo9X3a1lTwkHeD6pA17Dr?=
 =?us-ascii?Q?SUU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba5dbf1-ea59-4f21-cad0-08dc2c6cff6f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:23:03.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_002309_035942_D355267D 
X-CRM114-Status: UNSURE (   9.54  )
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

Add clock definition and init code for CV1810 SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8df248a19ca70837a3/duo/datasheet/CV180X-Clock-v1.xlsx
---
 drivers/clk/sophgo/clk-cv1800.c | 195 ++++++++++++++++++++++++++++++++
 drivers/clk/sophgo/clk-cv1800.h |   1 +
 2 files changed, 196 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index 6a78b1915f6d..6ee8ef56570c 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -631,6 +631,10 @@ static const struct clk_parent_data clk_vip_sys_parents[] = {
 	{ .hw = &clk_disppll.common.hw },
 	{ .hw = &clk_fpll.common.hw },
 };
+static const struct clk_parent_data clk_disp_vip_parents[] = {
+	{ .index = 0 },
+	{ .hw = &clk_disppll.common.hw },
+};

 static CV1800_BYPASS_DIV(clk_dsi_esc, clk_bypass_axi6_bus_parents,
 			 REG_CLK_EN_2, 3,
@@ -660,6 +664,11 @@ static CV1800_BYPASS_MUX(clk_src_vip_sys_1, clk_vip_sys_parents,
 			 REG_DIV_CLK_SRC_VIP_SYS_1, 8, 2,
 			 REG_CLK_BYP_0, 24,
 			 0);
+static CV1800_BYPASS_DIV(clk_disp_src_vip, clk_disp_vip_parents,
+			 REG_CLK_EN_2, 7,
+			 REG_DIV_CLK_DISP_SRC_VIP, 16, 4, 8, CV1800_DIV_FLAG,
+			 REG_CLK_BYP_0, 25,
+			 0);
 static CV1800_BYPASS_MUX(clk_src_vip_sys_2, clk_vip_sys_parents,
 			 REG_CLK_EN_3, 29,
 			 REG_DIV_CLK_SRC_VIP_SYS_2, 16, 4, 2, CV1800_DIV_FLAG,
@@ -1243,6 +1252,191 @@ static const struct cv1800_clk_desc cv1800_desc = {
 	.pre_init	= cv1800_pre_init,
 };

+static struct clk_hw_onecell_data cv1810_hw_clks = {
+	.num	= CV1810_CLK_MAX,
+	.hws	= {
+		[CLK_MPLL]		= &clk_mpll.common.hw,
+		[CLK_TPLL]		= &clk_tpll.common.hw,
+		[CLK_FPLL]		= &clk_fpll.common.hw,
+		[CLK_MIPIMPLL]		= &clk_mipimpll.common.hw,
+		[CLK_A0PLL]		= &clk_a0pll.common.hw,
+		[CLK_DISPPLL]		= &clk_disppll.common.hw,
+		[CLK_CAM0PLL]		= &clk_cam0pll.common.hw,
+		[CLK_CAM1PLL]		= &clk_cam1pll.common.hw,
+
+		[CLK_MIPIMPLL_D3]	= &clk_mipimpll_d3.common.hw,
+		[CLK_CAM0PLL_D2]	= &clk_cam0pll_d2.common.hw,
+		[CLK_CAM0PLL_D3]	= &clk_cam0pll_d3.common.hw,
+
+		[CLK_TPU]		= &clk_tpu.mux.common.hw,
+		[CLK_TPU_FAB]		= &clk_tpu_fab.common.hw,
+		[CLK_AHB_ROM]		= &clk_ahb_rom.common.hw,
+		[CLK_DDR_AXI_REG]	= &clk_ddr_axi_reg.common.hw,
+		[CLK_RTC_25M]		= &clk_rtc_25m.common.hw,
+		[CLK_SRC_RTC_SYS_0]	= &clk_src_rtc_sys_0.div.common.hw,
+		[CLK_TEMPSEN]		= &clk_tempsen.common.hw,
+		[CLK_SARADC]		= &clk_saradc.common.hw,
+		[CLK_EFUSE]		= &clk_efuse.common.hw,
+		[CLK_APB_EFUSE]		= &clk_apb_efuse.common.hw,
+		[CLK_DEBUG]		= &clk_debug.common.hw,
+		[CLK_AP_DEBUG]		= &clk_ap_debug.div.common.hw,
+		[CLK_XTAL_MISC]		= &clk_xtal_misc.common.hw,
+		[CLK_AXI4_EMMC]		= &clk_axi4_emmc.common.hw,
+		[CLK_EMMC]		= &clk_emmc.mux.common.hw,
+		[CLK_EMMC_100K]		= &clk_emmc_100k.common.hw,
+		[CLK_AXI4_SD0]		= &clk_axi4_sd0.common.hw,
+		[CLK_SD0]		= &clk_sd0.mux.common.hw,
+		[CLK_SD0_100K]		= &clk_sd0_100k.common.hw,
+		[CLK_AXI4_SD1]		= &clk_axi4_sd1.common.hw,
+		[CLK_SD1]		= &clk_sd1.mux.common.hw,
+		[CLK_SD1_100K]		= &clk_sd1_100k.common.hw,
+		[CLK_SPI_NAND]		= &clk_spi_nand.mux.common.hw,
+		[CLK_ETH0_500M]		= &clk_eth0_500m.div.common.hw,
+		[CLK_AXI4_ETH0]		= &clk_axi4_eth0.common.hw,
+		[CLK_ETH1_500M]		= &clk_eth1_500m.div.common.hw,
+		[CLK_AXI4_ETH1]		= &clk_axi4_eth1.common.hw,
+		[CLK_APB_GPIO]		= &clk_apb_gpio.common.hw,
+		[CLK_APB_GPIO_INTR]	= &clk_apb_gpio_intr.common.hw,
+		[CLK_GPIO_DB]		= &clk_gpio_db.common.hw,
+		[CLK_AHB_SF]		= &clk_ahb_sf.common.hw,
+		[CLK_AHB_SF1]		= &clk_ahb_sf1.common.hw,
+		[CLK_A24M]		= &clk_a24m.common.hw,
+		[CLK_AUDSRC]		= &clk_audsrc.mux.common.hw,
+		[CLK_APB_AUDSRC]	= &clk_apb_audsrc.common.hw,
+		[CLK_SDMA_AXI]		= &clk_sdma_axi.common.hw,
+		[CLK_SDMA_AUD0]		= &clk_sdma_aud0.mux.common.hw,
+		[CLK_SDMA_AUD1]		= &clk_sdma_aud1.mux.common.hw,
+		[CLK_SDMA_AUD2]		= &clk_sdma_aud2.mux.common.hw,
+		[CLK_SDMA_AUD3]		= &clk_sdma_aud3.mux.common.hw,
+		[CLK_I2C]		= &clk_i2c.div.common.hw,
+		[CLK_APB_I2C]		= &clk_apb_i2c.common.hw,
+		[CLK_APB_I2C0]		= &clk_apb_i2c0.common.hw,
+		[CLK_APB_I2C1]		= &clk_apb_i2c1.common.hw,
+		[CLK_APB_I2C2]		= &clk_apb_i2c2.common.hw,
+		[CLK_APB_I2C3]		= &clk_apb_i2c3.common.hw,
+		[CLK_APB_I2C4]		= &clk_apb_i2c4.common.hw,
+		[CLK_APB_WDT]		= &clk_apb_wdt.common.hw,
+		[CLK_PWM_SRC]		= &clk_pwm_src.mux.common.hw,
+		[CLK_PWM]		= &clk_pwm.common.hw,
+		[CLK_SPI]		= &clk_spi.div.common.hw,
+		[CLK_APB_SPI0]		= &clk_apb_spi0.common.hw,
+		[CLK_APB_SPI1]		= &clk_apb_spi1.common.hw,
+		[CLK_APB_SPI2]		= &clk_apb_spi2.common.hw,
+		[CLK_APB_SPI3]		= &clk_apb_spi3.common.hw,
+		[CLK_1M]		= &clk_1m.common.hw,
+		[CLK_CAM0_200]		= &clk_cam0_200.mux.common.hw,
+		[CLK_PM]		= &clk_pm.common.hw,
+		[CLK_TIMER0]		= &clk_timer0.common.hw,
+		[CLK_TIMER1]		= &clk_timer1.common.hw,
+		[CLK_TIMER2]		= &clk_timer2.common.hw,
+		[CLK_TIMER3]		= &clk_timer3.common.hw,
+		[CLK_TIMER4]		= &clk_timer4.common.hw,
+		[CLK_TIMER5]		= &clk_timer5.common.hw,
+		[CLK_TIMER6]		= &clk_timer6.common.hw,
+		[CLK_TIMER7]		= &clk_timer7.common.hw,
+		[CLK_UART0]		= &clk_uart0.common.hw,
+		[CLK_APB_UART0]		= &clk_apb_uart0.common.hw,
+		[CLK_UART1]		= &clk_uart1.common.hw,
+		[CLK_APB_UART1]		= &clk_apb_uart1.common.hw,
+		[CLK_UART2]		= &clk_uart2.common.hw,
+		[CLK_APB_UART2]		= &clk_apb_uart2.common.hw,
+		[CLK_UART3]		= &clk_uart3.common.hw,
+		[CLK_APB_UART3]		= &clk_apb_uart3.common.hw,
+		[CLK_UART4]		= &clk_uart4.common.hw,
+		[CLK_APB_UART4]		= &clk_apb_uart4.common.hw,
+		[CLK_APB_I2S0]		= &clk_apb_i2s0.common.hw,
+		[CLK_APB_I2S1]		= &clk_apb_i2s1.common.hw,
+		[CLK_APB_I2S2]		= &clk_apb_i2s2.common.hw,
+		[CLK_APB_I2S3]		= &clk_apb_i2s3.common.hw,
+		[CLK_AXI4_USB]		= &clk_axi4_usb.common.hw,
+		[CLK_APB_USB]		= &clk_apb_usb.common.hw,
+		[CLK_USB_125M]		= &clk_usb_125m.div.common.hw,
+		[CLK_USB_33K]		= &clk_usb_33k.common.hw,
+		[CLK_USB_12M]		= &clk_usb_12m.div.common.hw,
+		[CLK_AXI4]		= &clk_axi4.mux.common.hw,
+		[CLK_AXI6]		= &clk_axi6.div.common.hw,
+		[CLK_DSI_ESC]		= &clk_dsi_esc.div.common.hw,
+		[CLK_AXI_VIP]		= &clk_axi_vip.mux.common.hw,
+		[CLK_SRC_VIP_SYS_0]	= &clk_src_vip_sys_0.mux.common.hw,
+		[CLK_SRC_VIP_SYS_1]	= &clk_src_vip_sys_1.mux.common.hw,
+		[CLK_SRC_VIP_SYS_2]	= &clk_src_vip_sys_2.mux.common.hw,
+		[CLK_SRC_VIP_SYS_3]	= &clk_src_vip_sys_3.mux.common.hw,
+		[CLK_SRC_VIP_SYS_4]	= &clk_src_vip_sys_4.mux.common.hw,
+		[CLK_CSI_BE_VIP]	= &clk_csi_be_vip.common.hw,
+		[CLK_CSI_MAC0_VIP]	= &clk_csi_mac0_vip.common.hw,
+		[CLK_CSI_MAC1_VIP]	= &clk_csi_mac1_vip.common.hw,
+		[CLK_CSI_MAC2_VIP]	= &clk_csi_mac2_vip.common.hw,
+		[CLK_CSI0_RX_VIP]	= &clk_csi0_rx_vip.common.hw,
+		[CLK_CSI1_RX_VIP]	= &clk_csi1_rx_vip.common.hw,
+		[CLK_ISP_TOP_VIP]	= &clk_isp_top_vip.common.hw,
+		[CLK_IMG_D_VIP]		= &clk_img_d_vip.common.hw,
+		[CLK_IMG_V_VIP]		= &clk_img_v_vip.common.hw,
+		[CLK_SC_TOP_VIP]	= &clk_sc_top_vip.common.hw,
+		[CLK_SC_D_VIP]		= &clk_sc_d_vip.common.hw,
+		[CLK_SC_V1_VIP]		= &clk_sc_v1_vip.common.hw,
+		[CLK_SC_V2_VIP]		= &clk_sc_v2_vip.common.hw,
+		[CLK_SC_V3_VIP]		= &clk_sc_v3_vip.common.hw,
+		[CLK_DWA_VIP]		= &clk_dwa_vip.common.hw,
+		[CLK_BT_VIP]		= &clk_bt_vip.common.hw,
+		[CLK_DISP_VIP]		= &clk_disp_vip.common.hw,
+		[CLK_DSI_MAC_VIP]	= &clk_dsi_mac_vip.common.hw,
+		[CLK_LVDS0_VIP]		= &clk_lvds0_vip.common.hw,
+		[CLK_LVDS1_VIP]		= &clk_lvds1_vip.common.hw,
+		[CLK_PAD_VI_VIP]	= &clk_pad_vi_vip.common.hw,
+		[CLK_PAD_VI1_VIP]	= &clk_pad_vi1_vip.common.hw,
+		[CLK_PAD_VI2_VIP]	= &clk_pad_vi2_vip.common.hw,
+		[CLK_CFG_REG_VIP]	= &clk_cfg_reg_vip.common.hw,
+		[CLK_VIP_IP0]		= &clk_vip_ip0.common.hw,
+		[CLK_VIP_IP1]		= &clk_vip_ip1.common.hw,
+		[CLK_VIP_IP2]		= &clk_vip_ip2.common.hw,
+		[CLK_VIP_IP3]		= &clk_vip_ip3.common.hw,
+		[CLK_IVE_VIP]		= &clk_ive_vip.common.hw,
+		[CLK_RAW_VIP]		= &clk_raw_vip.common.hw,
+		[CLK_OSDC_VIP]		= &clk_osdc_vip.common.hw,
+		[CLK_CAM0_VIP]		= &clk_cam0_vip.common.hw,
+		[CLK_AXI_VIDEO_CODEC]	= &clk_axi_video_codec.mux.common.hw,
+		[CLK_VC_SRC0]		= &clk_vc_src0.mux.common.hw,
+		[CLK_VC_SRC1]		= &clk_vc_src1.div.common.hw,
+		[CLK_VC_SRC2]		= &clk_vc_src2.div.common.hw,
+		[CLK_H264C]		= &clk_h264c.common.hw,
+		[CLK_APB_H264C]		= &clk_apb_h264c.common.hw,
+		[CLK_H265C]		= &clk_h265c.common.hw,
+		[CLK_APB_H265C]		= &clk_apb_h265c.common.hw,
+		[CLK_JPEG]		= &clk_jpeg.common.hw,
+		[CLK_APB_JPEG]		= &clk_apb_jpeg.common.hw,
+		[CLK_CAM0]		= &clk_cam0.common.hw,
+		[CLK_CAM1]		= &clk_cam1.common.hw,
+		[CLK_WGN]		= &clk_wgn.common.hw,
+		[CLK_WGN0]		= &clk_wgn0.common.hw,
+		[CLK_WGN1]		= &clk_wgn1.common.hw,
+		[CLK_WGN2]		= &clk_wgn2.common.hw,
+		[CLK_KEYSCAN]		= &clk_keyscan.common.hw,
+		[CLK_CFG_REG_VC]	= &clk_cfg_reg_vc.common.hw,
+		[CLK_C906_0]		= &clk_c906_0.common.hw,
+		[CLK_C906_1]		= &clk_c906_1.common.hw,
+		[CLK_A53]		= &clk_a53.common.hw,
+		[CLK_CPU_AXI0]		= &clk_cpu_axi0.div.common.hw,
+		[CLK_CPU_GIC]		= &clk_cpu_gic.div.common.hw,
+		[CLK_XTAL_AP]		= &clk_xtal_ap.common.hw,
+		[CLK_DISP_SRC_VIP]	= &clk_disp_src_vip.div.common.hw,
+	},
+};
+
+static int cv1810_pre_init(struct device *dev, void __iomem *base,
+			   struct cv1800_clk_ctrl *ctrl,
+			   const struct cv1800_clk_desc *desc)
+{
+	cv18xx_clk_disable_a53(base);
+	cv18xx_clk_disable_auto_pd(base);
+
+	return 0;
+}
+
+static const struct cv1800_clk_desc cv1810_desc = {
+	.clks_data	= &cv1810_hw_clks,
+	.pre_init	= cv1810_pre_init,
+};
+
 static int cv1800_clk_init_ctrl(struct device *dev, void __iomem *reg,
 				struct cv1800_clk_ctrl *ctrl,
 				const struct cv1800_clk_desc *desc)
@@ -1315,6 +1509,7 @@ static int cv1800_clk_probe(struct platform_device *pdev)

 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
diff --git a/drivers/clk/sophgo/clk-cv1800.h b/drivers/clk/sophgo/clk-cv1800.h
index 1b9c04b5ac3a..1e7107b5d05e 100644
--- a/drivers/clk/sophgo/clk-cv1800.h
+++ b/drivers/clk/sophgo/clk-cv1800.h
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>

 #define CV1800_CLK_MAX			(CLK_XTAL_AP + 1)
+#define CV1810_CLK_MAX			(CLK_DISP_SRC_VIP + 1)

 #define REG_PLL_G2_CTRL			0x800
 #define REG_PLL_G2_STATUS		0x804
--
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
