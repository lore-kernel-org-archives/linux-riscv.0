Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FB606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Giz3xGh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gXLoL+H4xePPB15K9QdXOEdQiZ+m70XvKwSAjZ1lssc=; b=0Giz3xGhBrg5CDAOZg7xn5a7/p
	w0TCgKEONQv5X4ijej5z9Zu6lOSSzH18AvwTIE5piOv1L1pqkdOLs6ZR/XtzYFeeizdG1nsUnnAOm
	5y4hXVMOy2I7lCUmuYBvw2NAHEGfuFbpFbGo+qoeVXaPvjHCQ7hikZsnLe4wqM4btYIKAWaOEgs0m
	EswumLVAS0gNkXNX8CwsAXMqqLhdqJZU40hHnMSbHwaqzv4nQ1WzV6pVhvuyp7mt2wYMAV5lf4VTj
	6HK/X88gc9lyqFicOrFZJzBqknIPzJC10CUFVUUn02v2yrWk3PzxIrqMN0dK2Xvdyd4Eqd4tFOfr+
	+2OWecUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1pG-0000000ByrQ-1JpA;
	Thu, 19 Nov 2026 13:05:19 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1p9-0000000ByiO-2zX8
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 13:05:17 +0000
X-QQ-mid: zesmtpsz2t1795093462td71789a8
X-QQ-Originating-IP: cR3TjEg74wmWMTs1ARy7U2n+xVQze2SG4pmLd9lYPZY=
Received: from LAPTOP-H63V2Q11 ( [36.110.52.2])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:04:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15795927322090036901
EX-QQ-RecipientCnt: 14
From: Zhouqi Jiang <luojia@rustsbi.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Anup Patel <anup@brainfault.org>,
	Andrew Davis <afd@ti.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alejandro Colomar <alx@kernel.org>,
	contact@rustsbi.com
Subject: [RFC PATCH RESEND] riscv: sbi: expose firmware identity in sysfs
Date: Thu, 19 Nov 2026 21:03:56 +0800
Message-ID: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com>
X-Mailer: git-send-email 2.53.0.windows.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:rustsbi.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M21ph8MgUKJrRs0VPR0RJSWzCHn7d7WZmBf+NsoC39Jf2TiNgGPM2QVB
	him+MJsDcaoscwu34lvSb6uKQq8yl6C42N7GNW1Ec0dQKBVpd+RLaQS8kqLi8O2RdwhfJ+v
	8KJUMks2ZRDAoKmYL0L9RKEeUSYoEt/lIhmEbifymYTwmxhQP346vfqa/lVyRiDWtNOGQ09
	i9ac4Qukltekvm4n2Fv5Pp2A3suAzbdmMy8XQgkER/xZWvVOhhC1nlFF68JXgtRKY6v1l/X
	fX99n7MlweQAjjDQGyJLw5X6GDjliTx3IS4Eyy9ezG1EmJdqcRa8ee/BFbl8AXfaQi1HIwK
	UyNnDCSo3cEQmla+f38GdvcxgXRFcI/h7dOCThbTUHutIcO/HaUtCFy/9fxmJ6YyK5wgfRi
	9XCK4e2yAklcA+gGiMR21wBvTBryhS3oN0lAGa0kb/X2NQjR0gk/EE668kJCqlQz25hqBCn
	ROQeHo0HPHpk3/3tvBu3G8jb9ALJFx4PkF5KNFJ4T/G5AOenpFrEPZNEmR7DPDRRx+5cy7b
	H9JXwUCJVUh+ayWfAk4WyLYvj6u6VRYWkl2RMDGc8guu55Eaqd5hu7tC/AZfZauTILeOx3v
	e6IJZJcWi+sexQCcuhf5oIySazc1Ue82l6sifKB/JEKXDiTAULFTTM6CGxJPyDK/pKYpqkb
	yoUEplItVTEBr9UEb/ao9o27cDpbHxLGOHAGH3VanS+fuGiXDViFi3zIfKicDYbQHO5dVdd
	tbchzmTpdItx0+o93VB4OY4VGcahFgbnWwL2yFA12KEpkCK1Y9qaFhRKqBizqXgMSEsUWjN
	Yqo/9O4ucZxa/zx6QVMUCea8jJl/S/7UaDiH+/w8ojpf3gHh4wh8rD+YUDD/E0A7iigRG2+
	hb1ayfhkl0euZmKYEYAvDHNglSIapYAYvPvbuEZXZtw1bh/CLXBk+1S2kjhnRjt4VS4xt3B
	asOZSMI/AbFNQdbZYoZ5HVuw5L+Rk31ccSMm7tjEVecHJuOjA2rdigE1IxWN2yMbw6vjRBS
	gRdjL6NiaMQG9Pg7oGAyJ5UHjOlmb0VYiumkalEJqnfYploroY5Q3C2zQUQeRu5rWP7Y17L
	7vuTHZrmPoGSz93LHy3CMc=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050512_415200_617EA782 
X-CRM114-Status: GOOD (  17.98  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Linux queries the SBI specification and implementation identity during
boot. It caches the specification version, but discards the
implementation ID and version after logging them. Userspace therefore
has no structured interface for this immutable firmware metadata.

Cache the implementation ID and version and expose the available values
as read-only attributes under /sys/firmware/sbi:

  spec_version
  impl_id
  impl_version

SBI v0.1 systems expose only spec_version because the implementation
fields were introduced by the SBI Base extension in v0.2.

This gives tools such as lssbi a native source for basic SBI identity
information and starts moving those queries away from out-of-tree
kernel modules.

Codex was prompted to research lssbi's out-of-tree SBI probe and design
a minimal in-kernel replacement. It assisted with the sysfs interface,
implementation, ABI documentation, changelog, and QEMU test setup. The
result was built with a RISC-V defconfig and boot-tested under QEMU
virt with:

  OpenSBI v1.3
  RustSBI v0.4.1

Assisted-by: Codex:GPT-5
Signed-off-by: Zhouqi Jiang <luojia@rustsbi.com>
---
 Documentation/ABI/testing/sysfs-firmware-sbi | 30 ++++++++++
 MAINTAINERS                                  |  1 +
 arch/riscv/kernel/sbi.c                      | 62 +++++++++++++++++++-
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-sbi

diff --git a/Documentation/ABI/testing/sysfs-firmware-sbi b/Documentation/ABI/testing/sysfs-firmware-sbi
new file mode 100644
index 000000000000..516f9e6cee79
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-sbi
@@ -0,0 +1,30 @@
+What:		/sys/firmware/sbi/spec_version
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI specification version available to Linux, formatted as two
+		unsigned decimal integers separated by a period and followed by a
+		newline. For example, SBI v0.2 is represented as "0.2".
+Users:		lssbi
+
+What:		/sys/firmware/sbi/impl_id
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI implementation ID, formatted as lowercase hexadecimal with
+		a 0x prefix, no leading zero padding, and a trailing newline. For
+		example, OpenSBI is represented as "0x1". The ID is assigned by the
+		SBI specification. This attribute is present only when SBI v0.2 or
+		later is available.
+Users:		lssbi
+
+What:		/sys/firmware/sbi/impl_version
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI implementation version, formatted as lowercase hexadecimal
+		with a 0x prefix, no leading zero padding, and a trailing newline.
+		Its encoding is specific to the SBI implementation identified by
+		impl_id. This attribute is present only when SBI v0.2 or
+		later is available.
+Users:		lssbi
diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..707afa1af1a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23494,6 +23494,7 @@ Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
+F:	Documentation/ABI/testing/sysfs-firmware-sbi
 F:	arch/riscv/
 N:	riscv
 K:	riscv
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..945a6d8d4f3e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/init.h>
+#include <linux/kobject.h>
 #include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
@@ -18,6 +19,9 @@
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
 
+static unsigned long sbi_impl_id __ro_after_init;
+static unsigned long sbi_impl_version __ro_after_init;
+
 static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
 static void (*__sbi_send_ipi)(unsigned int cpu) __ro_after_init;
 static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
@@ -659,8 +663,10 @@ void __init sbi_init(void)
 		sbi_major_version(), sbi_minor_version());
 
 	if (!sbi_spec_is_0_1()) {
+		sbi_impl_id = sbi_get_firmware_id();
+		sbi_impl_version = sbi_get_firmware_version();
 		pr_info("SBI implementation ID=0x%lx Version=0x%lx\n",
-			sbi_get_firmware_id(), sbi_get_firmware_version());
+			sbi_impl_id, sbi_impl_version);
 		if (sbi_probe_extension(SBI_EXT_TIME)) {
 			__sbi_set_timer = __sbi_set_timer_v02;
 			pr_info("SBI TIME extension detected\n");
@@ -707,3 +713,57 @@ void __init sbi_init(void)
 	if (!srst_power_off)
 		sbi_set_power_off();
 }
+
+static ssize_t spec_version_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%lu.%lu\n",
+			  sbi_major_version(), sbi_minor_version());
+}
+
+static ssize_t impl_id_show(struct kobject *kobj,
+			    struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%lx\n", sbi_impl_id);
+}
+
+static ssize_t impl_version_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%lx\n", sbi_impl_version);
+}
+
+static struct kobj_attribute spec_version_attr = __ATTR_RO(spec_version);
+static struct kobj_attribute impl_id_attr = __ATTR_RO(impl_id);
+static struct kobj_attribute impl_version_attr = __ATTR_RO(impl_version);
+
+static umode_t sbi_attr_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int n)
+{
+	if (sbi_spec_is_0_1() && attr != &spec_version_attr.attr)
+		return 0;
+
+	return attr->mode;
+}
+
+static struct attribute *sbi_attrs[] = {
+	&spec_version_attr.attr,
+	&impl_id_attr.attr,
+	&impl_version_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group sbi_attr_group = {
+	.name = "sbi",
+	.is_visible = sbi_attr_is_visible,
+	.attrs = sbi_attrs,
+};
+
+static int __init sbi_sysfs_init(void)
+{
+	if (!firmware_kobj)
+		return -ENOMEM;
+
+	return sysfs_create_group(firmware_kobj, &sbi_attr_group);
+}
+subsys_initcall(sbi_sysfs_init);

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
