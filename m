Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944A0C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 13:28:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2250923382
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 13:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2250923382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Csgy4VQKaGCWa+eOOBMEJAsI0IaKv/n9mFIwekFGHy4=; b=khQ8ZRjSXkXj2khoZT/CmJTSL
	Y0ML6z8mJFKVRLKpiaymV/TXfTgISmkRh/7C2F1rr2OXMwz6kX9n6cW7ksxAps5h3uQC4pIy3M6OV
	z2W1R1TOA+42t/Y/tJHCfBEUsijg8COxlS5tGvdm6NJXuIzAQlIrHV4n0RT1LynSpRcKXE3c/YAzP
	7ijRDVSRdG/0J+FJ5sB5TLsFtj+LKjnPhHk9dFIuxQKT3oUJC1VaeqzBG9rqP3/QVZounbzmT5FoB
	kMRZ4iuATAV3r8yQ7zAqYD6HrGvup18+bdMoTHr09TVzUW1yLno2j0UG2fzDlU/10ZLPR3UjbNHei
	xhMCPwsKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0P9d-00056P-Na; Fri, 15 Jan 2021 13:28:41 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0O4u-0001dH-KH; Fri, 15 Jan 2021 12:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610713184; x=1642249184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FncAVryU/X1o20r0vZwUwJRglWAImrSDWppEwgMxLbw=;
 b=RQzSWKo6GhdqdGQIaw+nDe/+6M4bMbdqqRsYwo41tdnUWQxfiGMu/ONV
 aUN3On5KyKMCdTHkKzn85TybXXqwX1XKT0kSHN8ChaCD195A2pTq5zQ30
 4WYuDjntVNhdCMBZ7zZJ9pyoorM5GmzQTssiV7pLmHh6/M3Tk38x0i6NR
 Bc+FE1oTYA2S4cw2B8GO7Cg4vC5biQqjmhNnMos6U4kcFqTi+NjhGyeXs
 hfmxei8ijaKF/UyHckGFeSwqWP5VHmYf1ecYgJ2fsC0NHS+WFW5dondIJ
 JkQIK35LHU7G1d7bZxouafnEJVIk7YcVO4V6w+J4tnDaYquzl77NuY3xu g==;
IronPort-SDR: EJ6hstZI3XASv8EXbwD6X0omuCHGr37jcxFn41/5vn+CZNNV34boA4kPtgSLK5Q1YIhBvPaUy6
 eFmf2iKChuxJ4gg0+ysyzu07iINVH1cW/eFCf0LJ8ojV3VvshNBCUKOB6ZZglQen2sAXylw5Qw
 8sQ/R5uWc9V/0g2AcKyOBbX8FRoh1yhgcnNcJHETV0N2+n5cmoWF0ex/KA5bLCzrhAQ/3Z/NG4
 ajD4ZflOuGvF4B0xPp6Si/eSj8WbOtgj+RdhnK7+er2akH/wqF2EcZT6WiSCVtd3Emwp13ODoZ
 Go4=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161949537"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 20:19:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL2zyBmRCob28wtmFN+9RsnoTiCOewgDa/9qfLCWXTJ2Q0GcanaAUA8Ws9zNmZND47J97Oo5QECI7tkAr+qnir4uQVOMuArkNVCyNb7h3dhKLVQaceUWcZ/8bO680tX/zByZK93VDe356+DKEP1vSIwjjrKUYwBQuMndkt36XX99GgHD274yeeCyqh6e0JXsnlpfplulM2eMqCjvTgqgRIzpNj2mpkUWp/db1LxphibLBk5pUzYZxV4chqIXC8CNmiXNAwjWfEVF42Ni51zktk58PWUnKZV89Y9nTN+2NbDHAFxoVlok8QhR8oM+/1jP20P3gNIjBim0/JTETMxXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6LMW+fHg5VBUnqkV8Ik1nLvno9fSpvyyG6lGVDAUu8=;
 b=mcVrlobdkzFHiiUt5Xf7DFmPnbXv63LDcbk1No54ufjv4KAiCuTgydu1/zXLjuWbJOhsnj8oRDejTuimDWe094RnTgHl0S8UN9SxxTE+71DGQbIPl3ykF9XviIXPlwJHK3GB5rzRsk2bIh9TMB4Shut3o/ldw/8KEyVK8uAKm0l5itk+QpHLE84YCYBCl4GclAGHXD+fnLPgtnbljyBhShoXasyJga4vO1bqpO1s1BeujRaz7TCkeY7ncT+Lgra2YBBQRHZwPM2oEPNtG4st4xH77er9rVWJfqhGyA0G/2X+U4ebo1o5zdOmH6kbMnVgDAaDu/ekuxhNdzrWIXz12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6LMW+fHg5VBUnqkV8Ik1nLvno9fSpvyyG6lGVDAUu8=;
 b=YqdCaHIkR4qAHgZudLkdK3qjlc8DYzGX9m+OmtRaE0k+3+zTxfAgV0650HvnGrSPByhzLP1Mc/Xqv1rNzERwiiWs/qvRpCk7MBudVCDGDUfHYVxSvQKwOVuArWQuW3z1FrtubxgcPdfTJs5XbQDntkA/V9ljG3fdH8RhPAblVBY=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB3769.namprd04.prod.outlook.com (2603:10b6:3:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 12:19:40 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97%5]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 12:19:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v16 05/17] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
Date: Fri, 15 Jan 2021 17:48:34 +0530
Message-Id: <20210115121846.114528-6-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115121846.114528-1-anup.patel@wdc.com>
References: <20210115121846.114528-1-anup.patel@wdc.com>
X-Originating-IP: [122.167.152.18]
X-ClientProxiedBy: MAXPR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::34) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.152.18) by
 MAXPR0101CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Fri, 15 Jan 2021 12:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a8a8efb-cbc0-471c-f091-08d8b94fd55e
X-MS-TrafficTypeDiagnostic: DM5PR04MB3769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB376959F8D0C5F2364B518CF28DA70@DM5PR04MB3769.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qx5xVW8ws+O13iFWS+oO5/VYQ8H0OgpCkJDyn+EIjH/svhREIKrVWv8PCK5BWrhNAAT5425HBkltwBAML+20UL8EQ7jbX5gjdAlqjFaSM0eMu0focXr3FvcoV5UGusOHv0Gnv2EJVbUFL7Dz6Yvjc6zCr9BmW66LvQz/Beo7dfDVTbho4dtDFXcC9LO8rdWRn3ZRUareVtyJ8kf/QYLf9J74S6l04afNFs5OU0Xz6SzTqI3YHWZWWBAUyF3Vu8xO99A7jJvk6RiZi4FxDLut+4iJmyxJCM5Zv8xFJekftFkmjtJOv4zeIwLv+cjKBqmeKT3nTyoO35DdOfO5ro9V0HiXssWRdkcYYH5QtS+yRqCFsF/90jIPee256RKmDnjb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(66476007)(55016002)(7696005)(54906003)(66946007)(110136005)(956004)(5660300002)(2616005)(186003)(52116002)(44832011)(478600001)(66556008)(8936002)(26005)(86362001)(2906002)(83380400001)(7416002)(30864003)(16526019)(8676002)(316002)(4326008)(36756003)(8886007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g4f2WsCwnBIETMTAfAE2LXGwuJN3dp6YbEj77MXlsQEES/R88CVAWtFlLq8p?=
 =?us-ascii?Q?wLQDBEEJdq5xXbow2mphqu7wjvN3Yu15yveHAMDcw+U+QmHIjADOPzgh7daE?=
 =?us-ascii?Q?0bGw9tq+9RAKpANuYpQxYOBr5GInvpiRd/gsWWTZXexg+giPUFfsXFHSV3Lu?=
 =?us-ascii?Q?R0MDSAapXHQUJ1+mo0Oj4iAOv9rgyzoiiuvjNFL7/rrBbtT+5ALGZLOsfSSn?=
 =?us-ascii?Q?SRvj1Pv6Cx4KNmFzyf0Z8IMrniQpt1293fzVPA61eaTJG5sbnnvabu+d38wm?=
 =?us-ascii?Q?7bHC4fty0NJs2SQFHzkpR3tWDeyN5P0Lqu4HH9OEQ0D3q2m7vQB1C34IyJet?=
 =?us-ascii?Q?gxZrwOa5+3zZXOM86mqRys54kdOwGytWrvc2ZMF34iNGEKvaDQtLzdsS7E2u?=
 =?us-ascii?Q?qVXxNFTM8XfJWLhVwLxl3pu36+HXXsYc66+Xso/jmLsabbOYKfaBcEMO440F?=
 =?us-ascii?Q?MQqWPXAG3aKcoptb1XvFnfYHtujZBW2q/ErEkCdBx5XzZMvfB3IAmfAxmRUE?=
 =?us-ascii?Q?hlhkTvMsDMA9QQrHn1J9MguyxVfbqBMPzbcew6ce6dHqGJWzO/LI3abwmn1y?=
 =?us-ascii?Q?vIPldgHpNni0gCKwW+iaFuNAvA6MlbF6pHJvslgYG0DqSEbXnU/2FaZc1+4P?=
 =?us-ascii?Q?tUZ4k/fxX+dmVlM8A+bwaSyyZcS0ZVzLGCD8g+lZbA981nBbzfFkkVqvkXFZ?=
 =?us-ascii?Q?rC+KgTTRCG6sXzuDQ9YglmysUqBnmCRKbXD5NudPCMDq45V4BMu0RyYD9Lpg?=
 =?us-ascii?Q?ZwuXK1a5UGjWnZjJmDlkYyYz+rOE0VFQUN3Y9k9j6+M/bYnOuR5LoRr+9Nx/?=
 =?us-ascii?Q?C09Dw0Ju6eG1a3B+PZMFJDc855vNlHCrk5JWg1IOC3UkouBRyXRJVsO78GdY?=
 =?us-ascii?Q?aQByiZ6okOwoxgQnU/RaBsozafBCqenW0LIsSMMpwDDXBdN9blwJ081MPPSg?=
 =?us-ascii?Q?/B9/meHTDm6XIlTy+vXJ9VvwLdXK6iOCkT+S5GiphaRuEw9+Aa7dODPnGHUQ?=
 =?us-ascii?Q?XXCQ?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8a8efb-cbc0-471c-f091-08d8b94fd55e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:19:40.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpUKOLCxxk2KKGZXt1F6/f5XhZLT3zz2fx+K4jd9kpP4EVek7+g9eQsEbXBgJeMoJ3YQhfhsDhXM9Ekwwpey9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB3769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_071944_947788_EAB15288 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, kvm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm-riscv@lists.infradead.org,
 Alexander Graf <graf@amazon.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

For KVM RISC-V, we use KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls to access
VCPU config and registers from user-space.

We have three types of VCPU registers:
1. CONFIG - these are VCPU config and capabilities
2. CORE   - these are VCPU general purpose registers
3. CSR    - these are VCPU control and status registers

The CONFIG register available to user-space is ISA. The ISA register is
a read and write register where user-space can only write the desired
VCPU ISA capabilities before running the VCPU.

The CORE registers available to user-space are PC, RA, SP, GP, TP, A0-A7,
T0-T6, S0-S11 and MODE. Most of these are RISC-V general registers except
PC and MODE. The PC register represents program counter whereas the MODE
register represent VCPU privilege mode (i.e. S/U-mode).

The CSRs available to user-space are SSTATUS, SIE, STVEC, SSCRATCH, SEPC,
SCAUSE, STVAL, SIP, and SATP. All of these are read/write registers.

In future, more VCPU register types will be added (such as FP) for the
KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  53 ++++++-
 arch/riscv/kvm/vcpu.c             | 246 +++++++++++++++++++++++++++++-
 2 files changed, 295 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3d3d703713c6..f7e9dc388d54 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -41,10 +41,61 @@ struct kvm_guest_debug_arch {
 struct kvm_sync_regs {
 };
 
-/* dummy definition */
+/* for KVM_GET_SREGS and KVM_SET_SREGS */
 struct kvm_sregs {
 };
 
+/* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_config {
+	unsigned long isa;
+};
+
+/* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_core {
+	struct user_regs_struct regs;
+	unsigned long mode;
+};
+
+/* Possible privilege modes for kvm_riscv_core */
+#define KVM_RISCV_MODE_S	1
+#define KVM_RISCV_MODE_U	0
+
+/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_csr {
+	unsigned long sstatus;
+	unsigned long sie;
+	unsigned long stvec;
+	unsigned long sscratch;
+	unsigned long sepc;
+	unsigned long scause;
+	unsigned long stval;
+	unsigned long sip;
+	unsigned long satp;
+	unsigned long scounteren;
+};
+
+#define KVM_REG_SIZE(id)		\
+	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
+
+/* If you need to interpret the index values, here is the key: */
+#define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
+#define KVM_REG_RISCV_TYPE_SHIFT	24
+
+/* Config registers are mapped as type 1 */
+#define KVM_REG_RISCV_CONFIG		(0x01 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CONFIG_REG(name)	\
+	(offsetof(struct kvm_riscv_config, name) / sizeof(unsigned long))
+
+/* Core registers are mapped as type 2 */
+#define KVM_REG_RISCV_CORE		(0x02 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CORE_REG(name)	\
+		(offsetof(struct kvm_riscv_core, name) / sizeof(unsigned long))
+
+/* Control and status registers are mapped as type 3 */
+#define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_REG(name)	\
+		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7acb2e622597..e38eedc784a7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,7 +18,6 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
-#include <asm/delay.h>
 #include <asm/hwcap.h>
 
 struct kvm_stats_debugfs_item debugfs_entries[] = {
@@ -148,6 +147,225 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 	return VM_FAULT_SIGBUS;
 }
 
+static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
+					 const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CONFIG);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	switch (reg_num) {
+	case KVM_REG_RISCV_CONFIG_REG(isa):
+		reg_val = vcpu->arch.isa;
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
+					 const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CONFIG);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	switch (reg_num) {
+	case KVM_REG_RISCV_CONFIG_REG(isa):
+		if (!vcpu->arch.ran_atleast_once) {
+			vcpu->arch.isa = reg_val;
+			vcpu->arch.isa &= riscv_isa_extension_base(NULL);
+			vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
+		} else {
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_get_reg_core(struct kvm_vcpu *vcpu,
+				       const struct kvm_one_reg *reg)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CORE);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num == KVM_REG_RISCV_CORE_REG(regs.pc))
+		reg_val = cntx->sepc;
+	else if (KVM_REG_RISCV_CORE_REG(regs.pc) < reg_num &&
+		 reg_num <= KVM_REG_RISCV_CORE_REG(regs.t6))
+		reg_val = ((unsigned long *)cntx)[reg_num];
+	else if (reg_num == KVM_REG_RISCV_CORE_REG(mode))
+		reg_val = (cntx->sstatus & SR_SPP) ?
+				KVM_RISCV_MODE_S : KVM_RISCV_MODE_U;
+	else
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
+				       const struct kvm_one_reg *reg)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CORE);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	if (reg_num == KVM_REG_RISCV_CORE_REG(regs.pc))
+		cntx->sepc = reg_val;
+	else if (KVM_REG_RISCV_CORE_REG(regs.pc) < reg_num &&
+		 reg_num <= KVM_REG_RISCV_CORE_REG(regs.t6))
+		((unsigned long *)cntx)[reg_num] = reg_val;
+	else if (reg_num == KVM_REG_RISCV_CORE_REG(mode)) {
+		if (reg_val == KVM_RISCV_MODE_S)
+			cntx->sstatus |= SR_SPP;
+		else
+			cntx->sstatus &= ~SR_SPP;
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CSR);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
+		kvm_riscv_vcpu_flush_interrupts(vcpu);
+		reg_val = csr->hvip >> VSIP_TO_HVIP_SHIFT;
+		reg_val = reg_val & VSIP_VALID_MASK;
+	} else if (reg_num == KVM_REG_RISCV_CSR_REG(sie)) {
+		reg_val = csr->hie >> VSIP_TO_HVIP_SHIFT;
+		reg_val = reg_val & VSIP_VALID_MASK;
+	} else
+		reg_val = ((unsigned long *)csr)[reg_num];
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_CSR);
+	unsigned long reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip) ||
+	    reg_num == KVM_REG_RISCV_CSR_REG(sie)) {
+		reg_val = reg_val & VSIP_VALID_MASK;
+		reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
+	}
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
+		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg)
+{
+	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+		return kvm_riscv_vcpu_set_reg_config(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+		return kvm_riscv_vcpu_set_reg_core(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
+
+	return -EINVAL;
+}
+
+static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg)
+{
+	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+		return kvm_riscv_vcpu_get_reg_config(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+		return kvm_riscv_vcpu_get_reg_core(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
+
+	return -EINVAL;
+}
+
 long kvm_arch_vcpu_async_ioctl(struct file *filp,
 			       unsigned int ioctl, unsigned long arg)
 {
@@ -172,8 +390,30 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
-	/* TODO: */
-	return -EINVAL;
+	struct kvm_vcpu *vcpu = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	long r = -EINVAL;
+
+	switch (ioctl) {
+	case KVM_SET_ONE_REG:
+	case KVM_GET_ONE_REG: {
+		struct kvm_one_reg reg;
+
+		r = -EFAULT;
+		if (copy_from_user(&reg, argp, sizeof(reg)))
+			break;
+
+		if (ioctl == KVM_SET_ONE_REG)
+			r = kvm_riscv_vcpu_set_reg(vcpu, &reg);
+		else
+			r = kvm_riscv_vcpu_get_reg(vcpu, &reg);
+		break;
+	}
+	default:
+		break;
+	}
+
+	return r;
 }
 
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
