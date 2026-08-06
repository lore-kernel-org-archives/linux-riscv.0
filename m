Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146B1C5AC7A
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgkC3bsvkKUp905yvBFZN3x5ijW3xKKYqzGgxBpdO3U=; b=tqOqQGZCdcP8th
	BYvgZ5SbIVSJXedHQpC/6hJL3MrklVLdNZaRJi+Gz/aHVgFZjgHyToFGZk8OKM+hLsep1w4izQNpg
	WRu/NlccrMgmn6ffQyD3lRaTVjYsnOmRPa9wWrXg4B+2nVieNPhn5u9AfvJG4qQkWhaRwjf+gDbSg
	K/VlZCdImfp/kvNhIrk4Yb9jSsj5tOZ74NN0wvqAwir/vkk91C1ypBj0wKqfvRPATGyiOuLS18L1g
	Jg0sXKTLw3xtoc+6uiXBnqXzfXVbLUNWNkIIRksE7EMC4oyVTvUOqzGQb8B7Ze4uhJZ8ckCP1YDAd
	+D8NW3acwg7W4LbnG5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxBV-00000005lxh-2ryY;
	Thu, 06 Aug 2026 12:26:53 +0000
Received: from mail-bjschn02on2118.outbound.protection.partner.outlook.cn ([139.219.17.118] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxBS-00000005lvC-3aYD
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 12:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDWlEYuDaaFI8Z+bYi+60c7QGlpwasjk14ixPi/aqjeBIYTKom9iSYXi4qOs6MpS9vMBE3YIIr8KEwkFoHua41m6x/ayEJxVxfqBn+Od6VF7YgbdobGxXE6racXunlILeSX+RtQ9BO/gWS0eV92laLZTHrbrlHXmMxbSYERGClGsut3UmDmUgE/iba1ny7iTHqZJ6XUdavqoGKEVss0D3IMB6pNWANtMOed/GtuxrhybOvT79J2Ds/ZgJ7POqrhLNVqVl8OE2tK2RqdPgV6Dft1hEd3IHm8fdbgWnYJxsSWZyH705wJKbalInzauT0BfPmjQnDDxZhBARXnLASvXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcDY9YO8dOwwCXrJ4vRyXBIGJjUJPUevKgLOHXmDnYY=;
 b=ENNA0trYkCAeRRLf9giKGBEreWsyWXWWRa9FBKyYPzFfRNr6hamt2All+BYZganBC86nJImmv4hg9z4uSSMHsT4DtVW5Wp+aNl3OBLsesHd9icNHAlAVptGbV4ozDSq4AJavL+wHwAZ8W/AUfbocfTPloZwkVcrFTt1uNY3l3YYewVp3w6n1Chv6BO3hru1UqGCwmOEdLY4Ru1MHexjx5xNpgaXt0I/io69lssbT87+iu/WvwRMiU60Aa7eZTEoCe0uy2u0AgFzQHdHueb1VjsOyeRgmsQ+zt3Q4j3NuJ1jd43Ui45HEBO/Y+LT0pmM2fGiVfhM6An95YYYOJ1uCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1207.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:26:07 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%4])
 with mapi id 15.21.0292.019; Thu, 6 Aug 2026 12:26:07 +0000
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
Subject: [PATCH v3 3/5] dt-bindings: riscv: Add StarFive JHB100 SoC
Date: Thu,  6 Aug 2026 05:25:51 -0700
Message-Id: <20260806122553.182449-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::18) To ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1208:EE_|ZQ0PR01MB1207:EE_
X-MS-Office365-Filtering-Correlation-Id: d459f6ca-07f8-47c2-a920-08def3b5e3d1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|52116014|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: Xzo9+qRA6UQYNz3WmAV4WW81vFj9+DbW/IxjYK8tAl5ydiA5YuBTALCFUvcCbhS6YxhDgWrTdNUcJTsJ1ieJQu+dUfiqNz2TWwCmsAhcR7uCOn/tl3Cvxc6/TPk3Ei3TEvLHAB/pP3uHxsoIcucZfQBWa5PkCAJ4+wrs1n3YJMzO/7NM2rhhdHPa4bHzOAR9Z7PjmB3xgomM73ovyp2J+cFPPdUFPVHM+RerDIaaHSDr4Y8cuZ0TFncV8WI2xZxZDoK4wfzqQ4PhBNqq5eAIM8XcLMO+0I6cqvdRRC9ROjq6sCCbNb5s5aFRBKmeVRYsDZ4NYbjYsiTyNODbjrTHDSRaQzbBg0cbNOc+Wp+UACfIa0uTRKL5S51NTZ6zpkyMv4BheiCOBslLarPEuh9IeZ4bb4TE2KUsL5gwg3wKi7GywEhXBUhx4WHF1pXtwSkj5/TWOozgo3UdRc9F6tL8A26HAJz+pZYv6AbJiWP0o9rvBv/biYaAGnV0XGPXnyE4iOTZ5AZ4OKuslm8nmV36uPCi4VyK0QgDas6mcFXfC8cjGA7boB/4AR32p5uzblz0QlBNpsoQQpv34CkOYfh3jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(52116014)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hy7W42PWjdVlkZM+zJUtDfaJp9l442cR905PlX6fqBKHsr572qhOcBNzVIPk?=
 =?us-ascii?Q?5s9XYBIEEhfhw2d3x4MNmSiTex1lQVnIOemnHxrGxOayxFxwboRS34gcBSX5?=
 =?us-ascii?Q?xicfoi25ifplZBTKDeEGFjkgZlMiYSU354F967q/HzsfybiKcpgJ+xo0x4Ap?=
 =?us-ascii?Q?JO7KPEn0GBjKjHuaYLl7+H/nh7GZDNgiSVR4o0/2GOcHhoCheUqg+R/yzuoz?=
 =?us-ascii?Q?vo2M8KCnSCgcxFJ5UY1DNKaL8xigjzFm8yP42kEp1c4KWefs8sJbx5EPJWlv?=
 =?us-ascii?Q?uojYXRCAjAt3sLyCzOePhA3Bq7JaJpEXeQsUvJpZ+YQMapgr0aj5YFjiMi51?=
 =?us-ascii?Q?wlKcSpUNjqPzmB8jQLqzCuup0+yirbRmgGvoHiz1v0Pr8ip3QeLhKdOdO1Rl?=
 =?us-ascii?Q?Dxvhe/XqfwzhHxUOT+zoj4VwriY/P/+eD+ymDBIW4zhDb4sjbJFTb2ndnSEF?=
 =?us-ascii?Q?9+okWBeZHnPVsKRsIGbedGH8eBxDKLynXHQ8GpIAPfEbPZNqMRCQC70ITaoe?=
 =?us-ascii?Q?9RwrxJZ8oSwUPso/BuTGCOt5jqHLZiVsmNJeQsXYg7daWTrjRAxZs9sGUvO8?=
 =?us-ascii?Q?TU1eHDN4zeD40JXfBYYeEJM9mJq8x4MkWSJQE6UCIEBDoU/AvVefw8qFIntG?=
 =?us-ascii?Q?PZRVUYMa33aGQXzDmvStMt1ioYdP11uhTgKg/9ZsRhe46geA9UhSSfCu1wQ+?=
 =?us-ascii?Q?1uNVrjVb+EpGW6MW/zSsiCakTxxddRNT6LRBTy7VOsZMLnBb/rPUgD0hOUN5?=
 =?us-ascii?Q?Fm+QRqhC5aspM6PAI+8+tpT8MnISX4lS1sVNYGxObmNTerEJbqHw5gNzWHWD?=
 =?us-ascii?Q?xgSh4LNk1q8NMuyWP8tb+GxmHyrABNSi6NxRLsuuwMcU7zkFpdIHy/POGDLB?=
 =?us-ascii?Q?T/RMHRHjzG/uFAZaWzDNh5yRSS9E4uWYMEmdbDCygWvSdTUqqPd7iP+8G5bU?=
 =?us-ascii?Q?rElsYZsr5OX5vJxbv7n+AHKBmjy9mOzLa1qknq35TbFObfKwkC1bTdZB++u5?=
 =?us-ascii?Q?/LMTx2SxaksafnGyN6dVFC4X2m/aknQDmmoXWIlIIIkJfdKtzvpR4XqzMKhE?=
 =?us-ascii?Q?KSDaFDbygMhhxJzw/REiQWzoFBWgkpjzAaIoN+0cW5DiSYSpwsCnK1sd5n6E?=
 =?us-ascii?Q?YOR3tL/pxwVgSk8cc1po+TYwhKKH5VpFw9bdIdYnW+aVGRQtfeGT2H2pc9Sj?=
 =?us-ascii?Q?ZL+m+OeFgBkI7e5tl3P/WZxhdYU6sfsGNeoEIPl+aa2/YxiuIbFtd6j6oWyY?=
 =?us-ascii?Q?+HE7YiNiEK/HUg+I5fbzVCX1fI1xqxqaPxuae4uQzCZgpWnOIn8hceSQX3A9?=
 =?us-ascii?Q?8TwRnKfR67cp9RPdRHPugtI3LGrI2dsnxGvTxg5ftYnISW4CWN9hKTt2CZho?=
 =?us-ascii?Q?mfhAiH5qUEI0CHmmkF74MGclNVvdSwKeg86cSppOCrgWW7D5RmgEwsw+eFdX?=
 =?us-ascii?Q?ALfpfDCaFhG5io1n/4vUatkSVzPpihfWy3xjFX/Ww1wHydMQbsKfvQjbES34?=
 =?us-ascii?Q?ofnjwABC50+N5+vEiLMB6HMTVplHdkUKKqgk4E46W2krxn9CdqWBbBNYUBTb?=
 =?us-ascii?Q?siWH4JXDMPiz2r9pBWfT64gDm12tJaflnJ5TuUgeFkhu28IwIwfkxEJFLwBB?=
 =?us-ascii?Q?qrTB26kDoAhUzK5WsufAUW21884qS5gVvKQ/+Fh2KTkYl2lGriRwLeWPkvSc?=
 =?us-ascii?Q?XqVAi3wULcNMVknn3WqTg7i15fEB8JZxWz2MGxGh5lXBhoL6rr4Sj+feeshq?=
 =?us-ascii?Q?oi/EOWX6FDS0vAZouTTvAjxpf2ZAh9sMD+PX7Ii8IJJtUvsW8bPe?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d459f6ca-07f8-47c2-a920-08def3b5e3d1
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:26:07.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sbAbMHsB9yjleNP9Pw10kitg3DgZY5fYfeJ5Fw6eBEF4V5VOa+pqST55MApze58ho+okN1tjwF9jipcbudoQmoV/DjffcVe0/c+ly6SZiCjAbB37OV61oIuAz5RFbHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_052650_894319_89BB0368 
X-CRM114-Status: UNSURE (   7.42  )
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
Cc: devicetree@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, E Shattow <e@freeshell.de>, Anup Patel <anup@brainfault.org>, Joel Stanley <jms@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@oss.tenstorrent.com>, Guodong Xu <guodong@riscstar.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add device tree bindings for the StarFive JHB100 RISC-V SoC.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
