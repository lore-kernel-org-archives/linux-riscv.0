Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3434C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 00:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezvnB6b/Zdc9PHJJmWr1xjZf0ZXgrjhxDlLy2dMLbAY=; b=Jil0kLQQKXHxyW
	TzR2tLoR9YxZBpolQEykQdGUjguqXQ+WyJNjRhA41P/perpB5Da8EqwbfAKbPXxEXSRYpASIkU/ov
	ZPZ5Ie1/aW2y6SxnOuZ4WFM5fz2Aey7K09Q6gOd1m+ecQ+4vhYMDO7D1Pj1lxCCQPufwjIvv8NJga
	Q8lVGl5+D6WLL9R4eGR60W0PY08+bnno2I3bcx/XoS6v6fCWbl6tB5FQJ6jKxDpVhnTaKV26BG5of
	G+nPo3T2jHU0GkgtkI63Ct7hMIvNi8yFsGuBBCDO/WEBMNQucr8XtMiMqQgXT3hX7PaDEyMYijnGt
	Bzg2TNYKLdHPKayjePyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXsBT-0000000CIpK-3wKR;
	Thu, 08 Feb 2024 00:22:31 +0000
Received: from mail-bn7nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2804::800] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXsBR-0000000CImJ-2ndd
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 00:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjWk4+tKTU3vW3r2rPn5gEqrhO+HNOrWovBKL2kCUuOKyd7j6Cnl472iAz62nGZoiJ/KtOakTpQ5T5dZBRjZ3u4r8qHwadOdFydKL1PC8N8WkuYSbKwCCZNKZQdBuWEQHY9W35CjsueRLXiCaXTajlkOrtSl7uOB6GrxERqKAHTIIB+3oBihcA/ea3NRhPkBeDm8WdeZZA5E0VkUkDZ7NO83V1671d7ovfRScYKBboyRtaW4ZYZ7DYHxgMOvTAyhiQ9HeZMv6jq4UVwG3SVCzvUiFNgjcD1Nz/5TjoVSl548uw4uMQnbA1mU2dscYfV71b8sYISlZKARzB7CUzrLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypt42l9SsMippUWY56InaMioBB/zNlNhamPmEX0NqEY=;
 b=Tcd5BP7Wh8ylnacPRan++pGGPvNw+dFoqub8880LqvNqGlfFoWeI/NLJVpn/ZOi0itxM/yt/iA9XlRcsiRmwwAz+fqi04wvturoKHIIZFCTBrEe0F6p5qLVKaC/OlNUd3L7N1CghM8srQ3pubY9gbSW0/p9SiLOqZ1+qZElDC+4bAb6SMfSvPwMFTCACmUW36BWCuk70nrUqmIxfUEPvLNsV6wj6pj5YA7JGJpGiqdWLFbiW4wYcbu1C9+1nlLU+MggVCfH7BzM3+HeakgW33494/CuLzfIkIRFwO3+wnLI4ioYQcn07gJbS347cBes7/y10b8/6JI2fNKHOCNg40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypt42l9SsMippUWY56InaMioBB/zNlNhamPmEX0NqEY=;
 b=XhidEUEewauFMyUDROG3owocCfJ6vsdSoKJgYJsQ/yF2ibLcFKTRGoGHVyd12FrG9CR3SIXh1Ys6MHhPh9Og8EYZurRNu5Bi2/X2aQ7egFIGFK44jkh6HvHe8P9uF7E/cXvdI6UQMVrSQWu1el/IWymeDxSlkM5v0vuIfhhaJV23Sy0+xl4UFxnTFrYM04UEhZ5Jhqsjthp/ExhSlCYKWagP2aKIva37D+Ne7ln84Ka5MjlakFDcg5xm9weqXTuziUlldFm7HdCnu+j3wHDF0oPo1ZXxH+6KJ8FVhihW0H6uGhWou1JS6Clz/dQtW2sg4BQm0PNM+hFpw9f+6BU1DA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB6986.namprd20.prod.outlook.com (2603:10b6:806:3ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 00:22:24 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 00:22:24 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: dts: sophgo: cv18xx: Add i2c devices
Date: Thu,  8 Feb 2024 08:22:12 +0800
Message-ID: <IA1PR20MB49531AA2DBD4832B7926D4A8BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <IA1PR20MB49539A9C5F5CFF6644ED2C2ABB442@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49539A9C5F5CFF6644ED2C2ABB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [Cg+rMG2UiiKYdX/AodSAow8V4aeiVue259H7s1WVnZuCj0poX4sONsRXHcKS7+85]
X-ClientProxiedBy: TYCP286CA0308.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240208002219.162732-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 900323ce-b5b9-4bcb-aacf-08dc283c0604
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnqw99sp8YlJuUUStbhLtmajhDc4b1br3RoC2lqxSKHnRaJfHnMPlvnMVoEIiuYubWMrGbCQLa1WZKymg/hwxV3xqiVjdOIeqPPVeXBGtgxASMfAjZWePrBEipzkuxrBZLZRRiITXOQtMQ1mWcAZPFD6H81WkiaMjggBJc/ozUn5HivGoCW6ZP+6DmoNpiWbklkIIDJW0Wa9QCknWwZlMqphO2iZMwwCaZfGS5nfcelNZOMaZri0qYUGqLqCmtrpYjL2CRH1XeH79TaQSYSWvBFh0QkUapfOHFR+s2gG4encVeaLSuzUimvcIwbqyShrE7HIB4CWUUGXzRSx3wqxGMAkp5veOoSFSipd1Sxe0djObiNkDpQ9AW6R3Jcm7XG1ZqSFW+XFkiKIka6TLdOBU0w2RyCjvrNOhxw0o835tDsyS4KelgtYJqGe4Epjpwuo6U7B2gg/8uwqfLzhN6JKR8BkihTIWsHUKTQ92Yg4PhL0cW83V0T7JuL42sgmy2JTgNSmSmMlcd7x/26zSq1sUi8+cwidR++co6KoH2K/AToGnjUqwlvDEh9kD9PjQSwA8hx51raZpLmEc/7q9le4PR3KRNR4nLCcS6ONy9eSP5RwFhNDNVJSMLKg75rLXhTCC2q3lp/s0pSP0U7FnP8y+RtRafQmtLF0cuKEUTsP37hZ69PZmhp8Q7VqlvhTXAQwACSIh/bQ/CCQA5V6rh8YKLTzsWA8e2WlhzdOVkkzfGa6xySh+vpjBReDa3HzpGUejuQ=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMe5uR4nLVKAFhrZz4OloLa7TLQ2zp51YGWy7kxvPTFNOBysbNVEHBKIa+M4vUyDFmP1kfupDmcCrCuawiQzn5J7YPiX6FagRrZifCzaXviOnitp6iUm0G3LkYlWSexKrpcLMsdRtswjrasDfqtztPjcCNXLL+X88W0cfW4FjxZ0ZmGTwCVh5ioMila2aNiHy2rnOEhP97H7NDXL1sGzdZ/TXHYMhFP0TWIeX1vUilVYksNCUAbYrYry1zHx5XSm1o0djXBpgIvg5FC3a2ueOKRH5bGyM/et4IS1AeBiavWq9PMg4484t87vZB7s2rxtGXyFP/c4jtZ7ff1P2WHLI5IEaUyeu/eRSGIHtPXejM5FNsn92Wu3KntA24p/NVPW4i7hGnXaWGMlatL8B5kabkcIfCD3CjayTEfCJ0ADvcTPFLoYgfujNUImWL4SEObGwk9QvfqzxFzAMFQt/MQcMEJqhDZLFF+Bo58XLKnbmUkdVf3/MRs9zQTRrXtElKicQI7RFK/xo4Pwh205aCh2j/v3c0uR3tCuzbxdIsTJg5aycwfF6iBQsfMH2IXBA6FeVU8mu69LF8bAu1V2+oNrmFeCGpwvr6ma5uX9sd2vYhE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAVMO4DCdYRK9k9WBRYwzWaBxbKqEuHHutK3jgj9kiUVUzCrMtOAx6F5V1cL?=
 =?us-ascii?Q?Eov28lYzi6Trda+IKvpokR3Xsv557Rew/Hd3IrAG5pQ3EwPqtc5z7EjqIzJs?=
 =?us-ascii?Q?oqMaHchvDOJjjxdl9VBAGQqfMed5GX/Jzf9igKk1oEM3AzcSM6xJtmOAd0pj?=
 =?us-ascii?Q?PXS10Nk3XD/0U7m6MHJROPFFReLb8Pi8sMR1BtzvAL1wk71+tNHXTEXmN9mb?=
 =?us-ascii?Q?1qtuVIp7lTSQ8nx2sg/P6eke4j4zc3Ix73LFrqVYQApTowUCYdcdnKewCiH+?=
 =?us-ascii?Q?DvWifGsfqDpy5o1SSwoqSJaze4IRla2EqviwjLaEexlht/rcUTfogu8eC96I?=
 =?us-ascii?Q?GslNFgBQYTbHObQmHQBLzLJQouHLyYqMBDTtZuTJKsUvdZqBjtfla31H5KKS?=
 =?us-ascii?Q?2htWLU1hnJAdyKovw2YvX8KYaDCiBBiLABdOa5bRWYWAbl03XFTz1CJcW05H?=
 =?us-ascii?Q?VbGC3z42lcQDZgmXFunjnTxIMJE7b+E0l7JfXdos7uhlWWsnRIeAswZEf6Cx?=
 =?us-ascii?Q?T/ba5KSnyt4Wy3yB+NA/cEjEIoHJfFs7FM8Wakx2YYoMTXbTXtHhutV4/3fh?=
 =?us-ascii?Q?xOCaErCBNKu+3vp/+h393S3m+OfD9JTvP77UZbzjXUDdEzkgmbIZ4oe94eUR?=
 =?us-ascii?Q?1R6XXVKR9YCEO9WpbFKggamBbmEr9JP2+39pZptGYIx03uVy9F9E7nR6zrQp?=
 =?us-ascii?Q?0/YHM/6gnHcSBDHrt6H/sicwv59hfFa8vSkcq18jbFtm9CUxQW2gCXAZ9/gS?=
 =?us-ascii?Q?YN6MoeJ2dD4z2L6r5WylxX3I9gzrlFF9oKxbZJboxsti3qnHxJEzGOmZFFmB?=
 =?us-ascii?Q?i9kwAQViSXZzoqjOgYUThrC3guvsQfy3BBa8cGqAC2YFnwxo7WRhAluHjDnK?=
 =?us-ascii?Q?feKVkCfa7Erth9y6hGczwuFdCzqsymZnHXs9asWLqF547rg3d7cqh2EZOSln?=
 =?us-ascii?Q?irzZHfwBmrY17iwhHGxDEdgVPweg9/crD4CxezjQxaBenHZuryezkNhqnVSJ?=
 =?us-ascii?Q?iKywZzMbVpwv8HP5qQnFhG1Ag3vN7mtlrT/XpV86PuiMV35+aNwAPhlep2ZC?=
 =?us-ascii?Q?UwLCNHkKg+/VJuUgw2OGWmmJpLjz09Xlj3ul+43d+mrI9OaJ4KbCyt3A/TE+?=
 =?us-ascii?Q?1krbaxjnvKCp+Bh9QW09jODvK6A+jeOt5e+PNQ6Wc6reCfPGKXoAE9Pf0LH7?=
 =?us-ascii?Q?4cm2d/gPuSH0AtEPD3Ru/5lzD0OCJYqNt1ctDoMX/t0Li4pRZDEVQu6azOcY?=
 =?us-ascii?Q?zLBPYfWxWESTdMN4anLtUNptJasZTLauaFt+xeMAqA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900323ce-b5b9-4bcb-aacf-08dc283c0604
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 00:22:24.5995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB6986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_162229_732959_23286C47 
X-CRM114-Status: UNSURE (   7.04  )
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

Add i2c devices for the CV180x, CV181x and SG200x soc.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 71965cced56f..9bd9e70ca039 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -132,6 +132,61 @@ portd: gpio-controller@0 {
 			};
 		};

+		i2c0: i2c@4000000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04000000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
+			clock-names = "ref", "pclk";
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@4010000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04010000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
+			clock-names = "ref", "pclk";
+			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@4020000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04020000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
+			clock-names = "ref", "pclk";
+			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@4030000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04030000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
+			clock-names = "ref", "pclk";
+			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@4040000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x04040000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
+			clock-names = "ref", "pclk";
+			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
