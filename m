Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5660AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2846060F58
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2846060F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abWfeTJdSPt3K8oKP0K5k+54KH6HO6MHm88+5UvUa8Q=; b=D/0l0tboQaJm84
	vf//Y7fde6eNtpmJKAxbkXg+d9GL3HxUuoxbDXsU8tnV/adFU47pAOc4XF4ywlAZURR512sCR3e26
	tpfYHwDEFie1o1/HratMrrWCpgTpAYrvVJc5zYFL/lBv3Kt4MnyR1YoFWwsN7piTbMV7SkjLJ79Y0
	9fliF85cIYuVpse6TLaoDQG7BPfCjYnM8CzFkpARTp5duA8OlTYX3zlPxRoivGb9B6+d2rENFlTY2
	iRqqk/QR+AUTcroCrJO252m/G2Ax8BIS/qJbBJXoinbfisiYmtAmMyxNmE41m1G8/yw5jcSfRj/EO
	AnCpLA088mtL84nWg3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUp0n-002TFN-3u; Mon, 27 Sep 2021 11:41:33 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUp0d-002T9M-8v; Mon, 27 Sep 2021 11:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632742883; x=1664278883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TgVO4ow8TkKw2c6ixPVwb5+XJcMNIDBIzgEMZ2jYYB8=;
 b=F1E6wQLrMKguc/Hy37p3R6eYD7LuRa56u9zb9OycPMnon16KMCUG/b+N
 cTK6H6QInprPPz6PJCXQ3SD2woU8dTKIz3SOJy4azQntAc4wG3zkw8n/L
 h9Wy9cSrD2ngo3cnxVNsk+zo8yg5VesKdDVBu/2iwAUPMU4imQD7jJIAt
 9mu8/LRaBMg2luHnv5npXbHwCI02Jv0vum75CLFqfWoC8d3GD5WXL2bwl
 w+fPxvgmmi/woM0Ho1noDRw7HtHclWYw6+kzrGQ9o7VKNyhrG4zu5BdQb
 vtCNNRK62WsxBTDMXTyHlf5BuX8qmk2BMqwvBBk+g7vQyeZ5izX0yz8wd g==;
X-IronPort-AV: E=Sophos;i="5.85,326,1624291200"; d="scan'208";a="180126819"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 19:41:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUJ+fstrIi2Vcdb+z3TLiUh7qA7DboCTizMikszgAlpPkCCkVv1I7zrzTO+eVrJzgq96Y5tc/hln5AtdqBaAkAcTGRIPxWlMSH0hxMjU9KJzzgzF/XjUQ5Bgu5oJ65Ta0wQONolyFJm2NFCPWImoHvx+CQvAJhbVFAt03XTQOVJWQZPGkWt4hcgvvPaLID513T41rX3jyY/YrMgwEsxRVxYbYCO8X/G2T/Gk6slDmkvjrhFLQ92LL983mbhms3nfWbeECCBwlGjmcBDLbKGAQ2QJ/z4yfEdg52ReBXIDKFpL29rIDNe+rk3l9YQu52n13DDNQxRWIRAw7TFb3plBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VigXoKB57An6wY3dD/fFNkIyei+PEbA++o9l1gmFalE=;
 b=h0xKMXnYWBzpJYreXlR5te6McuOGPEU9CiK7OqHUmiGyfOpybGCSLW5Uq65sh0d0xNjfkIGJeBGkkdJuV8mPIy9oaq6ey5bW1gUUkFN9mMiySghVmDsxV3yxZEKr6qcFRvkmDJHsX+VBEIPYgRqc2g/zO+3VSJRcr3cw16fAyu/QXBwMAttjASsyGuxwsLQ2PyfUVAIIZMnpzwJ02+FsY8Jz+iBIoQ9BEQIxROd0s3FbQWFxwjIHFo+5eewNsysP2JrqSd4m5wzuxOLc5GcrBsttSOFRlzl8Y2xmVBcXV8JPPOmleH/2dDnosnlR4hSrvDx+VoEyCiryNDXbmVetPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VigXoKB57An6wY3dD/fFNkIyei+PEbA++o9l1gmFalE=;
 b=gVwwlK0zWb5VIYlOnzw1aqP0nmAcypEJeGPIm7VxiFR/4KigxEgh3TuCV69dAPGl45pTQ65WfTXoqDywTWBQC6RIfkV6EV9lNYGzmCrguevNmu5Fyc/dnLgPVEeP7gaNXWHcP9cd5iqYC+st1sBAGVZvjWM92VpUjMwOin/h34g=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8236.namprd04.prod.outlook.com (2603:10b6:303:163::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 11:41:20 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:41:20 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v20 08/17] RISC-V: KVM: Handle WFI exits for VCPU
Date: Mon, 27 Sep 2021 17:10:07 +0530
Message-Id: <20210927114016.1089328-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927114016.1089328-1-anup.patel@wdc.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::13) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.75.205) by
 MAXPR0101CA0051.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 11:41:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba24e6ea-47bb-4ada-008c-08d981abb94f
X-MS-TrafficTypeDiagnostic: CO1PR04MB8236:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB82366BB1E3A5AD6544C95A978DA79@CO1PR04MB8236.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KB7f9pBz3AJEoFWO/kJdON2QmBCtiXeJAZs+BVkkPQSSA344vlzRWctjXQ+PinxZG7MzZWXj/dO2x6rUWQIALWvE/p07EJmkULa/jSNU2clT52NEeDpMr7fO/DM+8tpws6lFO1LXpAs9vpSwau82EFDmPU+43CULINq8l10JpgQruv7I95aY8ExFOKoZwrh7iWhj9nZppP+w3+ZVCBeGOTPHFhrhHShqqdhVfUYoUvoScPCpYr/JlPFmd42YdOAN6VM6BZEO0VmzBBTXhxPaHF3fGmlVtfGN8d1+cEDBeqbkyHw5Mu1RnyREkmqncFGYYai9B8zXkP+2hyeNulwYRXPtr71cKCmyoAPGB9uY4XPsHRp35BBLlcA1/cdmgrAPCpkaMgXBzPQPc1VD09/ef7Haa/pD7vgqVP6XqWYN+zjYAvV1PO4d6Q6jLU7t+7dFVKBNSyptN2s7/t9ndSHnQPHsyb6p3G1P180QdSc8CX1H/swK1bLZYbqo3R6gY2PxoUeobuyDEVeLgqn8528CGbZKgbJFzvqaqKeJqKEhHetv905JKS7g1y7wkUug5yDYeIpIL+Ry/XZCyIC47wV0iolcYM3rjcN7ey4FDJceXOIUOAFF/IikSPtQCn11I5Ot+rtqyqbZDzT3Dh7dNrlBO0KKlwIGdZwZiLDdCV7pAA6eYjQnPGCaQ6P5A82rQonh1mAamZ3SEjbRvb/CR4ERjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66946007)(44832011)(38100700002)(54906003)(110136005)(186003)(55016002)(38350700002)(8936002)(508600001)(7696005)(6666004)(1076003)(36756003)(66476007)(66556008)(4326008)(2616005)(5660300002)(86362001)(2906002)(8676002)(8886007)(52116002)(7416002)(26005)(83380400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BRv590qruwvT7eIzwLSggwRsl/ZZCOOiXgYMckd6mKTc0FZqKP7zw4AL6+OA?=
 =?us-ascii?Q?cq7Gqywz3/KSVTOJSpkziPRoQMaCAkXT8uo5+zWuj46axxjti90EJ0gm8JkN?=
 =?us-ascii?Q?cbATOraT+I0DJrdznsaca6Scs9jd7u1/JbUNtxtrN0jlnfmM93PZ4apOpsN1?=
 =?us-ascii?Q?8QLli15JYM4q9NuDVNzlERSFI1NvaoRs9/Kq3+f4+aH6bHZkFjhIfjx/lgLP?=
 =?us-ascii?Q?M7/9knfvfC+YuJXGEqXhNQG1z76XYqnsYf6Q5w2NedrnS73+z+Lx+I6urUpv?=
 =?us-ascii?Q?r4hYFRvxdrpB3cbnDBXVtdo9r9vrqMSZQp+5WsSUW3t97/5gsv0i2fLOeCaz?=
 =?us-ascii?Q?TFVim4u5hjyNpLPRHCbqktIWLHTWiYHo+v8gfop66i+TdfMHuOZd1DaWQI+r?=
 =?us-ascii?Q?mvvgDAlMAwvO19AUdl6BckgCJkTipRY7zdK9+X+POOwVOy6t0JExFgpIycP8?=
 =?us-ascii?Q?21xx/6E4kLtafNqMADalw/w+EnjDANa8wxPzmxmqo0sxZgPoI4y6eSjBeBwx?=
 =?us-ascii?Q?l0juAII+Z1iH0KYSSWlyAt+qGQ1z/G83jfigC0HI9X7szUyyAhMMhXF3EQFx?=
 =?us-ascii?Q?59P/ScVSCSbtVJqajNSPq97h/GJg6LaH2R6pRi/j6eXcDbFUdYiof32GkTMN?=
 =?us-ascii?Q?gntJ87j/AwaMFGBBLPpgvzDjKpSkOHJOap+nz8noDbXoGuR2NlsWnNHpLSkp?=
 =?us-ascii?Q?gNxNaDQvO6Lx6q1/nmMv9BUzL2LryOfRTEBddVjQ+OpL/y97MNTiXLyDtJD3?=
 =?us-ascii?Q?pOs1ClFxKHZ07drF/vo5B3gXj7Q/W0zlWdeLSVuFOj6y4ZWFpFnK7dGGtO4S?=
 =?us-ascii?Q?NdX52+/RwJZTfvNACdDj3lTgFV9jduExNk1VCGfvPPUYXR9hd3WPooITsqm2?=
 =?us-ascii?Q?byS2Ov+iEXiWQaXUT7VnXXHEco8tMHnS93LAH5cv7srivFbiAQUCm32bd1d8?=
 =?us-ascii?Q?t8wh6Q7ca47AONi0tHY9H8O3ofWZ4qEu2WRKfAcuHEjIxAoOZQppfEZ6L1iR?=
 =?us-ascii?Q?mqN3lFyKKG7ChkRSjy4dmpQ2UtVrPdrvO1dx9S77+5a+bqsCUVu0A0Jq3bRt?=
 =?us-ascii?Q?wQmTGui5ALL+U3nZTdU2Is0V9c1XIL/acZfO8wfCxWSMXYGBGRBRfvP6kHnf?=
 =?us-ascii?Q?CNBv5R6w/o0QaUiwgIW7ONP7aqJ2kb7/mwnlL1ahjYZ/51yIrL+YMKWSCNX1?=
 =?us-ascii?Q?UI720CcniqRLN/hfJc/w2ziSJo4+ZmZX8JgRkvsuMyo0j8Cm7vWM8ZY+UsGP?=
 =?us-ascii?Q?qs99cbktNMGZsYUVNHXtyxyqJiVxMeG/jtnmPkL2sRTA0oDtfDyi3SanvI+N?=
 =?us-ascii?Q?OmtwzHXp3biMdTisyoW6V83u?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba24e6ea-47bb-4ada-008c-08d981abb94f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:41:20.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDqKS7O1z60I8j+EhaTZL2yqf3VF9sxz4ISn0BN3Jl8Gp4XU4R0aVUFYubYo9SkRrxmE/jElJWFH3gwp4l/gYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_044123_392095_E23E961A 
X-CRM114-Status: GOOD (  14.84  )
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
index dc66be032ad7..f659be94231d 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -12,6 +12,13 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffffff
+#define INSN_MATCH_WFI		0x10500073
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
