Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAE7C52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmw/vIVlxJlgMNqVigOtTw47wI80Zw5XsdzvCgaFO90=; b=21ldDnhtaGoSlC
	fFVN4FYZ6gmcQPdsIPFMaNpljF+3tJ0zEWjCBrCyoeYJFe9Pr+h8wxQsqGtC3P47w1IRuVRZngf4U
	LoEpYLA26xp1r2rZAKzoqn5EBAvgHYc9G4lDjiPhJA1+X0zP8uCo0b4ZA8L/qSVJL2SbzunMcWetD
	sdnn3eRQnNh4UVO9qwRfFW2Np06ncyYdUCBR6Pidw50KsTR1PFb1tqkV+cCTObHkkR7INTJTAVjXy
	QWhGi3ZVzAETG6s6PuVLsfbB8TbyTUzkBicYQWhQrLYBOKH9WyiVSrKDzH5i2P+mY31xpiMp+SJyv
	gTOzHIkRvBOObX8nVfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZrZG-00000008pRe-0ezW;
	Fri, 02 Aug 2024 12:39:34 +0000
Received: from mail-dm6nam10olkn20811.outbound.protection.outlook.com ([2a01:111:f400:7e88::811] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZrZD-00000008pP1-0Vfr
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 12:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICWdH8t4pE1sUsZBghnfcx7ZF8kzTseaOWE+XapDBkCVGzDIXYZZqQ/Vz2YfF2F1UjVroIdIowYrvS/Y9U488/RidQvkSQNSdHAWvPcquj1IWfx+dTXhmz9oQul6MAwT/+NzLQPTZzo1nJhuZlTI9lMp43bJpLOGGcpLKSHkDxO5dO104DHbejQz4lcS1Ovnir7vD6IJJ4sPM8amu3rm2pmta2Vwus5oLDO/CmKuX6Lni0BdOU+XPkBRuPdtWyQFB/m+fQaOGwvpwQaqQTOLbsuWSPM/zT57fMsyBBcIBnmtr77kBM5VTwna4cEwHbhblu021xGtAEuhHlETCVEweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSi43Gs9SRy6WaiuTGqhZhhKO324I6T44QfcC+fWqLA=;
 b=J87AZ8DSMmup4zDcSgX2BWrIjarGv66Kdnmrdftm8BKzTQLZqTYipztuSudPeSQrA4nQzkUEer8+2KIV5HZIjT716OC8m2nYV3bEv023j/Y0AGvKp6OMwjzdA43Cq0DdlU0oSvqXWqtKCFJJCBGtTERtkUTPFL/PkzXKFjOBh6F/yq2PCsiAXZlKiBE++0KmLh1y1Vj1lrEXqa1JLY0/Z/AuYEXMKlpyFJQbck7gUK1LAqjOE675cTs+solPyX96XhgzwgHIZTjKXVHhuTCsetrClMTplLlA7bgeLjcQgRaCsqp/txczjCKM05EagKi1Z03jCLrjWf5MvGs8+/6cEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSi43Gs9SRy6WaiuTGqhZhhKO324I6T44QfcC+fWqLA=;
 b=ME22Lm8YBF4lsi9xRME1mGyU6bBUKJvR280P9M75n15n4ys05WQ/v4G/elxSk1puLCV0SRl+4IAdsU6dRqMtFDHpX4NYL8W5t1t5BWj4yY/E67lJI5vQOC96JV5h/nq5BatU2yIREAG2AGpLevMLLqgN1n890mj13ifHWuxwrn5VqTOn9D/oR6/hXQ4K1inWyuoMT3ywPBIAMsljTEmyyVoEw6MVcB0FN8cR+AdIPppZgQTEBJs2fL73LPbHrkubchTMz2nI8joYzzguOeheMneXPrgOebhDQ7OfZLfFESCTGKKIS48k7QEbUGINvb5ZS7LNMqethgNJ3cqAYB7vTQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5499.namprd20.prod.outlook.com (2603:10b6:930:55::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 12:39:27 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 12:39:24 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 3/4] riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
Date: Fri,  2 Aug 2024 20:38:40 +0800
Message-ID: <IA1PR20MB4953E933CC6B8D1B2D0C9D84BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [PB92+DM/i01iVo2QEvzMVFTfJjwLlZDap928otyEC+4=]
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240802123842.1492286-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aad688f-b250-4564-092b-08dcb2f023a3
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|5072599009|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: J9DTAsyK/qlpWt1/QaX7+2qq1GUI1yMWmhC4jwkbmf1KDq9QeMff6LM8XYzdm5SMMK/GFli6Lg170jHd1AbznWPwhTh+oACUL/sZN/vb6uKcGb5Sf8VjH2CGlk5Jq0axA3VH4gtXGsWo/ICtV+eytSpTYuyfns+L7riWYS7FpeDozK4Nt1TJPxfyOKtOq4sYIHsMpCPj5YiomPjV9gT3mJIvtdFZYLVV4f6drpT1iU0Asl7gGziqLeBxaKztlIi3HG5xdYYQHwylvJVcth7fKsIqKjForIQvxAnvRX9F3ULyFTGWn99RWr5ZC4jFqoFZBIi6cO+QkADl8+g9h7S7YS/lDuZi1+tYnRV7AtFIXk47QYs5xY2w51D7esgXcGxNCjggCznIES9rKrZEc7Abz8RuZOjw1cEfBhTZlKibwr+owwFG/Q/Da5Gjb1lusYk48iMh3o3uHz53e8Zr9xXcWN+gmJpdZ3eiZClWHBru65VAL29cGm9rvHKwhgEDOAg2KkOFg6RXa5dGuhjNHnBUCjDseUwsPqrFe+zE59FAjw9OnuAw7RAmTa5GDEaF26dn1ku31TTE2Zww9sZEW4mplPfrWAJaRlI1VzJpPNaPqvdOgv1W9JakVWMfQWlKEsOk2MnlJcxMIzYqFv7tBuf329OxZHuX026ON0Jf5DdpXyqHTb6OypaRgNGjJIHGDB70n0JifGQ80q4nQIOoD7KrAQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?th78tCeYuXAbXeMovIK7JuqihAtunvquxsz0d9hia2sPD4ntuz8b8T0PgaeF?=
 =?us-ascii?Q?ascE+wlaTqMwTTn0EIcnRem52uznKZo+YQ8OG6fcaM9CLuniMWCelPDEx4uh?=
 =?us-ascii?Q?DJGKMZiXUE89Oy5itn2uuVNjlcuz2Zd20Jf8SPjHZMPAe8E5ECDEdXsPnwUQ?=
 =?us-ascii?Q?fhk6PEg+KN78/CmzloI17ZNTWpGDlyFe6HAUu7Jo7ewQyOTWATnMAgR7wJjq?=
 =?us-ascii?Q?Ejbomp/ipzlDDDBpL3wAfPDIHy/al3+ecgKhCF5LrtkipFAOnLZUbom+MZIV?=
 =?us-ascii?Q?xnt8RVwq56Lh9PE60KzH3tnljmyMaQV3AiZ85G3VefpUbLdU1Y4G5qToeYej?=
 =?us-ascii?Q?dEVRzks5JR/mxcY0JWIze7X7bzEd3enm/k94aCpcdbqzmUTf54Xt9m+huXzl?=
 =?us-ascii?Q?pi23TLcknGwecbjNW4lx8AW6H2gbUKCx+9Vdz5H5AuHiyv7J0IFbgazEm2ro?=
 =?us-ascii?Q?t0scE0vMltqdXM9kzwDPKc2ZfobCXtn2EFSHzav5H3y+OHV6JOlh0l9JOPdB?=
 =?us-ascii?Q?8nU9QtAUNKxJxzbNdR122OhFNd4ZpjrzVfhugz0uZSIguk7coMxVHXLAv8pH?=
 =?us-ascii?Q?aWWHMpjCR9Qy2O/K3/YZOGhjjkVQ7SwvJNl29dYUSGCoMoYbUVWpr+sZxM5W?=
 =?us-ascii?Q?QKnBY7rw3dKizHOxCs9WGrhGaH8cOA/tkqaAcuQrW4U5pcUGfBaB2mgDUPf2?=
 =?us-ascii?Q?xKJ1xPLhoTmvtWtOoiynvtRsPoV1A4fDsX0c0MkqcDf4ZMZemrCxAC/A+xpV?=
 =?us-ascii?Q?XLKHcbJ1L6srS+uXQkYI7cTojF0m+RUPtWn0xazmRNCiD3yCfPdOoYoWoiL4?=
 =?us-ascii?Q?L4Onc0mg+sm8MRLUmSX8s/yh54FcBg7awGCrPOTB7wlP7rBcOP+i2aCqeTrd?=
 =?us-ascii?Q?NGHiwN2I0+l0lnoZ1prCQLmjjEHiP3f7kFN1It5gRV5DQChvVNiN5tkJxyXy?=
 =?us-ascii?Q?aKS+J0r68XQ4w0w4Uxwpu90SNZ/DKeumdYDLQfLrwxT3MM54imaKOw65FJz2?=
 =?us-ascii?Q?BHt/PsmtruDONrtrm/e1hIpfmIlyKXD6JqaWK3J91tm7Nz+CViDrEgVGB991?=
 =?us-ascii?Q?7E8BPKuXlDeUm5iM2QNRBhmHhBpKaUxxK53dWiPPlEYpxmp98HvRbI1yWyWy?=
 =?us-ascii?Q?gVseD64EpuqLc4g5PRdB26UYYh6osnaIGWXESkhY0cHruXQo5ap5FmLRb8XT?=
 =?us-ascii?Q?d4beXCin8Ba1B5Qs5mJosDx6InIuUOP0diNHGu4t/v5TPvJsd2ZN/kXV+bBq?=
 =?us-ascii?Q?hlUwCuaw82gjhgv2ZZJM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aad688f-b250-4564-092b-08dcb2f023a3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:39:24.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_053931_199643_3C0801C6 
X-CRM114-Status: UNSURE (   8.32  )
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

Add mcu device and thermal zones node for Milk-V Pioneer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 80cb017974d8..8b8fdf6243d4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -26,6 +26,66 @@ &cgi_dpll1 {
 	clock-frequency = <25000000>;
 };
 
+&i2c1 {
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
+
+/ {
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+		};
+	};
+};
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
