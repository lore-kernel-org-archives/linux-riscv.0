Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD6BC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGFFSvi+Yf+HSF2Bv3cMoX7lLu6vogXoZT1QVF/nFDo=; b=0OAhUbZ/n1h+CD
	Z9qesySmxUSdpmp0rlpbXJJPPfSQctm4PLYczcNCxn6XMvD/piUF8hgyc/zM2cSgul0vJwhN5wrVs
	31BhE59X671SZ4bhz3bkNSl2UZK3i9TrOZHLLVJ+lDjZ+/abBrxsQ7Rrg12rnGT6FYuQPq/L5RPNq
	XUxOkSXMrqom09l0ayr8Uby9CEsn5fmDbMVz8/iMq8F+BpK83CF9NWnOR4V3kODsdXhhs9PVemPy+
	u+1z5NO3E16+BrKFTINw30fXqR5ApbLlJuUHPLXAX3WXoABfxIdWTU1IzoB+fozp0R7o9uoHJnVnZ
	1nhgkftsW1XNbaLCZfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qvE-0000000D94W-48Yv;
	Thu, 24 Apr 2025 07:23:00 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qt9-0000000D7qf-488g
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so400441a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479251; x=1746084051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqVNpqVNQNTLFKUUNkD9dMF3R05rxCs4UwxRmqJQ/M0=;
        b=Nf4XV4n5d2AZYCZxu92XPZhHOHpDpRv6xBpfHQDL0pS3hT0urhubc0l3tlOAuT3woW
         hXFdgGnQAZhq1Qq7IfeKZRkA01az0GInefZuAMnfta1BrbuGLqJk+CObGoSOayTVENvt
         nY0wPXo7o3ti3MbuKez/sZi8Dttetlkp1ERiIQ0YiTenQmT0TIpdARcbqh1bwoYGAK/f
         A7A39hDLb/NvF6ak6PjWKowr/zse0DWgoOcnDyXUIGQWS7m8PY6WM0i18G6vp8YY4BgU
         voHjwJ9G3yM5BGo9UP+j5SnfW0QQYDzy6a4V+vnJkDyWHCxxVUgnDIczC7/IpM6XQHf3
         bYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479251; x=1746084051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqVNpqVNQNTLFKUUNkD9dMF3R05rxCs4UwxRmqJQ/M0=;
        b=lJZprpXUiQTjeKJ9YwdkQi6H1Yv3oOpuORtZ9r05j83kl1tGkS3buX7ivuz3pyScjP
         5n6R4hFFqyaNiSu+T+boLGTSsZwHzWd/EvKHdRE4g4jvm6MUYyJD1JQT9Xw2eXvpvOk/
         quuanaLTgkfEAzMGLQeNQtaDKJW/GnDmKqV6O7xg4e8hon8hAgtioFHpovAx8rWnJSHF
         5EbwKEZ44Shb5yjxl9VBKagChUH95RxEwPStpv8Pfp7hZruGGpOpRLh+dZH6zLBmL786
         wvLu2kubhi4MMWOxj/KToB0NV/Bxu/BI1AyYQhYfvbY9EIpoK+qU9AoksqKs93LEnlFZ
         +YyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZFpv8hIeWwLovwSlwEnv8ibedFX7+FxFuqUvLP/JXAyaOXvJg/zTSo6R4Tg4/Om/G1iL06AXdNT7oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK01PUawxZ/8kW6eYExRsCBWDbCKN8Ikg+gfEkPVYBEF6V2Ji+
	vn4FXLlXKXBU5LuVruh0f3yHpzB27uxJvPTpwuQDofdP11smg1bb9mFHrqaSmb8=
X-Gm-Gg: ASbGncvxJIU6b5yAb5DaCggWwsrQLPSNVu7qz9lrPlTzyfGbHNF9GfSoJPm+0I/o9Cn
	xOCq+jWoi1johvIanOFGycoGbwmVk6izyDL/wi4yEJcnFj+5O2gPsGhXCKWF99tD+xqjIlHvPPT
	zc/I9jpraNGGljRtfbF2LdaYM2nhSvydi81FRmCRDYfxsMoWbsUcwgWpHKtNfiFGf5oC8HuD41J
	nn4qAbEtVKVD7ojQkvO36Q3QERR5XgTCZ0R1B/Hn7mL3en/jg/+i/tbYpn+DvjWvOJP4mIC+zvg
	EQ5IN2Sa8mGHpMPoB/Rx6A031vX10sxBw4LqrP9zNXI5JtBshAI=
X-Google-Smtp-Source: AGHT+IGm94vNuDChfGpZY3JHg1iPxVQedsgs4wr0HwINk6/v6WQ8Ed+8gNEGNYrHrhw2GdIZutJrJA==
X-Received: by 2002:a17:90b:2b87:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-309ed2a3f00mr2155371a91.19.1745479251179;
        Thu, 24 Apr 2025 00:20:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:24 -0700
Subject: [PATCH v13 09/28] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-9-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250424_002052_091722_91495D07 
X-CRM114-Status: GOOD (  14.86  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
