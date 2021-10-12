Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EBFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7BA60724
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED7BA60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6VFDxQAiBmkYcpG1FbQWedxEpFXoeO0D5+Fonzvg0k=; b=zrDM2SNQTBh+HU
	ykrjpzXUaL/UyB/SdBl5X8fbA9eJpz7eTAdSY5SpYcKJkcRz6bFklcFMbIL7t7ZRmPJaDCeqPzduY
	d34cQlyLscPQAIitztqKyfrPRaWMM3Ucj1rNrYWcc5HPCBWRUAj4Hg7w1ylbbxztdVfoSsU98vPfk
	J9Y6nkvxuI9uh7JdC1mo0RfR61vSOvPL6BXEy08zZtwZoWOqaosHZDJPCOi/YSrhEfJc4gOmoYVvN
	lGhkpnwq53kud61q2zj1he0fsEZVbk1Rrqgsp9gpwCHjokNlPJ2LAD2dKhlByCwH/8sr1//x3umBs
	opo3pbLC18a7EiPVUarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maEgG-00CMcQ-Ec; Tue, 12 Oct 2021 10:06:44 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maEZx-00CKEd-L5; Tue, 12 Oct 2021 10:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634032813; x=1665568813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k2hvQcTUKX+6sxrV25IFhR4qKjXN2bgw7X/NopnJJ14=;
 b=MLP4J3C3KYEW+WSjDQ2WDClTtz1NxsJFQx1Zm7xFt4LU76t4vtGWuKv7
 6+Ghdi2dKeMOHBRY5SkHTxyLnI0CjUCXF+BuyJE25/9J0ZSX5cXr7Eb7D
 ZY+NGEHBJYeYFqDfCVK+QvYP+AQPv/qtIz+tfsWhpcZEjzjxpRu+B+ygx
 1Dp4s5sGLjxv2Fepw75ysV4twL5DUicsZUIqQSYIF71KVk1sEpKQAguds
 4+ELm8tOBRjlBdtqc0+lK4ZNf8IyQeAUt8cgc2PugZbPILVY+409MPHbK
 nVuPe19RuNaWMzmp5v9hS6eqCo6jB/woPW/yTYclZdPwzZNMSA1w3rDv3 g==;
X-IronPort-AV: E=Sophos;i="5.85,367,1624291200"; d="scan'208";a="286442665"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2021 18:00:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRH3sHiUrFPRaF0bYzzb5pSxaLLiou8liNedcYjJs3ONtNoWEv20VuXubPN5w2aYB1bAA8XIPO3ybo6EhJLcbTD7V2l+wWXibiZYcvhvwaqJn1vKw/thZxH/3/eiWEpuSHpyF0oqVxFVtlxy5UqUiCT3YSZCTCpl5hnwebFdVHrot/pbNqWduBYSHku1R1P0+whRfFkwIL7s3J8seN7R0Cr6PtrBJajKlbmjSdPl3yNsMraYGwCMd0q7maPhN60BTzUjuiaOHchzWtAARSTEhbVPKplijYJMjpnuOdJ/25IF3j7zCWwsKs1ClHMtLmYOFW3+ZbbkaDBk9fMNRk+SDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMsvanvwx35NMK9rrt2tW3ybr10Mh+Cf85ZllWDq76k=;
 b=LQMuEWxAcww6cY+k8sLjdbWNxhUpTDDzg5ankARpYhBaqJ1i/VwEQX7a9HFMAtPYiBjpAOa4PnTkMH9AKLu4JGYszPjFQsAMXSxSPYvYlITaH/gggQuXsMjgBaLSw2ovRHZlp9vN1IiWYlmlMAuo21iih+4iXxb6h4nolkb5Nt/chSen3aclLsD1XbzFYwSHXph4aewfLBhlNS4quVjq+bBGr2+c+l0gqx4ay1wMQPQ1pNouylpNnITI0LQYgcKnWfjv5z765oqFgvIs1LrW+tAtpvlPrlozkWHHR8xX5PdK9vfLFZ4ZfAoWITFJtdwxrPxWfoqGL1jB2xsP2V8UJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMsvanvwx35NMK9rrt2tW3ybr10Mh+Cf85ZllWDq76k=;
 b=hskOsAf235oanO+9suIZmvaHlfPcCRJfTK0dzGk3lthoD89PRNROlmIK7T1E4JfDHRJGAjxphfg3svZeggwj4RqwcQ0XVdAMpu5kcPiewPwZqci1dyxUJO3CGwtiBWAcAjUxxYcW2PJnHhpu6UDq+eawj+VtFiuXJC07Z/mhUKo=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8361.namprd04.prod.outlook.com (2603:10b6:303:140::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 10:00:07 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:00:07 +0000
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
Subject: [PATCH v9 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Tue, 12 Oct 2021 15:28:57 +0530
Message-Id: <20211012095857.1314214-9-anup.patel@wdc.com>
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
 15.20.4587.24 via Frontend Transport; Tue, 12 Oct 2021 10:00:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b719446-7cd0-4839-4a70-08d98d671220
X-MS-TrafficTypeDiagnostic: CO6PR04MB8361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB836119DBA3302A4EB03684AA8DB69@CO6PR04MB8361.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/22UmI1PxU2Adf55wvZHU5I6qVnJeI7ufCosXTCbGJoImETRvg6FOMJbAemo+6DTftGct+wM9zlBhLm2BkG6y2fve6SW0b86QXvRI62IRyRb8itwEo1bhzyfQpof45PF5r5GiBaEg/Kjj1ObLCiZIvElzH1V+HMnX+IBhrvYVGfvRfbDoFCNTBJIFJfBPwYU/58cFaD6pCKRzk2gyDueTj55EtLfjov1GQKga0rDC2C9j02Z8HKy0JOlzHs4uOafqouRHXaI/5U7rMsW8XN0PfmU+5F2gpIb+6PNtKMEGvQ5gLuTIfxpAOKjEMcaTAZmboNjt63l41HYglvgDD9fAc/+RGtxVrx+7+LAr141te1rvYD0/0VzxdAmkhy+QGsXWIuFQA7TNbUEO0upvwTNhVdwKibOX+Wg6BcMU7ZqVxZsbziNJyinpx70X+xE1GzRkoIVUMW6oeqPQzXGnrMbkTYhrzgKoOCk4Etm4OIdlSvNzIgpvfGLhnppBXzH9+hsVXtQS4jRiSBXbEHeMzcUd94nWUfcPhN07mEd0FxovRRs03Zowz5r13i+PjucV06YfSeDJK7IqEMoI47Ad72JW0iUkWvUFfb7Ubb/rhThhndR02vKYOM6DCDSZqedWlJOKFuzMa6+NWr1kVFasxUkCk/08qYoXx6wHXZd8K1dKy6QG8sdTiBmQ+irrkamCDakUFuEca0rlVtKvc0TfcJGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(54906003)(7696005)(8886007)(6666004)(110136005)(4326008)(66946007)(86362001)(38350700002)(66556008)(38100700002)(66476007)(2906002)(316002)(55016002)(5660300002)(52116002)(508600001)(8936002)(26005)(186003)(956004)(2616005)(7416002)(44832011)(8676002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrBUirihCl7td+RXBu6YGKS11mea95aUUvCfc22yvfYBcpShr5oVI/Ob7fQm?=
 =?us-ascii?Q?G+SPwzXPVgj+oOSNBohr4tKa7hYPhfJbYAB8G7qXQRFop2BEnOVvJOWUgwRV?=
 =?us-ascii?Q?oFobsU+udqkGw0qFigp4h0lssGQbO5Ssh0AEfQQlF7kMPO2ibx2M6cPoUTdE?=
 =?us-ascii?Q?ogxsoOQ37YfgxBMinhpsRHq00hazwmmc4ylXqD0WkmdojQmmNTyw03/KZ+vA?=
 =?us-ascii?Q?1GoEB5jzKJ1KmF6OTgqayvxqmmveBEMfBGcRRF2uMb3b61cWkvAsXYuJQP7l?=
 =?us-ascii?Q?sSLCOVfc+swkfYtu3LfcpeZMzy64xMXmWyfxVWwOvG2F98vC1nRvUFoVKE0i?=
 =?us-ascii?Q?f9z/IcQFsgiWhbndshdkMePPswKICFSquQsgzvE1QvXF6mJtwqOaE8eIutiD?=
 =?us-ascii?Q?frjXrJBoAAkGuy2MwzxnqV0zGFGQkaBA39mV+NnFtEEZlL/TmWTD5eRLcxXz?=
 =?us-ascii?Q?/tzzktRrK5xwi4G4XpGyYL+lL60P4UlETrpdWGfkQsOaV4vCfR4PeT3nPDkd?=
 =?us-ascii?Q?gEFDhFT9N8/sAHOnJed4InSBDwykAA+gLvVO+mKGiQPF5YrKXLd0nzw0DRni?=
 =?us-ascii?Q?IFKoS+hOXqiOUxiSwZce04WivDgvDhx5mEVwaJVT+ynGkr9HN8TlMff9UWcR?=
 =?us-ascii?Q?4ZIg/8Pr7mwESf4NRzfkej5jw4UpOCkTixSer/trIJrFccgHBITMhRXdJCtR?=
 =?us-ascii?Q?bneN22JcSUmfN+eki53pFa5if009eExusrR19nEXtiL4YR+H0ZymdKaHA563?=
 =?us-ascii?Q?K0jgR3QQ2gBbgbP1Mz9Bzfbsj9hYY9exz1WFYIOOjSKXokwLgZRBj14HHWxN?=
 =?us-ascii?Q?HtYBwb78lOecHxxaC9vIrWd5LgCYvfvAPJTnLscmJ5Yz8TU79uDyJEwOSkys?=
 =?us-ascii?Q?2/6aNDWz7b/+tho2ErqKBmhfzvZsMjEf4px9wLZGzr+boYYSqk8J6hX7gOq1?=
 =?us-ascii?Q?Ncrfh5QO2hPTaAGbz0W/oUXiPPUTo4Slw3Fxtklr5apXPoW2sDexSH+Fe8VR?=
 =?us-ascii?Q?1bEnJv7gu0mV31DD50l1+OQLsR+r2Usb1HcEfycsGeJob2IQw9ZG/KtGFunP?=
 =?us-ascii?Q?Cl0hrM7EgMt6J54dTTYhKA5FB2bC4vuonkOpfkd6h/qLwIZxRxV+S3eDRYB4?=
 =?us-ascii?Q?V+WLvMt6VTAkgLqAXbdVGr95x5qoJdeYvxDxkBZIC7bRXq6aWhfhIzE4+tLn?=
 =?us-ascii?Q?lBXZjCZpP51h7IJol8h0DKSdME1c9I0H+tpf/tdYsgVuez02L5SA0KUlwl/x?=
 =?us-ascii?Q?1puDyHVHcM6uHj8B+CSOowLj7KSOXsPnc2WgQ8vFKhWLlS2yR4qRUrw6W4vx?=
 =?us-ascii?Q?JrmhxfWF8RWq8BDaA3m+R7TZ?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b719446-7cd0-4839-4a70-08d98d671220
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:00:07.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY5/TIWk7wPKrpanW4IJm06hhMvnlu5SkGuoXtVcJSurWuckGrS3UIa0fd3HYNfq9wQ96idILCWfj06qZMgW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_030013_852002_0B148D3A 
X-CRM114-Status: GOOD (  12.34  )
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

We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
SBI HSM Supend on QEMU.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig.socs           | 3 +++
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..56bafc3dad4c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -28,6 +28,9 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select PM_GENERIC_DOMAINS if PM
+	select PM_GENERIC_DOMAINS_OF if PM && OF
+	select RISCV_SBI_CPUIDLE if CPU_IDLE
 	help
 	  This enables support for QEMU Virt Machine.
 
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 9851ba671e90..5ae71fa92c28 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 725ca3332900..31b5ca04939f 100644
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
