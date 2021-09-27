Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B26C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4813611EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4813611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEQvX7tvq5rggYFUe9IsSQSpwplqAQBa7wBk9K9LiE0=; b=2iDPvvzI6XcNrB
	fxESDNfu4mtkI3A5n6ufi6ml1LSnlP2+aXSuJt425ex+AJjZnmVv+5vf9kIjCGoUH0UBO91hEKUeH
	hpHh++6DHctN5iR9X4sw12VkStxCfAH4LyZOwsyeAP4D9vEsm0X9Gxk55J6eUBf3SQWy8x8bk8YuB
	nedhxlv6loy1KlZIxNaM68S12kbIX8pEHkD4yhvWtfINtw9KW9Ntqi6jeecnyCulsaCTlKrTxogby
	A4QpXVi7YoHk0ZFVPIZ5+d0PIwSUrC7FJQupG9ulcWm29pRwhFulFeqjmrBg/3Sh5s1gdgW3NQQoc
	e494IyOcNgEXo3HB/Ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUp1g-002Tp0-35; Mon, 27 Sep 2021 11:42:28 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUp13-002THb-Se; Mon, 27 Sep 2021 11:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632742910; x=1664278910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4KsTjIQUvXEn0rOHg5RnOrJX0tF08bMA6pJRumVg9Hs=;
 b=R4Lw5j9/GgxR+2nl0vTq10daQmh2fOmJKuiO8BWgosxPDP7ecix8vs2e
 QjAf8tiVbLg87D4Pt/ZNVngpNLwXheWR6/rfxd0vuv1bDh5HijjYv7PoY
 P5AxqBoS1NaomiHzJgqnm37c84YgjbySsduvsh3q4pwye3JvzRV8Fb/Nb
 bhDIQxLXJiVeSY1rBNicDowHJrHoE82maTQE+4eJFh+BV7V4vOLcmKtb9
 4G1yakCBTSws61Q2vu607V7A3THcRNK0AMalJcF4PrmuKPEPsNkHeXw9Q
 KDN/XfYfC/wuei3Ui96JOxM4rojk1IuR8ax7nHCTYPraBCyQ1BGXCYPP0 A==;
X-IronPort-AV: E=Sophos;i="5.85,326,1624291200"; d="scan'208";a="181673100"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 19:41:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfDwIOQxn2U24evsCUGm00IzP7j7lcbl/hapl6LB7H/iYC9W7+H2/IYjJOmmb7kaIvpqCMUFO0CrO1zoLzxYHbFvGdwDVzQSOFeDRUwxPb0rCRSDJPrhewBBVh2oLEEI8JvW20dCft71dLDNNp+vay7xRWoimyd4TBnjQlOnNbWbsjW0dN0JbpWcjBPs0qHwgvV3h1GASAPLXQo6Iouhj3V4DA+IhE7CSE1WRBKXhX53tmDFxK7DmRkX4DBaiZfF/83g8rxGbAdS141kjLPD4Yah39m26J1JIjGswnBEhTEOwrDCfM51QKyacDP1/a0BbI0f2KdQ1bhC9JXHgoZ2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/gs+BVGd0elUS8sT4dzhNljOdQQbAPQlc3OyFhW0Ho8=;
 b=oczO/YXQeCQx6OXpBHo0i1xzLd64FJy38kQwAL+L0fOy/mvmlJlpiB+Ms0J1X7QhaE4BcEszjPX2sWbnpsEDmfKYg5WF5Oo1FGZjWDXry/+ipT38G19/nSgUTim7ALsyasJn0x9zdBfqstRir1YJ0uvaYrOGaGvyg5gwLJ7R1naS22+PYDukuijfIhhEgtO0WBw1NhIOj/htPiVOq72MfgIJhyGUlWDM+FQrP1PY25ganwUQu1NCKpaQ+6jfvfufuYEzbWqnb27db+KC73S+lRF5Qb0nycvHjCRP77HRaFu8Lli+wnvtxVc1yGresVLe9TkhUT5i9No5fSroWSR2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gs+BVGd0elUS8sT4dzhNljOdQQbAPQlc3OyFhW0Ho8=;
 b=O+E4DB/wFlOGmWqSMAFLIOeR3aTRjI/TyiYJhq7IX/TZS4+GoMTTnyZIhHnQgYnb0pN05mz3Ui4jKmB3djLwWAv9HY4pd34hG+e5c9aZnxKyMm68EBq4kROou4gv8eoTB9gP5gzUUWVsbXMl2nFL6X73bgrUjU3p0TnhyaBPQnk=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8236.namprd04.prod.outlook.com (2603:10b6:303:163::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 11:41:46 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::6830:650b:8265:af0b%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:41:46 +0000
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
Subject: [PATCH v20 14/17] RISC-V: KVM: Implement ONE REG interface for FP
 registers
Date: Mon, 27 Sep 2021 17:10:13 +0530
Message-Id: <20210927114016.1089328-15-anup.patel@wdc.com>
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
 Transport; Mon, 27 Sep 2021 11:41:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c240570-645a-4475-e181-08d981abc914
X-MS-TrafficTypeDiagnostic: CO1PR04MB8236:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB82365079A1F40759FFD46F0F8DA79@CO1PR04MB8236.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kec+8PDS/szfQe0msGTBncU4CUIWzu+51nUjjctlCbbscoz2UTkba+v+E/HoaGYVo5emzCwzZtDWjYWyUtVIu2kagh8aPjtpqCOi5pXLwp+X+KWZuLXi6XTVYJS59m+hKGCvg/IHpONnJJIKaRlhchm2hEV4OY8UYrjU7gmZM7DPduR8YXSnScxe+fVZqzRtkIqQ6rjS46UaXNO7aZ5mz1M6QuxksqEYK1mc/GW2zzizSAxSGBm45MV7LD6Awv1xY4ue/H21Nr1UI7/8jGZbM0Z6PQ5r/8d6Ht8C3nqYFPloSpzCAuDWEgQ7rSxw68ECzDFOfSPjPnDyg0ujSqoMc1qkvlfXSFypBNkzv8wqVO0RNGJnBH0j/u6HDxdKyPYRrK43+SyTLxqsSRe2GKWiiGWgLHZsm2C5nguV5ljzW/M1fUXouljAAGyxrDlZ2v9HbjYAA/mCHu3w8p2TsqHLf/uX9oF+sXb4eo1jluMe8ZMwW8yj3zSNqE7Y9GyD0CeCJ7ilyIuyd6xz7s7umOjypFG50OLGBDtU+lqH+xe1EUOpt4M/CRcOshEHq5jkS0EBvgWefbQz+jaq+DFGDOnsgpeX7kbLIhi/GLPc31vLbEKkVC0Zwzpt+76ubTgyoWxKbyynK50FX4tSkcWcor0brdWXtqO2wXH4/6LypAji2m+QsGU4j8SoI/pSXOgysnIiHLo0QnZKjhpyMRNXc7Q0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66946007)(44832011)(38100700002)(54906003)(110136005)(186003)(55016002)(38350700002)(8936002)(508600001)(7696005)(6666004)(1076003)(36756003)(66476007)(66556008)(4326008)(2616005)(5660300002)(86362001)(2906002)(8676002)(8886007)(52116002)(7416002)(26005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXIB7o2SZ7l5ORJoHhmuSyUzbVkI3mGKFrVPbxOS5SWLK+qt4tqD/AhC94bx?=
 =?us-ascii?Q?S7i1ozwE0Z7GnlOaOoO7qwj0Sw2XPSE8Yw5r6o6MQg69kQurc2zGM6pJsV6+?=
 =?us-ascii?Q?nsKbjFb83nnb/ERDB44n2JLaLK6iOHJkDCnvEFvhgji2lV51tQ7p7OSyxuP4?=
 =?us-ascii?Q?v04EVNTEwAhfARZROR1gYBIKHwvKGPlntCffEE930xmdkZzWv6uBT6SVtvSk?=
 =?us-ascii?Q?N8mUn72mOEtJUHY0B0EU6azZHeRgb57MbRJSDKIsSWprSKTBaqOdfrqCT4Th?=
 =?us-ascii?Q?5lJatpc1lXrkVy+vxSlffu8ecO9vCzPoLu8kgzvni7DN+V74jazETiWkB8kn?=
 =?us-ascii?Q?pu3TiHIbogPOq87jFL8n3qqc90tCGjeMWNF3DKJ0tZbILngQH5e+mng4Aah6?=
 =?us-ascii?Q?xlTlxuSaKs/vnppRztjHNyx9lMwGbxEiJYYaoqr6TVpLqViWWo18QJ6Xvao8?=
 =?us-ascii?Q?I5df+TSjWFqLUkg8beFVLe6BepVIdnJKYxaMfppZxXaMHZWQp7Qs8SCWnUrp?=
 =?us-ascii?Q?9Yz+3Xk9Qe6iRCqTZX9apRF7HK+Wh0wb+iR0YNUoEvi+1aHNvAQWtOaRdrLP?=
 =?us-ascii?Q?fVCv6FUvBNcgwj0y1im3wqP+st7i5op4SxuJy0qyNGaxgwK1AFhGqoXT0bTH?=
 =?us-ascii?Q?Adn+gmHlB2AcyX9CbqwK3iSq8FaCnRt3HITSSBaJ23S3aWNu+WnzyftSIMkH?=
 =?us-ascii?Q?xzKWz+ZYSEzdPAQO3gJpPlS07TD/bhL0Oa84yVOw/0pFD6A85CozD4moq8dE?=
 =?us-ascii?Q?OwydQWJdEB0madQ5QuGJ6anoeH3yC50L7XcDZF+jHslOKz9dAWxaMx1G1/pA?=
 =?us-ascii?Q?j5O7XFmhO30RFxZRBL9F6Xvfy2CRuIMC4IXzVvPdO7dYAoZARilGMUsUkp+9?=
 =?us-ascii?Q?o7mFlKBf9gNgtvSpzNiiClvGFDhE58W9vnRiyQqUcMn0p/9lyVD+53Dpyhd3?=
 =?us-ascii?Q?J19bwte5MGM94p/SNJpoKD+61EHS8qc3ZU9kovwI+PsaCiVwQlTrQ07I2hBa?=
 =?us-ascii?Q?AMAV/rzQ3DfnvIz2NED66st45DU9/O7Wx9AHlwZd0m+5aI06SfggvVzA6hcz?=
 =?us-ascii?Q?h4hp2WMvFSvgxRKYcPpF59FOjF3Wer/05OhvbyTcZtVxhrNcQFau5hKQLFcN?=
 =?us-ascii?Q?qIH/ioQmaabVvLL85KVa5DzOOH4umpKgwsJWt6AKTPlx3/o2XLQlTfheGL06?=
 =?us-ascii?Q?lhDbJCfqEd69s6/iLEaltXUvhJ9gfSAdkI847OLJJFwwz8U2QZFwpQomRXX4?=
 =?us-ascii?Q?oG6pWnLYkhZ2LxJYfUtAvt2oBCXwi1Y5ruyUgE09NUSfd9Gpfy7kpH/5e61D?=
 =?us-ascii?Q?Zcg47h8vzc1OeU5gieWT061B?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c240570-645a-4475-e181-08d981abc914
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:41:46.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFB/jR0O0xulC1uy7zVnSD15BUhUYkTsUOh09PyFluD6Yc6j88L4VecL4QNR7p1VhbpwJPwfukKwZd46eboBQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_044150_062057_AD9F7E94 
X-CRM114-Status: GOOD (  16.96  )
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
index cf6832365345..5acec47236c9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -414,6 +414,98 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
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
@@ -425,6 +517,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
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
@@ -440,6 +538,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
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
