Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4866DCCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2t6C7VNlo5ix4NVjwhbD0QdAJ3ZZnZIAbuaNG6EvS0=; b=iuJVTSw8K6/FYK
	XeMMcCS2hw0h8rhYe8vGLXgTchsZCHml1x8TLCqHugrFH2jMCU8OY6SUU2nJT5ZVtDL2ZNZ55VRPn
	7qo5hzZnESbGoVu6svKD09ztuplWhCECHIgZx1/BTQxC+Dexe3cDkXFMQfrWcmPQYiQI7LakG1E5K
	wlRd+cFzyNAh/8xG5uYDpeZkDMpvo60Myt0F4Jp7VBmynIfu9Cx5jM+mAz8pzLcmPLh/4/DcCBVhg
	2OFHmLoWjbg3ccRZh7pfdmCM79stWK14tWSnAzGlbg9Rv52R+YIQ9zQEhQ+3u1RTBa5/hbb+GrlCg
	R4jgDa4gV/A4pAqT3DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwtF-0000000ExmB-1OLX;
	Mon, 20 Oct 2025 20:54:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwtD-0000000ExjE-3VPl
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=; b=P0nOvMljYUKHV5jWhmDB992CG8
	vKcghf3HpDbSkRLilRkVGALg0fPnzIdRtsufD25lyzT8sUBCbEFk9OkFd6bWpQhk3cpVZ5l4+O45F
	xSUmPLraC8yRTXFQFj7jtwwhaFzKuV1RZaI75R1dAU9ILRc9BVREAHKcXS/+oNWtEeDO0UhzmD4aE
	PYjKcAM4LZNUXHiXy0OJW8UxaAWx63WiY6f2w5qRxjtyAdB4DC/DUaGqMhP/Sqlu8t0harZbCdHbI
	w9MuKGwRcxHJAZl6xslEFrROLkex2XhWl/19PiTrKNtGEJWvjkziyZXHFsYwoy5H4rlhP+P2bxxhI
	U0sW4c7w==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt9-00000001edC-2mZL
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a1603a098eso2959769b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993634; x=1761598434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=X2WFHtTNYLIEHfEDTofmKWmePrK/20n6TOsB/xLJKKBrjeWIFlPMA7hV18kK3E1sIX
         l64ZzeB1YvKWQSP9lnq+HqdPu+QQYhsKaN09V7CLgIVj3I5AUsVowBnVx5G0imCvgsDz
         NN9Up+ei+7ozyq8gA2zMZ8VF+TsN0fw+oGjJDfSdQ9WkCepgaRnluoygYO+GqAlHfD5b
         kyIGw1u9IsYVO6hP8so27RkUobWUDeUhICYSVq6raKG865bQtRgTruhuQLh04NbYf7wM
         y6bK8dTsIcNCjn1kjtRYKmeFBbElJGzB/p6hHWg9WfMC3w0ATn3l18sH9/fM+JkwHS71
         rH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993634; x=1761598434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=S21lGg1ha6id2zPyKCpTv1SU/XeXjtw0KqQg0Og9nJfE8plTDJqefr0W/5eqVeMbp2
         5kkS6r5fcers/1u11edHFth6CuUGtYhwgwWCqrYcaLCKWMWTNId0Gi4fzOiCyfGSaHdY
         YExPckevm73d9VWuQfqeRTXzIhMgzFVSN2IUeEicZQzZtFl3Zi6B10PSaCkR8q+sntBr
         pmjrPO1Nycpv/cMC1nXubN7EHMdUMiFSSoecNRF3cQrGSnFaLPT0li7VdIpftZKxZrfp
         u4DGQkZjTDxkDPH2g8kZkumMqYj3WsZKeC8AneXSIEAfEfw51IftiHmCbgXQKaG4jq5U
         aZLg==
X-Forwarded-Encrypted: i=1; AJvYcCXo8rLaC5FdW3HmnzKVd8126NgN98VlMn7QgnTGxqeUJrt7X8Lu6DRRA9D7WNogjNn4B+Bn3QhxIqzIPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7g5e5Nt3EmFYlNH8JbzUDpqx6fIgeSe8PB1BfiWHWln75/qYg
	yvJoRkeLYYrraBRqMTkcOQKWNtm8jS/4hltzkXV4Ne4cLqojaZIhOXwL4cbsXpSmz/I=
X-Gm-Gg: ASbGnctlkbROpsQyZDyYxLluuPU0PL8lfNNIWBDHYzg2y9SoPsb8EdunepHhibJ8MoA
	khCZG1cZlR0LUeP/D+zeD/N1Ua2pSDPjb4JdVzAHuYP1lkLWZtdrxd0Fcv6V0glTJ5TdxWQezRd
	XCd3dElO2rOCClh1qsGJjfM2r3cU7gzANDVCrJpSDmkEFn3s3MY01kMXg/i/M61ODCgA2DjSXut
	WXraG0dh/QDoer9ilhkFimv14dIgfXZvRhw84bj39imuVA9pSp5Jx5s/iBlvyda092N+ODM4MFI
	/VsjBoQbE496MJV23eFAgiCD1HjuH5ESzfcTC8h6OHc4HkNC4p6W7si6m1xSd5QhsOIzNfSjXDc
	h/TyltneaUZhx3+bJtjIqDIJ3b7IqmgyhZSZ8GwnqtdGCinymTTNw7A9wswIi/1VZMgVLGYv+Pn
	gbLfcKa0QT6rZXbDW5Sc1x
X-Google-Smtp-Source: AGHT+IGY4EyF47I5kfM9sLiEWB0A4XrZi6suavhQ3DELNJWCbB/8MtVPQAocTammVkTvv5k+HEaGCA==
X-Received: by 2002:a05:6a20:2443:b0:303:8207:eb51 with SMTP id adf61e73a8af0-334a864aaf2mr20366099637.55.1760993634353;
        Mon, 20 Oct 2025 13:53:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:53 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:38 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-9-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_215356_965858_898A4E71 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
