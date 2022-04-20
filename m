Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayEjH6eqVX2YeQwEEerRnMQ7N8bGICuZXnr0h/KIQRQ=; b=krnWEFXQapomBg
	GlmjSzA1kZqBWd2H+ypml8l0n7JoPjLAf3V9RY6HEHr85kR4opdCdn7pz/EbzxyP2Jfy3guseCKEj
	LTxfK58WwLkbZnUl+K0xFfRnh3CG6WaO/WfQT4kTE3z3gyGAwdurlrgPgkWmdzYiYxoWSiL92nIO8
	y7jPnpSo+lsAXno14evtaxX88hPiNAaUP9j7crO/TUwMdMikqND5raifzKMlNCaXxnUzJw7sv0dKA
	4PPvKh5TcKpK+nU9uDjZBrtyxvBjIT2vgK/2/VOxqpd0AENNSW+NIYKm9rqtAfHjhqwmrgiujKaSA
	OrGsGRi5Qrwo8SfYzxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFNG-00A6Ek-LO; Wed, 20 Apr 2022 18:48:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFNA-00A69c-4q
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:48:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id s137so2438272pgs.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=UGpQa9Z2U55MjYUDsvGvuFzYMVtZARYuOzPYtbUizPg=;
 b=6rfdm/phCRlmO8Ct/g6arSMLvjyQ+UArCdCgU2d60t/F49+e8zW9hVbe0Hw+/6auz8
 0smG66pG/9D7UcRw9gX9si6y6NvYkgsIezoJskMu1TuSK+aiSONGS9esu5svctCYwycs
 zy/DbrDagPCD6MWiRgjfG/1SHvaO15wkNDoUpyA8uxDBpOIZNjhiiQIbshZmfbNLbAZ6
 K0wOBieQ++3HSV2zjACVh9DwCHCYxumykHQ+9uX1l+MYsJ/d3koVe32FE4ThTDttjd4t
 +cG0lApXd9/8MkrFy5CCYjjb/EMIcrfBtlvGGtw4/ZxtWBEMpGYveainQmNzAiPJLESC
 ZT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=UGpQa9Z2U55MjYUDsvGvuFzYMVtZARYuOzPYtbUizPg=;
 b=fTuGu39UyA/KkgnOfvP1Xynv4lLDQ5l0oZvaqvhS+iu3cuMtndq8ynxZJyDdxts1P2
 IxvDDlCiZBeLjJSf9Hk/GTV6K+3myZvzl67pdgMzRtCdPMpiTughFicRkb5S9JXL0LsJ
 YC10cNPl3ivfhQGSZgCwNfuhB7y27UL6eF+2hMrbQAxrGpHkUAztFHWr2uaV+QdqFPo6
 CnyrWT/7iFoaBocZCpA+03Rc2J+4cDDKWrQjqcR4yZ1n6briWfwYwP8Ee8jgcfXeflEt
 1xM8G5OcgeBjKoBWDerhHcKe+ax8fTOJejrhOI5Vtw7CmIxUuZ0A/b7y397XjApR9Jcg
 e3qQ==
X-Gm-Message-State: AOAM532BkE1zxJ84Y/wQGO7ADN8NwQcq5YBNBd0FhCABo9myaWXHsK0S
 9GDSsE+euDhZBHh5TGiEq3kDfg==
X-Google-Smtp-Source: ABdhPJyQtvhwqEgVVnVRRdlklc0eCKG6jyhiAA/OuM6Vae1V/BWG9miXV/9kwjPjjDrjfrYbblnoIw==
X-Received: by 2002:a63:e452:0:b0:3a9:fd43:fd10 with SMTP id
 i18-20020a63e452000000b003a9fd43fd10mr14420896pgk.541.1650480494575; 
 Wed, 20 Apr 2022 11:48:14 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 n20-20020a634d54000000b0039d18bf7864sm20229604pgl.20.2022.04.20.11.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:48:14 -0700 (PDT)
Subject: [PATCH v2 3/4] RISC-V: Split out the XIP fixups into their own file
Date: Wed, 20 Apr 2022 11:40:55 -0700
Message-Id: <20220420184056.7886-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420184056.7886-1-palmer@rivosinc.com>
References: <20220420184056.7886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
 guoren@kernel.org, 
 Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
 jszhang@kernel.org, vitaly.wool@konsulko.com, 
 gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 panqinglin2020@iscas.ac.cn, 
 rppt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114816_228876_F1C3103D 
X-CRM114-Status: GOOD (  14.56  )
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

This was broken by the original refactoring (as the XIP definitions
depend on <asm/pgtable.h>) and then more broken by the merge (as I
accidentally took the old version).  This fixes both breakages, while
also pulling this out of <asm/asm.h> to avoid polluting most assembly
files with the XIP fixups.

Fixes: bee7fbc38579 ("RISC-V CPU Idle Support")
Fixes: 63b13e64a829 ("RISC-V: Add arch functions for non-retentive suspend entry/exit")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/asm.h       | 26 ------------------------
 arch/riscv/include/asm/xip_fixup.h | 32 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/head.S           |  1 +
 arch/riscv/kernel/suspend_entry.S  |  1 +
 4 files changed, 34 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/include/asm/xip_fixup.h

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8c2549b16ac0..618d7c5af1a2 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -67,30 +67,4 @@
 #error "Unexpected __SIZEOF_SHORT__"
 #endif
 
-#ifdef __ASSEMBLY__
-
-/* Common assembly source macros */
-
-#ifdef CONFIG_XIP_KERNEL
-.macro XIP_FIXUP_OFFSET reg
-	REG_L t0, _xip_fixup
-	add \reg, \reg, t0
-.endm
-.macro XIP_FIXUP_FLASH_OFFSET reg
-	la t1, __data_loc
-	REG_L t1, _xip_phys_offset
-	sub \reg, \reg, t1
-	add \reg, \reg, t0
-.endm
-_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
-_xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
-#else
-.macro XIP_FIXUP_OFFSET reg
-.endm
-.macro XIP_FIXUP_FLASH_OFFSET reg
-.endm
-#endif /* CONFIG_XIP_KERNEL */
-
-#endif /* __ASSEMBLY__ */
-
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
new file mode 100644
index 000000000000..0d0754305324
--- /dev/null
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * XIP fixup macros, only useful in assembly.
+ */
+#ifndef _ASM_RISCV_XIP_FIXUP_H
+#define _ASM_RISCV_XIP_FIXUP_H
+
+#include <linux/pgtable.h>
+
+#ifdef CONFIG_XIP_KERNEL
+.macro XIP_FIXUP_OFFSET reg
+        REG_L t0, _xip_fixup
+        add \reg, \reg, t0
+.endm
+.macro XIP_FIXUP_FLASH_OFFSET reg
+        la t1, __data_loc
+        li t0, XIP_OFFSET_MASK
+        and t1, t1, t0
+        li t1, XIP_OFFSET
+        sub t0, t0, t1
+        sub \reg, \reg, t0
+.endm
+
+_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
+#else
+.macro XIP_FIXUP_OFFSET reg
+.endm
+.macro XIP_FIXUP_FLASH_OFFSET reg
+.endm
+#endif /* CONFIG_XIP_KERNEL */
+
+#endif
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 893b8bb69391..822c33aa7f45 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -14,6 +14,7 @@
 #include <asm/hwcap.h>
 #include <asm/image.h>
+#include <asm/xip_fixup.h>
 #include "efi-header.S"
 
 __HEAD
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 4b07b809a2b8..aafcca58c19d 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -8,6 +8,7 @@
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/csr.h>
+#include <asm/xip_fixup.h>
 
 	.text
 	.altmacro
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
