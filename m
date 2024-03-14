Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF34C54E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PIaTcOkJmWkt2RV4RM2QOj/Hg8lx7i8dN3loQmrSg0=; b=mKh3UGeme/kpEs
	BsEsBN/cBEdnn+1Sxpcz7m14eFrWByPDJFC/zDBl3XOh8Akwy/4nkRiDHiRA0NhM5R/JBQY1BSISe
	kb9J23BTuYai5cLeRBl9os+QN19oi0MtUAzQhrSHNjHypHIFKnLu2gZoq15VyE6/cIQkQxc89z3OW
	pOXon7+5eAHBrJBmizsIOcgOpOfhhKVU1tLRFDCK7lUrsjFvC9RWS8SaoBPPXB6LOZiegh1nAZfAM
	3xkVXWRAO1BAJN66U4phRXL+UHrBcas70W0+rka7CaF05XbmchzHLhKLTW0+6GU1ZNeT56sSBLq4I
	2xBH5yaZ5ZIE85LoVfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuUY-0000000G0ls-0lX7;
	Thu, 14 Mar 2024 23:28:06 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTI-0000000Fzsw-0mQR
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ddc9430263so16859455ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458804; x=1711063604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xxEEnp8KYxWW22Dja8/hqreyUmSSC0e9nt+hWHrby04=;
        b=JKW+Q0ubYJDRql1fynfXhZQTZClAOy4INC8uTrPpIp+z9qkkd2IHQfZ9kZwChWNNZv
         WnzGJkPMyqqctuTDwqg1iseYqb4o3gYjg0AVMPYJIM4ObWdU5t/uGSsF8XE+vrSkS9Dw
         1XRNMr+Isvze+WEtY5p9COTXzCdGX91AaMtmoOD5TAFftIBiqEl5+1aa77Gbex6Xvo8i
         2RPRpbkZHJuMAsUR2HE0zcfLyg0ADItubr4t5DLtCRUTjZLcOEKJWtQWgtm9nCOKx6AV
         PCCIewMpPhz3+ocz1qrDI/aNWhv1kHogLie6adH35aYssp8Sjn+EXsY21eYkBlya/O43
         H0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458804; x=1711063604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxEEnp8KYxWW22Dja8/hqreyUmSSC0e9nt+hWHrby04=;
        b=sZtnrM+knssaojF01HLIIeEboqJNtoZJtulwyRIKzOq5ol2SVGEbBn8B7jllEmNw+x
         tkS673jllKtoNKLsVc3xjQZ8gO+eZRbhONR2OGDGFR3aOgZUEtRlyhpuXOWZwxX8kRxM
         V5hC6WfZlT9rx8LN/haIgFfBr1WiX26cW1ctvaxFRtQq/77KMdLw/8AAnQBPO1UFssBJ
         ZgArywCoUXWoha0NNm0Z6bGpEEGyzo0pkpVRc1RshVyfjfWavpRvFyoXTZA6kCss0Bpz
         6c5lDI6cjeWSWfV8K9CCkitE9ckH2QwSxZ+Tr3EbT6dgKYby7L9x/RZFSzWsMlBvpzYM
         POnA==
X-Forwarded-Encrypted: i=1; AJvYcCVlY/zxRiNr30v6m6b/+H/3b2Jqm0qHETBhQkZHtdm6DG2uprHRzu4Ef+M9TqMmeWv2bLkptkxPJrqrTC2n9TfiZIOY1sMZR2ViAXtIsIwc
X-Gm-Message-State: AOJu0YwYkeUwKbROXxFAeJlf5gsHuOpwN5I+GeluC7ndXBdhzUucS26T
	rcg0ZPzoBEyzzj/MHwSA1bgDAEWzBZw5aK6mNbGxPhR/1XXC/kJiaoERTUhLHmeITp3ROuTJA1V
	cug==
X-Google-Smtp-Source: AGHT+IH3tWVDzScYAxWAoO+AJJrzIFuBnfUykicaYWmU+HGG/cysXNug5oRiY871AjgR+7oBptYedZH/VEU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c2:b0:1dd:7d71:5900 with SMTP id
 u2-20020a17090341c200b001dd7d715900mr9743ple.1.1710458803732; Thu, 14 Mar
 2024 16:26:43 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:21 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-3-seanjc@google.com>
Subject: [PATCH 02/18] KVM: sefltests: Add kvm_util_types.h to hold common
 types, e.g. vm_vaddr_t
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162648_383218_BD5BC177 
X-CRM114-Status: GOOD (  15.15  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move the base types unique to KVM selftests out of kvm_util.h and into a
new header, kvm_util_types.h.  This will allow kvm_util_arch.h, i.e. core
arch headers, to reference common types, e.g. vm_vaddr_t and vm_paddr_t.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 16 +--------------
 .../selftests/kvm/include/kvm_util_types.h    | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/kvm_util_types.h

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 95baee5142a7..acdcddf78e3f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -21,28 +21,14 @@
 #include <sys/ioctl.h>
 
 #include "kvm_util_arch.h"
+#include "kvm_util_types.h"
 #include "sparsebit.h"
 
-/*
- * Provide a version of static_assert() that is guaranteed to have an optional
- * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
- * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
- * i.e. effectively makes the message mandatory.  Many KVM selftests #define
- * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
- * a result, static_assert() behavior is non-deterministic and may or may not
- * require a message depending on #include order.
- */
-#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
-#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
-
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
 
 #define NSEC_PER_SEC 1000000000L
 
-typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
-typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
-
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
new file mode 100644
index 000000000000..764491366eb9
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UTIL_TYPES_H
+#define SELFTEST_KVM_UTIL_TYPES_H
+
+/*
+ * Provide a version of static_assert() that is guaranteed to have an optional
+ * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
+ * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
+ * i.e. effectively makes the message mandatory.  Many KVM selftests #define
+ * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
+ * a result, static_assert() behavior is non-deterministic and may or may not
+ * require a message depending on #include order.
+ */
+#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
+#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
+
+typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
+typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
+
+#endif /* SELFTEST_KVM_UTIL_TYPES_H */
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
