Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA9BCC6B35
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGME/fptlPu7/re+CPry20KIJjR1FkiKCJnEbUlTKyQ=; b=tU9bPr/2CGh2X/
	Z7DbP+71UgFOCiyc6dq7MmUPDYTKBtAYmujSg00nNCcnpD/sGuCECmAVyfbs+JnMNMsX3/2NZi+CA
	Wx4vgL6vbqWFXlGZXz/etjAgS7nSmgdHX68rc5fJoM8fShEOsBlMSNovlpj4eIQW+2w+Nv9yWWZc5
	Ynl8EFknkV5mLPOLlPuhgojH3Phex8dStsts9PKD9YLaNwPKzWT6zzzfo3Ssc+JU7ZtYXGmlQFqvk
	hPoI9cfctaCgG/YyszL9Sv8ph6RzXFL+mAD1uruKSiIfTJCMy3gxSmG5qvSs9KdxD4jTnn//0R0xk
	OdlbB+UndUZFkqJ2ZGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbs-0000000HBmp-0AXG;
	Thu, 02 Apr 2026 08:41:04 +0000
Received: from mail-sh0chn02on2115.outbound.protection.partner.outlook.cn ([139.219.146.115] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbo-0000000HBkD-2oAh
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 08:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJNGRlB0GDUBk000N/AKcLdaCI49/Jz/pfcIR0csnxuBhRZbRhSjp3aSEIWHtVA5Uy2Kqx4BfqfoOtsAi77mDjMd5DntscmBvWGz7fP3ZaIu2JC0R9RYRpF99jE+jEnvsNrKWtnfiW+gvuRWJXliC4z7QXH+RBqUQjD71+oSRIvg5sCvVk2K8c8/hV5MFxuD/A/A7Gvj683YvvLhzId33ZzYoIQBu3AQTRPzqqg6YF1uzXcvzIWi0BhDaIjcvZtNu0k75bBuv1LtbzgYHKbwJMAhQj6hFBIZEvIUgEDWfzanmBPA2RchjIsxTX56lPyCZVdTY8szzAnBJRowIBDLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhtxvVHayM1nwUWvNuATQFb8QXkeN/dv1bOwKWDH6to=;
 b=DJd3kchzq1N15y8UhS8uHVejjrxCvXexJLRlYFrsUMiaN8C8sJfEysH0Itehgn5uYhKq3AAwCu/6FVLvRA4E1vz5YYoV1296wwtumHuwfrmP5S9qOUFRlRzMB20oMezAB8Dxg20xZCyGyh/aEKkWbyrPxMMS4ECIeLV5mf3+JqBfqT5rzLpZzGXEF8VAyUfRINgM0k3UceLO0G52Bs1kz074O5maG5/EwgfpRsPPhwAb3lCDtj4IfI08U1REGCafnjXhSOZmahzdTAlswv76rm2lX5MZzntKWkhlLM9BAInlKc1wLoBD4Lo87pLKV8GJXrjkyBScQ4rhbhyG+7kzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:30 +0000
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
Subject: [PATCH v1 1/5] dt-bindings: riscv: Add StarFive Dubhe-70 compatibles
Date: Thu,  2 Apr 2026 01:40:15 -0700
Message-Id: <20260402084019.440708-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbe7a88-0462-4e50-fc87-08de90937f40
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: hyDwBbwMf/Vu3mSXcK/IrzzMv1A+9ddKtGzpkle+cSO3D2rBk5m4xp0GPJlQqSS3iEcM/XyBO5Xw6AJmy7j3U8VZsMVJclCQ4A1PDDXkbtNmPxI94rXy/2KPwn/VnstcNVGGMaJltMI+6TCfdMrtsoUjo5Qnv1gMGsCNSiaVgulSXStTKRG14E6LbXwJ/qKcveWuhQpFcBG6WR4r84Fjb4QQ09BWBkNiQTupvqqWqWNRKJPnZ89Z1WzEPy0sef+y547GgcNI1e+Kk9wyNdIus/2tTKqwo/M9mFtUuTO5McfppkFqeVR1rXGbd0/ch3U4uJys1dXEK0dXTdFpHOHmmn1zpO9Mn8l0OTHiS8tldEJOEdUmgnMsiF92yJwox2hpMuMFfo2f8ta3LmGL1+hNrdJkTsaEJGg+ZkyhTapSD6XqssVEV7huggoRZo6It3OZkeS1S9iwgEqqN9dNSWy2zrrn6ASsvBG4SNTvdAiyHQjQrWqAlmFs6KmAx+F7b+13b3eshxHmN9hGLdrKjL7y/5AAUVVzy/TpNppxn3YDNslInZu17WoLR7UYuzaZwqEVA4lRLg1cGMrw+myJWcx+EZeUtLx2pPeoHCdouU+8mus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JCpM0Ev5FmEdvZbaIOQvzCwaH0qkdv7S0XzKTm/fyOauiTosdIU5wUJ3bGZd?=
 =?us-ascii?Q?R9vXiuTh8jJdm7yk4Y1VbslL2+NZrP93O3zeRxyvA6dPpMpzNO/Afe4a7Ekl?=
 =?us-ascii?Q?GPSG+jgIH+BeWerzemILEvxwwVKaI7JA48kgQYbMJsvNf0CQTc3p3iwyuPFL?=
 =?us-ascii?Q?bQLQkOYP7dzQHaFZ1KqyqyFDwWwue5u0M7sM+XvrU0Bn72XS++P2xehb/YfL?=
 =?us-ascii?Q?CGAqx6OxAJyzL6L4ThTp+Wpw2JijxEUHYBlad/5gOHDtjqfGlbVMl5B0Mhku?=
 =?us-ascii?Q?5Fl2pZxckqBe5sb5KwYBBdGMEgrqG3E/F49t+HqrA9LotncIavUcEDPLKYXH?=
 =?us-ascii?Q?T5FiW87GbDSf8VdyAMZS7eNIxAIzwEeGBzKZH6nIiCOiR6nICWcaDXGe7j7B?=
 =?us-ascii?Q?8ZCr8VZjiMzeIcJ3PbbpVTg7d4Gxb+E2T80t8GdLH3lJ69IfQ1WPs5w0Gg3w?=
 =?us-ascii?Q?rns2eO1VTBCbj8fDEL63J2SHgLXjwaVjHQg3sUL39EIxSz2OygNn2rHUqo2q?=
 =?us-ascii?Q?rexFZ5drAEd5K+8ETcgUFPFjnSEfQqIDVF3PNZ/ww07L43ogI1eal9yruqVY?=
 =?us-ascii?Q?uBLVrV9ePtpdWlKR1nbH1ng7Lq1ez0dfJGgGoOiVeBqoPHFsW+hELNSwAOq/?=
 =?us-ascii?Q?ngw4Qjk8DHgjHAFEv/4S+CMojLgwUaDdhwnAiX8LVSbyjw8IxkgBxu9zKe8k?=
 =?us-ascii?Q?5F+rwB2cBW0ogqXZ+JYsrRfvz6PdCZzlvrGxqt6UPFjP2AoF42KtF7wCcHTY?=
 =?us-ascii?Q?aeSlzbrxCYCfiitbxuREgbEQLP34IgHCFFyDNBuJ+KT5MBCLK28M0mtr8M1D?=
 =?us-ascii?Q?z/nT8Z2ftaCDQAgKhR1knPBUwUwCHkxZHr6Epjn0rvYe6VQVfyI41Ifo8BkY?=
 =?us-ascii?Q?MLcTS4ieYOrWNogMi1q1l86BTyvf9e/M8sbTVXkYxIYcb0Xtmop8Inzq0TqE?=
 =?us-ascii?Q?eyKeh0GYw2grypgEkVvVq+1z9SKq7J8rMAVqT7K+kI33IogOAt9CubIER1He?=
 =?us-ascii?Q?8uecY708pdztlXxabcCvoEBGX1rly71CxEzNvKSL4FcFnxShkuyHrHa6OXZl?=
 =?us-ascii?Q?Y0z0MsgGp3Mu/wa41vgIAUiaYPb3jrcZhvDE1zOFb9NW++QoTm8+mRio73x+?=
 =?us-ascii?Q?RSBDyxP5T9NdBYxFRrU9hn7KJyD2dqT/Dq2+toDWGYUWcPKBf4W4VmVJLzoI?=
 =?us-ascii?Q?yJykAJjTI9t9FtGxSZHF3MABE/Td7i6qLiLh33BZ7iveO25N/EDuT2lkERhY?=
 =?us-ascii?Q?DnPBpR9j86bhT2PmQWbM5LCgk5FfEqmOStC6B0GS52mK08pBhCked+xfhPJT?=
 =?us-ascii?Q?tLsrBcqmpSfLFh3ctlyvOCtWJPOajB5/w+8XDYoTVW+eJMB/k5tx9QCMQD5t?=
 =?us-ascii?Q?NhGZ/GgZKFS4VBHENUae2P9FVophkKPV0lttUWmCFbyadZb8zxfVKavJmx5Z?=
 =?us-ascii?Q?gSHnCj2dtlttNo3Q1gVgQFvH8i7LRYkdAPGivJtpeOkO3ABbuyUt8coK9/eB?=
 =?us-ascii?Q?EahDsLqmA7XoP3V2pJGDjSIt9mGcY3f+mkMzH14gnOLjsOY3ZrfyhCcLXbAi?=
 =?us-ascii?Q?dTJuPiiK/Xeuh99OTJ734bk+wGv7gHDb7bsI2Di9GdAKbGlBkpU3HaQOHnb4?=
 =?us-ascii?Q?4QmWw3WVap/my3IIamu01IHpsyFK1SzXoz4NcxfTS5/ECPlXon6tHCk954aO?=
 =?us-ascii?Q?noYg8TzykS2+p6HP2hxYnq5sUJZSRHWMOTLOR+McTUMoNEVNExsDHlBprshA?=
 =?us-ascii?Q?gvYlb2rgNLykopeEqyBJixA/+OVoy4yD3O4bxLy95CnouXUsWpNT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbe7a88-0462-4e50-fc87-08de90937f40
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:30.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT+zQUcnHqD9w6Ug6H1LMGD1fCaQLhT2ckIVvj8VTovDfdZL+YCIJpfUjWvmXeh0g5fldaltVBnf7fA8E9WerJWe/DT4Cb9vVdcZEJgugq+jUSfm6OLkk1QZBn5G2GS6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014100_708420_90ECCDFD 
X-CRM114-Status: UNSURE (   7.20  )
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

From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>

Add new compatible string for Dubhe-70.
Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..e7eda7a9c345 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -63,6 +63,7 @@ properties:
               - sifive,u74-mc
               - spacemit,x100
               - spacemit,x60
+              - starfive,dubhe-70
               - thead,c906
               - thead,c908
               - thead,c910
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
