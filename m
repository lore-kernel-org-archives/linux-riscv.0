Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF332C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 08:27:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2DF1207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 08:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GpEH7vHZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ixv+DXwg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="aIwKKYKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2DF1207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YEoYFdnPyK7YNikDhw/BcU9wCBEHUYAavTWUoNpw6yI=; b=GpEH7vHZLWhie+rWUp636EAED
	dTHEWRzDyo8BlQIqzaMVPPYzCUbDCLwnPSFDmcx3/scRduo+QRMWRlPPZFS9oPnBPVKUFgFkX0yZk
	um5gj4dDVWoo3fsqiHCUtcM6uqjUSd7j9zDkXTTjNY0NXE3QTNSzicZ4WWZdO2CRaUwwuCwenjzCy
	NxZmg7j6QEQgDSMHfBWo63z8CT48tMvbU2xDku76cdX70ZHiGgc1p9bgIXLRaHBXa96fTjqcWwcwA
	zomnPUdm6ZTsStxLzXzoPO0sB15SNHQOoiNoRKst5X/nSRoTankXI39Ng4EhcZgcsCuQI7ioWBtpv
	AiwhXE6fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtoNJ-0002rQ-QC; Fri, 10 Jul 2020 08:27:17 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtoNH-0002pu-BT; Fri, 10 Jul 2020 08:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594369635; x=1625905635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YOQ+hPCpwSHRidOg5gq/99X9NqVQOChEel3RArp9LBk=;
 b=Ixv+DXwgu8AFkc37Ot0pLN7hK/Qm9fAvT8S42DIJUB9sIyWUA9NW2/cV
 WYBIvxdUz3rlOfOKqz9yOzQpMDZNCbukq4s4f6ibQ/OXPV8v5+4xJVVnW
 9mhVfMKb6hPcLLGawQh9uOlERdTka8qdR+QuZnFT6Xx6WAAvuH1vRHwky
 Dj+slYJTuWJeB3fAWIu9NgruZcK+Rhg/o9+jvfM+8/rXAc1vlUdN5jX2R
 VKAiPZUC4H6Cm9DzRKiCYSaqeifA5POuXoBoze4LAC9VMQPST7lpExFKE
 JiQ2PY41Zh+WIphTQ8hUjsM5ZFQ7h0TDZrUGKA2D2k26WA/cUdxjarOBH A==;
IronPort-SDR: 04HFJO0qRCNcV5+0KmMM7liXS3IZIns4A+Mpil/nhdvDB10NJBRhwq5PBJV6Bz1cd+o460tgTo
 JiLbL7GedO8oFps3ktj5hN/ryKLdJ3th82QjCRjUhhu769nsVglN3cw8dPYYrKmaYCbVYT9uBT
 sj6w7d+yhkzPn7QJB7nNmO3oaMS63UYTu6rRnSBQ0QC0QZulINIneXO+aNwlDXSArjHUkXxUGs
 TtOgVp510vpUu7EJ+fau9ZXU1vm2FqUXJNg8BcYvbGkIBQLVIWn5MoJzh0tjp+k1uP8gun4RlH
 dss=
X-IronPort-AV: E=Sophos;i="5.75,335,1589212800"; d="scan'208";a="251355664"
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jul 2020 16:27:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmRWD+UklhsjKqCkvrNMs+badZx4dJ8aMQtHxT7xlkn8emvBQK//o1alCxZOW1CE9FsmjfueYqJnH9WhYXjzf8mk0KcIHnwhP1dMtPzivlYnFYUUTPewOgjKmw2KO8NfDdH1YFZ6BDgRnNSpmSUlCVgwGGiTDpLXM7kw9BSlXDxxRPJja/6RXlNcCgqm7I/aW/2qOXojbF4EMG5pFlqYM3Hj7xCC1reBF6obKa6I4xsbo+FehX8hJx9NQqoid6nw3EH9vkY7+1WLVFEKq4UjqLOex8YacIh43+/P6qfrxeX0h6wjhTSyQZ5uQeh96KIl7M56XLnT5GEwi5eJB33Bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrwZ2eJ3YiGc7ea+vchq5LweXbt4iL6y/tD5wAvRarA=;
 b=M/XqQRzp4fjfVZA48EdwK3fCYXllyk1yrPgz3EBCKk006mNdIv2fYiX0aQnnsFFEGXLtRLTmK6URH55jdHiQgAa3klBhOylI0LVhMy9vdCIJ8zT27SltdccDxTTyeNp8hy2Rpty2iUPcbpxrg8z1u/Y3xAxhTfoGvFFsJH/5PI+GoJt4uNf3OW1OnBDkZ1pv3VQ+o5mWe67Z7k+BULVtJN4tIBjeN5JJxmHQ7zB3yeQtIUIyXQnzhn/R9XLHcQAH9ar4oqsjzq9AG3kEj8bInTXTSBifZghbIePZseQaZ0TD213xQPuc0LrO3bnhH1Pxt835yj53YzT/2cXktTTZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrwZ2eJ3YiGc7ea+vchq5LweXbt4iL6y/tD5wAvRarA=;
 b=aIwKKYKral4Iq7CjC3qEhyL1yDSnTiluIOhXwLHQ74twEUwLk80HZDiTAaFGYRFHOgmnaACedzA3CugSFz2sPTIC9T93JOI4dS0j/OT+Vj5NchdqMczT736O+IAHAg7GC5RSY5w3tiO/u2a53xxcHkaOhvI+zzdqJp1RHJkNRoQ=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0461.namprd04.prod.outlook.com (2603:10b6:3:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 10 Jul
 2020 08:27:12 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 08:27:12 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v13 08/17] RISC-V: KVM: Handle WFI exits for VCPU
Date: Fri, 10 Jul 2020 13:55:39 +0530
Message-Id: <20200710082548.123180-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710082548.123180-1-anup.patel@wdc.com>
References: <20200710082548.123180-1-anup.patel@wdc.com>
X-ClientProxiedBy: PN1PR0101CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::21) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.15.57.207) by
 PN1PR0101CA0035.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Fri, 10 Jul 2020 08:27:07 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.15.57.207]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e64731f-2826-454e-02d3-08d824ab0b24
X-MS-TrafficTypeDiagnostic: DM5PR04MB0461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB0461A2AB321923D36853C2658D650@DM5PR04MB0461.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 046060344D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PKwaC7vuqO9pVbsJXppvGDx3S+1mLqWEqrB/Y8+RqR07eEvRdtncTQaAG8bJJeULVuQGMlSxfteTP32cjVpN11+lQDPpiajlGqM4ZMcloCuJIq8FnofWWGKOMj9rFWv98hlIt2j1tJ6jCiMLzfFBuwF3y5T02My8D20Y/nBVTuLCz/+qxzYDSSMUpayNgRu/natJvaGhrU7b6siZZntwVrs69dFM5maNyWZzHCMJB9ZHI/PE3OdPBPVxKYDmHwrzrXavQj5kFjG8D/qgJSmiF+zleIGzyMr/ZKlpGDsphyz4q+td1nPgTOrnpeaM86imcwn/7jS08KNXwTYvkyaYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(2906002)(316002)(83380400001)(110136005)(54906003)(7416002)(478600001)(6666004)(86362001)(8936002)(5660300002)(7696005)(4326008)(2616005)(26005)(956004)(52116002)(8886007)(8676002)(186003)(66946007)(66476007)(55016002)(36756003)(66556008)(44832011)(16526019)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 9Sg/3mHNQM7Bx1cop9Yv51P04mQy/t0KkytWoNvBZWIW3vk41xXdd3Cw8jUAOnieuvcRjlwpKUsT5ua+91vEBpsPHO4v6L3t6kbTIZQ7y7Rv+qO+Qqlhblsy7pHAZeTEI+ZSaaeKQEW1jN51rOQ8rD+abOtWhRz7AkFXilcHjNYn6hWS4D8lzX+sc1WtVZjOKbTUIKYJjTbccWoBwtxmVJYrgbV9Z0EyOfh+1mqI3nVYbuQiwvd3M7AfUxkUfrK7n3rSjdD68r10EAcnw9TtOommNKGTSchvsJefIyYkj8xFEgX287fb0tju5Ipiy3vy5VQtVznAESPsrhqVtN7eaG4PKUXwPZVdiX7uFl3DillsiWuKIrhne2UXpM/t7KD/MN/5K+dg71nmUXY3I/RJ8xjociDgdInj7CwA57etmVKdnvoACip0FxgqsEsAwNIbOYroXm55J4Lw+24eiMkLeaWrEOHwK0IO/QXt4IYzxZ8=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e64731f-2826-454e-02d3-08d824ab0b24
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 08:27:12.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYPrOGL98Je+Wq3ibSxlPkNdcsFSqoCauRuxrae9wkjQ7uvObbpjh0qzS+UzZqjtbBY1CwtMaTJlmuGJsk/kkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_042715_599588_FBA8E410 
X-CRM114-Status: GOOD (  15.61  )
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
index 7fd603acd97a..6ef833e29e71 100644
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
@@ -565,6 +637,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
