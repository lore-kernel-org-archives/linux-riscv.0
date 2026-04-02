Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F834CC6B33
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTppl0Izjrskl77n96r6fGtkHWki0JTAh9DfsCoit7g=; b=gqHCYN7NrSDDjX
	GzuPyJ2taSvOJjF4kxeOCd3fi/x4XlQj0Ob+acllyQiUcJ6bybHJR+g0Y2eEYu9NXyOH7SI5m/fHS
	a2AlCXwexsr8mMO5qDhvDW2+2AE08kntkQwAZnyTpuXD05V8gfxFuhcifK9NaxewcUMyWzrhzQ57+
	y+3NczfFzYBqV0tPgxZveVCS+KAysXGJavSmU8RA4aG9TZBSJVPGuIR7g7yMjScrK2D1YAbTxoTIm
	XWCYuWFwRSJ2IrZk2Q0rVF+nkSez7Ng89ACbbWxOeVud9qI/SIQ627wVBirFgC33ZqrNgI8ERMjZM
	pI5JlDAWscC3/861cCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbp-0000000HBm3-2ilc;
	Thu, 02 Apr 2026 08:41:01 +0000
Received: from mail-bjschn02on2122.outbound.protection.partner.outlook.cn ([139.219.17.122] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbn-0000000HBjI-3U7I
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 08:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzsq7JuEfGyMuZ6taeteUHxWwZdwUf1CnG2SvCsenNhqJkHjAw7oLMiA1H+X6RMUyG1hmg4zoSl/11uvPJ86ynO8aAj0JClWA9oxKDX7vXOGtLqr8EgLjPKCGtJ+CESOo3ottA4i1Tb0jetOHYSYQEVVaikqYww98pSJ+HEQTV+nhjONXmteem387yzgfUeKqi6jEKLe7LUwg+qpYtqa+l/oCf3MbNr+xWLPGs4ci8fqwMvGgItOfMgC55Hf8dNpsTu6xi9CoM/U5UrK5bFAsh3v2EKjkA0nPDUcAsvLTHKi8SqfmC+STfBvmjFSsx6InoepD6qxfyIF7TusVPjt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1udS+ImRIEe6t/AvU1f2Hf0h5nakM4/xMRoji79H3g=;
 b=gOGPuHwCvmSwAXOw3KtxYqrYmYCs+KyJ0qQnUn6jsERxU7FOrYZp7kEVYwdmAeI/ZN1qGHcOd7H+OC8+wWpE7qELGSIYWK/ewqoNe+xWpxodE4FOaxn9ZztQCifVZaFkamya4e27wHbGxmhZPlgUXwlNUjLiySGkETvb7NKkyPujpluePeQY7P8/FSG1j+PmM4KdlZfSoRnl1qxHOv2/kCabr+Hk7EmF/gNxpApDsRjrLOdFhCJxYJEn+XL/r54LgEG4/d7ghLLCRGAk4Q7PRPetVZBhvy9KTTq/ZBdlgrfdATsaAmg4jijQ4Tm4oiHo1dJiujzZWu05vL5y7H2Tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 4/5] dt-bindings: riscv: Add StarFive JHB100 SoC
Date: Thu,  2 Apr 2026 01:40:18 -0700
Message-Id: <20260402084019.440708-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: c75083ae-0e92-4bdf-3a5e-08de90938327
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Rs7I+0qhuLoP029bkwluEwLEbF9o68Mw9ze7ewN/vLwCTi4Vc3g4AQoMC0tkRfY2shwChr7z7k/b24J4r2wUXCgRJcvtwTItvU1sn+H/OU14lVpE1j63hg4G7q+sEk5xuACmJPs6KgZwezX0c1E0pIYy/uEywvRToimQYew8p3vd0u0EXM0Zo69dALgOevLXFGsgdn07OrHo1wMqFqLJse/0ih3M32I51NS3YRT/RV2CKySwHiTvdcCvqkLuEOLp+SImQB4Y+yrDMenrcRhtDMqF1xYMBQdIecALYOntUZVeFpcSZRrAlB4qQI534xxdndx6Zi2aJRewbs5eclW1ET4M3IAIFmhIt952cHW4EZXAcC4ZVllb/laJUxTaprcbrlF4ujYseFOn5uQHtLeF45O+Sllv4FkGFqyibxw2+2j8GDnp4xlCBj453UgmwRqqNLljHI8AuSGIBVot9I9BYD0FMa8TrVApcW8egpx/1JmgBusvzamKDD3TLZjG53/iK+JQDcDal5y/S1d/83TQmhic7UXDXI0emX/NDiFN+z9BoyJJtpOWIOGdue3KwGRodyGaCj78jatb1WizZHrYfKTfycqwDUOtO1dwr7/QHs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/DAUab4Ruc1w/jHegNCioVlsfUndpUbc65+HRJAaLEpc5xvLzOdn318XUKMt?=
 =?us-ascii?Q?7+/TNNQzemc8+sdq4ZtpL7tdbjRjuZJWhZoVfo2Yp6fqoVkiBx/Nj13TlzV/?=
 =?us-ascii?Q?FEnb5bNabVYd8/h5ymMrXGb2xfJbXy4orTgB2C17vqKRgT8CwqWtVSKetegj?=
 =?us-ascii?Q?G+B0BdkzUW4dFIcBvajrn5yQsBZ4DcK25O+k0Mg8hYAfmyZzQHvr6ug4BpGS?=
 =?us-ascii?Q?YC4FrTmRsaee45xtlampGrqtuK+Hg8y39hqJp7OuboF+hjMZYcyxGDokvzYF?=
 =?us-ascii?Q?0BUpdHdMppfZvXUkNDtYP+1lMdO5f5qZjgruVwfNnw7SeSL0Y1YOKLB+M5FO?=
 =?us-ascii?Q?1UImPRKks/12nklB4x43Du2c5QjdIGTniGOjUTASU+DXafw4A4lRBDbCptPJ?=
 =?us-ascii?Q?YGGGyp4UFA4mns+1H4GP0uU8F7/pUCNq5N4Ghq7xtbEptHyz4zifgBlVSXaG?=
 =?us-ascii?Q?qBtMRh3VwvYpGnvA+3v3L2pAcLoKE9+KmShMKoU63gJAiComwS9IwoDvI6lf?=
 =?us-ascii?Q?syP/0aXDuCPjiZqaSgj5RvoKFUSt09fdNh3XE0+yVvi3fmRVRl/mGBzvFbs4?=
 =?us-ascii?Q?XzOMVxtBJmNaoLBoc1x5T7UEKjFnDmTatch/bsnrQ1UyLgZVo69xd6glq+S/?=
 =?us-ascii?Q?48DYjqMER4HXwUQ1nbGtwe5b7hoIaGDfRg6Y2bHtOr+2k+fB2bYKxk/6GnVl?=
 =?us-ascii?Q?/Hr1ot+hEPEfR5wztzCEBFOIdcqda076aSF+wQGPl8/MqqPER451dIMBuwmA?=
 =?us-ascii?Q?v9twooCnAO1arZUgiaUq8Z93xcgbdlHUqmbSHb2aRbMiwLzbHjFQF5wsnX2P?=
 =?us-ascii?Q?/Q4PQga4lEpE5C70nisWyJW0SeOMKVUxvBq6SVDJhtRroGopk8gtfsVUPUpZ?=
 =?us-ascii?Q?wEp6qnk1LLwGMuAp1DZAq85RyPWsoYd/RrAMnNWZm15b4pEp51Gh+0KWjx3Q?=
 =?us-ascii?Q?NSDUU/ZD0Go3HIDGi9XoyTf7+DecjbZHtbrQn1ofofR9dNaYh7N27vD4j4HL?=
 =?us-ascii?Q?oY53US6LMb5WSabNhLJ7+6iEHa4iH29WZPXh6QsNOcLcG64bCEfyRGqRqYsO?=
 =?us-ascii?Q?OBNjI5+DT33UJCsJlrpQ40ziWXjr0snHSRo4XnJ0BvPmVLBUhAKKJL/OvXLV?=
 =?us-ascii?Q?NAdpTBi/OzJborOtM0sIjLmqg0ZVsUAMKWZSD9wGf4NIDilAdh5i8joFm6O0?=
 =?us-ascii?Q?BkEeobibk+C26z/bZeQoi2QvNt9SqfnqoM+fagLcCJsileYeVX9gAm3dPIb7?=
 =?us-ascii?Q?t5seoqdRQnQ0S57+H2sIONjs73Zp/pmYu/tMY+6/OnmVTa45KDnzavuReEdS?=
 =?us-ascii?Q?+0I8JCjducgwvclqoYUg8j3YrGfOm3TvfNchLn/vIhgywiqJ1HKy+dN1VIBJ?=
 =?us-ascii?Q?/RIKyRhj62MpQM2FxRpl+v/Ku3v/d/DdeXPmEwFllJrAI1v4hFE3huaer5Z/?=
 =?us-ascii?Q?blpnaLUkjVnzY/dDydS2R8OlY+/4Sm0tUPOzIycvVyYwXUmo/uvzlF/EjRHK?=
 =?us-ascii?Q?0tRMCL/ckEYrYM3O7Jtzs5Ii/GesCZZYrj8VNAx2A4IGPpuki4kZZa2tklqR?=
 =?us-ascii?Q?2BPON8DLzFi6E+ioye+7IUIh7TsFZMkgnk69JGJGyleqGCWhz9280DKq/2OX?=
 =?us-ascii?Q?FX6S9IVRwCIRl1u0dIbhATRhApnj7PLc8FLuICFUjl56xVsXQgSt1/fF79qz?=
 =?us-ascii?Q?on1NrzrM3nWqHyBVmikKZtFSPeGGvQNp3aB5Woxz15zRZVvqzthYwvvYvNIx?=
 =?us-ascii?Q?NM0iuXRtJetmaGjH781k9e91I0+XRX0oqMoX29gsQi54RCeI/AL9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75083ae-0e92-4bdf-3a5e-08de90938327
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:36.9104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mewi62JuCihd8njJjkazfN9j1QdSZREUhvpDuTl3iJ6RlOwciT6/V/9qEY97qmULy5epeXZEe63MSPOtEgdovNufa+DARzQfXlEJ0AAumeyXivyf//4t/bv7jwDy9H5T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014059_876503_2F213FB5 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: devicetree@vger.kernel.org, Michael Zhu <michael.zhu@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Joel Stanley <jms@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@oss.tenstorrent.com>, Guodong Xu <guodong@riscstar.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, Yixun Lan <dlan@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>, Michal Simek <michal.simek@amd.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add device tree bindings for the StarFive JHB100 RISC-V SoC.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 8ba0e10b529a..277618efff6e 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -43,6 +43,11 @@ properties:
           - const: starfive,jh7110s
           - const: starfive,jh7110
 
+      - items:
+          - enum:
+              - starfive,jhb100-evb1
+          - const: starfive,jhb100
+
 additionalProperties: true
 
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
