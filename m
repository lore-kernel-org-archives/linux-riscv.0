Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F2CCD19A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWVUVijwB3cIRoJqiin56zDTFnjugYDVzqQCLFapEdM=; b=gbPbEgTqsercWT
	LNmbaSYXsjwGmOBds2fy0zRiKp/k1bvdZtc4RcPupWN7hACBEaZjWQHG4uENODfVIZEzuzJlFuyUM
	adKuukLuJuR5RKS54NEl45masde9uofAa9pumLKDzQnIz3H8ZbAoBr97vfr/gA21gjMhkN+G9uL2D
	LSYmRKbVctIcmMBCTp4eNJXESNJYIAy6idnbk6ZS+FfVfKE47idWl8N90ZEgGGiemOXkj3NsZPq/0
	LUoWax4HhNevi1Mop02LolrTLL36L26mNDxzILtiTzD2ts67dMEFTDfb2dd4Nv9MfeJAlInrLQ5Ru
	qhmRjNKSBPUgMKAFlVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960d-00000002Wwn-39sh;
	Wed, 15 Oct 2025 18:13:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960b-00000002WtS-2QtT
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:13:58 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b5579235200so4354448a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552037; x=1761156837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZlhaeGyn05OIbis6SfSAIFcz6IbZPi7uJh5910jbDw=;
        b=L39tLgKXFRiv/h+j8LBTbzamOB1S0/8OX4H74SJMP2McIrZrIbpGRbcDPPzKulaGju
         lyE6NU0/x8Xm7S8R8WFXTdK+llB8E7qzacrXRkmOPitQJ4RQA+fxDh+o3dIgQF84rlav
         Mvx/+bjvvJIdW94P6vzLO/vw3USxZheP3iLETZCkIaPkhn9iXcCMYzARHtcsoXF1BZZA
         70WRNjT87mfxmxTxnj/Sf1YfjlLk6YxIkZssQJ4UHUnwqe+8NbvtGpzFMMjh3EWfq4sC
         P46reQVN5FMBDeovnRyYYY7gES2s5mW+idpWs0n1vqqcTu+Dx1L3jiW5uOvKMlrsy7hp
         XeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552037; x=1761156837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZlhaeGyn05OIbis6SfSAIFcz6IbZPi7uJh5910jbDw=;
        b=mf5Po/1Fx1ias9Dzfm4FSC3LPxlX65cH8F8rCHJVcCb6tlfdOffXqPVbijQ8dqoLZ5
         tbgjQIOy1CLvEx62ZIRMc0YNueY2QH1N2zjJpxOdui1IhxzgHmMbwDpoBEqNAzaaCZh4
         gFq2iicinOQgXG4RvlvdnNRNhVOna95Ac0LR+aZE5l5tkpYxX5ms7Yf7eVfYS0Jea2hX
         Ng4WWKpLq2Pp4Lw/fJhqc9/CX7YHgd9lvL+wWsghM9bAAw0nLgQuQEUkFdAMX4ogI/pv
         +5WmFDrgKPrF1TWD5ntYvR8bg/pxFvk9mytoTcsQgtwgAkywlob7COFWHcy7PulW2f2O
         dECg==
X-Forwarded-Encrypted: i=1; AJvYcCXHlaSb67Df0f5KKKncrNlrDNQGtQZBXfGCe+Ps+18QQYxo9AyRvX3VAveMI/RSzlTUhRLIZ9CecF/5yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7SWbpeqzT8sNqgHUb8ytgte8H727J53lteghhJ0csl9YgYVvJ
	iVELyStoARaZANkQDaHAGZ7jekakD+Q7k7j4LAhAcPraOACVXf2wJwTXonfSs3L9nWo=
X-Gm-Gg: ASbGncsLpl4oQTTYkJ8LAp8Kt7MeULOQveewruadf5YwG7iyhMmEvQZL2MsmurE1EUU
	UxNI5Rs6bb/xvhYrgPpIiocoJ9E8PhLEhKVPwSYdZfMTpmj/0a6NWLYk3O3lclZoI9Q/JdGM76o
	0yNpGsi9hE0AfStCOm78FASmeEU+ODWo8w+9qIE7rlD+FMtozVXz0+NXorReak2NQWysgn3dsV0
	NYETMITI77Sl/EI/6TC8AfYEsOnOx/GPQkZkvkw0ehpkmYmdAmnSddwujOB9yyz0lt7dSOEkREI
	W3kVEfJ5JTKlrUhHBPcNSLf+2tMTRdgi8jp1l71b3/vVoYaZrVqdLPJh9pW3IheqsGt5naSDA8u
	PAbDKwnWI4bNK038yMfnJHUofQjeK0pr3GQyoEzpRDWZqqe3OxaI=
X-Google-Smtp-Source: AGHT+IF4EsC9DuhmT7rk9ptTnU4PDviv/V93ULDr1Oe/Ycd2qKf5MIh5teSfdDkNf1OPwXT1XZ+ltw==
X-Received: by 2002:a17:902:ef10:b0:271:5bde:697e with SMTP id d9443c01a7336-29027213340mr391816915ad.3.1760552036518;
        Wed, 15 Oct 2025 11:13:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:38 -0700
Subject: [PATCH v21 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-6-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_111357_651288_FC0AE573 
X-CRM114-Status: GOOD (  20.48  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 26 ++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..0ad1d19832eb
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <uapi/asm/mman.h>
+
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+						   unsigned long pkey __always_unused)
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
+
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 29e994a9afb6..4c4057a2550e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -182,6 +182,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
 					 _PAGE_EXEC | _PAGE_WRITE)
+#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
 #define PAGE_COPY_EXEC		PAGE_READ_EXEC
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 795b2e815ac9..22fc9b3268be 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
+#include <asm-generic/mman-common.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
+	/*
+	 * If PROT_WRITE is specified then extend that to PROT_READ
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
index d85efe74a4b6..62ab2c7de7c8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -376,7 +376,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
