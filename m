Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3552C35FF7
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUXZMf4BtZbjr9FT5TS1DOfkjhkP94+WA27GwSQLEx8=; b=doG91/yIR50Fn5
	SwH9Z4kX5jhcHA1whGS3+9ugnwisroJCJ6TzhULxhZKoRwKXWoUjvKs/7x5/qPRK+HHbFhgW95yPz
	AirUNIVOXc6w8dgTaEZp1JzZuefFT8mz2+7rVml9tJZMQRp8omy/h41TdOlrBzlRdIbSWN33ZPIRx
	0qd6uqA/RwHuehFi45eqh+APAP1xjtmfglfuyyWQyfUTfXIaXRbWam2qV+n0ELabUsS48l3WWt8dH
	FRZMi3k9QqyXGjR3kfB09Ku/pDnUFDu0WVI5ecOILTmLx9FZxXTrg3TJZko+S1U8s2nWQGGXvMQQO
	Y7r39BPtMXRoU35RNHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkz-0000000FKcm-2PT4;
	Fri, 14 Mar 2025 21:39:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkx-0000000FKYM-0XAT
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2254e0b4b79so65808375ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988390; x=1742593190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XcHZdxwrXOxfjvym0f4ldwiX/cDoifADRl7Uwkj6t8=;
        b=mDvZ3PRSL4JDrra8Hu8oubmTBAjh+3iu+32sSbtVm0EhOQ6pBjtiRIfoixBBkobDoV
         fpd1EW8wEZ9vTfUfC/yn5rmNBWGToavLMhngJoVi++puF0XfHAnsfZ/G7akR7ggMBvI5
         70jC6D/dlPKgj7JBlzi02/JrVpS1RsNlXs3IWSv6KS4V0ermqcoWHTZGVYb27wFP219z
         yduZGr8k/FO8vZRdeu0qPOGb+0fsnGPZ1X8eWMje6blnLISQOCVqkn89fREEJyE5Qlzy
         pUTanrJYBwImTv5AVq0T6IbhEkSHJdlkQhdxJgmpILW7RbEr7w/hPOc89a//xfXg2iJA
         UJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988390; x=1742593190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XcHZdxwrXOxfjvym0f4ldwiX/cDoifADRl7Uwkj6t8=;
        b=a5AlODRsOgDcQEQa0+r99oTengp2n2a00D7hQ6toNPtTuaV1eH4Qn5Jrz4o8WcZeuN
         pv7q8/ppz8315Gd/FUxelcrETgQ+mjJz2jk20Dv0NiQ/p07TkisERHY0tiR0hUsC0uFo
         o/ICI0sEeaooWsBnz3RceqjQAW9iTItf+d/KczPfzW4kxc3KAfduPW02pTnefTrKegYs
         Lxw+qnbKJfPDVImzLKNZjYgfrcvsexfAwDYiOCSq74Bt/cpQRLqzK1DzzP4A9xyzHDNi
         z8XENQs0rIdBzsb5cT7MN9w1RMylLNhN/udD1sNkKRQFUnF9aqO6CfSHAv1yH1W9N5Sm
         ImTA==
X-Forwarded-Encrypted: i=1; AJvYcCUySPB8vQ7RqETfeS7/znmtUOBmTiAKpFSsha+RJQMnG2e5rV4NUgYWY/OfbZhvLp3+jmok1dR6s3mmMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpa3HAjHvL3BW2GSfG0KBsi9gtaItUVlrrFrHWVpY0b2MDFxk
	Urmq3qtPXlPbbQmeF7jdQfTjPeIk/YmNp3PDyM1CcCzIBMmzzhF4TsmFjgV7rQA=
X-Gm-Gg: ASbGncs53IsVwCUcDyPnD3E520TygIKXrUwK0/3e8Tx7716VKMtZUGsULHzun3+X3HE
	cOITK9QlsCdoLtiS2+kPxNJ5D2BWeC/Gkyc5NmfKoQGvUQil2ch0TbdhCvxXMqmBXIh8gsav+Qe
	zkR9l1Tm2+U9/HWKHY4lifvsUOUijmoX3JSBjUZyF0lVaAyW2A2dv9dKhAJ55SULMwi5LX9hhTA
	Gat6q/yb4E7s3vP6lC1GXFKezlAw8WWOA4k9Q2tVfj8qvPym3NZreYHn/gvQhE//qMebyffdkBh
	pexcM3tcdmSFOaRAePLmQ7qIFl+31tBoJEpKc25yTEES3geTv2XUsaM=
X-Google-Smtp-Source: AGHT+IFpAfWeI9aPllc1CwqYl/66ArnIXE3uKAZ+LvLNawWnKsDtpPp8xhAGnGFewoMM9kaYyptgHA==
X-Received: by 2002:a17:903:2b0f:b0:220:e655:d77 with SMTP id d9443c01a7336-225e0aee8bemr51023205ad.36.1741988390643;
        Fri, 14 Mar 2025 14:39:50 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:28 -0700
Subject: [PATCH v12 09/28] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-9-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_143951_183063_59D55829 
X-CRM114-Status: GOOD (  14.93  )
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ccd2fa34afb8..54707686f042 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -411,7 +411,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -612,7 +612,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
