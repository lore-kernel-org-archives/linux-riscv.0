Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D96606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CA8qlGMZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jRbHsiru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UKgbulVerjprStVxhpLOkCvt/WFkgr507nzNmCqgX2E=; b=CA8qlGMZMjPNYMitEk/mKDpSvx
	T1c4ZXB7R1uRWkoNALhAcIikK6yC18n9lbTFUE7eGRGr5n9EISYDp5yD3x3ITLrxzalN73HyxyOEi
	wVGqDxdWgGOnAkQK2noDfolr5RvfC/Vp0PEEIAuMHJzkeaV99AegmIEdrN0YhfvrNrd7aA8YiVlhn
	np1b/0PpFdoAC+3FBnPLk1HUgDN4iWNxrHAgta9uDbbLl/7QOZTZuJRHiJXXLKhN4b5PuS6BcXntn
	7ehDHkVRHjMERHYZElqjuX9CJMYyH/Es2cdyVIYajITA08Q6mRA1FMHijDGxCMRW48ZQMbzrJ0X6n
	MPHzsH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqun-00000001NCD-3oWl;
	Mon, 16 Nov 2026 07:14:09 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqul-00000001NB6-409b
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:14:09 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36dbde64409so4553406eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794813247; x=1795418047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuQq4JFvVTaug2dVoyrAXV50xaKQGTRvxFBICoP+1lY=;
        b=jRbHsiruDqTUcfUxzrd6NHbtWApTHq+jEbt0IHzQ/H0vwb72liP0GnC+REWNnXHo8R
         P1ivB3Bj4xIu0OkwrZOOZunvzuP9HRnJf51DQzlXLE1Q/8FOZVa83zymxUqtPMQslY32
         ZQq8l/Yi+AHdZjC7RUp0eDD1CtYopduGeMBzz8mUu0+sjma2VJTEJ8Y1yrTb7sYkiZy3
         a+dzk69K2NP4aVExdN8mxWSJhdmGv+HvRZPIMF1lkZz+HHfXYrXR8rSDyc1yD8FX7PPw
         vcFJfbzThed99fAFHUqxYxbp3hpT26Qz4hn4VHbu+GHHk49P1BamlcAjGlj8IKFZ+NlO
         uc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813247; x=1795418047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuQq4JFvVTaug2dVoyrAXV50xaKQGTRvxFBICoP+1lY=;
        b=jPy4ykrEeDb85MMfLeiyhahw/AhIJABLDZa5WGkK2xEGPZv8aBfYqC1qsZsn1SblwJ
         WkJ2DNSqk7a4HO2ia3eJSD+5Pp6NCrLTyJ8gNhErDsj4ezqySu/T8P5oJIWXW91bhgT7
         BZFvS+3yGQb8zfeniHYhP7hlcgGDSkbl6DYuqRp2ZNUmGrrsPgZFIz+uuj7KPudqwY2L
         vD0XIIdZbR6Zy0YtNtKUAzr1sMi7lqRJE18Us9WLmeJ17WtUVsfNwpSpNS/pA7E0R8jK
         I0vJSNuAAk+cEnttJ9elrVUOLUnCYPqZ6IX21QFTH6U2N5cjtQu32QIlHk5MODD3xT76
         /vfQ==
X-Forwarded-Encrypted: i=1; AL+hErHzMgv5DUHhW0OU4W4NbLdR0UOZcvARjZqoR274SnSStyGBoSN5W2+rYuHeMV5EHcMcAb0rKVdvxE8ffg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ooimao2Mqm+v1wvt+FQZN+2aiqG8Memn5ZOsBWxBwLF9fz14r
	AavdCvwJJObIIH7RuuYOXbJFr0LhwJowEvnjhAigZrJVHDaOM9hPS2eccoXZJCQ0cUE=
X-Gm-Gg: AYBFou177vQoX1x0U9v+5PodaIswQYhBEozPiE/C0k3QWvZUBnQs8GydekhtreHTb68
	CpOtcrqRRZ9T+78ZCrSVTKgtgUIeL/5FiQMPRmtRv2rJCYtvoG58MDPkFqa0EStsdsiNfUCDPcS
	hNvgj3E1lvcPvTQY+E/zjH+r5iABZm7Uc+pSNogPsbWdfbI+ZBr7EsIWjTLlOBZ2zKIhtah9x7H
	TCYzl0f5ur+ZiTBdv9mnHUFpx4JC0Oj9S+TUZ6LGw5EaToY81zslEpqx7IyvibjmyfZJoD2EkHd
	//V8iacU5aDSs/LxK19lufFAKTLlcUxYpC0YauCAIS6/cqCgP5RQQvR2gA/mGGbT3F16p5/m89u
	ONh+1o00FGS8686m7GsaPd0djjlupT/oNbMWLOk9U+8+pdUNkRPchrZkULxyOQ2OkW+sfFbbaHf
	bMMUhiob68dCgNHWJn655+niDSy7b/fRZeMIKgm5nSE+PBjtnkCHNg7JgZKuxSvuOJjpfFUAMQR
	MF9e1Jo7aX1JKEukCRrEZni5sGKjywErXCvuQUsfbQ7rn/7/X1WJleULBOEdWbHJDevzzQu4x86
	I2v/ay2vG4EuqoNQfzLbRLU/BlDJyCjkcCyR2XCWW/2wnuwbPR8FiwtWCDLzgiWkjL5jB7lMZwJ
	0k1u3mNg=
X-Received: by 2002:a05:7301:c017:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37967dd4caamr9968595eec.38.1794813246758;
        Sun, 15 Nov 2026 23:14:06 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm47858505eec.8.2026.11.15.23.13.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:14:06 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: fustini@kernel.org,
	jgg@ziepe.ca,
	james.morse@arm.com,
	ben.horgan@arm.com,
	xiaqinxin@huawei.com,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	kevin.tian@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	randy.dunlap@infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH v2 1/4] resctrl: Add registered device assignment
Date: Mon, 16 Nov 2026 15:13:40 +0800
Message-ID: <20261116071338.35991-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231408_008356_A130BC4A 
X-CRM114-Status: GOOD (  24.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep requester discovery and hardware programming in providers. Common
resctrl owns a bus/name registry and resource-group membership, with one
sleepable set_ids callback per provider. Keep filesystem integration small
and separate from the registry implementation.

Snapshot runtime availability at mount, serialize assignment with
unregister, reject removal of assigned groups, and quarantine ID reuse
after an uncertain hardware update. Recovery and dynamic creation of the
first devices file are intentionally outside this RFC.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 fs/resctrl/Makefile            |   2 +-
 fs/resctrl/devices.c           | 233 +++++++++++++++++++++++++++++++++
 fs/resctrl/internal.h          |   8 ++
 fs/resctrl/rdtgroup.c          |  28 ++++
 include/linux/resctrl_device.h |  53 ++++++++
 5 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 fs/resctrl/devices.c
 create mode 100644 include/linux/resctrl_device.h

diff --git a/fs/resctrl/Makefile b/fs/resctrl/Makefile
index e67f34d2236a..1cd663c3309a 100644
--- a/fs/resctrl/Makefile
+++ b/fs/resctrl/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RESCTRL_FS)		+= rdtgroup.o ctrlmondata.o monitor.o
+obj-$(CONFIG_RESCTRL_FS)		+= rdtgroup.o ctrlmondata.o monitor.o devices.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
 # To allow define_trace.h's recursive include:
diff --git a/fs/resctrl/devices.c b/fs/resctrl/devices.c
new file mode 100644
index 000000000000..f98d375e6934
--- /dev/null
+++ b/fs/resctrl/devices.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Registered, independently tagged devices assigned to resctrl groups. */
+#include <linux/capability.h>
+#include <linux/device.h>
+#include <linux/resctrl_device.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+/* All registry, ownership and callback access is under rdtgroup_mutex. */
+struct resctrl_device {
+	struct list_head list;
+	struct device *dev;
+	const struct resctrl_device_ops *ops;
+	struct rdtgroup *group; /* NULL denotes the default group. */
+	char *token; /* Stable bus/name identity; not a sysfs pathname. */
+};
+
+static LIST_HEAD(resctrl_devices);
+/* No recovery protocol yet: never recycle IDs after an uncertain update. */
+static bool devices_quarantined;
+/* File visibility is a mount-time capability snapshot. */
+static bool devices_enabled;
+
+static struct resctrl_device *resctrl_device_find(struct device *dev)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	list_for_each_entry(entry, &resctrl_devices, list)
+		if (entry->dev == dev)
+			return entry;
+	return NULL;
+}
+
+int resctrl_device_register(struct device *dev,
+			    const struct resctrl_device_ops *ops)
+{
+	struct resctrl_device *entry, *other;
+	int ret = 0;
+
+	if (!dev->bus || !ops || !ops->set_ids ||
+	    strpbrk(dev->bus->name, "/ \t\n\r\v\f,") ||
+	    strpbrk(dev_name(dev), "/ \t\n\r\v\f,"))
+		return -EINVAL;
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+	entry->token = kasprintf(GFP_KERNEL, "%s/%s", dev->bus->name,
+				 dev_name(dev));
+	if (!entry->token) {
+		kfree(entry);
+		return -ENOMEM;
+	}
+	entry->dev = get_device(dev);
+	entry->ops = ops;
+
+	mutex_lock(&rdtgroup_mutex);
+	list_for_each_entry(other, &resctrl_devices, list) {
+		if (other->dev == dev || !strcmp(other->token, entry->token)) {
+			ret = -EEXIST;
+			goto out;
+		}
+	}
+	list_add_tail(&entry->list, &resctrl_devices);
+out:
+	mutex_unlock(&rdtgroup_mutex);
+	if (ret) {
+		put_device(entry->dev);
+		kfree(entry->token);
+		kfree(entry);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(resctrl_device_register);
+
+void resctrl_device_unregister(struct device *dev)
+{
+	struct resctrl_device *entry;
+
+	mutex_lock(&rdtgroup_mutex);
+	entry = resctrl_device_find(dev);
+	if (!entry)
+		goto out;
+
+	if (entry->ops->set_ids(dev, (struct resctrl_device_ids){})) {
+		devices_quarantined = true;
+		dev_err(dev, "resctrl: reset failed; ID reuse disabled\n");
+	}
+	list_del(&entry->list);
+	put_device(entry->dev);
+	kfree(entry->token);
+	kfree(entry);
+out:
+	mutex_unlock(&rdtgroup_mutex);
+}
+EXPORT_SYMBOL_GPL(resctrl_device_unregister);
+
+bool resctrl_devices_visible(void)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	return devices_enabled;
+}
+
+int resctrl_devices_prepare_mount(void)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	if (devices_quarantined)
+		return -EIO;
+	devices_enabled = !list_empty(&resctrl_devices);
+	return 0;
+}
+
+/* Must precede freeing any resource group or its IDs. */
+void resctrl_devices_unmount(void)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (entry->group &&
+		    entry->ops->set_ids(entry->dev,
+					(struct resctrl_device_ids){})) {
+			devices_quarantined = true;
+			dev_err(entry->dev, "resctrl: unmount reset failed\n");
+		}
+		entry->group = NULL;
+	}
+	devices_enabled = false;
+}
+
+/* Includes monitor children when the caller changes/removes a CTRL group. */
+int resctrl_devices_check_group(struct rdtgroup *group)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	if (devices_quarantined) {
+		rdt_last_cmd_puts("Device QoS state uncertain; reboot required\n");
+		return -EIO;
+	}
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (entry->group == group ||
+		    (entry->group && entry->group->type == RDTMON_GROUP &&
+		     entry->group->mon.parent == group)) {
+			rdt_last_cmd_puts("Move assigned devices to the default group first\n");
+			return -EBUSY;
+		}
+	}
+	return 0;
+}
+
+int resctrl_devices_show(struct kernfs_open_file *of, struct seq_file *s,
+			 void *v)
+{
+	struct rdtgroup *group = rdtgroup_kn_lock_live(of->kn);
+	struct resctrl_device *entry;
+	int ret = 0;
+
+	if (!group) {
+		ret = -ENOENT;
+		goto out;
+	}
+	if (devices_quarantined) {
+		ret = -EIO;
+		goto out;
+	}
+	if (group == &rdtgroup_default)
+		group = NULL;
+	list_for_each_entry(entry, &resctrl_devices, list)
+		if (entry->group == group)
+			seq_printf(s, "%s\n", entry->token);
+out:
+	rdtgroup_kn_unlock(of->kn);
+	return ret;
+}
+
+ssize_t resctrl_devices_write(struct kernfs_open_file *of, char *buf,
+			      size_t nbytes, loff_t off)
+{
+	struct resctrl_device_ids ids;
+	struct resctrl_device *entry;
+	struct rdtgroup *group;
+	char *token;
+	int ret = -ENODEV;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+	group = rdtgroup_kn_lock_live(of->kn);
+	if (!group) {
+		ret = -ENOENT;
+		goto out;
+	}
+	if (off || memchr(buf, '\0', nbytes)) {
+		ret = -EINVAL;
+		goto out;
+	}
+	token = strim(buf);
+	if (devices_quarantined) {
+		ret = -EIO;
+		goto out;
+	}
+	if (group->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
+	    group->mode == RDT_MODE_PSEUDO_LOCKED ||
+	    (group->type == RDTMON_GROUP &&
+	     group->mon.parent->mode != RDT_MODE_SHAREABLE)) {
+		ret = -EBUSY;
+		goto out;
+	}
+	/* One registered identity per write, with no path or list parsing. */
+	if (!*token || strpbrk(token, " \t\n\r\v\f,")) {
+		ret = -EINVAL;
+		goto out;
+	}
+	ids.closid = group->closid;
+	ids.rmid = group->mon.rmid;
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (strcmp(entry->token, token))
+			continue;
+		ret = entry->ops->set_ids(entry->dev, ids);
+		if (!ret)
+			entry->group = group == &rdtgroup_default ? NULL : group;
+		else if (ret == -EIO || ret == -ETIMEDOUT)
+			devices_quarantined = true;
+		break;
+	}
+out:
+	if (ret)
+		rdt_last_cmd_printf("Device assignment failed: %d\n", ret);
+	rdtgroup_kn_unlock(of->kn);
+	return ret ? ret : nbytes;
+}
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..4bebd998bdb7 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -335,6 +335,14 @@ __printf(1, 2)
 void rdt_last_cmd_printf(const char *fmt, ...);
 
 struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn);
+bool resctrl_devices_visible(void);
+int resctrl_devices_prepare_mount(void);
+void resctrl_devices_unmount(void);
+int resctrl_devices_check_group(struct rdtgroup *group);
+int resctrl_devices_show(struct kernfs_open_file *of, struct seq_file *s,
+			 void *v);
+ssize_t resctrl_devices_write(struct kernfs_open_file *of, char *buf,
+			      size_t nbytes, loff_t off);
 void rdtgroup_kn_unlock(struct kernfs_node *kn);
 bool info_kn_lock(struct kernfs_node *kn);
 void info_kn_unlock(struct kernfs_node *kn);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..4d3417273934 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1560,6 +1560,9 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		}
 		rdtgrp->mode = RDT_MODE_SHAREABLE;
 	} else if (!strcmp(buf, "exclusive")) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
 		if (!rdtgroup_mode_test_exclusive(rdtgrp)) {
 			ret = -EINVAL;
 			goto out;
@@ -1572,6 +1575,9 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		rdtgrp->mode = RDT_MODE_EXCLUSIVE;
 	} else if (IS_ENABLED(CONFIG_RESCTRL_FS_PSEUDO_LOCK) &&
 		   !strcmp(buf, "pseudo-locksetup")) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
 		ret = rdtgroup_locksetup_enter(rdtgrp);
 		if (ret)
 			goto out;
@@ -2158,6 +2164,14 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_tasks_show,
 		.fflags		= RFTYPE_BASE,
 	},
+	{
+		.name		= "devices",
+		.mode		= 0600,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= resctrl_devices_write,
+		.seq_show	= resctrl_devices_show,
+		.fflags		= RFTYPE_BASE,
+	},
 	{
 		.name		= "mon_hw_id",
 		.mode		= 0444,
@@ -2225,6 +2239,8 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
 		fflags |= RFTYPE_DEBUG;
 
 	for (rft = rfts; rft < rfts + len; rft++) {
+		if (!strcmp(rft->name, "devices") && !resctrl_devices_visible())
+			continue;
 		if (rft->fflags && ((fflags & rft->fflags) == rft->fflags)) {
 			ret = rdtgroup_add_file(kn, rft);
 			if (ret)
@@ -3132,6 +3148,7 @@ static void resctrl_fs_teardown(void)
 	if (!rdtgroup_default.kn)
 		return;
 
+	resctrl_devices_unmount();
 	rmdir_all_sub();
 	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
@@ -3192,6 +3209,9 @@ static int rdt_get_tree(struct fs_context *fc)
 		ret = -EBUSY;
 		goto out;
 	}
+	ret = resctrl_devices_prepare_mount();
+	if (ret)
+		goto out;
 
 	ret = setup_rmid_lru_list();
 	if (ret)
@@ -4278,6 +4298,9 @@ static int rdtgroup_rmdir(struct kernfs_node *kn)
 		goto out;
 	}
 	parent_kn = rdt_kn_parent(kn);
+	ret = resctrl_devices_check_group(rdtgrp);
+	if (ret)
+		goto out;
 
 	/*
 	 * If the rdtgroup is a ctrl_mon group and parent directory
@@ -4394,6 +4417,11 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		ret = -EPERM;
 		goto out;
 	}
+	if (rdtgrp->mon.parent != new_prdtgrp) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
+	}
 
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
diff --git a/include/linux/resctrl_device.h b/include/linux/resctrl_device.h
new file mode 100644
index 000000000000..a39f674739d6
--- /dev/null
+++ b/include/linux/resctrl_device.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_RESCTRL_DEVICE_H
+#define _LINUX_RESCTRL_DEVICE_H
+
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/types.h>
+
+struct device;
+
+/* Resource-group IDs, interpreted by the architecture's request tagger. */
+struct resctrl_device_ids {
+	u32 closid;
+	u32 rmid;
+};
+
+/**
+ * struct resctrl_device_ops - program one independently tagged requester
+ * @set_ids: Complete the update before returning zero. Validation errors must
+ *	leave the old IDs intact. Return -EIO if hardware state is uncertain;
+ *	resctrl then prevents ID reuse. Called in sleepable context, serialized
+ *	with assignment and unregister. Must not call back into resctrl.
+ */
+struct resctrl_device_ops {
+	int (*set_ids)(struct device *dev, struct resctrl_device_ids ids);
+};
+
+#ifdef CONFIG_RESCTRL_FS
+/*
+ * Register only after hardware and driver-private state are ready. The bus and
+ * device names must remain stable until unregister. Initial IDs must be zero.
+ * The driver must own the tag fields exclusively, including across reattach.
+ */
+int resctrl_device_register(struct device *dev,
+			    const struct resctrl_device_ops *ops);
+
+/*
+ * Remove the requester and drain callbacks BEFORE freeing driver state.
+ * This also resets its IDs. A failed reset quarantines resctrl until reboot,
+ * rather than recycling IDs which the device might still be using.
+ */
+void resctrl_device_unregister(struct device *dev);
+#else
+static inline int
+resctrl_device_register(struct device *dev, const struct resctrl_device_ops *ops)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void resctrl_device_unregister(struct device *dev) { }
+#endif
+
+#endif
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
