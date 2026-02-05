Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9733FE91299
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nROLZpWiWT+pHFovMi9DHvwDBRbZQBsGtUqwYatnm8E=; b=c18zzDg1RusJ80
	l3/o94afdqb2rdh5VM6s5o2F4pyCB33mAMHrwiMp33XZMO9wVtnhHf/EkRZXvRva8HjfYqtNL4VBH
	Zf0Gt4w7VLSH2WCtDY62N/tu5iAgxBqWZLy4N0wcn9MPNhL1IZMVlKOnfi2ddDzio7xIPLzF5iOGF
	XWWre5YZ7QXOmpLmQBqhkt4iOB6btMj3Gs34kl3J3B5TyjzjjYrgPHY/9jtLi+6TlWrPz4fg5RHKr
	BLp2/unuaL5g1RjYuTG55/QGa3euaCII7wQAcFy347pTAc+khZomtsrPq/wcLODW5lri2GtZlXNdz
	Pa1IKPeaUSduMPPOdXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvOf-00000009fbD-2T3Z;
	Thu, 05 Feb 2026 09:11:33 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvOU-00000009fSI-392m
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770282659;
	bh=VHjIDDa6NWq53y9Nca1m6Txf2KFKP1m6ZhkSL3s92vo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fvOuQhyorYAKCHfnSoeuEtrYPPeLCa8tbZ6Sk2nix2q2lUqsOCowNhvjNzCdidMsK
	 TGANMi+GIwAOWoAqq17rkPeE5FxuPPnuvQ8glDlI+rwvmCmXOxkGyxKnFQQhdr1ukd
	 D9CGUS3O/6z2IAv2vGoG2yDClCHbGqfXpHt7qvw0=
X-QQ-mid: esmtpgz15t1770282658t67abc38d
X-QQ-Originating-IP: PWcwMXHfPU6D+9OfCYZaXoiyeDhdI4y7+BNQfv/6mvI=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 17:10:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13911501969854134547
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
Subject: [PATCH v4 4/7] iommu/riscv: Add vendor event support for RISC-V IOMMU HPM
Date: Thu,  5 Feb 2026 17:10:53 +0800
Message-ID: <17ADCFC5ACF772A6+7c69dba6df8eb79aa3eb11781518a47143033b1e.1770281596.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770281596.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770281596.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MRiFTjyIbtS1KK1EQQOKZQfCeu9NZge1g/BCYbotSDLhgdo4pbGOKqlw
	4L2fccsQoP0MLso0YSgpDlMyTIu3zlqUgDKnKsEIc/chuH3y9FjmhirvLu5Hrl4+tzJac/2
	KfZq39Z70cMhCAZzfcylIM54dcU6erghiD14tp/4Lvc1PBnUFyhIfv3IzffvDFVKDlrbff4
	LzeBF6lWKM8QdLmI5eamgO9q8245S8X0x/EFhcbX15V2QEDRB+FRpQLd1PYMVxFGze+0knw
	JBrlT2Ual26TqDzKc0KsIJpuSGi50qHb0GxJP/0ISjhMq5xdgs1DsYQ6+P4Xz7W+JgxZrUv
	0m+E17yCpKspnNBVYYa6R6Ca4hoHr54FLtlhVcMGC+gN2iLbaFTWB7AWO6Og0piLRZBewDV
	NrZtYHxjn5qFp4P8BWEHD9BMqteUxdpkBK/rO0ftpSru6owz4C37KGFG7nsm9KMT6kY6RKT
	svia79Y8RkoikQ5w+/jiWuZOC4LtN2RkXsIugDW1YxklGu/7Y9gcinm8gjhGlfg6JYcc2Bh
	fmzE95ka0fYAh4caWCBasMEkqXyWkqJmZyoyva8ZwZ1a7qq3t/hSVDl8fmIz2q1E+fzd1dr
	vNx+UicK7/uHP1/93pbNwcZ/2e1c3auXMJv1/DvyDJ5+JvqHgCGGLBp38pZubqV9k2S8pfb
	m9tH15/eXh6rnW+OBg73GtHwLxIIiFj6QDrZ0FU+TPd7YbTsM/AhKMHeNO25g1KwMqnSNVt
	V93WTJrWHkTX9MrU7WbxGGXWxgNqUe+ZgUac8V88NPDrAG5B6c1dKwROZalDghplxLkgd1+
	8EedcA0cx81EVzOvG3Ndi3rIfdv3KQHihRQpY+R3qZVCJCr2dpgsc+dI1pRwBzSkkuR5In3
	bRTKUEFa4PEw7ijrT5G/IwTg1QnodhbkO5xdnfDqBB2xWdtMD8KISP/1reQNSsttPBJCWFL
	J/yJ98fzWnf5hcAokW4/f5CC/WZT4Bt/odhPqB5LaUm7B3yWojIjmW9J7XU/ig1aFga2OfE
	dnmYHsTrGN9B/9lQ92V3nUVdh/HskizwtYWLn+WyXrPJ60Ukyb1U4XNAzNG7xzkbdcpTHW7
	w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_011123_276178_8AF819E9 
X-CRM114-Status: GOOD (  17.39  )
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
index fe51f60c0c75..4615c4b161a0 100644
--- a/drivers/iommu/riscv/iommu-hpm.c
+++ b/drivers/iommu/riscv/iommu-hpm.c
@@ -443,6 +443,30 @@ static const struct attribute_group riscv_iommu_hpm_cpumask_group = {
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
 
@@ -518,6 +542,7 @@ static const struct attribute_group *riscv_iommu_hpm_attr_grps[] = {
 	&riscv_iommu_hpm_cpumask_group,
 	&riscv_iommu_hpm_events_group,
 	&riscv_iommu_hpm_format_group,
+	&riscv_iommu_hpm_identifier_group,
 	NULL
 };
 
@@ -620,6 +645,36 @@ static void riscv_iommu_hpm_reset(struct riscv_iommu_hpm *iommu_hpm)
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
@@ -646,6 +701,7 @@ static void riscv_iommu_hpm_remove(void *data)
 static int riscv_iommu_hpm_register_unit(struct riscv_iommu_device *iommu,
 					 struct riscv_iommu_hpm *iommu_hpm,
 					 u32 offset, int irq,
+					 const char *identifier,
 					 const struct attribute_group **attr_groups,
 					 const char *prefix)
 {
@@ -659,6 +715,7 @@ static int riscv_iommu_hpm_register_unit(struct riscv_iommu_device *iommu,
 	unique_id = atomic_fetch_inc(&riscv_iommu_hpm_ids);
 	memset(iommu_hpm, 0, sizeof(*iommu_hpm));
 	iommu_hpm->iommu = iommu;
+	iommu_hpm->identifier = identifier;
 
 	if (offset + RISCV_IOMMU_REG_SIZE <= iommu->reg_size)
 		base = iommu->reg + offset;
@@ -788,6 +845,7 @@ static void riscv_iommu_hpm_exit(void)
 int riscv_iommu_add_hpm(struct riscv_iommu_device *iommu)
 {
 	struct device *dev = iommu->dev;
+	const char *identifier;
 	int irq, rc;
 
 	if (!FIELD_GET(RISCV_IOMMU_CAPABILITIES_HPM, iommu->caps)) {
@@ -806,7 +864,12 @@ int riscv_iommu_add_hpm(struct riscv_iommu_device *iommu)
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
