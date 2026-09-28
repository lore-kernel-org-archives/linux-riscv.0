Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC59DCA5FA7
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1vZYQYVSGakHECIlMcDQM4WmrCdHX8ZxG1aK1VsJ+g=; b=XLqMHkQ0hS3D+O
	EJqPT8+fvIU8WPIBn58iNezjPNU3P/ZOCOQNO/YMhz24NvT1hDgCRm2sofESz2lCX0XTi1tnt1ZMy
	Ol71vSOIWmrbH77BiKjnSI+gmA1q4zZ9ObeWDz89RAQWKTIn+8dLELG0onlR3bhktyfOqbnPGj3Yw
	TK3qD6B0d9vQ1Yoxo2BzIbGZeNS3SX5hDfMO7AAiqDBOZcpxf4L8q1n9Uzb1F/9Aq9XdROJB1MDvO
	vBPn5bvvbqIHE0gCu5eaTiswAjpj/utVJl+1dvRGraCZeXRDBTatJC2hVdOhCwWAitAXjZ+WzZQKK
	bwFG3kvcZEKqTd5l7Tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCP9-00000000lol-3F55;
	Mon, 28 Sep 2026 14:32:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCP6-00000000llE-3HMm
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tebmqV7yCOWUuIVhUGJYMDQXIsJi15ImmfVHeeil9JY=; b=dRv5nJc/pHFZR/v7zhM/3evqXD
	cmJBrcVKNscZdqQnwx5eZtGIJrByJ5R3NE8domCpPFi1x7hANV5k9Y6aGrQvBhcDTLQN44xhRL2Vu
	q2nMuEDPW3ur3HzSudb0P++2nzxdCr0zxVq5UHHs2WP8sYjH5EuEIrScrrvbDeBmhheD8X/9woNYG
	xeDjwRKazHfID/Cxc9reVTZxu95KOwF5FEk8+MQsd3T1IZUrFmRpGpip0t3rVDwrax9jVSxOmSAIj
	0IiZuc2u6BLPyXdLTfUrcGA5Ig/mpCfPdKnXWBpJoDfNfXhETFFQ43Dh9lEn+8GvTjLQF0S/0sovv
	EjmLXgGw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCP3-00000001ZSt-1ykC
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAJv6558161
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tebmqV7yCOW
	UuIVhUGJYMDQXIsJi15ImmfVHeeil9JY=; b=F1lvity3l1MF4Z9dAHH1Wo09WAW
	F+V4zrpfdEK8L+NQ/v2KtbxpP6z7/QGlpNWSdVGve3NMMt6EDHiQD7KULT0doEs6
	Df9TpuC1QZYvDO96q2ED4+nqH4GmEGvKxrIq9p7D+8P734Gq+NpN9/D/x60d+0Qy
	BPQUG4HQNqEW8z1PyFX21py9FnG9qMJeuLk2kvX0XExOUR4F5h1nVTkztwp7PnPN
	4VkkOCQ5hTEJpLMht0WJC6g37JMH9APOGcpM0qUPlHzr6oSTF6JEUYG44noD9Mu8
	9FztFj4iCJClY2PF57YIrz15FgHNKjHXVFVZf01u6ofHdoUb5bnbZky2qUQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq2ka3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98537d1242aso2821929241.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605942; x=1791210742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tebmqV7yCOWUuIVhUGJYMDQXIsJi15ImmfVHeeil9JY=;
        b=aJ3GxGGweE7ZzJSvY7iNEhUUqC3Vi0/aoFzClCJLTmDg76Y38NKtOAtPXMjMaUmPuN
         eFmb14QKuBuhJ7YsiQ+jd9euUv2NPiyYkghgkffTHESk1TRw6QFOJGOk8kztCaz2ESS8
         bHCUm9R+3S/zeTX5wSvmH0luk2QY79khk0eYkN7hfC1rWtL42ui3x6eD17RQoZ2HeaGb
         Ym+rgaf26cVOo/0zq+lWBEEvw/2ZsW69zVl+dBVTFW2htCIfWL1Le9hvzlyRxZoHJR7M
         FXo6Eyh4DWf5gsagwciRn+pD/+Y2uekdGDAxLu9XRtb8xrVfU4wO/jUxZfVScU6eTxBC
         7Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605942; x=1791210742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tebmqV7yCOWUuIVhUGJYMDQXIsJi15ImmfVHeeil9JY=;
        b=iLdl4QF9Bay3miZhW3MreC1QB/Eqzzya699OiWu8uei7hRL4mmsqZypojrJ5Ispry7
         JJPheCv9q1veJDoV46Pz9ZisInKjzGSwDRqw58/EQ089GBUCMfDYzpgWfrYtJKZ+Vr79
         /uWtHsUviwcPzlibRo1LYJ8UqvGwgAlAZ3R/ix4bSMFizp3BZ6nM7ZNyXwLQDPFTvtzL
         1JuPPXiEihEdoqT3tr4SnNDw6LMyR69MdfZpj9TeA0/o5IZFiTqYGyeHSdMptK0tTzJm
         qz98k/r7LILP2EoP65FB0hylI2rXm4noSQ4yvXIi7/G7BovFHlO+LlAV3VgS+UnZuWyR
         X88w==
X-Forwarded-Encrypted: i=1; AKwUvBybbiZfyCh0Ih2ily4xW9G/0HPOdGMYnAsP6ojuEpCzwhyJK8Z1jGJBIu3+wlCc9CEhvVv0+gu0exz8/A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKAcy1cZ47zmF4Z6PoTCRdxsPEUYSaSbL7atelCGMqaw2A/diwd
	/CxCDWHBeBjzOmAQTVWqH7HguQlbvH1+8S7Q5Hyk0IMmsVvhDiiRX/ocywUoicXX5uwODs5znYu
	kEJwVQR2mcogWHLRKelEF5oIcTRFCKY6mwV7H3tkaZ2QdrEC9cOivYHK8qNBz4KKwv+++pmY=
X-Gm-Gg: AYBFou2PAA7j6n4V4AAvFUOGPOout1nd8Eh6PpL5yxzZuPsP4Qb90PV8FBBZacSPqJf
	Djxirh6cMIaATT3jbd8qox2wmlhOBdfYInkz5w+Ii/7ULjn3RRVxA8vGKwWVi2af8bJ19UMmW2c
	cxCIbVaz7psMPdUnu4f6P1u/pLam7LpotR/wbz1CmDFHmHX38y01ca1BVXjg2iKuUtAG1h5qxed
	93Z1kUThgqm0jsRRSU0vaIvnoe/fFo6xLUh5mS/lbue/qbi/EbxE6ymkyREy6hQPJfUd2rATMxn
	z20SYvU4pGbC0vg+dkaGEuRXpY9mAUAa3Za9jyLBNiQZh/LKSqZZtOWNGTipuLX00vmEwxTWaxP
	xdn8H7zha/QiaDN2iyFTMPCvieUWb1x9SIzKw0A==
X-Received: by 2002:a05:6102:6896:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7b3b92d1b94mr1507290137.17.1790605941468;
        Mon, 28 Sep 2026 07:32:21 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7b3b92d1b94mr1507262137.17.1790605940898;
        Mon, 28 Sep 2026 07:32:20 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc8b71b4dsm255359866b.1.2026.09.28.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:20 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 13/14] iommu/riscv: Validate IRQ forwarding requests
Date: Mon, 28 Sep 2026 16:31:12 +0200
Message-ID: <20260928143113.49838-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: IrCc7KDmYgb9tJDzlG7iuGhx1AYeoQDC
X-Proofpoint-GUID: IrCc7KDmYgb9tJDzlG7iuGhx1AYeoQDC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX0aG/yT1oMedM
 vZdq1X2XrMZeYkOi5BP2F424rtiLPRY765fIv4dm0Zyj4ltPmT9xM6rq02n6I0zlZmpJZ+kjHCB
 ghXgxcmEsjlbqTE+fMk1PQMbp+wwkho=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba7a76 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=h2dR55gVlEbTIpH6insA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX6XPX+EufnSmH
 QvTbEwEgji04Hcsp5YPcwwDXB7vG9dCsH66YjyS15yvuGMZv6yTF3TXvsNFfWDEHIZw1mxlA/Ni
 CZu/bvXo+RU9RKDKp+qYDlww4CX6N2kr4gu9SB6BwABCfaiep3ys8pMk1a+06SP4LmcZVajoeSj
 k+VgRmlnze8BOwmgRx8CirnIFQ1l65OvBbtnmtJPyYi5P7rX2jms3heA9ioTKpx1calnfLUTsoE
 j8mXCC08jgfU1EnAz7D0QNhvUTbdZUxFI2/9Dj7nhkCPgPzXZ3qw6rUpnrys4XMulzDZPRwurTB
 diJ1Ccgx1bN6TkCySKQ5AtDpdJmT3dYcD0PHDiBXS3l8aI5FVTkUYRn217IxS/D4XkBntO9sHid
 ywkHggeWmuAm65pIy/slwCuV4yG14Boozpxrd7g3hMNuI3w9hT/qKP/0Vwj6JJ9qsQpqCGK1XdQ
 2sX/TuC6md4mIHTkfbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153225_988935_2A2B6BFC 
X-CRM114-Status: GOOD (  26.66  )
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

irq_set_vcpu_affinity() receives an architecture-specific description
of a guest MSI topology. Invalid address layouts or targets could select
the wrong MSI PTE, while accepting a mode unsupported by one of the
IOMMUs serving a shared domain could make interrupt delivery fail only
for some devices.

Validate the request before the table can be activated or updated and
distinguish malformed input from a valid configuration that hardware
cannot support. Check capabilities across all IOMMUs bonded to the
domain, and retain the requirements of an active table so later target
updates and device attachments cannot weaken them.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 127 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.c    |  31 ++++++++
 drivers/iommu/riscv/iommu.h    |   2 +
 3 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 22da76987c7c..12a5d0bc77f2 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -20,9 +20,120 @@ static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
 	return irq_chip_set_affinity_parent(data, mask, force);
 }
 
+/* IOMMU extract (RISC-V IOMMU spec section 2.3.3) applied to the two-run IMSIC topology */
+static size_t riscv_iommu_ir_extract(u64 value, u64 mask)
+{
+	/* Separate the optional group index from the low guest and hart indices. */
+	u64 upper_mask = mask & (mask + 1);
+	u64 lower_mask = mask ^ upper_mask;
+	unsigned int shift;
+
+	if (!upper_mask)
+		return value & lower_mask;
+
+	shift = __ffs64(upper_mask) - fls64(lower_mask);
+	return (value & lower_mask) | ((value & upper_mask) >> shift);
+}
+
+static size_t riscv_iommu_ir_nr_ptes(const struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return riscv_iommu_ir_extract(vcpu_info->msi_addr_mask, vcpu_info->msi_addr_mask) + 1;
+}
+
+static int riscv_iommu_ir_validate_target(const struct riscv_iommu_ir_vcpu_info *vcpu_info,
+					  const struct riscv_iommu_ir_target *target,
+					  u64 *required_caps)
+{
+	u64 addr = target->gpa >> IMSIC_MMIO_PAGE_SHIFT;
+
+	if (!IS_ALIGNED(target->gpa, IMSIC_MMIO_PAGE_SZ) ||
+	    (addr & ~vcpu_info->msi_addr_mask) != vcpu_info->msi_addr_pattern)
+		return -EINVAL;
+
+	switch (target->type) {
+	case RISCV_IOMMU_IR_TARGET_IMSIC:
+		if (!IS_ALIGNED(target->hpa, IMSIC_MMIO_PAGE_SZ) ||
+		    (target->hpa >> IMSIC_MMIO_PAGE_SHIFT) > FIELD_MAX(RISCV_IOMMU_MSIPTE_PPN))
+			return -EINVAL;
+		*required_caps |= RISCV_IOMMU_CAPABILITIES_MSI_FLAT;
+		break;
+	case RISCV_IOMMU_IR_TARGET_MRIF:
+		if (!IS_ALIGNED(target->mrif_hpa, SZ_512) ||
+		    (target->mrif_hpa >> 9) > FIELD_MAX(RISCV_IOMMU_MSIPTE_MRIF_ADDR) ||
+		    !IS_ALIGNED(target->notice_hpa, IMSIC_MMIO_PAGE_SZ) ||
+		    (target->notice_hpa >> IMSIC_MMIO_PAGE_SHIFT) >
+			FIELD_MAX(RISCV_IOMMU_MSIPTE_MRIF_NPPN) ||
+		    target->notice_id >= IMSIC_MAX_ID)
+			return -EINVAL;
+		*required_caps |= RISCV_IOMMU_CAPABILITIES_MSI_FLAT |
+				  RISCV_IOMMU_CAPABILITIES_MSI_MRIF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int riscv_iommu_ir_validate_targets(const struct riscv_iommu_ir_vcpu_info *vcpu_info,
+					   size_t nr_ptes, u64 *required_caps)
+{
+	int ret;
+
+	if (!vcpu_info->targets || !vcpu_info->nr_targets || vcpu_info->nr_targets > nr_ptes)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < vcpu_info->nr_targets; i++) {
+		ret = riscv_iommu_ir_validate_target(vcpu_info, &vcpu_info->targets[i],
+						     required_caps);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_device *iommu,
 				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
+	u64 pattern = vcpu_info->msi_addr_pattern;
+	u64 mask = vcpu_info->msi_addr_mask;
+	u64 required_caps = 0;
+	size_t nr_ptes;
+	int ret;
+
+	if (!vcpu_info->owner || (pattern & mask) ||
+	    ((pattern | mask) & ~RISCV_IOMMU_DC_MSI_ADDR_MASK))
+		return -EINVAL;
+
+	/*
+	 * riscv_iommu_ir_extract() requires the mask to contain the low
+	 * guest/hart index run and at most one additional group index run.
+	 */
+	mask &= mask + 1;
+	if (mask) {
+		mask >>= __ffs64(mask);
+		if (mask & (mask + 1))
+			return -EINVAL;
+	}
+
+	nr_ptes = riscv_iommu_ir_nr_ptes(vcpu_info);
+
+	ret = riscv_iommu_ir_validate_targets(vcpu_info, nr_ptes, &required_caps);
+	if (ret)
+		return ret;
+
+	if (!riscv_iommu_msi_table_check_caps(msi_table, required_caps))
+		return -EOPNOTSUPP;
+
+	if (nr_ptes > msi_table->nr_ptes) {
+		dev_warn_once(iommu->dev,
+			      "guest MSI topology requires %zu PTEs, but the IOMMU domain only supports %u; using host IRQ delivery\n",
+			      nr_ptes, msi_table->nr_ptes);
+		return -EOPNOTSUPP;
+	}
+
 	return -EOPNOTSUPP;
 }
 
@@ -34,6 +145,18 @@ static int riscv_iommu_ir_deactivate(struct riscv_iommu_msi_table *msi_table)
 static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
 					struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
+	const struct riscv_iommu_ir_target *target = &vcpu_info->target;
+	u64 required_caps = 0;
+	int ret;
+
+	ret = riscv_iommu_ir_validate_target(vcpu_info, target, &required_caps);
+	if (ret)
+		return ret;
+
+	required_caps |= msi_table->required_caps;
+	if (!riscv_iommu_msi_table_check_caps(msi_table, required_caps))
+		return -EOPNOTSUPP;
+
 	return -EOPNOTSUPP;
 }
 
@@ -42,6 +165,7 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
 						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
 						       struct riscv_iommu_msi_table *msi_table)
 {
+	struct riscv_iommu_device *iommu = data->domain->host_data;
 	int ret;
 
 	if (!vcpu_info) {
@@ -59,6 +183,7 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
 		irqd_clr_forwarded_to_vcpu(data);
 
 		if (!msi_table->nr_forwarded_irqs) {
+			msi_table->required_caps = 0;
 			msi_table->owner = NULL;
 			msi_table->msi_addr_mask = 0;
 			msi_table->msi_addr_pattern = 0;
@@ -72,7 +197,7 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
 		    irqd_is_forwarded_to_vcpu(data))
 			return -EINVAL;
 
-		ret = riscv_iommu_ir_activate(msi_table, vcpu_info);
+		ret = riscv_iommu_ir_activate(msi_table, iommu, vcpu_info);
 		if (ret)
 			return ret;
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 514470291fd9..55c167df2c2e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1441,6 +1441,33 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
+bool riscv_iommu_msi_table_check_caps(struct riscv_iommu_msi_table *msi_table, u64 iommu_caps)
+{
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_device *iommu, *prev = NULL;
+	struct riscv_iommu_bond *bond;
+	bool supported = true;
+
+	/* The MSI table lock excludes bond updates for this domain. */
+	lockdep_assert_held(&msi_table->lock);
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+
+	/* Bonds are grouped by IOMMU, so validate each IOMMU once. */
+	list_for_each_entry(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		if (iommu == prev)
+			continue;
+		if ((iommu->caps & iommu_caps) != iommu_caps) {
+			supported = false;
+			break;
+		}
+		prev = iommu;
+	}
+
+	return supported;
+}
+
 static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu,
 				      int mode)
 {
@@ -1512,6 +1539,8 @@ static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_doma
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	u64 required_caps = domain->msi_table.required_caps;
 	bool new_is_s2 = domain->gscid;
 	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
 
@@ -1532,6 +1561,8 @@ static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_doma
 	 */
 	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)
 		return false;
+	if (new_is_s2 && required_caps && (iommu->caps & required_caps) != required_caps)
+		return false;
 
 	return true;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index a42f0b6a88d4..9852962e245b 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -83,6 +83,7 @@ struct riscv_iommu_msi_table {
 	u64 msi_addr_mask;
 	u64 msi_addr_pattern;
 	const void *owner;
+	u64 required_caps; /* RISCV_IOMMU_CAPABILITIES_* required by active MSI PTEs */
 };
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
@@ -104,6 +105,7 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
 /* Caller must hold rcu_read_lock() while using the returned pointer. */
 struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info);
+bool riscv_iommu_msi_table_check_caps(struct riscv_iommu_msi_table *msi_table, u64 iommu_caps);
 void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
