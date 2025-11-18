Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C24DCEBF9A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkT2o4/uzvEyATzNHyCxU4eoas3OT0/zEInYHCDccwA=; b=RkK9F8b3RjzLSd
	w2R+NkqVCbFIRjvDcnApHtnKAyU8HfUL1Ae2g3WjfT4NBoX1KfO+qH4Gdye62mm8XhLpZEKdaYaO6
	vGXXxuE5UYODC0raF9alTJsHYDqAhvr+LJkLuUYbkf5oEuGuzh6OvzowK1+HHETRcCOi4af8XbEs6
	AfKqg4YbVyYNwI1WNBgtTln3NYOGDifbdwooYEnjehKbAZr5nwiDq8K8cZhD3LiJgtfTuWw5CFoo8
	/t0/xE7zRrK5hlvPxg4VPcWRwPtmnF0Pd/Q/CgKfAsNUMzA7+w1SnwReM7NBTWj+uEnJoRRwyr8V6
	eHM2Ll6KE6fqsgCKPHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBnk-0000000HFLG-1uHD;
	Tue, 18 Nov 2025 02:50:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBni-0000000HFKC-36sK
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2984dfae043so47031965ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434238; x=1764039038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mB4Iq17FvevHnZ0k1NNH63rZ3RaXsfuETlRoaxsZjEA=;
        b=KpA3ArWwxm0G/hfUZcnT32fxb9JngcjK3CTN00e+0y/PO2IPkCSCOklYra9YKpaP9V
         FLG7YNYNXyGKHoiFhhbvQEeeQI0Vnw7HFy6kMdlKMr0wOG0/iY1SRIBXuJrIVn6IV3PC
         XMP+2DYAtJfp+SFM98cAmljFooMyISZCWPf0LBpGvtwvVBvsP+4BM0RYPM96Q2We2xnH
         yDsQ2Rczupm/D8hnYnJvJ+wE85TpisYtz2o0nW6lLjxlGwTWcuZFMF/zcy9Bi01Qj9Ym
         Gsc31N1kTFQVz63OgZiKtrM16Af+tTJm6mmciy6ZhuujKvDa3HAheezGq14xZNbvd6GN
         p9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434238; x=1764039038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mB4Iq17FvevHnZ0k1NNH63rZ3RaXsfuETlRoaxsZjEA=;
        b=CFxkO3NJq6T9ZsETPKlGQYQQjyBGdKD+1JZclXfQUO6/Q9fENb/fnqzgz00xw4fm5e
         Sb9bvdQWQ6EKCTzWua+OSV6dtcWMIvYrxN8Ms50Zwj+zDqp1ztm9KNUb6Tyj4A2Gr4se
         BXzvUDUz3zVza3Lztas8ydp3zrHHEtI7H3gl8f2MbPNGV6BOfb/7jpQPnmUETbUgnWH3
         Vh7VRkSZYgp8WH+6g6ZI6GeHAm1g+ZoCQOBba/kigEuPKzsyfZjcFAuX2Rs0STasqYbV
         GYZSQCMnfHIEpdGGhkY7gp8EXXq44gQsDyR+pWotrL7AkOEdOSI929z+AGSJuf4q0FJK
         22PQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4fau2ClnIa8I882o5TXzLDl7Kr64vKpQVzv1kSFV0HYVM5ycSjHT8MVQ5aVuXu/BFtHaWV8C9JRfL1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsffiwArbq7w68s/tGpeRzaHZg5tIY73DDVUDR9+RAn1turNoV
	NpBZxsHcqbbuZAP1JInipjnxA5R4mPSdTgmIEgknQAWyprUnEkQwHQhqaU2FKNYzSgc=
X-Gm-Gg: ASbGncsFeSU+JJ3zjJ2GMrNamvdd+y/lMINfI7R7mpcuiL5phkBGnhIfYKdaceeGish
	9jSkRsTEZ++xscM0D2XN20MRgQF6RarjX8dKbxz+iQeNLz8Mj0o1FbKD+bA6djiykwFCruU8vbI
	E1QHkXdpu30XwAHmfBFw8EDZ18QRSsjecMWfAePAhQlQux2J7pusPsQYbxIWmF0dh//6fh+gY1Y
	k7cu9SwWTdTpGRX7GizrGHgeF2wn+mnSNDopirN+wA2xd6q7JM5DWWZITZ5zP/ZldlCppZ/tO6o
	878I30B5mFhtKjMhmPGeG5IYKTksz3QjAQys6/2hQcmVJdXAirjDTI0BIH0BxTnG5CrBhY7Nrod
	Ot7dxTsE90eVCevhzUdOhzYVAYRlVpvvND6qy5FTEb4I48DyQSLuZllb0Q2+q+Pv+KZSc7mZH29
	HqToI6BqBk03mYKGbXKQKgFkCzrWsNXGrx1g==
X-Google-Smtp-Source: AGHT+IF+WTTzJ0e8iN5ZBovYWprH/Gl5USOid9w8nlFdl4bPIRSlAc1Ot7TFoDySNvT2vqnMrE0FZQ==
X-Received: by 2002:a17:902:db0f:b0:297:c4b0:8d58 with SMTP id d9443c01a7336-2986a750965mr152477325ad.46.1763434237797;
        Mon, 17 Nov 2025 18:50:37 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:37 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 1/8] drivers: firmware: riscv: add SSE NMI support
Date: Tue, 18 Nov 2025 10:50:08 +0800
Message-Id: <20251118025015.42491-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185038_801295_8667634D 
X-CRM114-Status: GOOD (  17.77  )
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

Add support for handling Non-Maskable Interrupts (NMIs) through the
RISC-V Supervisor Software Events (SSE) framework. Add basic NMI
functionality via SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED registration
and enabling.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 MAINTAINERS                            |  8 +++
 drivers/firmware/riscv/Kconfig         | 10 +++
 drivers/firmware/riscv/Makefile        |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 89 ++++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          | 26 ++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8bf5416953f45..c06658da8af96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22057,6 +22057,14 @@ S:	Maintained
 F:	drivers/firmware/riscv/riscv_sse.c
 F:	include/linux/riscv_sse.h
 
+RISC-V SSE NMI SUPPORT
+M:	Yunhui Cui <cuiyunhui@bytedance.com>
+R:	Xu Lu <luxu.kernel@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/riscv/riscv_sse_nmi.c
+F:	include/linux/riscv_sse_nmi.h
+
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Guo Ren <guoren@kernel.org>
diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
index ed5b663ac5f91..6c77c7823571a 100644
--- a/drivers/firmware/riscv/Kconfig
+++ b/drivers/firmware/riscv/Kconfig
@@ -12,4 +12,14 @@ config RISCV_SBI_SSE
 	  this option provides support to register callbacks on specific SSE
 	  events.
 
+config RISCV_SSE_NMI
+	bool "Enable SBI Supervisor Software Events NMI support"
+	depends on RISCV_SBI_SSE && SMP
+	default y
+	help
+	  This option enables support for delivering Non-Maskable Interrupt
+	  (NMI) notifications through the Supervisor Software Events (SSE)
+	  framework. When enabled, the system can deliver local, unknown and
+	  other types of NMIs.
+
 endmenu
diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
index c8795d4bbb2ea..fbc182b53ae53 100644
--- a/drivers/firmware/riscv/Makefile
+++ b/drivers/firmware/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_RISCV_SBI_SSE)		+= riscv_sbi_sse.o
+obj-$(CONFIG_RISCV_SSE_NMI)		+= riscv_sse_nmi.o
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
new file mode 100644
index 0000000000000..1763f43961ab6
--- /dev/null
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#define pr_fmt(fmt) "SSE NMI: " fmt
+
+#include <linux/atomic.h>
+#include <linux/riscv_sbi_sse.h>
+#include <linux/riscv_sse_nmi.h>
+
+#include <asm/irq_regs.h>
+#include <asm/sbi.h>
+#include <asm/smp.h>
+
+bool nmi_available;
+static struct sse_event *local_nmi_evt;
+static atomic_t local_nmi_arg = ATOMIC_INIT(LOCAL_NMI_NONE);
+
+bool nmi_support(void)
+{
+	return READ_ONCE(nmi_available);
+}
+
+static inline struct sbiret sbi_sse_ecall(int fid, unsigned long arg0,
+					  unsigned long arg1)
+{
+	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
+}
+
+void send_nmi_single(unsigned int cpu, enum local_nmi_type type)
+{
+	unsigned int hart_id = cpuid_to_hartid_map(cpu);
+	u32 evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED;
+	struct sbiret ret;
+
+	atomic_or(type, &local_nmi_arg);
+	ret = sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
+	if (ret.error)
+		pr_err("Failed to signal event %x to hartid %d, error %ld\n",
+		       evt, hart_id, ret.error);
+}
+
+void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, mask)
+		send_nmi_single(cpu, type);
+}
+
+static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	return 0;
+}
+
+static int __init local_nmi_init(void)
+{
+	int ret;
+
+	local_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED, 0,
+					   local_nmi_handler, &local_nmi_arg);
+	if (IS_ERR(local_nmi_evt))
+		return PTR_ERR(local_nmi_evt);
+
+	ret = sse_event_enable(local_nmi_evt);
+	if (ret) {
+		sse_event_unregister(local_nmi_evt);
+		return ret;
+	}
+
+	pr_info("Using SSE for Local NMI event delivery\n");
+
+	return 0;
+}
+
+static int __init sse_nmi_init(void)
+{
+	int ret;
+
+	ret = local_nmi_init();
+	if (ret) {
+		pr_err("Local_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
+	WRITE_ONCE(nmi_available, true);
+
+	return 0;
+}
+
+late_initcall(sse_nmi_init);
diff --git a/include/linux/riscv_sse_nmi.h b/include/linux/riscv_sse_nmi.h
new file mode 100644
index 0000000000000..16db85c5162f5
--- /dev/null
+++ b/include/linux/riscv_sse_nmi.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __LINUX_RISCV_SSE_NMI_H
+#define __LINUX_RISCV_SSE_NMI_H
+
+#include <linux/cpumask.h>
+
+enum local_nmi_type {
+	LOCAL_NMI_NONE		= 0U,
+	LOCAL_NMI_STOP		= BIT(0),
+	LOCAL_NMI_CRASH		= BIT(1),
+	LOCAL_NMI_BACKTRACE	= BIT(2),
+	LOCAL_NMI_KGDB		= BIT(3),
+};
+
+#ifdef CONFIG_RISCV_SSE_NMI
+bool nmi_support(void);
+void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type);
+void send_nmi_single(unsigned int cpu, enum local_nmi_type type);
+#else
+static inline bool nmi_support(void) { return false; }
+static inline void send_nmi_mask(cpumask_t *mask) { };
+static inline void send_nmi_single(unsigned int cpu) { };
+#endif
+
+#endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
