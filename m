Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF87BCCD19A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn5pc0Z7pRllLUJDV+DiohpEIXuvCc3V6lsTnn5fGkc=; b=j0EwrTyfXxAipe
	KI+bzdarGlVTq1YHwfpDJjlklHbiViKpdsqpKBhP1fpP2g1v5rKF01tBc1miqjRF94p0cPvNHyyq+
	BS1P+cGV1AH31ymqxvPF8jLthrnQM6a+GsnlTOVGJalQIQ9h5WaCqRiFJegunr8ZX9hl3k+Yc8phb
	52kD//t5LGyygo/bdO7oC1s1MNNWLbQ15bu7g0tW8JTc6ZspX97kRyVndgbEiAEP2JgiqJ4/3jnv8
	oVm9AYGNCoEhWexgQbGvOVGHKvEMdPLfzzS5KMSnVYpzUXwJ2OnTLDv3OQpf3KP+l/ziNyftU32+q
	bI9YMZr9YtNvVFi87wmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960R-00000002WiC-2tEi;
	Wed, 15 Oct 2025 18:13:47 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960O-00000002WgT-2oR6
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:13:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b57bf560703so4523486a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552024; x=1761156824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=NEmdzfxxfrenHw2IXk8CIABfuBjfk+5lvlc2gI31zGb6h9fovRL1VaCGpFJ9zHXIvC
         e7c/wwgE/0TEZyxvgb8ooCgnABW8yO7DQ9G4uc6RA4P9L+7ABWXvc1exU1CpgJJCWQcL
         BxulJYMN7BKcvQSPTT3gwPy8cRF8OAzn1awDU/QGgkEhc14bOwApTB/htvBuLrMuBlwF
         qbv581a7DHsIc24g0WGop6mX7Tuu6wbxLr4+1GiGxLzriqo9oky/liMJX5m6Bp7YTrJY
         EI0xkLAIRra99XpHks9b02E9ahc8ZsGAPG2bAcf2im9vMTGdfJqGaZgjCSfPzSkrTMpf
         89rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552024; x=1761156824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=WEh1RQUgOOjBnKERcnr5MU3aCB9sJvDP+nG/JmjZN3uH3T9kaGk/K9IR54mHm1kpqY
         hrbnvxl6WqoI4iOixdj1IUKSshFp5ccPXdU0FktpwgmZe47J1I1WQMrzrD80Ey1jznaD
         7ys2sDzZDdimRWt644KbGxK1+WKVjeyfzOlLfvpLpjB10ollya8/Ej2K+Np20NWmstC+
         qNwVsKujeJh5LCRJh1An6wf0VGXJDJICKFKPhudX95/QA/yx9pKJvlJ3n6Fm1kdVeUFl
         b+Qg+RHRZlElfWprAIpuYPd8ZF7a5VMCt5pDTfTy4EbCraAhf0ksRqjL5T0aC9HhZ/1c
         NPCw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Sug6m3uKwcU+EllfMRotnuSRBCIQHxKu/iZ/bs35pYKSGy96BiYKmR5i5PLBMaCJM736ztP0b0udRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtkQ5hVPeG4R4CYz+Gr4gwftpzlH8u9ShpnguW+h5AAq081Aqs
	LUxK0yGd/1mf/SsS+G7EdFUBdaW+k513ykhHox3/N+heqeSgXumWJjue5WPKrBCxhZg=
X-Gm-Gg: ASbGnct3A7Uu89vWwZh13im5PyHgHlluwOi4EnnYM9hh6dwJejXh8tca2xuQytivAZ7
	YKSxJtDnbot7RDVp8/WC/jGCjeLB6E7D5porr5bufuUL84spfijkhz7h8KYinZPC9WAPhOhUgaA
	mGrtarsi5YaXeAL7guVcfc8wR1QhponD22HJqhvtXy+EOrTe/8UN0vMSYU9iaw0axmx9LWzzm7C
	VsB3sjCTdl5IOsgnSvDJfRPsxw5xGXHi3ghgYrSVMWOmq1tp2dUFJW/aL5MMLQ7BbOg5tE4NLyn
	77fHymvnOcshcM8JDj6UzWV9MUJ88siLbYFsNx+PBQ6eK0NrBnL5jX4mkH9T88+mfc6I6UyIn+X
	dCbRxC2b8FTqAhudwz2Tk39bX/FrZYPviT4FoWVEBXSWIHtdwcJUuErwnuSl4sw==
X-Google-Smtp-Source: AGHT+IE532Sc+sFZCiNmEvoJegTZ+cHh1Xu19llh3mJ+MHzVrRYzHyEQ1nhDnGpeZ7e3G8zwayd1Xg==
X-Received: by 2002:a17:903:2c10:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-29027374b5amr339106065ad.14.1760552023763;
        Wed, 15 Oct 2025 11:13:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:33 -0700
Subject: [PATCH v21 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-1-6a07856e90e7@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_111344_753283_777B8952 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..2032d3f195f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -380,6 +380,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
