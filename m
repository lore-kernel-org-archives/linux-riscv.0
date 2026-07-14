Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1000C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SX2+GGYIetPDpBkvusHytayjkZo547m0J2fUSpGCqkM=; b=D6gAPAMPTOlJ9u
	TUszoRlWVVr38UJSoPixCTwujH5Lt6lCYHOnVneMp21q7ox9SE53JxcZ9kuU925AIcEEQ8hwI8+sI
	ayBjW6vETV+/G4/Wly5MhJ1QU/3T9A9mydaHL3dUAtWLw4CTR4kH4M+xeI9mKpjgKwXlrXbco/suu
	xK1nDb9QKrf3/mBfrfPiRk01hB38iVEcxxOHJjRNiV9NJM2pMCTjGJVYtW5lD9HJkKBteulld06cc
	VBrTx/KWuDkl5j4A2QJuOV463kLHq2ILW399mQpQSovKTKvW8CprVGTSHgZQdFdjZP+lvEbtZIWvs
	kLwVgcGJMPy9IgEdBwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcr9-0000000C6Hr-29Du;
	Tue, 14 Jul 2026 13:07:27 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcr7-0000000C6Gi-0YUG
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:07:26 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1732547a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034444; x=1784639244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SD1E2b021BNT8K5FqPsuJFYVGZ1yPqvbXL/PhK3jvMg=;
        b=Q5gEu0VoI0xGYPj7pUVHij766ZYIxx2qO9SUlVzoWzMMtUJfgtivNpiASCT2F6JJWT
         JnzG9kbu0ECQ7Lt3kGK27i+26h1p4l8QcuXAPBSv+BR4a6zXSK2/Vojq/0a3tD6j4H0M
         3aPIH7d76MkIgo2TFtLzm7JzcrRgS6WW+sh/Ct+zyHKkevVlfHtc/KjxIx0YL3ImVRBW
         V0/pjd4QOOQDHumBdywKHv3W6wqnbNUaNpfmP+BMnuoIvtlJqfHbpBK434kzgZU3hx3U
         XcqOCd6oJtOIRa9mYzERBL1VEmEAnI2ENejJtemh7p2VpZ1MSCmkzQL6qbdBb1OxCrH5
         p1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034444; x=1784639244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SD1E2b021BNT8K5FqPsuJFYVGZ1yPqvbXL/PhK3jvMg=;
        b=iQIo8eMqa1lN+EhuPMq5vJGNcHXDCqQnu69dw/ov6mFa8NaLHbE6QlzPGLzeBlfoQw
         IYCATB/41x/Pn3R7fyIBra/GKSUY4DDcQfETDaCodRpqRlMWrTly4hmlEflsZUSw2+TS
         w8QZpqJNp1rrVYeMYFIYXwNVWlsjIq265YCMRxCe9haW4Uocm6VUr78SMudI+C0JK75G
         8uMKaN0GlTGqIZ5F4pGxtQHWjcn/C0LvmrMGgnhxlF33+YuoWqlKv5gP7OFMkK/67kVS
         R+Vv+xg/E1oBujcb87U/IJXNgmMcy1IyC3g5wixUNxQs6ptk/ebbSypQCYm+Olb2VDy2
         aEiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gn6DdZOLeC1KrxxP5JcUJY1ULYFgFZZqC0oFsOkBttQpa+G5OpVX1nkNjkQYsaDBib5HqjuRj0207Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp+EhFz3dody3zpvLRcV3JNXYoLGldNDf849mf0+jy2P5Y0LmV
	asIN8l92LCSg5esUXOupkN4/TaszWVZZ9s9798qsslc2hwxwg73jR0/FNzQvJWe8qck=
X-Gm-Gg: AfdE7cn/x/B/ddd50pDkjLeQPTw0eiPN8eFMfICcxb8MneuplCf7pUZjPjB8aE3Vjsn
	+WHLV6tnxSPGrx670+8R6BKAbKTDCGEnJIqSuqgjiK2XSshADpQqmvPuJcTaQzkaPVMQ+oTbkbV
	z7KpEVc8K0uMDZAH39Fbw4dHCxRyXukMXuywaga0Za0jyjzjCI8TFQB0HyuTXfPI/P843xADiHp
	jMwCwnGIEazMZbuTFD0jxTWcubuU+KDpy19xoYbhd1WClgdUySUDszYwoj2TtsCA4EO/Jyyshbp
	RqA70UrCXWzVII4/8U1J8L/V/b61FFpycQaG95/2WKjNyk2xQGH0ZyqgUwHnENl3RPnJLTkt0aT
	cSsZnU5PiX7/StyaxA1NnRGqJiU3oUlCzhiDGa+pvvh7gKmDM6zA7cGSY4Batb3cm2uAk65wLKX
	JRmNjBg8shXu8Ar+LBi2Bm5YcOgTkwlY+5qrfhTaChoWA5khUWNDqcd6b6TYcJnw==
X-Received: by 2002:a05:6830:4182:b0:7e6:c9eb:535a with SMTP id 46e09a7af769-7ec4a768626mr991961a34.6.1784034443908;
        Tue, 14 Jul 2026 06:07:23 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:23 -0700 (PDT)
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
Subject: [RFC PATCH 1/7] iommu: Add group lookup by ID
Date: Tue, 14 Jul 2026 21:06:51 +0800
Message-ID: <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060725_194097_20574130 
X-CRM114-Status: GOOD (  20.95  )
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

Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
the numeric ID used in /sys/kernel/iommu_groups.

An ID lookup must keep the group object alive without also keeping an
otherwise empty group active. Embed the devices kobject in struct
iommu_group so its address remains valid until the parent group is
released, and return a reference on the parent kobject to ID lookup
callers. Add iommu_group_put_by_id() to release that reference and
iommu_group_is_active() to detect when the devices kobject has become
inactive.

Serialize lookup against group teardown with iommu_group_kset_mutex and
only return groups whose devices kobject still has a live reference.
This prevents a concurrent lookup from dereferencing a stale child
kobject while allowing external users to discard bindings to empty
groups.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
 include/linux/iommu.h |  17 +++++++
 2 files changed, 113 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..da269d10f6bf 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -40,6 +40,7 @@
 #include "iommu-priv.h"
 
 static struct kset *iommu_group_kset;
+static DEFINE_MUTEX(iommu_group_kset_mutex);
 static DEFINE_IDA(iommu_group_ida);
 static DEFINE_IDA(iommu_global_pasid_ida);
 
@@ -52,7 +53,8 @@ enum { IOMMU_PASID_ARRAY_DOMAIN = 0, IOMMU_PASID_ARRAY_HANDLE = 1 };
 
 struct iommu_group {
 	struct kobject kobj;
-	struct kobject *devices_kobj;
+	/* Embedded so it remains addressable until the parent group is released. */
+	struct kobject devices_kobj;
 	struct list_head devices;
 	struct xarray pasid_array;
 	struct mutex mutex;
@@ -729,7 +731,7 @@ static void __iommu_group_free_device(struct iommu_group *group,
 {
 	struct device *dev = grp_dev->dev;
 
-	sysfs_remove_link(group->devices_kobj, grp_dev->name);
+	sysfs_remove_link(&group->devices_kobj, grp_dev->name);
 	sysfs_remove_link(&dev->kobj, "iommu_group");
 
 	trace_remove_device_from_group(group->id, dev);
@@ -1058,6 +1060,14 @@ static const struct kobj_type iommu_group_ktype = {
 	.release = iommu_group_release,
 };
 
+static void iommu_group_devices_release(struct kobject *kobj)
+{
+}
+
+static const struct kobj_type iommu_group_devices_ktype = {
+	.release = iommu_group_devices_release,
+};
+
 /**
  * iommu_group_alloc - Allocate a new group
  *
@@ -1091,17 +1101,22 @@ struct iommu_group *iommu_group_alloc(void)
 	}
 	group->id = ret;
 
+	mutex_lock(&iommu_group_kset_mutex);
 	ret = kobject_init_and_add(&group->kobj, &iommu_group_ktype,
 				   NULL, "%d", group->id);
 	if (ret) {
 		kobject_put(&group->kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
 
-	group->devices_kobj = kobject_create_and_add("devices", &group->kobj);
-	if (!group->devices_kobj) {
+	kobject_init(&group->devices_kobj, &iommu_group_devices_ktype);
+	ret = kobject_add(&group->devices_kobj, &group->kobj, "devices");
+	if (ret) {
+		kobject_put(&group->devices_kobj);
 		kobject_put(&group->kobj); /* triggers .release & free */
-		return ERR_PTR(-ENOMEM);
+		mutex_unlock(&iommu_group_kset_mutex);
+		return ERR_PTR(ret);
 	}
 
 	/*
@@ -1114,15 +1129,18 @@ struct iommu_group *iommu_group_alloc(void)
 	ret = iommu_group_create_file(group,
 				      &iommu_group_attr_reserved_regions);
 	if (ret) {
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
 
 	ret = iommu_group_create_file(group, &iommu_group_attr_type);
 	if (ret) {
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
+	mutex_unlock(&iommu_group_kset_mutex);
 
 	pr_debug("Allocated group %d\n", group->id);
 
@@ -1286,7 +1304,7 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 		goto err_remove_link;
 	}
 
-	ret = sysfs_create_link_nowarn(group->devices_kobj,
+	ret = sysfs_create_link_nowarn(&group->devices_kobj,
 				       &dev->kobj, device->name);
 	if (ret) {
 		if (ret == -EEXIST && i >= 0) {
@@ -1431,7 +1449,7 @@ struct iommu_group *iommu_group_get(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 
 	if (group)
-		kobject_get(group->devices_kobj);
+		kobject_get(&group->devices_kobj);
 
 	return group;
 }
@@ -1446,7 +1464,7 @@ EXPORT_SYMBOL_GPL(iommu_group_get);
  */
 struct iommu_group *iommu_group_ref_get(struct iommu_group *group)
 {
-	kobject_get(group->devices_kobj);
+	kobject_get(&group->devices_kobj);
 	return group;
 }
 EXPORT_SYMBOL_GPL(iommu_group_ref_get);
@@ -1461,10 +1479,77 @@ EXPORT_SYMBOL_GPL(iommu_group_ref_get);
 void iommu_group_put(struct iommu_group *group)
 {
 	if (group)
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
 }
 EXPORT_SYMBOL_GPL(iommu_group_put);
 
+/**
+ * iommu_group_get_by_id - Lookup an IOMMU group by its sysfs ID
+ * @id: group ID matching /sys/kernel/iommu_groups/<id>
+ *
+ * Return a group with a reference on its parent kobject, or NULL if no active
+ * group exists for @id. The caller must release the returned group with
+ * iommu_group_put_by_id(). Keeping this reference does not keep an empty
+ * group's devices kobject active.
+ */
+struct iommu_group *iommu_group_get_by_id(int id)
+{
+	struct kobject *group_kobj;
+	struct iommu_group *group = NULL;
+	char name[12];
+
+	if (!iommu_group_kset || id < 0)
+		return NULL;
+
+	snprintf(name, sizeof(name), "%d", id);
+	mutex_lock(&iommu_group_kset_mutex);
+	group_kobj = kset_find_obj(iommu_group_kset, name);
+	if (!group_kobj)
+		goto unlock;
+
+	group = container_of(group_kobj, struct iommu_group, kobj);
+	if (!kobject_get_unless_zero(&group->devices_kobj)) {
+		kobject_put(group_kobj);
+		group = NULL;
+		goto unlock;
+	}
+
+	kobject_put(&group->devices_kobj);
+unlock:
+	mutex_unlock(&iommu_group_kset_mutex);
+	return group;
+}
+EXPORT_SYMBOL_GPL(iommu_group_get_by_id);
+
+/**
+ * iommu_group_put_by_id - Release a group returned by ID lookup
+ * @group: group returned by iommu_group_get_by_id()
+ */
+void iommu_group_put_by_id(struct iommu_group *group)
+{
+	if (group)
+		kobject_put(&group->kobj);
+}
+EXPORT_SYMBOL_GPL(iommu_group_put_by_id);
+
+/**
+ * iommu_group_is_active - Test whether a referenced group can accept devices
+ * @group: referenced IOMMU group
+ *
+ * Return true while the devices kobject still has a live reference. Once the
+ * group loses its last device and external device reference, it cannot become
+ * active again.
+ */
+bool iommu_group_is_active(struct iommu_group *group)
+{
+	if (!group || !kobject_get_unless_zero(&group->devices_kobj))
+		return false;
+
+	kobject_put(&group->devices_kobj);
+	return true;
+}
+EXPORT_SYMBOL_GPL(iommu_group_is_active);
+
 /**
  * iommu_group_id - Return ID for a group
  * @group: the group to ID
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863a..e771b4a92f5b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -989,6 +989,9 @@ extern void iommu_group_remove_device(struct device *dev);
 extern int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 				    int (*fn)(struct device *, void *));
 extern struct iommu_group *iommu_group_get(struct device *dev);
+struct iommu_group *iommu_group_get_by_id(int id);
+void iommu_group_put_by_id(struct iommu_group *group);
+bool iommu_group_is_active(struct iommu_group *group);
 extern struct iommu_group *iommu_group_ref_get(struct iommu_group *group);
 extern void iommu_group_put(struct iommu_group *group);
 
@@ -1401,6 +1404,20 @@ static inline struct iommu_group *iommu_group_get(struct device *dev)
 	return NULL;
 }
 
+static inline struct iommu_group *iommu_group_get_by_id(int id)
+{
+	return NULL;
+}
+
+static inline void iommu_group_put_by_id(struct iommu_group *group)
+{
+}
+
+static inline bool iommu_group_is_active(struct iommu_group *group)
+{
+	return false;
+}
+
 static inline void iommu_group_put(struct iommu_group *group)
 {
 }
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
