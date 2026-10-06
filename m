Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60416CA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KG/xBcxs/NFaqtzbzrpgJRXgO/WhAPsWyzHk7L7u0A8=; b=2W8Pnba1A5L0b2
	xFuKN0ygi7tb8N0FVf7tJSGdsVbG2Wa6x4ypKOM/Qug3XwVB58nE/vPqZ9iQnXfC4OAhAAy9K/364
	MHHi8k53XAmxAQNYw2xFry8We77o3W4Aqizqonl+Ff8x0lEpYD90DX+KYBwB7C9yOYbMtEX+jsDHp
	3n8rcS9Haw8R0Ym5/lJ+A7ph0brulAFSqIQjFx4Hqiv8tIXKR8ArwFNW4BAJjC8OH5ITQmnpSvyHp
	Qnm1eiHi50+PirCAuBRPuYTLnoiafpBBozqa2RmeawXe8cLbH3ufD+kygANhaTXM2Y9We/qL51y3P
	a2PAwTtODE/IJzT1suLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0dL-00000000I5a-073Q;
	Tue, 06 Oct 2026 08:34:47 +0000
Received: from mail-bjschn02on2139.outbound.protection.partner.outlook.cn ([139.219.17.139] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0dI-00000000I1x-3xi5
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 08:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbYwprbQ4YcbAwU+5QSLOsTi5EHjY88b3cH3b7AZrp6D2CIMZeYTffyapqYLJK9wChZWa7IPL96Wcfa1KiBhZ+/Ne+5RBkffMDnX4BOB/IrL2BdBv1jYo+KNArxfD1V1iCad2w+Jo6Q2cgVWYITdrJlSJ4NAAQVwsJ2vh3zo/gUKs3sDIMceJOEa0bBkPEmjWir1hu+/DzvynrbZL6vsh/uCeNferEGfRjedJTAqoC0LJzia08A5KqfIKpW7VrcCngG5+ln6iuN5oxtQLZlle4NZnX5boT6SLoLwbsO77JUqMEHRXavKrDmPenJg8e8leh7q/cb6nO6/LM7huKrWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNUJsLwUdWwBQo9CHUeRSd9wmc2H4fQt0rhhRfHIBg0=;
 b=CK/N4w46c5UprwpH9EhTcKT0O+W3NROkwRxNsyH2q8kiF/XOVSTBIz3XbxUjQtOSGdeYhKRYo42hx2s8moFz6Z/716Cy0bjbX8QyRSDI27mF+lYqXv++Szun6OZ+SSaXYmdv+Wi3aRqD56PUUHjfMcbeqBQgS4ehSJvu15qEjI+l59/f6nyBbKXmiXeVikIVe6GAhvGK6lzi8zRfT6N7SKO51f9ehAqSXd74SyRbwbqcs6EM1bw8TBGHoxOxrwUxgCu51CWCMcSIkFHrztevtKwB8HARt7TSZl29BP/1vPnQhOoTE81rdwKL+6PFHEej7rheXc8WWa3uyyXLaXfxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0556.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 08:34:18 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Tue, 6 Oct 2026 08:34:18 +0000
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
Subject: [PATCH v3 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Tue,  6 Oct 2026 16:32:59 +0800
Message-ID: <20261006083259.2206001-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
References: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8e0980-d682-4eb2-24cb-08df23849cb0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|921020|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 9V5ShwFYI7WIL+zFaECgi5IA9GQB9096ijKveeHkasZYSrIjAYs/B2ngZJok7lyUBU3kQH/cjSCpd1KsLJfYkaLLDnUvC5AzqtTduY5jwlpp4YpcZ1ay7iw4qE3XMGJWaxba5N1WcpsEKOwNlhfwBGSW0i9DbBgKJ8uxo6LG/L2vlwy4Qy4O8qhPkIggHXjTXYq/SX9d+i3Tc6rW5f5MpOKSsJmnSomp0+9JajjrD3tVUkFDPkyIzEtJHfxOE1h6+MWR5nD59dFXKSouwrcEZ9OuNPGy3VzR8aD8TijlOtXhk64YVVym6yd9BRTEDhfzzQRQbVQi1iUJRIkd5lqJQ/aT8AX5DrEXAx8VFvyOQXSsiK6BdnLdjQFWl3pcQVZo3orpky9SOes5aeZz91xU4T+wwtu7WoyvMYmb96lS+2SBfHWlGxM7l4jhYAtmijfp/kE2UU/KZWKxdpsKnDcUbUeX2fzKkQTZHX5kgGI/9ip+EbUJLF7kASvcbnqP/sD1sWbtLI1fN+bocM9GwAT/wWJE9IeMv7p7Z8regZbTtuhDNC3JCKsuozQRg2C7IBbyiD5BlfhtxVtakmMrrzlqnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(921020)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRk3IR5s8dy75NPdyCqW8kRQnIJawsDvB8W6EnjzbwuFJguzyK6N80XosBF3?=
 =?us-ascii?Q?JCYo2x4ujJE0/rlS1VWY8tUffRlys1LYuyrDI6EwE41ccLQwqJcbfRnKaOG/?=
 =?us-ascii?Q?XlLH7WkC2ONNYAiFNzMerCT2gB8u+t0yk0YE1CXhiRpbFY8g/ZkyKyr0iNIp?=
 =?us-ascii?Q?87mhALoQfIq6RHUrJkNvgBVGSPp2RUba34Xyuquj0IVw70Y2+bSIhA9ldpAU?=
 =?us-ascii?Q?4dRPjl9UEbxT8ueuAk3JA2/yoM5dEgA++6mfc7fFcT+gTogI/RTMBSl64JgM?=
 =?us-ascii?Q?SpbHgcIgx5b+NKjEtSkJbZXVmzpJjKATEP4VLRGrZer97TCAUFdRcKr6otBe?=
 =?us-ascii?Q?352b30ZadlNolgN+iUDJPGtqoJeKCcP8YLmcilScIMUllRJVqvHSqvzBCajS?=
 =?us-ascii?Q?4D17H9lh4f6196cqG9t/IPPyfYLzI8GEWi4uqtXXSV9C0nch88k3n11XU7Jr?=
 =?us-ascii?Q?6VQDZ/Rs3syKsxps5giIfzItNkN7E7U/HC7SMN5R7LCZz0nUOMaMt9etjYdS?=
 =?us-ascii?Q?CNJJFBcouIaB8T7L1+ikdNkBL+dGDKVGHWlZam9YHcW7KlcQhvz5kQMx2hPP?=
 =?us-ascii?Q?jKgk0JQZIVf1sMQr3sOd4exBvPvB1VnPxwktfnGLCtwcBAhftJHXbmLo1Yzs?=
 =?us-ascii?Q?bSz5gHI05OqVDUrHJwDocMlD3wA9SDyacgD0iJav/yfqo4XYtTyzQWA06dyu?=
 =?us-ascii?Q?1mUxkIsNJjgSz5iQi5GgzuvlKJLbyH8f0gVma3TE3RG/dbE6nh3Vak+KQ82j?=
 =?us-ascii?Q?Oy/nsmZguV91pkZ8D58Bb/kUwvlCQK2WgcgrZCfnHxTaOuEkrGicQ5UAxlUk?=
 =?us-ascii?Q?YkOrMVi3X8MeNTmyBtwx+av5U5r+gh4Ulu9NEU+LkzWdRlPwLXK17J+3/JvB?=
 =?us-ascii?Q?ZbdZOoCJk2BO5ts28IYWJ3yKkTf/1dXlLCK/jYfX1FgrnvuVhDgh17PDSv+J?=
 =?us-ascii?Q?LS4NDRO+xKYIEfd2XepruU7M8oWH2vCLafMYBT1sJRFhlNbNaZgEB+/M/uLJ?=
 =?us-ascii?Q?mkqy8lQ6EHrD8sLrck+aCE09un2OwBmeO/dV5a27+m53Sln9COWqbrjTpP/3?=
 =?us-ascii?Q?EeexKM6cc+Vwk9yJgAfC9W66nNxit/ueWORWPASF9ID3E03VzJIuXWtwnjyS?=
 =?us-ascii?Q?tVhEFPiQQ8OWjxH5JZ2x+jQ7R0s7a+njvNSxCVopGoEsWR7bVyapEPWCvipA?=
 =?us-ascii?Q?3AkXZmd5uDP4mCADpYi2pDkNaIMG25wGjaL1xz2igzGS1tHg5l/v4kFh7PMd?=
 =?us-ascii?Q?BCV5i56Y3B26lpCvrAVPIjXIzgnWK94+NgSjq5hGorE+Ok6iHJHex7RHr5hI?=
 =?us-ascii?Q?gWZ6ytgmTJsEbTZooHFYtf+O0prl7SPnvhlCfqgIWrxQuamMy8qgjVDq8BrO?=
 =?us-ascii?Q?qv6cMXQsGXqnwJ/PJL/t3dGxRJQb+zVaWEU8yIT6Cuup2b/92SF131ptBlYq?=
 =?us-ascii?Q?tLq7yoKBoJdSt3CakWZbH4hBsRzUk9IbFJSTnFWdW6lffUyrqUt46856Sxum?=
 =?us-ascii?Q?tIfgR98rNkdcK0bFshRFYQxK77CuDFlCSqcIn+EEvvEFIGcRi4EIAISALj7j?=
 =?us-ascii?Q?QbbnfNiByxYRSP2GPeoph/wKBXhjMtbGCZ25OQNMLLHn+BP/Pa4gBEItUzw4?=
 =?us-ascii?Q?Fu4hBldZwQuV+gqmOt6bVi2w+S6WUbwuJASPiSM7HwsjGFdJiTpRWWnz+e3b?=
 =?us-ascii?Q?Njxk1V2Sxi4QBHww03H76vjUSaScDCT7BuSRIjPh71SQn/5U9NtfsmlPyuIo?=
 =?us-ascii?Q?W2/I0cIaRPGYYEtmepkou9c+jLYG1UY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e0980-d682-4eb2-24cb-08df23849cb0
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:34:18.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAFJzYJ/s8gPMJOkCwbvYHDMRhrpieyw0LWuj08JatpHqM2CJT4b8nrbTLzzsTSnpjcCvHDzkrwB5GVgl2lPYOnRFTdhQtj6+ithOq5O+3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_013444_995739_756CA5B6 
X-CRM114-Status: GOOD (  10.70  )
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

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bdee5c7ee83d..cb4072f7b309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23600,13 +23600,16 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
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
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
