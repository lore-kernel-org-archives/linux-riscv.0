Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F2AC35FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp1YU5ZYy2X/dbd2FG6aBkHj99RVQsLlPXppCsfvVF8=; b=bPDppx0Q6jf8+U
	W3l+6R0NGQevJZKanEnF8Nyg96IppblayUEPBjsDKmVC0EEIZhRFSczrk0cAPat3b0WgvCOYI363/
	Im8LEXgChWjq0XcNFemx83dSXonABLN5824Ltrv2jGQ+ATxqlyyp8bAqMChwrPaE/DWzT42cADBtP
	7x+6UQhSl3IVv4qXBMNKWp08lQELkD6wMqNCjxnqXGUiRCkS3RQYzeXcNaQX4OoDQb1ERfpesos9d
	/QwmHcLb5afzhS6AcOYPEH0ONlEaLiQgh30NNP/Cb1jg5QCsmZ58Sn8wTVhySSZ9+de9WJENHqV3z
	6uKB5K3dUc7NXuqf41MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGv-00000003DJK-3oIl;
	Mon, 10 Mar 2025 15:42:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUx-000000031aN-0EYr
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223378e2b0dso62374105ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618374; x=1742223174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=MdVFnPsj9YqO+Dg1n4bibvFq2GNtkQbT7p691qNUTPjAFJszpU1MSNFVTSE8OB/MyH
         FYoSet6eDrssJp5eHkLV9+vqfFiYOZ1xT9LD6/BsEDj+racPGmhOpfJUK5AObbx7Sm5M
         Tj2JTvvR4kI218D5CSrMlFu6R4LHbBlgB6UCMq6TeLn2pkLiStnZahLvHRQupMW+gN0j
         NzThc4JjUjms2rcp7gaMgEi4Mbk3/VypH5D3e8mkZbT7fwussJ6LPHNTbtzDARbVx1j1
         gq+QWi07l8/mwRoKmCMqX8Z2PldvLhKsOqcL+6tz3Crfjn0hydUwvZEUhgDTbtqlXamB
         0nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618374; x=1742223174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=R4XWX4lFCsfAKJd5zXBBq85ID9r18x3w50ujtJYaRdqcWF9KxuJrlD5hnsXoF1OPSU
         q4Z6hLpXI6tDk5nj1XFS9ZpTXifTF3TsDa/CwrE38hqEGriq/PceCMymFLCLozIE4Qp0
         2Js/LXszt3NvvFoO4Pyz/VZJ33XosuLAhtDgPzZc8inJlPZn93xe3VKEgccDDeG3PGxU
         WGBsS0FM2zk7Ulpl49bjZNVD68FHnH4sIHe36BzPkgUtwUAUGgFT6536kc3UCLbgw3+v
         2h5SBuT8IORurCeELVCyntBIJSzFibYKaO7Z7mTcOteUjlvyL8UFxpoNYNyVrcPhL6Dg
         uRjg==
X-Forwarded-Encrypted: i=1; AJvYcCUUT/0v6YPfrH+BVXw0QY5zjU4s1Crtjx8p19EXeT1F9On1zohnfEkqM20DeuX4d6D0n2Z3M5nc4qCtmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSvkpILU/KrO4UWMRW7m+6cEW+GSxoEy7R4ozCJ/dmrUtOL5uS
	egNFCNbn99j8EpOZ+BiMdRUzYh7U74aMgu4i4d8HWcuSnUgCIVlgH1+c15tPgIs=
X-Gm-Gg: ASbGncuNsNixhPvfnjxsEVmFHxbB5dPfIGNIcXdj9ZwGFX/tgKFosmA2JJRikoeXZji
	FXIytxWO43mWh3bMfoL0F+BCkPIDxf79TNNB3Em6rNcPDH146gShbqfeuz2N2tZYGqezV+Trlmd
	BQXrLfRFwYQ9KMfcg+tmOF9LxSl6QgG96bMmV2Nu1tjhdgmNpWqzeVfl+ytHcanKh4q+2npSBGz
	477+Zhv1slWWiPQ9AY149ZSVISIh2FXSo61tspsGPliZLEnvqzykOPX6Vr49bUn3ed52VSbXnDY
	KQqtpxr9bw8eHU83ZLJ9maAN12KSUSwyTXEOjV5Fun8GX7JwJPxmOWg=
X-Google-Smtp-Source: AGHT+IFKPuh8cOHYjBgEoM7t8cHgv4gW4YpL9WqheJYopfOZX5sbWBiog25DM4bQ+IO4xPTW/pcKfQ==
X-Received: by 2002:a05:6a00:14d1:b0:736:755b:8311 with SMTP id d2e1a72fcca58-736aaad1daamr15723454b3a.16.1741618374533;
        Mon, 10 Mar 2025 07:52:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:31 -0700
Subject: [PATCH v11 09/27] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-9-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_075255_101888_BF538134 
X-CRM114-Status: GOOD (  15.39  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
