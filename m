Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEE0C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4pgzVVBLtXwC6FVPb04DQLz4i/s1PEmN1dYGXqLCn4=; b=uX5/ueIMO1wASt
	cEG1JDN3Iclh5OZslTBFOUi/e+z9nRN2IOEOTrIpQudzT/Yk/3V0Z/MlwHzIZ5uQ4QPaW56/j1uSW
	+PA5wMiRKGw9RpJ2xa8tfT0EZquMnNrOZh5BiLvVFuEJnSe4cOOKeXmqy8eFz2BcfSgV9qO5bNGYW
	itYPCx2Pf8ecF3/er+a5Hsqpwf216hoEEM3ZO/WBEki2Is/PNc7o67xYifgpwWCMnWN/ZCjfwakUK
	+/iYwF9ybNQSD82b/Ti7gDst3K428LHx/ZVYDpd2amXPwDxFY6OXxuwLP3aTxPrqLKozwXvjnfaDV
	G4teyYgXEOA6FpSh6wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7p7-0000000307s-1xXa;
	Fri, 14 Jun 2024 14:22:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7p1-0000000302U-2oj2
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f44b441b08so17985795ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374950; x=1718979750; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqErywjP/CjLC2eaDMmEQxFN9AljnO4yCx1Hy/yfHnA=;
        b=nrPnaMXEGQYy85x44QK9YxoKyiBMAUVvXBU9SjXZlAWkZtNqjVvt/2cjvWDkI0/1fS
         sUFt3SXX09JSQ/JWBeBVs/6d+4VUJqV7y3UeV/wYPV3EP2WCs1fVs3R4MJ5FS5XD3cTj
         rx3dCjrprSid/KswbhPPc1x0UXvmuUPmlfz8pI/pwWc79/nX6aVwFNjCUUBGScAhBKY8
         UnCIYpcRIB18asTQ3Ez00W7gaWNjScZTNSjXQJCFig1WKctNnTNypYqxi2aKTeSp0nxk
         amUKJG5I3+bdy4ihTqSii42iRVgZArVBpqu6ASbCN9EdeGLisjn6L6yA0KDZypSXyTPQ
         C6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374950; x=1718979750;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqErywjP/CjLC2eaDMmEQxFN9AljnO4yCx1Hy/yfHnA=;
        b=FWWRsmTlWjwB+5VdIN2f2Ka24wXsIitLsNmL++xkHLOk37Ee6sHQuvSKm01Ra2Ozxc
         ODshrzItOE4gjlKKa7SKyIrTR/COOowhI+KGe0L/fH23rbZ8VN8LCFFz2JO94K6f7XXr
         UVM/xdmjYeG642c70vmMhjo4N2DEGhQ/ZTXh0H6ra/L/J3IvHAKxAO15hE4TUdydmpCm
         JR/+53dbmiBAHwVt2b8LRoH2wx1Hofr3g9Rs/8f230WdtzEHtjh6DMIuhoVlao8YcnKB
         AZe1Ie5jSH9jVCoTC5F+szxQf2qRYio/jiS9KJDX+T3D2no/25LqW8mJWUnZMhXOzfld
         uF1w==
X-Forwarded-Encrypted: i=1; AJvYcCURkLP8p00gOMa6MKNp6Uwhy3dt0OU+o/fvuwRo/IrfS0FUcPZVdi9739vJtQzCMsohNjYiXbsaJjNxX251SMWU2OCyElWPURSiqAqGdxrF
X-Gm-Message-State: AOJu0YyGkyG07yd+s9GEQ87Rg/WZ5EmhT5lI8Ja7cQU9MHWB5afOkGQ6
	p8fNgpZCXoKWTbd247vlPG3y0FxV0W9dqOe409QT9/gpJnph6DHWNKg+TKs4H/I=
X-Google-Smtp-Source: AGHT+IHSez2BcKKbBZwd377qNguyZGbzCpuJqffZQYRK1qpXa16+hD0f3KlRelSKzLQGJUtI0sNeSg==
X-Received: by 2002:a17:903:1c4:b0:1f7:1525:ddfc with SMTP id d9443c01a7336-1f8625d9e30mr34295185ad.20.1718374950324;
        Fri, 14 Jun 2024 07:22:30 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:29 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for flushing cache
Date: Fri, 14 Jun 2024 22:21:54 +0800
Message-Id: <20240614142156.29420-9-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072231_846844_66898513 
X-CRM114-Status: GOOD (  17.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements cache_invalidate_user operation for the userspace
to flush the hardware caches for a nested domain through iommufd.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c  | 90 ++++++++++++++++++++++++++++++++++--
 include/uapi/linux/iommufd.h | 11 +++++
 2 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 410b236e9b24..d08eb0a2939e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1587,8 +1587,9 @@ static int riscv_iommu_attach_dev_nested(struct iommu_domain *domain, struct dev
 	if (riscv_iommu_bond_link(riscv_domain, dev))
 		return -ENOMEM;
 
-	riscv_iommu_iotlb_inval(riscv_domain, 0, ULONG_MAX);
-	info->dc_user.ta |= RISCV_IOMMU_PC_TA_V;
+	if (riscv_iommu_bond_link(info->domain, dev))
+		return -ENOMEM;
+
 	riscv_iommu_iodir_update(iommu, dev, &info->dc_user);
 
 	info->domain = riscv_domain;
@@ -1611,13 +1612,92 @@ static void riscv_iommu_domain_free_nested(struct iommu_domain *domain)
 	kfree(riscv_domain);
 }
 
+static int riscv_iommu_fix_user_cmd(struct riscv_iommu_command *cmd,
+				    unsigned int pscid, unsigned int gscid)
+{
+	u32 opcode = FIELD_GET(RISCV_IOMMU_CMD_OPCODE, cmd->dword0);
+
+	switch (opcode) {
+	case RISCV_IOMMU_CMD_IOTINVAL_OPCODE:
+		u32 func = FIELD_GET(RISCV_IOMMU_CMD_FUNC, cmd->dword0);
+
+		if (func != RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA &&
+		    func != RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA) {
+			pr_warn("The IOTINVAL function: 0x%x is not supported\n",
+				func);
+			return -EOPNOTSUPP;
+		}
+
+		if (func == RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA) {
+			cmd->dword0 &= ~RISCV_IOMMU_CMD_FUNC;
+			cmd->dword0 |= FIELD_PREP(RISCV_IOMMU_CMD_FUNC,
+						  RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA);
+		}
+
+		cmd->dword0 &= ~(RISCV_IOMMU_CMD_IOTINVAL_PSCID |
+				 RISCV_IOMMU_CMD_IOTINVAL_GSCID);
+		riscv_iommu_cmd_inval_set_pscid(cmd, pscid);
+		riscv_iommu_cmd_inval_set_gscid(cmd, gscid);
+		break;
+	case RISCV_IOMMU_CMD_IODIR_OPCODE:
+		/*
+		 * Ensure the device ID is right. We expect that VMM has
+		 * transferred the device ID to host's from guest's.
+		 */
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int riscv_iommu_cache_invalidate_user(struct iommu_domain *domain,
+					     struct iommu_user_data_array *array)
+{
+	struct riscv_iommu_domain *riscv_domain = iommu_domain_to_riscv(domain);
+	struct iommu_hwpt_riscv_iommu_invalidate inv_info;
+	int ret, index;
+
+	if (array->type != IOMMU_HWPT_INVALIDATE_DATA_RISCV_IOMMU) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	for (index = 0; index < array->entry_num; index++) {
+		ret = iommu_copy_struct_from_user_array(&inv_info, array,
+							IOMMU_HWPT_INVALIDATE_DATA_RISCV_IOMMU,
+							index, cmd);
+		if (ret)
+			break;
+
+		ret = riscv_iommu_fix_user_cmd((struct riscv_iommu_command *)inv_info.cmd,
+					       riscv_domain->pscid,
+					       riscv_domain->s2->gscid);
+		if (ret == -EOPNOTSUPP)
+			continue;
+
+		riscv_iommu_cmd_send(riscv_domain->iommu,
+				     (struct riscv_iommu_command *)inv_info.cmd);
+		riscv_iommu_cmd_sync(riscv_domain->iommu,
+				     RISCV_IOMMU_IOTINVAL_TIMEOUT);
+	}
+
+out:
+	array->entry_num = index;
+
+	return ret;
+}
+
 static const struct iommu_domain_ops riscv_iommu_nested_domain_ops = {
 	.attach_dev	= riscv_iommu_attach_dev_nested,
 	.free		= riscv_iommu_domain_free_nested,
+	.cache_invalidate_user = riscv_iommu_cache_invalidate_user,
 };
 
 static int
-riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg)
+riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_arg,
+			struct riscv_iommu_domain *s1_domain)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
@@ -1663,6 +1743,8 @@ riscv_iommu_get_dc_user(struct device *dev, struct iommu_hwpt_riscv_iommu *user_
 		       riscv_iommu_get_dc(iommu, fwspec->ids[i]),
 		       sizeof(struct riscv_iommu_dc));
 		info->dc_user.fsc = dc.fsc;
+		info->dc_user.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, s1_domain->pscid) |
+					      RISCV_IOMMU_PC_TA_V;
 	}
 
 	return 0;
@@ -1708,7 +1790,7 @@ riscv_iommu_domain_alloc_nested(struct device *dev,
 	}
 
 	/* Get device context of stage-1 from user*/
-	ret = riscv_iommu_get_dc_user(dev, &arg);
+	ret = riscv_iommu_get_dc_user(dev, &arg, s1_domain);
 	if (ret) {
 		kfree(s1_domain);
 		return ERR_PTR(-EINVAL);
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 514463fe85d3..876cbe980a42 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -653,9 +653,11 @@ struct iommu_hwpt_get_dirty_bitmap {
  * enum iommu_hwpt_invalidate_data_type - IOMMU HWPT Cache Invalidation
  *                                        Data Type
  * @IOMMU_HWPT_INVALIDATE_DATA_VTD_S1: Invalidation data for VTD_S1
+ * @IOMMU_HWPT_INVALIDATE_DATA_RISCV_IOMMU: Invalidation data for RISCV_IOMMU
  */
 enum iommu_hwpt_invalidate_data_type {
 	IOMMU_HWPT_INVALIDATE_DATA_VTD_S1,
+	IOMMU_HWPT_INVALIDATE_DATA_RISCV_IOMMU,
 };
 
 /**
@@ -694,6 +696,15 @@ struct iommu_hwpt_vtd_s1_invalidate {
 	__u32 __reserved;
 };
 
+/**
+ * struct iommu_hwpt_riscv_iommu_invalidate - RISCV IOMMU cache invalidation
+ *                                            (IOMMU_HWPT_TYPE_RISCV_IOMMU)
+ * @cmd: An array holds a command for cache invalidation
+ */
+struct iommu_hwpt_riscv_iommu_invalidate {
+	__aligned_u64 cmd[2];
+};
+
 /**
  * struct iommu_hwpt_invalidate - ioctl(IOMMU_HWPT_INVALIDATE)
  * @size: sizeof(struct iommu_hwpt_invalidate)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
