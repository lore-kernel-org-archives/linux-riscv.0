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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC243C433E9
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 13:28:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5822339D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 13:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5822339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fUMZb+YMOLgMIPkf2DzP/pQbWpcpILepgyVgs2eNNEM=; b=2KGdC3vbDaFJ5FA2DTCPxF/vA
	o9TkJ008RfwEEKRwZOdJHMXMnQKRNwScAYYHINfavr9Tyh150+Kb2xXBAAM6ZGuCVm9jwpnhQxO3F
	biY5IyGpqHE/2f3cMFWgU1Aior0Hs+ocnzYOR3EE3rMm+NwyBNTQzZK4SBN47fnwpaKF7mmX5aLff
	vlHDx4uINr5ATaLgppru4iEk87SDnpeq5QUAkoyDE45xjCGnb3H4j4CW0I8w6o26JV4/BT7Ed9Cwe
	HdJHrvKhgCWm98e77VywTwinxa57Wa0r6CHlGyoOMxdwY5iEOWv+IYN26WNV00G8NHaMMueQ4csZp
	7gZM0R9tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0P9f-000575-6N; Fri, 15 Jan 2021 13:28:43 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0O5A-0001lE-Hl; Fri, 15 Jan 2021 12:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610713200; x=1642249200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=s7/0EWy4yubtzvJ4dohqJWr3ynMErwYSx/VMwjclKpE=;
 b=WPRDLnYyY01KC43xwP1b2uDHtIY2xtQDx+yWirwxT2TaSPWe4jc0rRAS
 dKNJBLNWVgvMzk0FEyY1mRJOmj1f/VFkrbqxqu9jwFpz7yNHcOHfhspIA
 /qfNnCXE37toY5l/Jzq3BhhlnY0cwwFHrJVVtDO3kgFpLw7c5b0YC4kA5
 /rz99Qrql3hnNnnI+6Hdkq7IWeQM8Ek+iy0WHWDskrIqdRpxY47D9oUaE
 mLt3vQXuyRdcV6rtMoOEvM1uB2zM2vXctjkRd4nTiCnydi2UKhvaUer9o
 +Hnvz7cJtZnnLZE2azfZzr20LKshwzCq0jsJEdBLGqa5EMta9tWSs4/DV A==;
IronPort-SDR: m0pnPfm5hPq8qQFPFsrHofDgh8doCo2fF33ah4rM/92jhXYFbMnrDHGP4YogO376JMct340HhN
 jo2I7rz0JL2/cHr9uQtBhndBZC46SOC1lSaZ4OqHJ8suo5UsYFq1GtUiTjO75uMtOoeiTeW0Jk
 LyZaOsodgCghnizFub1Ys67DBqF2ycafAEGQ2KpzNblaFRwBfqo+QH3AYrt8b27cLrYMrq+luP
 AUSFB+BsoOq3pwDvtc+lg5FRVvKMpFP5VZoquP4/K6rnonEoZFVTetqaucGwIvutKZ1CnOn3TT
 dlE=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="158687397"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 20:19:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1WA/ygsSTILGSKHo9WrYfa0WrxfIGh+ga7vuTx32zG218sJiWK+cA8JxuaALCLfo6RUDGfIeWlEYfbaRitQmY3HFGHOWxU8sKH2FVQkEicHyrqeBaSS8nS1+3tFTT7F5jKmrcqhUOMDY9ohddN0kixsYl9jb5VbCmDdXWV7+BRvyeeogIVMUMsIe5FDrORmJzbuO7KnI5QtKpyen5aRKy2iUeA0A2aQfiCXKKLFVbKfdXfReiAPTyA3yc5Uj2tzXksT03ew5lawe2UE7SAQuRoCf0XxliM/mEetvifIe2JoU1g3v7PZBhM8hWBbsNjMOXp/4N0Lj6sw1EJ4BXhrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnZOIvueOy+GgUgxlpSgIkCX7kMrNVHUu+eKWroFFeg=;
 b=NEWB82qSqVvXjEiVyOibBIiL7ksTPIQiRJgr3TVxHMZXws8skeHN4lY+kh9k4dYjSgJZ3v6N9gQqJ5zuq/FeL8Z2d04fw1KFIuJOK/i53eGwfRH5QrPoCZzT2raNJxUouwjay68v9TRJcyVmsBXmIBYbSm3mXr8s6tEBt/RZWysqm2afSstgYLN+QHobqEER+h/DyFY3izoQca6E20hguVxQq7UPTAQCdoo/z7HISU2u5S4JDK8nkqi8Bqbqsq0wUjq+Bxnx99x8ZtHSorc4IUMcACfQXwqa5h9HULZXN1Bu9Ro4sjx2ydLJncIyL8P9ekJZepBLAyWadd/8CZeyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnZOIvueOy+GgUgxlpSgIkCX7kMrNVHUu+eKWroFFeg=;
 b=NvUlllCFlLAeiwXGnI028UV/08U5hmiBY9gO9V+33HQX6t1fY238f1cmEVzapnSR7Uig9Q2gUkqqgzApgSGeFP3a2XtAp6kxhLIDrt2KOKCXiINhYNhJyQ4g/ocTAVazvihLnpPye5UaROjR8dSZexEdVOTcy7Z0bOhVR9/xWUU=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB3769.namprd04.prod.outlook.com (2603:10b6:3:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 12:19:56 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97%5]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 12:19:56 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v16 08/17] RISC-V: KVM: Handle WFI exits for VCPU
Date: Fri, 15 Jan 2021 17:48:37 +0530
Message-Id: <20210115121846.114528-9-anup.patel@wdc.com>
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
 Transport; Fri, 15 Jan 2021 12:19:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80313619-edf8-40a5-4219-08d8b94fdea8
X-MS-TrafficTypeDiagnostic: DM5PR04MB3769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB3769E16A1FDB18206F6A6B068DA70@DM5PR04MB3769.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aMtHQSA2rmQkAmv8BYJW+aNCtrb4n0QARqPbdAc2Qz+oTEbNdAPstpdkfE02k2GZVpovARcWdlz7IwCuJZjFP8OvMZNau+EfUGqTQAC3gpdkEmgWoyvz3APgw4Z2Z5gzegnrrm4RrKfVWlOymHk4Hsq4tO7YPj45gpHyd8Fypld9u6tscB9Wf7OvUJjjEMxQQW+9hykvKB7YAfHVzYrAXxCWzjC2q2gGD9+nO6Vq2M0EjafkRW0WPsojjH3SmCyanqLg8pzllgJUn1jzOvEuZpXULp4x7jYRL3xW4ed/UmG0o5HXlvf/DC8i1D/djyLheNpHjhtlR7g5znd4buvVi966Rtvq53jQ9pqvrdOP9Q4ytLAHe2IxJjZFqjMv7e+1bB2Nbx8ZzmHK/Zfs3Jc6Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(66476007)(6666004)(55016002)(7696005)(54906003)(66946007)(110136005)(956004)(5660300002)(2616005)(186003)(52116002)(44832011)(478600001)(66556008)(8936002)(26005)(86362001)(2906002)(83380400001)(7416002)(16526019)(8676002)(316002)(4326008)(36756003)(8886007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PdS73lM26eFYPV5yDjrY8JrEcjwjtrwB6L5vQKqwnmjcXHW6qZ8CWliI9oko?=
 =?us-ascii?Q?H12cRzO+VQb9GVB3nP0nqSk8fIyst1ngbswqWgsBaDzuV/Pg6wrIyRf8WloN?=
 =?us-ascii?Q?T5LBsgcyFFZvwrCO6LoZ459qxh0jWYd6fMxQDdvOZtqYCWqe1ejU0kYVvv9B?=
 =?us-ascii?Q?NKtgSngtZXzKbthN592APV1CZGJu8psA2IcM6R6jNjeQT12UcI5oG1GA9+Pa?=
 =?us-ascii?Q?lV0nw2bz5HY5fd/WSa8+Rm+TVtfNp6uPgJiv5NU2lcS9Yv8+/123JeiW+WQ8?=
 =?us-ascii?Q?g1cs34vRJNnZ3Uo5qRq3O5nQewnSjjfIyxTgmauqdkbkk6I5UczBdlyy8Cec?=
 =?us-ascii?Q?KsmqGHJOdiCMbeSknN8Jd0BnOqLvg17NmfuyoSPxuGRBqT6SP3Lnap2KIqlQ?=
 =?us-ascii?Q?c4P7X7ozhyL+asV+U/8V0cstjPfi9uVxHV3YwoSPI1jrzpWN/5/2grh987pm?=
 =?us-ascii?Q?EaKL01iDCpSDhsjY12sxsR1DDPqfr/mJ8pmYI7DvZBQFLvBhuCWOpHQM6MhP?=
 =?us-ascii?Q?weRkMAPYSNgPjgzYgAFCyYn96sjUoBpEL1CnB5JhR9x21jFJIQtvSCeQYP3O?=
 =?us-ascii?Q?GM+O2Qqx9lHc4j7/cHn2lk0micK4GuAyIpUBE+jg56/aRqx9H/4Teesutr/7?=
 =?us-ascii?Q?wSJc6vk/K5RM2eV945t44xl7cpR0GSeip/BKEHk2kIXAUY0jMKQBrWMFOS+z?=
 =?us-ascii?Q?QROIpgUnfwRToL2jT+lJt8OhSTFPSS4AzCJ97olClIcX4ssr55P+tywDHDsp?=
 =?us-ascii?Q?TiK7A6j/m6z8esNAoV8ft7I9VEMQ7zA8NS+Yjk4wXPvdbko/69YAEVD3B2vq?=
 =?us-ascii?Q?tPY6ShXzJ+xpRV9LgKpHz3S6erg6XYX8ZN6ZwuitlfzUj9dJnebTzfbfRnsx?=
 =?us-ascii?Q?tIdG9Fs8zDwgH4BH6Fa4c7ZUpiakCTnhOtiNL4E3tvLgEpGzJMgfb5YdeKPm?=
 =?us-ascii?Q?e0VuUzcFD/ts6VHwuu+IgZ0jUdpQ2VDa1awmEokrmUdVtkcUd6pj2V/VgPI9?=
 =?us-ascii?Q?DWOL?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80313619-edf8-40a5-4219-08d8b94fdea8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:19:56.6156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGNlsgI+bmklZIDssRh6sgSYPLjxKfGiCarAYnXj+AKzStC1XAei75MR3OB55cklJmGngmkNBDCd1XMlAB2/DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB3769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_072000_817884_6DEDFA6C 
X-CRM114-Status: GOOD (  18.87  )
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

We get illegal instruction trap whenever Guest/VM executes WFI
instruction.

This patch handles WFI trap by blocking the trapped VCPU using
kvm_vcpu_block() API. The blocked VCPU will be automatically
resumed whenever a VCPU interrupt is injected from user-space
or from in-kernel IRQCHIP emulation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/riscv/kvm/vcpu_exit.c | 76 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index cf99567955ad..bacad80686a2 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -12,6 +12,13 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffff00
+#define INSN_MATCH_WFI		0x10500000
+
 #define INSN_MATCH_LB		0x3
 #define INSN_MASK_LB		0x707f
 #define INSN_MATCH_LH		0x1003
@@ -116,6 +123,71 @@
 				 (s32)(((insn) >> 7) & 0x1f))
 #define MASK_FUNCT3		0x7000
 
+static int truly_illegal_insn(struct kvm_vcpu *vcpu,
+			      struct kvm_run *run,
+			      ulong insn)
+{
+	struct kvm_cpu_trap utrap = { 0 };
+
+	/* Redirect trap to Guest VCPU */
+	utrap.sepc = vcpu->arch.guest_context.sepc;
+	utrap.scause = EXC_INST_ILLEGAL;
+	utrap.stval = insn;
+	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+
+	return 1;
+}
+
+static int system_opcode_insn(struct kvm_vcpu *vcpu,
+			      struct kvm_run *run,
+			      ulong insn)
+{
+	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
+		vcpu->stat.wfi_exit_stat++;
+		if (!kvm_arch_vcpu_runnable(vcpu)) {
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			kvm_vcpu_block(vcpu);
+			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		}
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+
+	return truly_illegal_insn(vcpu, run, insn);
+}
+
+static int virtual_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
+			      struct kvm_cpu_trap *trap)
+{
+	unsigned long insn = trap->stval;
+	struct kvm_cpu_trap utrap = { 0 };
+	struct kvm_cpu_context *ct;
+
+	if (unlikely(INSN_IS_16BIT(insn))) {
+		if (insn == 0) {
+			ct = &vcpu->arch.guest_context;
+			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
+							  ct->sepc,
+							  &utrap);
+			if (utrap.scause) {
+				utrap.sepc = ct->sepc;
+				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+				return 1;
+			}
+		}
+		if (INSN_IS_16BIT(insn))
+			return truly_illegal_insn(vcpu, run, insn);
+	}
+
+	switch ((insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT) {
+	case INSN_OPCODE_SYSTEM:
+		return system_opcode_insn(vcpu, run, insn);
+	default:
+		return truly_illegal_insn(vcpu, run, insn);
+	}
+}
+
 static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			unsigned long fault_addr, unsigned long htinst)
 {
@@ -596,6 +668,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
+	case EXC_VIRTUAL_INST_FAULT:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+			ret = virtual_inst_fault(vcpu, run, trap);
+		break;
 	case EXC_INST_GUEST_PAGE_FAULT:
 	case EXC_LOAD_GUEST_PAGE_FAULT:
 	case EXC_STORE_GUEST_PAGE_FAULT:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
