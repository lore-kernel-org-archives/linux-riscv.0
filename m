Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FF8C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:46:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461BA20659
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xTlNOzA+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KiBAIPLz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="MO9lJ2SE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461BA20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rTpxT8ou3CJN2WwbkkJDN35f9D+qOD6dt5w6uLw6Zv8=; b=xTlNOzA+r6l6PGH/o+cDD3q8K
	WWZGBQd/atc8i3BVbjjCMkYoIM1Xwzwrmou5/8+F0avSp9kalu7DoqDvgFzMsL/SPieox8VRJuyGo
	O4/qgGNrTawo8oKgtceogPQrnLOClYj0xKkWErQgEEqGPyog1vOAPvI5lvDS9F3y4Mq5Bfd7buAZF
	Rcw6W9RBypqceU/ub4VIHWiaiC7daxeNbgBbqqg7hcFOk/MvAy22G6HAmNtzFDRnjBEjYMs86HOay
	INPFg95PdCa8y5pAvdcJDunzsrRlNo42sActxqHUMUVNAFIJbN5wp/pjHN5GR15F8kRIBLHzaaPuK
	V3in8B/Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc6Yl-0005hy-2r; Mon, 09 Nov 2020 12:46:11 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc5RA-0004sK-MD; Mon, 09 Nov 2020 11:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604921657; x=1636457657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UIBmdsMijVnoB86PGXc09lLpFU2SSSkqbdZIhmV4sGE=;
 b=KiBAIPLzLiExVSarJHk22dj06HCa0evLtlNfvkqGnbzA7atwZmhfpjU3
 FPfB0NgI537pjAYY1NmNIQ9xoUi5+/56DAV1azO5sGUHrtazpTPT+nF4f
 nX9vq3ME2Bi6sJmltZLNOJWpz7bdOaQaW8iDa8IsDUXvPiz0ybCZOfChE
 iOivDyy3HjKTcRm+zZyOs2NDeS3NjY3kyOdo8zC5dwhA74IW1RJVfSg7j
 3VHw81nAYI2ZDeWlY3lTVu/yToDUUcwSpJ6tL2JWvgzvUQHV0+mFJ6hYz
 UcZoY2srh9w7Ei0yLzJHqb3niDV2F1Z+LE47cZFB1+yyIsakK8t07nY/Q g==;
IronPort-SDR: B0Lmj5S3lGwhTXYeNBVI952C9dyuNRRARerHBWTN1+hBZUJ0znYhv+ShZMLnpLZz/R8UoMY9mT
 XRbDxO7ZxXy2CHuzzkOtm0RmHXvZ2GHd7RVq8ioqMUMV/Ly75dmyLa4ldMfbeLrjkZDEaE1Bf5
 ojvEHfuHg5RMbXekvcjWe7HDPQLZNPNRtFqFY77G5lSr+66DanmUC3hnrWmGn74p1yl9SaMLlG
 wYvTjkSJpRXvVvfB0hpqn7bNDpXO+jM/D80NsGI9C8Q5ae+mdeWH/H6+ImJvVIxYQjhIfWKS9T
 shc=
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; d="scan'208";a="153382766"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2020 19:34:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4MCRasUlkIjtD0eL3fQHxOHkUkjO+dyHx712eEfFc8xvpKvetwSfPPQkNlFkd58JdpqEH3zVUgOIgbnC0X4tPK7OnBByY8d3Ga782pWGKSeRQ4mlrjBxCqnyYBYPl/fUY49hIpyslo/PdzcxT7OsLVIOtbufaG/LwNkF1g3aRdjqOwSoBsh+jGAVIegD4ecde+fJX/FJm8N1/GLHMS5rHMw8PUINOL4Za78MctzqzYm6gF4fRUPmyoabSbFD3w/85TVZQKZPnvdZ0zfj5gD8M12JX+bRD3f/IiTV5oTygHgKHrGUeaeJ670eQe82zWWQTiIyVMqQz/jHzRJud837g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj0+u47lIaGm+B2jAWE5EMYunC632wWH19d0y9CLShA=;
 b=I/coC+bGDmdGfeyRxhX4LidPXteO3uSCvM3lO8j9l54zWBm09pDwIJbn/e6Zoj9Y1LPvAqqr6ekKzUeoNGhxFtFx0p8j3qBgyN6hpoJ4JfyJV/6Mww/71+WNaT5weerWZcTCsM9BgqT1m0g0oyfJNF6PhBVnpE0tXU5YxBF1A+F2PktOjjkYEB3kSpduRn49SiZtiw9ErN5HdnHkr9vYdLKcP+nq6Uf86SPiAQU4gvs/ME3tPGIGycyqmNOH/yMMImAab5VdOUnbTubmL2Udn3VKr2djseYSa0Pu69d1MIh9f2u6Mastf3BoJWm1YAfRPFhyZ8fT3FWiE45YrqM7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj0+u47lIaGm+B2jAWE5EMYunC632wWH19d0y9CLShA=;
 b=MO9lJ2SEgqeyE4EJxmo1fs+3ZEuXKO8o2O7NkrLam23mcrE6P3M6WrqGiukgvwqrZitom2/V4TRs1TWtQf7RW+Meo/7UdcJmLlkSbJ8kK1/BDKmO5rULhLOoJIaWaMmeYCQecGsGYJXYzQsPYboPrWum6Mk0UubOQnOo7b5KIlc=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB3866.namprd04.prod.outlook.com (2603:10b6:5:ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 11:34:12 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd%6]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 11:34:12 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v15 08/17] RISC-V: KVM: Handle WFI exits for VCPU
Date: Mon,  9 Nov 2020 17:02:31 +0530
Message-Id: <20201109113240.3733496-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109113240.3733496-1-anup.patel@wdc.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.188.68]
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.188.68) by
 MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 11:34:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38b76cf1-b6e6-4ac9-19a7-08d884a36150
X-MS-TrafficTypeDiagnostic: DM6PR04MB3866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB3866E7DE81501DD2AC1C1B478DEA0@DM6PR04MB3866.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyMthL2iUXiOo8N7OcygLP/bhE/1KY37XDas6G+dCV/2TsOwJzO0MMFGMIyViSCpGO250tw7Uzli6uJHrMxxHbr2/vcYHGXBl4i55Rupo53sYn6WqNqMou46bi0uHwhrsqYD8a1bn0MAB0Mb6xlyboo/e0XpQGjzdEOrDsuWIsq6AtfIZrjQ7beAsJc8eWG/iBYuxCwRcgNuAMSv3JEFBDtDvrDrMKfDUMrAvi0iH54nez5mCNMoUiCZggkg4qHj68s8zAkJzS8LN8oEAPu6SeLyJMB/ZFSjU3JebXnrKFCLD86qzHPfvdu+vL5C4DZsqFE4OJfoYcXpQdaqHysq9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(55016002)(7416002)(83380400001)(1076003)(44832011)(16526019)(186003)(316002)(26005)(8676002)(110136005)(54906003)(5660300002)(52116002)(7696005)(956004)(2616005)(478600001)(66476007)(66556008)(4326008)(66946007)(6666004)(2906002)(36756003)(86362001)(8886007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 5XYkx16nJq0xOmU05AxXStrxxrJses1rd9ZqzJjBbWT6/p9Ezjj/N6aQUlL1TiJb/O/WPVPev6E3ZAplBiZvLr56pWECvZg9IFc7D4YV6IpQ5MpAz/wo8CS3CN+aGBISD5mgaWbIDgRTPcX6sxX+b67u18NVFz46D+AgQYXqhwKFkVtk7dDFrt2TNnyvfTdMBrw1Dd6jD4GrHvBNAGT182Dm1+OEbEO1KzH5mPJYdYdnUlMAWh6xPDGaImHbeOb0XAGx6Q3mdPeiPic1vQUu1GZbblV42AiF10TDC0RvgGy6Xd9RNDIHtgfgVgJcudiMwHuIPcTvgDhemG1ga9kfoRbyNm4TRN3YfF7Kwp/+B0U0iF9aEMBkj9HDooSgg0eMOwaq/eitxq6uDlhTfEUT0WG4CY5HFhis3ioJM8V0jtOee5jfp0oFlKIOAFcx+Xua4a9oyZtvZbQg3kvjKxLiThci3kBGOfHXC/jvg+FegDdzEA+eOjvOU/6aOiQhm7h1rZySqvfj7/W7D7PJ6Do4rgCn6JhR00iaHxl3wOS9jc6kqYhkJVQPe6aZV25+1l8tZbsP/bDWi1z7r4V8dNIoSnRKhAbbhcJz9GiE4T1SdgCn30L5CznffGxfanzUCo36REH34D2C0Mzj4bKy3tSCUg==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b76cf1-b6e6-4ac9-19a7-08d884a36150
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 11:34:12.1589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flfMkkHPZdREeTDo+CwIIi97+0oU3Or1anBTju1nLqyafOHo2IUB2y9h5/0DcZdtSIKfxLTO78GVscvRGqkBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_063417_094008_AD531E30 
X-CRM114-Status: GOOD (  19.91  )
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
index 01392dd00284..5b41a12ee5b0 100644
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
