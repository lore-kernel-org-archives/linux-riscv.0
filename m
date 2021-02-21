Return-Path: <SRS0=ZPlh=HX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EFDC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 09:40:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B1A64E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 09:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B1A64E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cQIaLTNkr0T2A3oNNBVHoF8AB2BIeoNG/eC9Nti0Z7E=; b=cMUUJdx+vy8g8DDYbGclH84Zz
	JlixEmXh/1EEzB55+e4JcoCLkruQ9cB2T/PO74Hg9PvJCwVSsx1WWKEchDT/XYkelqXaUsWIZ3fpu
	Ai1HzCj2O6lzq9eHnd6sUEcbWIEaJWtIA97Kvhu6NfSSRSW9+3Pzdf1wW7HVNWUEk66S0s90wSgng
	hnVdtjc/75AAXWXGwwpBf8rvJ4BPOwVoKh5HGS/oEBl4mMS7ilpzN/Vw9JM8nThS0Uj8C7/L1lTTg
	A6TKiEO6vwkyZIBfSMp2QxGa5+MqBiw7D63OpRfhwUrzagFPMYpnINRoejQe3bZrS+o/P9noEUa8U
	YQh904DUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDlDp-0005es-5h; Sun, 21 Feb 2021 09:40:13 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDlD0-0005Ei-QD; Sun, 21 Feb 2021 09:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613900363; x=1645436363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jk9fTFbaFXNvhDz7mQpXyNnOO9hKg0QhgQaR5R99Gg8=;
 b=O4m8+Om6GEYNR3TKTPSn73xJXNmxvM5VsJft7Ls6Ae0fpiC27p8qNe7G
 a8tPlKbgZ8RHDeuPs+ScJTVjCzqZezNFSRsZCjqHfhIprTDGoZwFX5Y1/
 JbN6Ktg8FBCHOrv+TuZIxhOtwJ8KHqrshWc3Z03g+k2p6GB8UXvn6It4N
 vWRlYV6+THoZ1pxiSW5X/DFtGm+igG9Io7yLix4ocCvHpAR+OXVAOb+Ze
 8EdqH+2+jEqA0+aMXJzQ8lZlz7qFt6SZLEYQvvM3gc6eBCjbAb7qpp+N5
 vnouC/2kL85fnUH/p4g7meWVj0pu9ugsWIS/rn8N34kaUcSOasCTYFfot g==;
IronPort-SDR: Smfc/kGTriS0r069ahVN7nrOdOplIIm312KXFDUEtxPBFlrDzJdZun/CvP0qyRBMvVaTQue4Vi
 Zrx2CVRIQIOVTHMtSPTPqwBEcM8ByVm1Mkal8+mNRh+Dbh4tysbxB+lL2BwyLl/VAWHgqQUqmF
 wHQrYmrSLM19JKD6QI8oEWAo79kOpWJ2IESGwoc9g1KWrnmigJzIPgK1sdbU6mf96iObFNx+aa
 eRriXif1YgSN3EFWckgGj6ACEU3usr8o0AFJxZGeYXPOZmG9nt0zX/mJfIgpOKNbDHfxQ7B3nb
 RCc=
X-IronPort-AV: E=Sophos;i="5.81,194,1610380800"; d="scan'208";a="161607400"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2021 17:39:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9/n4+l58kwfxBphFlyOwMQpbCvvk9/azSRPpT+mo+O2F6gZveKH5oFLNQT32O4Ye0n9tYMC/SGOOlYBZZUdm5mGyxlvB7IiwFW4ftd3XnGj42fe9teGq/1W1dRzs/1pUOqAGYU+Ve5yCPE74B7TNzKEzlMZPydpXTLkrEGYJKyLE4qt5isNOkYdo51fO2x9ATJf6mzKxLYK+rQrY4LN0CPLOgSA8f42xEO2zAn6q9Rl5K+/IE+mmHUAJhIFHWuk58SqZiaA4f6dcpS2gTQseeAxErbQIFI9uoDYY/vcib2WPukVROokJNlbPcrH+uQhjeMNqocGqctL05dwoeaxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz4Mz4Q7C9L5oZSGm6C/uwSUovMMO3hthLrVA5MLpXE=;
 b=RD5lsxvl8PWY9Qw58ywXCfoGsH1W8ZcGAVZuvZA9o14OV3TEpfALNl+BEePNqSlso2BNoXFoan23ou8A1xG214uXOrMIndsqjqEFVFnbz8v13C1DY4FuJFNDoCUtcSCAxM9os1Vq7TH1Uis3PSDIictF7CWks+lwr4JVz02y40NuqsfPP4E+PHJAiRAAl13ySEbvTrin8rRm7cMasXV9O1B9wvI5FKaJR41gNCC4oN66Y5YkFil9N44F73feJv4thmC5sZ0EuHiV5ydT2X4abPH5un94ebyp3VCjc+n/PfBz3evgECtdyG5rJ+BGlvert/N0msixnu6WdkwRBhhV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz4Mz4Q7C9L5oZSGm6C/uwSUovMMO3hthLrVA5MLpXE=;
 b=O6LTnAl4Af/l5Uv0Fydk30c134pOlNiJG/5LUBzOyezATfr7dox2sR98sObS9VVdm8OLngQOR1merKuY8/hOkggrZ96er0Bg3gccc33C0Jk8xtWZ6EYSk8/TY1Bm1zjORjP8Z5MTWOtL4P6p2tWotYVcx8Gc2sTDc4OqzMh3J+g=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0459.namprd04.prod.outlook.com (2603:10b6:3:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Sun, 21 Feb
 2021 09:39:18 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3868.029; Sun, 21 Feb 2021
 09:39:18 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Sun, 21 Feb 2021 15:07:58 +0530
Message-Id: <20210221093758.210981-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210221093758.210981-1-anup.patel@wdc.com>
References: <20210221093758.210981-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.171.12]
X-ClientProxiedBy: MA1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::19) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.12) by
 MA1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Sun, 21 Feb 2021 09:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a89fd469-a531-4f92-6311-08d8d64c8f34
X-MS-TrafficTypeDiagnostic: DM5PR04MB0459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB0459F3A93FDB9618CBB8E89D8D829@DM5PR04MB0459.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tE9OkLir7zd2rs1U0zbacDO2r1C9EZ18Zu62+8Jw/3SQ/w0rjm86HyPVJDOkfK7nQ6hnYvwZogmGs6wnD/ME20D0EQ7iILrNtxPkvSasLbvCkC+P7pCKH57dkLHP5N+1XAMdWIEZ8b502rmN4+PYABcVt+ah4m45JLVC8SMhCFugnBknhDB8/BX6V/edi3+wpn9nUOdFVCxTuh5TaRu/YLsvE5DWzyEbaMEF5ziwVTJ0EUMDvzf48+g13bDYsf1XsBJPm+L9892YX4D6zOySiLOz86QMvkjlWMKwvD5YhCV2XZYvsv481hcRp8Et/1GtrlNaytCKfOAaUQ65qVnW5yybU+d9MXC960Jkb8r6fd0VsEUXYwDx22BSXqM2kW+AZBKP7F1DtRxQsTyCDq6Gjvi2htLBzvvcFzaGT49FTfJLzAJITdxyppppxVbeEI9ylMceXGfkVFK4rkywZp1HCbiEH06Fsyyz6J7s7ePjzUSfTUsZvcM63Uj0TabFPq2PrvfvLZopEIfaBcJAgEkNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(55016002)(44832011)(66556008)(8676002)(2616005)(6666004)(16526019)(7696005)(5660300002)(54906003)(110136005)(4326008)(66476007)(36756003)(478600001)(1076003)(956004)(8886007)(316002)(2906002)(66946007)(86362001)(52116002)(7416002)(8936002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+p5XIvWMHE1CKtH0bnPvkZDmUVuyer0LPRcyKhqgT16KyPNge31u63NQrxEh?=
 =?us-ascii?Q?WvudbeiASYZC01Jg96+HblgTzpmZvwBnq31JNpzDbEAxbCgdleW1JViWvMqM?=
 =?us-ascii?Q?nFknPx8sUvByAZ0gzBsGjtx7AuTMpGi3TNexcJ8k6l0RSvTNRfbkXqYuFQFo?=
 =?us-ascii?Q?Nl2uzb1MArZzQ3gwofMnICSzVFud7pnI5q0JY0JdOv/NZy1qyPeOCTl3NEwy?=
 =?us-ascii?Q?VbtO6/lFAQyQEAYEyKkE+XrIo34t61nlsrwPcgHpwKN1NndRYZAd1htSNIxX?=
 =?us-ascii?Q?CtvgFXiJZb8WeoCVVqP1b48MhHzVAfW7TZbXv23l1JlsHg4Vz3OEWPEHOWyE?=
 =?us-ascii?Q?XnQjK8whGdKzilhh3PPna+iR7JxsiKsfJxwm6x2i3yPpYwQxhJCstDTATgGw?=
 =?us-ascii?Q?2I2F5Sp5tkvLQJ/H2xq1vSktNKJfZ2Y8V8Lhi4+uUi0FrXeCWS1GnUnGTdv/?=
 =?us-ascii?Q?dn8lq9PYGM8hJMNWMH4dE7lICMcbLITXycTs8bv/KxJU6WbUsKDjP0nUeqCW?=
 =?us-ascii?Q?g+YwkiYI/QPpE5gdSOgtvSiKim3w0XYfwwkdDJOL66R5jtJZE9Z/NUky/QLc?=
 =?us-ascii?Q?d6NGMhCd8FP/11Sv95OfGkn/IHa1uIEue0uZ9iZcvcwX6dXIpAovhkVW8oG7?=
 =?us-ascii?Q?TfkF1FV4ZtD5GmHu9GLNIXKd1ydCpN+KSeeLSCx6qjKgHkBnNZVA/EjHSFuH?=
 =?us-ascii?Q?cEbgytsSw/cLr8SzGvtiuWwPs6B0LR+HcNNHJZKnna5qod+yrFVEdoeS5zjC?=
 =?us-ascii?Q?LCrV9IbdLHWAJS8gRKkTrrkXDCIrMzlBRuBQQ0B5l3wR8LOuMhChv2xEv5/K?=
 =?us-ascii?Q?4obyniT+fzPZ+iKfu4DnjliF7XNfyTbNXCYkFK7y0J1z4Ov4IpRrEN4EfULN?=
 =?us-ascii?Q?eNJDeKvMZCiG7AuOArWx3XoKK38HSiUue9Av5BTKeM9FgDKPwyNFC+fW5cwu?=
 =?us-ascii?Q?fMCu0rU2c+4Uh4jJ5X1e6qW0V1YKjw+CoxMGIEG6A9hM/VvQT9+++0ZZ55pG?=
 =?us-ascii?Q?f4C0VTT/M7DX7DeltE+PvMRURu6fr+/4Zhdj26X75ufSvEKPFoDZbOsuMRBH?=
 =?us-ascii?Q?jHdQ4ANvRx6NYZE+o7sp7p/POwiAn/yVxgSYpM1Gwte3BH0AeI5bNOZAleQ3?=
 =?us-ascii?Q?DmIsL93JXy4Zr3BkVvaJ1sAFw+cFhbP28HRGpLHB22RzAr/QCb39+5CemPR0?=
 =?us-ascii?Q?nTgoCjIi7yaVnzToTs1OnbCj3aIjn2Fkavp0EV+lnkB0ugfKq+P51arAXHFs?=
 =?us-ascii?Q?LEYM10pD+KUpaJVbudqwZ1FhwhOaLbzw8GEqUL5//jv1103s/Cp6Rr+Wywwf?=
 =?us-ascii?Q?Dtaq/uuk8clkSIHUVdr8AlF3?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89fd469-a531-4f92-6311-08d8d64c8f34
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2021 09:39:18.3087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTKccmaHJ8s/xfEJAH2NNkIMXe70m5VaXPNQY1CsfTk0nyIvFpEeAwfuFNZXUoInanIhew8kns59tyerEjsp4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_043923_193650_6580B606 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>,
 linux-riscv@lists.infradead.org, Sandeep Tripathy <milun.tripathy@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
SBI HSM Supend on QEMU.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig.socs           | 3 +++
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 3284d5c291be..5f6f4a520772 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,9 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select PM_GENERIC_DOMAINS if PM
+	select PM_GENERIC_DOMAINS_OF if PM && OF
+	select RISCV_SBI_CPUIDLE if CPU_IDLE
 	help
 	  This enables support for QEMU Virt Machine.
 
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index dc4927c0e44b..aac26c20bbf5 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -19,6 +19,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 332e43a4a2c3..2285c95e34b3 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
