Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E5E83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vle2kQK5YGBepGKKiGy37k2peBjkXJxDLbOGH6+TGsM=; b=AksKDlV5DEZtNH
	XeJRpu0Sz0p28hfcaFMiJsRuFr490h3yQaXpBuMKTIaY/EDbVMjpTVi26NkYm6j7xLPueYrm0132G
	teGHKEEoXtKL9DKumopL4dsgxj2wo0H5LMiUjBPkX7PQaRPvGz8j81TgDQI3j6ZhdxaKpWpgp8eEv
	CJqPhm5TU7PqElfs+6g4KIX4DRL5e3zWXDFqpTzARWDSe0qD0V1mWKPYT5GC91BcrCkpwmCzJ9tqo
	67OVL/VSOp0V+vm7vdWTs1V0+s8asOgMJFveKTHRAbIOq3SSWj2cg2TYewVeEplDF6CLS4k0SlbN1
	7tMi83gjt+3rGHVyXi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYtW-00000008AKJ-3C5N;
	Wed, 04 Feb 2026 09:09:54 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYtU-00000008AC4-3ZuR
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770196169;
	bh=9p3twHDaUqc2iP6C1Th5oUPw6tcNjjsFdmvTfaJG2PY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=M/ytgpqP/93rnYTa2g41VFN9YetxoNM6yBJhwy4umJxGUmj32hOVQgy2zhpIUqxfV
	 vTyDdeZuRCXY/to1NW4F3TNux/o9YgL0REDhhE7hz+qUDA4B4zI6tJ6N5/GvqNciyk
	 hDRESSfvKYFJm8AkGccOJQBS6RwS6iFFbbTISGTs=
X-QQ-mid: esmtpsz11t1770196167tc89ab0a1
X-QQ-Originating-IP: dOQSd0sgXrqQFSqDaWAiT5eRXS3TmovakX/BJqqKSqc=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 17:09:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15720136353001849999
EX-QQ-RecipientCnt: 19
From: Lv Zheng <lv.zheng@linux.spacemit.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>,
	Lv Zheng <lv.zheng@linux.spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/8] riscv/iommu: Add vendor event support for RISC-V IOMMU HPM
Date: Wed,  4 Feb 2026 17:09:21 +0800
Message-ID: <66EE5293179955C2+b36c442fcfc891d472e9465a83b6521ef747faac.1770195980.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770195980.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MK5U7QanZrCwQbCeBYwZmqAu46GgLebUm/CSRk/8Z7OVmOFKPvwYRINM
	ksy9O5S9COxUOHxafc9VO+gE6RVP0iEHe4kN9gtSNhNl2nKRTQq+zEP5N8c75CJLI5+tSlp
	rWfrMouxiSwUmGn+HfvmFjfyxjQiA6DuGX1F9HSUm1N60HwmicaK3qFZMi+xzeMpZEiqmPY
	XIrsMiL/JAofDoKvV0wJDq94z/TddjNoYN6/emfkG+8KxkYYTmLBDCCZaFzIq2wN0M/SX9V
	NzBz7mgnFDdWYtoOtCk9YSsORtsQd4jCLyEDfAirE2ZSWErfJdoMAYgFtZyUxPK29gaizG8
	7TFet1gv1JDp2rTnSB+rPuTmtWa2V/nPEY6XaktRdzj2Z738W2LvZRr6CfgNOoBwcnXf+II
	hFHxE3u1KJhTaoHF7vDTA2QWbFq33LKronAac6igs65jegHLtXLJkrkmGctUjeQdoCbE1e1
	gu31OeoEK4hlVqf05bf7zOeGNIrlJRIRqhRMQX+g3iH0VH6nAoyez8RW4SMFez25QUV9TIJ
	RDW/+FIgzBx2w/2ct5yTbGMr+TmbAST6wMBfDZZ72AsuG7c5F0yL7Tzl1xtfW3bTjBV56EY
	0D/NEfnhuEW4x6/6daimpaa11RqiPv0V29qzQG5VoaSaNwyQIumfR/TN8fMP9+88Z7iuqBE
	g+cqJzZmg46S8T1jwqcc254kIVTD5KT5oKdXdZpz/SS5xDgmbxKTUEQAA5s3kX5Z0HIPVH1
	qDFCCX+MO6ez6CV02dl6y4Es/a1dAYphccOvV+8pRNRnikI3mr+h2FwI66wKzqbuYZDE9Dl
	T//JxrYajwrKSwrJJkv4evd0bwMNgTE5aOq1xIom9KC1ntEByMDd81LdY2yCaqwsqd9qNM7
	MOeJ0ksGgFF6DtCXvoNy9nLXxUqE/cISbmy86W4BZnD+0XC77GLVnktdc9hkWfpF58HHhYk
	cET+4zuLsr41wUiXvXa+Kj1+7qP6hK7cHNVpACezSy0FMZwv5oJR43Qyy9yUK7hraAf/4fK
	BLnv5sGzBPi3UEi4g6eR4fEcZYuFrYeNba2j7slbAWR7kxAcN3
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_010953_282281_94B3F0C0 
X-CRM114-Status: GOOD (  17.41  )
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

Adds mechanism to allow vendor events to be registered via userspace
jevents. By default, vendor event identifier matches "riscv,iommu", and
the events are registered as "riscv_iommu_hpm" events.

Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
Signed-off-by: Jingyu Li <joey.li@spacemit.com>
---
 drivers/iommu/riscv/iommu-hpm.c | 63 +++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h     |  1 +
 2 files changed, 64 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-hpm.c b/drivers/iommu/riscv/iommu-hpm.c
index f1b265634e51..e140cf59c408 100644
--- a/drivers/iommu/riscv/iommu-hpm.c
+++ b/drivers/iommu/riscv/iommu-hpm.c
@@ -447,6 +447,30 @@ static const struct attribute_group riscv_iommu_hpm_cpumask_group = {
 	.attrs = riscv_iommu_hpm_cpumask_attrs,
 };
 
+static ssize_t riscv_iommu_hpm_identifier_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	struct riscv_iommu_hpm *iommu_hpm = to_iommu_hpm(dev_get_drvdata(dev));
+
+	if (!iommu_hpm->identifier)
+		return 0;
+
+	return sysfs_emit(buf, "%s\n", iommu_hpm->identifier);
+}
+
+static struct device_attribute riscv_iommu_hpm_identifier_attr =
+	__ATTR(identifier, 0444, riscv_iommu_hpm_identifier_show, NULL);
+
+static struct attribute *riscv_iommu_hpm_identifier_attrs[] = {
+	&riscv_iommu_hpm_identifier_attr.attr,
+	NULL
+};
+
+static const struct attribute_group riscv_iommu_hpm_identifier_group = {
+	.attrs = riscv_iommu_hpm_identifier_attrs,
+};
+
 #define IOMMU_HPM_EVENT_ATTR(name, config)		\
 	PMU_EVENT_ATTR_ID(name, riscv_iommu_hpm_event_show, config)
 
@@ -522,6 +546,7 @@ static const struct attribute_group *riscv_iommu_hpm_attr_grps[] = {
 	&riscv_iommu_hpm_cpumask_group,
 	&riscv_iommu_hpm_events_group,
 	&riscv_iommu_hpm_format_group,
+	&riscv_iommu_hpm_identifier_group,
 	NULL
 };
 
@@ -624,6 +649,36 @@ static void riscv_iommu_hpm_reset(struct riscv_iommu_hpm *iommu_hpm)
 	riscv_iommu_hpm_interrupt_clear(iommu_hpm);
 }
 
+static bool riscv_iommu_hpm_is_identifier_compat(const char *compat)
+{
+	return !strcmp(compat, "riscv,iommu");
+}
+
+static const char *riscv_iommu_hpm_get_identifier(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	const char *compat;
+	int count, i;
+
+	if (!np)
+		return NULL;
+
+	count = of_property_count_strings(np, "compatible");
+	if (count <= 0)
+		return NULL;
+
+	for (i = 0; i < count; i++) {
+		if (of_property_read_string_index(np, "compatible",
+						  i, &compat))
+			continue;
+
+		if (riscv_iommu_hpm_is_identifier_compat(compat))
+			return devm_kstrdup(dev, compat, GFP_KERNEL);
+	}
+
+	return NULL;
+}
+
 static void riscv_iommu_hpm_set_standard_events(struct riscv_iommu_hpm *iommu_hpm)
 {
 	/* Cycles counter is always supported */
@@ -650,6 +705,7 @@ static void riscv_iommu_hpm_remove(void *data)
 static int riscv_iommu_hpm_register_unit(struct riscv_iommu_device *iommu,
 					 struct riscv_iommu_hpm *iommu_hpm,
 					 u32 offset, int irq,
+					 const char *identifier,
 					 const struct attribute_group **attr_groups,
 					 const char *prefix)
 {
@@ -663,6 +719,7 @@ static int riscv_iommu_hpm_register_unit(struct riscv_iommu_device *iommu,
 	unique_id = atomic_fetch_inc(&riscv_iommu_hpm_ids);
 	memset(iommu_hpm, 0, sizeof(*iommu_hpm));
 	iommu_hpm->iommu = iommu;
+	iommu_hpm->identifier = identifier;
 
 	if (offset + RISCV_IOMMU_REG_SIZE <= iommu->reg_size)
 		base = iommu->reg + offset;
@@ -791,6 +848,7 @@ static void riscv_iommu_hpm_exit(void)
 int riscv_iommu_add_hpm(struct riscv_iommu_device *iommu)
 {
 	struct device *dev = iommu->dev;
+	const char *identifier;
 	int irq, rc;
 
 	if (!FIELD_GET(RISCV_IOMMU_CAPABILITIES_HPM, iommu->caps)) {
@@ -809,7 +867,12 @@ int riscv_iommu_add_hpm(struct riscv_iommu_device *iommu)
 	if (rc < 0)
 		return rc;
 
+	identifier = riscv_iommu_hpm_get_identifier(dev);
+	if (identifier)
+		dev_info(dev, "HPM: Vendor identifier: %s\n", identifier);
+
 	rc = riscv_iommu_hpm_register_unit(iommu, &iommu->hpm, 0, irq,
+					   identifier,
 					   riscv_iommu_hpm_attr_grps,
 					   "riscv_iommu_hpm");
 	if (rc < 0)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 0ad9f5cad4de..d3c11abef5cf 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -41,6 +41,7 @@ struct riscv_iommu_hpm {
 	int irq;
 	int on_cpu;
 	struct hlist_node node;
+	const char *identifier;
 	/*
 	 * Layout of events:
 	 * 0       -> HPMCYCLES
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
