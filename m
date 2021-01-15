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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C1C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 12:22:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6579223E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 12:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6579223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7ClDyFx7wJ8gXMsSYHnRoSdEhxSymrnD3sSPLB5Qpc=; b=r3nc1JqCpngrwNxZzgyp6w3If
	22FhEwTRq/ixqtJUPAoUddfrRs5hpVPX1MwJ69ZOaHnyMvwXF/JLgQ2ruqtLI1f0D2RXlkydC3O+O
	sCWicsFp6p2kQPZVmu1I3G50qukWmSGbNT36DXiFDfVqWAcjmiYug6B7chvXJgRRgOMpgc6lL3yk7
	FO+kWYYHssJC+31CMv1dYvZNIh1ped2cb//WDRXrGy6lEAfSsH85V6dfX5p/yBd5FSCSMRy5nzF8E
	srd5eTueTyK/u7WVyUJxcVYovJv1GwC/qWdQG8iXCXZBXf8Tvz1OW7Lk8OfumIZqDbwkJ5RFalPNk
	jUOoLExSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0O7F-0002lE-2q; Fri, 15 Jan 2021 12:22:09 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0O5e-0001zq-Fw; Fri, 15 Jan 2021 12:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610713230; x=1642249230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Avhe8xRg37tbBK+gtU/OneZO10+fWOTIrNRB9I3H28I=;
 b=Bst9Sk2Ycx7rMgnXtI/SuJRhVtMJb8/wlnSqCswXrYmtsCvSph7c+UhA
 I9qQkXgMcTAdDGFN/PAMs3QppHw5lKBRUzab7imiTrJAeHyDUO2EnKfqt
 apLKffnIwjTStuWAc7S7kcaY3NyAS1Kghn++AXJa+bW5OFEQTDt7YIfi5
 +Qt0olPNopFywoVIT8vQey+II+Bob0Uy64QCEDHOTFkdn6ipOpcxjq3+K
 eITsWHFjstjLDzw8qmm8gYDAbGSGDPjBPqNZmYfIT0gil7Nt+Ae7r+lmJ
 k9fxUGwMMeYn3K2nAgmBHl1Wmr8dCnJ6ealOsQARW+Rd0HSmXISgXug0P Q==;
IronPort-SDR: TNCyBwrITsyijKPr16LzhoIGyuG5sLgkiLMWwJ1l7GgABJmcb+cp60txSsyiLD/tWo86eldJ4J
 fLmgKspA+dngpc563OAN+Ol4rl1KgcnFJdNBL6feu1C3uzSyDGqffawjn8uHiUI0r/JcXGQEoC
 UVnPsLRgy+IKx2CGB5MuqiV9q2CjSkVA8oL7gjfiRHfY1c9fv/Gfyw0Xfjj/PYODZNNCLpc82C
 qch5dAeqeBYW72G3UOOuAY35jz0J36UheOXSp0dIQCdpHzDdjtFUTz6B5WKm3zP7ccwBFLvCE3
 kmc=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="157507140"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 20:20:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgZQFQFDqaTtUqNPpp++0Ys7iJGZkdRT+3/c/LenpOcAZW4ty3YOVbi4dDXDjXnpooJkdRIsGRrTwvgOrdyFhYo8AadajTWfSfLLLxmLkLmn8pPgCKQpOgQuX9zWpJrobfK0HhFDKNRaCFP1cidRsLc+UG1vM/NNQ8YGq/mQdRlg7FAmuXHZuWq7d3X+mTCiCAn1v/bGUouUHh8uUbQQ30LH4S6qmWzfVxuapsE3SgaZy5kFqas5K/aPFoC6W5lThGkiYGfOi3ORiN3UGfQnSzj9rcDUCJLUapfPY1sUswEuSu6BpNmbbaalDxyDxKLgH7dO5gcSoK2wEx0CAaceww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rbY6Bu/pBIzW8MEDBdceVbFC0gJoZKzAsnc+vEk3jY=;
 b=ADN5SitsCTh2xk6CexoK5OB+FstvRM0pUhnX658dTMWJ3e7Ncj3oJsYWUoNKSF3KI5SiYDi25XYlbuczI9FbOE7yU1EKdGzkftqwSZyIB8BEKirOeIDZwTnAemHgdetvEU5VkjP3cm/o7jG9u+absFSVDWkwSwnP2psaVgUtGmEvqQlh1Gg6MN9SFUHJD3sZiinkQeOhDhAcFZGqR+td1GpkXk5AQFqEvQq46FH9ltTmXKZBExqH43ntbNbCy8W7CMHsrgRBllJU6CoCZKLqx6Ob9J/VizuDX724KIV0mG7zUiKVA2qJ6rKINEF+wabO8uDubFy/zs0SZl478bYSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rbY6Bu/pBIzW8MEDBdceVbFC0gJoZKzAsnc+vEk3jY=;
 b=MWE2z/5yRT9/uurtGQLwx+vm/MR/OcpkNKSEoyxHoOKoQMqJxEVmm1XHtynUv3VuU0PLf6O2js+ZnT6MmJXqt8xXpjmVznR6kuYBYQ9uzQZK5ZvqGCuLQUr3x/Wo/C0yLaHSgXff44vHR9Dn1yNdqsiaBTGW6R6YmUn5j1PfFyk=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4330.namprd04.prod.outlook.com (2603:10b6:5:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 12:20:27 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::2513:b200:bdc8:b97%5]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 12:20:27 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v16 14/17] RISC-V: KVM: Implement ONE REG interface for FP
 registers
Date: Fri, 15 Jan 2021 17:48:43 +0530
Message-Id: <20210115121846.114528-15-anup.patel@wdc.com>
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
 Transport; Fri, 15 Jan 2021 12:20:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c8e5417-10e5-4d1d-6499-08d8b94ff159
X-MS-TrafficTypeDiagnostic: DM6PR04MB4330:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB4330C7CF436CAAA5D7F1F49B8DA70@DM6PR04MB4330.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tabe0ciHIWDrNzql/2ATb8f7icZ53Ro7PMoIIUNl6BWtQEfbidZ84qjlvN33jrPfMRrVFgz23dBxpOwf5Uyt1HGyePRTH/4VVWmxjzEVA6zxzvCKmvL48rh+7YubSZDVpsEdVsY+tP0uBe4GPqj343peWUFnvoD8ukeqbiFL8+s2PI9k/LGhIUydj/rYH6Jt6TEtIHlk+vAWW5trygI7dBStl+eolqyZEGkHsMR1I/jTXgERdoz6vB/RqKTSZcj7EMV05zL7ubYw52/xQdSDl0OA6W/NjqiRwZNLmj6XJsrPPFuTNGRvz1lDMHyAOitzjyqz/rv49Zqr8phOfHmxgZl34w0ILRNc89HvQV90hf10GJh0JJlhcip5BOR66jsxDN9caXpkF1a0sFBloQOOJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(7416002)(66946007)(316002)(1076003)(66476007)(8936002)(110136005)(186003)(66556008)(86362001)(16526019)(36756003)(44832011)(6666004)(7696005)(4326008)(26005)(52116002)(8676002)(2616005)(478600001)(2906002)(54906003)(956004)(8886007)(55016002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NjVBpIIQBbkOXob83ejxnTmZaLXAk9xJHxFDp1JpDNeHymkzahFd+PTgkOF/?=
 =?us-ascii?Q?ItLfOyFdOHOu/yS2D15XupX0dd6CwyZ02F/B0LkpSfb2tpgtg2KcsnyI7gTM?=
 =?us-ascii?Q?v8+e+EZxK2g7gJY71cG3B8q/rfy0eAB8xlBKAilpkjPHFl6/u7aLOQFfTXBo?=
 =?us-ascii?Q?bP0nUNySRIKnE5VcaVq5VsG7ZDCXs9C3WToOffCZSq6uMvq4ndzHtlg7AwNd?=
 =?us-ascii?Q?RIKr/klaxsfiOmpIfXIJQ9mOhHktYXKQimy5+MZA2jT5JxeNmPcLu9PF5d1F?=
 =?us-ascii?Q?ftnVgxJuwqUxVPBLSBsXTdY4Hl7YgFwfE0fOYGet2imbBlgTlZH99+xjttqS?=
 =?us-ascii?Q?qxaMn+2i0XBQLpQhwxifMxCXVSgNliiIbv3W/o2hCwm/ZSA9vDfVj/gpN8nb?=
 =?us-ascii?Q?8ucqimZ07JlbZuUp/gRB3qqx9SzgAeRCZIw5I8spItDb77Z1SMemAdbnjfNu?=
 =?us-ascii?Q?Lct8KUs4FmA40qYBx7tROsud0UNNOX3hL3vxIh1KyuKhbNiu7ZqWdDl49o0E?=
 =?us-ascii?Q?sFi4NY+cerrsTVpNs8lCGgiB2Z5Yp4Z8zIHGSfmf2qTIVPcGSMFIMWfXdmgH?=
 =?us-ascii?Q?rKxv3WfLmNc3TTNcoa2R1NVizMjEq5LAJa3hfZ73rIW+Ezh7anP/QvwmQ8Vo?=
 =?us-ascii?Q?0gAOYi2kfAyXxfFEpEk6NB6S5mOqQ6D7sYECpyKNxeuzZFumewvJUxI8CQp6?=
 =?us-ascii?Q?TkI7yDrVeCIrpv2rtmboJHmVonqIlEoU1kC7sK0rnrWKoFYFKWvJ5pRbYXpE?=
 =?us-ascii?Q?wuf1GKopXPIEAiUucLr1UxbvYTxVegXkYyj6KDu4acemgBI7LhMm5Wexh6XG?=
 =?us-ascii?Q?pKiinQqhm9ERPCLNryK79m06yDzxpCSZggHTODAiT0ncXdTFrlYEoEDbK6AI?=
 =?us-ascii?Q?Ftfr3tlGyR+w8gCmtmhvuTvxFi3Tuncp1NWiXhc41OTYe+jNMAM1P48B2oNu?=
 =?us-ascii?Q?XQ8OJMUL1R88ICAmRyln7LqbIw9igETZJ0mwvpAC7L9BpWHUyUtVX7DSgTNf?=
 =?us-ascii?Q?XKib?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8e5417-10e5-4d1d-6499-08d8b94ff159
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:20:27.7766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/zstFQvfQrvPo4pfn+wXyllElgXFF1M8ZhHGs3T8ccITYYmZ1GE1G9BY67PBfNSg8NuMvF8QRw4oxbMXM/daA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_072031_297515_5878E7DD 
X-CRM114-Status: GOOD (  17.86  )
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

From: Atish Patra <atish.patra@wdc.com>

Add a KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctl interface for floating
point registers such as F0-F31 and FCSR. This support is added for
both 'F' and 'D' extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  10 +++
 arch/riscv/kvm/vcpu.c             | 104 ++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 08691dd27bcf..f808ad1ce500 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -113,6 +113,16 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_TIMER_REG(name)	\
 		(offsetof(struct kvm_riscv_timer, name) / sizeof(__u64))
 
+/* F extension registers are mapped as type 5 */
+#define KVM_REG_RISCV_FP_F		(0x05 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_F_REG(name)	\
+		(offsetof(struct __riscv_f_ext_state, name) / sizeof(__u32))
+
+/* D extension registers are mapped as type 6 */
+#define KVM_REG_RISCV_FP_D		(0x06 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_D_REG(name)	\
+		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d039f17f106d..2d8bab65dec9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -431,6 +431,98 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -442,6 +534,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
@@ -457,6 +555,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
