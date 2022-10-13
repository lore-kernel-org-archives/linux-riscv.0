Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7797DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv2odIOhtQ/kgVmgR+aqHXnU5A7za7typg2yqGpOK9Q=; b=CyLIQu3kEhMqhW
	VhjzV3S+BH9jknaxWHeY68RWfiB6UGyTXiArsWKES3j+/jU7EyL3298oU0MyGIacMHBjkv8SJ+WCb
	iQSnhUSzAi+EbXntedxPWtt/E8CL9YnYRFNaF+VItQGWpUy+cuvJEL9To519spvB4pbFxxNvumu43
	jAPcPFPWgAcwC/IOmUvOrLHIiSlAMRcoSsP/lfYGjnqRt1Cg4c3pmkmv+ocg0VKPFNj0gUBWdIj8p
	XW60NmLC8bgatnMUEIkHG0P4LcR3Jey0z8/tZK/hofFcnlOJXkQEa8b0wtxYMQdloPw8DmbT6MVsW
	o6PkmDevkJpaBZa9g0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Be-00CRFr-05; Thu, 13 Oct 2022 16:35:58 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1BZ-00CRD7-NR
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id fw14so2471576pjb.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4KAsaE2xIiMueT2j1FkMJBV+ZTYkgRIqNYtKyEHERg=;
        b=pTExrFmc0cUzggKD7pECa1ATL/NoysSgkT1D/zOe1dlLxwOPc5tVXNgLCBk8LfLLK5
         c6Gv5Rz1oyjfuTY18CFOh/dl4yQ5ipVbWkeRY0jMdabcXSqOmE1IHkynelrt4RJZfhuO
         X95dQPCwFzdGprifKw2L3uJ3Nv+yDV635Zx/ONIaNMLXKF2YYLlWNePk6p6gMdfTIz83
         CtofnovKMfGrKOC01qr7wPYs4HPRjZX4DjJX12R3UxN7DDY/L277emfVf/h9PP2cqqCx
         iEix+GVtQa1QDNBnSMmKUacGNoiwdS2p0962ByjApg8Zy4yIzPCrXS40dKiFts10/TAx
         j3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4KAsaE2xIiMueT2j1FkMJBV+ZTYkgRIqNYtKyEHERg=;
        b=WFwxZeGhj8fLGg5tm7uoVOLORD6eXcbgfJBb7dsXIJ/zDmxncbPTQxwrmmdRzyTt3L
         zZ2g5Bozldzbar+IBzriRUNWA2/o/j4ovd209EP2tz7HFCaq82H8CH/zjRezuD7n4rKQ
         HIn+D7lIO23kTLaZeBs7qv27glGBFtvTlnP8cT6zgDgo8Wvz72TfNTpPlexAkspHvTbo
         L/XfzrUoqZnPq5ox1SySixOunpqXMhsgpFBVmEcWnVNHLlSjFXHP4Nix4exR3xVRFK2M
         f7qhi7N06SFYQt/AFLHylk4LAscK45TmSS33HcoNpgNkmE3CJMHvLlS7FcCuDHlL9XKv
         gu0A==
X-Gm-Message-State: ACrzQf3filu5KzF0bDeCUjVuHavF+OM5Bs5f07olKnBqOnAlMfZnGlzH
	sQvYcg42M3bIy81k0gETdh/rrb9u18kUQg==
X-Google-Smtp-Source: AMsMyM7SF3zsiQkviWpHPzZ4jb4HyPQkijHRXa28on7D5JbzMEv8WPHFiETPczLbnn+WKh7Ihb2KFA==
X-Received: by 2002:a17:903:2311:b0:183:a88a:7d1 with SMTP id d17-20020a170903231100b00183a88a07d1mr545529plh.10.1665678950823;
        Thu, 13 Oct 2022 09:35:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s18-20020a656452000000b00464aa9ea6fasm4880814pgv.20.2022.10.13.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:50 -0700 (PDT)
Subject: [PATCH v1 2/5] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Thu, 13 Oct 2022 09:35:48 -0700
Message-Id: <20221013163551.6775-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093553_783857_80AC3BE0 
X-CRM114-Status: GOOD (  20.05  )
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

We have an implicit set of base behaviors that userspace depends on,
which are mostly defined in various ISA specifications.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 16 +++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  7 +++++
 arch/riscv/kernel/sys_riscv.c         | 38 +++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index be9ebe4af3dc..b182fcf4cd30 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -31,3 +31,19 @@ The following keys are defined:
   specifications.
 * :RISCV_HWPROBE_KEY_MIMPLID:: Contains the value of :mimplid:, as per the ISA
   specifications.
+* :RISCV_HWPROBE_KEY_BASE_BEHAVIOR:: A bitmask containing the base user-visible
+  behavior that this kernel supports.  The following base user ABIs are defined:
+    * :RISCV_HWPROBE_BASE_BEHAVIOR_IMA:: Support for rv32ima or rv64ima, as
+      defined by version 2.2 of the user ISA and version 1.10 of the privileged
+      ISA, with the following known exceptions (more exceptions may be added,
+      but only if it can be demonstrated that the user ABI is not broken):
+        * The :fence.i: instruction cannot be directly executed by userspace
+          programs (it may still be executed in userspace via a
+          kernel-controlled mechanism such as the vDSO).
+* :RISCV_HWPROBE_KEY_IMA_EXT_0:: A bitmask containing the extensions that are
+  compatible with the :RISCV_HWPROBE_BASE_BEHAVIOR_IMA: base system behavior.
+    * :RISCV_HWPROBE_IMA_FD:: The F and D extensions are supported, as defined
+      by commit cd20cee ("FMIN/FMAX now implement minimumNumber/maximumNumber,
+      not minNum/maxNum") of the RISC-V ISA manual.
+    * :RISCV_HWPROBE_IMA_C:: The C extension is supported, as defined by
+      version 2.2 of the RISC-V ISA manual.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 08d1c3bdd78a..7e52f1e1fe10 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 2
+#define RISCV_HWPROBE_MAX_KEY 4
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 88ef9e153637..07309376c6dc 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -19,6 +19,13 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MVENDORID	0
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
+#define		RISCV_HWPROBE_IMA_C		(1 << 1)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
+
+
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 2b6cb82c3491..337e3f2a17c8 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -9,6 +9,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
@@ -76,6 +77,11 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 	return 0;
 }
 
+/*
+ * The hwprobe interface, for allowing userspace to probe to see which features
+ * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
+ * details.
+ */
 static long set_hwprobe(struct riscv_hwprobe __user *pair, u64 key, u64 val)
 {
 	long ret;
@@ -158,6 +164,15 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 	if (!ret)
 		return -EFAULT;
 
+
+	/*
+	 * Userspace must provide at least one online CPU, without that there's
+	 * no way to define what is supported.
+	 */
+	cpumask_and(&cpus, &cpus, cpu_online_mask);
+	if (cpumask_empty(&cpus))
+		return -EINVAL;
+
 	out = 0;
 	k = key_offset;
 	while (out < pair_count && k < RISCV_HWPROBE_MAX_KEY) {
@@ -169,6 +184,29 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 		case RISCV_HWPROBE_KEY_MIMPID:
 			ret = hwprobe_mid(pairs + out, k, &cpus);
 			break;
+
+		/*
+		 * The kernel already assumes that the base single-letter ISA
+		 * extensions are supported on all harts, and only supports the
+		 * IMA base, so just cheat a bit here and tell that to
+		 * userspace.
+		 */
+		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+			ret = set_hwprobe(pairs + out, k,
+					  RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+			break;
+
+		case RISCV_HWPROBE_KEY_IMA_EXT_0:
+			{
+				u64 val = 0;
+
+				if (has_fpu())
+					val |= RISCV_HWPROBE_IMA_FD;
+				if (elf_hwcap & RISCV_ISA_EXT_c)
+					val |= RISCV_HWPROBE_IMA_C;
+				ret = set_hwprobe(pairs + out, k, val);
+			}
+			break;
 		}
 
 		if (ret < 0)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
