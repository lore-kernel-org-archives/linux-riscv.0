Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADCEC2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 06:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E560920882
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 06:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozQvk8RL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pNE7riay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="W5MfMQCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E560920882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lE/4EuWyy4WDdpDcH2IQ40ng4VCIaOC4G+1jM3vupKk=; b=ozQvk8RLfJqxcj+Rojk4wmn2OI
	R22zGCqGepxmxDJP2RrLdwe1lp2HWzgBy/iG/uYmZt6LI2jPRHXPH6nhUbY6aHxqldNoraA8pqJjm
	cbDcC+BikGp/1swSS1Vt9o4E/E4QygCqFDRdpHPQjPobsaRVF/4Hkm/hDFmEAOtXoREGHspRmQ80r
	O/Uq/9W0qIZmKsanQnFa8eKwuqlMo1E74bA8PaGLODdVnf4eEWYWMJWpSUsdip3zrDoJpi6S2grF+
	BIJMhnf26fyEoDIT0ca1CBY90gEeusHGC89E4w83IjceI4iepkqHbfSA7OC4HkD5B3s0JcKshyXkj
	GSMsqOIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM44o-0005oX-LC; Sat, 26 Sep 2020 06:52:58 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM44l-0005nj-Jb
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 06:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601103176; x=1632639176;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dSRo/9swNQIcrLtiKEJPffEZF4DoRPAOAjs+Md3G5io=;
 b=pNE7riayJKJEa7nJ8oSglvgfwYn/29uL+GZozQyjMshm2YWe1/CeAMOh
 rS7l6NQY/QgRof1UI7ccRBAwsX2wX0/BKeuIn5jNuoGv6v5x4XwxU0wJ2
 qjEqRPUQAq2nrQctSC/Zb0SEQnRSldnnXqvIaJFUul6w4I/gJbXOXUWUv
 +CFF9lWbfJQFUoRHOdcGAJhwsw48iqQqmhAru5eVgZe/9S7enOwI2ZDZ7
 BOWe5WB1sgZBS2+CK2HQINlHymHoHEHT6RlpmzbAFC2iLffvfwU3MYyyy
 pm79JcfUdekJnwBDYqRW3Qm24qA0xwIPZU4P4q75ywlPRWqwmVlWq2FMJ Q==;
IronPort-SDR: mxKX4cgcNHQ5IqdLZCnSEW1Qsswx5Axqoeyd0o2eWB7AaX2VAFwHC+TmZKlnyLYybYdcOk4djC
 tBs4L41ncbHlmgFobwKOxVtJR8NCt2+PJz7gK+SSPM89NpA4M6tQJENYtIkgU9fvJtnPyT45wb
 DFuQwvD4zUfNC3KQeENu2c+TTrkS9vq7Qwin02475ETItqW2dR6ExJahr5+9NwQoPNhsE63G+z
 Oj8Fx0z5v8NnSijN9+K3GGv7zTvHdcfMaTXMuxfHs6dxHVILAHm76XLQJog+isbmn2wWMbyN+7
 dM4=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="149551627"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 14:52:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+21dwhobFARDKDSykRba85HjUIbg+LaSFNd3CmQ4fBpHvcD1ZdxilX7ecRQxjHYocggZdmS/MzyvScaYIeF7MXBrB2FFqiXY+Xq0vNiZRfSKqd2lf3cw0P0xsLJsXBh6ItwEUhMbOr9zbAYymF4Tx3jX9Xwig3qCNjWuHV+tL+qlO7pMnBNiC/F2o53gFoKxciHvx5BMxbSywhzpp7sb1mtZehGcsaBGbJoM0KYJwtkml2LK/5c3zKwdns35a5BhKs2Ta4y5NjwVNt73Pyg1PinJZ7b+DjWLf1JiaMdgZBkvMRWWJNfoR8fweaiu67D70Xa3WzY7w2Lf8DNegR1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2kunY/cXgjb12V+J1gpMU5kvDdgNjIGynZ94p2sn80=;
 b=hRJmew5tTpbZqk+8T7hjZjoO7TF03BLIbIPObPRe/V5S6dGc/MyOd6bBzNlCGjTywThkRFUcEQMNZnZRvWw0w/eyiLF1vxJPSKEu9qK3492PQKKaQ71+1Eq0SVWSTSJUfvFjlaqmgM0lLZ02Obyrz9ulkPEsvrZSBXik5sGTAzSfECnDW1/Y5cuNwXyBckyG70VTUMHnl++CmKdWu8a+StxA3RQC0GnrMPEpQtGNJai0HvlfvupK9GjrY1jFn4/P7va2VwJnuLTlcSCRflo6lxInDKno33ECBI8xctQGDCbDPuQYAqoNNPBkNj+OhRgdiEdDIFh9n6zpXAik5DzSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2kunY/cXgjb12V+J1gpMU5kvDdgNjIGynZ94p2sn80=;
 b=W5MfMQCHtmEcuAtgO+rOAWKd7eQzyd0Fx7e94dshGu5CmRqIAKFYv1KPWvor6l93nYk2i7y3qGN/nY709u7Yw8pXfRvfRPNkAF0IR4USRWlsKOw0VJllzC2es58pVNV5ly+SeiKDPMspPVDcsJMUVZvfHAV1MzBVB4sOxnvYtnI=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6493.namprd04.prod.outlook.com (2603:10b6:5:1bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Sat, 26 Sep
 2020 06:52:52 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3391.020; Sat, 26 Sep 2020
 06:52:52 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [RFC PATCH v2] RISC-V: Use SBI SRST extension when available
Date: Sat, 26 Sep 2020 12:22:25 +0530
Message-Id: <20200926065225.807145-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MA1PR01CA0082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::22)
 To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.126.16) by
 MA1PR01CA0082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Sat, 26 Sep 2020 06:52:48 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.179.126.16]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08e1d56f-0eb1-4aa0-a582-08d861e8c9cc
X-MS-TrafficTypeDiagnostic: DM6PR04MB6493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB6493C1264563C51B1B21279F8D370@DM6PR04MB6493.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0MihwrM4x46sqN4xcaTk2b9EcBFODLiZxA10SKaRfdg/whjMTz1D4Hm5O4/K9ZGCOG43YRnB1YTjiOccY5CoH2RG9urqY22Oer5BGOOVCgd2Ky9OIgLFbjEHNqM6fi2MnmDW2C8z0T+c3ov4OIWBvi4duMWJAZaJrCNOHPS8dyxPdrl53thWWPfULFikv0OdW+ALxUQsDpGPrAXaGtU2wLBFYFOiuG9wD3HW7fcmbD0esbknUQZSSEUYAV2FPnqPtfwIu6kgcOtaGIda7o4qtuB+mEcQ/838G97Ul8thDPmoGQmhK+J0Ilw/wdQugl3Shw4n9GkmnSb55mSQEwW3A7b6jeUkXuGc3ZCAJftAJN95pGqp2Hhf3vQ4r+uSsvZ5iSAZFX87joG3UhvVhFjzLldIKy5xI0uVT4I2iXLhFCCuuBUvsTa/W1EvxvZ3WGzJlIfV0Q7Dux6I2AoD5kH8Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(8886007)(186003)(5660300002)(16526019)(1076003)(66556008)(66476007)(44832011)(2906002)(26005)(966005)(4326008)(86362001)(66946007)(2616005)(956004)(8676002)(83380400001)(36756003)(6666004)(110136005)(316002)(8936002)(478600001)(7696005)(52116002)(54906003)(55016002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: EtguUCj0tPO79xdrBY33a9IM9G7k4aDRUQ+668R09EuwqdUpfKtar6PJDgSRJIIflxO6WOsBB3cp1Z4x8wAFhx7q/PpnVuVdnX0+B06+w8xRtIfKjxURvX+0ZGDkf7D23FztdXYHUc08HQSmp5jMCSfgFKoyULJKjSBdW6l15mQRuoT5NYiglpUe0kgjI4uHvyAqcy+9JdcTLA/yCZa/PC03vsjzky3lH7Srl39E/8nNppTRKESQmdhbHdbDF42uzQB24+nPSf3yXq/8sRHKHrJ9p1XIWTKhDLjOKf+s4t1fnmKERNNlD77UynLENMlTDG9wIRH9ERrL9PPG66WRtADE/ETS3A5B7T5mM3p2rEs+TSwaUeOcAUiwmemDGh18QigKjafvoMFxQI7V7T/XrbayrtJk62kWidwZYXu8hxdi1d6T5Kw90KlC9vNvinPH5s8chqH5aLSii48gnHfedlekdJl1K1bwQcnZyUZDfj4doKxMZ0M7BqoTOyp7tUxlBoEUIkcYgqlEDVLQ63XIfzFHpHOifoP1Z40pqlO6sp6HaVsA8soORXUtGJ4dWtzqR3JnfuvwBIMGevN0K2UsAebUSC4BLq5XYhX0GCi2qkEmmiL2vieQSrOVhteWNBGYAyhshE9clkBwbM+CEMZHaw==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e1d56f-0eb1-4aa0-a582-08d861e8c9cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2020 06:52:52.3231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKhELO3ZOgPmg3q0uVeuxdDIxNUZ/rafcwDX7IzHXM1DFZ+iO/q4pchTEv9N7zD8JhonDmDvsVAKFZBAuOxQvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_025255_940840_95BB76BB 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI SRST extension provides a standard way to poweroff and
reboot the system irrespective to whether Linux RISC-V S-mode
is running natively (HS-mode) or inside Guest/VM (VS-mode).

The draft specification of SBI SRST extension is available in
srbt_v1 branch of: https://github.com/avpatel/riscv-sbi-doc.

This patch extends Linux RISC-V SBI implementation to detect
and use SBI SRST extension.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
Changes since v1:
 - Updated patch as-per latest SBI SRST extension draft spec where
   we have only one SBI call with "reset_type" parameter
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 arch/riscv/kernel/sbi.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 653edb25d495..6ae1288d9c7e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,7 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+	SBI_EXT_SRST = 0x53525354,
 };
 
 enum sbi_ext_base_fid {
@@ -70,6 +71,16 @@ enum sbi_hsm_hart_status {
 	SBI_HSM_HART_STATUS_STOP_PENDING,
 };
 
+enum sbi_ext_srst_fid {
+	SBI_EXT_SRST_RESET = 0,
+};
+
+enum sbi_srst_reset_type {
+	SBI_SRST_RESET_TYPE_SHUTDOWN = 0,
+	SBI_SRST_RESET_TYPE_COLD_REBOOT,
+	SBI_SRST_RESET_TYPE_WARM_REBOOT,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 226ccce0f9e0..18c27f1f8cf2 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,6 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
@@ -501,6 +502,28 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
 }
 EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
 
+static void sbi_srst_reset(unsigned long type)
+{
+	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, 0, 0, 0, 0, 0);
+	pr_warn("%s: reset_type=%ld failed\n", __func__, type);
+}
+
+static int sbi_srst_reboot(struct notifier_block *this,
+			   unsigned long mode, void *cmd)
+{
+	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
+		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
+		       SBI_SRST_RESET_TYPE_COLD_REBOOT);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block sbi_srst_reboot_nb;
+
+static void sbi_srst_power_off(void)
+{
+	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN);
+}
+
 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
  * @extid: The extension ID to be probed.
@@ -593,6 +616,13 @@ int __init sbi_init(void)
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
+		if (sbi_probe_extension(SBI_EXT_SRST) > 0) {
+			pr_info("SBI v0.2 SRST extension detected\n");
+			pm_power_off = sbi_srst_power_off;
+			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
+			sbi_srst_reboot_nb.priority = 192;
+			register_restart_handler(&sbi_srst_reboot_nb);
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
