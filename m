Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B63C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H3j4JR42v/F/U8qBQhE9uHGmM7UDRdc/DMvgyx7+/8=; b=LROOiG7A/lwh+3
	eJ8a/KM2ekrZw1K/ER5I9iJFyKHgmsf7hr4ExK3DuWBGApqnjdlpKXPv4KIfVvV+Pe+hwGWpDjAb7
	pMwoprFo3RJdnkxkmYkV/5QjHiIMkdw6WvlG+r+UhFS9HeghqeJfz0+QM7L6w3R+uFCEvB4WfBm1a
	uzzaJM5OvaAaSlDHtcOWEE2FQbyY9lUpcoUaopjUE2+mgh8SW+c5hj0IE25TAwooWJGW6g0W4UbTV
	/K74ONmGTEZh6CnN/SGspV+/x7fT+qDMSOzWINSfZ3CAt9VDXEDC9CbQD9moczm+Z/o+U+/qAUfHs
	FAjV7J7mV/gnp5WXE8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4beJ-0000000DyJi-3cDU;
	Thu, 10 Sep 2026 10:04:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4beG-0000000DyD1-0Pml
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 10:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rxTLGUMffs3vN5B5GiHwopykyAQqAHJKxb9+I04rDys=; b=ePjhFjqS10ALaDpOJdRH3wPIZs
	Pbh9g3/XLHgGTSAjv6hWfyjvVtQqTJaq7C1yprsq+w4I6NS7GatMcR7SFdXHkcQWKZPa+Q6dWe9zD
	OgmMtZMK69ybnb/b+TFyxWJfMli63bJxfWwbjjn4/OtwLcdS9PCwU+FXZbwuuirh9uExxgABF8HmK
	7Iago8HY/VHbn9lN1IKFNBn7CJV/pWXDRAuGnMoei7hEcauCkmJH84Hr0SIrXd+JLbjgsSsarp3p1
	jkHthXh2kiJbBP5XyYsE2rcY1op0SImSFssKn0E2la3v0hcEbCE3SRZP2Drdb3W5P2Ssy946/XVPP
	9BY400zQ==;
Received: from mail-bjschn02on2107.outbound.protection.partner.outlook.cn ([139.219.17.107] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4beD-00000002IW4-27Th
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 10:04:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr64Oh2Kj7F5UcDB/7IFHn0BTqt3ikVdNCbnmyOSazHNDJPkmZurcMu5QILeCNXBpohnnhP/X7eVp8h+U9RjQyH6Hftz5i0pQHG2Z5VPk7BdtC64FNmNL40gbnhWGlgHt7nn/eD/osjpi5+9DV3gCL+gZfNNJHFvYZpVH7dpRIUjzMkafmYzZjGcLKuq8ysgv8jg9I7smxQjBOJSUabFRW2eM8JyEXJKtTgpsn8tJ40zc/i2HYjuoIlJ1eSGBDfwjl6OUKSwcQV3W0gCYEiS2BUBoLSQrRKOSDnAqkvi+3LmixY45opznjEf1WGX2D/sxxmgAetbQ9qBYnOW2/7I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxTLGUMffs3vN5B5GiHwopykyAQqAHJKxb9+I04rDys=;
 b=UwVx4z+lSxn2iODdaTxJ+JNRZ046E4nWYTGHYHeijpEujaGj4iXAObhEiUj7XHsiE+KEVBfuDGWnLesoSymR27FEuvYqYwjDI1WouEAmBgN3Lkow97DgKqXt/tUDL3U0463I+UIX58MntgZNfViTecvV5YKsWuPO7znkgKfkwanB6St1+NZZMLM8iYqSnTqiSOXXfG1I/TSJBP2QdbIcIgOkFRzopDbSHLTAgrXp1L22fXF9HcAwZqRYiPBp+D7EVnMn+hBi28jhColdQnaRk13ws/P1CfnlxKQ1IlRJZ53MJN1ZhpfNxDbTkB8lsKuZtUDXz+A6bqDdJNZo/s91bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v8 08/22] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Thu, 10 Sep 2026 03:03:43 -0700
Message-Id: <20260910100357.130134-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8d7de1-5ce0-46fe-3c26-08df0f22e061
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: SDc9xpIwC3Q6r4OOHJYA3/NNeXTWoSKWnawvdAQM+varwHDhD9Qmr3nqifi48FncUFjKcC7bgnzYC4SL7qAcgwujfWaY73g2iSeZQpEnR0ZkE1G6xogeF/kyX0IHI3dIKSuF+YM6hOkSAURJsY0qiE1l9X38efWBXJASnnsbHa9KMREkTFmjF+rsAyC7FjrPoZrQRlwqeHSkGOXVkVDuzWCuK8mQK7o3XmzAPYVOB0+/l2XtGdOhSdCTGzBVeanbecMIOxEo3QOvJELacho5IuEbGUHtjCefsU4ydNmWATqj/HtOYkoxOKLfIhlzhqVwpF/1ToYfDKCwuDh5w4VPYc5eS541vegqq70mFGXc6/zk9oKiHOyrUeCp622x59GdX5fWf5UB/4rH+CID86P8lqD/w8oN/HKg2TpHZkfW107VE1zxfzIYjP2usN1z6HWP4KU4jhJAt9C2ek1gCQZbNU9fku9DXmibh09fiu151uNQUPxjXl7i2bF/S0thbDfp/cF3Ehqhm0flTNSN0HhwyF/ReQ8UbzdbtqUNTXfuV5R6Sqc+w6gUtZrzB8Lv5kqk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lTsSS01oFN8xqZ2+nqp/QVYBWpotyzlKuZlXwnskp08XuiGbRDcCmOOPre9?=
 =?us-ascii?Q?MTXXBTEASCsdOn7POwWa/gNgmTYYq9NiYbJXhaZgThIoGELP6rVYES5+0tqZ?=
 =?us-ascii?Q?C36mi3iGZcIPRqxHHH32TYcvFa2pY5btZ1uWGh0SECm7ROqayoxKoZNE1cvI?=
 =?us-ascii?Q?cGV5C7ZErlsNr2XYJR1Zx2FYZ3rzivtpMiG+DJZGPzLI7OV19+ReLpfvImvA?=
 =?us-ascii?Q?VocNjtU7Jj1R16OgDMKoHY29FSA7WnDuRs3QD2C+9nu4MIq63Fj5A0X+bBVJ?=
 =?us-ascii?Q?UP7s5BDEIoRHQWF0Pl4CtLbPegSzaUXaLOCQ0Lu0E1UDtf1hfCV4qaBbzKXg?=
 =?us-ascii?Q?vYDFiz2gQ/EXIUOmOFswDKEP+tXf2jGrxqzF0CI6DiWyikP1aaxNWznOjib1?=
 =?us-ascii?Q?fEHfTMTfbyGUvMwjzsCaSV0ueUx2g7NK9AfmSgLT8vMEMLU9aDBxkGowJayd?=
 =?us-ascii?Q?D/+IF+tIFD9jRBuWaS2y1PsvaA367bKV9OZqPhFj4YWv6nQ3axdrC5KftQNo?=
 =?us-ascii?Q?zosF8vu3wIT9m89cZ9MTLLsCbOzCORCwOXWFTn/CoZNUifp+oUXcA8difS3M?=
 =?us-ascii?Q?rwMTZPfsljGnPU/2a0IudZklItnLPRsTzdyDUBSq9mK69bX83Entjdb777sG?=
 =?us-ascii?Q?BdxFcLM3asbIQnypfEeHGUAZAgvJLbdWzYieyXuO0ck9j+XAh65GyHlX3Eai?=
 =?us-ascii?Q?aDGieRjQWlPJHlEt25P6chQOkz/1a8igOp24t0ey/+vt817g5f9z31ZI8Z6Y?=
 =?us-ascii?Q?9uXCUpx0OJiDRrdLqu62G5ay+WmnZWebTtc5gcZsBQ064dNaT4aN1ajJuYmq?=
 =?us-ascii?Q?uYVK402lnRu5YedTItNmXf+2RCDYHJmpf31EpGWSHwcw0ZLGCE1WSWkWQh2V?=
 =?us-ascii?Q?CaYgunP/1Eaffx1O5qmq+e+7nOf2C16v8Mj9MeoPqOJo7ceSh8V61OV0g7O+?=
 =?us-ascii?Q?P1GAiwtJO4dmh2+8Z6S76e1Vk8VPG+WSBlu2s4efU7tF0DIZrpr/Z1AHlqLX?=
 =?us-ascii?Q?uD3jKvDM7DsCypeHKZBT/Mr9AY45rQPp0/XDsFvpi84TNqKGXhibcpXQgJ/E?=
 =?us-ascii?Q?Y17Jw7ovm6Ajg5E+Ms5lqzO4BfzSmyEfiityV5V6Lc0+4TghnvUBBodkAtqG?=
 =?us-ascii?Q?6bPNNP14BsPKQx/1A2nAAF8oNRb9Go1YymW/X3Wmc8+kZAlLhYkema6HpF4F?=
 =?us-ascii?Q?2opRj6+6gnhYQ7paBoamJVGvxSZJfaCeGrCNYuIJycioOJsLzYiqxHFVJOEh?=
 =?us-ascii?Q?vSmZuffzB1zdvAyKpmWlpLvTIb3SyC73balXFhQ4Nr0pNQahS/D+6YehgWoG?=
 =?us-ascii?Q?IiKW1nTzVUPFMyg2foghx97SdBFL1U4q6ep6fWpTbj8rKscA3EzMp3Y1asja?=
 =?us-ascii?Q?vPs/BdcpbrjBveaJR1/dNy3dRzUkZgW55UlHmi2TdpqyZ9QFTwstEkIL30YL?=
 =?us-ascii?Q?ikNLH0VbJQArkF2tWmSjhWU7nPQmBGtACNYBJQMSlqyNbrE82H+mrrKFZ8/E?=
 =?us-ascii?Q?13MVws1oG7bqxLrN7o+GFdCDOrY69agkd3hZig6m4Y2Ip1djkypntbnjtM2h?=
 =?us-ascii?Q?rRQDHvWYHAOAsva4zzlseoKKjpYkdifXGpo5GjmuOcu05R7AfpA821zC3qOU?=
 =?us-ascii?Q?ZbeAvQeFv+s9HLMZHjqkOQoN86pKYp6iFTvbixD5xZ4jM3N+afnCjNOGh44L?=
 =?us-ascii?Q?1ZYbLJE8Lz0vkfS1YLTLLIIoM2JJ63+ESOYFCFe7vq2TrNpL8s7pVYb4aOmh?=
 =?us-ascii?Q?Q+ICT3ahPjWouK6SNEaC2s9j9MBjDcr2NuBHe6Ya9BAsjXSk6jQE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8d7de1-5ce0-46fe-3c26-08df0f22e061
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:17.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EC+XWibbmNcnx+Pjlqybjx4WtnkJcE7RGYhidhxP60RAgBIaNMRKiJhTEhEL7FDwwSm3H3t7DvDu0PKvKAoaaG1NarKku2VPIz2gxdxKJKjUzrvjRgy1b5Ub1iFeBQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_110449_639903_83C9E7BA 
X-CRM114-Status: GOOD (  17.99  )
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

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 94 +++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 992238f5b49d..895b9cb0cb2a 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -77,3 +77,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..2185c3d15bc2
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 8,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x24,
+	.output_en		= 0x28,
+	.gpio_status		= 0x2c,
+	.irq_en			= 0x34,
+	.irq_status		= 0x38,
+	.irq_clr		= 0x3c,
+	.irq_trigger		= 0x40,
+	.irq_level		= 0x44,
+	.irq_both_edge		= 0x48,
+	.irq_edge		= 0x4c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys1[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A22) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A23) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys1),
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
