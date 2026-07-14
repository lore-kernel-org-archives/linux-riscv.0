Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE149C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSgjXO7yl07W1/9g5EXxDpYaqt76KOM+rVekryipZOQ=; b=aY4eLxlWBU0fn2
	bGOFY/PwNejKjjqGDjKcY7qSXLFGZYtT2PAIwTy9MKLqHDwoSy1Z3XX4XGDmCt2QyK0EOIYPcKEHF
	eM35lmB6Opp6PaQjNAh6I2Qdy0a+gBL2KIdFwS747rbSBl8xJLBzL4PzbZ/qvvTZ07cksjH+3CB1R
	CYU4itsR9ejS7lZDTa/0zWb0ZPtQOzsevFhtyBADWX4NFw2oV4pS4PWk1yE9krPJgiIJYbdJP8fV4
	mGhAQsN5lQP58T3kBfaVcx0osECF4z64HJvIP8b9mTacbucaKzTO0fcn9d0Y5p1qJ8EpdjsMAK0/b
	6pgHcsYwEWPi1MvpXtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcrx-0000000C6gU-0sno;
	Tue, 14 Jul 2026 13:08:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcrw-0000000C6fV-0XTd
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jul 2026 13:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tyPwfho2+gt5VglzPQUkATM5bIbB7AhJfPglM91knA4=; b=JEu77WASAl0+gKfBbWzqdMT0BV
	3zSnEc4JFu52oBAvzA3lk9qp47D2wAFcIjzqUolceoJSx6kiLm1nU8tAltcg/K7HvLccHFdUWNCQM
	+DtU9pM6j8S8kvI07AHMzyRWUHmQ6LhOpnXb5LnxWb1AoauPNaK3KwlIPjv7eXbotHEZJRFb60bQL
	H7P2TTQ0/2rNnpOcKX6E//RKhnGVybaUQIDxz0h63vy6pEX6UTNQoOKv4fdbeDi2yhek1phj86u1U
	3dmdMJsz+Ay9+Pfn94thMHxESFjAKrGhxbp1wDTYSCMzUsUl55hJ4HnR1rLkEbzoO2lDVj4tXNIfL
	6ZonWegQ==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcrt-0000000CW1d-0xUO
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:08:15 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so700390a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034491; x=1784639291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyPwfho2+gt5VglzPQUkATM5bIbB7AhJfPglM91knA4=;
        b=EmFpuG2NxaBKjQONjJsBgOXt0Q7xr+jBoahK0+ReJIi0k0k3bZvEfYx9D1b6PHoV5U
         I81zNqC2KArb78HnrJNsLP3j5kE18sf0Dda/P098bP1J4d43Q759Qab0hNRTGVEecano
         vUO99IFR7Y6cra+2IZI3IngES3LjH/QAPWoY9B1CicHSCzkpJkJyZA3DPj6fCsyCSlZL
         4snlgkJbVbEkre1s9wEZTaGu2MkqpU5Aufze8KW9v7JZ6GEGSM8yXB5RXGvGiFuYSdRt
         Olljfy89KoZ3Z8Hw//cioiyXI/3DtYNAvjjpWkTEtIGbCxDIvOXJSOTz7iKTPTUwo4fC
         wvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034491; x=1784639291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyPwfho2+gt5VglzPQUkATM5bIbB7AhJfPglM91knA4=;
        b=HBzKNycwdj8fRQ9vXxmg0gRCbHg+C5TlK+hyFvHgp94LZrZcjhlIeIBnvifaCWVju3
         uytR2t/Ef/dpChOxZH2l3u5XMHoPZvZnJT7M17ZioIExElqkeWtvtH5FloC2sigCh7Yq
         XQ+Q9t/wzz/F18+0QRIc18X7zySzXG0lDGT0tPaB+QmISWxQljELb27B29FvJ1jPWOff
         hUESQcSoMV9nIVk7xhZxTL8CHotDIQe1jLcn/Jxrpnxucm74EeERZHwRy8dIas16gf12
         5IfBZzyW58J7h5f8DqNeyfR16ISXSeoH8x28Kd/duEpEM4Jr0AEu1M27TXI00T243huI
         jENQ==
X-Forwarded-Encrypted: i=1; AFNElJ+So+QPoZmzDUJT0zMNeLCFxJf9QSu6xr6wwqU9DyoRoXLllwLApv3iPtweOQ7hvHeTDsoiXhLBXA7JpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu5qmObGj39AT6FA6z5kBhgx1sAdggCeB7YsaIj8lqRe3BRrae
	7Pr5X7PgDpxeLRRaPjxCjiX4TkiNZUklXEKTY4orgG39hOUBw3oKdI5u/Lf6Xm1+gUw=
X-Gm-Gg: AfdE7cktVN3XVoZ98ZX69c6qGmlSLy8K7W4r9yK5yWn0hVydKSVXoVBPdfziFZo0COW
	of6PnxHaADPWKL9Hfvdnyv6d29Qyx9dcWDt1tE8i16+2q8DKfaQTTc0XOkdtxkRx0Y9Du66Dr5s
	7og6TAX7rbF0/8VHeLbITN4OP0DBxyWcQm4zJSrcGA0bdkENvsRlTQbyx3I6LECBdw3B3sk2Kur
	xtZjoaNfBLm8nhHNYNFEs+H5tFVULZTg0t94jx/pM/ieuOaBN+IGdV4qmziwRHSxNqoU+Qlwz44
	HNQLPB+x3ofMmwh9oMeRizLvwy9W6gR0KEGqQkcNAuzU8mt8A6obg7PdmyuZEE+0Xh4W9h2mxgZ
	8sQJBP8kGD3J2aVB2af2y2/cAnHLI9KXr/5P8GxUcTgEvz1PoYx9+LdZ1r1FCZQSLuSchOuSzXU
	elr2YoxRfADCgKWSoxbkGWSWvm/igq0MdFQtmZGKRqwWaOPIkgCoyzCqykXEK6vg==
X-Received: by 2002:a05:6830:82ad:b0:7eb:3af8:8c1a with SMTP id 46e09a7af769-7ec096ecdc5mr8483705a34.9.1784034490998;
        Tue, 14 Jul 2026 06:08:10 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:08:10 -0700 (PDT)
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
Subject: [RFC PATCH 5/7] iommu/riscv: Expose global QoS IDs in sysfs
Date: Tue, 14 Jul 2026 21:06:55 +0800
Message-ID: <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_140813_441592_D34A6CBC 
X-CRM114-Status: GOOD (  26.65  )
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

The RISC-V IOMMU QoS extension provides iommu_qosid as a per-IOMMU
global default tag. It is used for IOMMU-originated DDT, CQ, FQ, PQ, and
MSI accesses, and for device-originated requests when DDTP is in BARE
mode.

Initialize iommu_qosid to RCID 0 and MCID 0 when the hardware advertises
QOSID support. Preserve reserved and WPRI bits with read-modify-write,
and use register readback to reject values which the WARL fields do not
retain.

Add a qosid attribute to the RISC-V IOMMU class device. Reading returns
the current RCID and MCID values. Writing the documented
'rcid=<rcid> mcid=<mcid>' form updates both fields while preserving the
other register bits.

Keep this interface separate from resctrl group QoS. The sysfs attribute
controls the IOMMU-wide default, while resctrl device assignment programs
per-device DC.ta in translated modes.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +++
 MAINTAINERS                                   |  10 ++
 drivers/iommu/riscv/iommu.c                   | 159 +++++++++++++++++-
 drivers/iommu/riscv/iommu.h                   |   9 +-
 4 files changed, 202 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu

diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
new file mode 100644
index 000000000000..b0cd68997f17
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
@@ -0,0 +1,27 @@
+What:		/sys/class/iommu/<iommu>/qosid
+Date:		June 2026
+KernelVersion:	6.18
+Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+Description:
+		The RISC-V IOMMU global default QoS IDs for this IOMMU.
+		The file is present only when the IOMMU reports the QOSID
+		capability.
+
+		Reading the file returns the RCID and MCID fields from the
+		iommu_qosid register:
+
+		  rcid=<rcid> mcid=<mcid>
+
+		Writing the file updates the RCID and MCID fields while
+		preserving reserved/WPRI bits:
+
+		  rcid=<rcid> mcid=<mcid>
+
+		Writes fail with ERANGE when either value cannot be represented
+		by the IOMMU. A successful write is verified by reading the WARL
+		fields back from the register.
+
+		The iommu_qosid register is a per-IOMMU global default. It
+		tags IOMMU-originated DDT, CQ, FQ, PQ and MSI accesses, and
+		in BARE mode device-originated requests. It does not assign
+		per-device or per-IOMMU-group QoS IDs in translated modes.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0b5d38b772e0..c59be02c8f02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23279,6 +23279,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V IOMMU QoS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+R:	Tomasz Jeznach <tomasz.jeznach@linux.dev>
+R:	Drew Fustini <fustini@kernel.org>
+R:	yunhui cui <cuiyunhui@bytedance.com>
+L:	iommu@lists.linux.dev
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index deab646bb1ea..e85da9eef58e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1658,6 +1658,7 @@ int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid, u32 mcid)
 	};
 	int ret;
 
+	/* Resctrl IDs are bounded by the system's reported controller counts. */
 	if (rcid > FIELD_MAX(RISCV_IOMMU_DC_TA_RCID) ||
 	    mcid > FIELD_MAX(RISCV_IOMMU_DC_TA_MCID))
 		return -ERANGE;
@@ -1688,9 +1689,154 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.release_device	= riscv_iommu_release_device,
 };
 
+static int riscv_iommu_set_default_qosid(struct riscv_iommu_device *iommu,
+					 u32 rcid, u32 mcid)
+{
+	u32 old_qosid;
+	u32 qosid;
+	int ret = 0;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
+		return -EOPNOTSUPP;
+
+	if (rcid > FIELD_MAX(RISCV_IOMMU_IOMMU_QOSID_RCID) ||
+	    mcid > FIELD_MAX(RISCV_IOMMU_IOMMU_QOSID_MCID))
+		return -ERANGE;
+
+	/*
+	 * iommu_qosid is a per-IOMMU global default. It tags IOMMU-originated
+	 * DDT/CQ/FQ/PQ and MSI accesses, and in BARE mode device-originated
+	 * requests. Per-device group QoS is still handled separately through
+	 * DC.ta.
+	 */
+	mutex_lock(&iommu->qosid_lock);
+	old_qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	qosid = old_qosid & ~(RISCV_IOMMU_IOMMU_QOSID_RCID |
+				RISCV_IOMMU_IOMMU_QOSID_MCID);
+	qosid |= FIELD_PREP(RISCV_IOMMU_IOMMU_QOSID_RCID, rcid) |
+		 FIELD_PREP(RISCV_IOMMU_IOMMU_QOSID_MCID, mcid);
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IOMMU_QOSID, qosid);
+
+	qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	if (FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_RCID, qosid) != rcid ||
+	    FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_MCID, qosid) != mcid) {
+		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IOMMU_QOSID,
+				   old_qosid);
+		ret = -ERANGE;
+	}
+	mutex_unlock(&iommu->qosid_lock);
+	if (ret)
+		return ret;
+
+	dev_dbg(iommu->dev, "set global QoS IDs rcid=%u mcid=%u\n",
+		(u32)FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_RCID, qosid),
+		(u32)FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_MCID, qosid));
+
+	return ret;
+}
+
+static int riscv_iommu_get_default_qosid(struct riscv_iommu_device *iommu,
+					 u32 *rcid, u32 *mcid)
+{
+	u32 qosid;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
+		return -EOPNOTSUPP;
+
+	qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	if (rcid)
+		*rcid = FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_RCID, qosid);
+	if (mcid)
+		*mcid = FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_MCID, qosid);
+
+	return 0;
+}
+
+static int riscv_iommu_init_default_qosid(struct riscv_iommu_device *iommu)
+{
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
+		return 0;
+
+	/* Avoid probing the live WARL fields with all-ones while in BARE mode. */
+	return riscv_iommu_set_default_qosid(iommu, 0, 0);
+}
+
+static struct riscv_iommu_device *dev_to_riscv_iommu(struct device *dev)
+{
+	struct iommu_device *iommu = dev_to_iommu_device(dev);
+
+	return iommu ? container_of(iommu, struct riscv_iommu_device, iommu) : NULL;
+}
+
+static ssize_t qosid_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct riscv_iommu_device *iommu = dev_to_riscv_iommu(dev);
+	u32 rcid, mcid;
+	int ret;
+
+	if (!iommu)
+		return -ENODEV;
+
+	ret = riscv_iommu_get_default_qosid(iommu, &rcid, &mcid);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "rcid=%u mcid=%u\n", rcid, mcid);
+}
+
+static ssize_t qosid_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct riscv_iommu_device *iommu = dev_to_riscv_iommu(dev);
+	char *args, *key, *value;
+	char *input;
+	u32 rcid, mcid;
+	int ret = -EINVAL;
+
+	if (!iommu)
+		return -ENODEV;
+
+	input = kstrdup(buf, GFP_KERNEL);
+	if (!input)
+		return -ENOMEM;
+
+	args = strim(input);
+	args = next_arg(args, &key, &value);
+	if (!value || strcmp(key, "rcid") || kstrtou32(value, 10, &rcid))
+		goto out;
+
+	args = next_arg(args, &key, &value);
+	if (!value || strcmp(key, "mcid") || kstrtou32(value, 10, &mcid) ||
+	    *skip_spaces(args))
+		goto out;
+
+	ret = riscv_iommu_set_default_qosid(iommu, rcid, mcid);
+out:
+	kfree(input);
+	return ret ? ret : count;
+}
+
+static DEVICE_ATTR_RW(qosid);
+
+static struct attribute *riscv_iommu_attrs[] = {
+	&dev_attr_qosid.attr,
+	NULL,
+};
+
+static const struct attribute_group riscv_iommu_group = {
+	.attrs = riscv_iommu_attrs,
+};
+
+static const struct attribute_group *riscv_iommu_groups[] = {
+	&riscv_iommu_group,
+	NULL,
+};
+
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 {
 	u64 ddtp;
+	int ret;
 
 	/*
 	 * Make sure the IOMMU is switched off or in pass-through mode during
@@ -1721,6 +1867,10 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 			return -EINVAL;
 	}
 
+	ret = riscv_iommu_init_default_qosid(iommu);
+	if (ret)
+		return ret;
+
 	/*
 	 * Distribute interrupt vectors, always use first vector for CIV.
 	 * At least one interrupt is required. Read back and verify.
@@ -1753,10 +1903,12 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
 {
+	const struct attribute_group **sysfs_groups = NULL;
 	int rc;
 
 	RISCV_IOMMU_QUEUE_INIT(&iommu->cmdq, CQ);
 	RISCV_IOMMU_QUEUE_INIT(&iommu->fltq, FQ);
+	mutex_init(&iommu->qosid_lock);
 
 	rc = riscv_iommu_init_check(iommu);
 	if (rc)
@@ -1788,8 +1940,11 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;
 
-	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
-				    dev_name(iommu->dev));
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID)
+		sysfs_groups = riscv_iommu_groups;
+
+	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, sysfs_groups,
+				    "riscv-iommu@%s", dev_name(iommu->dev));
 	if (rc) {
 		dev_err_probe(iommu->dev, rc, "cannot register sysfs interface\n");
 		goto err_iodir_off;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 2c57625637bf..13ea67b7e42d 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -12,8 +12,12 @@
 #define _RISCV_IOMMU_H_
 
 #include <linux/iommu.h>
-#include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#ifdef CONFIG_RISCV_IOMMU_32BIT
+#include <linux/spinlock.h>
+#endif
 
 #include "iommu-bits.h"
 
@@ -50,6 +54,9 @@ struct riscv_iommu_device {
 	u64 caps;
 	u32 fctl;
 
+	/* Serializes QoS updates to iommu_qosid and device contexts. */
+	struct mutex qosid_lock;
+
 	/* available interrupt numbers, MSI or WSI */
 	unsigned int irqs[RISCV_IOMMU_INTR_COUNT];
 	unsigned int irqs_count;
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
