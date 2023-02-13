Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46C6C636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2VRMSTdBr/nC7X7gvcDRq8GEvchSr9vZm1sSpMQdOA=; b=XyjXpznpYBuYnQ
	wYsnqapJRm9E68gunorn1ej1YI/xZWKdlC9qjRwQUsd4v4H/Phq8CKHevy1y3T7+ige9FRR0eGqjy
	VCjdNxns1bFUG7DHPasxQa/Q31QBcDdpZXGSjGmhbRIO8zAK8Ivj3cRS4xVJj1imrDHdg7yYoXGdR
	fJtNErPz6FL6buP1Mt2nSzjhuDI/k5hAdAYrOwWSorAMpR2xey+RPeoPwOx/JGkf8CElXDcGlVDnx
	jkjwva4mVXgxx6+5JErL+2ndCD6ZPxZl7/9XdtpcU+BfOgJBbOLWFTRMSxWc9pX8a4TEr0MtyVnqm
	8SRgO1wdjWwXFy+WEihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr5-00D9Pd-Uz; Mon, 13 Feb 2023 04:54:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqx-00D9JW-W1
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:13 +0000
Received: by mail-pj1-x102f.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso15712664pjj.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtGFk1nMQnbVrTZQtdZEMWvYWxpeM1anGce2t/6Js4o=;
        b=XnLJLE7Snc5+Dado4616bI2S9bt5BoOzPfFJwGy4sODs4id84UZRmeTgvHINl309vQ
         14Su83K/zKRWWRUylX+LvkRt46rw/1NmQPiL7ZTYRBArkznoYvQmmpzl5Z1rM4XkHXqf
         rBcFShV4hBPXc5uzWruqviGPXly8kLMjn2buoQyVJ78MB0g/unbDmmax/ZZW+MA5RiWQ
         ogB0M9oUzUW0WJhaa+KIDOkbwCoO/Z1xc2lVmLfl1RBXdxIvi47/x8V3ynUmXwT9kABH
         Wq7UQVpnuXOK+7FT7G8jAwG2P+Mvs0HLCPCDYEFwFUpPExstyaOaxnJUASc2Rtwb889R
         YtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtGFk1nMQnbVrTZQtdZEMWvYWxpeM1anGce2t/6Js4o=;
        b=io3FCm6/dxZzwXNgF6Csp2jbb/YrYPqjDek348ARup6ylqcxxOjEfNxBB6poYmSGnK
         c2h+VtNXbbqFYhO+RsHP53wH/qUl6U/JIBwraHDPFPVAbe11lMvqmIrCgnJw7KSpInKB
         eXiaDYXDmt9E+9os5LFUoRWi6Y5fxDCpmOJVXXfZiIZh/FVmCszYv5DZyUEcgMesC/nY
         de7wJsZyRdGeRXfcHr55VZVJWiyeLUHtsgZS0UKvhOWthBiX9bhs8hk8CGBKU4/dSZ1k
         dspK6T9il8Pb1UAB2NT42W8+UGg0+nWZlaMB9EchVHMtMAMjix6TxAiSTLtgnVa269Xz
         fZkQ==
X-Gm-Message-State: AO0yUKWSHRx2+Teb8oeB0m7gcdQMfzfUNM3ihOG3lDCl7/6VK0W2kulN
	Gcm3YNdkkFpsjtQ0yonH0Yk6xw==
X-Google-Smtp-Source: AK7set8VQlMzUrEmfd8Da16vinMvIuF6MGR4zXdfBxivo1pKWlmTbhvBvyR/CFhAZRsTG7lVovToSw==
X-Received: by 2002:a17:902:e545:b0:199:60:b9c8 with SMTP id n5-20020a170902e54500b001990060b9c8mr29757414plf.45.1676264050773;
        Sun, 12 Feb 2023 20:54:10 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:10 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 06/20] riscv: Implementing "PROT_SHADOWSTACK" on riscv
Date: Sun, 12 Feb 2023 20:53:35 -0800
Message-Id: <20230213045351.3945824-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205412_077216_D71B494B 
X-CRM114-Status: GOOD (  16.53  )
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

This patchimplements new mmap protection flag "PROT_SHADOWSTACK" on riscv

Zisslpcfi extension on riscv uses R=0, W=1, X=0 as shadow stack PTE
encoding. This encoding is reserved if Zisslpcfi is not implemented or
backward cfi is not enabled for the respective mode.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 19 +++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 22 ++++++++++++++++++++++
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/mman.h

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..9c8499294a60
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <uapi/asm/mman.h>
+
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+	unsigned long pkey __always_unused)
+{
+	unsigned long ret = 0;
+
+	ret = (prot & PROT_SHADOWSTACK)?VM_WRITE:0;
+	return ret;
+}
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..74dbe122f2fa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -159,6 +159,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
 					 _PAGE_EXEC | _PAGE_WRITE)
+#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
 #define PAGE_COPY_EXEC		PAGE_EXEC
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5d3f2fbeb33c..c3cf6b94c710 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,6 +18,28 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
+	/*
+	 * If only PROT_WRITE is specified then extend that to PROT_READ
+	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
+	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
+	 * If user wants to create shadow stack then they should specify PROT_SHADOWSTACK
+	 * protection
+	 */
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		prot |= PROT_READ;
+
+	/*
+	 * PROT_SHADOWSTACK is new protection flag. If specified with other like PROT_WRITE or
+	 * PROT_READ PROT_SHADOWSTACK takes precedence. We can do either of following
+	 *   - ensure no other protection flags are specified along with it and return EINVAL
+	 *   OR
+	 *   - ensure we clear other protection flags.
+	 * Choosing to follow former, if any other bit is set in prot, we return EINVAL
+	 * Other architectures can treat different combinations for PROT_SHADOWSTACK
+	 */
+	if (unlikely((prot & PROT_SHADOWSTACK) && (prot & ~PROT_SHADOWSTACK)))
+		return -EINVAL;
+
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..ba8138c90450 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -294,7 +294,7 @@ static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAG
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
