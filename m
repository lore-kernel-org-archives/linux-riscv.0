Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40F1C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA9F60FD7
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CA9F60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTMhtQ95bd/1DQEPAbGX3RKtiWwzo8ig8l3tDGrVjgM=; b=DdhLCTsegdazWt
	0VM4VT0roRk/tUoTkxQ/pbXusz69jbTtNhgkBCyVXuID5tDcUvRDVAX7N+5syGSMMQ1W3zdjiRVkP
	pxmcYRPG0XJD8qYCB/t57DjCFK/+Vq07kPs5jZ0CBwp6GevGPW6x04+jYPHO3lWcu+YDw/tnWFP62
	1cM7BzBpCz1smQUmtlOGlLkw96SSXyXo1lv3XsAzZi/m28zvWzNdr4Wxm+u18p4jBIjsGOfbGf+0t
	0a6GKJkoUT00eio7AxEo9QCWF6Jo+8qGHJ4xnupuUPg6FkgeyYZh8I6c0YmClu+8zgDRgs5BFI20u
	pvQD29WvCpw7PXmzwBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUp0N-002SyO-1j; Mon, 27 Sep 2021 11:41:07 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUp0J-002Suu-0i; Mon, 27 Sep 2021 11:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632742863; x=1664278863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CRrfzWFNEruuZH6Om+ebrLnHtuUHcHAu1c0S22vlEUo=;
 b=QRwpn1jJhvIewSloL8JbfFZ0xkUsrIPaTD9bTn9G9Ylzjev7FGS2XG+M
 WM6d50nAvXxhc1c7aJ3BF9Mel0wi1NOMaZy+qWbFlkI9zmNKzO7coQNk7
 b2NS9B19AVocENcIm9QNKtqNsa2kaaPNChW7GRi7A3td24kNMmguiN1w6
 HC94nxipCQhprWqf75dpMce6IBi0ENIPq5/JxNTtRKGCJCecFgI/tdy6t
 y8gpYqv8CymY4DEaDsIG2TNnD4MFS4LRFPLfDhEbQ+cnVmv7rDeMbynlb
 UWkvsMxX3pm10hS1ekFW7XEtcB4W81ApwU9UcH/hEpdmcFpmgbZF2AYXO Q==;
X-IronPort-AV: E=Sophos;i="5.85,326,1624291200"; d="scan'208";a="180126764"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 19:40:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbSmVk3msr04H8iHJaSRYwVJUseMtk/tX/L64l25/mb8FsA1y+PjgmgnfToD7jlpsLAP7b2SMlqr4VF/kZsD0nOIOodhUaRqddM5I21ykfrECPLfeMpdKD/u/7TkECEoUHyqoNwhL8oqx6cfhvyxNFvqqZgrg9I3g0XsEy4YP61HWv0DlD/31fxh4J9HnEqCz5gW8/O7tJlS0H47H/cLcP8ARO1auudqjTePUpwCa+0g3kNOH9HI0hzUtNtxGfRYxffC1wh+Eq+0FNuFIoPtECHyrP3pR3tvB0AOgqVnCIBzdNCRDuMVFlCwg15Vsl4xppGXpXA+/eN/GliGri7AdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=eOD4Dm28arIgtRQBSGoRweHyef9miFlR6f8RYu1gWhc=;
 b=BRSaLGnjzhfgQsL2dHAAOE0dNi8KgBt/1mxAIx2EgVV4G49OMHoWiw8KG2DiHRITc09e5Z9wYt2AHfDc5k1WjWBkwYuPTPETKBp7BSUcX5lgRrkCRtRRq5tmpIhqoIJtutr4m/bfY3Pt3WZ0N2HLaeKLIvkexZf4GSetYIV+tVn+6m8Ymy6o4yIwStfFPBZrEqPt1A8tJCHU7EzqwvY0F2ZUrAtgWdYhQM9XQzlKwl8Q4A5pLG0likD97ybpNDxqdkXPv5ZjlyLmhmwLl1+agjcMOG4tU2q7Aq4OifEd3M1WQD2IPTADTuXAxEKdmguKuS4/I+J0dI3m0WQdVLmMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOD4Dm28arIgtRQBSGoRweHyef9miFlR6f8RYu1gWhc=;
 b=cHj7WJyXzBl2RjbrSa5D3LliZnsWzxjg4oUe7wevE/xTMEJW5nyhQmoBVSHphGKPWrs3Azi2mO5+57fpV+dH+Ot3XrrBVLcFdLWscHfIyWZANEbg7+b8lgUfnX1IJ+VCJOZfI2wIVLN3o7Dz4foroCwQ7NxKlID8xuFyzIvVG9s=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 11:40:58 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:40:58 +0000
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
Subject: [PATCH v20 03/17] RISC-V: KVM: Implement VCPU create,
 init and destroy functions
Date: Mon, 27 Sep 2021 17:10:02 +0530
Message-Id: <20210927114016.1089328-4-anup.patel@wdc.com>
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
 Transport; Mon, 27 Sep 2021 11:40:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec840db-ec47-494e-09df-08d981abac7a
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB784159FAABC0C9A64132EDAC8DA79@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rj+ES6vFR0055uW2QWOp4T7tFPed/x+3MmF5A+2b/WhE6B08mxkje/pG86DCns7xWM3CQ5GSVCN/LN87GdZwDvU9U1uxk6uvQVoY0CCDVdkXWDBWzR58xpoM0iPEAlfguFLIMoMl7Lugf3aLj0fJaROCVxYJd0UkPaov5Ynnh8q2PEGMHNlz06SuEupAfmtPdmVUDP1w1fj83Ak5gKOvG9yBKEFL8hZtrQn2BW0GUGxvD9ZTElo81P5LjCzNPy3CqMm02an6M1jrlBD3PIsFhgJ59iQcp+nS6Uc8+3yXup6kdjWbYvpi/2vH0yc9/gfP1orggAFLmpmW04HsTf7wWngDn9bT/RW5EoQvJlKiBat3K670hL7jUNF6fCyeQm3ICrtnAuSfmbxhxrgh/CTbeunn1jrD1cb6e8077rf0gXoIMGQPz4rm+L1RSplJYgde8fOaWFpyZN8xJLHS62E98qZO5xEqw6OPYMTMIbrJXTD5EzcgetiFHMa6W6OoXzEvWDp9nqJzHy52DDVG/VjWOtfLDVWb+TmiUJI76pLcJzLXfJHFVEqlFOWe36e5blCCDdpmnBhPTjJD/9nC27pW7Kt9y6clig1Hihoer+829APkWE7H/Fi3Tg3ed5+LKod+P3Iu3t9kW+a6N2/32Z9DmNHheumDpp5iq47xLzu4WhHN0OTSl4O2h03DbBRZbSB9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(110136005)(5660300002)(1076003)(66556008)(83380400001)(66946007)(66476007)(36756003)(38100700002)(38350700002)(55016002)(86362001)(508600001)(44832011)(8886007)(6666004)(2906002)(8676002)(956004)(2616005)(7696005)(8936002)(7416002)(4326008)(26005)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vZ1NEqNrrbuF+aijvkPv3XKPTTahppOvxF+S98Gsig/MisAD8OivZpRSe241?=
 =?us-ascii?Q?yZlpR2vJni6s+z54+VTaDFhSvIOMBCKMWAHIozNDnKevJfGyrNCohDPMXo85?=
 =?us-ascii?Q?VRYuDaBSyavi0hBc7D40aPsnDFIyp0so8eUJxpw/Z0CqjQ9GjjTHAWK1uv7s?=
 =?us-ascii?Q?EnSSilCVyFwlSdmSIPRsBNTucehfsnFUbvDzeRW53mQISs71wG/esP91bEDl?=
 =?us-ascii?Q?N8kvsvrW1xc1dNRCUDHuLCQffzUmmFBLbZKdamZWynkCnhZ8BCSzfdhgYUv6?=
 =?us-ascii?Q?VEqcMo+ZiorTOxJcM/Vn93uDBLLKU/6hZbi93ZUcbwWKYE0bYZuVHewKwRwx?=
 =?us-ascii?Q?krkuEB2I41gK5O6qHD/p+ghjN+HbztSUQVrPi+dKwqPtxNOSSb3H1J4VF7nl?=
 =?us-ascii?Q?fnIX4mW++YucbhpkhWeT+wsOpWWKKYj90QTNdQbi/bbsRYTnsokegpc+gBEK?=
 =?us-ascii?Q?i7xVi73HFb1UVdEdF/Sl89ft8iJBxvG8n9+4fZUZCH8/AW5nlBa5bkxcuzTm?=
 =?us-ascii?Q?B3h+OXotT3/1Ip9qLSSuADeclzcvrx34jHZogCOD0R2zpV1UTdyGef7s46o6?=
 =?us-ascii?Q?eF1HfUSQ8nzsTW4CZJ7aGC9z3oLlMQ/fBqVBzRKf42iu1yTPIStgs1XUCgXV?=
 =?us-ascii?Q?XwMM80EO16hc5rZqFE0Fuctm6rggKXmGEOSirOfixS/rw0nO/7qSsZo/6h7p?=
 =?us-ascii?Q?egDs+b0FWYCbHtUpLemZrG5IweRsqgu6yKejtOne+jTYgpI9yaF4bxvWlpdH?=
 =?us-ascii?Q?KnzLqvcHLQWJQvSFo2+zqeNqXrzyQjTc/bJL7fKLR6c2H3vw8ZEJfjyRKqvq?=
 =?us-ascii?Q?B3YGPXFnDVNBZVY8R9i63V7mDFntfF+ZZol3MY/Z5kVfYjMR5Oy4EMMSzdu6?=
 =?us-ascii?Q?8bYLJfDd+DQODqZSczZyxSUdsuSx8e21nSXAU88BMNQwkVw4dO0FFaWrLU54?=
 =?us-ascii?Q?7ZspKZOkbP7hBG1eBdEyLEa0wbXeSieJ9SuwF7nnjP81VijPX1DOYHpOCCFV?=
 =?us-ascii?Q?S8RN3MDo8c+s49/hJgLfXW7RIrzeLc3+gVcnkuTFyDKIf+txmyoCdWdJPiKw?=
 =?us-ascii?Q?mZRCkV7J+ESUxzQ4R41D4RzhS6Ie7CrSNX7RrGJ9kNaiMzmdMfwzvxqeVQ/5?=
 =?us-ascii?Q?9yP3B7GUIvtHf9pS8IZPI0q7Yob1yl1FIclB/7s4nKkaBmyW5R4gRSPtyhjV?=
 =?us-ascii?Q?Fq+3fD1bI1qFeAjvVEkEqk3Q0oWc/BROMyysOkpuEHzAmXG57EANn3yz0ewv?=
 =?us-ascii?Q?xW/R6qj/zUyAl143IHLvztjAvR59PAjRfpm4EX/mcgceXp+26SLaIZmU9NV8?=
 =?us-ascii?Q?SUSmL8jP1MvtEbnPQiZS7A1q?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec840db-ec47-494e-09df-08d981abac7a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:40:58.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54wA3iu48KJHyw8PHItmLIJi9U8zAkL0cNHT3G8peS3AnK3I9qEz4uL8XMW+FbHkpqQbFpLPq4h36FQpEmxSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_044103_129904_3C067414 
X-CRM114-Status: GOOD (  16.00  )
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

This patch implements VCPU create, init and destroy functions
required by generic KVM module. We don't have much dynamic
resources in struct kvm_vcpu_arch so these functions are quite
simple for KVM RISC-V.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/asm/kvm_host.h | 69 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 55 ++++++++++++++++++++----
 2 files changed, 115 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 08a8f53bf814..0db663cf74e4 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -57,7 +57,76 @@ struct kvm_cpu_trap {
 	unsigned long htinst;
 };
 
+struct kvm_cpu_context {
+	unsigned long zero;
+	unsigned long ra;
+	unsigned long sp;
+	unsigned long gp;
+	unsigned long tp;
+	unsigned long t0;
+	unsigned long t1;
+	unsigned long t2;
+	unsigned long s0;
+	unsigned long s1;
+	unsigned long a0;
+	unsigned long a1;
+	unsigned long a2;
+	unsigned long a3;
+	unsigned long a4;
+	unsigned long a5;
+	unsigned long a6;
+	unsigned long a7;
+	unsigned long s2;
+	unsigned long s3;
+	unsigned long s4;
+	unsigned long s5;
+	unsigned long s6;
+	unsigned long s7;
+	unsigned long s8;
+	unsigned long s9;
+	unsigned long s10;
+	unsigned long s11;
+	unsigned long t3;
+	unsigned long t4;
+	unsigned long t5;
+	unsigned long t6;
+	unsigned long sepc;
+	unsigned long sstatus;
+	unsigned long hstatus;
+};
+
+struct kvm_vcpu_csr {
+	unsigned long vsstatus;
+	unsigned long vsie;
+	unsigned long vstvec;
+	unsigned long vsscratch;
+	unsigned long vsepc;
+	unsigned long vscause;
+	unsigned long vstval;
+	unsigned long hvip;
+	unsigned long vsatp;
+	unsigned long scounteren;
+};
+
 struct kvm_vcpu_arch {
+	/* VCPU ran at least once */
+	bool ran_atleast_once;
+
+	/* ISA feature bits (similar to MISA) */
+	unsigned long isa;
+
+	/* CPU context of Guest VCPU */
+	struct kvm_cpu_context guest_context;
+
+	/* CPU CSR context of Guest VCPU */
+	struct kvm_vcpu_csr guest_csr;
+
+	/* CPU context upon Guest VCPU reset */
+	struct kvm_cpu_context guest_reset_context;
+
+	/* CPU CSR context upon Guest VCPU reset */
+	struct kvm_vcpu_csr guest_reset_csr;
+
 	/* Don't run the VCPU (blocked) */
 	bool pause;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 810b7ef30c0b..7b45aa23fba3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -38,6 +38,27 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 		       sizeof(kvm_vcpu_stats_desc),
 };
 
+#define KVM_RISCV_ISA_ALLOWED	(riscv_isa_extension_mask(a) | \
+				 riscv_isa_extension_mask(c) | \
+				 riscv_isa_extension_mask(d) | \
+				 riscv_isa_extension_mask(f) | \
+				 riscv_isa_extension_mask(i) | \
+				 riscv_isa_extension_mask(m) | \
+				 riscv_isa_extension_mask(s) | \
+				 riscv_isa_extension_mask(u))
+
+static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
+
+	memcpy(csr, reset_csr, sizeof(*csr));
+
+	memcpy(cntx, reset_cntx, sizeof(*cntx));
+}
+
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
 	return 0;
@@ -45,7 +66,25 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
-	/* TODO: */
+	struct kvm_cpu_context *cntx;
+
+	/* Mark this VCPU never ran */
+	vcpu->arch.ran_atleast_once = false;
+
+	/* Setup ISA features available to VCPU */
+	vcpu->arch.isa = riscv_isa_extension_base(NULL) & KVM_RISCV_ISA_ALLOWED;
+
+	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
+	cntx = &vcpu->arch.guest_reset_context;
+	cntx->sstatus = SR_SPP | SR_SPIE;
+	cntx->hstatus = 0;
+	cntx->hstatus |= HSTATUS_VTW;
+	cntx->hstatus |= HSTATUS_SPVP;
+	cntx->hstatus |= HSTATUS_SPV;
+
+	/* Reset VCPU */
+	kvm_riscv_reset_vcpu(vcpu);
+
 	return 0;
 }
 
@@ -53,15 +92,10 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
 }
 
-int kvm_arch_vcpu_init(struct kvm_vcpu *vcpu)
-{
-	/* TODO: */
-	return 0;
-}
-
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
-	/* TODO: */
+	/* Flush the pages pre-allocated for Stage2 page table mappings */
+	kvm_riscv_stage2_flush_cache(vcpu);
 }
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
@@ -197,6 +231,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_trap trap;
 	struct kvm_run *run = vcpu->run;
 
+	/* Mark this VCPU ran at least once */
+	vcpu->arch.ran_atleast_once = true;
+
 	vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 	/* Process MMIO value returned from user-space */
@@ -270,7 +307,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * get an interrupt between __kvm_riscv_switch_to() and
 		 * local_irq_enable() which can potentially change CSRs.
 		 */
-		trap.sepc = 0;
+		trap.sepc = vcpu->arch.guest_context.sepc;
 		trap.scause = csr_read(CSR_SCAUSE);
 		trap.stval = csr_read(CSR_STVAL);
 		trap.htval = csr_read(CSR_HTVAL);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
