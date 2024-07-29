Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824FC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 02:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40XQ9Qu7ES7ErE0DeoltpnHwnFq155I9raYgFvRHD5A=; b=FDkEtgQie8f1y4
	4GSWoV8UnRseLgIFDip8E7UwJIp2YA17Lqm65jBHfKONQKYJo5REj3kNA6sbp5SI8tfg5XpXAnQaI
	BRsEmBONm7ImtHgac9oDHjpq+iTV1IdmZYiPx8qYZrzpbu/PQF9o/QdRA85EbeWpboYi9d7in1tDN
	UjlDDgO0vSK3ttw2qQG1GtXA8cAeObpToVEkXVzW1ojUcKO6BLtX+zQD3t6gFOtmeKGIjK46d1Yv3
	75S5rukNHqGyRNKZIYe87levs+LfV6PJ2RnW8xIeheNw6GzHk6ddNpXngeN2vRoyer1IbAgqfh7xN
	uH5I5FcCaWJqh50Lqe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFtx-00000009hJC-3Tpv;
	Mon, 29 Jul 2024 02:14:18 +0000
Received: from mail-mw2nam10olkn2080a.outbound.protection.outlook.com ([2a01:111:f403:2c12::80a] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFtv-00000009hI9-0VsQ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 02:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/1U4RqV6ShW49BR1IWwg7LEO/MSkeVarp3Iq+x6J4yB+WKS39wzyNhBiIDUm0Fam9jmGkSLuOK6AGG/FIgQJPpyWBNmmdYqM9dPLoATDJWhx2Ozs/C1AashawiJUsZouA+vrXlSgjHOyhdJQS44HbGLcZ0CqWi+0r6w0svFp4y1xjPEmyIVYGhdk1NyheG0HpPcWF8IJKS9HBZzuXSH+tP6R3gjMzcyRhufLPuBTN+ojcKF6Zot2EHGMQBD/IajeckLLryfB099Bx+j/qZxIHYJ16wFjZhM+0mAyeE/J5Ycs77DVo3QlQDPy4AN4/scJ+IXAzdlxi/nG1r/2FJ33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCVGF711fI1xlt1tjM0sRJaXfqDxN7qWoUjk8J5RC7w=;
 b=gEE2bS7B24H1oU4OcNkrUxOZzBUDWkdtaTFWuRUE+b98JZ3/GpmTklX71UWeYP9yxHloV2EJDoNj2JypWCY2u+GmK5eUIN0veSrJYaugldJksJEw+r3gRxgjTW7+6GfUMCCVx69kknONQRWiD+dZ+5yChQJS6V4zYBm9kEM+F1ykf+aeu3Gu1exW5Czn70tc/+3ZTW3Thv5jyiqH7K4w4X3ojynNWMwInLL9GJCrA3cfV8JfGtWcSJ54UOQ6heiLGb74xaIwvJatKQkN3J06V6DK5/Awz0XraVVr6EXFlX3c4KaVR4l1GHQy/alPFqo3e4B1ItOzfhHw8ahfICWNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCVGF711fI1xlt1tjM0sRJaXfqDxN7qWoUjk8J5RC7w=;
 b=TaHshJw6AIHBBmoH5Mije1xzAuxxndZZ54IHc3IDaz1rAb+/eX5Spdb1Ab/tdkOXOepHwSFgzy9ZX/G1qYEi5fA4NeOtbDWxaiO0rg+NBxP5xqBGXoWM1ZdelNg9HpUyMzrBJTQFEWJxaUkPifBMVEb8+ydkdV5AK8KiZ0n51UrN/QSBMan17hsOf92EUGOCPohyaD2IchpMG1ThInNJnIBSnTYpnmgmMpD3750nzRzrAq9tTWO7t+p/TMkm9QSw9wD0raDVNp8Xffc8J+s3PgZQIEgkhWkI+o7Tf2LlGJE5nPVd4nrwERU8KhDLNoK2Lp/xkCS8l9CMaC1GnGWgbg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5767.namprd20.prod.outlook.com (2603:10b6:8:144::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 02:14:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 02:14:08 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: dts: sophgo: Add i2c device support for sg2042
Date: Mon, 29 Jul 2024 10:13:34 +0800
Message-ID: <IA1PR20MB49530E59974AF0FCA4FAB6DBBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [lXdYmAeywsyAdAPl+OqEkDrqs7YWBD3R0tMR/TCIY/w=]
X-ClientProxiedBy: TYAPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::34) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240729021336.838887-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6bdbc2-6b85-4829-6c14-08dcaf742117
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|5072599006|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 2z7EDOulQfzfId/0uxPj9S0syhH0Bv8Hp1nQuEVqZ/PVmZbmZun8Bat8hi1FKLfc1UgGhuK16Nh4U21bAFiMH1MKAk7d38Az7V8yp69KzqQUNftFKFOLB5rYgDX3wPi3tnLmLXiN3X0YbFLV+OdO+KauTeuiw/lwyn09m267svF58vx9dTpTQjDgfzxMWuD41KOU2mnGSy3IaT3Z0bApFAeVSDSi4G5g6bagjqshmRz7+mhUDb3iXA1KrvEhNPmNGwl8PVHB5TSx0TlNjSeoKimIgrT1qgZTBmOsnRlDeOM0mIa666jLYi44D7AS0Z0hGsxDP7udFA9LPWtwNLk5hNlJx1pGfzPKndVH/a8fL15CUWLK2QJeqFAm71bO3lF5IuodSpB47MXr8/MTNCXYB1/xdyAa+tLqw8LFHLzkZbEJiP2Qh4kOJpdqJyqoUynMIzTxDw7VkfwqsRDNVywn0BSXrpk95gb7vL2QW/tagumyJxqSMfFve7fh2HJ7FjKqFjPlAujGMAedw2TdiWmgWyEITEb6WGkMU8HcxPy+rxVRAdyZxO/MoGgoUylluq6iRw0rtm0lVux5wCgMTLI6T6czW7DiA+R6SOYb3Wc5vyRXDgzjKza3aFpaiocSydkJM+zcbI5yLkf4Xsl0IYYu9O0f3WkRioyPleUJqYAHT4EGdQgrjawcgzCDNwtn9gWwjYbH593dQ07JosLhIIDKEg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tch9AP4eSB/SbGYd069cYTV5CWAmen09ENsCwtaJdyElCwkxrrmbBUwNkzuj?=
 =?us-ascii?Q?5HMVNfC21jOrCoI8aT2iW/+cUCDpUrXePK/eYlcy9J8wNVpU1+WEQ6LDYwQw?=
 =?us-ascii?Q?MzovzqMIEEpjKbroZZa+JAnUGEEvqvBxIUCkiHyisbwLrVdNTJ4CI7DGIkfD?=
 =?us-ascii?Q?yYthrOmO3CA2MNS6HAUA+basoXf+wIarTvFh0F3/fxQqLUI7rrs1Pj+a7DQS?=
 =?us-ascii?Q?gnJ9JqfiU34EaYZgrtumurKuP1afVBEuwxzhE4O3EhvnSH5nPNn+BrlUioaj?=
 =?us-ascii?Q?K4ez71gIuTRf/FCm8NIVsOKPmC7qCRY1GguC+HcVESrG5iRbiSMd7zM8y1Tj?=
 =?us-ascii?Q?z0o/4LSgZEWYlrxBWM4yh9riwtjbZ9G6Gb+wbbunPFSs4EaeEMN4SlSlelNF?=
 =?us-ascii?Q?lBP31JHx0nSEQE5pgOghs7wXifDKOOz1bdeSQAqPBv1zvwFnPB82mgpzi8nO?=
 =?us-ascii?Q?LFDMKIduhfmgXK32g84HYkStTriaelFvmpE/UgoYG84Sy9neVz6uUhf/y4tb?=
 =?us-ascii?Q?1mMDVuT0TjImwjWKeYggT+qlIdYjfzToxcnYmtTWgeChz+P41zbLqx1ykylK?=
 =?us-ascii?Q?3NdJNjP1MwZi03quixv3CgIpagpVA2xpalxeB9IOkHKvqIzDhRZ9eGf0WnPU?=
 =?us-ascii?Q?NEvosk6oxJBMFHllMnqXSX3fz6X7bNPWfa7zqS8nshrs75aS5osoQosNbJcC?=
 =?us-ascii?Q?Wt5oImpP59t+9DRt7/2PrOu0glSIOSgBffgAwyZbjlixcnas2JnspiE9SRhL?=
 =?us-ascii?Q?9v4mp4Zir7B4YA+L29KfcGZ9FE5xEf6KtLNtlJ6u4Ut3Trq7z696kDyL9g8r?=
 =?us-ascii?Q?W+D91WxNapk0X4Ij6H4ESgbbnVSguGge8h3BJrce0b8VYlE8aWR6EEjHscPT?=
 =?us-ascii?Q?GkiAQiFRVe2fNoRH8BJeYHCOQsYyN02JM5QDjWqZezcxEklTCeDkome8QygS?=
 =?us-ascii?Q?9cCcRaQ69WGjT/NKbynevCSwSNU6hnsJMannVRtnW8xYh2Vql1mYG9Vh2tS/?=
 =?us-ascii?Q?LE/Qzk4GJ0wfZna+M5Gq7e531TCLoRA+6G/pmA7pqOfj89wnV10YjcLG5aZ8?=
 =?us-ascii?Q?urzoLolHQmgyPWz4aimoMOWdKbQoJhDK+NKzWGbVuHDeAqpzG/lho2ieyhiH?=
 =?us-ascii?Q?FQcJRXWgRH7bvERrTOR+4B2C06GsvxdlQ/jc1XNXdDRU3beEwmSbTCR+XulQ?=
 =?us-ascii?Q?/lcqyryiM+euZGJqEu6RrjhVv2VKw/9V04bEwNot/kCBIPRx7lWZQLCCR2Eo?=
 =?us-ascii?Q?mfmWgJ0cABbCNLLU/GwK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6bdbc2-6b85-4829-6c14-08dcaf742117
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 02:14:08.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_191415_188094_04A419A3 
X-CRM114-Status: UNSURE (   8.60  )
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

The i2c ip of sg2042 is a standard Synopsys i2c ip, which is already
supported by the mainline kernel.

Add i2c device node for sg2042.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index c61d8061119d..eebd6817520e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -47,6 +47,58 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;

+		i2c0: i2c@7030005000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30005000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@7030006000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30006000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@7030007000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30007000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <103 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C2>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@7030008000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30008000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <104 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C3>;
+			status = "disabled";
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
