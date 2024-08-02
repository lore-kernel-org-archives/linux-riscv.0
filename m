Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B161C52D54
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 00:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ImCIdHO5wzqtkbApQdPUh1wuTIg4PnFFkHaXKs7/NU=; b=aYpYzDSe9uDpHy
	ukKdrvfI5tvHbmr36iFr27QKBvRRRsRS6I5hFPM9/b3DqL7jWbksjREs8Kq2uRE15HuuJMLgVO+mg
	uAJZuKKi3xzawTBZ6wTAzb2Inm2kehdpdY3Kzg9tRSAGCzfsrQiV+5EwK3qq7/bNtAQNDIvIV8PsR
	4L2rt5o/uigurLyJ99OXHS2neSpkljxgpFha8HFdRtyYindV+/Nin9QatZpcu8QI2gAQnjysRQjhu
	MVz1CMRuriy2v0L0hIBViDzZjOhCk3imD+EEbHZ4rmUy5JxeeIOPV0IIxKSCZ2tId81xXy8PAKyuI
	RGnDnhrB2Mabqw0x26dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZgHe-00000007B6O-0yNX;
	Fri, 02 Aug 2024 00:36:38 +0000
Received: from mail-mw2nam12olkn20816.outbound.protection.outlook.com ([2a01:111:f403:2805::816] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZgHa-00000007B0m-0G2i
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 00:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/StV5haM5TG5D3Sit7TYoHBtCHTli46zFASyKrOl9V5pCjkJ9OES+Xseg/yA8QUV4iVeeQvkwrg9zmoBqMONJtldIimexe6pvDM5zcu7oyQShgGVH9OOcazxdq456tsSUf3PnF/kbklkdARRvZOYjhSBEURu7URMO+Vqb811viMJEE1xRTAMxfxeUHWmH5bprudjule3EuyZoNt8Q3ugfP/8riWkvsOkpAdKieZPyLBXXL8WSIQo2lsYCavWyBm1ghrgSFWVGx7/Om7WivUKLKOZFgDSDylH2b6Qs6C5UDzCWM99yWdZlktcHhkqI8hOoQqjKTD262NHgDgx/fU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWZGPh7h/2vXo4WEMqPU37L/ymAbplpSlRDUJ+faVR8=;
 b=dJDFBMspzNvXzH7L+PvIsYkSfL2MfOun1eQJRMAC5obpdF3oDC6bdVNTG4YVMb/bpLCez99HYx9ODyNCHwjdzC0rUB5o1Ass5QytsLSFkDMCo/mDJ+EhjMqYTrOzYzbPvRm9zf6cQhaO6YubRDzghVBYCFIjUjNi4aGQn+OMzIeeI+vpd4tp/AWSMxAqqgnfBEd/3xmOUliqFiE72TDOBH9/aRFizAoKpWqxslYe5W48bJKlSQj84i24OW9QDf1mSlowgRrOizvB+3g80vjYofuvTGtIZJarw8TIv53046M+gZl5UpYfhBlak4tUCU3NwZ7AOSq8jC/keHdoHHFFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWZGPh7h/2vXo4WEMqPU37L/ymAbplpSlRDUJ+faVR8=;
 b=Jfsn+FQbT+DqZwlfMcSc06PFbg/sTHKCcQpR6PEbT2Xtn4dfSfedFJIdvaWFxVkbPo47HkUGeRze3BYzO080crK1l2MScIE+4UCr7ywpfIKVYRN8Xm2goZUwKB9wbXqsMMfztKZSVdH3vgz3kZiUG7NSRosAXtmdXV11RU/FIr7sw4n2UliFBW7t2hnWYYIrbFUGpn526hPr95iW+2d/XqTt0d+3t5EvfOt4+ONdKnp8xt7tL0UaJwi3QoZgxyEMYsd31ve2p4xfFIcLtla6Y/4T50FfMaRaALo2e3N2PAj/oNTDgl8/OOWmO4Ncr5kXET0tmveLUozZkjuZRoaLVg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5220.namprd20.prod.outlook.com (2603:10b6:510:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 00:36:29 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:36:29 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Fri,  2 Aug 2024 08:35:22 +0800
Message-ID: <IA1PR20MB495348B5FFE61FF1D76ECC4DBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [4Vhq77lbSeB7Fw3s3JE29v+sV0sCokjC9m6Gcl2YuFM=]
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240802003525.260055-7-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cc8142-294a-4ba9-e390-08dcb28b2616
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|5072599009|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: plhRgTCTUKxzPl58poF4sTHZpwee6YwCjQ5yG5wyTyhsy4YpNYrl03DK1QiRFyNUArxc35+uE/wh0Ko7A1VpBtbKBXz4aTkV5f8UA4lEXtYb/jA9oIN91A9QbWFP8ZbmoH6a+GqvBoUZUis+QdjxZxy9DWZFu917YP9pV8w2ZRfwUAFE/JbH2MgPo4z8yy0REbLuGlBZog4z+6RO0LNadqBmWeA5Uudb8ic2nYw+HGU36NnTfcJ1KAOi4WGZQptZiU3d39IaFUX7XdTJjbDSFgfytLqTNe5l7zOnCnXgsDns0vEvInBofWxsacAR5kPNREOmPaITd6DTycL2Uyc/Z6eX73K3tVORDNGcbpnmrUNBkm7juFtv5sKho/52FufQf+TNdsv4GCghcS92EYtYtPb2cD+4KlZrTUf8M7+kn+RXMWN2Lg1yrUM5ugNCid9vsiJ2IdjNMV59v1UmIxNbQGF6T9/KwL0KjEBdPoNueiiQ0xFM1LE1oWisgeK9zPogcwTCO2cIH4z0f8/8cM+eouH7NMDnWtsZOFJ9Ud8Z3s9cHtZe2CXErO2FyBSjHbUGSQ2sWVptttrbgIo9/K0u5jtn5qKsy7WDPu14PPzgQc5VdEssNx6Vd3gq/QQvl+Q0ROghxae4FUrtUpBJ+IdFIcZoKKymUtEAqrTokAmQwcBXp4rKgtPUT1vvqptyzVldTd4bt8sov5xab+oMezvnZQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xxl2q8kVO44UwSy0haey/T0P0UodpsBfLsTGJo3gUDS6SBPKaFefIAa6vFoA?=
 =?us-ascii?Q?iqXyoGfihVsWQg0PMtjvhproha1a6vkTZZzkMy7Vjn7+XrEAVmi0IKybrUh0?=
 =?us-ascii?Q?RM+S3rrTdW/ncIrNMRw77YDM/jP4bu3StN3g7tIXEh/sbqq7Mw9cqfxQYsyv?=
 =?us-ascii?Q?jMuAbp60PlZNAkqnZFmCt+Dbbti1cYmPqRRNdQTrU/77/kvJOWPljLEkjrB5?=
 =?us-ascii?Q?yNHaJFD2nVvRh+vmA8VnM84b8rFpwcLk5b/aCVmDDBsy6cq742vL3ZpJWfkz?=
 =?us-ascii?Q?nUTR/U+ZIHkrj92TbWZcPaCv7k+vw62zeOy6mtfHK/2nA9hyAewv3T+L4rNZ?=
 =?us-ascii?Q?hWH6aN1teDfPBinqX20hYCYiiWd7UorPUpCbNyP44wd+AwNQ2MRz1TkkdtwP?=
 =?us-ascii?Q?18r7Q9QHDrQhIrHPpjBJ16nE93tm/u3ZewIiFx/p2arw03NtktDfR2GSaTxf?=
 =?us-ascii?Q?Ct2GJzSr3VOPwlqFlSzFgGqGxrsNiVBU8yMo54wy0rPg9GQ3c1chKgJQG7bE?=
 =?us-ascii?Q?yIzBoh/5uWayjGc1fe2fuFsc9qSTfEUNWdUQAylK3SszGZwavFTNJ2fmlg5A?=
 =?us-ascii?Q?l82GlYPxVs9PShMeqS/3cjLwqhT1Y98dBUN/H4yBJKTxjC04h6huZzNNFJP5?=
 =?us-ascii?Q?uDUk+iuiBbpLq8Uw8kV1IqLuWr6twUQDRRnN1C4vRnZQOcaMFMR456TwyvaP?=
 =?us-ascii?Q?aJ1xN6lQSxgWR+gTFxdNAA2GALMGXF3mj+wbsvag5RNrmhFFaEyY18XfSz7v?=
 =?us-ascii?Q?quYSzR3BjH8qiEylTgaJrTJoQsd4IVh9N7K6NU4iu33qXknt/2WViEPXkipQ?=
 =?us-ascii?Q?/XEl9JUs3nKZGTyrFtw2yqtG+eHCkQPL9EPx4mPMUAK4xkytX6u40gvaVHja?=
 =?us-ascii?Q?60I8uxJj8Uo7InPRg2/4E3WbKOQOQkKFL0wmws9DDV1jiKTDfVjFHjpXSIWx?=
 =?us-ascii?Q?9DsdF8W9eMvXz+xsh8V6UcQMiJUQ0EKbBmurOF/gG6BqdGHqjjcnHcYuS1ug?=
 =?us-ascii?Q?L7t9pvh65/l+J5pjNogfJFv/L6fBfbUIHeu4K9uJxuSlKG9g/MxEKoA/fmdb?=
 =?us-ascii?Q?OvhbXImaORFHSKfsDzzCSHUl6sKaumPmXsP4+eNkegBwIgGZg9kDxRLuQA2t?=
 =?us-ascii?Q?XyuBl2xtpMgIXCcd9YhQw09cX3x6zch4N9VcR9hd5z3+sMH2uRYrU4bFCuPK?=
 =?us-ascii?Q?+AxL4YRaPLmVy6SmEbXDBGUNKvSnhWOp0R43Cla6UJiwQBu/DgOwaUJZqq+J?=
 =?us-ascii?Q?hsA6d8+OT6yZj0L2D3Na?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cc8142-294a-4ba9-e390-08dcb28b2616
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:36:29.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_173634_167565_87D13D2C 
X-CRM114-Status: UNSURE (   8.93  )
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

Add pinctrl node for CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8fcb400574ed..2dfa450f0d26 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -4,6 +4,7 @@
  */

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"

@@ -14,6 +15,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,cv1812h-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
 };

 &plic {
--
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
