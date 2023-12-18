Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC3C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iGKdDWK5NinjO7g8/WFY1C8qaMXwQ1yzBtSVlUL5V8=; b=JgzkcKURVFlEJi
	jfZNtamnrOQc3EB5dtLi6OtZ+hvPyu4SOH+M5GDdREbVIvpkyTjxfMPBs78j9eHHBS+A3r8arFddX
	QoyzoULXkm6xYpWBVQe2hzuUYHVvxhrYgkctK3B4swNunrnQC8o1d8wZx5cy+uyVpfpPBOhGNottx
	GKtJFmiC+z+JvyOb1YkaezShuso9FPBTdIHgyEInwuVfOhlpcC0r0tRJVw9EwEDwL1j28b2ZybJcb
	bLAOXhlpeIVtwnoC+q7f9G/d2cMmDlPOChH2GblT0CyY9UHRaKtZkAdtvWPykY1idCFN/aeARptFy
	RhhufO/35RwfH1svNnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4s1-0090sP-36;
	Mon, 18 Dec 2023 04:04:45 +0000
Received: from mail-bn1nam02acsn2080b.outbound.protection.outlook.com ([2a01:111:f400:7eb2::80b] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4rz-0090op-1z
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 04:04:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZbkxtuCROSM8cB+BRah0BWMXrFQpMFRHio7S8G4DuTIOo9lQJXH9gUSg94Yh1Wjm6vgMAElm6vtgUKQcdxLccw7+JtkAwb2IHDS9Vl7v8k8lgN4KqEYGNqF0w1z4jzdjkFfkVCdN2fiNVqI18tD2DYqov74A6nP5laprUBOe8VEAbTqoJFQZNLdSdCijS14c2Vra9JsZ9oHCJr6LE4TOlsm6viEZFJhMOmdfE22I8Xb78tmfFguCKGrNF+CUcie+Uf6+K83W4CcifBGwo+TiyEjimhI309uU3cnfnd0q+FCJ9pL+PXsNv9njNcbfsm21LBVHpsnu7HrDZIdDW2qTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50hvAZdcs2ODPgRiFq0wkhBT0l2oSjrihHYYJ76TFPo=;
 b=B8InnxyipaYx+Z4b4JZpNyC5JbKcdxWdsJt4blxxAb0rVwSXOmh7wcsekUBPOdhgRq6CLnBM0mr51Tf+YiPYmP6S4O4Vub5VEPqLzMGGBpp2uyYXMn5P7WKYQ7DAXkCzKLMWyRbG7zLdmeiik72M/kT0wV23oo6wTu+UXjuODS0gV0asypi2LvwPlgfbDuO+YlDn8+agj48N1JQo9kpAJJ2xY1Rf+dDS8C24x7oPSomvy6LIMJ2q5eUtar7wN0JIdyzK3RhBUGQ1e26g2B0RCNCQUeb8/UFWOfLxAykqFZrjjXPLOZis+s7sUvYBeDB+ri4JZRMtb7/6o8Fv+fG61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50hvAZdcs2ODPgRiFq0wkhBT0l2oSjrihHYYJ76TFPo=;
 b=d+tBYVFMo9WBuPWCbiV+DZIfsZVcef8Van8Syik9lcqgYNmLegunq6V2H7m0/Rg+VayxlAVAplMEjnfReuJeg2q8YUN/j0RJCrAM0nLRU9lG4bWxoOzuEwPHeWADnELkmgerHphaorJljszfBydbSHdaNpjQJ6qkYGQDIUSovaiMzFke27embwPbB2tCCq7HBnYbCQLeFK6lFiVHbmyhx2c9MiFneRlH3zhrFc11fzl1Q6qmN4I2bycNSgaMKknZgTPI77aa1TWzeSfdtBtvoCTh5bSq2X5LHcPD9EBUj942QJMXh2f8OlWapadYJsuPiFwoSFe4d7Qws6xhcvolyw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by BN0PR20MB3976.namprd20.prod.outlook.com (2603:10b6:408:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 04:04:36 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 04:04:36 +0000
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
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/4] riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
Date: Mon, 18 Dec 2023 12:04:05 +0800
Message-ID: <IA1PR20MB4953EE89276BFF0E187E83D9BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [1R/3OhGJA2oGkVyf4n8NNUGu9ufooisu0Maa2yJcAvs=]
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231218040407.574287-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|BN0PR20MB3976:EE_
X-MS-Office365-Filtering-Correlation-Id: f1388dcb-944c-4bc9-35e4-08dbff7e72e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LN+XdWo5JiXUT+4PI3qwj3jWdSuq+6oyo4QvZ/+YrwZVFj+2plh53QGRs+4EnIUQsLp9/4KDBFiTNDLBWULRDHDxPN2khQckLtX+EhQ+Sg1qy6URYf8k6eKIePGOMiHCGmMLsIlheo/gFH5Ju5G0iUWT62F8bx/1R3YmfmqV4Fdn2UOp594SjNyltwOHA6jR7EqH0NTKqTLA0fPOuIhFPTE2n9wIeubrA79ii4a0ctGf+8RSBCTPh40y71FzmFnnaI/zeHRzF5SW5JhZhC9TYTN2L9o4JhkkNNLVPscHd8TpFMPBlUDLOccNw2xlLlY3uj20GgfZgPAnfJdW+S2IX9tSSk3dbt5hVh2GHLtrNTZxpmVr7fl82pV9J30kgCPtHf7OBvCwgwJTk/1CyjhqyFykMg+1JSYj6LoPRYmzaKMJ3zQkT6HqS03D334H3Ks2yWaarrDtN9KWREa3ztPGNsZwfjSdYutS17wvzUOTLS3Lp0lu99qHEs93lS0LAN0dJfVb1VRE5l2iuxaq26YLzokTfBdZ5CQQLwmUHuhlextFLs6MpwO09jlGnfvN/tl6xFn6tUh5x5jnN7d8xmtnBVEYR1Xef/NFEXk+hEKklfXbEKHBb2djfNeM5m5mw65srETvtkF9aGZc5D/QdiGohKaLSSx3OJOdxyKPyASuXnM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NtNXp+zyrin6SS8vgdxC5m2d93WPrMgfO4xsMH8IXotJs6IK6btv7dFmlqOL?=
 =?us-ascii?Q?3uKE9OxPG6EQqbvy47K8Xk4Q8qYxB8GdwF1o2ukqdCR3Grp4t5zD+CF6lH2N?=
 =?us-ascii?Q?qlQ4+kFDLU4goEF8D8ulM7DkkCEfqYgH017YQ+D8ekmDn5Br3YHV2f2WMN+S?=
 =?us-ascii?Q?vXT3Q4F02kusQS4FkZvAd0ap2MvFwQDBeKQsep3xzrGwnKLv260kXMupfCr1?=
 =?us-ascii?Q?Uhbuj5POtQ2GJWahJ/qqoqNl23hzVmc5wZJISyXjAu57jylOMNeOVjjK+Pc/?=
 =?us-ascii?Q?wblRfOeDZHv3fJ/kv9ZTnGuwZib93DvpKB+1wIIsqFyLMFtwrJDhHYcjSUhn?=
 =?us-ascii?Q?CnuWQUl2bptFksgj4JiVmR9HLWdjWT+homCiBWlyXQj2Donqdt0iB4DdzIvq?=
 =?us-ascii?Q?qqmVEl280Y1cWQiMheP2OHKj1QRpMmkFjC5RdXotVFnOlbDaSsz1IrKO6R9q?=
 =?us-ascii?Q?vsEluVwdzk99EdKgQx9PhKQELSTS0hiAVXzo7Q0bWrttANirZbU0mO+Z9MR3?=
 =?us-ascii?Q?laD3LsruIizE4tPCcRC5jq1aMFBp5KyxgBY398H4JuaW2MXYwhCOTnsHodq0?=
 =?us-ascii?Q?GtZ8YPYYM1EKtsDMBXoJ8ggxBrtRue84dcOM8WbEEqB5uTD1RytVBRwax2Eq?=
 =?us-ascii?Q?ILpDrPZWEDt+67LBRyUqNodO8sn2SOZdwtmLqWiDWUge3vySV98WQ9M6QzgI?=
 =?us-ascii?Q?1GOiAdYLIUhf69QE93t/7dX6xoLGYx5Ia905W0aslseFVaqe3C3edbQnLecT?=
 =?us-ascii?Q?lzd0TDok62K8FeQGc27prVRb7H/CczavPHZA2XtAXnGcmaK/VE6RubmIENMG?=
 =?us-ascii?Q?2DhNlDWpjYM29HZhACW0LY7fZIyloDp8LloRiBsLRDVcAiCuvslhnyQVPhR9?=
 =?us-ascii?Q?g/oLuJDLJSe/jd7EYLHFzPccEOucD6otgC4jarK7QjAOtQgHYssDfXTFn3Us?=
 =?us-ascii?Q?0FMYAlifanYkvXWWbpEYgsYmloiDqhyva5scJIy+xW4d0aW6B9ASE1ELp2eS?=
 =?us-ascii?Q?kNw92lUtErz74bnUwEvrvcTdem01nff3+nI8Syjc6S32nzIA+OTtczj+Od2i?=
 =?us-ascii?Q?XjK6fAW+Z+POkXz76iyqquwXDy2jr8n9nHLzK9NM6QcXbmMXaBDJAXlTLj/0?=
 =?us-ascii?Q?jNshNzRRmYbwfvIZCdrfftyKh3DKSGeUOuxAM1k4j3aKxgpaan4Edvj6wWXc?=
 =?us-ascii?Q?qQDyvv475J53G6Qy8b1IdCgQUpaSKMKW6dfSx8qYcz+KnXJ2c4Qg3mK1ADE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1388dcb-944c-4bc9-35e4-08dbff7e72e5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 04:04:36.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR20MB3976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_200443_656975_B00E6132 
X-CRM114-Status: UNSURE (   8.01  )
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

Add clock generator node for CV1800B and CV1812H.

Until now, It uses DT override to minimize duplication. This may
change in the future. See the last link for the discussion on
maintaining DT of CV1800 series.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
Link: https://lore.kernel.org/all/IA1PR20MB495373158F3B690EF3BF2901BB8BA@IA1PR20MB4953.namprd20.prod.outlook.com/
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 4 ++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 165e9e320a8c..baf641829e72 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -16,3 +16,7 @@ &plic {
 &clint {
 	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
 };
+
+&clk {
+	compatible = "sophgo,cv1800-clk";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 9a375935b00c..83243c918204 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -21,3 +21,7 @@ &plic {
 &clint {
 	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
 };
+
+&clk {
+	compatible = "sophgo,cv1810-clk";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 2d6f4a4b1e58..6ea1b2784db9 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -53,6 +53,12 @@ soc {
 		dma-noncoherent;
 		ranges;

+		clk: clock-controller@3002000 {
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
