Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B849CCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLaUkQuDW0OZEWxHi0iqT/PUzEDhcHhutUmjnZRGFyA=; b=ZYsAlJuzKMZwit
	y/pSnR5RiN3bNkUAvKuH+RhKC16nlBTfY51wU+WsNZ7paEd5traf/JBboxxrbVv3SC1GpXyuPCQTO
	KP+MbyCtI8DVAGa/ZlZlc8DcMIAyWNy/A1NnmT+L6W/VA3GuVt+npzOyGY8xtOq3sUZqq6lEYK1JB
	nKzofvLqjuBNABWS4mMSe+QaIb5PKNDrIX43axo/ceSXeVSZyPdZvtmAcEi9XtVTyooo5mKipz9CJ
	BT5m8ytdhBti/UP8Z0JLfx0vhW8TlVodCzSEBtVwVleva6e+mTz6cCzNBw63naO0XHrrcipvH2h4J
	dxste+UVOkHq4Acf0log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPx-0000000Ete5-1IaN;
	Mon, 20 Oct 2025 20:23:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPv-0000000Etap-2d9h
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kF1sb2xLtNJ95mXf4y9UUDJse6Qaa7/WyS6RZ/Me9sw=; b=QD6qY1DchWu3y42CNbubgtN9xk
	Ea01VPHfCvwMf27MiBBLZYj4LunkPDzvyVLbuEpXTUsesJ2cNrM2pxoYknrHLQjt2/Cutf8VelGB4
	pXNbNmHjxf7n+pk+K6rxbHkR2VufEXOGeP+bNZVofuMVZ/MVY/HggGtyyXT3+BcqeVP2WRuZltJIm
	L6VzE8cTLcg67/dg5gie+V3YEogtuMfo3ji1Pxa10QU3Ur5xMK8aIAMjr0vWIGEreAH3//NzIrHbv
	EbF61fVY/ay3eHwSj3XzAJV7zuO9zZMbEW2Cutfdz1UWbsTnb0vE9UbLYrfHOLRzOLmTjV7qdMeKo
	iStSnaTw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPo-00000000z3Y-2ERf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:23:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27ee41e0798so76139065ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991778; x=1761596578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF1sb2xLtNJ95mXf4y9UUDJse6Qaa7/WyS6RZ/Me9sw=;
        b=Obpnp1hNjZ44fk5tXtSh+CN/RXUvOKuQ7zGeuV1U+pqGWXfGaPhuU5ZO/mjArsITbz
         YU5YoJpTDdCApOLzqurVWQ2Z59rSVJPb25poZ5fOsVOA1EVGnsw2Z063ZHcqWBb+OrET
         4e+DLmWQEbMaeqiA6kjnTqTomJTV6Vxn2dOhx+2b9PTRwHChhF8gqtGfse3c0tNyO+/L
         ED/WAJd635R/s+2yAE7Nlo82JdTC4xobC4YH3lh/UAawcxa5xVvJYLHf05eStu0BeFFa
         j8kBVFU7XHmp94RViO5IDDEGLFneej/QITIPG0+jbH6WB+TSyHw7hP4l1t78vprBM/ty
         VIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991778; x=1761596578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kF1sb2xLtNJ95mXf4y9UUDJse6Qaa7/WyS6RZ/Me9sw=;
        b=CPtgaEqBQmSTvwAyrwCWIzwN04BCjBt7GIexd8IGdxmvvCKmvCQH+1PcUEdMus3HOX
         S8yoQf+sPfZkjY8P857TVJL8njRvg24tqsE6q+Ok0bxyUYJgX+YzDllPhqtOZugtUhn5
         2xlE/3jG/LH1wKosY0gQ8UlU4q2GA9Fd4RUPxG0bXoKRtXeAWLdpBZwGxkETZ+V3jXGc
         eQMHHrWcpehmxjwoexJD6lPCd9KiMwtfovEnt0L/hFXGptaSnzruqDi+6B+R50PU7YeA
         BLHPnp3ygjt7lOCesk8Z7sV2Y98yKNMuXKFH5pRbN2W1NOce4Lw8O52ALQXEZxteyVof
         pzsw==
X-Forwarded-Encrypted: i=1; AJvYcCWzCVw1w5Jaw2SRTLQHyZxkoWVu22s4N/PpA18Z9ZE80JJy7KYsSIq+jDIBdlDg8uIL4TkyAJlM0fakXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxTYlx2tLRnF9NEVw5H2L3ZNuk1vBp9A8/zjWctcO/Io7fohM
	RqblW15O++eKcOfM12+Txja20cG54urIeEVzhE9HCq0ziPf5oHILj43YveR3eWrADBw=
X-Gm-Gg: ASbGncvJJOGgyQsQXbMAZIoPctp3zME8+R4IQ6H8/etjLYueZxqUkwUWY+cwAVhEzXb
	uRhZrXp5q0+4z4bert/k5CmaqWGLqLXv8i3VideHOhDILGENdYP4XAQjImIaMZ/GGWklZx5yZoz
	MFpFItxjar015kZ31kDVCNHTVUxHd5JV5g68h3ikPRAH2wgMInpY/ahDIzIStD+OBrbzaKkMTIn
	/G0vRcjSCWwWakEmVkvCWf0wuQL9wDqPG0oVVXypnSK73e8jZ8exAL5ea30o9SADcEyYaYuPPyl
	CsKk1LarKjJoIgwgwBmy3DBLOlpJJlcYLe98Kl9YWVZQM/xwi4ACTOttRhqoASGYP8I+duSyhl5
	MG4mZQr+lF2LzumZzkIRFcAhTzuq2CdCbcDzO4l0GAkuOKzz2y5/xDsileGR10FfU75uFO/78lv
	7diVFVn1KYsA==
X-Google-Smtp-Source: AGHT+IFjI+Eo/gAZahP1YhdcXcRCsIf19VRdgdLmzm3oNcVwOeVwlLY6tG5kcvmHgKRdDvnCUjEyIA==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr180686115ad.12.1760991777715;
        Mon, 20 Oct 2025 13:22:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:57 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:38 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-9-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_212337_827171_D0E4FD43 
X-CRM114-Status: GOOD (  14.17  )
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
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
