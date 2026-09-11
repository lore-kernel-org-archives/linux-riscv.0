Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96260C79FA1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTIknYAjb+iwOYUCvPhsLURInoExiB8hlDWSQKt+YBk=; b=Kw51R+rknHRCKh
	NRSG0dUsJ8BwgP/vmcZohhS85vgDqKPYOqVMe/PXZ8LSjL55dc23FrRYjOy64C3wuwM4hVih9xr4F
	KHpO5ZwbY0cp3ywymmTVVs3qizpH7Q+DObUhySpEFi1sHpKVV5vOou+w+JT6fs/lyB/G23JE+qCl8
	zGfbUgtfjF4cdGg3pWutvJ1uT60hQAf8MCT2sEppZT5hBH92fuoIBMF8+Qjt3lQLLCGqq1vm8Ycb0
	WDp3pdlMX2uq7FrW4sbznxf9rh417xc8h6GTyg6rfixrD2mUXWBBzZi4cZObZ2o+awiXphPRiDu8/
	/2ikqOostqyxJ8GH0QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4umi-0000000FvvX-1BnJ;
	Fri, 11 Sep 2026 06:30:52 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4umf-0000000FvuX-1Fwr
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 06:30:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc149372c14so454947a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789108248; x=1789713048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=CIAbQZi73nHZh31FbV8r89pQcMP8E1yHkMilJBlcdjml7tM0TbVItS4uQ48/ylFX/E
         RfoAk7rH9zgdujFhtR8ch34MK5nuo9oQn8yYN5TO+sICk45pvYfwNGJz+I+UWaUVXDwB
         U/sJS0fNH9v+pFy7JjyIOp7bwqoe692T161qIzA8Vrz8abtZtmrn3i5RLpIHk7HCP202
         N+M59ptfAj11QlbijJkJ0iQZTwdmF58X6iZ+/5L8xjl/bNcf8ypNWkSPAqkGUkcZj6PP
         oSCyjyz8ekyREsPLVAi558Y3dm25fUTsGkR09Mq8QZ7yaeQq3E3BKB+sjdCKK2pFKvOM
         4k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108248; x=1789713048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=p+ZzOoHp6Z3VkdcyvGmH7HBnxQ1qiU3CU4bdkW+NBAHr98g9Rve6go12GmduNSDLIs
         OKnX6wksKIehjZrC7Ok7Hqi0Ylx/tVe82hYOVJhXRmadRs4WIsX/O1xUjaQeJ4whXK3D
         6yH8clxtLvLtaR5xlqyQSr+Rlc3w4ZBh1Jut0JSnmxsAeMbEH9A9qLAtz1kCBLpI794N
         eRZLgDtOj6WxgIMhsQaHyicobSXtetwJ+RZLHnMbup+9FXePnP97CjHasnPlVxhi20pW
         2rZZTOZzJD0gPiJfzNieKJ90LrMjZQxpIqt75J4EjN/cV1/tW0jVLLlGJjja6M5nkSFS
         CPkw==
X-Forwarded-Encrypted: i=1; AKwUvByoyQmC/Z3DWtEEOUV+5q4ccFDOYdr2LcG0zzbx8WssCgfcxWgrGE3lGFiPpsGfXclIFSrypzBjesL6yQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lnI6C40WhUxR6V4GSk5aNluS78BxBGSDNCq6w9GjUjhQQmc2NT
	Sa96q5+aCMRm5iatKGXdBC3SJ+CdoKxewtFRp4UA7eUObVqJ8dqSK//xhuUOjfq2XZk=
X-Gm-Gg: AYBFou2cZEJY1cRS2LGDkJGQJ3YKG/VPOohMotwTVqVspR/uW0pdmELYoLW6gc/iAp6
	pwAtX0njAvjAaL46+J/a+rO7IUGrep02K0U3xv4ek0SMzfmUftl8mWG52uHzSW2huO7FnkQ48Tk
	SzYJ3iEND0y2hv9U8tJG6OBuWthQCauxzVYEFvLhXhInHkHtUP4ryyPP2kLh7wJ5CrvlhcGTZPp
	CwLkWTzHFEUM+AwdHk91h63g+ph05Dnz3OD2Bkjj2nElQl6H6CApCEMiv7MIn9zfjbzuqcTDlWA
	O9+1vUbwn2P04b9vpghm4N52K1dB8ZkmkrelOdANitddSdUOfJuSzsELIxC/XmPWnhHhgNqsYi1
	OjZR0ixkalwU2gxWn6LHWHv9Ql1lsYpEZtP2mSf48Jdv8VY3+JXvWjL6JGE4z9lUaAIKV8GWx8q
	x52TtepRIgEZLYyc818F6Zj8aQWrHNyG5m7+JlfD/qauII67vk55LtfR8opD1iufQGJXvsPE9n1
	W3dkBOllE4=
X-Received: by 2002:a05:6a20:3c8d:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3daed3c168emr5513943637.23.1789108248408;
        Thu, 10 Sep 2026 23:30:48 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm331152eec.8.2026.09.10.23.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:30:48 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v10 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu, 10 Sep 2026 23:30:42 -0700
Message-ID: <20260911063043.916844-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260911063043.916844-1-zong.li@sifive.com>
References: <20260911063043.916844-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_233049_340148_503220A3 
X-CRM114-Status: GOOD (  13.65  )
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

Create an auxiliary device for HPM when the IOMMU supports a
hardware performance monitor.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..8025bf0fb67f 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -10,6 +10,7 @@ config RISCV_IOMMU
 	select GENERIC_PT
 	select IOMMU_PT
 	select IOMMU_PT_RISCV64
+	select AUXILIARY_BUS
 	help
 	  Support for implementations of the RISC-V IOMMU architecture that
 	  complements the RISC-V MMU capabilities, providing similar address
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..7f619971bb70 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -48,6 +49,9 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+/* IOMMU PMU auxiliary device id allocation namespace. */
+static DEFINE_IDA(riscv_iommu_pmu_ida);
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -565,6 +569,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static void riscv_iommu_pmu_id_free(void *data)
+{
+	ida_free(&riscv_iommu_pmu_ida, (unsigned long)data);
+}
+
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+	int id, ret;
+
+	id = ida_alloc(&riscv_iommu_pmu_ida, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = devm_add_action_or_reset(iommu->dev, riscv_iommu_pmu_id_free,
+				       (void *)(unsigned long)id);
+	if (ret)
+		return ret;
+
+	auxdev = __devm_auxiliary_device_create(iommu->dev, "riscv-iommu",
+						"pmu", iommu, id);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1613,6 +1647,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
