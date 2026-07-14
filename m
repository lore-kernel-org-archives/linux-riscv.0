Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24975C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gTTNCAub+5EpIpqrlXh8F92ViOvjEQov6zUazyGxpE=; b=eltWKHNqHBxGDm
	b3GWRoh18okSG+BSGp2CgTmvMl9mSsvB+CKHg4oEd5Zn5DIImoYSXultaKZ7gSqXBCVsmt/pkRvV5
	nCsMMDHf9nckY/YMrjHMhzH+3sji1wV/iFdzG8ol4wQ9fh5X6b12sYo4LAlRwJ357vKxQjXu9nrXs
	AO38uaax79EI6mb5otcB06yWCLdkogqHG1H7vn6o33Zsha4wJAgNVkflQEs77uTdN7a4rdIMC3++G
	gkGLYUrVgB4wFmt3K+60XnlP6reMewYx503bxpwRsLwWZWYpDX0zJbH2PeIR8zGncXO4kJVkXJcbC
	nfzqPDAP9xAOhek2h+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcrq-0000000C6bw-0MpZ;
	Tue, 14 Jul 2026 13:08:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcro-0000000C6af-13Ji
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jul 2026 13:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JpT9/sOjxA5cBGNsD1q8lvPgS5awws3sRPjnLJKoBtI=; b=HfZASGJ5+2zrZp2VTZP3kQmMyV
	ESfFpwPy8qqe/aTzoN8I+YLDWeBRwnzrlvivmt1ZNhEsrXHdY7XRlO/LToBBxpVfR6ZEyMjFqJ4Ln
	J6OIFiJyjCjo1oLOMA9qvtTo2m1AgTX6VQ+2QDkIoXzTstRIxB2Fbs07Zw+Su1IhfFiysLQ0N0qu+
	esbDTHt+conT9nbw2RjT2wWNEDTMiCieKW0NT94XedP13mcMYJsYZj+nFO3MgPqButL9IDz2zsDhY
	cJdR9uu+EGfU9Nvxw/JyMaRRMuDwz7EJLsn7Wq9tEGmWmTRheVhz7EvTBNpUDFJieIUAa7dz/pdgz
	MmhGIqkw==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcrl-0000000CW00-0ol3
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:08:07 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7e9f829d75aso611197a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034479; x=1784639279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpT9/sOjxA5cBGNsD1q8lvPgS5awws3sRPjnLJKoBtI=;
        b=EhSS4FlsF+P42h546xSm0EssMnkKRgDO0aqWfobvsdbddPF/xz68dmOAajTXDUwhHt
         43zeaiMrNAxqJwbcGAQif36fwawde5+r6UHdvu5I2LeLmxbY1eYpQ69+HcymGCUw8ogA
         GAjik/MgyLzOWOD/yOBVKEtxZEZnugxza/SF6AeI6eTqRgAkiSffuZhOm4f/s/H6sGdo
         7bLXiFLnZkWomvHITRVx+LjB9aac21M2AltmG5R7O+HPEWbRFplhI/EYegFgifkg9yIx
         BbYiotD+d+RRg8GhXFV4idETw+WExsaGzJ1nGHVG0DshulU46U24WKOXLnMALV103IPA
         7tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034479; x=1784639279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpT9/sOjxA5cBGNsD1q8lvPgS5awws3sRPjnLJKoBtI=;
        b=mtfCXNvJJrHcaaji8GQJBHcMMflKNc86qz0zEDZUFF+qrjbhsppGAw5Su/AkGl7wgm
         9xu+LHjMvyfutCn9/vztkmaOMZsZ/FynntwamHbgvEoDHkyQgQlb/8T1xz45GWVKJ2nP
         +I+/2/tUkg0s2+EVzaPdB0om9kO1tDc6cXBaWeaD8AtBOaG5puMoFUpbsrEqqaS6cGsG
         0bTd1xzyz+qOh+mP2Mm7IRWw4OR6QTe/+k17dzOGrMf45Pf6U+Sxiu1c3RmCYKOzmfeq
         fWAYYfxOVpShTNc08lE4cBef/yMDC6uPef7GEW0Ve+jIdA06bup6FLLQfnJ+Gk4yyge7
         fjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ90TXtM4B6QZrC+j15K3xkG7I99HyuopmUQFQn8pOcw2Y9D4cVVwpyzJDuaR2lxj+I0tLL6OY0U45rm8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAtNnBYjDe+94gPwGBg5iTKmi9D817PMotmBFDt/hnrFK5Rsu
	0Rkyz7fl+xjrOdkZJAFgtmGEQSULMRriRJGnX1CyowwZZuRtbms3ImFFZzxWxxPnLNo=
X-Gm-Gg: AfdE7cmOvDKy/BUO8ruEYYybH5BPJFOJuDJ4FSlVqX+iVQoodsjZHl4rVSCNfSI1EX3
	0CfFXXSpQf1L9auJgKblK82pEid/1huXuLqZm0a2HFmdY44h5yRj7AVj/aiBtzPhZsjl+U5Adeo
	yqXqHUL+/CBcrmeHpziwLAC3w+m7zCxoLAWQNMXeYDdiaP0E2UkswaJV6YHuJy/ETB9ZCDDTht5
	HdoMRAX7aMsXQtHQYR0K05Lqp/vh+cq3Q0gZFp1s3J/P4yK8Hm3WTeENy6nOb3ibr4FgRKKk4zM
	l//SFUzGuCx72LBQpbjMkbKmVXT0YG+CmniSeOxilnHP3w8OItk7LrS3P0MQoEUO/a8lnI8SVwe
	e4NSYXq8N0MUVU6VMxWtu6F6mv50hxOZKQgimR6lVWhfjP4nseKOtqqiAX6bLJxXZxoIqaENwJZ
	9ck55dLloa2+fsNBas0MBfX6qrpVt7GZwZPoksm2AdabTADQ4oDd717HA74XnyPQ==
X-Received: by 2002:a05:6830:b13:b0:7e6:da40:b7fa with SMTP id 46e09a7af769-7ec0983a65bmr8871169a34.24.1784034478996;
        Tue, 14 Jul 2026 06:07:58 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:58 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 4/7] iommu/riscv: Program QoS IDs for assigned groups
Date: Tue, 14 Jul 2026 21:06:54 +0800
Message-ID: <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_140805_398226_06C023F8 
X-CRM114-Status: GOOD (  23.17  )
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

Program RCID and MCID for RISC-V IOMMU groups through the device context
TA fields. The resctrl group assignment is per device group, so reject
BARE mode where only the per-IOMMU iommu_qosid global default is
available.

Validate every group member, firmware ID, device context, field value,
and QoS ID capability before changing hardware. Then update all members
through the checked IOMMU group helper so a validation failure leaves the
group unchanged.

Serialize DC.ta changes with context setup under qosid_lock. Change only
the RCID and MCID fields with ordinary accesses so fixed DDT mappings are
not subject to atomic LR/SC operations, invalidate active device contexts
after an update, and clear the IDs when a device is released.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/qos.h     |  16 +++
 drivers/iommu/riscv/iommu-bits.h |  15 +++
 drivers/iommu/riscv/iommu.c      | 200 ++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h      |   3 +
 4 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
index cf19e8438bb9..daa758d4efff 100644
--- a/arch/riscv/include/asm/qos.h
+++ b/arch/riscv/include/asm/qos.h
@@ -2,7 +2,23 @@
 #ifndef _ASM_RISCV_QOS_H
 #define _ASM_RISCV_QOS_H
 
+#include <linux/errno.h>
 #include <linux/percpu-defs.h>
+#include <linux/types.h>
+
+struct iommu_group;
+
+#ifdef CONFIG_RISCV_IOMMU
+int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid,
+				u32 mcid);
+#else
+static inline int riscv_iommu_group_set_qosid(struct iommu_group *group,
+					      u32 rcid, u32 mcid)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
 
 #ifdef CONFIG_RISCV_ISA_SSQOSID
 
diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index f2ef9bd3cde9..782de5c92727 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -63,6 +63,7 @@
 #define RISCV_IOMMU_CAPABILITIES_PD8		BIT_ULL(38)
 #define RISCV_IOMMU_CAPABILITIES_PD17		BIT_ULL(39)
 #define RISCV_IOMMU_CAPABILITIES_PD20		BIT_ULL(40)
+#define RISCV_IOMMU_CAPABILITIES_QOSID		BIT_ULL(41)
 #define RISCV_IOMMU_CAPABILITIES_NL		BIT_ULL(42)
 #define RISCV_IOMMU_CAPABILITIES_S		BIT_ULL(43)
 
@@ -274,6 +275,14 @@ enum riscv_iommu_hpmevent_id {
 #define RISCV_IOMMU_TR_RESPONSE_SZ	BIT_ULL(9)
 #define RISCV_IOMMU_TR_RESPONSE_PPN	RISCV_IOMMU_PPN_FIELD
 
+/* 6.27 IOMMU QoS IDs for IOMMU-initiated requests (32bits) */
+#define RISCV_IOMMU_REG_IOMMU_QOSID	0x0270
+#define RISCV_IOMMU_IOMMU_QOSID_RCID	GENMASK(11, 0)
+#define RISCV_IOMMU_IOMMU_QOSID_MCID	GENMASK(27, 16)
+
+#define RISCV_IOMMU_IOMMU_QOSID_RCID_SHIFT	0
+#define RISCV_IOMMU_IOMMU_QOSID_MCID_SHIFT	16
+
 /* 5.27 Interrupt cause to vector (64bits) */
 #define RISCV_IOMMU_REG_ICVEC		0x02F8
 #define RISCV_IOMMU_ICVEC_CIV		GENMASK_ULL(3, 0)
@@ -371,6 +380,12 @@ enum riscv_iommu_dc_iohgatp_modes {
 
 /* Translation attributes fields */
 #define RISCV_IOMMU_DC_TA_PSCID		GENMASK_ULL(31, 12)
+/*
+ * QoS IDs for translated device requests and IOMMU accesses with a
+ * device context (when capabilities.QOSID == 1).
+ */
+#define RISCV_IOMMU_DC_TA_RCID		GENMASK_ULL(51, 40)
+#define RISCV_IOMMU_DC_TA_MCID		GENMASK_ULL(63, 52)
 
 /* First-stage context fields */
 #define RISCV_IOMMU_DC_FSC_PPN		RISCV_IOMMU_ATP_PPN_FIELD
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..deab646bb1ea 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -48,6 +48,8 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+static const struct iommu_ops riscv_iommu_ops;
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -1091,6 +1093,28 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 }
 
 #define RISCV_IOMMU_FSC_BARE 0
+#define RISCV_IOMMU_DC_TA_QOSID \
+	(RISCV_IOMMU_DC_TA_RCID | RISCV_IOMMU_DC_TA_MCID)
+
+static u64 riscv_iommu_qosid_ta(u32 rcid, u32 mcid)
+{
+	return FIELD_PREP(RISCV_IOMMU_DC_TA_RCID, rcid) |
+	       FIELD_PREP(RISCV_IOMMU_DC_TA_MCID, mcid);
+}
+
+static void riscv_iommu_dc_update_qosid(struct riscv_iommu_device *iommu,
+					struct riscv_iommu_dc *dc,
+					u32 rcid, u32 mcid)
+{
+	u64 qos_ta = riscv_iommu_qosid_ta(rcid, mcid);
+	u64 ta;
+
+	lockdep_assert_held(&iommu->qosid_lock);
+	ta = READ_ONCE(dc->ta);
+	ta = (ta & ~RISCV_IOMMU_DC_TA_QOSID) | qos_ta;
+	WRITE_ONCE(dc->ta, ta);
+}
+
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
  * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
@@ -1202,12 +1226,23 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	 * is stored as DC_TC_V bit (both sharing the same location at BIT(0)).
 	 */
 	for (i = 0; i < fwspec->num_ids; i++) {
+		u64 dc_ta;
+		u64 ta_mask = RISCV_IOMMU_PC_TA_PSCID;
+
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
-		tc |= ta & RISCV_IOMMU_DC_TC_V;
+		dc_ta = ta;
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID) {
+			dc_ta |= READ_ONCE(dc->ta) &
+				 (RISCV_IOMMU_DC_TA_RCID |
+				  RISCV_IOMMU_DC_TA_MCID);
+			ta_mask |= RISCV_IOMMU_DC_TA_RCID |
+				   RISCV_IOMMU_DC_TA_MCID;
+		}
+		tc |= dc_ta & RISCV_IOMMU_DC_TC_V;
 
 		WRITE_ONCE(dc->fsc, fsc);
-		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->ta, dc_ta & ta_mask);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1474,13 +1509,174 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
+static void riscv_iommu_qosid_invalidate_did(struct riscv_iommu_device *iommu,
+					     unsigned int did)
+{
+	struct riscv_iommu_command cmd;
+
+	riscv_iommu_cmd_iodir_inval_ddt(&cmd);
+	riscv_iommu_cmd_iodir_set_did(&cmd, did);
+	riscv_iommu_cmd_send(iommu, &cmd);
+}
+
 static void riscv_iommu_release_device(struct device *dev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	bool sync_required = false;
+	unsigned int i;
+
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID) {
+		mutex_lock(&iommu->qosid_lock);
+		for (i = 0; fwspec && i < fwspec->num_ids; i++) {
+			struct riscv_iommu_dc *dc;
+			u64 tc;
+
+			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+			if (!dc)
+				continue;
+
+			tc = READ_ONCE(dc->tc);
+			riscv_iommu_dc_update_qosid(iommu, dc, 0, 0);
+			if (!(tc & RISCV_IOMMU_DC_TC_V))
+				continue;
+
+			dma_wmb();
+			riscv_iommu_qosid_invalidate_did(iommu, fwspec->ids[i]);
+			riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp,
+						   dc, NULL);
+			sync_required = true;
+		}
+
+		if (sync_required)
+			riscv_iommu_cmd_sync(iommu,
+					     RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		mutex_unlock(&iommu->qosid_lock);
+	}
 
 	kfree_rcu_mightsleep(info);
 }
 
+struct riscv_iommu_qosid_hw_ctx {
+	u32 rcid;
+	u32 mcid;
+	bool has_devices;
+	bool has_qosid;
+	bool reset;
+};
+
+static int riscv_iommu_qosid_validate_dev(struct device *dev, void *data)
+{
+	struct riscv_iommu_qosid_hw_ctx *ctx = data;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu;
+	unsigned int i;
+
+	ctx->has_devices = true;
+
+	if (!dev->iommu || !dev->iommu->iommu_dev ||
+	    dev->iommu->iommu_dev->ops != &riscv_iommu_ops)
+		return -EOPNOTSUPP;
+
+	if (!fwspec || !fwspec->num_ids)
+		return -ENODEV;
+
+	iommu = dev_to_iommu(dev);
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
+		return ctx->reset ? 0 : -EOPNOTSUPP;
+
+	ctx->has_qosid = true;
+
+	/*
+	 * IOMMU group QoS is a per-device assignment. BARE mode only has the
+	 * per-IOMMU iommu_qosid register, which is a global default rather
+	 * than a safe target for moving an individual group between resctrl
+	 * groups.
+	 */
+	if (iommu->ddt_mode <= RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		if (!riscv_iommu_get_dc(iommu, fwspec->ids[i]))
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void riscv_iommu_qosid_apply_dev(struct device *dev, void *data)
+{
+	struct riscv_iommu_qosid_hw_ctx *ctx = data;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu;
+	bool sync_required = false;
+	unsigned int i;
+
+	iommu = dev_to_iommu(dev);
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
+		return;
+
+	mutex_lock(&iommu->qosid_lock);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct riscv_iommu_dc *dc;
+		bool dc_is_valid;
+		u64 tc;
+
+		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+		if (WARN_ON_ONCE(!dc))
+			continue;
+
+		tc = READ_ONCE(dc->tc);
+		dc_is_valid = tc & RISCV_IOMMU_DC_TC_V;
+
+		riscv_iommu_dc_update_qosid(iommu, dc, ctx->rcid, ctx->mcid);
+		dev_dbg(dev, "set QoS ID DC.ta did=%u rcid=%u mcid=%u\n",
+			fwspec->ids[i], ctx->rcid, ctx->mcid);
+
+		if (dc_is_valid) {
+			dma_wmb();
+			riscv_iommu_qosid_invalidate_did(iommu, fwspec->ids[i]);
+			riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp,
+						   dc, NULL);
+			sync_required = true;
+		}
+	}
+
+	if (sync_required)
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+	mutex_unlock(&iommu->qosid_lock);
+}
+
+int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid, u32 mcid)
+{
+	struct riscv_iommu_qosid_hw_ctx hw = {
+		.rcid = rcid,
+		.mcid = mcid,
+		.reset = !rcid && !mcid,
+	};
+	int ret;
+
+	if (rcid > FIELD_MAX(RISCV_IOMMU_DC_TA_RCID) ||
+	    mcid > FIELD_MAX(RISCV_IOMMU_DC_TA_MCID))
+		return -ERANGE;
+
+	ret = iommu_group_update_devices(group, &hw,
+					 riscv_iommu_qosid_validate_dev,
+					 riscv_iommu_qosid_apply_dev);
+	if (ret)
+		return ret;
+	if (!hw.has_devices)
+		return -ENODATA;
+	if (!hw.has_qosid && !hw.reset)
+		return -EOPNOTSUPP;
+
+	pr_debug("set qosid: group=%d rcid=%u mcid=%u\n",
+		 iommu_group_id(group), rcid, mcid);
+	return 0;
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..2c57625637bf 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -19,6 +19,9 @@
 
 struct riscv_iommu_device;
 
+int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid,
+				u32 mcid);
+
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
 	atomic_t head;				/* unbounded shadow ring buffer consumer index */
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
