Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF887C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhZnULThlRVsbqfMQp2+ccN2pXovwDEsD/Xr4vQdyNA=; b=4t46K+IGTpQDRU
	PVKGMwzkcI8+RUTGVdDHOy1UeqMAMO9CfJJuJPyUoPBwtbu5v8zYmleI/T/O4W4KVR90bXPZ/MsvQ
	Ehk5n7SXv61mrZp2j25lPcrHdyWuOjIAxU68orH9FAzVtz1kmY0ijLx+rCtgX1wsnIm8eHcjCltEm
	C6Bz/q+nJEgPlNpugTVKLZBxxdKYbsaRtLEQtTkJ+fhaLQLD3Eb4WgTertRRkfxF/Niv8f1Q0woL+
	WbN6FWB/7AP3LFspge/M/x7mJqezHEr0DezAo6V5t+ntyjrRBZziR5CC+6dQOcyq7O6AmuhnIrKrR
	VoCfBa6pbF64q79OKFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjC-0000000DsRP-1bKv;
	Wed, 04 Jun 2025 17:16:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjA-0000000DsNm-05gA
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so84323a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057395; x=1749662195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=la+snQ1DrOVIQf0jFEsWiSePR/blflPHrsaaGE69hXMzimqnRe8HkjJZavucQ+zl6z
         CY0ftmM0F7bdV22/gwHVxYIWlbIsX5/WJBToLu+WJVANCJHyQT7490eMrkEENoS7aUUB
         HnUkBTHJ6LefKRmB9xmpoFf6cD57gUhUspv9j4Vs0fyxVq6a9n5tjQSlOYZBdR7vM5cU
         XTg+VKC6SCDDKg1IX2BK5rnTSyIvNQVAtO6PFfcKzHtwuk5fxvcHP7CMlXOQcMkPSGH9
         fFhGvMxYhgnSCw8lnwSpDTyPbzReu5OJXLXowuLJoSzGqn5qnRxWZ7+YYLffxYyPrrve
         n/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057395; x=1749662195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=HhTc4jrv9CdfOwvfZJcn5afQU/sI+uNJuk6I1OcKKaAhUfcItLqJTGejMtOprh3rUK
         Dzvhc4snXAViHSpQCKi2NxP51Umpjejy9x06hkUjC2gXns2dPI5WEqTMCYdZww9B7LMq
         eRbgXTrTCxR5kjEAlMml3woEjrotRAwE1pK5M3qLZLw6fs2e3u9I43WoL7uawUgf15zx
         hpobqUy9g97CiP5yAotOh/nAfLcg+irWHTLFIQCrsAqz7cjauWFfm3bowRBBoQ8kPLd1
         t6q1wUuyOadXXBUiZR/NEzXnwQXAP061k/jhqH5FMH7sZ/lkc5a1J6gv1YLUUm4X8Qli
         EL0w==
X-Forwarded-Encrypted: i=1; AJvYcCUj9nSYP6Eqd6AsblBMuYkTpCrISbYJKEVrY6brvpFVPujmGZY1MEybl2xGXwFLlWqb8W11wy6u6iL1rA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGYIv2ER1m22KMbvIdu87RRuUl2UGUHeSQ2bUVM26q32AUXNw
	kn0tTxZWKdmH8qdbNomwC+//qtpjMSZwq881WwkbU39Br4Tiv0ZYNpMeYzBjThTsdXM=
X-Gm-Gg: ASbGncs2QtLUujmAk26wBNJDTTFbR9ilkXak2MfVnH1AC39wVCq6AfT5R26MFqr0oJO
	weYwye5WT7W24dixTSijddSibCdZa30iaBpVLHQdT2MvunrWZ4Q0n1UqdvBjpcUA2oT6PXaAL9L
	jsBOHPpg7FYzAtM0nomexqedSzHwyGHpfVtNNNqlcyOnN3c8AyHQZh7AT5cbu7Ow7XHue/AzEtK
	+CeIzGKS2+xl6UxA6wX6RC9szCZD8cZNbcIbg8EpFOD5iXnELz5ICJ8XM3F5mvT9j6vJzkz6PTL
	L4qt7ksTUsXYKw3pIKZkVn/1pXi1UvwpF4PHF6Gv9/y/usJuQtt9L51cbYNua2KsTUQfMets
X-Google-Smtp-Source: AGHT+IG+Qv2DNy5GUYLSr8qaMd4z1JKIMYQvC0rcwVPQ/+dBpmSSBbz8jQQs3wb6D/V0cK/kK11nfA==
X-Received: by 2002:a17:90b:54cf:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-3130cd31ea9mr4868567a91.21.1749057395003;
        Wed, 04 Jun 2025 10:16:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:31 -0700
Subject: [PATCH v17 07/27] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-7-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_101636_064569_E9884423 
X-CRM114-Status: GOOD (  10.46  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index dba257cc4e2d..f21c888f59eb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -433,6 +433,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -778,6 +783,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
