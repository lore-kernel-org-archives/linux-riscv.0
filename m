Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140BCD3436
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTppl0Izjrskl77n96r6fGtkHWki0JTAh9DfsCoit7g=; b=dkPvSiw6wn9gTv
	PeR6JhWM02CuaQmTPF90BbH6qXRNd20ksFSZ+Snw5h61my0oDJPyVdt4chR7N7v4RbGwSGgbkOtT9
	gqKsiFM3E9NHbrhp9InUaGOOLtdmKKtRRZyQB04r9FlBC0hXcBCZQTRjyq5xvOR43lbEENCl7XgDf
	58UBKTl1PU01o2K3qgOXuXWChwPFOBFIk68vSgkdTWAZmzLphO/MQaJW7yTxHnbr6+I/ZlCqvRwPp
	ewYn/dMzjW9t4SxT3d7DMt4kgmaSPa71UfjLxWBmiDSfvZOtaC9WsSykR00e3GHaeQ0coT/7NirzJ
	TVZd0wdMOXHzFX5YziMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYLB-00000000Jgd-2X3Z;
	Wed, 06 May 2026 09:14:49 +0000
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYL9-00000000JfX-43ob
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n55sW6/PNhKj1u3MhFjXsV95wH3YGPvhPpf4C82SJznL7Akw4mv6Wo4tjwRNZ+CoOEzCF3MqqbY8lE0D6kedRFgUVKsTaN9P1Yx3alU+ANkZoFC9RWl49plHzvDbt5MjLXUtyqjp3MJRqpQ/FJQt4vh2FHdnluOYaVWGTOt6JrQoC34vWUTvLtwVZFkw1CjS4/7eX6hW7rrmgHinNBysxGLEnDCvDXdh1a6ch185WtQ44qppleSk/cPW1h0hAUQ3/aOjjFTpCLszd8TQEW1tQhwWfn3MC3bQNIegtoqXv8p475YzWtB3E+dZkNU1ERP5pkKKEcZBKQYgGEXZrO4JLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1udS+ImRIEe6t/AvU1f2Hf0h5nakM4/xMRoji79H3g=;
 b=DPnHbvqtnzZPqMsxVX9WSFSMYN1/Sf4Okk3wETu9CnNahAJCYXtMPIGSWod6ibUUh/eWkmoMun9StSIDyL/jU+JjvJehFMsMqjht5B6kpy48maFDS/LQ9ORjbkLNwCuF7AOzIpJCDrumCUSwQB75raxvPW8fDGiTjg/Y3gYz4lk52JgWAk3/79+TA+C9/fN5uVVTB7CnoujGjvNwdNlAK/hR+x5Yu6Cx1DZkT2CEj0jn4Y+q2QuB1b0JiGyNyK0xnNhGirYN2vQbGL1Mgyoi8ndx8/qhOAFMyCH7qF82lcST7k+OfGzeWiQpEU6t7s3OhTU9mxjkaPYpIk8SXu2H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:52 +0000
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
Subject: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Date: Wed,  6 May 2026 01:59:36 -0700
Message-Id: <20260506085937.754808-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7b5fdb-061f-4871-60da-08deab4dd631
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: HWQ8oYJqDmu8CTNCflFbH3eLyo0N1IYyHY3bkjejlICAX4jOXOokhCF3MdTvNle1XiELN1E3ylmjHXg1ul9h2d/9bEB9Fkr5NrEaIdmevEv/yhxr8/fIl/Ww4WvIKJKa1jF2QMfD0zS5lAIWMTQJ3EReRrJjaawfKSMob2ViF0MMk5siyTpVpfoajZm6CjvswqRTsHuSDjtITDGHgI7eii9Bu791uELYrC7MZYpq9zQzlh76J+ir6KZv0/OkKYbBuw0sqwytI76Qungsri5zaQVNaze6DNngiSYl4aXRA2m83sUoCS9YQ9XAL/kUMqfwHpLuoracSCyqdv6rytGzE9bWKgqOlAJtQubqYsItdimvAxCTByzHxI7rXMiDjXNXcYjDzalzAflJv0GMHuS8MMzQ4X0FpDJoS+F7Gw9vLY4T6eAOeJloDiD+vVpM9JiJZJCLLM1VKySJy0jbpvgAHcJWDe4DV+h1N6tvNdJ6xliKrrXOnzG5qy1THjF7KUXCFLZ9onP0m0xLKRMZHiNOqg944qsj+TAE4AnF40jJpw7PQtTXqJjTOl4zGxTUMOhGA/hdA9C8JLqYdjQvvZqAYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x5bpcIJi5OyiZz9L8AULIrSF+p0g8FBGI9bR+rC09783/YtVuksOWrfRb390?=
 =?us-ascii?Q?gySTOMwLgP7KYoCTWPafFjSIkG2HN9cez+zw/EaYghJWqucMGYKGzy5Dbnbd?=
 =?us-ascii?Q?S3DQYZdkeCme/vqqtMj0weJKGMLULte1zE8MKy3FsyilpHs8/GeiuMqQYXhz?=
 =?us-ascii?Q?Fm0GmTC1MzY+oB02AyIYX1ceYgJRkbDEVw69qP7fplBWFJeijgHg5qXglPM9?=
 =?us-ascii?Q?3qDqNH4Fqi1/2/n70QTnDp4+XvgrkRSmsFA7/YQRmueWbZbBIw6+mL5qtsBX?=
 =?us-ascii?Q?HdQ/hMy0NvoEwqykTmV9Wn2jUXI9SS5kFD0ON8rFV7IcnMii31g8Ij898Avy?=
 =?us-ascii?Q?4p0476oaRqE/FMse/dFZ1eZULrns6jaZ5E9Kb0TNojaJJnoBkxbciIB0DUl5?=
 =?us-ascii?Q?Rct3nVg1dGciOQ8VQSEPZMNUBtcmaXhk6peaSvYd7fVrwNrHOr7iDnOYBZ4w?=
 =?us-ascii?Q?F+JV3KNN+1cdTjDTVdlCVMJslP3JZKIAzebYmoytqMdwDVb2CFoUwmjnpeQe?=
 =?us-ascii?Q?CEsXA1XD739VwIXmVuE6u8V54OJAz4aUM5tAcGFpjuvcTjEF7JST8FRDdhW6?=
 =?us-ascii?Q?ta7gqVvi6CqDUO8z4dSTKimEoSu9ypWLePEHwTx1CExOYtteWH60Z6r7ojVF?=
 =?us-ascii?Q?7wMh8O6XJdOrCKwSNBMVT4Pa7QgZYJeZMvL/aFn6NfRL5eQdO6QT2gPu4t+S?=
 =?us-ascii?Q?ZeFkmYtabvf0o6eqcX7hhYPBxS1MEzlIePX2YKtUIaBxaP+AKdcpIZvUI6Ds?=
 =?us-ascii?Q?1gXN/ttm5ABy+3XICt0t1Mp7Amfqvs4xcMZuXwfWDMMbXZvtcPQlhGIfKbvb?=
 =?us-ascii?Q?aOwlfP5nTciNUKfmRqCzgCmLpWc9QWHn2XSB+Cv9WznruA8UdCnqktrpODbu?=
 =?us-ascii?Q?+S6uXI/oJ1hywf2bt+N0WvWOiPzjfzhtiiNIaTwipVVKyGW8ktSbXreZziIP?=
 =?us-ascii?Q?4jArkCEzPaYRbtGCdAj8PL6Gc2t9wXflHSDcIY6pY+W5DeVMnYGQcEFjzvZb?=
 =?us-ascii?Q?Oe/UM8UYqkrp1HPj60+Xd3gvZgxM67e2VR8oW1aHdvw1YOUSP588fc37S92z?=
 =?us-ascii?Q?EJEp+6+u79704EGb9Ox77cbx6voY8RGwxZ7Dca2Js7/LyMK7A26HU6A5djMz?=
 =?us-ascii?Q?kW3F5uxdt+wLilXHp0ge7WzGgwW5+kgJa5xrV+f/nPhCKZtZHXlKDk+JVJpP?=
 =?us-ascii?Q?xZpWTmyRH6pDAkTIlAwtmLSbZiVox3asnLWvQoHnLvOXYwNfhOBJ7wHXTFju?=
 =?us-ascii?Q?Mm5efweVx22rIPXBq5NeQ1bq0tV2nNtxqVljoMw6YbB8TrE+9GB4vmpuoqa4?=
 =?us-ascii?Q?FSWOJ1CbKDFSsg/RCeQY+6D654AuFj437wqNEWsdrADLUD06Hi/YAgaCgCBj?=
 =?us-ascii?Q?PzDRvJ8vPe3mLCX5Q423fvn9lt/Q5NsbMqb1GX035l/Q7ZpscKbon6RU7SzB?=
 =?us-ascii?Q?fj7sdjA+mTMPOyP3StAPXkNcVDl//0PeDT/gp7yPF3Vks3QZHuSgIHz4XVSw?=
 =?us-ascii?Q?SqTUlhpd9QfIeA4Xmw5du2l3Ttkrwto5E+w82o6JBzEb+oYrNp1ppJDerVUj?=
 =?us-ascii?Q?0OIEp4OdTmh2vH/nNarf/1nSsQRuYIPO3sm8bjuP8MbqzeMLy/RshoLvpv2a?=
 =?us-ascii?Q?kq20SkSiuR35ikMKGDreRLgAI1h6jbjLMae7zF79AzsLxEKDlsPpUJVODhdr?=
 =?us-ascii?Q?8Plrd9GuVMiYAXJZLirmVCbWtJ+nFfa24RBIyJ/Kh3I9JSba2WHZyKOjUYhl?=
 =?us-ascii?Q?pxQxB1BdJYhbZCzr2W2lW5xKstZvQN1B7JqCyLI4KxVItRNr/5Bw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7b5fdb-061f-4871-60da-08deab4dd631
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:52.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8MYoRPhxGpziMFh013DOVhHOs4pVZ9VmBvx4tWB5Ss03WZAl9pX4fJsXO5KVuM3HgH9+uZBfE6CgotKWLOxxaCTby+01RIG/90uF+SW9XjBCCfUFhqu3V2Hp3/GZx+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_021447_998906_F1BF1A57 
X-CRM114-Status: UNSURE (   7.58  )
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
