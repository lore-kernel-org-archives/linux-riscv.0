Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1A3CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a0FsOMdRKBMcGclfSzHURMVeYkrRn2UxTKJKkZyfdfo=; b=I/778V4gu4SKqH
	XQqEGF9qeR7XF6oUnrrTYA8sxmNxxSIh10JSIF0Ya+lzroMVuMeIqetpcNF4GFkUPboAZtFlD+QzP
	9bSrrNfOQTLYY0Ca0ZOcSQqDvIhIFKvjac/rLys+zp57rcvbDX2g84YFBwcLBzSbJyCjtolu4J4Ys
	PMQ2WTFfzeNv5u4bIdszYPXVOpLm/q+mZVwh31bzbkFtK9vV3+ZLSISYZoLRM7ajuU5mfswqFBXVp
	kbG1OA+runqLiNqQMwORBHzUE6DCZrJ1D/S4NQfJQLsUmVk0HJnpqaPULuUta67ZrwlVML7h+DmhK
	BZV8UwPHSrZ6BT7ON9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCc0H-0000000BXLN-1PuT;
	Fri, 02 Oct 2026 12:04:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCc0E-0000000BXKr-4Buk
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 12:04:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nVXQ960521
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 12:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam
	3kxEB2+c=; b=VOBUqgy2eVhBiT+IXSvdeRLPIwldCaGKsPlnUHXvMz1HuIUqFFo
	yBtUCAUgF2Qb5xKOUZt8S+S9X5sNNhwskUueqIWn2OzSlV4aVXguzSlRkinHfKEI
	6dhAeR2ckxfHW/WPDA4+RuBS5NJPPOFZ7boHjazGt7mscyBs9U3NwkOV3Ow2qscS
	3mqBJiHuBUh1sBjeWyhxOb5xuR5xBbzlCGOM5y+4ggpGzSowQObW5sR5fsG5akei
	Z+hr6U+jaZuDdy/JEAWBbnDQdQxxs43gd/j3i5B4NcijIMYggU3VaHxehzYH5ZO1
	7MRD+CiR+5i2UkYQO1HtohEx/XdjudvATBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcm9d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 12:04:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so3230213eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790942677; x=1791547477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam3kxEB2+c=;
        b=gcDsO2rpUHiBFplkanhS9XakasN6GzEttF8g71uq2+W0hvttcd76JJlndWMEYsE5Ay
         nLDFs6py6u+7AyUZw7S7jsLjq/9t4KrGDlLBJVdl7BTkj4B9VMjv7LZIMdS1ArSv3wXI
         fLlw+jxW07XTWA+A1G+vMGSgMTlEYeV4VFAjp8K6XJL0TfxdOxJ2Jiy8vCtw9/Dy3ZZS
         j7EdyaR8zwpTcpVN52/JqCxg1FrIZ8jEJ+E1kGo22SukVbpIj83zs1ySkpmNv6Iz+UYS
         d0uiaJZcfM65G1QaYak6YNla5IW8Oj9V10Nq8Hqcd3XFg+j92ViQypNsi7fedKsJ7xvi
         6tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942677; x=1791547477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBBaOBiE6PSFvhX1PhYT8mW6+45r0ht0Mam3kxEB2+c=;
        b=NLcL+4aTpFpIr60AKgZkUbUBdfwEny865tUC1MaIbJH2wdtSN+oSnrlfN7dTivqayE
         23ixsDMC2IkFWphcuTZkXeBB1HZAIlerCDAEjz9vrkD/AcwGX/kBavX0/AkV53eMbtXs
         dvHoAJ89S8FdlsKmA+LloVRuQ5X2aVwsA6lSNas/UbSYwxo+wp5yI9/jCrffH5KtrE6u
         LUIvn0ve5ASo2MeU8ksXKwR2WtRIO+a/5eEtBP7q4zsiKaAUKdzIKY8dAlTWNg0o/90k
         qbtGd7bUZnJDDR8T7uNn0oha6l3TN0ZN3PzoadQjBY0jLYg6mERuHrh1dn12Dw+1T5V8
         +bWQ==
X-Gm-Message-State: AFq9FYJvxgW9pa0rKxF5q8yxqn4wxS4lODgyFz/+8Rr24jlOe/1uLsSl
	eywrUgw43Dsx1kkpXr4xVm5yQCO35lKtxNW/yVlKZb23C0DRjK8n0TpNTDlsnhV/Rgp2pWMFdRH
	czInTXjrrjgkPGANAsisEF7ctds95O0xZ7M886weCmf10mYSlEm1ct5Q1ZjNyL1o4AfKxVDY=
X-Gm-Gg: AYBFou1O4CwlUtXZBCMb5tXOUkwMvqGhcXPmqICooo1TBF+dHMyMU9YviSDvkDkRyMO
	Bnuv8INxFRWNwQiuTNwjfEt76ID7LeP0YtOISJVNiJLL+g/4I+SIlsvT+zDST44hL4YgvqUwABt
	pULP3tYNjTGG9B200ucQ76M4m43LxhRqTEcZGRP3fmG84kDkItCWpEo9Z3iapWr+jB1BQT8TetQ
	HQKt8LRPjVXfpmQ5d0owBHfBLxD93IJALOha4Ei3A863JQ+sjUiHB7n+mblRCbqlVZwju4tbPEg
	ortBhIDNoz0NTDM0XYTfmgxxMIP5XbXFWjs9Ah4nYvDZLugep1mXHTqeetWcFjkoFwEg3PwK2ur
	Xf32FCIK0AlW/Q3+W9E1Lw+RC7tfjbzhmtT12BxCGCS2HxUmk8nqW1lNghvMiaYqK7tMSx67wTW
	n6qaDmISDM8UXa
X-Received: by 2002:a05:7300:8296:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-34f066779fcmr2562144eec.0.1790942676551;
        Fri, 02 Oct 2026 05:04:36 -0700 (PDT)
X-Received: by 2002:a05:7300:8296:b0:33b:e842:c0ff with SMTP id 5a478bee46e88-34f066779fcmr2562108eec.0.1790942675851;
        Fri, 02 Oct 2026 05:04:35 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f15019999sm5772904eec.29.2026.10.02.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:04:35 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org, tglx@kernel.org, radu@rendec.net, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global config
Date: Fri,  2 Oct 2026 17:34:17 +0530
Message-ID: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: MI-HrkrJSmesjH92vwpzIDHJc00I7L6w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0OCBTYWx0ZWRfX/bxbVluLpzTM
 pmHw5RyV9OFkUdbB13wXJ6orFML6bwJshkfEteR6Fe19y2BJC8CIRd+31aiz2wzFKq8qTVfSJyl
 M0Q0s4pADJWcy5TFJVAGM8WeTmeJ+LQ=
X-Proofpoint-GUID: MI-HrkrJSmesjH92vwpzIDHJc00I7L6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0OCBTYWx0ZWRfX9tEKcv5cB7Ew
 NFlTVaDiKwcE2Km2l+HkuA6C15wEXuX8ff44uLkzOYHFEapYyjpsAAz7GBG7m+CHIAVwpDYTTP8
 8awo6hirmEjTwq2NM6gFdqxzTFAivEBnLsKIJPlskiSAUmXFydfy8Rh7uwYsFoPJMPPkHJk9tB2
 p7JZ053luS5gJ5fT3ohzGh03CfSazA84HolGjBt7fhBXJAqMa5YNqyw9iMkFK4FtwWffGy1t2PD
 aJiKrl52E4QDbHnJpZG0ze2hWqDvlyiSD+ltdkSEXmTQfrUU4mKqxYPAhFumO3bIwPdu3iXl8RC
 LYDCjes0duBucu4Sr/GvjR50PvXgb8YRAdE0nsAQ9+2pzTy2HMhtBUCuE/lCwQ8tdL+ZzjwgigT
 3uUNasbOdTZU9MVBzRnOLEBKFW0293Blx/9dGWTyIvYkGdN/yK5LubbetN8aPi9vxL1ItpnMZzM
 20bs948gIsxjVNqg1hg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf9dd5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pqfPdFw0YKYeVI_BzH8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_050439_166923_5A947AFD 
X-CRM114-Status: GOOD (  16.63  )
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

The fwnode describes a global property of the IMSIC interrupt
controller that is equally relevant to external consumers of
imsic_global_config as it is to the imsic_priv itself.

Keeping it in imsic_priv forces the external drivers to access
the private structure rather than using the already exported
imsic_get_global_config() interface.

Moving the fwnode into imsic_global_config makes the public
API self-contained and eliminates the need for callers to
access imsic_priv internals directly.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 +++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c    |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.h    |  3 ---
 include/linux/irqchip/riscv-imsic.h        |  3 +++
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 12efd241ce88..769849147148 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -75,7 +75,7 @@ static int __init imsic_ipi_domain_init(void)
 	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
 
 	/* Announce that IMSIC is providing IPIs */
-	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
+	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->global.fwnode, IMSIC_IPI_ID);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..95ff76e63a69 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -313,40 +313,40 @@ int imsic_irqdomain_init(void)
 	};
 	struct imsic_global_config *global;
 
-	if (!imsic || !imsic->fwnode) {
+	if (!imsic || !imsic->global.fwnode) {
 		pr_err("early driver not probed\n");
 		return -ENODEV;
 	}
 
 	if (imsic->base_domain) {
-		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
+		pr_err("%pfwP: irq domain already created\n", imsic->global.fwnode);
 		return -ENODEV;
 	}
 
 	/* Create Base IRQ domain */
-	info.fwnode = imsic->fwnode,
+	info.fwnode = imsic->global.fwnode,
 	imsic->base_domain = msi_create_parent_irq_domain(&info, &imsic_msi_parent_ops);
 	if (!imsic->base_domain) {
-		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
+		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->global.fwnode);
 		return -ENOMEM;
 	}
 
 	global = &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
-		imsic->fwnode, global->hart_index_bits, global->guest_index_bits);
+		imsic->global.fwnode, global->hart_index_bits, global->guest_index_bits);
 	pr_info("%pfwP: group-index-bits: %d, group-index-shift: %d\n",
-		imsic->fwnode, global->group_index_bits, global->group_index_shift);
+		imsic->global.fwnode, global->group_index_bits, global->group_index_shift);
 	pr_info("%pfwP: per-CPU IDs %d at base address %pa\n",
-		imsic->fwnode, global->nr_ids, &global->base_addr);
+		imsic->global.fwnode, global->nr_ids, &global->base_addr);
 	pr_info("%pfwP: total %d interrupts available\n",
-		imsic->fwnode, num_possible_cpus() * (global->nr_ids - 1));
+		imsic->global.fwnode, num_possible_cpus() * (global->nr_ids - 1));
 
 	return 0;
 }
 
 static int imsic_platform_probe_common(struct fwnode_handle *fwnode)
 {
-	if (imsic && imsic->fwnode != fwnode) {
+	if (imsic && imsic->global.fwnode != fwnode) {
 		pr_err("%pfwP: fwnode mismatch\n", fwnode);
 		return -ENODEV;
 	}
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..ae982f89318b 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -813,9 +813,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	imsic = kzalloc_obj(*imsic);
 	if (!imsic)
 		return -ENOMEM;
-	imsic->fwnode = fwnode;
 	global = &imsic->global;
 
+	global->fwnode = fwnode;
 	global->local = alloc_percpu(typeof(*global->local));
 	if (!global->local) {
 		rc = -ENOMEM;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..178b678f5c0f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -44,9 +44,6 @@ struct imsic_local_priv {
 };
 
 struct imsic_priv {
-	/* Device details */
-	struct fwnode_handle			*fwnode;
-
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 61af3a5bea09..b7be1aad7774 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -46,6 +46,9 @@ struct imsic_local_config {
 };
 
 struct imsic_global_config {
+	/* Device details */
+	struct fwnode_handle                    *fwnode;
+
 	/*
 	 * MSI Target Address Scheme
 	 *
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
