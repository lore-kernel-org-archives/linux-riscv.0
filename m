Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D0EC47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PyqwHpZC3blh9VRnIvJMGckgDRgvWBsWie5UFM3ssKU=; b=BTIaE8Qq+ehmYL
	udXXQFzDO2ds+WWboCbni9UDJ+E5xmblHpBzqTEw1HFHiibRG43+t6w6HFJ1v9CafMZt9JXjJXx0Z
	6lJ2fnI5O1e1rS8NBQOzi+RE2to6gCKRPZQnwdn05ToQSvCMQGWFX4I4GyXTpHdVMt7uSI7VrKyg9
	Aen2fOmxZBNOZKslB6vibqyx/bY8NzS+0yQ/W1EqmQlIY+Z8EVDn36hCQ2U5/29byxJa64UOXHLvG
	GGYOmMTH+BNBASRhaO+t905Su6G2YJniyE0kv5AkOn+RiUQAIMPfxbNJ67GbtxH8tavQgvQMdjxUB
	2Qz6WFcvk+Fzu2aHJcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUd7n-0000000EqnJ-2Kgh;
	Tue, 30 Jan 2024 01:41:19 +0000
Received: from mail-bn8nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f400:7eae::800] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUd7k-0000000EqlM-2hUF
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:41:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qex+ezgwilbb0nzXuh7UQQE8HiIvfsSM6ENeoQHgQ6QU2sWZBI3ZBca0IW9uIzJL2Bui20POPFZXw9j1Xn7l0QgRu8MU/qalAWNh+gKn0Dro9VLIxeWfqBv4oWkKdK+2KoQvF2pb1rwKHbaiLw5f3cgauJ39NyY9HYvtvwvbG1Q4W8ZSE79Zv4E/02Jbl13mb7z+tBXhj6JAageW9AQGFbSQo3qa8N5MO8yCgl6DZcZYNtuTmkAziSn1rqHZfgPo+hK9WntN6LYRAkmonV0B7PVKtfwzcnStWA84HDKXBd2CLr8clGMT2tQo0pqTepe3f9OUXS67XWGlj4tuhZi0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxDHS0JOGfrZt844BqTjLnGjQ1xnbgRl6lUB3YJZi64=;
 b=ddmn25d0oftC93a/MTEoLVoNKpL9Gyh6acEij4/HImuWbJxWGilaL+Y5DBeTie8sd6LwqzB7ANMcBbPG1THP1R/nbdvwB4pIe0FmRfdo9S7NwytIhXJ2IQ58v/Z65QbVkm7uBipM4xW0xM9cPqufPoe/+q07r0Dne/+7DKi2si6RVbwn2dpQAfB9gINWXIzzYJmLlCWrp5pniSUzkGpauRZHv0Wnu3aiUTRUKUM+C2wp2gG+36RelBEKer2ywX4VXwWoUPQ6ZgEUGrb1fFALrNeemtmMrej2hwQ4bVOVM1m5po6Tzu0csMzG4H/oGtkQvPthe2UsjLWkbnAxXGzWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxDHS0JOGfrZt844BqTjLnGjQ1xnbgRl6lUB3YJZi64=;
 b=A2eKIKBsoSvsLgSLzyqwPyZw+xUwUA5fVnxv1u+nL5bThzL04cFUBiDxSEo2/eLg2Wc/j0NX80+8lqsMYLKW94CvmTs/vWr8mMhPGgUXR5hUEvaJKzZtK8gWBJ+8KXxkuGGAIfblQ7YT8Uc/11xrTe5Z60SS0LAkialUuEAQLUuTQRO1DlCQWgIffrLbxsq1uvE6Fs+1Qwh2cUXpawjgEGEdOhInJgxDaQMGSj8usSwO5SFegdFBiyQ90qSwRQcfniQX39GC9xJf8pJyh6efhY2KuRdqcucs9xiBD378iYjgzBUMfoI1WWTMg7MdjgsRWHwXSOJe0nHME9dH4ZddwQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4416.namprd20.prod.outlook.com (2603:10b6:510:124::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 01:41:06 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 01:41:06 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] MAINTAINERS: Setup proper info for SOPHGO vendor support
Date: Tue, 30 Jan 2024 09:40:42 +0800
Message-ID: <IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
X-TMN: [oHc+bh2l1ZR0b7ek2fDnfQPVd4kJ84gTHE3RcgS+he/5bhUTcWW8juJPNrM1mmuj]
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240130014043.84031-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a2dd11-1509-43ef-4acf-08dc21348691
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3kqG5z0YbU95bMKqdOYcfCmFja0IpBOsoct47A6yFMc7simRrucKMh/UVSSXqxJJ1letKphE+7wAGNw50TWubq/C1ilCSsQSFF8DNNu8vQzwmmd45QBB6lWY/eR5MW77ZfC5kN0lkCZpCcG3tsUat6kj0qMuXUu4eP9bu5OlzKWoyCSkg5CtFZI04n88qn/tMHPClXsXTKuyhQqe46ZrPMvqSpevwo7s53K+TC7hsNbHIECKPMREbkkOo282LBlcyTc8qg2+GgHzTilFwT7fqWbZmO1XfyyJXh8aVKWwzDHAXeONuwAZpTWeb/n4sBKGEUU2ryT+miaBoykwGwLRQFk4iPV76cqJO7t23x7Rl3ocTjcVokhSnbFdXF0atzvhjM2e45AsVuDrVgOKR0oGHQ/nhPgtUZOcwZU3JbrBpoUE92EPVkaLwZr7PMlpOYptu/CpFF53NIHlzC88G8C2tvaPjSW6piAJvXqbaVtFeKx7tzvqPz8q4UFSYg7XAe3LMDQ03jSuyq4C23FpVPFfn0kIFvTUqq7f/SQvk+5tzwcnEKnpKygxKCQ9mvEn4GZwIOqwszOe4Yb4kDUwlFkvjG+SwleqG9ValUqz22qWhAV/OQNvGm+wqhbax3oFp+ih7Q2k418dg54o3QiBAIEfSdo4lHPmZLPiE5n3sGDaZ60daddc8N9M3DkZzUu5tM5rkOWY8zQGLJbemqhGSNUt/rZSTQ8XO86A73OYD1liKZLO246AN16pqSHsTOCHvpfPcERQNTDjw1yb1b/OvZeXTgI
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xt5Ifn0TZbFbumx+b42a4d+J1alLNXa6kqU7eTS9iZkw0WfiL+/++aTW/r+O+2XaFRxOaG4bAvqqfOg/KwiXxCpI1WdAL5JLBMAFsqIaXOnb/w9NDoltYDNXGAhGjsrgWJJqBtj0nGxpgvDs4SFFY0tj/GZuQim247e0/hJX6BvmLaFIzmUr3ByDy0qq2kEX1+k0RGbggZmnORgHkyGDe1w5kN3OL6Qi53lggmQ8j5Q3Z2SOXEwPk/iJQmtsvHnq587oMYUK+oW/IjSmbehlMyCMuAMYPOumvprBoFasod7/vKdqIqBRrzb/BotEi2fD5usd3m+1/zvLCPyfaBTUebRGw58cU3CjVYjq6fPsyCLCvz06Cd9UNCctnyMckyrJulvZAyqb+LU80Tip6GLXOp5NjRX6vKjNw/WTdp0x9G6D5yETXhNdlw00X79w+MKwwHx170NonktLQydLs4MtZVNu3yIglPYDJ22sU7aVeubknoETtVtBzUnhyfir0+y74rR0JWYQ1BhkDW1kODX8VCP8WuS9JyuD0v8/7fnrjuk+hC3320AugQqNqOf3cGvQvH+5jcSE2I32FTr33vx0UV+u1THiAgPIGl/TnAequcYpaj+tB9meKAemMByxAIBJ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Axs6xnFc3PSsM3cqHyPtG/2MGesvvfXlby9LEEPWcJig5vcbeUj29tB8ZU3n?=
 =?us-ascii?Q?ut0xa9bfY3RIgTRdpSI9+9xkV50mHIGy44HSFIOOW7m5cW5PYkGFyCMZYtWf?=
 =?us-ascii?Q?+mf+1V1Bn5rJgmLYhs6BKNiacujuTSJDh3tn1VoDyB6TiKJPlarQ1rn5HcSP?=
 =?us-ascii?Q?M7DwN83qWZR64/R0JC7wyEffA4EGlskr10PAmYUkIWJg67FOY8oIs26aT1QD?=
 =?us-ascii?Q?9P56jfnpp5ab1lqNKrp9CAjNNNgOsgKHmyErQMnmtiyFzZWmrNudwnz5I0ZF?=
 =?us-ascii?Q?am497E5gz4jFHOPc4IqUVChG3FZ6pJwUbjIwsqS7IdW/bJcYT/5x1T03dSFQ?=
 =?us-ascii?Q?duKqZAVMfT+FQMzihEECDoiAd1Mb4x8EMT8G2RLTpJErzcf6YnyUInkO3seY?=
 =?us-ascii?Q?j4dGBk5+EkCfU09h2Syt3tiELcrIW7UXlap4DtXqcQ5ewxcLzUoGiOB+yskv?=
 =?us-ascii?Q?4gBLe7s316dU11TCV7F+vXLpDvKQc78ivxaZPOyRYxtFM2hPSWzUrNB3iL0u?=
 =?us-ascii?Q?1cl+oZAPEimEsZywj+yL3hwpN+KR5XLGdfDvOSkLSWvrhlxJ0ql9s3yTeoWY?=
 =?us-ascii?Q?RbXIZNjzy9nNh2cLO9Z6dWM6ebaQxdOvhOkXuVHE3M45leAez33clk7RFPzg?=
 =?us-ascii?Q?vkBUh5LkgvfQtiT3o9MoRPuN8yzltdIDiw1M/jlaKDhIs1BqSWYXm0QpXTrm?=
 =?us-ascii?Q?EwWVOxLvIoiUf+ZR7tQr9lLPgjvOCDfUZDDTViTHLSBdKtv/TImdnoO/RlqO?=
 =?us-ascii?Q?9k7M9sdWahMlnjBzUQSs8R2nCEPqD2bkn54nKHOPc0oD+keoefgkmEZ/MU3x?=
 =?us-ascii?Q?czM5dBMMIk8gpuHfKipIz5TOXf7lf1N0H3tK08ng9N2RHEAe556QbxRXjCVo?=
 =?us-ascii?Q?dwF0yYXQfb1at5Yu2Jf6NQc04OM44V1j3w10anLv08k3ykoUdkdpxEEN8dBk?=
 =?us-ascii?Q?PPVuEJi05IoD2tTUMFJiyT/M0989ndoOO5LQzcWjojesG8WfUc4XV1CPnJwV?=
 =?us-ascii?Q?c5bnby2s2Ihup7ONQcYQ8XvudkuijkIw0yzSTyWDTp8CwFmrlQdFvrDFSZVc?=
 =?us-ascii?Q?BQ27A9sOmjg6HuAWZJlSUajGpHAXliAQazMCJgGeGt4kkvMEgfCol93jAVZe?=
 =?us-ascii?Q?TDCGIdmtO8ddVm95SujNrEMPm3bGCop9+1xyi+VByXw/PTbZoO/e0OdhR1wk?=
 =?us-ascii?Q?mhYSCBnyqL0HeOshWv4DPZBugLLDT8BjwRGRbTwHwuqLCxe+QI14CKc04bhI?=
 =?us-ascii?Q?D6m9YVBfXsYvSqTBafnIefty6eqRRidvFVFhZJLvuw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a2dd11-1509-43ef-4acf-08dc21348691
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 01:41:06.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_174116_715091_28E758D2 
X-CRM114-Status: UNSURE (   7.65  )
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

Add git tree that maintaines sophgo vendor code.
Also replace Chao Wei with myself, since he does not have enough time.
Since sophgo vendor code is maintained, remove itself from
`RISC-V MISC SOC`

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
---
 MAINTAINERS | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39219b144c23..125debc7d755 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18848,6 +18848,7 @@ F:	Documentation/devicetree/bindings/riscv/
 F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
+X:	arch/riscv/boot/dts/sophgo/

 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>
@@ -20446,12 +20447,13 @@ F:	drivers/char/sonypi.c
 F:	drivers/platform/x86/sony-laptop.c
 F:	include/linux/sony-laptop.h

-SOPHGO DEVICETREES
-M:	Chao Wei <chao.wei@sophgo.com>
+SOPHGO DEVICETREES and DRIVERS
 M:	Chen Wang <unicorn_wang@outlook.com>
+M:	Inochi Amaoto <inochiama@outlook.com>
+T:	git https://github.com/sophgo/linux.git
 S:	Maintained
-F:	arch/riscv/boot/dts/sophgo/
-F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+N:	sophgo
+K:	sophgo

 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
