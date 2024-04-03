Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51449CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9Pk5RQRcYzxeVC7TJjqTvmE1NQ96shesizaqBFhBtI=; b=cNwyuRz8ESnflH
	HCDy4HKCLDJpVIltdAYH3EStlMIKMsNleAHrX8+ewhRW6ch9KsT0d/wClRNYR6bDQ5XIfN2/+hwuB
	QIEBEPC6Z/mlLsVfgoNPGBwdV4tVRU2nb+fzySgl3oOEcfTZeZ+q2G0QnBMarAbD5MqQAolRUvab9
	d02M86SRskwnAYC8FU4rbCqlhkirssrLZMVx+0X2VFKN0cgIreEDHEaFag6dHx7mp1l6Jv7igROli
	wJoUsaYMYRdRCBnRx4v08F61jx+rw8OzItseMMWssXKPBUmzy1BPVOL4U0bXR+YbriYXCS5Y0lesl
	ag4kHf+bLes+pAHdzF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFH-00000000Zxl-0kLm;
	Wed, 03 Apr 2024 23:42:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEw-00000000ZbD-1UnK
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e0878b76f3so3542615ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187716; x=1712792516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lX+9+cMysL2s2bh0/j36OWWXHnHHgmfQfoaQ0p+lk8=;
        b=AqDKuVO83H21G2FpbE1xgDQ1aHdIMegBzlV7PhZblp7FLgTP3Tu9WrTNOZrM0hoYZ4
         DyM1hoTxDJT+GlSdJ/A1WW0oTd67MLaKD4EerK0n0LCpShUCWq8qfffig9CKu7pqAw5A
         hpselT9wBTeurEeqjYcvnJ1wisv1V5/PJCoLImQF1/MlMmou96ojyIqgIG42EGmVWNle
         DQ90YcSwDQWjwa4fhFBpZh62Zcjuk6Cmf+SVi+9CVT11eiuh5DLn6jsBp7DyrIbWIgvr
         t3gua69XvCLRgNrQZflHKNZl8uRPq8Ro/ENF/YMpJL0+cMulKa2kelHrm4j5tVzWnziY
         ZNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187717; x=1712792517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lX+9+cMysL2s2bh0/j36OWWXHnHHgmfQfoaQ0p+lk8=;
        b=i44az1h5H0fBCO5ffM0sbaZRSygdPDS4nD93nEqoqn6WdSmKh1AVOBLi3OBqpUGUc8
         ujln5zODYeDXLgAAjGMGSK1OJ7GMwxbDDifTf+WGDartM/DYjWtQ5F1d7m5Jmw69kPPE
         fgS8dfrKD0d2gez1d4LuSbbj3+lFCum/2EDDxNzTQHE8J3PUjlr+lv0aURZAfeLxCuN7
         na6j7Cx+Kdqxmtdt1dPsnUKTUpZQLeK2riUrLzAGdN6ZmHLwtAiyIR8t4/X9Bs8jhVVw
         161/5juq+2Irrz2xE0BzT0TaaEW9Ssqi71xWnFCcF08dDoxl66NHhlPEiV3LUc/lbMdL
         Uq6g==
X-Forwarded-Encrypted: i=1; AJvYcCVV+pZetNFBDcMO1VghK1MfQY6PdgeWHuwGfUZaPIDTVKzGrTZQQxMfzqvFxHhFmbjkoguOyyMBKBbDjhcoVsMbCFMAmGIY5VIkYc4U4AaG
X-Gm-Message-State: AOJu0YzsYRP8IX1mRBfL4mQBUPAAMUxG65dU2OEdnKbkpQyyPKH1QeeO
	m7dU4AlMiQBMuwOQkwl0PEAKzlpAXHpDlcBUDmupILj5mkeXKbul2wdBEYJvo+s=
X-Google-Smtp-Source: AGHT+IHn70WZbF+jlCONe2EcRRr6ZCh1IRqHu+QHyp4yjMBW+7E5Ek9bYAqg4ymMIf0JA4HyBbr9VA==
X-Received: by 2002:a17:902:e80e:b0:1e0:b677:293b with SMTP id u14-20020a170902e80e00b001e0b677293bmr5847942plg.29.1712187716595;
        Wed, 03 Apr 2024 16:41:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:56 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 10/29] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
Date: Wed,  3 Apr 2024 16:34:58 -0700
Message-ID: <20240403234054.2020347-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164158_759092_B2726D9A 
X-CRM114-Status: GOOD (  18.81  )
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

`arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
This is to make sure that any existing apps using PROT_WRITE still work.

Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
encodings for shadow stack. Above changes ensure that existing apps
continue to work because underneath kernel will be picking
`protection_map[VM_WRITE|VM_READ]` PTE encodings.

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
