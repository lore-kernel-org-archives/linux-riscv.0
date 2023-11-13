Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D693AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rnpqn2chc2eYeiUapBdiSHyVd0xm1i5GaUnEZx3859Y=; b=ZxF/gRoAWBBBuP
	+Ijbs9B0YjkQq/N4Mr91ao/c4zqsTT+npt6stJU81FsXYX9qoWp8zQb6VPW8W86Du5/I0zFKwQY1k
	h52/ty/RT0djhBSmP4Hpgw/y2Gncwq/etQ7+z5LhrKAH+WsaNcePyzHDB6JKRWgUfSPdTVBJxXv+7
	tGgarcVmgcAecMeYXdRyn9SpMT7CMOqJZhT+ZbKNmGJWds2X8Uwjz0fRmBELo9hOfuBVYebKhRLVL
	sIdJSbehNl4k7q0XPKhWhFWrysjkdXvVJuzp6LXFm7SBJEGAx+L1pqaDcF6ydZI6paeb5aYpUKT+e
	fTAO/SKBSi+9POU1IY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TCu-00DYje-0t;
	Mon, 13 Nov 2023 09:26:12 +0000
Received: from mail-bn8nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f400:7eae::800] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TCn-00DYii-2E
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 09:26:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8osBBdC3BFoJlM00tnWpuji5wKZZsLbIEoFnCJy0+nPPtu1Jvyo3r/kODGKti6CGkEnZ/Dq/By9RoMNtwgv8OKnHjaFTulLYDb8F14a/RdKyuixHf8qO6i4TtfhsmCdnF52kJLtjrCemOw1YNBO6BX4kpi3oo8z1cYb1mTALezU20QmGemln7BCU0gJafgK7lkWd8IuP9fflrFmPr88pd97LQHq++zzFTJz8LBgDhpd282icJOiISMmXEjeUlNdr5KI9WPaJCgbBh/F+PkPGr+4T1hhfeanHhZVJvAyaBdcPL1dkP/d0WfOPUWL85NmJwwwsM5Z1eS2LRAPuA/t9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqz5pQMI0E0+HeT6UiwmUgbdQrhyFUVIy+H8obl9xH4=;
 b=Cw78SQFztMM+2fAgJrL8MfNsIfCSGa5v89cXfK8LTW+BxV+m90ygdKaJ/Q2LYTW1ofbkmUNYeyACnBf4T1a1B5kVKkw45NI/WYfrBtGeauiRCd7XeeWW2Q28hzi7p5uQ5rFbm8KE5ir0Dq4sbeAidpmxpTeCKkm/J1Jtz12f6EbCq0Rsvip8d4I1uCdO+ec2oKEEQdyLKHj/UXplqsK46Xh/uNbh5vqjXhdWbEhTBvEQjLcTOORBPIZ80GCKIJ7mR3yQ/G6FjizvS8XYmX5vmHIUTVsuAqoGrM7kyKsFtIG/7nPHT63JzZqxu+egX75aGZgrPrhWCB5hL7OU9hqmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqz5pQMI0E0+HeT6UiwmUgbdQrhyFUVIy+H8obl9xH4=;
 b=mMCt2A/PnAvW1xca9GF8O1bdiQwrSTkW8KtpoWffsVaRicpk1ps7b0MJFuOZyncWJA79As/BkgEB+4CK/5hwTGjr2H7zMCnxpoOMxPn0G19uWCQmmby9rbtnlOjXsZhEn2Hl3oqmEsk2R/K/qS7DxYAQBLd33BYEBvey0sXfK9t/PeWh7zUUtjHtBYEs9DCVo/DZTdbDz342uImPy5JKcM4yCMON6AJG8/Eor21QnQjHKSxAAxrpY//xLaoLKUbUtl3YzGgPm5xSGZXiqV5oxKYPdC7N5Y9vSggREPcwJyVXTZk/3v4ybaEDaqvxxMsVCYEJA3jnIj8mNdlC3tENww==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW3PR20MB3465.namprd20.prod.outlook.com (2603:10b6:303:59::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 09:25:59 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:25:59 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: remove address-cells from CV1800B intc node
Date: Mon, 13 Nov 2023 17:26:15 +0800
Message-ID: <IA1PR20MB49532613F5B4BD9753A1BB4DBBB3A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
X-TMN: [wEvxMjLbPiEQh6PPG7qWkwPTA10ApsD5A5yMO0pAxcQ=]
X-ClientProxiedBy: SJ0PR05CA0125.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231113092617.114031-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW3PR20MB3465:EE_
X-MS-Office365-Filtering-Correlation-Id: 83675bb7-ab93-4bf7-d2ac-08dbe42a8b9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfwcs2EX3lL+1cVU31ZRLf+cMQ8qQFGUrIQfu37V4wyEbcvjt/1GyIJgzA4xiKjlvRZ7RPuqovZqc9UB4GgI3H0uqPIqviT70M+9XIsJ50ZNrsfSzB1ga66OHhQRTvlQV84wmzlnTjN8n6nRPGZQLEFEzEDiPsAwtUNoGv2TtRosLwzo0/suhAk7iGv0pBaKjxSNzP8lUE8XSGHi/KY6PznXei0q0jsPBPicTpivmhjmec/69LHBgoDCIzBjM7+5z8QZoUIBIVihWL6twgLHAyAX7xtdGxnKYz8SYPCdCkUiVGIze2Ei+Xcya9MQZs4liUwVWW/piUeEQTal52X1+0mwFKJJBEawANSbWRbMqoGamTnUlsR7RlDdqWMoDzBpUF3K+0PUjn+YiEZnbdwWLSoA/lOvJH36oxhyXnr2oheiZ3GDnLtdCZfTKh/uty/05NorjVe0JppjVGDXsxVPuE3XqRz7TFW2Yz9zvJI9E9iTH4jwFR04wsE2RG506mCDrGe/OdGpYvR7aO0tKBe8I+Z2j0zI+CUFbgTIrOO88MjzN+jUfwQAFWpsMjZREYdc7KRG/Wn+WcUkDBoulUNmT9lWwqY84aWSif1Np1ciZGgeeOBam343JsRDHWk5MDmZ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7SW6Ln2EtLanSJL7UAKRe4T4K+Sb11yIWqtyVs5lRNfp3bUJgpyDwUEVlZXx?=
 =?us-ascii?Q?8NlftHQ/C8YGdsbfm1kkWFAp7glnigFc4wdL/NAdQkbOJVGu8jSFYT4v0oXy?=
 =?us-ascii?Q?8ocI9J5Til9JHUpl/xeTC3C+qDZtqLjLTNTV99R8FzVrXzbSH+mzRieR+d2M?=
 =?us-ascii?Q?cdzfqjQsfRUo/Yy98BwCohJFCG2rRROFOZKKPrXJ6BGkd3DT0WAQAXT1MKD5?=
 =?us-ascii?Q?2ijIbd1x3QVigsyLVw+R5XRpMCVL0AieOIhgNjAQsoYLtntE92r+5EQop4Xl?=
 =?us-ascii?Q?62sWW7slyKgOTzt5MRz3wSIfrE/C8Nurbikf9PJmyXZ6+glcznBxckzYN8Hf?=
 =?us-ascii?Q?zsCRZPYcoCL0/7iwLFc6//yxek/vBB1uI0zvu5ASYvEeDbkhy8WIzmu2m4Ge?=
 =?us-ascii?Q?VCUA/PA2mHGjwhpmmZ0vvyWSzjScWeCqGPASkoyV+uw6qqfzjm9sDnb1AAnh?=
 =?us-ascii?Q?1z9KjZEaDXN2UDbUvId9Dkh7WYmzjOsGaNE7BVFu/rAmHDMtsmS9fdEnbN9Z?=
 =?us-ascii?Q?f+9hYQii8+VVyv6fkTE2zlaWuzMCSVl95chabHIFjzOImJ8Rvdeye7vv6MDx?=
 =?us-ascii?Q?e1vtO2p1/f3hA1LrtpzEOQ2bur2A8nCZHwnkDPZPCQ2tFHWfz7pXKsY1n10p?=
 =?us-ascii?Q?PuJrSzsDlg7W8rrwwppiSwiv0JCCtmfXUomAcR8bFDVdEvoZ+PgKL4YMj3As?=
 =?us-ascii?Q?K40rHi42T6Wb8KE5z3lSHitsMn9kO+yIvS48nGIRt4DPDrwLmfSwjSwlqMR9?=
 =?us-ascii?Q?SReZ5ZFZ+N1Mfnbb0xjXm5xewPlTMBYOcplxqdzVth3hf9Wtttfs3p/eUfkj?=
 =?us-ascii?Q?iq1eA8BoPaJ/vsPqcIMdNy5dIXj+Sy6t7LCXc4xxPGfJU854gcpngyjsq+po?=
 =?us-ascii?Q?prII/vtuAYaX8OFW/fzhinH9wDx/96/NJjOY0gOcZGDi4lX6lRcLOr9OLzlc?=
 =?us-ascii?Q?huAfiXopmyk8xhWedDavpSRE8pwlwh4uYzbpkq/5F8mL2LeftErsjBODrWSe?=
 =?us-ascii?Q?cPjFuPRi5SgsQRX4XgM4OPmwHtbkWOUpN4otzIdGd1zaLgs0mPXuf8/sPAtu?=
 =?us-ascii?Q?C3Q17BzWr1FnHy4bjiGeXF7wozq8GbV+FqC7J9OJn5/W17TjHd6VBCPLWEHw?=
 =?us-ascii?Q?oG6gGXweF8tzdQ699aXt2W0O9hejAwtAsoP75KcO0neX5mpB2TrPnnEAZLdF?=
 =?us-ascii?Q?wEVeXV5KbkpapbJqCBst5FeNSgKAIII8ZIiRTTQzli42wRqdwO23+aGUAgs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83675bb7-ab93-4bf7-d2ac-08dbe42a8b9a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:25:58.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR20MB3465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_012605_839584_6DDA1EAF 
X-CRM114-Status: UNSURE (   7.89  )
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

A recent submission from Rob has added additionalProperties: false
to the interrupt-controller child node of RISC-V cpus. But CV1800B does
not follow this change and still uses #address-cells in its interrupt
controller. As it has no child nodes, #address-cells is not needed and
can be removed.

Fixes: c3dffa879cca ("riscv: dts: sophgo: add initial CV1800B SoC device tree")
Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..aec6401a467b 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -34,7 +34,6 @@ cpu0: cpu@0 {
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
-				#address-cells = <0>;
 				#interrupt-cells = <1>;
 			};
 		};
--
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
