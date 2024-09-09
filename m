Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A5ECE57E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WdDw0tMJjVH+NQkgoHgjeAc5jFUfpFVFSaGXdNbGnc=; b=u6oIusAusYswDE
	cjc/8pPhK/WoaLglOV2J8XOMFdhL1PGCdnvLHm9m+14vxM1zFTSKeXiGmYKEDnpZnEc0UKbgqnS7h
	ES3/yYXy6hlcO3FpMYVTAMZM7IP8wmlfIZQJk/0uxHgQOVa5hJQIBSM/CPSeqQu8+D3D7KLxShsk/
	u+pzhHpiQpx0tXTd1sZNby3Jj2+nCxYNlcvWan+XodvI2q48LG7TA+pg78c6QyTM6W5yZD6OhIORb
	/n+7/CSd4LCWxrCW1W/sA0vJuJatYk710WKaYSORIe9KgvC3UOEckaxrSW6PWQ2KH2w6TF449Lroa
	0bNdwa9Cg88l4raU/eLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snn0i-00000003V2l-1Ns7;
	Mon, 09 Sep 2024 22:37:28 +0000
Received: from mail-mw2nam04olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c0a::801] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snmzy-00000003UTK-3zW6
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 22:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8KoOwC95FA7oPUjNNdEbQj+aC1LV/5Qr7qU4qPkmsv7s7r3dDGyw4DC2Sm6b/InrSkc8iIhwrsYsjuO37bJAlfww5g2UHLNwbJk8mvwLnhDfixsB3T3Cj08zi8TEvki+Jf+xxGIMY0t/zf5aHxoYqBMHdXnzaYO6du7+3Xc17OkHgLGup/f41czUiLlTeAvearlIYSPrfGqSW0PhqxnqoF21dFcaQn+g+gSrhbBzZjfqCa3qVrXNdX2V9Pf879btPXSPeLlDQSYV8m2mHRClO9bvM84CcVxL+bFs/Qo9Fj68hgqCA9+lIgKoASJJNU5+y50hpoFOMz6Uv32QQzCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6juXVdYivnAEsgxqD9+kM5youZAQ0ZlPlfmhD6V6jw=;
 b=N+wnPtA01RwlwozNVFsjvPc6xpXAE4UR6UMCN4C2MA5lOLJoXnlyy6Lj6oPEKY29sHA1C/ckcDmwlQjNOBAfjUjTSyz3rdK2zfujOYZlUDjKxyWdcxYGeRA4/aKPpw2F1ifHc+KsPDFE9ATP2tY/24oVrHonXy2OuJMFXYlZw+lT0oSoebuRoTjvxWi6QLV7BLjZ1X3SpyYWiVjrGQxVjS3PzLjT1B74txyc0dDDa9gixTCElUiBcDG5xYpwYJrpLROefOCgNK7/WU7sJmOGsHMANiC/92k7/6zjmocRdkr3bN4Z/b8FSPEx4L8MkZ125sjmo8re/PFuvs6GQf+S1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6juXVdYivnAEsgxqD9+kM5youZAQ0ZlPlfmhD6V6jw=;
 b=iZRrD2m4WHgTzBvJsEsUIgmxrnfPK6YqYQC5LPsa6pxLQ8Hs/yXcHnHZgU3vSaxaoPxlcOCD6H+MomE8scnGgWOZ/ftWEOOCaWZV5qj8fjp6NEhl2F/dBqxzgIhXnNywt+atjkTK35K70ZyZj9xrEDXJmOZADF4srk14/zWXWPxe+hlwlCZBQY4k949nOIOfzPBT5Rh1/IBcu2oR15FcIz6kH3mzAL7N3FAFnpQRZgSFTeByIp3imPw6j0FZ5OgMcptKGkiH/mmbFWWy+4AD7hAvuHmFMOz0yajJtSaB820eTv+St/nclRBrzj6V+mh+dV8ujjTDq2g0X4xCKGb59A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5195.namprd20.prod.outlook.com (2603:10b6:510:1c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 22:36:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 22:36:38 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Tue, 10 Sep 2024 06:35:11 +0800
Message-ID: <IA1PR20MB49533DB3D0C1861938185015BB992@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB49538E389C866882FAF35B8CBB992@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538E389C866882FAF35B8CBB992@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [WJvoUlbKEX5oL5DL4Ajsq5QegHlbFlGaAjJDNikEONY=]
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240909223511.33713-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: a22229de-c483-4813-2e81-08dcd11fdc8a
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|5072599009|461199028|15080799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: eFpSYD86/+S5NGy9ddRbyVvP0cpA4l9AtecgWF2exwVj3bHbJi9pLDGGWXtUThZgcsOGuybKr1SUEnxdoldlPn5jOr96y/jCuPe3rbagiMeAtPUqa8umapHU8FJW4Rbv8mwyR+8rZhtt5bp3+njDkzuR0NuMP+pEyL22XekoWvrm6IA3VkhwwN5GMkb0qAUUftC9NJZn5UFUmZuFOqhNxzeRMEyGz36adTlJnfs+SAKaJCUkdQLCDEFJm+05fZNpqR6QUMWmUL6atmpvjh7mu4ial5Q6ugTJ7ZWnWV05tshP5l5y7xzTjwrGO9jZuZoTKfZiJu0GIXq7bU92XaMSs/Bw/ci4K+4amoQGl9pLX9DOkKMxppnNHOIFscuick7nE0F90b6i/XRA2gLwr1u/mfRyTQm989kAScKTJdF9IqhHxbipptYzt8Am2c72gsKq7pKyPpsAY9hmdnwyQ5eiNBxNFi9sKlRJjfzFSvKwyQKacmS6d9kqtaoVxglQExtfZjYqOyJb1BqHgICNNan517J3Ie8T2aJGJyZ1xvdX9xyJk09T69hdqf7jt6e+/hTz8iQdBPsm5c1ACnmx9/o1MJQlvQ4dBq5SchXAClG1+/aN+CSZuvD7D4MHaWDuICVJL2rlU/KlIBqqcOqvQxer+TVwt1VxC3M07xff0H1xr6fatqbZkdh5NjvFJwQLkXirE/8KAxraKcMdaAQuMosnF6NPMGKtV+j09KTFwAqRvgY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?54/tLqFTSEcTKF9+j0ckmdSgipTOtZedl7d6SgAArrpPiaCYjTuCahza4RBX?=
 =?us-ascii?Q?8A1igJG40X0ZNNqFRBslixOnzV4kFOb0jNlMsmpNXd1V15lIFMIFKoMF/zzb?=
 =?us-ascii?Q?bVFXEzHW0B6no9M94gbKTivSVYn7Jx4VX22e4I054ztSgEO7WI5o6IJlCzYC?=
 =?us-ascii?Q?uHANwp6koyd6/p2ityyA81EBmClEwXX1Kp8ev4prNHFHnEiwUw0ssp1U3Ats?=
 =?us-ascii?Q?9BubeK4gCFdqbY9Vm8LqxJS3RXxnhiq8j723ECBb0d9KXp6ilyYNxRiFe+7M?=
 =?us-ascii?Q?M3LfdUIABJICVYQX4UO33PBgJaw9rtMcFRJTPNatwvbyZQDkzNO/kJxdZeYo?=
 =?us-ascii?Q?x5eEW/lOBpm2dTftNeTHwc40+asYbMfu8luk4qis+XEzMM4dhIZVwxSjzQls?=
 =?us-ascii?Q?+AgIXnbcY1tFtfBQ9UvfBf0h22SEudhAfOEgkxaEaDeyFWTQUMT6MQ3b0s7x?=
 =?us-ascii?Q?IIoxoDzQCPh+iEpOPYfQuKoCfTSAuCwtZ5An/XeyftLdBEdRfokhnrhnI3hY?=
 =?us-ascii?Q?0g1zL889cvor3sEe1I/C0JNrm8Bi71Q35H8FUy0oiVFE0CT77YIDlMCnqp7w?=
 =?us-ascii?Q?h+QYCeWuKseP3ngKQZOegkwwRrHenwS5vaoPDGh2UMoOKFfpII9PguThnfPo?=
 =?us-ascii?Q?V7LkpW5waCEGhM6OA9+Ew0kcY+LkyolenRJdQ+GEO+bGV8bflI6ZhSHLGN9+?=
 =?us-ascii?Q?HEIRy99lichyaYwB1jrLxJLyoSYJEzbsVNcAiLF4qJNtOLYuUGfAPU4tijxT?=
 =?us-ascii?Q?rrVhzTR8xWZT+JRbTjTK7mPG7iVZCR0p8sYyfcI1MBN/GvpDJCn3f+HQ3Ltk?=
 =?us-ascii?Q?sFurqK02gqFcpDi5Kc+h2oal/p5I95o8Tr+A5G2vvE/wBUA+iTqJ2hepXifu?=
 =?us-ascii?Q?Pt+ClhDjYtnov77WPtO9YM6ipuYuJmii3a8gxezAn4GGrDHsdV9c1uEZDqXz?=
 =?us-ascii?Q?0aFqWJ7TG3KWRRvnxWat6SXkQPyBQms+wQQi4zL6kh4JyQQNfpooU5SDrvbd?=
 =?us-ascii?Q?xTklyLTKeIQqDkYE8DkE6NwNO3nMvMUZY9HGb/PXnrLkgBbjWEAxs9hvXJv1?=
 =?us-ascii?Q?CkFtLJZRTgDSctnkbzJjZkN178C6FEO0mdzN08A5/UPp6TOi+B+C8MVgnzUj?=
 =?us-ascii?Q?ALJvfDKl0bnMlqEWS25B8bPFwqtXNrPCnYCdRn08ssTllJiGlwGJ7m+PU8by?=
 =?us-ascii?Q?kgueVZicJKsbUPAc3sNQBUeaup79/DQXg5egedC7VPHuQDqnZb0y4lQJktlB?=
 =?us-ascii?Q?LUq0EwWIVCBGGJrGRFAY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22229de-c483-4813-2e81-08dcd11fdc8a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 22:36:38.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_153643_020945_0D359037 
X-CRM114-Status: UNSURE (   8.55  )
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
index 7fa4c1e2d1da..815114db54ed 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
 
 / {
@@ -13,6 +14,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3001000 {
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
