Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819B0C48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 01:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As7MY+VAcKJQQtUcA29jlA6uEDTKCAl5clAEIqQeLUE=; b=HBjMri+9wvzbba
	a2qrguMr1Pe9gKIiRoNr4MYW6CE1HKra/5MDZiGTpuwqiQK5dcYUcjGz0lCXSGljYTtEAQc0XBU1Q
	AbKKib+3q8xzipWTYKitr9X1ML4mqlahjsWMr6LahVJjU5pKTS1sri+9D3hTSfrSGztfft6RTpEM3
	MRWbL1lfSXrrGVwFQ1qMeKgoma01sP097/NDlQn1HeATmUjEHwyDEupGg/4Ihm3eNIrXE+YzXibYu
	HOugwPu3JmzFQsQyIyR1obgjd56IJNMeq6lbwzsvuiHUn1en3rFzMBZDU8YxWhBfdIl5rrPNLxqgh
	1aBVMKTj9Huf1Z/7Oalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4CB-0000000BSy7-1otU;
	Wed, 14 Feb 2024 01:36:19 +0000
Received: from mail-dm6nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c15::801] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4C8-0000000BSvi-1zaV
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 01:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT+4BreJ4OL1iwBppeDp8eEM1+jI0o455De0Z0zgFmE9bLf6i2T4khOllchsKs0RoB1/bi/zeg0+SInWQvLgKOIjB0KY8xBycHTB5RpX84jFWinrg1PvpYa47NFNsu/idVhJ3gHb1CM+GHu8DEymL2HKQzXMxS+ZwJD78pjfrWVkxYBtCtFf1lRrncyeiIDUBFPES7Na/OMSziPLanenXaP6lSp3PV6Mxe5x77xd4S44Y4lBJPlDFg1pyhZcW4kDxReDjKBhFJRVhRUiEqqeuKbachbi+2cn/bwx+Wr5sqKuvDwIJlGBfma+zZbosHNYfIUdiIaS7J6vFXbf6+FK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAILyGaP6oUcjwZUbrwWrX1/9+aVCc+T6mKhlGiIX/g=;
 b=aedH+FeBHpq2l/7AFf8AEd0D2HInaH2DUW0j7bI+u6cQi5ZKyBAtrcuGgXge8SrlTIM3RxgKUZvCg/zBLIzGd2I9GVKlzwpfS+8zUixpOlwJX0Oyea6MDOOyXeCa9kUsVU+JEyt7ScdYwA2/3Ek5pm1stipavCnwSBTv0xC0I2rMzCmvywAz/A+6l+Js4kd0ZEH+hW+guG/hnO4o96d5NZ53lS1EUoDJwNcy+sgLOJQFN3L3TcPBKmMWkSBN5NFmaPZsNmgxQkEGAunWqjUY2/yiXuzjWmWM7LN9Pd1DAOOtdlakhzPX1KM46Kw6LQfhwLjFr176QaXufchaif2MPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAILyGaP6oUcjwZUbrwWrX1/9+aVCc+T6mKhlGiIX/g=;
 b=XxjXe84lXR3+koh/WqEja9BnQ33lnwZFDvwx5kuiARMssV/W4Fquo+JvJx8MELLcW+o4KKYHZ7ATxryLBEAYqnYpWqgM6Hp/KYl5mhJqt6k4dXtWujIFd/uNwRh2VpK7d7AqnsuQbGpH7vFRofhe22kGbXwQCCFxtzMxgU7bHFNcNE/c1GsPGsMAMwJ/TltMXyYSW4NKFaDV28aogO83JXW5GocUjEhQ8YYW6SmuhiiARhUrXVMvgMi8ijIzaLaFBS0KJT/+PsK0A9+Cn97sFaXkx3hitPrkSiO/as80l53o6d5qG1v1YRXKcNEborQ2tOYkwp5SzyK5fUgzncEf+Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4663.namprd20.prod.outlook.com (2603:10b6:510:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 01:36:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 01:36:01 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh+dt@kernel.org>,
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: dts: sophgo: cv18xx: add top misc system controller
Date: Wed, 14 Feb 2024 09:35:55 +0800
Message-ID: <IA1PR20MB49533397F35C450DB92B00C7BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <IA1PR20MB4953D95E8657A480813767FCBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953D95E8657A480813767FCBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [+5+ulkz148G+a/ym2uORhzAn3xzvlkUbjsP2i4GmtfoVwRA2UizreuHHidT+9OgH]
X-ClientProxiedBy: TYCP286CA0228.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240214013601.135526-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cb2cf1-dab9-4642-8e93-08dc2cfd4d5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4s4i9osvK4YL3Arvct4EKMqbakEYJ9N4pTiUfAq01ho+rFM/C6nQ2zUAHn6WWUv4tnql1hrLAMKmShOVyLEYVcAx9Vm7qR49m9LUqYSUxWXHDtvLMkAd5qh3LJc9t1RL+c9TCCaXMyGPECqWbzf0E5dYhewipgr1ISR+lRRYAOnjX0mWTcQzDEA2UVZW/iNm12LlvcQoM88b6GRmzMF7gFFGrjarw5tvN930xoIDeyBL5UUOlIv8M3Dnkcu3yJcnPN+aRRs/j4rwbAwj7lodvDOxzTXXMz5f1Xt72+woZa+QA/MA80Pm20Vit52u0D+1ZUFs+PYXt+RWOojXc5C2baNrgMN0wE9kwaWNTkDKPzcFGlkp5yYpwKlDFX1z0rrsT2+mibLyMOlOakUEUvGLBf36dkyk7xcNBlZdn2xMZBY88yV+N8r32T5HtVm91MQQIuWP8AGMCX+MnPrlrhoQeUN4NN7LIh6cGyek/6MOqENsOn62oDnFYCcEHV0J+uHVOOVK83Mc/tEWeDas4h0WPnVkoTyxjo+JJxkAMqJr+hrGF/vEH38OHyEm8Wrb7TXCYaZme4Csgy70NLSHoTZq7DFyQpjjlo4U/BXCgwfOlw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CRNWYF3MCQuybxC0rkFbJ5svYMdDsLOSgWhXesDWD/RaKqonsfPgc2FmO2ls?=
 =?us-ascii?Q?Tcxp4ricdtmxxzSGJnXHZWHuhHAt3s2aeCyhLWMeLsJjmi67IL9XYusJA92l?=
 =?us-ascii?Q?dL4RWPtm+//UHZwZiY4UgHjQjMexzy9NSdsZfZKZvXKZtMB9v72KUWR8Iwse?=
 =?us-ascii?Q?4Ozy51IMhyTXbg4flg6PptUJ+i2auBKIY2HAMQ+c05vnpDuIZM0+/mzZFLgv?=
 =?us-ascii?Q?SpDylTV6PMx2TJ02C7wcFBAXH0VYCRqod0ELvjemcAdIHK48ceUFtyGjxw/i?=
 =?us-ascii?Q?X8bYa5zbl72N058COY3Dq49TngRO66qkuNJskru/KuibYjcOG1a422FZJuV1?=
 =?us-ascii?Q?7uv2d4go+/HIm0BkcfnUeZsilasZIfLjLBd/ymJAFaSujpgK4GcKWFKu+mOQ?=
 =?us-ascii?Q?YMU3KH2fGX3E9+nuCjYWJ0gHgtfTj1X7urKGpN4nUYpPGAJQy3ymbJ10dxOl?=
 =?us-ascii?Q?f6GwW7hmVd3COZwEsfLNhO0wUrenPE5nPKgAbondRmon7u20L4XF+sSJ49s/?=
 =?us-ascii?Q?xkMD2m1qTWnyCrynrlj6LMfjfD2tvf0zxE7bHPCpgYdV9c0vBodQcu+QDFkW?=
 =?us-ascii?Q?ne+wYSXGoOMfJyCkLa7u49G5tuyqZ50XvGfkLxyJIijRjlbkQ9IQ1f4oIhMU?=
 =?us-ascii?Q?5CciK5eyVYrpf2txF8n/PT6BvCpcehZqCaRI2Jhhq4E5kQ1RQcjPUORpI3uH?=
 =?us-ascii?Q?mTWXvP/TtYaEOEhdx/U1ArgNdyz6LGDfovR5/fBFZWXJxgPSCM5BmevHjl56?=
 =?us-ascii?Q?1hLo8j6s19bxckYeEXjpv1lS53Gj0YdvQ+sSRfS5idgtOOKa8tbSZcMhaoJQ?=
 =?us-ascii?Q?h9hlYDpw5j6lV0N4o0HxQ7By0zqiWrDDKeYLU0Bn7sDuTxNp9f0Ku7HmeGhi?=
 =?us-ascii?Q?90Aplz38iGq63IBm4uaDAjr5ZgyO21HSlOOMWUjlXIVM6NzHADXHUNdrYSsb?=
 =?us-ascii?Q?RtO8BxXCYdbywGDmDP9eAb/Ff6rgDvmupEgk+GklRdU+L26kRn0CBE+X5FTN?=
 =?us-ascii?Q?xBtxEbfucZFqfV9nJghNmrueNzrIsPVdQRrOQQSKRc9Utw9ACSyYdauGk1nG?=
 =?us-ascii?Q?7x4WdJaSPoDAiTDc/mrpNCTCJYcZXwyau/14/HNewe1Z9YcQ1E5nA+9tEJBh?=
 =?us-ascii?Q?HldDcp3pRLJyuCmcB+i7/v5ffXsJ6d9Sv4dKYfq9AlgQAAQI/1piKAjrughl?=
 =?us-ascii?Q?/McuxYfygVU9VNV4vYKqjU0WAUBVHceTuXpkZtOwdpA4R6pRvIv79VUZILrl?=
 =?us-ascii?Q?XzRkQt1dkYPKIq4sfZWpEldt3NdryUPDTyuOG9MznvLQ+LtcFg2yyzIiHFHv?=
 =?us-ascii?Q?u0M=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cb2cf1-dab9-4642-8e93-08dc2cfd4d5a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 01:36:01.7942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_173616_538079_BE4E15C7 
X-CRM114-Status: UNSURE (   7.37  )
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

Add top misc system controller dt node for CV18XX/SG200x.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 2d6f4a4b1e58..dbf018e99c48 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -53,6 +53,14 @@ soc {
 		dma-noncoherent;
 		ranges;

+		topctrl: syscon@3000000 {
+			compatible = "sophgo,cv1800-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
--
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
