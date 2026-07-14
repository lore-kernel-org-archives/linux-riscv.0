Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A280C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+oup5iO2slAwO+PG3oQ3eCROl5SzsmqJtdbV17nCLw=; b=CmqjbUfu6PAp76
	+y5FphMXDr15zaDlojS+ViAlPNZ4kYIB7cWjOBHhOJL8VdTCVW7AU47SkPXsXhbrtf3vkSfQL7X+c
	4zbSvnghK/5grz3TW+raWGxzFaZybI6ilLWttvzo4vomgNgHqpUcHhdekJf5dlRWOhpyqvdIXNfv0
	jYzJ3o7ROGlGpGVW5EgbQDPsO90geSXRpejZ11S0K88/5d1YoZ21A1dt4c665CXV5BDKEgc5zahSO
	0kWs7ztdDDVmmmJ70bG2FJAlxq5PDso/4ouswTN2O+71G3Pm8kM8YqklR+NYaeXIHBmfa983bw/eT
	1aQhmSaPr6AfJ2o3Ta0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcrK-0000000C6NE-2ca6;
	Tue, 14 Jul 2026 13:07:38 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcrI-0000000C6Li-2O7d
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:07:37 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso458193a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034455; x=1784639255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgO28qqQ1xeK9Yvst4+iTUEqQXClh8oO6Jm7DHD/RdA=;
        b=H3nHaQvCYU/UwFvzzBkiKypB3Ycba02hNA3OM4YgTPav5EpSFomeKKak5zyanr+Okw
         a6mcq53VHu9a66mlsmyGKB4/clyN6FqpVJS1dJPTMkte05qSi2YLwLXN2a4RMtUe7iq5
         NbdNyudxe/RdQL/Zti3f0g9IefUCAPSgyVV+mynGZD4RQEp+fuOKWCyxfY8F1GzGkTy/
         WFl6MnxbnSb7uQ3K42fe4LCqcOfaJRfaFIP5iiZSgngV/HflPLaNxIVy7yaeG9bAXQvr
         cN8WbL/663XUxW8PEm47Ckl4izfzvU/6PofNjqjTW9n5yza5ZTmFzs8VunWhlAtZW/SO
         Ynqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034455; x=1784639255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgO28qqQ1xeK9Yvst4+iTUEqQXClh8oO6Jm7DHD/RdA=;
        b=MkLMb5+Ge+/L/pfefghLmYEPwP5lAQi7ohclkZST8Frbw3de2BIu1Vq27w/4Z/Vp7S
         nqsDr0HS5PzGRMoLdXXJWFrPwxY5SE+zY0MXlx7OfiusNpGxMdbpU+jczHjgc2Ll5k0l
         knKlDdYPBuJDhxMJAoa0W8Ca9DnEqTf1lb2WL9+MKuCGBbB5Z2yPuZmDp+HHKivju4ax
         gqmVgqRXWO3z1aC5ccVJCpupEe82w0bO1Z3gMAg0UQaqTpQ6MFLkt3lLPojSDuxvwICX
         Ye39KWvVhFIVbW0R2mKCIJ7nCRMbG8xz+TMaWRiotXrljjVb3AZP/uV4RQ9Vl3y701aC
         NByA==
X-Forwarded-Encrypted: i=1; AFNElJ/VLMyOvyrKu4+ehzcZtWBK4dq0FF/qvqqYd6+zT6nt8yT+Hj8PIY0QGJK9ehrWwGOnx6CTRXjkHx6EfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzNmYz2N1Iu8gfCJl73Z1sZfD05fWIcQepbCSiYTwtTLsEpUDv
	4dFjsByjPK6etuWa2LFMRPYiEREp5agKSQRPL0oWX0aVZtf+vJVSa7T3DncqSlG3WS2ZZRhJhGp
	odwM7
X-Gm-Gg: AfdE7cnzjTWTdU1bd3wEgbNMSWM7xy2ypFvRzD4doXtRokkirrxZBDnVNNnzIXOrEJw
	SfKcXDPjSRJYWxmVXt2Yck6DAyqCQ5uISSbo7HMZOD6Qmz0v+vX93CfWbV6vmRb3Ms981EEmhtX
	h7B88NHzmzPGpWMdhk7u92CYZ9Ox5nsVUrTku9OSX7uqvg9zDrmoe/HrOWm95rB4x4v6kuCYvtK
	Gd1uBgHlYmirJviNTHbQ8PZdhWKn1NO44gzpJD+t52wdhCHH63lijX2oTZ+txXTvo1313kEZjob
	GCz97vq/wvZgv5qua8j4EGn0PINjaslpKQXYbYXoVTi5xjtgP/TDB9BXn1Vkvz5pBwNxtwlgCmx
	UgGMFec+CgcpcSEazKrTDYgd+4VUXbah5fOEzm9H8RuiBZQY709lfcYOi43Jmrcjse6cyDasY4V
	k4OyffLkydFc6+eInhqMrdBDlJJyuZvzTGuAkM4AvJHfHb+lkfjnvQku3kiimTgQ==
X-Received: by 2002:a05:6830:f88:b0:7e9:fe5f:4406 with SMTP id 46e09a7af769-7ec0997528bmr8084846a34.30.1784034455345;
        Tue, 14 Jul 2026 06:07:35 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:34 -0700 (PDT)
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
Subject: [RFC PATCH 2/7] iommu: Add checked group device update helper
Date: Tue, 14 Jul 2026 21:06:52 +0800
Message-ID: <20260714130657.46963-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060736_622402_AC59EDAF 
X-CRM114-Status: GOOD (  13.77  )
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

Some group-wide operations must validate every member before changing
any device. Separate iommu_group_for_each_dev() calls cannot provide
that guarantee because group membership may change between traversals.

Add iommu_group_update_devices() to keep the group membership mutex held
across a validation pass and a non-failing update pass. This provides
all-or-none validation without exposing IOMMU group internals to
callers.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/iommu/iommu.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/iommu.h | 13 +++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index da269d10f6bf..9a6c4a7e7df6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1436,6 +1436,39 @@ int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 }
 EXPORT_SYMBOL_GPL(iommu_group_for_each_dev);
 
+/**
+ * iommu_group_update_devices - Check and update every device in a group
+ * @group: the group
+ * @data: caller data passed to both callbacks
+ * @check: validates whether one device can be updated
+ * @update: updates one device after every check has succeeded
+ *
+ * Keep group membership stable while first checking every device and then
+ * applying an update which cannot fail. No device is updated if a check fails.
+ */
+int iommu_group_update_devices(struct iommu_group *group, void *data,
+			       int (*check)(struct device *, void *),
+			       void (*update)(struct device *, void *))
+{
+	struct group_device *device;
+	int ret = 0;
+
+	mutex_lock(&group->mutex);
+	for_each_group_device(group, device) {
+		ret = check(device->dev, data);
+		if (ret)
+			goto unlock;
+	}
+
+	for_each_group_device(group, device)
+		update(device->dev, data);
+
+unlock:
+	mutex_unlock(&group->mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_group_update_devices);
+
 /**
  * iommu_group_get - Return the group for a device and increment reference
  * @dev: get the group that this device belongs to
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e771b4a92f5b..befba0683e06 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -988,6 +988,9 @@ extern int iommu_group_add_device(struct iommu_group *group,
 extern void iommu_group_remove_device(struct device *dev);
 extern int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 				    int (*fn)(struct device *, void *));
+int iommu_group_update_devices(struct iommu_group *group, void *data,
+			       int (*check)(struct device *, void *),
+			       void (*update)(struct device *, void *));
 extern struct iommu_group *iommu_group_get(struct device *dev);
 struct iommu_group *iommu_group_get_by_id(int id);
 void iommu_group_put_by_id(struct iommu_group *group);
@@ -1399,6 +1402,16 @@ static inline int iommu_group_for_each_dev(struct iommu_group *group,
 	return -ENODEV;
 }
 
+static inline int iommu_group_update_devices(struct iommu_group *group,
+					     void *data,
+					     int (*check)(struct device *,
+							  void *),
+					     void (*update)(struct device *,
+							    void *))
+{
+	return -ENODEV;
+}
+
 static inline struct iommu_group *iommu_group_get(struct device *dev)
 {
 	return NULL;
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
