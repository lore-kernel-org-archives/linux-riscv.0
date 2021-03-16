Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605ABC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 10:47:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52D464F4C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 10:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52D464F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9b9EVmdDkKXdZHLNdAnRwLIxdXf5w6cmsKFAi0mfB1o=; b=pKe0MnAsdPJ/cS4kEF0B6R0KI
	/3EvjOrRZCU0kg6uUuNIaout9IVmO1A1hVZ8JMCacTc9X82GkvOuVfu5AtOtpScyQJRDVnde/3v97
	vSab4+sVsEAC9Rpclvjh+Y79i+xrQmSCZJfkS+dYJ5SW8QbTt+4StRJUnwVoIA8Nm8ewsoTOWBhu1
	sUOigzPVCty4eScN4s2qdAT36izo5B1k/jXBkdMPbmyTQxB0zboaEVzlVlaUg/GXgJhG5rxFKR3ry
	LRGX4VN+KRjyOg8Ev365VHljt9X7zdUl9po1dmom5RCjTujZyEO7rlDxYGu13MQpnqiLJXJWZRtZN
	Mr1NzHFaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7Eg-000So2-Cy; Tue, 16 Mar 2021 10:47:38 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7AD-000R2I-9y; Tue, 16 Mar 2021 10:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615891382; x=1647427382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4ds/DRIrv63enKd4gbTtluhlQ9Tr4y2t6F0kVQdmG3A=;
 b=hqtZF34wzR+qqm9gss4zAWTPYCuZNcpiII8q28sGqS0OWn+HKc87a+o+
 Nz3TzzlxrOf5OElYm6hBiaZm/nJgUmAQdI9GtD8nOf6vl/EOmjixC7Qsz
 xFK23Jz4m54k9gv170wzirX5DltegHM3HW7ErGY/NCr7UGogvtQ4I4B/z
 etkEVgyQZzlQbtPsTkma6wq/SVgohuglNbo+oq072W8mGhQiENPTBZcfp
 KRq/8xCB167y55TvJ4B0V3i1F1JPRuoHkqEXlZ7EAzAZY4aNnF9BQceKj
 HKTUGAEVESnSRs9JIDJAPYRHv+hZU9qlJjJp2ysZklmGCOvOiZb3wn03R g==;
IronPort-SDR: xex13+JMiAlVTQBwBRbU7H5rpT9pN6pLAfhDx0GQJpet3u+z2yaoory0JLL72quhBDcvIyojJY
 RWasXL76Pmahs6y9cZfN4tOT/7rXL5hjRALj0hVGnyt6672829p2vqPrnoYW83wBEcg9/Es5J3
 xVphFSsOzNj3XwoAs+JO2AtnlfrjfhObudsBOKVHV4nwzdVcyDMkU8Pefn65SW5b9CZlnMN3+D
 qSHTeuLqx3niOns8GWdnIjoGQalLCm0/ExJ0JrIt7LNB5WjjmGK3ePRIXj9zeR6AL0YpPEDKo7
 qyw=
X-IronPort-AV: E=Sophos;i="5.81,251,1610380800"; d="scan'208";a="163398527"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2021 18:43:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXOfO4JnTRWvRADi2BY9RG4dwr8bxjZWTrVG6fhDZxdXUJ2uXbcnkdL41KBmDVTL1AX0GTtGQcsSBlUgk/GGv8+znks3Mm6T3/NxozKpcsskSAcsZ0h/8TOKdyiodU5EfiJe/aGIAk1eU8fnqROlBvov0M9mNSN8n7T86HDTYrUHKQM3AhCow86eXZoQ7EvF3I7i6u4mz4uVzaZncvxZHIe167uUHHIhljZjW+aqbgrDb7SDXyRhVhjCcRmr9oEOxDH2WIqFzHE0AT08DKFtCd2BBJv/I3zrwqB3lbAIEbhn6WkXMjoN5rXrMr6V/Ss/FnyYRcZvuu9no5DVYcTAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YRKAcytJ/VRtOkvDqrJ5/QVgSgs1BgggwvCEHOH5WQ=;
 b=bAzE9h5EFpCytlVDFAal4m13bRZpduG/C3908QtNq/UXP21AK/KyZCAn8k8wcpWXepNkJW9Be0ZqE3f0OpZPXTDAj17tRzpy77bXnakDw5yJVEjhB0m32dPzp3jF0JJNzaR/fBGIQyCOAiX7WhP4+c0ORdr69SESCgfODay6wjWVUR04OrZRriFT666RdN5mfIjVX+uObB1HNcYTfVqZHzRdQbVezFooo6Emtm6hQgzwrzWV5JQFQZA2Ba10pr7dSjEQ1L9zSRR582wBlV7B0S+as5zgTAKEPZjCAvcDUbHCCXdeuIXWFL4kexYXYzmTRdWN84YgU8yMsmmoaQY7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YRKAcytJ/VRtOkvDqrJ5/QVgSgs1BgggwvCEHOH5WQ=;
 b=Gsd5sX6D6ARDg/So51rHMo1PQHsKstd4V93S16ZadyoW9QrN9aT3xjCKnq/ye2R694YR5WYZsGTEXpSepy6W6Z/OB4//IzIcgzICirx57sTb7ZVTKf5PRdhlqpI/54Vj06j7hbpI2Cd0MEaMBu04QoPN0/wmB1MD/BEXRPwa6BU=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6377.namprd04.prod.outlook.com (2603:10b6:5:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 10:42:58 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 10:42:58 +0000
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
Subject: [RFC PATCH v2 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Tue, 16 Mar 2021 16:11:40 +0530
Message-Id: <20210316104140.878019-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316104140.878019-1-anup.patel@wdc.com>
References: <20210316104140.878019-1-anup.patel@wdc.com>
X-Originating-IP: [122.167.218.45]
X-ClientProxiedBy: MA1PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::30) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.218.45) by
 MA1PR01CA0136.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 10:42:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7c4d238-d950-41dc-2d66-08d8e86843a1
X-MS-TrafficTypeDiagnostic: DM6PR04MB6377:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB6377CD5A921A29A9F7F75DBF8D6B9@DM6PR04MB6377.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iohx4AFwIQ3nDq0mbZtCDxrfz7ZRCzCbtsVqbWteyk9moGoSxUDFLVUvhFVQt8S12Ey+4D+vfQEWoE0e2k7rVbN5u+rl7DyqlBuwvjN4dgNz/UTBrCQ/bjC7/Nxl87qWUhHmSC3N1gylRSGzZm0f0413bSOdKTPlXFeS0II2cVp7JQ7M7s7OQITNITR8EDnHlLBLI5YLDdCp7tWwbO5oR2yt1PqEfZ+fFMcmoRlgpRNVuNFfLFAA6KJCu6vG7AxEFwD7asKXd5jTUXt0pvJH0xHSzoKGSaH4vH+tjD5kytM2GYSER3FHxoxI4c+Ra6kXWm+EssF4E9hPg+i3KAzaMk+shJTGgbnMQNyHqICOC/6aOypSfoOF4WZO9qZxy6XBcSqQLQBQpusl6RGH6eFU3vuUYfQoxBD6Svcgbf5ZjNitE9AOeafwiASL336KTS91g2VHEmj4d09qVWJscbFySRFSRqCL/4GyzZim3JaUsBlEzE+Hp7qLIUHo8MvLGliGyVgMK8JlvnKpeIsaI6s8IJDylZAgu+OOabb6scMkKachYG+3+InD99HegoPQmGxd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(44832011)(52116002)(86362001)(110136005)(7696005)(8936002)(66946007)(8886007)(55016002)(7416002)(186003)(66556008)(16526019)(66476007)(26005)(956004)(2906002)(2616005)(4326008)(6666004)(5660300002)(498600001)(1076003)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8AMEs3ElL6cTKI/75vqo4eyfNprOYpqp0DXUbIixV5h/zRE250/g4v6V7aUT?=
 =?us-ascii?Q?aTI+ELyDojUFlWFd6TPHtQeMTGCmngSE66B00Z4OnjXCPWuH34R4iz/yxcm1?=
 =?us-ascii?Q?kcAM53eKfiWHm2ALMveiYYiXyO+nhnjIk0u3D9a9l+upGDiyIZZr9twLZdo0?=
 =?us-ascii?Q?PmCP618pXcx3AOSp9l66bgV2R1zpOLqnLykw7t0abzX/5/Rozbx5oQa6pW9n?=
 =?us-ascii?Q?l6hhrKdfZDFrG6cjyjRqUbREaiOQupkx8L63ZWq7B33h4bcsyo6mMVFtJvDL?=
 =?us-ascii?Q?7HdPXxynHHk/1+1/YjqC2C40OvcrX3cDEDyu5yr0CxTz+Bt3Fypo0AwrGIkN?=
 =?us-ascii?Q?kM7XBok79Mmpb4Cyv4Oycsg4cnWuA09qQJPv4am7+jim1wU/V7KUqvOAXmbD?=
 =?us-ascii?Q?KxzF77wchDVgWLIrt8HckxrvZRU7kRI3LUSvyo8epUD4s20UDbTRlijQInIu?=
 =?us-ascii?Q?KiNxVuOxTq7dWv+a4zkCdLUsa0pqYaZmEBgv5QklD09akZKcxI2fC6L9HBGx?=
 =?us-ascii?Q?Ko7z5/XNGVkaF62LiL9FbsAuyrDasnkTD1tpzg3X/Qm/TMJkseflnA8X6G5q?=
 =?us-ascii?Q?7QC7qFUra/TQeb4yK4eSfwakCcoXmXzjeOGYjIWEs7xpGXv0YTr2gDFWZLHA?=
 =?us-ascii?Q?VEtPzdu7q2PDDv8i6ouDMljLog9UNs3TNRMnxWigw6sYRZ50aUaTTjj4mtCs?=
 =?us-ascii?Q?yq7SIC5cR6ifnsT284t50x7Qu2YxEWb41X5V5BVxR1X2EUgDyDiUQWjmQksp?=
 =?us-ascii?Q?QY9hTIBFRl9pyyNTN2Al97H9mfQ6CaR1WKrgYGHCmZVcRJkeFLxhOiQSETfo?=
 =?us-ascii?Q?L3zNL6/ZUgc1uXjuFLiUaRFHEOMQ7LgWUUzMBxSOKTfxxuCkMnu2A0CWBPLr?=
 =?us-ascii?Q?05bbJoHvQtQWTS1Lv+qLRv5Kl4MEyTK2yZHqZ+9Bz52h92cM8AiM2DCe+oAr?=
 =?us-ascii?Q?cCJs1arBTO6y5VSbwedT6OL6/wSM1tB1fD4cKQpoQW2lF9aJfRi+K4uOrOwT?=
 =?us-ascii?Q?eKQnXuWihCzzvT8c3L4EPzkwSCBrV2J4fymJoleD29lUrlR7+KVXWRry5i0s?=
 =?us-ascii?Q?Zd9/YrWGjHivS/yJCr3XcqBwvN+qDa3/nyGBdedM4ZmgSs764FqHaV9aiBuZ?=
 =?us-ascii?Q?LOlA4XXWsA0pwCrmtWjoLfY+APpkdMEGqE7O66XGGa16pHhmO3F50Lbzkm6w?=
 =?us-ascii?Q?AlzVSMykWMr4r/SCAZHnZwGAGq3FvTwV1b3f93JcxdNKIgNaYJQUTEVgWH72?=
 =?us-ascii?Q?5dhC261bvxukGBObmTqZ8VV+G3RQ4/Rd3oP+BIBBYVlDmtLVDE3ohOlr2qhI?=
 =?us-ascii?Q?5fTtpKcfM1otDaMs+wkLqDux?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c4d238-d950-41dc-2d66-08d8e86843a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 10:42:58.2853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1TNaH+bIuLQ5U/BEGVCx2Ht3d30kJtdn46zScPzztS+e4dLAkh2S1hd96koUKXrAGJ/qdpI8t6VRrmY0yJIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_104301_731727_0762A705 
X-CRM114-Status: GOOD (  13.98  )
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
index 7efcece8896c..efdf6fbe18dd 100644
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
