Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF83CD128E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZgZlUd9WBQJUzysUqeKloTtt48AhkfomAy6SgI9l6Y=; b=TBHAll/S+Ec9eA
	UJIa11lpiE8Dx8fcjjzAk5VLoF3ZS+03jpsFPk6k7I5l+YvjPsJGy+h9MpcIgKT1dvS8UDqxoL/Me
	Do66ARZ7a/phdJ53z6ram0Zj+D+VU67yHdm3FwOE9jxXMvvaJMrSF/aL5+OrZecKQXKtPERpUv6pC
	S/CJQ+n8uAQE1KGWSpRLzpQiEMR1WYjE6+QJUQHSCB33xzD/EJX4aBaVjcf6x/KZLWQZSP4h5PWvX
	1s3zIO2InxC3t06y/HIjcQ+Wr4UfPC82ZC8yytYndL3Tz7Q34mRPPRSkvgRjOpUpOw3vXuNUf0tzf
	TB7bAi+m9M87dZPFgL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56v-0000000Gwfe-2wzb;
	Fri, 29 Mar 2024 05:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48G-0000000GnXz-1b31
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pODlhOn2Qlpzyvoy16i8OpTFZF278Z1sqN5yeQeAUQM=; b=V34O2rxJEzULTUsV2OjUhZNjrS
	wa3VY30CUYQVs7wURIfCcPaX5q1Dq8ueISpA1XT2gtBOnU9n7Sz4XhBS6ErIg9IkXzwITr0hYYg6P
	0XZ2OFhV9Ki0H+BMg4PauWuwbCoEBmwZi09TgJVd67MD91xkPEIkwes478XL0RVfN/4aAYVtIZgYI
	RabS2yVchy0eZ6k+1gn/54112KQf2ZIRlDihnNjTbcMp9xsbpQRZbvb1gRcA7pujkIIQkDSS4PiKS
	8/nW7ZHJngok5GLsQA5uqs8HOE7CCo5M777QdlJJC1Qv6pUU54fBgKRw1lowh9Z5+EaIHnUqFpcP+
	HettHyMg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48B-00000001MOk-0tC7
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e782e955adso1551910b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687576; x=1712292376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pODlhOn2Qlpzyvoy16i8OpTFZF278Z1sqN5yeQeAUQM=;
        b=vtu7IfUE2f6sVAnGeghoMXAyvvXSV6vCoZ1AwoZuzWEpgfdoSp61+RLtC/waJHklmv
         SuKSjuQ+GreppVSd6tM9eQvMzAx5QcbXr4pIZElHZ4fN8W8LnVtZhAlIcxpTyLksy0vb
         dBRhds3VxP9DExVjT0rAk4FHKfhrKEkkDmLB9H6S+bdW7Xx6fFX1ZQYOnuy+eHP9zYaB
         BDzwIwlQyllOOGdH5SVsSpjbieIrZ9jVqChg4KnvaGU3a4ipXjO/+zlEfjTDXPPg5FFg
         901U99CvzojJq4dBHrZ7xST+/V5MIxtrVzohn7NFsbafnqvciWxMzvhkYUR37Bo4LjeL
         2WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687576; x=1712292376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pODlhOn2Qlpzyvoy16i8OpTFZF278Z1sqN5yeQeAUQM=;
        b=eKfX4NMfqmnwWpmmJ3xd0A1f6K7w7MntEWYW4wsmFIiaMzM9i3G335Kq3esNif4PYz
         pchZhafO/Ly/Doivxm9ndDyWVQQmZrodxDyu7FQ4Ue1cY3sIkf1d61Gc5bZJf6a+9hRp
         /AZbuYy6A05bRcZYy5k24mDEnHxKz+1mrUOhW5o2yWvmkUSmbLP+cjOvsnTnR1OpI6sl
         dLlwiYavFc2igvYQz+zbK5p7byHMVu80S6c/lq8Y1UEIe3AF4vacjCuAnJ4D6ParD7+z
         E1MgV7vs2KveHweUnDKepAvuxg7yiI59K7fJ+uj5CcTuMl4XtdbKUOt1RwGYem8uYWwT
         iOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVv5BQBUrRU7fxZ4PIBsbiyYMCNgcXjiUc7qTA9pKcKR5rdKwfgltUOFn/20BqnR90qLDbG5XRD5pe5GpFWoJCGE1GZ7Hp2h0xaiCj42Kbg
X-Gm-Message-State: AOJu0YzVF3b7Y5rl4cSHpMwK4hINFIr6TII4hbRFQjNBptz9CZEI24Fh
	XDTuRdMX6nQ2AE5tiODZBiR/5mVhXjVU7ys97fwEIDO1evdWy0sF7PeuD45n1y8=
X-Google-Smtp-Source: AGHT+IEEpy9pSrtr+BvW+AqTbkR2NWQ8ISKhZnwm1fAksXWCTeDRwW/aV3jv7PvAv025C+VRS8TIYg==
X-Received: by 2002:a05:6a00:3ccb:b0:6ea:74d4:a01c with SMTP id ln11-20020a056a003ccb00b006ea74d4a01cmr1489683pfb.14.1711687576218;
        Thu, 28 Mar 2024 21:46:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 09/27] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
Date: Thu, 28 Mar 2024 21:44:41 -0700
Message-Id: <20240329044459.3990638-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044619_771007_4ACEF3AC 
X-CRM114-Status: GOOD (  18.54  )
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

`arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ | VM_WRITE
if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is updated to convert
all incoming PROT_WRITE to (PROT_WRITE | PROT_READ). This is to make sure that
any existing apps using PROT_WRITE still work.

Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings. Now
`protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE encodings for
shadow stack. Above changes ensure that existing apps continue to work because
underneath kernel will be picking `protection_map[VM_WRITE|VM_READ]` PTE encodings.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
 arch/riscv/mm/init.c             |  2 +-
 mm/mmap.c                        |  1 +
 5 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/mman.h

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..ef9fedf32546
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,24 @@
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
+	/*
+	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
+	 * Only VM_WRITE means shadow stack.
+	 */
+	if (prot & PROT_WRITE)
+		ret = (VM_READ | VM_WRITE);
+	return ret;
+}
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6066822e7396..4d5983bc6766 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
 					 _PAGE_EXEC | _PAGE_WRITE)
+#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
 #define PAGE_COPY_EXEC		PAGE_READ_EXEC
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index f1c1416a9f1e..846c36b1b3d5 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -8,6 +8,8 @@
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
 #include <asm-generic/mman-common.h>
+#include <vdso/vsyscall.h>
+#include <asm/mman.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
+	/*
+	 * If only PROT_WRITE is specified then extend that to PROT_READ
+	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
+	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
+	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
+	 */
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		prot |= PROT_READ;
+
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa34cf55037b..98e5ece4052a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
diff --git a/mm/mmap.c b/mm/mmap.c
index d89770eaab6b..57a974f49b00 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -47,6 +47,7 @@
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
 #include <linux/ksm.h>
+#include <linux/processor.h>
 
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
