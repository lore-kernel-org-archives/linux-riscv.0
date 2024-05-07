Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D1C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG4jI7fijG5ovzAs32gCFJDVrWmLcWDR2965j5ncCp8=; b=dNXkNVjAzCFA7b
	CkYYZlA44yuYN93rDrqPr/yyNbQ/cGhu47OQ7/maNj/g91BGlUbi2+AJn67Wr8YK7JrbT5I2dU6P0
	o0hCNwK9d+H0mji61v25g+m9aFVqpl0SfpQtUnZUmExIQS0vVd3n+myIwNOjQFZ3WSk8heE9106/s
	buJf5Ddlto+nS6JDj2Ajd6QHpW9hoGvKc0Ntmyg490CyFbzIkCMBmNAfHcYjC6kzfEiVf6pJtgiH5
	0YNdMZC0BKHtfgtDgok22dTNFWem8LjguaWycXUyZ8xImRm824jytlj6fzECek7+Zkzo11MdibHzM
	eoCLCKitHRAnUqeAsY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lly-0000000BU6d-37fo;
	Tue, 07 May 2024 14:26:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Llu-0000000BU3k-2OWV
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso2645043b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715091982; x=1715696782; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QsG7aE0HnxZsvtjvosuXtYKV2huEonpRW6TKXMCUJnU=;
        b=HRvf6AQsQq4KewOz+/Q5SEGPQuDzuxZwrGYla9SvOBogAmdtAGrqsryX9XakYRL0vF
         OiRcVyqhU7wZjIvX4lEU73oDMFkcFHt/FyJrgp3btI66dUS7lVVMrKZUdVfHPwK4T8PR
         zdAE/ip/ALlZCN0YBMAanmbtFd6TGRatXS40fHjxIo4Id/d8HKAYGWSCQG0FOsKqWE8N
         fVkKNUbDPm8uNn2OloHB6UBzuAqba6OsvoYUleqSBf7CVKtoojk/eHScu/0WqIjjRwPv
         JLddudmG7PSOUqbQJ4I944qjKlZbJA7hf1WbL3KsA0d/0Pgsq5+fHNZakSHVEJRZyt++
         3dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091982; x=1715696782;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsG7aE0HnxZsvtjvosuXtYKV2huEonpRW6TKXMCUJnU=;
        b=tQ0GNt0+HSvGpyT0rKY/id+WeuZJVH8pV5eMj0uCsrFMW5LzFvgLGizyy4v3HhtVTO
         rSGplaqBo9QLlJtX4pTaXrc2h2/icpMGJzZH7i6mzAm/vEVGx7XxijcIIgpTf2XZj28a
         UmmJUEowQsqC+GgOrZ5aDYPkJmdCeqg2KuYZPFpxg+AwEWYhBlrWrxgpB7dMsvlfQmGv
         G844CvhbxeeHVNAacxAJ+EE/4OFnBpXr/Q8CDML1A5BLDotg+DdOAIPCHhCCzgn0pd1f
         F+HElQvbf5kAWyjHfVi4IBPUvkoUNuxvtOND3thaIedZzmxnWkYhdOzbYJ19fr6toJRh
         QN1A==
X-Forwarded-Encrypted: i=1; AJvYcCUB5tub0Rm6+67Zl79nlNCBCAFreEpUEzPN3eNurPkDzYzf1l8KNzHP0tnODvmB9bYxN8zTfkjHZYmZ0p4H4420YVb5vl5CMea+G4SbXSmb
X-Gm-Message-State: AOJu0YxS6ZwhnIAjxBKAK5VkTlDozTVrscvkqJ/4dBDZtCGAJ0e4hbnX
	6NSxv6Ga4Ntt9/fBScp9w1a0AkOyss9k/H8W+qw2Kv35NPU7yn4ChuUx4yx/20I=
X-Google-Smtp-Source: AGHT+IESwO+1TpOehpzE3oOZnwENdjrLViV8PyyzyYTAIHr0YOeHnmv3rn25FWxqq/8kskMF3gIH5A==
X-Received: by 2002:a05:6a00:17a7:b0:6ec:e726:b6f5 with SMTP id s39-20020a056a0017a700b006ece726b6f5mr16072960pfg.26.1715091982078;
        Tue, 07 May 2024 07:26:22 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i22-20020aa79096000000b006f44bcbe7e3sm7687554pfa.201.2024.05.07.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:26:21 -0700 (PDT)
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
Subject: [PATCH RFC RESEND 6/6] iommu/riscv: support nested iommu for flushing cache
Date: Tue,  7 May 2024 22:26:00 +0800
Message-Id: <20240507142600.23844-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507142600.23844-1-zong.li@sifive.com>
References: <20240507142600.23844-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072622_762233_4D5126D8 
X-CRM114-Status: GOOD (  15.40  )
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
 drivers/iommu/riscv/iommu.c  | 91 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/iommufd.h |  9 ++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 7eda850df475..4dd58fe2242d 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1522,9 +1522,100 @@ static void riscv_iommu_domain_free_nested(struct iommu_domain *domain)
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
+		pr_warn("The user command: 0x%x is not supported\n", opcode);
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
+	struct riscv_iommu_device *iommu;
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_command cmd;
+	struct iommu_hwpt_riscv_iommu_invalidate inv_info;
+	int ret, index;
+
+	if (!riscv_domain)
+		return -EINVAL;
+
+	/* Assume attached devices in the domain go through the same IOMMU device */
+	spin_lock(&riscv_domain->lock);
+	list_for_each_entry_rcu(bond, &riscv_domain->bonds, list) {
+		if (bond->dev) {
+			iommu = dev_to_iommu(bond->dev);
+			break;
+		}
+	}
+	spin_unlock(&riscv_domain->lock);
+
+	if (!iommu)
+		return -EINVAL;
+
+	for (index = 0; index < array->entry_num; index++) {
+		ret = iommu_copy_struct_from_user_array(&inv_info, array,
+							IOMMU_HWPT_DATA_RISCV_IOMMU,
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
+		riscv_iommu_cmd_send(iommu, (struct riscv_iommu_command *)inv_info.cmd, 0);
+		riscv_iommu_cmd_iofence(&cmd);
+		riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_QUEUE_TIMEOUT);
+	}
+
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
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index e10b6e236647..d93a8f11813d 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -689,6 +689,15 @@ struct iommu_hwpt_vtd_s1_invalidate {
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
