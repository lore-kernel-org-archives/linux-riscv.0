Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515CEC982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/VS0fXlG32Ac89BKaozxoEvhxZhq0beQ3AC/AOAOos=; b=dN3lWO1pxVf8iW
	BBjELB6/DpAdxDnDT2Mlf8leanCfjrUoo3mZortWrPytHpZV4A5Ruv9CKNMXEMqYWcfnWRSBu4NTQ
	hVxFdnKswXFNU6AG2ayKhLfrNjb6Q30nGit3ELm+irhN3aD1jFifCu16m6cvc2E/3DSHUxbz0cMeh
	rIS+ZBI5GCuaMEH6fDt7sbHY8FYUtn5pygRNtip0oI2CfFL5/bJJ0tCyhbkSSybzc9sBnjV3c8KpD
	i21jgZhaCF/pAmWsRdBqePtgcJQflRX/8xia8dWNztvhawX4ctVjLFzczA/5FUaHATXoUpVBWDzU1
	y36tXuIoCSlboxEnS6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HDt-00000007NaC-1Cgt;
	Wed, 23 Sep 2026 07:16:57 +0000
Received: from mail-bjschn02on2072f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HDo-00000007NXr-1OYV
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 07:16:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmEYd1oHZytivYiaz83jVhnn4Dh0S/QUhk/4fgATa1qLI5A0ve8X8sgLxBpRQi6LvHzDZZK0cvP6UnCJ01SthnHldmcG43VHmdXdBgUBKYUHCMMDAYXiLBdoDucbCxSfVk/8wY2LRfeiPSh4nrRgIggGbNOJgDDy36RU3gjcOunM7JzA2Ib+UQXBTp8yln68YbKwdI1k9PHxPO1zu38HSiRHxGaWTVJBgHWJrfyjE+ixBEzQP8QBXAmrsPAY4NVc5vE5e5cxeI8SRqwQ835QRisdvJl4Q7uUwLwnyAbuL99GlCwFh1Vi7N4lg9hxLNJB9QeeV+onnXisG5FVy3Le8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u42D1MYm9uib6R4RGuK19vJPl9D+e0d5388SjZh0pW8=;
 b=BDMI88bPs4M1Z6WjndrAEsPi3hsJHCKs1iqtQMfSdMAOnpv+STwFYbGYsxOrHXXTnYSdKAFWBXapRj8GzolmgpoVJ5cwspECACqjLpECmFCY557MjubHpJLk87imIPGikQJDtadppyOKqq75J4kJ4G145CmpTj5XmMDJzmIVaa9YcSABglryDXuG15epjtOqXMjAwCulR9okxKalnsX3pow58MfhQTYelPZ6MZPvKOQvWl0QDuKod9PYIc6SAbSLBHzt/LNsNsunx2gT5l40TVOoHB47qjPbb4Jn6C9u0XJj6XgO8I+bwXNMY5LhWkm6KajUewxb2ob7qGM/xQgwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:01:28 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 07:01:28 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Wed, 23 Sep 2026 15:00:14 +0800
Message-ID: <20260923070014.1340761-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::32) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6c31a5-9796-4602-2fde-08df19407d4c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|52116014|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HYoDxqRKsJB0fdzh8SiIKszrGuX2CigHgJ1Y7BcOVXKXIHoAgppsR0zqXo0GNDV3rLZQLwPICG75OaRVsowXrvJCoqSg+1F26lf7ED3mk2qlOIp0w0xcxJL8UAhMVHPZFiv+iJKwTSztmborg8/knMc2xTeLNxqabaLPfdDDNBuL5MaxXn69O1UPa8rPK1iJ1ZwFxIS2Ea+CxtB8eOgH6q8J3lzW9Pehxj76O7Q0tSA0yCrB10jMu6XvEEcVPYTWRtZ90pOfr57jNaDK0P0oL6vsq2A0eEQoBuZ4XRlPjNon8+46wU/9bScIG5j7IBN31yF123RLY6z+9H9RY3sGrxV9hWcMGjTLpYUITa2ZCb2nkDLX6S0RKhH2qLhbPjLtaR469UajsOi8v2vua8sOUtiuAvSchG+eR2l7utfdjCYqCoKB89kNJeTIyIS0WI763VsT1RMqEhxTBBkFHxPMg1yiZBRhyKxPnhiayeixmdKSpF1+EMSuGqKC43Vp9eMpN7DsxifzC6V0YCm7+qavu+j8NJzP0VboUY0ZWxwBW5AcC/LAkKA4OcmzcOWUqzs2RBhm/yYxLhT+fvGL4rmu+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(52116014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6yzmGgLkxOV9qpLKb4ZK5C/MtGfvijPljXIutsi7KDlFa0M+3rN8Ib8IjLKI?=
 =?us-ascii?Q?kyPW7K4zEJajVHHUKxFiZG9+qu9sofiH75TZnEoGPe93q+2Aj5PURrq+KrCb?=
 =?us-ascii?Q?pdoxeR1CwAHuqH6T47hkn5IX5Cu95O54dOq47ztl3cxkDWTQ541KmsLL0acr?=
 =?us-ascii?Q?e/Gi7RYAQD37/AmwHYIMwT+5l790OjUvK6Ws9GM9eFCsMrZjIF72g99ywpCh?=
 =?us-ascii?Q?PLfXg1voZ10zdYgWy3d9iyeB4YP7EOUkCAznyHyF7tgKbST+ltcg/myHRbT9?=
 =?us-ascii?Q?tBiQ7gbwAxtkXQlk4J6xnqaVnDkxLyldFFs6+4cXejrRy8D1CNEJ2aU9+3BI?=
 =?us-ascii?Q?PFZK99+lC2rFYfK3Fl7pnHpFWfAqmMw5/anwgLKLyp2sfMqJ3OlqTb0v634q?=
 =?us-ascii?Q?TaQg/WPRD8kHkE/vFIQAGbCAn3HajtlTvfydIAQtoVNA9LUljxMZY9m2RD51?=
 =?us-ascii?Q?V+nRLFe349PyjzqA/Sq8K1xsmc3n5oQX/YsRDgrr8jFT2i3fwE2B2GYOn16n?=
 =?us-ascii?Q?PKN6vejOZEsMQpCPKAYDlRYP/tPoXPRBpwj3GdsonJwXRgomSFaGR2i6q62s?=
 =?us-ascii?Q?+R3LzvWH/iic4RD2K5sne5Y691DYF8pKZLcuIHcK0lf3qHAW71/liRuf08F5?=
 =?us-ascii?Q?KfWI7wjgRn4BpepDWplszMYL/8VjnMgIilVuHKJc9hIo5VsJDxRLdIgo3+k0?=
 =?us-ascii?Q?dVKhd0u2ZTEYyoeiFreDHnJa6f+QCwMFrkDHegxvH7IttivsA8GcPCoOeo9/?=
 =?us-ascii?Q?6mqYW9uY4nv4sWv6QiI+nrzEwQzjWzafPgad9OeJHoJDAV5OGaS3OfjporEy?=
 =?us-ascii?Q?z0cidz00tPOUD5a1rgUu6FnL50N57tLKwOdBs/rJG8Dpb9Uw5NGrx86EccSz?=
 =?us-ascii?Q?MgK+S7N9VQFjDlA++1PRKwbw9TtiQffb2qRUorqiRvYRfmsN4vpNGelZFjx7?=
 =?us-ascii?Q?SSjs7lCxvTsplL0N6QnhyPDHnMK739ai0f7fzvsn5WpwxZdJ337Imr+nfbuv?=
 =?us-ascii?Q?eEa/9HRtIPpW4uUmZjYaQOji2+qdMYDu4QnEfaVA7x2GNUA9FgZFk1yG68yI?=
 =?us-ascii?Q?YPBCrCGOtFExx2g1X1Ln0x03luSFp+08RW+Dsk6EREegKnFXIYa9csYlvB1k?=
 =?us-ascii?Q?JBDbYz8O7QPKYs7RPOYDEbgsrnW4AuI4RZ6paBuCH4ekMuTDNYzi6Z/syaCP?=
 =?us-ascii?Q?5olBGKF+KkfEturG3cCapeiw6pJdngHNbB3wJNhxxlAW+xNsOroZo2LTIzdT?=
 =?us-ascii?Q?9K/EjGmdbLhRMicFvYBW3mIPYhkBNWQ6pRdFCfH0G/3rRubQ7sOa+ioOKhQS?=
 =?us-ascii?Q?ljc77naJfoPGWk1IzN2/dg8keGTjgQfsRJuZRc62vIOLbfyz3v/orSSHjQ7P?=
 =?us-ascii?Q?IrrGBTMJB60S6/UOhWeL8yQ30WDbTvItnAuC+WIqpae9giPmtUkVECm7fiNM?=
 =?us-ascii?Q?iOATQZbI9NmgurWjYuaUchNG2vPCTebfj5wg2K8vHephryWpTUSMYFqypv5O?=
 =?us-ascii?Q?X7yA7hsG4JqHLeql3Ng0fOlNfU8dLZ8OysaG3hGs/L3MA+nQVXBWBZcMJ8i9?=
 =?us-ascii?Q?uKEKpmnkkjoBKCRcj0sTfjk/tp+Andp/gVG+D6iDVq0XEq0gJNRrfqOcmbCI?=
 =?us-ascii?Q?Miq4q+0k+hco6J0WokqbmFyOnRnMsLJ2ePJ/MeHrfyOO0gvtDvD5LHx+y/31?=
 =?us-ascii?Q?HRCmuDIGcpmpsCVnjXrNeD5mEa3ot0UPE3M52NWuWqAEFgEYw3UIru225qSu?=
 =?us-ascii?Q?cEXlxhrDnMv/g+R3/hmoN3Oo2ULCOhU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6c31a5-9796-4602-2fde-08df19407d4c
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:01:28.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvAipCpPOKoECKJsndpVrtiqhJ7FH+f5tihtOHvF4HeP+p1fG68MzHY7bGbpmxACst2hXoVNvy+mr/bC+cECss9P4Slf3bZPjVw4Axzrr5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001652_425200_6F29C30F 
X-CRM114-Status: UNSURE (   9.33  )
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

Add the RPMI voltage driver and its bindings to the RPMI device power
entry, renamed to cover both, rather than extending the existing RISC-V
RPMI and MPXY drivers entry, which covers drivers maintained by others.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4716da916aa1..cd13d6172655 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23308,13 +23308,17 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
-RISC-V RPMI DEVICE POWER DRIVER
+RISC-V RPMI DEVICE POWER AND VOLTAGE DRIVERS
 M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 F:	drivers/pmdomain/riscv/
+F:	drivers/regulator/riscv-rpmi-regulator.c
+F:	include/linux/regulator/riscv-rpmi-regulator.h
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
