Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B15C636D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMNbdovJjSHHnyH54AXnBqiLdJlWq43/i5z+lMvcCIM=; b=R3d65Vfg3ZkCx4
	EAAY+tWxti2KCRPKqW2al/vvWYcckag2STv3IwgdhhNlsNUDvHKD7NXI4SX509wiqLAhsR2TxtSXu
	XcDaKeET/HiB1wtSvnJiX8gtp+fE3OFocQv+RaDoUqZ/mASqoVR3ycnf0R+M/cV+cFntXSl4zCUgQ
	hHPerv+ir1iGywlQuboBKjcHSAsyY3HrCHG+DcmpcB+2qQfnMgJA63k2mpnoVu8j4sfnB1EhQyA9O
	seuMOONWQ/9FRc55DWC0g26TY63va28rVO74V7nOytaohiC46e2LkTU2FnfneYS8gFD8+lXDdROR3
	uxgMbmAfwKSNTjBjUDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7to-009oc6-Oa; Mon, 06 Feb 2023 20:15:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tj-009oZ2-2x
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:15:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso5016353pjt.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 12:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCdyPS+smT6LwtNTbkWdnYXrnr2lxZXi1KrwW5rv0l8=;
        b=0GLh6Tswh2lwBK4eGnHkxqiQk3/zCN33r0fpvbYVbwNsBkNBBokego85RwcWGnn4Xh
         qka1T0L4j34pN0ybqoxtKmCEaH9G2tnRhdKzSXuOZGuB1r9vg1+LJWENzePU5bBRzAnp
         nOs75uIRZxj+XkoGKHbGjfmRxgYVvTOWZhuSV+rXzn0tqVC2sK7jEnQksiHaDLJuwmtr
         Ht3st2UrTUf76v5NU7NUJFln2WcZ1iYaM8xMyeOtfiDtm1Mv4iWTwClcnUP5Pq+7F8a2
         yZqpv5Wtp4pxAo942ELL0OyCEwv7RiLeO5INkrNY+2ZyVXemijkNbdQlQXWVZ9fXZpd2
         Tzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCdyPS+smT6LwtNTbkWdnYXrnr2lxZXi1KrwW5rv0l8=;
        b=q0OA8f9Ry/bHmmDCO2OiUN3lj1LnG/Cljizv+p+jlNbFOI1+Ne47M1l9FF6+O1UjRs
         lPpxuaORpuZNKiYBkwbxBRhoaccPxD6xfkej9JlJ7SBpNAPk8Rx5JkHQ6PufTDdM+edS
         ZLnofYIrVcgPcA17zJexaNbAJWCTpAT766+wLIAmI1Af1rIFwYZuKLohVRMusYVX+Br4
         k1ZMRcz8ZaiYmd9TjZjk0NG5gb+Ae528CfQO2PAKY8Dzb4lZFHXzqBJHSrPYs46h2wQa
         a2Jb5Tt4JgkytlhXDTy4p6qXNR3gxeeNjpKxUe+hoGUTKBIJlgpndRD1Y/ZME6QiJ5vT
         lehg==
X-Gm-Message-State: AO0yUKVWgsh1Gr6X5vrvbhsDiy/rtMZVvRVIHEyLMdvx9rC1NqRvEKrH
	ZyZlqFDZXrhlcQ/pf53rjerfSg==
X-Google-Smtp-Source: AK7set89OKaSr4/YDhhBWoGa5WugP9xjhQ2WRaIN6BchRUc3KvHdtr86clXbC4S8Q6fXuCF04qrlmA==
X-Received: by 2002:a05:6a20:54a0:b0:bd:b061:9527 with SMTP id i32-20020a056a2054a000b000bdb0619527mr624694pzk.4.1675714530623;
        Mon, 06 Feb 2023 12:15:30 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:30 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>,
	vineetg@rivosinc.com,
	heiko@sntech.de,
	slewis@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	dram <dramforever@live.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Mon,  6 Feb 2023 12:14:52 -0800
Message-Id: <20230206201455.1790329-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_121531_153507_C5CCFD08 
X-CRM114-Status: GOOD (  17.85  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

We have an implicit set of base behaviors that userspace depends on,
which are mostly defined in various ISA specifications.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
---

(no changes since v1)

 Documentation/riscv/hwprobe.rst       | 16 ++++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  6 +++++-
 arch/riscv/kernel/sys_riscv.c         | 23 +++++++++++++++++++++++
 4 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 97771090e972..ce186967861f 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -35,3 +35,19 @@ The following keys are defined:
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
index 591802047460..ce39d6e74103 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -20,6 +20,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MVENDORID	0
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
+#define		RISCV_HWPROBE_IMA_C		(1 << 1)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
-
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 868a12384f5a..74e0d72c877d 100644
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
@@ -182,6 +183,28 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 			ret = hwprobe_mid(pairs, key, &cpus);
 			break;
 
+		/*
+		 * The kernel already assumes that the base single-letter ISA
+		 * extensions are supported on all harts, and only supports the
+		 * IMA base, so just cheat a bit here and tell that to
+		 * userspace.
+		 */
+		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+			ret = set_hwprobe(pairs, RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
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
+				ret = set_hwprobe(pairs, val);
+			}
+			break;
+
 		/*
 		 * For forward compatibility, unknown keys don't fail the whole
 		 * call, but get their element key set to -1 and value set to 0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
