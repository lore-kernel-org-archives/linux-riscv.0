Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C77AC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 01:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aXcgxX9oYB8d0QmJY+YDHD2hJ7oTo0/OdlrQHKEQsU=; b=RfHl3278qfwu+W
	YIjJQzoLNv+ISUQ/Kxu7KEf8v+/M/njkQxtz8awGRoGl044mBgC88nTHnxUqUy9BuxseJkkFM6d6w
	BuF1plkvBigAb/wvOyImXBnu+1cCr9LBhQmyTY0nIV20fwkVNlUbiuzW+AopEaMG1/m++9mGhjj/k
	S7T18uaWjvmAtrrg3LGlBvuOTKNjOLtdLwQZXDxasKn+T9EoUjT5lhaAwx5I/sc3T0EizPo6yvKfd
	XpkEAG4dSeuDpO3kS5fQ586mZePV+LRVvJcjMYpfQG3KFvQMaI9ZXDum55cM36pCm9jrYKqOXlkfh
	Fwk01I1NzQBCRHTFgKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYEna-00000009Ym0-0fbe;
	Mon, 29 Jul 2024 01:03:38 +0000
Received: from mail-dm6nam10acsn20805.outbound.protection.outlook.com ([2a01:111:f400:7e88::805] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYEnU-00000009YiS-3gQm
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 01:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elbszSeTr9A77u7iaxzvwsSt+8jFKOr2oOGubjpXesfFFQQOEJrmKsIAR7LvOOtouTY+SXNxzvQebDuKBxO/uliEJAqo768bcI6prNY6PHn6vMhH2YfoOz3sxKslOwEGtzynmlCSbO9axVfNnPgsen+o7hZOL227AsQK4/CaasbReHCZnGOiZYSGpbzUUOAKF+V9+LMEZvyGNqMQBD4gH9jJm2Un0FZLYgsY7wGUOO7IUePNzPZ3FJ8BhZYkEn1hPjzFlgSaePVanDByK/DneQU2T2JkyqtJwP4VPfXSt3gts1CJV32K/fkYn0WZPOtHx22tWSw+HYI8GNHWhuY9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bno80+wEBfEuz/+UkWzzr/gZKqROScFNCXTxvQ5RnLc=;
 b=w7HhBqexvcaIIkPqWZoJRV9aCpa9tFmJbg9VCGOz2/3znfO88CmuNpcOKSZ751Fft42TPkxC4gGEy/7ytUStD0a8rVoYSY+z3MNYO/wroNAZW2YQ7eNlq9jZG9wniG02zJCrdMeO0UCm9FEEjnIvzOMwoEz0CAOnq/pG+OJKLgtqkZKApxmxGSixxrnY/4lP5VFow3xOQP9EzSX5E5B8y9veNm+mhbIzUkfOqW1wiTP5BR+5Yk2grLfYC2XC/9LiyVqHe2OF0DjfPg+Q7LQsQTGIFv4NKkxqHStmstZQVZwgP39AfXt5gTCvBPiVUJMgZJ3yi++vV4P4Sud32JDX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bno80+wEBfEuz/+UkWzzr/gZKqROScFNCXTxvQ5RnLc=;
 b=mn8bgA6QmI+QQnyjMIfXqsy5kYg6RtCf7pdhf6eUG5AS/Op4CyuFPg1jOfAwiUqN7MwRVDJPdcLstUqhRyPaQ8dE42WwJ+Sf3SI5rYGlLvIKFHen5j0cgo8+JPzXRi7eqjDw+rKbDgAiiwj13zpzlumxbFV0Iq1R6sfpG1sx4fr5rgy5nWwqhK1vl4+CdiiXtAzSzlo0g4D0qzp3LIcmJNLgwD9zMQxADUypRCdtVhIVN2pn7wgeFPNltnRZBLIMfoGh5GXce1iQFuAXI8x95otqzjI58vRKdxq8fm+MMcO3e9yMdPGrhzDtDC7OaOHY7ounSB3Lgg1RKR91/6TsDA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:28 +0000
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
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Mon, 29 Jul 2024 09:02:33 +0800
Message-ID: <IA1PR20MB4953385123A52A5447332D3EBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [BHhp99Ru5SxA5RwafqRxB2u9p68Mn+JIGwNxJHkaBaE=]
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240729010237.650411-7-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: f13eae26-125e-4461-d825-08dcaf6a4193
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: v1qzRHWhtEOzudRxV4VU8p+H+kFUrPeIYNNd7nId/3OLx4+CyJpdaZ5B0+qcmujxEsvzLDKFW788EmPGTCL96f+o/Drv5sxAQhwE6sxEm1YUtThy1jJ4uS1Z3tKMllQoxPfPbOnaSyOMJVj+ODy6X/szgn8KuOIn6BZGvcRZzjyZqIPyC+/uvITvRkgKBEs5T1QFnRU6lTPjgiqyEwJqKmeuPmh0twh89Vw4jo+VI3ai1P9Q3DW7C/VlpLoUElUuOdh1cJJqNfd+O3kK/eWXwJ7N7WZ6wivkaT7+9A5dQGd3jjmB0fWEYnlsh2dvL/fMvgr+Kh+IicoBfZBYmbLqf0JshpXMGYAAo8b7oORBGTEzf5ivdqZpZiki1SvhgsYcIn3zb3lbBa/SfKNBjxy6b9bA6k1c7zn2QgOerDHD981u0Rxie+imGwer9jiXJ78GdIz6OiuQIZ+h2dogW5RMWazFkJfp5VsvmXZhmmVz+8hH4l8CzIE15onCZSkcnHJzuyCieKwv+aPz21kr5VTzWS9intUQNMWkYOlpKD6y5024KEDhTU62mXDaqZQ/HXVQJ1/6SrI5Z9Y/5gkC84NVDdfFIzbFTL+AgiPSTgOY4vgrKpFjevMS/reqALxIH7RDMFgakLuYhksFHFXs12U7Ap+5QufAVXXA2bpu73LJMAJCzyCbLTCfYVSHkbQulqpWE3aKnzyHR1esH/w0lxZf9w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5ZPG22kRhL3NLF1CGKm6Ns5ATwFpIOXoVx7DnbUL63NvuDP8Gh4oBbX99iR?=
 =?us-ascii?Q?pCyvhrNDmSQNY1FglfEe7TBEUYx1gxK7HmOdkp4o0k2Hh3dd8Of69lVVObCi?=
 =?us-ascii?Q?IBrlaEYawi1/rxkX99+QqaH3y6rClXoRTbWakqq8Qz/mCSqJ4IK0j5YPJ+Sg?=
 =?us-ascii?Q?J2gqUIrQn+Zi+S69lDAhwyAi/G6YEAIKiCwomLLgQVdfUwFV1COeYEAya1fh?=
 =?us-ascii?Q?So7Ia8mKBUr4ZYZKRJzdeKefmTDwuhwuAjQD9CxyAwMvihs/e1BZSHUd7YPZ?=
 =?us-ascii?Q?ttj0cL6Hss4DArrgPVeiUi7Qoii/li3sLL89rYJBNtjeYLU6dElp6UvmN2cy?=
 =?us-ascii?Q?CKSMAOG2OAdbWpNY6dE6teuq9yYunPF/r74kWf6TRSfWk3AtkwHbDBUANsKR?=
 =?us-ascii?Q?c55KAbncsmGMPbjxrtqdkcoIZSjlBqvGKz6zyxk5wykpS9aN+ijG3iUB182f?=
 =?us-ascii?Q?9Il4bM8Dnc1c7JouFceZMUWdS1jm8kx5SRe5GESLwcfu4hs1PaV1+yf48k5h?=
 =?us-ascii?Q?IH6rlDgKFk0tyW8xrnckF4rwvodk43Y0CcfdpnhVmsmKYU3zHw/94bLyM/bv?=
 =?us-ascii?Q?AJFqJ8KC3uWKGFr8+kaXy8sn7aOHGly+vON3H6Zb4d/7XeJhSn9Bypu/vLFh?=
 =?us-ascii?Q?juxdENkxaoySow7AXKyZ7RmC9ejtdX0pHjuVqS/RLqiKgStKriH/zkFbPqG1?=
 =?us-ascii?Q?ocpMZBuy8sCel930LytJagdu7sTsgrC+3zjrGBbFepsQM4LOGUhMcci5ge6B?=
 =?us-ascii?Q?Xjc2f6ctHZKpqyQ0V2+vX//3gL3QSO93s4s54zYAaZgZtqf1w3bbWoPOVAUM?=
 =?us-ascii?Q?dq+StM97bgPqTvNhB+PY8fEIQ/wpLTwzpnM9AL3Z7RefBcu+7pHRaJQYKcYW?=
 =?us-ascii?Q?uS7LHTeg/6I1jfdDo/eVWU/Ow2d6kg11x3hep2cA2vRtZY9FAn3lLehmbq4y?=
 =?us-ascii?Q?d0MDjQZUgZyCPOoWSeI5lviJkPQzRnRDlNhPdSxUAGi3mPwloruf1MSANbeR?=
 =?us-ascii?Q?oxYNKMdtMCKcg0P0ovnhYpbIfc3Q4ybMY6PSALPZXiRoZBotXLdGkctbfsqN?=
 =?us-ascii?Q?mJZ9skLSuGuyxhnncyNaAp2ZP5N+8QwjqdcCAFgmxNfavKNjw6jg96PbSVcd?=
 =?us-ascii?Q?RFgPWG2EbtyrBRV7ZSberMFippcFglAZBJySGCRHT2cdziIEPFqJMfEwRpzZ?=
 =?us-ascii?Q?+2QeUxjO/cJbf89ttf+wOZxXPG/DuXtqqqyXMyw+Sh7LV5AmRZ5l0xhNXGeL?=
 =?us-ascii?Q?a9Lv4SNvP+5Iw9U6vEVA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13eae26-125e-4461-d825-08dcaf6a4193
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:28.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_180332_976728_346E1C7F 
X-CRM114-Status: UNSURE (   8.75  )
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
