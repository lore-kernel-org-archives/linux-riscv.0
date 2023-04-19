Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB43C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkyAp2wiApqpxYSOKdt8if6AOqVtzsutZ0s0c/xiLHc=; b=s6+o2hF3HzjmLg
	85sLakNohO+/C40g4bQU8auxGicyh6MZXFfV/hgCiS/uWzDl58Ru9ESnhVbzhHS0PzhbQl55wjJUq
	Hv5bdOh06wbK2w9KBOzP7zEVxFCdIa+iC9bARoj8NsYzEs23CwR+K+GdHb2EXI4WItdb/7i0ePChD
	X4V/ZbzWTG8J7JGvnukN0PMuXZMEu8kIlNucfF0iXMLhobQIX0GJiMT/iQiRJyBm8ohrJaikpSRYX
	UBDHK2Y2Zdz/xWZPjXQUaU4GZ1N+Y63JxMTocjdNsGuNg2OGSX/noNyAk3+ysCpSAEq2cUd4nPXzo
	mjgTMfancIbSL4RYzsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQb-006Wct-1V;
	Wed, 19 Apr 2023 22:37:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQY-006WXV-2G
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wI5JEqEayPS5t0DearmNB32dGieY2Rp85qRqyRU4954=; b=duerpfjtqTK/qclkuoznxgNhsj
	RsmKl6SLHGrUkRgV8Jf8/6sViV3AQwtnaRXfgJYG6KhYFZZiwAR42kpjXxA3Kk7qhjcClM311Eu14
	Uu2J8Cd+oIxdylra4R18vHm91yoCw86adqKM338na30JlHcfChxJRnCCGEWWjiJr6BXXaRimkW8di
	bOdeaVjSuHucLUxHaRInKEzqP1sDDMDl7wTs13nAtH4WArdwMBpPow720LvAJPN82DEFe891g1a4c
	n4vGqWNX8NMnUBoTRPwbJoCFNyaiOJEKR+oGCIFT+PWSz8hENhvTW46tFJo3b0n5VnYfhSLoLJ4CJ
	hLCQ71DQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8c-00DeGl-IK
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63d4595d60fso2916523b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942734; x=1684534734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wI5JEqEayPS5t0DearmNB32dGieY2Rp85qRqyRU4954=;
        b=c61/p77dAtF7ITFaJtJ2ThSiNokGE55QUnDMhiyOWQfpvPZA4LwEm0dNNepuTh8/vI
         ETC0NUKHH0B7ioWMNIOCRl7AjZHuiWQCd9YRt/w8gX3X03F0aRKluujbAxJMyKQ218iz
         HyGwjvHTZ57PibWhtCDK2NRKMiLlH7ybE/Z877P0tsYOxOH43juir+xqANUqGBHB7/WR
         aQibBdjDGfMJsGQ2duTavnD7648VTHs+6zw4IzdBl5zGyzuHnyd08ri5ZAx79ZyGdHPQ
         +HVr9NAcGBE4GY7Q3b9IwiUkw1Xx2A9JUqYVhhUubWWiX//8s8ew3EPoW97k6emKoi+z
         u1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942734; x=1684534734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wI5JEqEayPS5t0DearmNB32dGieY2Rp85qRqyRU4954=;
        b=kLV7O4Lxc+yQqG32CeInYLlnzXSARhXU03mPxr7OrKWbYSQvTUka1cru2C0R9Uj//8
         l3zKnDwAaU9EPpgkI+/lTddKhZhJyWHKBVRKmyfaaIJmbnSMBPuzLh64wf9tZ68n5wm3
         wRwuBxjq4hVrxRx7kTs8fS9TdQiaPnbB6z01zBB2QbwDLGkcaAx7in23VMOsJSBTiUK/
         ITtoK3TfrAP4lH/kohN+Xd2W53ioF0wg50cTaDQEUYHmxfWXSu25Di5TG/ad8Dkwy6zf
         Jemn5jA+FEHvpwyDUBE7Hx4WPlhmnMdUu5VOdtpxyKzhXAekCSok0XwahgPXQ8ciwU3t
         /VJQ==
X-Gm-Message-State: AAQBX9elILQ8Zp90jU+oPORBHkXjevlagqeQ7T8B2goT4RX1niA8ET1x
	FckmTQkEvNKN3ag1X4WQe5ydNw==
X-Google-Smtp-Source: AKy350bHPqgey3c6g8HqkR9B9xlgHTWq+fR92XQNeVK1lT0G63M1RyCGum2kegw8LaA3eJtSnsnKXQ==
X-Received: by 2002:a17:90a:6002:b0:246:865d:419a with SMTP id y2-20020a17090a600200b00246865d419amr3928528pji.6.1681942733866;
        Wed, 19 Apr 2023 15:18:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 38/48] RISC-V: Add CoVE guest config and helper functions
Date: Wed, 19 Apr 2023 15:17:06 -0700
Message-Id: <20230419221716.3603068-39-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231854_640823_883ABCA7 
X-CRM114-Status: GOOD (  19.30  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Introduce a separate config for the guest running in CoVE so that
it can be enabled separately if required. However, the default config
will enable both CoVE host & guest configs in order to make single
image work as both host & guest. Introduce a helper function to
detect if a guest is TVM or not at run time. The TSM only enables
the CoVE guest SBI extension for TVMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Co-developed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kbuild             |  2 ++
 arch/riscv/Kconfig            |  6 ++++++
 arch/riscv/cove/Makefile      |  2 ++
 arch/riscv/cove/core.c        | 28 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/cove.h | 27 +++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  2 ++
 6 files changed, 67 insertions(+)
 create mode 100644 arch/riscv/cove/Makefile
 create mode 100644 arch/riscv/cove/core.c
 create mode 100644 arch/riscv/include/asm/cove.h

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index afa83e3..ecd661e 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_RISCV_COVE_GUEST) += cove/
+
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8462941..49c3006 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -512,6 +512,12 @@ config RISCV_COVE_HOST
 	    That means the platform should be capable of running TEE VM (TVM)
 	    using KVM and TEE Security Manager (TSM).
 
+config RISCV_COVE_GUEST
+	bool "Guest Support for Confidential VM Extension(CoVE)"
+	default n
+	help
+	  Enables support for running TVMs on platforms supporting CoVE.
+
 endmenu # "Confidential VM Extension(CoVE) Support"
 
 endmenu # "Platform type"
diff --git a/arch/riscv/cove/Makefile b/arch/riscv/cove/Makefile
new file mode 100644
index 0000000..03a0cac
--- /dev/null
+++ b/arch/riscv/cove/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o
diff --git a/arch/riscv/cove/core.c b/arch/riscv/cove/core.c
new file mode 100644
index 0000000..7218fe7
--- /dev/null
+++ b/arch/riscv/cove/core.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Confidential Computing Platform Capability checks
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/export.h>
+#include <linux/cc_platform.h>
+#include <asm/sbi.h>
+#include <asm/cove.h>
+
+static bool is_tvm;
+
+bool is_cove_guest(void)
+{
+	return is_tvm;
+}
+EXPORT_SYMBOL_GPL(is_cove_guest);
+
+void riscv_cove_sbi_init(void)
+{
+	if (sbi_probe_extension(SBI_EXT_COVG) > 0)
+		is_tvm = true;
+}
diff --git a/arch/riscv/include/asm/cove.h b/arch/riscv/include/asm/cove.h
new file mode 100644
index 0000000..c4d609d
--- /dev/null
+++ b/arch/riscv/include/asm/cove.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TVM helper functions
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_COVE_H__
+#define __RISCV_COVE_H__
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+void riscv_cove_sbi_init(void);
+bool is_cove_guest(void);
+#else /* CONFIG_RISCV_COVE_GUEST */
+static inline bool is_cove_guest(void)
+{
+	return false;
+}
+static inline void riscv_cove_sbi_init(void)
+{
+}
+#endif /* CONFIG_RISCV_COVE_GUEST */
+
+#endif /* __RISCV_COVE_H__ */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 7b2b065..20b0280 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -35,6 +35,7 @@
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
 #include <asm/efi.h>
+#include <asm/cove.h>
 
 #include "head.h"
 
@@ -272,6 +273,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_ioremap_setup();
 	sbi_init();
+	riscv_cove_sbi_init();
 	jump_label_init();
 	parse_early_param();
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
