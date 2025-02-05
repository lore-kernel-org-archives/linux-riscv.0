Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FEC02193
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWhX7KTALhBWN0GZS7sZPYl83dx2ohX8BBU6AnNM49I=; b=WYHt38Vzfpq+Gf
	r5CkMQWYRzOTAmpE5fvRZQDAdZZs+UMEYWtr7OMVPOs12uSjeDJ69aB+0Zwjre9CxlzCMDQiPsEfZ
	77bOil1x0KBuaM+8X/Hy7CPC1GhXQJxrxvycWGbCtKGHQVqVLfmVC90QMMHAwjiJclzt9JNJFsFwm
	Qeke+d2BrSGnI8/c6fOoPx+Mwe2yf7/cRhwOqwxmmKpLcNIJ4cZKqgA1DXTyt8u5/etI4RR9GtHPd
	wrC6Lr8216bHsmDcP0APRSImew9C8GQpMpKAEcA/SuJeG1Snbilh1dkQfUYBcS74lnIybyATi0JTY
	hVNXEFeyYh+ppaBnImNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC4-000000028aH-3KvY;
	Wed, 05 Feb 2025 02:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7l-000000021mc-1afd
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=; b=RMFEFckyfkvoI7oywAPuj/jMIE
	V5wpKMsjfU/llx32Pwxr9aOcmvr7384R0GSrGgp18J2mgoyafmnbH/KyGUcremU/96mQGgrk+Gk0x
	VkHY4HzIeqQsgq48zDclNlvmfOpH3Eio5SfPbPDUxR9OfsV5HnuTEMYysA0wNtHi3dlqZlLTH2vBE
	a1fqzSMLpo5d0KFwxEiyol2TyZHgd3/FBd4UXv6dr5CiRl467gYky2w61SipbQQ/N6iI6pI6h02rQ
	/OVU0SQHZJSaEH5WO/QQG6IDU0ny3RhwBLyyqobqKTIPEznrL8anCMfaUpqZqum+lTwhTvd6GBimw
	rXA7z5ow==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7S-0000000GTql-2WV8
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2162c0f6a39so6259595ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718533; x=1739323333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=A2oVomuHiU19RGqdFqMMf+PAT4QYE5DreeOeXHN8HFqmCahDAaWDWR6vSEA8xMUC8z
         2M0eh7cm9TK3waugPf3WPRk3snPIn3BNh7QoSsAakoWZTUgeNX2NbJiDXJDVLiSJ/fzi
         IiXo8l+jJAGZUQQbGitAhTPsXFZLG00Ku2YX5JZv/HKqPkubcFoUm4BWeT7ostTkqWfB
         IOZc4qXA6ZQ77Lk8ratWujWAAv9K13ehtwsD9XxITFC6J10fj3NIC4kc4nzsG52H5MxK
         QffgT3zvwLEtHFzHOdlgV3Tqckvf+N0FgTO5XW62KVLpve1VHfL+s0JWT+HDH2u8El2+
         8IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718533; x=1739323333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=Uue8wxtJKZ6kylmDDgxKynAGhuZxVmKkoyg3UxDVp6zCrMv42urP7XvAc0VcC3uH5l
         hILZyxRnPO2xt3qebQnbGfVCDF/WpFus9iX00HQXzqhR3FH6q8qoYL+axUvkgLHR+LxM
         u/MUAuMui+6D6OMBgXffUyDeEYZsvcECbLF6iyzdhyUuw2UZP78P+ftYb6BWm2OPtR9Z
         uncFVx+gEoWkzqafUd43Z21sCnpDUh1PThrWDiRyt1UjjueY11ha+VnVl1r2uOcrv0WC
         C3u9wYROFjlqzXA7QafkirVV8j7k7IIi3xt7N74OssQ1YLBENvMA3uFND/aDLVBBCsDU
         UW0g==
X-Forwarded-Encrypted: i=1; AJvYcCW3yTjzQiwbOHyXAdtM4njMMHoBUcbFplVc3BD7xpy4AIbut9FR17Jkpwtx9as7PVVXu8nzbg29TrwwRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs+ZkkaiZbINNrc/Gw+gTxrNylwzx/H0KiS9jpL194bQsje6FD
	VDmry4Sa+ROV6iAL56B95towObTdKqb0ua9pEr2w81lkm6nys/Gac4CLp4omeUIWEzUWMoz9+Rn
	E
X-Gm-Gg: ASbGncvSxjvExscNkiuHLscwx053kS9/np/r9t+hBlLn1wdVNNrBPIQZWxlxjq5og8B
	puzYO19P1Pdo+pILSQfDazeORrqUUUYhaW1L4tpcA0rtOSdDCkSdbp+ghwQiueqY5khsEZo5/rv
	6086gAEwGoqCTy2TcwuDWloAUJCR+30BbBnn2yAp8LKR0MF4OEnkOEAdaENYaiM66tX0Z0OsSbe
	fSQ89fYOgmXEgxea1bFuiu4kD8jaakRx/PP82/L1vvM2RAZ3Gs66xewYBSrs/IIwFKXhkFUCGoZ
	6EC7HomFN5sX2xWjcOoDr1FH+A==
X-Google-Smtp-Source: AGHT+IHlwnAptZSky9Y1DYo277tRu5dBk5BHHEzzWIoM+u4E8FH3BeXq2ANIOmZF+k6xGQHG5TCG8g==
X-Received: by 2002:a05:6a00:2306:b0:725:4915:c10 with SMTP id d2e1a72fcca58-73027296652mr8559134b3a.10.1738718531190;
        Tue, 04 Feb 2025 17:22:11 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:10 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:56 -0800
Subject: [PATCH v9 09/26] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-9-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_012235_466523_5AAD395D 
X-CRM114-Status: GOOD (  15.19  )
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
Alexandre Ghiti <alexghiti@rivosinc.com>
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
