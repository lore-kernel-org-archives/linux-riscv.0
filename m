Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE85FC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1utUrgVhomIHh6MI7SEt9IhTI7AyNtPtvV944Oax/Q=; b=sUSngnOapu7Hon
	9vR1RzKfq3E7XHdqU1jvMvZWdO7Ku4Xvbfy2S36kHGljlM4wzMuIwe80QJpZlUgDlngtmkWpXbH9i
	orj+CfzAeHK3gjau5p53jpeOGD4/b2NZ6Eh3RWRV/9F9LcehLNh/e1jKQmImFhiUCau2ehnlGoTcO
	LVtabivuUJEQ2qT0cmfnJwXgl5m/bfj3reZwdA5ox9UXR/HlagdBZbC/qXA3MZ6xJQVqVvUg72Xkz
	lgZq7kxaosPaYM/80MzUWY64gT2kzzp7caazAn8paonJcVhYMfTjYaYuigE5xthrnlDDbrn8eOdok
	aCtjnQPDdDzVLIYwZgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTzS-0000000GHPz-2YhE;
	Tue, 30 Jun 2026 08:38:46 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTzO-0000000GHNy-2TCn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:38:43 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-139f71a5201so403633c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782808722; x=1783413522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOC0O5L8yCrTPyUO6WSb6ea4HWyqtXRV/3bmbz0pQTM=;
        b=bLs705TFyXt6cR6bdX4GFrU0luHnPGAKD7/gSzFPXoeDcgoCLt9RWQHvBSAIePiJcP
         4JT3cWJo7bJw7nlIOphdyzS7WyaGqtdiSj11WmTBLCXpwojvQKY8dPEIy2cDNUbbxaKQ
         74DTcMxv6paWmrbBpEEUmoptMov7csNewYzdu5euqxqxaRQJR40HqVHRq3G6Jdf7sBMk
         GiHQbSPIHubHchsnAu2Vjtq0KuaEobOtYJfS1SAZjYV7/pjaCK7tZ+Ho9N+j3AKZhtFU
         pitE8iztRPXUAfFvIruMULuBSEDkb3vwvPtG2y39wvg77piBUsfItHW8RV+q3OUbwp9d
         mP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808722; x=1783413522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NOC0O5L8yCrTPyUO6WSb6ea4HWyqtXRV/3bmbz0pQTM=;
        b=p3mAq8Rb0ZBbuEHlyZ9iNXyN1vQUcU8xlp1Ozj9vl9VlK0I/drqfrEBxHPi27moo4E
         As3I5EO0YY6qdzIkEGIPoxYxq+l04kecYmNiNx+r2aiakFgliTLn6pgkfJiTnb+zMaNB
         iyf3n9rugM/t5P//dUAUNdY+r+khy+JHU2rJinUW0bCJT+Q7Q8cQbsgzKbJPoVchD/uU
         4CXKyQdFfhMpp7JJDN/tmi6gYzyAzogs1FmmNQBbHhRWQ/okm8QBU52Sz2CXHXyivNEA
         QXK4XDlQNyosy8ddBSQCW0T8TCMwxVIYG+KVNVM18PEIpCoqx0NpI8b1NvlfDXIFScyR
         +5KA==
X-Forwarded-Encrypted: i=1; AHgh+RpIElVND4DnB4OMLf84tEewtnBwpUzC75/YXT41NMHCx6pmwQS8bthMd6TEFUzOphkpC71YH23FDh1iTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyC2eUjfG094FvfUGwTpqz+wzF6cPcxB4jmPwUGjXIw7yad+la
	lvKPwxRnZZ77523m0gmjPrJcS7g6gqX3ODOHDmoYSAgW8eI6dRDduXTGPlf5x39G0zs=
X-Gm-Gg: AfdE7cl2W/jGfKL4ukz8OaLyrNxd7O0qs92pB1NezOyVaoY/z1dGfs6oo2XJBOGUtDh
	XvsvefV+3I06hQGgFyYxRIOwg6Ci2mJeZlA0TiQ2zjyoqPn6m1oqfsXWX+4wVggB/De1IGQWHUz
	78mVlc1RYKnZAC57aILSjxoyrdPX6EWO83qyxhPR72dAH9bm1nkfmRHNeVZmeaNFuzKHwSlrxZM
	GlLNMkISkF1DDNqmP7bJ1Di5qteFKX8R+uHJOUj39C/N9XQiT3+WLFiO66yvQg3u9SPWhtNSJFF
	4QNNd/9l3Rw4Bp5tXUHiAo//09po3dMj9DxD5AlpYdSY7e9vV/UlrgyQwKpcVMbHdCLi/Dp/TPK
	yTM35/TJ5cKYnt/MBaw37sTbKSEtmRGyIjloRbqIYGulY/WB/n3lzbg9HtL8Yzy8xk79ko0Qyob
	O5OIFRsVm8MeWR+IeLqr8rl71/O46l0Yqf/Bs=
X-Received: by 2002:a05:7301:2a27:b0:30c:ab96:7304 with SMTP id 5a478bee46e88-30eea0b83b6mr831847eec.20.1782808721684;
        Tue, 30 Jun 2026 01:38:41 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5aeb0sm6756444eec.3.2026.06.30.01.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 01:38:41 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tjeznach@rivosinc.com,
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
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Tue, 30 Jun 2026 01:38:07 -0700
Message-ID: <20260630083833.1275837-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260630083833.1275837-1-zong.li@sifive.com>
References: <20260630083833.1275837-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_013842_626671_163A9B17 
X-CRM114-Status: GOOD (  11.21  )
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

Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..36ad4aa81465 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -565,6 +566,21 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(iommu->dev, KBUILD_MODNAME,
+						"pmu", iommu, 0);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1613,6 +1629,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
