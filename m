Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99983C3DA49
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 02:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eADbeXd4el4LAhMKAwjnv5mEux1ER47XUkpeenVYGo=; b=WQ/WDyREgw4E2y
	D7U+P32HMv8wjervQmF+w9YzmInZ8GbHqddlKMaJSEyoCQAk/67Zp7XKndc8AMpiiWxmWVhUaBBZp
	MN0I5uIEiNhjxRQgQftc7T6jeevaBPvIQN1ipaypyHZWEgfdNkWiWYeLpp0syCyGOTBZfr0UzBg2d
	rGjOpDPsW0rVIvxhas21ef6muLxhbsm16jiIjiECb3myJdmtkT1AvvcvAut4kHNsWKrO8+kpx+uwc
	U6EIAJI+jyXl+cDo/J/CNKqjeobc0dJMuQeftsLLfgoHTbwPkPw8qThT0W29rNZW/Jjo52oxY/IxO
	wUUfoAxgJfu06/NoHf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFtp-00000009hHE-3tUV;
	Mon, 29 Jul 2024 02:14:09 +0000
Received: from mail-dm6nam10olkn20812.outbound.protection.outlook.com ([2a01:111:f400:7e88::812] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFtn-00000009hGf-2SXQ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 02:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+TL75xYwIE1ZjU+3lVI5XboT9ahitNmhvO5bQIAXraL1eqyglhGRO9nWVY6MVnQVwpEXrG/NRXDmXCzsl9ri5iB+Bf9kr+Y4AEhXuApsTaoCSWm6T1j/95mj4HXy0XF7VhJbCz+pdUay4Vvm+J1bG6/kwr5wcltYxFvdDB+2BTlw8rpX/66lsl5pjgCokWU35x2B/ycM8f9MZ6OSO+D5V8SlGfu+rFdc/nxDBnvWm43yO7NvJWv4d+PkmnygF0ylc1lheuyQx4gLscUNP8lLZXpb/305j9Bu2U8WzFsvtnwS5iVS9Lmvh8EFAk6BPkh2+tICCbdDgkMOWgnajeMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt6FcloHGt8gJAQDYpoi3ucjCbNbH5NVP/W4OUd8Wzg=;
 b=xVXFl+ofo3kcPlq4JR9JRZJLdOhZ33kb9rZFO3978O/9zncjP5OIkRfSW0lM/o3t/lxBn3gqnoHo7RhPWDiI01D2QObqBG3OFG4e/qWnxdxvPwEhThxM8qZW6s3zCYSFJMouK85034ROxdZw0y8q9s4nSuWbFkV8lCxKl1hwbYq0LCkGi7oZqdf52LpHPrM1vI//fPlGLlkEOuVEJxzkdFOaoyhbuNVQO/PBvl2vH9AShmOc6TNwy8znStegw/3A8mFpKJrZjbSZTsioRuY5hz0Izjq7SOmfupxajDqWMZZqAGYYzQnjSv0fndizRCKfnktKeqgMi9kMD1YwglCRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt6FcloHGt8gJAQDYpoi3ucjCbNbH5NVP/W4OUd8Wzg=;
 b=nPh8T0+pKqq24pBk1r82SLzMtRAC9qAZ3VaZ6NawmBP/Xeqsxz+yQWKekdKJ5ulVsP2PByjs7MsiJ/iiYvqGSF7fXRacTIxWxdD3pI/6s7YMha7dmxIR8YVy/JbQwaEjFFWv+fIaj7MMn63Ai4C2nLE58KpNpxerdouTEh+ON912KNezh6Qs096o3G2ZdQX6HsszyeKrOB0RgkmVuv1pLwGuVuReN9SeSc19CPVSayGUoqwimq60mg5P3pY3AnuxPbi94a0fvVSCKKmay9Hhx1TxQpCBHg4emsm8emUWb5c2iPTzsijej4R1h0D2YTeDXTOhv4DS7NjJiV1EdvFIPw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5767.namprd20.prod.outlook.com (2603:10b6:8:144::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 02:14:04 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 02:14:03 +0000
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
Subject: [PATCH v2 1/2] riscv: dts: sophgo: Use common "interrupt-parent" for all peripherals for sg2042
Date: Mon, 29 Jul 2024 10:13:33 +0800
Message-ID: <IA1PR20MB49531F6DFD2F116207C1397DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [oJ9NJf110jF3GOzHE14+BhaR3Fy3NBoVJThuLwWNElc=]
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240729021336.838887-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: b298987a-011b-4c0b-c82e-08dcaf741e2d
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|5072599006|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 9IMv4UyFMAcQzvP1COH2BkRogmqCgl1IN5sssJPs3dKTNEqqwSwllvZdt0hEOrb6Nhxtse27Mk7WCvGK7ZnXa0gtLVoQPEjFwIOrIhzWNMI7/ii40UQlrDbB5dZz1IkfTcE8y+TaL1JsS811iHRc+k2D8VzODEbYkqrY4pF9nOGTqA+7gl9Jxv/XVM4E9J9aPy6aD7VpBS+2/AM6KonQcK4sQ4rE53UmhFZjK6GEa1KvHHBjnRdsuFLtjJcjHvJCZWplLladI7nDAngODDje/51ovLiqGehuvS37t+PuvKx6ZtKcUcJraKsnsPfcopxHSESQiFkg9E476Gb6QfSSsM91bBm+ebECfjT4Kf0B053CBt01SAXO/yeEHBMY0LG2Sm6FmN2y4c6PrbDnZC6BqixLqXourrCypUCCv5doIbPWve+RodZ7weEFG3J0lMqqpz0vGtk78ZK+pUgcXiCU2jBQGznuUoohDyPWyVjvkwVFgQMMG4yWIiHDTk0PKowsNYinPm4A4bvHLCEyWjCtoeZLHUeBSpdCD0GpgPh7VfFQg9d9hHV4MGNOjkbmwj8XaiZr6UvpqZsmpUrFPBrqinS1KVt6RQ3/AclP8ZonhpiZ1OBz0n8B2tUKmztcTkcJhMEY9hX1mAAgHy7FpsXUABQ/fLXJEdGWCdLkR1QQXrZ1ioerdebbsy2aVoBhFiMM/zVrZmAB5p/7YCcd+nOknA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWDfKt6AQFK2MVvxilyqxzc725ywxC7ZJK9BOODd2SAd0qQTxpo9zIXz0J36?=
 =?us-ascii?Q?PopbgObQYa5ML4iaLMsOfq/iOm9YNOtBy46Je3/poSjPMneAjya5BmUULP+J?=
 =?us-ascii?Q?AhZfvk05B06wqDU+MyubvA449QG3mSy8zm+tygR+Gtbg7qhsyR2vn/zUNvpD?=
 =?us-ascii?Q?p6KWudOjhiZbo+mxtjPVjKLrj4zXvLJIhjsrI2gBewaL568sCV4EaPRqd0xL?=
 =?us-ascii?Q?tveXB0srmwX9LaNcCNqxriVBnGhto05fTOP0MKAgg7fGNoYgv3odgQlU6y2F?=
 =?us-ascii?Q?RYdrRnojVLv48eVltUj3i9mUTKeLZDHHmxy1Vcqw2tqNrRvLp5YSBNxbDXzX?=
 =?us-ascii?Q?CjsVeODWdVdsfhBwps++Ae6zOVNP7jK4zUy62JUdACerezyNmLBXTy2OBBpS?=
 =?us-ascii?Q?JHg0wdSVD0nrkv6CMGYoK9WTAbwnyl0dYsUBiWRkvTmpgLqejk3tGH6/tw+D?=
 =?us-ascii?Q?s7oUf8ti9j1lrs5pRBkFEzzH3u6DhyqmaWBXaglK1q9PfcrQFgCHZKpo9TrY?=
 =?us-ascii?Q?amKTzF6NdMHH19uau2uG+HjGlg9SRzxUt88x07UeTB7rsyGGEFj7l/olkQof?=
 =?us-ascii?Q?IZ7ht+dx2+Yi3EMxpUfacfQEOe49FDHJnnOOeyI5GLkESs6FW4EmvHuVua30?=
 =?us-ascii?Q?Klziy30uhCQv7WBortsKSqneZvaKiZk67Ogv46ef2lHuMfyVWb+d0AqdlwFY?=
 =?us-ascii?Q?TDljBpYPZaf1nnfpnFCFpIIm1gstzBqX8ICnvhaqhnRCzSvLNVo+Alf7VN9C?=
 =?us-ascii?Q?KDDBjY8tPs898sDNnssFOOsjdD/48uMLh0kpI9brgQKYAkvNG1Tnm+8bAwqk?=
 =?us-ascii?Q?74WR99XAT7mJ9S5nIkU7vvWwi1CJPoU3LDd0725t573usdP+JKI83p6Wdjea?=
 =?us-ascii?Q?oi5f2k0dqk7lP4RYSu02phfZwkU9j7AbVQ3VcDoruDP2AALerd3PVVehToL8?=
 =?us-ascii?Q?FKqn2Jkf9ZibtXxNr8K/qDoXZhG7i4IX51Iwz81Z+Mcg8a7rQH6mliuJ/t1N?=
 =?us-ascii?Q?WEi+6OV52gU5yNqtyOsd6S8dGkwqywbTqq2fMRi3x0UZRyHr/F4IiMKX93+/?=
 =?us-ascii?Q?hnHQ+O9cFBHKA5tD2Rvs+c9X+nxP4qPUmxO3P4JCxE39vZlthOFPVYCM8ihP?=
 =?us-ascii?Q?IRy31++pL16GvzC5lC14WTmjcRShKeurnxj1cf9haIOe9OTm1/wA6C3L7grv?=
 =?us-ascii?Q?KsAosWpPu8DRPP7Uangyeb3EYKgbDhGI7H8l3FDlOxncT+ylRXRYesQ84PS8?=
 =?us-ascii?Q?4Z3mBfwgaym6nDuRqCLN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b298987a-011b-4c0b-c82e-08dcaf741e2d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 02:14:03.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_191407_649247_992C1A3D 
X-CRM114-Status: UNSURE (   9.29  )
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

As all peripherals of sg2042 share the same "interrupt-parent",
there is no need to use peripherals specific "interrupt-parent".
Define "interrupt-parent" in the SoC level.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 34c802bd3f9b..c61d8061119d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -44,6 +44,7 @@ soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
+		interrupt-parent = <&intc>;
 		ranges;

 		pllclk: clock-controller@70300100c0 {
@@ -388,7 +389,6 @@ rstgen: reset-controller@7030013000 {
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
-			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
 			clocks = <&clkgen GATE_CLK_UART_500M>,
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
