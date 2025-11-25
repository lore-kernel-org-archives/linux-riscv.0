Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F7CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwaObQmisHS6B79nUH07foKPPiMKtZNh9MNmZ201sm8=; b=PXTPQt8K/bkgmt
	a2Vq/dVLZ0dILNzYEWPlidKy+3n2tfS9JVU18FZO29dy23RS+8cvEXUQJnhcXjD7fn2i/od4WHIFQ
	xCVX6JEL0EwHdE9OT8PcHaj6LvifAFHwmmc1Mnkg8/fksTCApK/SbuTBBaC+VjkAA2c3nYgnBKb5V
	ieqQb66Exrp2JJwVzvTM6U0sCYW4Q6LWpBlvCutdc8K6QGikyUTA1pspzA4fFlD3mIRHgDqnlklMi
	aCiloc6le8awekc3+XqNyiO/NsS+dKAh5wD0G98bBQh0oO5I0slD2Gj3mY8yzle1g1BalCmZNBWXA
	V4ZKGh6ly0TrlLsuItoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnuV-0000000Cvri-3RBA;
	Tue, 25 Nov 2025 07:56:27 +0000
Received: from mail-bjschn02on20725.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::725] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnuT-0000000Cvq6-3vll
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 07:56:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE7Ocs9vRbKVcZ+cRL75BD/wAqE/gLgV2lwU4p0LXPSUncuShnvzsZfZJlkimca+bOdV1NXgsUEOB+Lc43fHFdSI5EhnS9o/R/Q4rDeiPVurHeWjMZfODRpm8yzCy84XYU4FnywC0hUh/MdRQDZfS82uJZdeDQY8NZYW6kpjIAYkI28Cd/3XseLUFIbTe3nXenggHwA3OAqzbI6B6hO2j2HwQZxmDY5xZfqXb5utosqf/y8MDFLHwTEHTvQBdsB96FIP1ldXru6PgIAt9mLwiBevMsJu0kaXL+hmegYo8K8F/AfCeiH2Wq4CE4lzwrFGMr4WjcBpTxryRy/TNMZQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPtYrnO4YFzX5NMtrDCvthwhZQ7NbYUoU47wI280HeE=;
 b=Bo6Hfp+NF2Ld8tKPbu2z2EnTfjI11Y0d+obaHtOo+4/7/BWvc31mzK6FF+wis0D5oSVtQVmnmMffBPRS1lc01c3Rn6nYkpElUTRzLZg8+bXnqfo47ZcUeXB2TVjy/7psPVxZCoZirkWzkzLElDqdo5JQk8b200AzAlV2pB1tQgRIH7hJelKi1tN2MwOVnmmMfiQJWZddIs8LyuVN6P1GclO34bT0TM5l/K4BPBvAbW1j630nLifGlY53cHkv2V0HJnPaVK1kQ9oqOy4r0UU8zi3F2JVADzDUbZ5FZ+t/XYPjrn3FE1t75xKyC/akEXMlEyMg61wU1WWfiV3kypvf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1241.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 25 Nov
 2025 07:56:15 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.024; Tue, 25 Nov 2025
 07:56:15 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite board
Date: Tue, 25 Nov 2025 15:56:00 +0800
Message-ID: <20251125075604.69370-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251125075604.69370-1-hal.feng@starfivetech.com>
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::30) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1241:EE_
X-MS-Office365-Filtering-Correlation-Id: 048e498a-1e5c-443c-cb28-08de2bf81bf1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|41320700013|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: YnRFrFGSSo9QPSQjeRWL6NhLFfR5YpUz9oTSfHiM2xdADmZIJKwBDKz4FkPRYb/9jnwTzulvUzFmI+v0yRwcN5IgsnZFuQL+6YMQyJfqA+izd8B4aV6J7ESdS3bPUhyEtYbj03vFcrePxTlj3BJN1SE9HHEIW4ADLD/Jlfi3ZU1g5opUaPPDUoH4/rWYsH1fD5G5yw513l8VZL6XIrqNMUR8Y9ySybBSmbfWLhOOE7vvfd7gXIph0AAcwy6BVBVRayo5I2tcQasjkz6px3BMfTn5UVY/WEyQEHVVU6yTGR1/Ps4kpVgzOqnSrPEX6wvdKMJ4FoQllYdj4G1OLIMoGddDkEusmVeyNdoHBj+R87WQSEZ2nxijJWISGumCcmHN88d/xEEHAugTvVxSV++Q0Q9i8L5Uskns8DOTQflR2D0OLTy4NqEOjS2UT2hHKT24j95ooto892Nd9R4bLoINyikkjxmtWVdKl0hoL2hong800Uh3LX70ea9GpaDlnYQttH4sXPnoUKrcPDg5+AXCf+OlJamwtlTsYRQLtXcJ0cD5rzS8kYvOcYr6ttAM9O/0D8M+AsmwF4rz78QFGLQyzce5Sl4vifgmmfETv26cwK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(41320700013)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WWagSQUDzlYKoGHIgH9U985YzCNIrT2U1JFpSqtpp00VSegpMa9J2xIcIIgO?=
 =?us-ascii?Q?TB09vyLgX3Oa59CR7ZAysJVuxt9C8J6hef1/J/cnI8/CJzod1Oh9e28tvMRl?=
 =?us-ascii?Q?6Xa5X9ZT2dvAoInCHLs8f+H/Mp1vxI/DohQqtOLIgitUkyWaL2SzujnLQJjX?=
 =?us-ascii?Q?AT1BETo+SM29FFZmn7hd40RwF/hA6BpBG2sNArd0TcgVTyYk1Rn6/f2VgvpK?=
 =?us-ascii?Q?eoQn45aeK63YhwR8v/qZUY5Q0h8CR5x5SOsgJ/HoMj3Vif9nh1w2uDR0pq/M?=
 =?us-ascii?Q?Tu5iIhx+Q9kfgZDBFso9WGqPy5uyayWcMjH2BltNtZh4RsvbnD+fRTmRHujj?=
 =?us-ascii?Q?n4nyXNJlNs75psM28SZMlkbfQaZMJJypJHj+3KGIQ/Uxkb70oaqRSQMOMr25?=
 =?us-ascii?Q?sTHUoZe8iRskN5ok7Z12LslQzAoYiVXVCrSQqEbFwHX7c15gsKpcLzwy1ijn?=
 =?us-ascii?Q?DZgoXRKo6wmY0rh/h25MAy/TMIxaPZ1oEaqjKx2VwoJoyiwgaaAvwidOygOD?=
 =?us-ascii?Q?HHx4Lcjz8lqeYAvQZ1uecujtmsv9NQm4w/k/6kqzWq8GIUvfFtmW2+v6WeXM?=
 =?us-ascii?Q?rbWSBw5u0Y87HbqOIvAzp1w/JRhEsSrkvn39mtKSrlCDUMn9hw/24cVhAJsh?=
 =?us-ascii?Q?6yocvqNy+1VwKkriTcqJDwfyy0HliEzfSDdGuLyM8Xs8/kRrj6omcGHxh2jN?=
 =?us-ascii?Q?H2GynF2W4vPu9my8W7rZt9lLGr13TujPc6FNB8Dwsfay2pMtwUsG5LH0a59I?=
 =?us-ascii?Q?6X3aDdC/WcY+IBwmi0nAeQcGkyORH6jGzDil/hJY6B240MqLmCLujSlWWIje?=
 =?us-ascii?Q?vBtw8jk4BJs/6RSaBf/Nvv7DOrWM/k3pmN9nXtTJKK98gmIrZk7sCtxKvu6B?=
 =?us-ascii?Q?iPkK8wcOvUZnGL/pVVjIcQ3InV35kDqJWMmTPTjY035DclgtDlSJ/wcBWyYp?=
 =?us-ascii?Q?VPtnQ0gzw0NKIWT2mHiaKkkhjdFvGkja96vfb5TgETnwzjVOgFMq313FNgta?=
 =?us-ascii?Q?LBa9Isp4wqXp60ZEuAn2NaTYi5a56vXmuWRfdrP6YSskLB1TpVEXUyUepEZu?=
 =?us-ascii?Q?foqRyrq32vf9CgWImte1roSfo7UgSxh9+RIybfRUTzAQlxvlgRIsOprOM+NJ?=
 =?us-ascii?Q?ZaAwjnFtcVCg4TWc5kb8wClLQ6B0B/UiXvDz/zROEvuWgUGhZxiIkJMdl5di?=
 =?us-ascii?Q?LTmHPsZEHndN2WvAG7xZrAwijY5auQUNOVOdMzwnKB2spRtaHoP25vwLZBJb?=
 =?us-ascii?Q?Y/8fGOgYcCJ+AzcAEndo1m4OAZmUoJpLoa8nM9Yuw7vxX3LTrngzgviGPMqB?=
 =?us-ascii?Q?OemL7ZJcHx5dHdTdB1005HJB89f2NeXantJawRqAkjuICaua4cfUnwGMgcvB?=
 =?us-ascii?Q?8kadqEnObpLChkqvQgtlbxff2UAzmOe2c+D5Sy13qa/Qk7h65z9EpyOAF5s8?=
 =?us-ascii?Q?6jdULjJ9U4hIXsW1DjOq7kioTaE9foY2GzERImhqzJ2b+SwOMHtkDhW/2WEa?=
 =?us-ascii?Q?b6ghXONoOHe9SZrmqMT9XRanle+HZ+V8DuPZsyNgskMaTWTuSvO89U6vqTkT?=
 =?us-ascii?Q?K1ENuX0xR7BShoFSzahk5rynVkVuAb7y1Iqnr77TTI6wZFh5+OHmSMJ2j8r+?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048e498a-1e5c-443c-cb28-08de2bf81bf1
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:56:15.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qmD/IokVbggIZQTTejdCO8N8a4ifg2c9JJzTfWLrgOPHbACz+aZUlR5dur+ldvduZEG+rdPntMEJUZRlxHlrBmPcmjs1jDTpNBh9u2Rntg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_235625_982801_B117BE0E 
X-CRM114-Status: UNSURE (   8.50  )
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

Add device tree bindings for the StarFive JH7110S SoC
and the VisionFive 2 Lite board equipped with it.

JH7110S SoC is an industrial SoC which can run at -40~85 degrees centigrade
and up to 1.25GHz. Its CPU cores and peripherals are the same as
those of the JH7110 SoC.

VisionFive 2 Lite boards have MicroSD card version (default) and eMMC
version, which are called "VisionFive 2 Lite" and "VisionFive 2 Lite eMMC"
respectively.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 04510341a71e..797d9956b949 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -35,6 +35,12 @@ properties:
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
 
+      - items:
+          - enum:
+              - starfive,visionfive-2-lite
+              - starfive,visionfive-2-lite-emmc
+          - const: starfive,jh7110s
+
 additionalProperties: true
 
 ...
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
