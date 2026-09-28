Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBEBCA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmM8SrwYO5cFqKVNXLN+6LXA4TFKZxkGL510yk/VrOs=; b=iHDtqXGhjm5AEs
	q8DPsuaF191mqXenMsynzJA9B6ainwIt/SE+5zycDHDjimcBQJHyWXLbpKxnqCt4gJkGCMYcm/Apq
	8qRQ3DXPSLe9G9fwVAWKooo20/qhPERnOx1W2swQDRkbGYJnT5fpc/boOyX+9NJv4Xt2vNrKdGQmv
	8e88NKti/7aUBWnPqaRf/i8rCMIGNYyeHR1AwS4+F7Rfj3F9VfbZvvOki6ZftSLD/Yke64MWIg2xl
	JYaezeAOUnYKdLt8UtNP17vQLIcfi7UV+cGJHga7UDH2k+jYaCXCGI2Rg4gkgQlKTX9SBBwkX3Nw1
	Rf7RKscNEtHIohCm87hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCP9-00000000lp5-4380;
	Mon, 28 Sep 2026 14:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCP4-00000000ljF-3AK3
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA8ZF1189326
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GRnT15XNTnT
	hRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=; b=WoWqgFa0/f0SN3SxSiWmUYkaO6R
	1oUPDoF+umGUVOzH8Iad152juDLgd09JrFVAoyVqzgKDeuVTc0SofRQLlaq/r2jj
	AZOuJuxqL/LJm6+Ql53rM8Tu1gQ8PVh9S50+ip25xjUGERpRkidq5Lnb+44pGtsj
	zW/v/K9crCbqVwiv6MqJ/1B24qVLQG2E2BSxZmdrMkh7dafVV5239BDB9qj0v9FU
	cnlBFAPlrIcg08lMKPnlQBDW4yxuxvljDet6l/Mr6PXArm2yZ0H3vuaEoffiD1tD
	/P6GAPhY417P4dxn//WksCEIQAQW/58B99QxTOwGltQ5alIzz882n1cq2wQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc15y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b502c0d9e0so1057664137.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605945; x=1791210745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=N25MXWfo6u9v21/afKjrBtciEvzSoJW5yaE9HQTRqOZ6d0MAhMo/Imy99MfPZiF+Jq
         +Ug1wUE2wq84PtE15tPRxv4Oz07PboEQKw2ev+DaFTtjtLpc042Yi2b6l9cXaEFrFkOk
         XIck7aDHRg0OPE5bLBszkftqfnDB2tc8bzQftEMOIsdHH33wdbdUGsLrIJKfGy/eIKsJ
         WKA84k0a7wm1VvhK7Hr6nw1aV/2xuj36dDVlfkIxxdGz6JKIIdDIyXT/kq99+W+UtKk3
         sDVN0VC091SL8BTKbGi8njOPohfOkjeoBIyi9THXb9CVKQFlzbKbeMHwIjwSvngutj42
         F4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605945; x=1791210745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=huOKxe/7P+jcmQk+JGcn5gbwOyUWBGT7ZPGP0utumg/IZ853swogn3/QVKYO9RSZap
         i+wxrB+US9o38o9sCgw2J/TrCaIu6RGcKqMlY+OrFGmXVor2+MM0qYsjRJVv1WrzrO2b
         YzTFzERFzjDmXWaD09+QQ8hk5VZl3mYAwBIhmv1iXWViTUpc6RZ42Aw3Er5Xsn8Qge3s
         2e8vRqBkiwvU9GnxXzNTa3tQupWgPB46W0I8JciHTDvnfXl25mBptzveYB+Tm8etpVrm
         j14bckM4LQaWS+pzRP5nWiEUNgVIwrsMPuYeiS8ACvEKeOTkA4LKfCjA8Fv/CpW6GNeN
         OUjw==
X-Forwarded-Encrypted: i=1; AKwUvBwe9Lv0djV2KSriFrVM3j7DltVIaqnhr/pba2+OFGbYX2FWR9QQ0R5K2pnYyz0fZXo5CNfDU0iLSHZVfw==@lists.infradead.org
X-Gm-Message-State: AFq9FYITyM+MdvXNf0BMvbm7X0b8E8pnZFZ3/a5Yp3HOg/P4HPjcv3z0
	V8LqkLxrrSlj/ntqzwE8aMO9228ViANyYiJqZuo7IY2+5oc6f0RUd3taDSf+4WkJZRJqCp3sMMq
	TKZJLgyTrMTkkJXW6HR/ajSylLZlmaltFi2+GZ+ZTQlCp6tko0SryXO65nOx8MItDypvlGOs=
X-Gm-Gg: AYBFou1UyqpM5zwxcI9TugnLxriEpJ9T5oWK/YS8DdefSm+PnHOblkuiQ6Qk+a7wr6/
	F2w4OogYA6LVBdi439RU6/5o4Hrq5aK8irsJRVDQMXnTabGcJQoYlkdxPppoh7h6nCtfa4gb68r
	NBZeDZnVcdR0WDlK6BU6mACZC0nMIRZdyq1IoeJSQyj4xT5Px/uoWSm0RBrnbJMo3gRSCuuZaPW
	b1qCLGkdeYYW049aOPmA/1qE+cF8ilK8KLiv/rHLpFLIuP61k0GCRqpg9aHYxWwkh1EmlDxYdPd
	ue0n1i1Yi3rLITcqPrERMufcr6ylle+FoJ6uQX+BrwjRytUqxro9jqrHijtAooI0P4V9B0Vg+gf
	qLu2TgSzrRqT4PpIQ1h57plaPLQ34oHB9RK0Rlw==
X-Received: by 2002:a05:6102:c12:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7af1ecf6d75mr5365022137.28.1790605945072;
        Mon, 28 Sep 2026 07:32:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c12:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7af1ecf6d75mr5364910137.28.1790605939177;
        Mon, 28 Sep 2026 07:32:19 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4296359a12.14.2026.09.28.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:18 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 12/14] iommu/riscv: Prepare interrupt remapping for IRQ bypass
Date: Mon, 28 Sep 2026 16:31:11 +0200
Message-ID: <20260928143113.49838-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba7a79 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=E4clnSanGcVZL-NzkHIA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FjxUnODwp_MLc4mEhi8WTgzFdSuL5P4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX7RJv2mpsAQce
 2IRylwIpFCFoR90WNBr9NPZqSORk9J1gmtxIWGP7NOIH+Ao4OmMCsEQazAAcVExdaRPPlIzVUb/
 s1JDS2hLAhOmUK+2rz32bVBmO6yhD9SHYEJfgQOiUVX8w0LqYk2M/Dk8a9YPVJQ9t7RMeqgpJKn
 kkZXv0r6cKu1d1WPS5raijSY+TnDecv5wFzngzYdMeL2KfGPup/+fFszJPBWFmVZmloLgrRDjUO
 OIrHTZr1AYE/yrNpd9KL7xj/8t2cIoE6jDpNqPOF5c8MkLm9hlXixbQVqgE7+xf+UGiy5Bu1L8w
 xcKkmsTVbN0JieP8iZ6ZQm4mLct1onsKCx43mDkrztG19katZc/eSidwsQ0OeeTAPOQ92ryY7Pu
 jlqlMPKzN4JLkIbygLpuDSeYHHUC+qZCRAtaePNCsLUa22rtp09M0+StIAM2ROGfk29N/VynwNn
 sL6uf1WFC0Uj5YC60Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX4ZRAqjI9zJ6a
 9POk+I9vdeNTXQtvwdiZmawlLAMQhT3pZcj76xiQ0kwtjjw6bsx/IyQAUzViLmkGxD8o10U6jzH
 RhYw0kKwZcdE/WkCLA9N5jzihsksf8w=
X-Proofpoint-ORIG-GUID: FjxUnODwp_MLc4mEhi8WTgzFdSuL5P4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073226_944818_6F801C65 
X-CRM114-Status: GOOD (  21.92  )
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

IRQ bypass changes the meaning of an interrupt from host delivery to
delivery through the guest's MSI table. The transition therefore has to
follow the device's current IOMMU domain and must not race with a domain
replacement.

Wire the interrupt-remapping irqdomain into irq_set_vcpu_affinity() and
serialize the callback with MSI-table publication and attachment. Since
one table is shared by every device in the domain, also require all
forwarded interrupts to agree on its owner and address layout.

Leave the hardware operations as stubs so the locking and state-machine
requirements are established before MSI PTE programming is added.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 140 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h    |   1 +
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index c5603cb9f258..22da76987c7c 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -11,12 +11,150 @@
 
 #include "iommu.h"
 
+static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
+					   const struct cpumask *mask, bool force)
+{
+	if (irqd_is_forwarded_to_vcpu(data))
+		return -EINVAL;
+
+	return irq_chip_set_affinity_parent(data, mask, force);
+}
+
+static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_deactivate(struct riscv_iommu_msi_table *msi_table)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
+					struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
+						       struct riscv_iommu_info *info,
+						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
+						       struct riscv_iommu_msi_table *msi_table)
+{
+	int ret;
+
+	if (!vcpu_info) {
+		if (WARN_ON_ONCE(!msi_table->nr_forwarded_irqs || !info->nr_forwarded_irqs))
+			return -EINVAL;
+
+		if (msi_table->nr_forwarded_irqs == 1) {
+			ret = riscv_iommu_ir_deactivate(msi_table);
+			if (ret)
+				return ret;
+		}
+
+		msi_table->nr_forwarded_irqs--;
+		info->nr_forwarded_irqs--;
+		irqd_clr_forwarded_to_vcpu(data);
+
+		if (!msi_table->nr_forwarded_irqs) {
+			msi_table->owner = NULL;
+			msi_table->msi_addr_mask = 0;
+			msi_table->msi_addr_pattern = 0;
+		}
+
+		return 0;
+	}
+
+	if (!msi_table->nr_forwarded_irqs) {
+		if (vcpu_info->cmd == RISCV_IOMMU_IR_UPDATE_TARGET ||
+		    irqd_is_forwarded_to_vcpu(data))
+			return -EINVAL;
+
+		ret = riscv_iommu_ir_activate(msi_table, vcpu_info);
+		if (ret)
+			return ret;
+
+		msi_table->nr_forwarded_irqs++;
+		info->nr_forwarded_irqs++;
+		irqd_set_forwarded_to_vcpu(data);
+
+		return 0;
+	}
+
+	if (msi_table->owner != vcpu_info->owner ||
+	    msi_table->msi_addr_mask != vcpu_info->msi_addr_mask ||
+	    msi_table->msi_addr_pattern != vcpu_info->msi_addr_pattern)
+		return -EOPNOTSUPP;
+
+	if (vcpu_info->cmd == RISCV_IOMMU_IR_FORWARD) {
+		if (!irqd_is_forwarded_to_vcpu(data)) {
+			msi_table->nr_forwarded_irqs++;
+			info->nr_forwarded_irqs++;
+			irqd_set_forwarded_to_vcpu(data);
+		}
+		return 0;
+	}
+
+	return riscv_iommu_ir_update_target(msi_table, vcpu_info);
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg)
+{
+	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
+	struct riscv_iommu_msi_table *msi_table;
+	struct riscv_iommu_info *info;
+	struct msi_desc *desc;
+	struct device *dev;
+	int ret;
+
+	if (!vcpu_info && !irqd_is_forwarded_to_vcpu(data))
+		return 0;
+
+	if (vcpu_info && vcpu_info->cmd != RISCV_IOMMU_IR_FORWARD &&
+	    (vcpu_info->cmd != RISCV_IOMMU_IR_UPDATE_TARGET || !irqd_is_forwarded_to_vcpu(data)))
+		return -EINVAL;
+
+	desc = irq_data_get_msi_desc(data);
+	if (WARN_ON_ONCE(!desc))
+		return -EINVAL;
+
+	dev = msi_desc_to_dev(desc);
+	info = dev_iommu_priv_get(dev);
+	if (WARN_ON_ONCE(!info))
+		return -EINVAL;
+
+	scoped_guard(rcu) {
+		/*
+		 * RCU keeps the table alive, but the device may switch domains before
+		 * the table is locked. Recheck the association under the lock.
+		 */
+		for (;;) {
+			msi_table = riscv_iommu_msi_table_rcu(info);
+			if (!msi_table || !msi_table->root)
+				return -EOPNOTSUPP;
+
+			raw_spin_lock(&msi_table->lock);
+			if (msi_table == riscv_iommu_msi_table_rcu(info))
+				break;
+			raw_spin_unlock(&msi_table->lock);
+		}
+	}
+
+	ret = riscv_iommu_ir_irq_set_vcpu_affinity_locked(data, info, vcpu_info, msi_table);
+	raw_spin_unlock(&msi_table->lock);
+
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_affinity	= riscv_iommu_ir_irq_set_affinity,
+	.irq_set_vcpu_affinity	= riscv_iommu_ir_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index ed973979d795..a42f0b6a88d4 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -82,6 +82,7 @@ struct riscv_iommu_msi_table {
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
 	u64 msi_addr_pattern;
+	const void *owner;
 };
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
