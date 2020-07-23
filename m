Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31916C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B1920771
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0XsUZJZr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ihMxI6gZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="IwDKysyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B1920771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qJRDKOPMKm6xPinYWKAPIGgl1TpRyswJEWgVWl37dqQ=; b=0XsUZJZrkYfDSdFIFf4BdojGWH
	s9yerX09iMfcltTWKkXFzHowFJx6L5MDt1NWnI7rRBbqXEB61knUdIxGXznkc14uM0XwcCW4waC5l
	f5Zh+ZHpfRPl/HUx53NnEPzprEJ9jbxlXlUP9OWqS7p+u/W7uCatfDZrM3UFgbi9AElTvVZmU0P4D
	z/YOtl7qMcP9aTRMb7w8EtsXwmyluM08+lnwah3puxKM7FI+WlpOWp1qQir6/OxFGXa5UD4L9IzLZ
	CNgFXdrK5eUxCS6KJe3To8emMUlHsRsbppP0oLQ9c+p672PdHLdJLlzZaK1f1Wa3Bd8jWBJi8WCxv
	girJFeVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyc9O-00063p-Qe; Thu, 23 Jul 2020 14:24:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyc9L-00062o-Jk
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 14:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595514284; x=1627050284;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jjVwaMiucOkslLD1WZnFo5aQhIC/NBaexs3GjuCsVCA=;
 b=ihMxI6gZ0c+Bjco/V/iPuI/6Am20hant4gh1T5J2e4ISKdRzNK9ahdGQ
 ihx+ZISLyqwIoaTEZAo3GN8+iApEdEM7JP6240FuKKkjiLUJjK0ifsn6/
 a7G1ReC0I75zguZ4U7u0A8OHl/fGgbesx7T0040kI5284QkWmHTbkWmZi
 8J52gH84P/TFPJWL7Bet7EX0k9ceoHsDrGOrW5DxqwARZY4DpdgumEftq
 wmHjBVgU3qZDJNPkXVSApaXhEn1KaFVIe2ZnYeP8aVl9a1VudUwdp3HNg
 ItgRDfUI4kYJzLiOhMUWZ75jNGJLFXVZOGqso/87NIReRZPGnQ7Z7AmgH A==;
IronPort-SDR: QG50DalURNeo9NIdjLq77qjd24GjlZyt6znPI1GeHCTmvUkurDHHJwC2NtZbGEeGf73CrCnZSo
 HO7rpxXrxRAo4+fQK+YKNHaJN3DOhZGjLpyikhPnjy1cylgcLUT/Rkn8FqgWPR1FP4rXh0lfG5
 lGXW3oovNVkrnKMcsUdf39uZHI6IubV3CnMrIGwDz5yKwU/mi9c3wns2IBf35+e4X1UNFLRL6T
 T9mjLZY99Nba9lvHF4gZHOtgopQEHxtKjs40JwiYsv1uYoOYlPMHlLR4ys/G0PSgTTW2qiyo6R
 oWw=
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="143302652"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jul 2020 22:24:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YShI0XOvM9Ww1h8a9WI3TLv9XdcKd7mVyLDFgsR9hAq3wO8miTl3gPn5JbapgF/aVy2tbc/+diTVUmO2+ShFg/C/a3EcIxd7lCJHWTyvk0VIiuZ1e7bL3JN0FqXjtLWevHTYDnxTrwpaK18Klgr87/vurRBKeDjBL4n1+YG5jtY/qrGteaFJWTKpTBzDysj1QP9x4TKCJDmL/jan/FfkZnzqyQ2wQthdJyZCVRuTlG0ARZT+ojRyud8AXcVMimWCyXjkcR9JKK1/ZImrFrLEB6QEnHUoAmFIIpT95kSBZy+/OoAxMDFqyF6DfknLveRYwVnuhqMxp5Q6m1sd/P+Srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTXqpLGIwRhC2YaZH8fqeWkPmsaCKWH3mQNxfjIdepw=;
 b=Kqe1rLlk24wPHe7rZjdfM0cuUv07B0ewv/TjkHBEsVQrIuNhtV2WWAZtpkFGmH9uAlUxMiRPdrSWWqK7SEVqYRG6zpK8NdZCW0iRaISesRiiMVrfAgWkUWx7wYN7d2lhuQ7sffiB8hItza4sfbMxDs8an463NR9DfcICOGTbw6HYSQPj8zJ+evIaFV/hXL8yc/Byxv/9FdLNrUq1RTxWhgz4hjEO50IOm5iL0jRNA55gReTX/PKNINV6T23kJ+JnGOLRSIkwbBL5fBgm8iS0s6MqyWZDtKtSlfitT9mp2pfSGbEg2eEoBFatiRCxZTCYPjlSSF+MHI+uBo2+RUGQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTXqpLGIwRhC2YaZH8fqeWkPmsaCKWH3mQNxfjIdepw=;
 b=IwDKysyhmDIkgWsQQoxmCOVAcwTLNjKr0GkOlEHhRthQIR4T3flDz++I1zb6sD6YBiavHB3xkjgmZ3O5/lR6qR+Pkw9gf/mOlKSALXteqWyx4LTA1eCVz04xZ7iuewzYeNO46K2p9+2Bt8f0cnQ+RNCSjxK8QW5gZue8w0Z5Vfs=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6682.namprd04.prod.outlook.com (2603:10b6:5:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 14:24:37 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 14:24:37 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 0/4] Dedicated CLINT timer driver
Date: Thu, 23 Jul 2020 19:54:05 +0530
Message-Id: <20200723142409.47057-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::32) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.56.183.159) by
 BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 14:24:32 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.56.183.159]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b82c5fbe-942f-41ed-20e0-08d82f142137
X-MS-TrafficTypeDiagnostic: DM6PR04MB6682:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB668286F8BDD4E0EC915F77778D760@DM6PR04MB6682.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukHQ2QjnwDjVYpCO/KmI5QTHZdVdpLCcYJP1ershQfy6bO9aQmX4WgbQd4fHQRbm7pnImn+I6zEUSE36YIxOOP3zYwnp+Ah+xUR3wOOrbwe2jHg9m6/5eFpKU0mgr0D5lO3iGJzNMosN2eiw9sHAvmQ4kbFKOU3pQSGcaIXqhofpQr6+SZDhELTOOo/XWzKHqH7aHspflyZLkjrThfTiAFFjNrzw2kIGXcQlrY/vUh8VW0vKioLu/tk2Ba1oqyH/9nbBD2UGFiGIubFImM/pRZfXZ2EEoRpokKVz+7mNOVMP2hltyKKiuHwC0nwPvRN++pnJOWy+9waF8R3I5aw/zY8o6dQdLppoPReBBOr8Rm1H2LvolIn83sIiOueobVwIsGvbuf17MhudfCcPOzaOlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(4326008)(5660300002)(36756003)(478600001)(7416002)(83380400001)(44832011)(55016002)(966005)(956004)(2616005)(2906002)(316002)(16526019)(8886007)(6666004)(52116002)(7696005)(66556008)(66946007)(66476007)(26005)(8676002)(54906003)(86362001)(186003)(8936002)(1076003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: efvhMCgDzNEAaopawv9Tz5zY1hNO3a9Jr8hhg7UUogDapILMzVt3QVaqWKdKTZWyLDpiIbDuXLB+9iZeKUwXki65d0kb9YaslH5Cym07sMTY3MwPwzLULMUk0BopHKydyj4NlW6JmfSGtCcln33q8FC0wS/x1yIjj4WN7nMLD6Wre+d+hg5h8JIEXyEVsrsTZQANWE71N/8X75W4zROKm8uUb+25uoUgmT1zTkBb2IavjiCYq5pn90mDReABTxE9d2PonADcoQ4sCTuag0UnlE1N2Sfot6EV90Xq6jPltIagg+43O67/Xk8kpIZ6kFNaBKfo9rLA36xGqwYfz8VwesLiDiX93wBnRdVGLeZeYPEwPnaoa4jugeQkpcRYN/kAgMBMg9AD2Oq5blpC/eMX9JKaAmKZk7UW8uWcRBceR+WfL3SA6JoIlL1uYcx5RO3e42He889kbtF+3yDbM0uSlcHK0A9o1QVcq7wo6NJmddBwtXr0N0Ka0HHX7HAd0uDD
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82c5fbe-942f-41ed-20e0-08d82f142137
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:24:37.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QFh/83CJv9KI+i5SxVZlMZMMS9YVUjyXlvkem6GDzBKlT4bXn5wY3moYBUHK8Tn0nwTHlpIrT38iytQZ3AxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_102443_801188_491EC28A 
X-CRM114-Status: GOOD (  18.34  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The current RISC-V timer driver is convoluted and implements two
distinct timers:
 1. S-mode timer: This is for Linux RISC-V S-mode with MMU. The
    clocksource is implemented using TIME CSR and clockevent device
    is implemented using SBI Timer calls.
 2. M-mode timer: This is for Linux RISC-V M-mode without MMU. The
    clocksource is implemented using CLINT MMIO time register and
    clockevent device is implemented using CLINT MMIO timecmp registers.

This patchset removes clint related code from RISC-V timer driver and
arch/riscv directory. Instead, the series adds a dedicated MMIO based
CLINT driver under drivers/clocksource directory which can be used by
Linux RISC-V M-mode (i.e NoMMU Linux RISC-V).

The patchset is based up Linux-5.8-rc6 and can be found at riscv_clint_v5
branch of: https://github.com/avpatel/linux.git

This series is tested on:
 1. QEMU RV64 virt machine using Linux RISC-V S-mode
 2. QEMU RV32 virt machine using Linux RISC-V S-mode
 3. QEMU RV64 virt machine using Linux RISC-V M-mode (i.e. NoMMU)

Changes since v4:
 - Rebased series on Linux-5.8-rc6
 - Updated Kconfig option as suggested by Daniel in PATCH2
 - Removed per-CPU registered flag in PATCH2
 - Addressed nit comments from Atish in PATCH2

Changes since v3:
 - Updated commit description of PATCH2
 - Use clint_get_cycles64() in clint_rdtime() of PATCH2
 - Call clockevents_config_and_register() only once for each CPU in
   clint_timer_starting_cpu of PATCH2
 - Select CLINT timer driver from platform Kconfig in PATCH3
 - Fixed 'make dt_binding_check' for PATCH4

Changes since v2:
 - Rebased series on Linux-5.8-rc5
 - Squashed PATCH3 onto PATCH2 to preserve GIT bisectability
 - Moved PATCH4 before PATCH2 to preserve GIT bisectability
 - Replaced CLINT dt-bindings text document with YAML schema
 - Use SiFive CLINT compatible string as per SiFive IP block versioning

Changes since v1:
 - Rebased series on Linux-5.8-rc2
 - Added pr_warn() for case where ipi_ops not available in PATCH1
 - Updated ipi_inject() prototype to use "struct cpumask *" in PATCH1
 - Updated CLINT_TIMER kconfig option to depend on RISCV_M_MODE in PATCH4
 - Added riscv,clint0 compatible string in DT bindings document

Anup Patel (4):
  RISC-V: Add mechanism to provide custom IPI operations
  clocksource/drivers: Add CLINT timer driver
  RISC-V: Remove CLINT related code from timer and arch
  dt-bindings: timer: Add CLINT bindings

 .../bindings/timer/sifive,clint.yaml          |  58 +++++
 arch/riscv/Kconfig                            |   2 +-
 arch/riscv/Kconfig.socs                       |   2 +
 arch/riscv/configs/nommu_virt_defconfig       |   7 +-
 arch/riscv/include/asm/clint.h                |  39 ---
 arch/riscv/include/asm/smp.h                  |  19 ++
 arch/riscv/include/asm/timex.h                |  28 +--
 arch/riscv/kernel/Makefile                    |   2 +-
 arch/riscv/kernel/clint.c                     |  44 ----
 arch/riscv/kernel/sbi.c                       |  14 ++
 arch/riscv/kernel/setup.c                     |   2 -
 arch/riscv/kernel/smp.c                       |  44 ++--
 arch/riscv/kernel/smpboot.c                   |   4 +-
 drivers/clocksource/Kconfig                   |  12 +-
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-clint.c             | 226 ++++++++++++++++++
 drivers/clocksource/timer-riscv.c             |  17 +-
 include/linux/cpuhotplug.h                    |   1 +
 18 files changed, 369 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
 delete mode 100644 arch/riscv/include/asm/clint.h
 delete mode 100644 arch/riscv/kernel/clint.c
 create mode 100644 drivers/clocksource/timer-clint.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
