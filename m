Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7671C98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raBMv25gnTTQQdga9ibLSHnWdGMX7SvZjL2GiuKpOkw=; b=l+4yHetmX5Z41i
	ebXZlMIELm59QCYYdyz0lYcSlkuotVBioPoOq8ABBvQp+ni31xEWp0TBb0qJwaNQfATm9Ak95+ftt
	bkxRXvWU/NrieYy0QaVDOMZS2hXeplGQuZxjfeu93cTOQkJgwvwPmf+9cvBeFJMG/HZ4hK3TUpQup
	kAdyf0VuM/JkNXep556Y5jdsOvIOGs451vdjxu89RUHK0yGKfAYiAloAW8LWi6OLt3LCg74mA7HON
	8WkeHqqYcSLdHMsHHbMo16in//TW1E0UkVTbs6TPijupLSWCZ9tc47ZXKYNko4Y3I9VP5+P+E2d+M
	1Dhk4sbw6H/NmEfBvVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9370-000000060vj-1gBc;
	Tue, 22 Sep 2026 16:12:54 +0000
Received: from mail-sh0chn02on2098.outbound.protection.partner.outlook.cn ([139.219.146.98] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x936x-000000060sA-37kQ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 16:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnUJ2avrfNmaeiDCXW+nTxieoq6PtpDJ29wgPAjdJ1yLGDaTCzPrXhOY3SBIooaQCoGXJyfgAsL+1Ulg6Vb5ORW7EU9QTfiLKOlJjAT3RYc5j0xerakk7P0V/5PWyl6HvyPrJLg123Ak6pWGtBfpe9WF96wd4PB4EsnSlVPdvTYHpAQA1uqjT3y17Rw3K1ppp/9glIBstoWPRtl6mFk9NPsqgN56v7MC/zVO81D3LKvNCVIrZdlV9q/RFjJDUCP6ciiLd4roXjeMomKgHsF7u4l8IceIwNyYjps4zMig6kpQLa0f7mbBY3cPuGPRZZk4tDoyC8D0ivQgbOjXJl3FvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkJB43+h8Shw0m05Tn6ENmaYcywLz+LinSkGo8w7zEc=;
 b=jGyAB7RFSGBbqG4MLJoO8P12fB5vsLoNVlZu1MksXzuhDn73Vc/bxFpZcKBHGgOPRgIB9dyi8OeHQkvZsgs3h4D2y/rkqLOnXudvdnM4gjAu43nqGtYO0ICa5oufFr8B+ol6x5Lkk0Fa+yicxq9VP94job4tteB1DOg9PQ+YQIJNAdBXl7Oag08V6zHyvIxRQypKPtHPYfgijnKoHaHw+uKbSxgRcmH3FFPrZ2H4wwxRaldwhpdcrm0kihz0McZTvOKTUYNeM5No70wVJIrvrG6OINjx3/Ddkfzr1Nvsk3mob3pF06KPWiX/uKwR+Co6HbAKnfMbS8Jkz6CSbcxthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0492.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:12:50 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0428.015; Tue, 22 Sep 2026 16:12:50 +0000
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
Subject: [PATCH 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Wed, 23 Sep 2026 00:11:54 +0800
Message-ID: <20260922161156.1088153-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::33) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0492:EE_
X-MS-Office365-Filtering-Correlation-Id: a71651bc-cbe3-4417-a041-08df18c45923
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|10067099003|56012099006|6133799003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: Wkc+xv5yE1FDQRrVnaiq8/SHQf2BvlJv4PNLruuSBIdG7+zL7OQ4GUy6t8v5DxLwYXI5NTPpc1PD2ud+63w2U4bS6QTVaCVZTGyo0TSa24JGbbBRYVZHxWtKofM5I6FGTF8U/g5simV1oUK2hbH9XXBYUYd+nfyynS6GZyCIEH83+mMQN81kPAV4/aGaBbT84p82p6/5v589h0cVwp4q6cJcX+VEwZAM0yGu9xth4hSggoabFScAwsF5Hb4WvnRzTeCmCqLU+KENSNoW5C+bOeC5pCgtriaNG+VyFitjpNBx/jvsSfA6JOJ51BpBEmILDteG+BU2vIcMqtNE/coEAc3OxImMYW5qpasSJ9ZlO423msBVK/1qBidOyvhjppvXEQRRvpfABf2SirSpkCFm83miYAeQ0AhjJokaObuvONvPFzEOjPCG1kILYX4sHXvJlV2T7KkiZ55Yj77+1CI9hWCHWhnbq3psY+/AZh5y39cZnoIpw2wsABBae1Ka52Az18X8hvIA5uAeGaDcO8tusnPvi7tvjZu+wNW81BvBRkWbV6zd7lzj7iB/d9O3NDubpLcCBa2XXPp6M7rwuAq17A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dGbbiLLjx+khbaFBIwZI1MYM+7dOakMndqhADfILxxRQ/XQqd/zgVJYpZvX2?=
 =?us-ascii?Q?h9gdcOrELEwVjw+rOSoE2YyA9ejhvZLtQJ1WhJ0AAs1GUimUoicisUZMtmSt?=
 =?us-ascii?Q?AaVeGTou+KE5D+Tn0qpd2AJsSep33xfwuDVvEVnw6wUBMHbzqXPATIbQii5H?=
 =?us-ascii?Q?OXqz7PPKqMlpwHmCMtI2ESvfKK8s1zOwujUNJEHGgxH66CWHoghMXGlj8HZI?=
 =?us-ascii?Q?JAVy32FJlz9Ryqe3nGNTV3QFo/e3eH3vq9gn+/rw9KFO9XxZNeTdCYqXTMhH?=
 =?us-ascii?Q?n5btgPSm2E5r1gW3VRBcQ5nYaNZq74URT1mq6jXmWupIVTfT8EjMAL1QB61S?=
 =?us-ascii?Q?1AQCPkNX2aOc8OSWHATxD1ffGzIOAo+a7qCd5mNDe8wWczvZH6soovucPXi5?=
 =?us-ascii?Q?0adQ6cz48CFzqKm+QR81DBwJgExcEtSF8+eN0mZLZTsH4uL3mWD9h6AYs84b?=
 =?us-ascii?Q?cBFJVzj5luWKz6ykSGPcqLq+Kj04X0VAhebN7sqrKbHE3ix7wTevSEPhN68d?=
 =?us-ascii?Q?BoaCcE4sN733XHFLPPTmJ+wSAdPo2LeW2HmiTpbp2ESGxZeK0ozqZwPJRcep?=
 =?us-ascii?Q?dKmouEjUJXwfJQXqm/wG7LPoB7HUiLAgez9bVyYbTUQ4+F76WQU5v+1cv2oU?=
 =?us-ascii?Q?ynBYzRoMQSMvlhACU4L7/s6ulRePdcbu8lWVOnYrtEGruD6sJODPvL5PSCTl?=
 =?us-ascii?Q?4q2bgi2D8s74zN+6ws5oqw1SfieQ+VbNC0r9vMWqcmpq490KdhXXpzBQVurn?=
 =?us-ascii?Q?Go0QjaLkKC2/PkFY3ZLE1dSF0GJGlbn1OxH06fwzLuPJzKJkYRzd7LPD35wI?=
 =?us-ascii?Q?x9NPCJIoJC71Of7JBixY1yTJn4OEzNuuIFH9XGajZ/QXEcmQqw7kEwviNeTr?=
 =?us-ascii?Q?LwsyeoRC8yOsDLQ13vGIjj3sgk8r0pCMw03ZeiF4qMvKvUx1G9yqjz245KSj?=
 =?us-ascii?Q?AFN9tiaXWTknusu1EnbDamPT5oRyUr7dQhlwkhwYCr6cEhkcSAS/Eyihl4jy?=
 =?us-ascii?Q?DK5BrqgpkYfrcjU5JLd6t18Gakey4m4XmRzpy3N+h3Ozu80AEq22JyyNZCMh?=
 =?us-ascii?Q?SCCQRIso4N8vfiO3KsefESOVwAYx+OTzHg73fPPzJWloDaB/mW6gxdpyDbps?=
 =?us-ascii?Q?6zEcK8KmQOWHwzpy6ZpegmL9nm2yiQiCFdmtOJ0Z+AE0pcJfR1E4QZOQqUQe?=
 =?us-ascii?Q?Vg92rznxkds4LTqUK3Fgtaq/MTPWaCZlk101jHuZ1XwHgvlGLb2zSCLvLxFg?=
 =?us-ascii?Q?SHaOQ1mGv3ei7ioFgcBtB/oodFyVY8BgHcG/6ufxeyHUGTkt60YGmrHp38VR?=
 =?us-ascii?Q?uUJh8mVDsVHeXGYllcoyXvQ3kOutVxybiJ64hxVZ09t4dqrm+Bb/X2fSmbJQ?=
 =?us-ascii?Q?l0rcjqomtLUdOFsNhnrqkDzrrZbGcEfmAFLwAUbKc4BLTr3ExUkOwhEOY5Xi?=
 =?us-ascii?Q?Xm71a023N5jGw1I10PacASl4QW+IUU0uF7PJfFwu1jcI3bg4oVikmp9dEP+p?=
 =?us-ascii?Q?jY9GgzY/AoSZLqSXfVZYTA2yftg0+07QOm+rlEJnPWCnY0sfJYui/1CTNJDR?=
 =?us-ascii?Q?XuX8t5WWfVFghcU24a0c6abf6lmwdSlBT8Jxe+v6AYsffbhuf5vlQpcpdu5Z?=
 =?us-ascii?Q?B87Ppd8gI0c2yqzoLrx1iQSuNL3oAgCAn2bx90WuMpT3jXUJ8DA67BAz1G1e?=
 =?us-ascii?Q?0yZaoJFNypaDx6d2G3MFKOVjcvfuX2C9vJG81tVpWDdU1lOWxzZODwVCsV6H?=
 =?us-ascii?Q?LDJvRx3uWGf55sGpD/swJ6MHJUdq2/8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71651bc-cbe3-4417-a041-08df18c45923
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:12:50.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxPLJH0SI6DyqgraTii8k9ucTlkdSOFByyOdQkLmuvA0ZENO676xsjfdDybEEevWXJxk5HxmNi7trrhnRynCVqdPfgtGUhoQd5D+mnheCME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_091251_785296_CABFDBD5 
X-CRM114-Status: UNSURE (   9.37  )
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
