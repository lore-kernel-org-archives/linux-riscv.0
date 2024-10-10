Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A405CF07CB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+n9q50hgrxKOHpQTpMvBn9pI3upSwFp/E3sHHHIdmU=; b=m/9vctUdSjOZ4e
	nhXPcLmAuYtjDWMZycwE+B+mtfWV4yo1BH9Pt82jb44GU+IeY6DtWm3zUsZWYKPBBijYiJ/fYC5Vk
	+XM2l26HbSlTT6PGWginh6jYfRi7G6sX4XvKIH/hyu7LS22/s9G1KxrQgTJZoAIxwWtbdAv0T9XWf
	qSXJRVcD0mnrKCQ/6e65mNnUbRmEt228owVq+GH4CknwblckXutIst4utKfjdOjR5L+4f+ZrM1/WW
	VQxBx2DT22mJ5KTk+3LriNRfowRAVmC+d5UjVLFZbCFlL8Jz4Hdoywsva1zVGu0T9/YfkI5uWA2/H
	D+ZoGezAX1pM7w9VHaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syooA-0000000C4Bf-0Ztu;
	Thu, 10 Oct 2024 08:46:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBs-0000000Blql-1N3q;
	Thu, 10 Oct 2024 07:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J6B4IeG8b5QcjhSj/+p4Domwg1/4XtpjyB0sq6j0/Js=; b=Ak4k5NzJaowMOWfN0JV85SY6dW
	DgWu0AzilsSRlFf4km/Dzc52SaSXzjCkPMzBtMAdEJ4I3NSiIqsnZ2PY+tmxFjA7QpErQrdKKSfpI
	HxzrKRAEsf7T9cjValFs2d1LuLv6pe+KTH2KYiGEBg1bNQsnajodwkXZbz7Su7k2wLZhtt3uW7+N7
	ThafkYcEkoKFax1H4BM8zdGpFacjwGFcg52e+myXBpmWCJh/OH93ucGuwi5aNPhv/wW0y8zTwY+dg
	x7RlmOylb/L8nIDbVqKvUGkkpxVYApA7lcn3tCyP9o2lcowuI3tFGGT90Wp8pUcCPP0sGLpH3enNA
	ZMczZgaA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBm-00000005D1z-0XVl;
	Thu, 10 Oct 2024 07:02:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6B4IeG8b5QcjhSj/+p4Domwg1/4XtpjyB0sq6j0/Js=;
	b=fWbAj6SKPmJMSqAA+na8CcrjolRy8rvILXwN2NxnjkEzIbVEB5CYlexodSUjhG/Q8Xm2+4
	aLE//zeul/XMtt1d/zrVwqXDslhmJV0ztaBLNOayxJ+LdmdHQ4690B5+F97s172+Iih41f
	+uTS+I4LcGjdJwpZy12nBkb5UCbzfTCNgfKfpGQf+PMIAP4ej0rtOXR9E2hy1n4SKanLu+
	6uEDB7z7Lio87aSGfEdjEIQU4tKX1asAPwE0HVFgDX/K4EpWRItQrZjbCkwZ/8Jo8tviZt
	q4ZTwa+cJsA1lehTHFk/Ip+YwuAZIFJWbZohxGDOi/x+Avxk9koRe8VT+942Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6B4IeG8b5QcjhSj/+p4Domwg1/4XtpjyB0sq6j0/Js=;
	b=ksIzw7DMfxsbzKHYfd2j/mNmq8rqLf2y/uNmpD/tzB9ukTW5uKJuQ2FAIinnIWUrCVEyO3
	UBfqLVYPow0S08CQ==
Date: Thu, 10 Oct 2024 09:01:30 +0200
Subject: [PATCH 28/28] vdso: Rename struct arch_vdso_data to
 arch_vdso_time_data
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nam Cao <namcao@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=7074;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bmLr9bltMVHizIeVDqLzj2HqsQpWocRWT4+kR/T19ag=;
 b=N3HFGRCOhFBmFayrQto6v2sWiZPZyyxCoZ6rc+97KQn8YQbzqhCmMvQaJzGUe9ZcpAV+Vk3+G
 VNSUB6zxS7JBUKO30Jn44YK6Zc/Ft0AJW8nj8jbQNCMTG/nweeZhxMs
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080225_205394_BE26FDF6 
X-CRM114-Status: GOOD (  19.24  )
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

From: Nam Cao <namcao@linutronix.de>

The struct arch_vdso_data is only about vdso time data. So rename it to
arch_vdso_time_data to make it obvious.
Non time-related data will be migrated out of these structs soon.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/Kconfig                                        |  2 +-
 arch/riscv/Kconfig                                  |  2 +-
 arch/riscv/include/asm/vdso/{data.h => time_data.h} |  8 ++++----
 arch/riscv/kernel/sys_hwprobe.c                     |  2 +-
 arch/riscv/kernel/vdso/hwprobe.c                    |  4 ++--
 arch/s390/Kconfig                                   |  2 +-
 arch/s390/include/asm/vdso/data.h                   | 12 ------------
 arch/s390/include/asm/vdso/time_data.h              | 12 ++++++++++++
 include/vdso/datapage.h                             |  8 ++++----
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8af374ea1adc245b3aa341314a1dcb51865d03d1..7f1ec327b587c90f02e63edea19ce65c56505b9b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1530,7 +1530,7 @@ config HAVE_SPARSE_SYSCALL_NR
 	  entries at 4000, 5000 and 6000 locations. This option turns on syscall
 	  related optimizations for a given architecture.
 
-config ARCH_HAS_VDSO_DATA
+config ARCH_HAS_VDSO_TIME_DATA
 	bool
 
 config HAVE_STATIC_CALL
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf432df5b41e235ba66438cd3743c06..c278280c134f78d5a1f89199bdb85ad362aa5436 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -50,7 +50,7 @@ config RISCV
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_VDSO_TIME_DATA
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/riscv/include/asm/vdso/data.h b/arch/riscv/include/asm/vdso/time_data.h
similarity index 71%
rename from arch/riscv/include/asm/vdso/data.h
rename to arch/riscv/include/asm/vdso/time_data.h
index dc2f76f58b7632f0392af6aaf475076203f1a54a..dfa65228999bed41dfd6c5e36cb678e1e055eec8 100644
--- a/arch/riscv/include/asm/vdso/data.h
+++ b/arch/riscv/include/asm/vdso/time_data.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __RISCV_ASM_VDSO_DATA_H
-#define __RISCV_ASM_VDSO_DATA_H
+#ifndef __RISCV_ASM_VDSO_TIME_DATA_H
+#define __RISCV_ASM_VDSO_TIME_DATA_H
 
 #include <linux/types.h>
 #include <vdso/datapage.h>
 #include <asm/hwprobe.h>
 
-struct arch_vdso_data {
+struct arch_vdso_time_data {
 	/* Stash static answers to the hwprobe queries when all CPUs are selected. */
 	__u64 all_cpu_hwprobe_values[RISCV_HWPROBE_MAX_KEY + 1];
 
@@ -14,4 +14,4 @@ struct arch_vdso_data {
 	__u8 homogeneous_cpus;
 };
 
-#endif /* __RISCV_ASM_VDSO_DATA_H */
+#endif /* __RISCV_ASM_VDSO_TIME_DATA_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a25ecc671e31b141e84c6d1977da25..711a31f27c3d051476dd46afa51e6d33cd2fdffa 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -402,7 +402,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 static int __init init_hwprobe_vdso_data(void)
 {
 	struct vdso_data *vd = __arch_get_k_vdso_data();
-	struct arch_vdso_data *avd = &vd->arch_data;
+	struct arch_vdso_time_data *avd = &vd->arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 1e926e4b5881b6b2c44ec8438870809539f773c5..a158c029344f60c022e7565757ff44df7e3d89e5 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -17,7 +17,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 				 unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_data *avd = &vd->arch_data;
+	const struct arch_vdso_time_data *avd = &vd->arch_data;
 	bool all_cpus = !cpusetsize && !cpus;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
@@ -52,7 +52,7 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 			       unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_data *avd = &vd->arch_data;
+	const struct arch_vdso_time_data *avd = &vd->arch_data;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
 	unsigned char *c = (unsigned char *)cpus;
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index d339fe4fdedf881fd9224020381a1c7f62998d59..8cdd8359e00c3e383aaf5116f557203b59b065c3 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -88,7 +88,7 @@ config S390
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_VDSO_TIME_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
 	select ARCH_INLINE_READ_LOCK_BH
diff --git a/arch/s390/include/asm/vdso/data.h b/arch/s390/include/asm/vdso/data.h
deleted file mode 100644
index 0e2b40ef69b049c5e79ab2e31811e1e6e6ef2475..0000000000000000000000000000000000000000
--- a/arch/s390/include/asm/vdso/data.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __S390_ASM_VDSO_DATA_H
-#define __S390_ASM_VDSO_DATA_H
-
-#include <linux/types.h>
-
-struct arch_vdso_data {
-	__s64 tod_steering_delta;
-	__u64 tod_steering_end;
-};
-
-#endif /* __S390_ASM_VDSO_DATA_H */
diff --git a/arch/s390/include/asm/vdso/time_data.h b/arch/s390/include/asm/vdso/time_data.h
new file mode 100644
index 0000000000000000000000000000000000000000..8a08752422e609d925c87ba5aafd1bbb6fef57e7
--- /dev/null
+++ b/arch/s390/include/asm/vdso/time_data.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __S390_ASM_VDSO_TIME_DATA_H
+#define __S390_ASM_VDSO_TIME_DATA_H
+
+#include <linux/types.h>
+
+struct arch_vdso_time_data {
+	__s64 tod_steering_delta;
+	__u64 tod_steering_end;
+};
+
+#endif /* __S390_ASM_VDSO_TIME_DATA_H */
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b85f24cac3f564d8b3c25c6ce86d2527af0e1e0b..d967baa0cd0c65784e38dc4fcd7b9e8273923947 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -19,10 +19,10 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
-#ifdef CONFIG_ARCH_HAS_VDSO_DATA
-#include <asm/vdso/data.h>
+#ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
+#include <asm/vdso/time_data.h>
 #else
-struct arch_vdso_data {};
+struct arch_vdso_time_data {};
 #endif
 
 #define VDSO_BASES	(CLOCK_TAI + 1)
@@ -114,7 +114,7 @@ struct vdso_data {
 	u32			hrtimer_res;
 	u32			__unused;
 
-	struct arch_vdso_data	arch_data;
+	struct arch_vdso_time_data arch_data;
 };
 
 /**

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
