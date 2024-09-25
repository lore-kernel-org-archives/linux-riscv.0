Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5172C369D0
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jb/Mpp3IZuf9RUC/G1WGP0N5ZBjo4Cie/FOmlKYqwbY=; b=A0cjjvDi5qLa+i
	9JNG7H2QTuEXfU7IyF02ImFGISygTgBtuGJK+I5m1wKSxtgMNmvJd5idN9wRXiF5TRoNujpIZrV5s
	HEhrvN55b25o9zAl0iT06yeKpnUQCueKKwny3wraIqX4aeBSOatNlNGyuO89lXzXZ87HV+vs+IXVx
	D1W70RtmRlCiFOlPopelihjUtaEXJEPaHyeLoq51WQkwivORgZXBteNr2/Qd7L9av2M3+B1vO6Jtp
	EVV7FnYJdRLxkKLkpcWBuov3+zRBQZDLoEm3BcNzXQsiswvabwmW5ymLTEa6PLKcXk63uC3CNnQkp
	qS/+o6ln3aW2OnaUpJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQ9Z-00000004s8l-3KY3;
	Wed, 25 Sep 2024 11:25:53 +0000
Received: from mail-sh0chn02on20709.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::709] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQ9V-00000004s6d-1fRw
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 11:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoEHAaCwMdw6b3+n1ACy2R2O5uz9M88/PyaZO+xzl0WSLQQwWR57B5GFevRnoS3C2vvubM0RaCOZg4AYjJOAb+dQOckjidJb/JJatJo2guMpPk6PScenooIK21LAfRZ5ThksGNzWh4KY8z4Ak3Lwd38uo7WqmI9Jp66UnJVncV86iGd/X4Kz6CRYbBzN6HK/doidn9X/BeWeH+Hi4uoQuioGZbFlF56atZaRgI8gHeq/c78WEeRLIntV9ngfVjd/A21rKSBDkDuGq7iokiZUYtKsl9lQZ9bJqIROXtEBlAI+DM67JgaSYOrLB2p1Pykt120RDOWUisFvzqKMOuOnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Ggpk+s6wFbqIzpTFxqhgIaOAPbPUq3GwvcGUvb+2A=;
 b=oC7BdLAuBQc+5I0ZRuyUYtNrM9o6nhOa8eYbrHq+s8lN8mZT291Lax+pam59DLLi2hIHUzxOiHyY/n2fmXVJ/58GhZsxqTDBhN1Mi174yoed9wysEpzTZqleT6696hL3JDJ3JBp0Abl81O6v2MIyFXxydLS3qe1TuL5eTid+WhcL0o6Y0ePjDJcHsWcSutH/29WfWPatouCygWZsaOw+mr7dMgVXbFE0hx9E6y/xzojHwMDnsXChxUHFP31Cs5wCGiCChFXdk3DbOGu2zdExTzV3GJbQ9RiILf32Pafl8WW2R8CzCSwpv8ViXFzDpJKLpYLVrhNkB+K8vzu6X8QKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1320.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.31; Wed, 25 Sep
 2024 11:25:25 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.7962.029; Wed, 25 Sep 2024 11:25:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3] reset: starfive: jh71x0: Fix accessing the empty member on JH7110 SoC
Date: Wed, 25 Sep 2024 04:24:42 -0700
Message-Id: <20240925112442.1732416-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BJSPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::35) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1320:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c96e45-2a34-48ae-c5ca-08dcdd54c00f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|41320700013|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: jBKv5npDjw43DRvKbLNiQyUAT5tFsByHYsiy5RWrovNyZK9J29Ua8LLuFRRNurC3PfazpIEUYra2i6tL6+bDwyQ6nCz5O51lDJzpioZdAhjXDmci4rxjHUf/wmHyEtNjrGOmezf1iyfjOKBtOBtZJQ5bW5fEpFqINy+Z7c6leiIXxtM9xGbTtfpHnJkExS+9rl3Dr5GFF4eMqrSfSFI4bf7Td1CA+DHIdQCRyubO6RBkM1wCtKq+Cfd1x2Hd0o60fPg6bGGNG7M6AuUpbm24UTuybbQlXZT4mZFUBXrqETqCflEkj3meGITvq9daFgncP4Gcq/NqX84oZ1Q5Xz2O0usB9X/sB7pWgSs5krNOdT1oMst+9EpAkZDy4G118enc1tC8SCqsHPniDkUhM5lAFMVd25tumkcn5zaG8rlaIvxBNuAgWYS25iAuSaL5yL5umVQnO9qZJ7WRoTC/qJ/FsDD8XkEhrBkKkSMnAKkcmCGJmi+4o1cG6M/gdK+eIBNYdnWVBievIq1z/c3pgNukb2UpZkvEi16lIMtvAadQ5j1XKo/SY8wVm771SHXHcUUcwS1mV6GzH4nX3Irm08erl0I+5pFRy+qkP1+nXkDAFzBMS/Zc2sK1HJzigJUsOexv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1h0FByey1fYWzpkNoOYqhhhn4t3gu8eB+hnV8znghlSEPZH71XXQESDNPkZq?=
 =?us-ascii?Q?a6K3Gag8Tvj0+9wQXF8Uv5xmzu1Ww+fM/bu8TaVmngB5MVmYFRGZFr2omjZf?=
 =?us-ascii?Q?XNaE2xRhj/fqxH/FraNLHunatHhTk7QtS/bzpZkt+LSXWHOBroTQ+oZlyJVb?=
 =?us-ascii?Q?jmwh7gyT1eQ2SPdekNoBMYsHOcn4Q+OaQQzTWd120zMDcbX6Mnx0KjAuhSYN?=
 =?us-ascii?Q?9IxUz1mQft7GK38gnNfks45OCDwFJviFBQJz6kQ2MCwV7EwrbbIN2ODssGZ1?=
 =?us-ascii?Q?XiUS6dhBHsI9qm5Q94fwKwwKWA2lTDL3HoPE1vM9fMKDO9f4Q/KaELAikCIt?=
 =?us-ascii?Q?qiLKCKqd10VRv+CO2pWtkpuqjyHBKgaxr8XfdzoxyMtSVXz0poCeRICByNIy?=
 =?us-ascii?Q?elIfcqmTli9LLoflSNaW8NQ1zKH7xVsl7HImU6kjlq1vjdhEKxn0HNLOP4eK?=
 =?us-ascii?Q?fX/AA9aLm4KoGDeioSnpWyhYDZUTjMezT22dKUTaZxF8qB5kNF3G809zH32e?=
 =?us-ascii?Q?nqgAzYalBoTG3kEzOjyNSqm/KCzEo/HuU9XS4Bj2tU6uqGqdt4VnDDXy79me?=
 =?us-ascii?Q?v8RT1IWZ8hqG1JaSnRmxp8JPjVOCQYQLazvCV+DOVHfY666+sVfbbBeHaf2B?=
 =?us-ascii?Q?iJxDj/JjwY8QZyFXgyQsknX865LO/FPWkaBi5QpiaAqJQDq58uDz0SQ6YGFZ?=
 =?us-ascii?Q?hTx37eqPzM0Rn2cPMSyysL42O3WKJHoFHJNmYDBJDX+VE660+SyNLahgOJWs?=
 =?us-ascii?Q?MAFIGOwh8BWXGrM1hyVqdW8pCEHb1rJv7I2xRZvYEPwHQkZfnUjvfjzRc+NA?=
 =?us-ascii?Q?M5WGlyhjX9oGicgnEF0CNKuZhMz4cXBpsBJe/6l8saI1J9lA5EPjTR30nd0K?=
 =?us-ascii?Q?1tsiYgdar4uMt0C3I3wHniBqEJ+U1TuFOnpFahDhLscjNvUF1J9LxgqK/kKu?=
 =?us-ascii?Q?bGn/XHj9l/JzqZzP5Kn3lSKk8l/+cKaPIudO4G++FwTKMy1nBzKHz6xugaXZ?=
 =?us-ascii?Q?1L1dSVtvtl0WHHEMKqLl82WziQFoSqbWr4EF8Ee/39fQFBvMr7fP74hZkDHR?=
 =?us-ascii?Q?RgKTVkjaFU58Xn+MR0fa8ln9vE8qhjekYvhGUBF3Pb294fVs+4Q0dnKMKEsL?=
 =?us-ascii?Q?bk/b/lE6AEwtw1y+BTn6eVNW3M2xV0+ozm3HQFkDyZqR3emlJYXf7a+bEMrh?=
 =?us-ascii?Q?f+q98CTL6Vtgze7rE4VubsNe3cSzUpauwKVUowj0+5uTSfOydj88PJukgLLL?=
 =?us-ascii?Q?yM716BGVPO0ip6jGR/chrvc3t14t+WfwhlDdKttonFbwRSno24jTytD7Z3S8?=
 =?us-ascii?Q?jSrjksEVjwGmRU3gyYxxbvnxjIfslOPFeLFyIO+uaNu2RlzbBe0IdWCStt5q?=
 =?us-ascii?Q?qIIuDep+o/u/LRou8Ynp7f/tIDd9dw2IbOsBMqKXFtGl6J565ipC6e48xxGx?=
 =?us-ascii?Q?f0WRF139tEdy/K+NqTQRN1NJbJB8TZu/ao4I8efbUpsuxWXPojttWD9g4yWZ?=
 =?us-ascii?Q?yG0RAkGwy51Vurx4wIfNVMYiLDGkZdwn4fpNE7U+0XxwNo0uW8FNpOuS924C?=
 =?us-ascii?Q?/b+Tt0exQc3Ok1y6Pl52BjeG26YPPNB/bNgSUsICvS6SJc8JK7D8tNeC8aRj?=
 =?us-ascii?Q?/R9jdvyWqEwuSRFBYhGnpzw=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c96e45-2a34-48ae-c5ca-08dcdd54c00f
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 11:25:24.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ry2t68FKJTDrRk56DK2YczDeXG2UMrqT3Qm9htpoeWvwzW+osJ8siSHQreiyPOheirXdMKZSPNb+8SBC3XzDh41A2Q/VCOsYouHJSJzOXakKbCXe7X+60JpTEiewAG5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_042549_464959_EA36BC3F 
X-CRM114-Status: UNSURE (   7.71  )
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

data->asserted will be NULL on JH7110 SoC since commit 82327b127d41
("reset: starfive: Add StarFive JH7110 reset driver") was added. Add
the judgment condition to avoid errors when calling reset_control_status
on JH7110 SoC.

Fixes: 82327b127d41 ("reset: starfive: Add StarFive JH7110 reset driver")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---

Add Fixes.

 drivers/reset/starfive/reset-starfive-jh71x0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index 55bbbd2de52c..29ce3486752f 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -94,6 +94,9 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 	void __iomem *reg_status = data->status + offset * sizeof(u32);
 	u32 value = readl(reg_status);

+	if (!data->asserted)
+		return !(value & mask);
+
 	return !((value ^ data->asserted[offset]) & mask);
 }

--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
