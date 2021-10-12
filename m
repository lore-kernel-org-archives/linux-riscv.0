Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF60C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D9161040
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6D9161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjEPFEQf8HmaqsNbNVKeXl0UlXUR9O02zWcz27+AxY8=; b=sPeQcPO69gdjpT
	5WEvriPzPU2UGp0PM+zRqCPmodph34evwgFir7G9+Fbl0a+oAdIY55UiOOqjcm26VNKMa2cjERKXJ
	QEfgCOuuEJeECwsiOwtCacOPYgBfR5JFFDSYAzSSm1sdEpFTrFKYkDRmZWkWnD3LJPqAsbdmTzXWm
	QkygeW+WhszTFIAiqXGAi2LOVLK0dlK7KSJWDGB0x045CzzVLk17lE1PTtwQD6MtyNNMRlaJaLq4I
	Modj43TiWf0YTjeFblSrYQ+2a6xgmf4KfeeNUeRZhCtcXLfW2i5FG8zPjUA3lPJWTWvfPF21UhsKq
	9GPcC1XA9iBUKB43qgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maEZp-00CKBM-Q9; Tue, 12 Oct 2021 10:00:05 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maEZK-00CK3A-Hc; Tue, 12 Oct 2021 09:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634032774; x=1665568774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QL5SiUTHGDyBIobnT+wZj/8BRPI6TtxelDdyMy14q+c=;
 b=DM1AC6sphoTpkvwedafOOq+a1rRTsdLL6KNWXGjB+p6WiQnderUq0TlX
 rqe4l0voI5HAT1c2bz6yuSG7X2QhDsiFR2vARzwgg8oAHznvs5feONOtc
 UJwfL6yFTgkdkZHmR9dcP7WhshoPInd5U2iQ+G4XwnhNvanDTy2lVVRHG
 nw8AbkhGvlTq7UbG4uPV4CXDCm13CfxBT38rkmghPHr1kOcJQe7bgNXCQ
 wS0mJ0q0lEi9xPkgP0M7s6/mNBMPt098S3/4+Hg2dajC0p3CAHJPzCkig
 mOH3SNsTZqdSR2hNcTnrh1sgMCwxMOjKRdy/HJNhSRaIe95mllcFuWTB+ Q==;
X-IronPort-AV: E=Sophos;i="5.85,367,1624291200"; d="scan'208";a="182592127"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2021 17:59:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AauZ2+xprgfuAEkzXz3USaqVXuDgHpGaXebCcE8HiZTuVf7CyltcUhObVHiD5zQVST91bimEamhc9ummW1UJWh9M00YAE2I8h/95rGoTcfzzFdoaDieVAvD1Y831+Gp4CQ+jGgaAaQYQM0ExUJmesI8o0Y0Ye1yZ+ntZ0tVr6hKpVO+liQeA8XflfVWFPHB1p72VdF0TEvrHt+ha+fOlFHG24D2uf9xXDd2joGASSyipzxkEd89Wo/K69fWSg0rifbPTWlVwRpKlYzUDTKv9JAbdXQz3Bw+SXzSO2BfFZvLIue09qNFu8o9nGfGpL2LiSYccbc8/8h+77djkSZGccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ2YWN5WvnLO+KMdKCUMk6jyEKqzixV0Skrs6UOwavk=;
 b=WVouIupyEJFHx2VgnLF5nwFdFuVaV7s7GhLqLK+QYepCrLcthoh7feEYtHPbv4AvEfhWoY4tvpSB792AkRpYljJXzcaI8bTI8nO4wU3svnOUgxYl5VIy1umq61mNtSmQkCo5zGqVzQ1H3QsrBGHptVsJ2pOne4dEo34K/CWjw0OL+F9jHcsZhzYOSwar1LZ5JVEWD5h/AuyiOgYCgsBpuRX5713XM3Rom0LjL8uLWb0VqZ1mbS+Mf/MZRozlAWSf+/PM70+pS4quYjecXIujnDKU37fuGEg4Vmwribr35a4mYMGBeMv5QU7GXBfU0dr4yb4iY2T5v+VhYnxe5t2ZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ2YWN5WvnLO+KMdKCUMk6jyEKqzixV0Skrs6UOwavk=;
 b=eBaBMK2qplQ7NW9u9LttFGn/NWclfHhRsB1JZSiXfKjj3W/8x32kxc4Gw67/pt/U7yNGGIdYVzVSIBY5LtuZzIIe1wruef+j1BOeeri+Q7MF/vBE8VIj7FyjfeqliUeJwuEa30V00h7FU/QAzVVUfGq5bZi+pmpkfMHLOyjlaxk=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8348.namprd04.prod.outlook.com (2603:10b6:303:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 09:59:31 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:59:31 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v9 1/8] RISC-V: Enable CPU_IDLE drivers
Date: Tue, 12 Oct 2021 15:28:50 +0530
Message-Id: <20211012095857.1314214-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012095857.1314214-1-anup.patel@wdc.com>
References: <20211012095857.1314214-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.114.63) by
 MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.24 via Frontend Transport; Tue, 12 Oct 2021 09:59:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d57e06cd-85fb-465f-040b-08d98d66fc7b
X-MS-TrafficTypeDiagnostic: CO6PR04MB8348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB834824328C36FEDDBDD61DBB8DB69@CO6PR04MB8348.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXo8ah1zGDB5agRi3iofL0Vg2eyJnLGbS3BtguGjzuVQ+CuH7UH8kMW4NSNjHo/LV4XuBx39+XDP5G+59whtf5dPTIy7xaoy6RJ8ufyEDgZBXRT720ssvP2rnGXYjhHFd89UjnXXsJ38Yw1/OMEeIab/A3nXmhXSR7trMmVXYR+uaYRo/gsQj+Hu4nWy8J2TlfAeU/wHWglTF/6i+ooT8RoLKnhd6f6XiEGLlJPBJ2YRqoqX0l1G+VDFGrQhB0dOdgP9q/GGCuJIig6/FrEfHWYYJYAJtcK7hg089mxzj76U6R2EeJnON+VbK+rdmJH0NvXEFBJGpime7M0BEDKhasRpbYu7r6Cq8l9p4m3rKUFCYzlf3/IBshRS3qrTmOoAwrQXecIgAcOJc2JD/WgnQ4THGMusqQg6lZkvSIPLCik2eQEKKCghxrSGCQVWoNlZonyWuaFLUvFNZ6+H1d/afnTr6reQgoJouJKTeiEImCJjk1vGaA8+L09MXL3hXVTRocFBZYJXyn5QchtftJqpMw+LSTHpcaGXRB9SwadM8V/n8QMbfnyUgvVDUokKcVx3ijc4bIlVBT7hRU/8tKaeUZzzsGZTbUlaoPsnCU4SILRInJxiw60XRGTi+d9xxkud41MLP8Fy7GeMzJu0+vHDBc7hy1cpa+QcUbDjy9ajXGP8ZFtGodARIyIUy+/1ltoDrasvFv7STy0u4Ctnn8RRRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6666004)(1076003)(8676002)(316002)(110136005)(44832011)(7416002)(508600001)(8886007)(54906003)(4326008)(2906002)(956004)(2616005)(38100700002)(55016002)(26005)(7696005)(83380400001)(36756003)(52116002)(186003)(38350700002)(66946007)(86362001)(66556008)(66476007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mo+nFOadJiQDZzyDiwQHWa+FsTdh/kStCpuvyxHaQiHE03ZenDQBXIPyl7+r?=
 =?us-ascii?Q?JPVzkzPdOBMEsopLVt5w2VJ3RYDAVpD5GDbq1wpy4C73WLpEXycXNCcmiKbB?=
 =?us-ascii?Q?4QLT327qI0zpygFfa4vOQMAyQLdSGtVnyVB2Gf0LNAZJl+DnqSva7kQlIeKB?=
 =?us-ascii?Q?4NeAiseuSpRbFbAhb8hvWH1OKh8sB+7X+XOmwoU4P0gbzt4/xjahd6c3Xa09?=
 =?us-ascii?Q?0ZQBMVXniOYZo94JNZv0Z3RqRqkbr2oJHAbHprqkHve/HZpxX/H63g37hlUq?=
 =?us-ascii?Q?ygizsXd3JhjUigev/Oh5/cGBLxvlRsht4GwJASsnCHBKOV6Kgv6qN0EqZ4FX?=
 =?us-ascii?Q?lPlmKafSB17qkaGOLfUMTCgNr/dO77uk46K1fUP2hYlzDO5v9Dval9XRoJZd?=
 =?us-ascii?Q?6n8ikq1+yhM2IeWwuvUhQp5ep95Kv4JyC0PFEiJEnWo0C0fqb28N34+tUXik?=
 =?us-ascii?Q?wRiVAietJi/1H2A03kQxl2RVqi3Rl5PAZeIC/JCyI3O9reYSwph81BLqpJSx?=
 =?us-ascii?Q?GG6lU+fauCh0PWj3LzZ3SPOUoGZf1Gg/NuKEsy8TH86wG1qNUxNG/q7169ED?=
 =?us-ascii?Q?nfmnyqr8kTRjUFIGLT6NaxPYnFbnS5gINzRQJ2oIrwVdTC2HwwJ60Lb6KQ+K?=
 =?us-ascii?Q?IyvOeTsXDsK+5KyqrYKMyxILXdgD0pPflz3I4RFWoi5SueI0gkWyczlEoPm1?=
 =?us-ascii?Q?LIbzs4e4EvhO7FcouDhBD8R6YCwSV5OrfRESTVUinxHcQ9RMx8vzCzw0luqX?=
 =?us-ascii?Q?fLZodGSJPXvEUu9BxGa16g/TzO8ODlUk6RJHd9f2+fTxevG2vjBq36Qln75Z?=
 =?us-ascii?Q?Yk3abhhoDQDSK56hpOWI33pO1vGNCvKudNmIxvKAsmV0P45J7hO6saL/oFx/?=
 =?us-ascii?Q?rqCuI//mdD47jjAwsPkPEw7IPpwOtDDNUi4a4Xzgnq/1EJvO2cQqk+x0wKsI?=
 =?us-ascii?Q?Sj25ubITWEU3YkFu9G0aCrpVXVcpJHBOfhLI/ihm4iget0vUDGvikNt050aR?=
 =?us-ascii?Q?vNOIIxa5rRD0QwnKjO+Zr6kcPCmhuETzMAdg3fbDDuMp0F3Jy+jgNxXbx+F0?=
 =?us-ascii?Q?ZMKnKjJJZHnJ72KPzjL4SxidipRZSgpSceIIjBBCv++SAl35LLvr/o77BHN2?=
 =?us-ascii?Q?NMYPjWSMyngbi1cYNhG8SPhnI/6TtJMBrHXCoohKWHYhL6V6J49C5ZekFEgU?=
 =?us-ascii?Q?N/5oLYJBlSOLdkJUfTvNytHxzFOe8fTRYvifammwIRGdU2JNXXCVXegolWfz?=
 =?us-ascii?Q?5ssIoQ5hr3bWnM/co1JngmWD3WJ0dbOwshBzWq5z6AOcsj/BU5tYixayjs+Y?=
 =?us-ascii?Q?1HyhOcsRTaVnx8ZEyIKYn3YY?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57e06cd-85fb-465f-040b-08d98d66fc7b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:59:31.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWA9KvNNuyRW/RpdH6spBEgkBJHelNuhvx/+c0KqVmLQ2en8XDAwyJmbN+5vbRFLN64UiEyWgHZOsU3zZ8+hOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_025934_643976_84E2941B 
X-CRM114-Status: GOOD (  18.93  )
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

We force select CPU_PM and provide asm/cpuidle.h so that we can
use CPU IDLE drivers for Linux RISC-V kernel.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig                |  7 +++++++
 arch/riscv/configs/defconfig      | 14 ++++++--------
 arch/riscv/configs/rv32_defconfig |  7 +++----
 arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/process.c       |  3 ++-
 5 files changed, 42 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpuidle.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3105e1beb980..7256ee3e8629 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
+	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
@@ -562,3 +563,9 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 endmenu
+
+menu "CPU Power Management"
+
+source "drivers/cpuidle/Kconfig"
+
+endmenu
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4ebc80315f01..9851ba671e90 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
@@ -13,12 +14,13 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_BPF_SYSCALL=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
-CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -68,14 +70,12 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+# CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
-# CONFIG_PTP_1588_CLOCK is not set
-CONFIG_POWER_RESET=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
@@ -85,10 +85,10 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
-CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
@@ -139,5 +139,3 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-# CONFIG_SYSFS_SYSCALL is not set
-CONFIG_EFI=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 434ef5b64599..725ca3332900 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
@@ -13,12 +14,13 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_BPF_SYSCALL=y
+# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -67,11 +69,9 @@ CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
 # CONFIG_PTP_1588_CLOCK is not set
-CONFIG_POWER_RESET=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
@@ -130,4 +130,3 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-# CONFIG_SYSFS_SYSCALL is not set
diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
new file mode 100644
index 000000000000..71fdc607d4bc
--- /dev/null
+++ b/arch/riscv/include/asm/cpuidle.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Allwinner Ltd
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef _ASM_RISCV_CPUIDLE_H
+#define _ASM_RISCV_CPUIDLE_H
+
+#include <asm/barrier.h>
+#include <asm/processor.h>
+
+static inline void cpu_do_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WFI.
+	 */
+	mb();
+	wait_for_interrupt();
+}
+
+#endif
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..504b496787aa 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -23,6 +23,7 @@
 #include <asm/string.h>
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
+#include <asm/cpuidle.h>
 
 register unsigned long gp_in_global __asm__("gp");
 
@@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
 
 void arch_cpu_idle(void)
 {
-	wait_for_interrupt();
+	cpu_do_idle();
 	raw_local_irq_enable();
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
