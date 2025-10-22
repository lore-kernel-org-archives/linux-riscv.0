Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF5CCF9E6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn5pc0Z7pRllLUJDV+DiohpEIXuvCc3V6lsTnn5fGkc=; b=bQXY58RCtKMWfF
	22FNeLhsnih/a3mlHEP+VzQJRImX2ck+qHy0V47/wcoXs8bLBoRWWrngHjRl3E48MQEgDZq63f+eY
	qadEDmRBuNmurbrp7lZ49+5i5Nv6ZmcjInZhaVRwqfi3Vln5j+nSq18TNc8mDC0yXE2YYaE/tYajF
	CPtFmiHOhPRnUgl+VNA/98YKgLD2ClR24dUuE77emEA8YLANR3iuugZmnb+8gRiAzFZ0IZp5ZXp0O
	vYlxYeimfYxGt7lyOzVyfs63CvL/K6BLjx7TYWKOL0eoBp9EYxj/e4F/TKYDx/YOcB9ic6SIYgE55
	9cNU2aBF8P5bE3vLcwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiH1-00000004YAN-3csu;
	Wed, 22 Oct 2025 23:29:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiGy-00000004Y7R-1GK6
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:29:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-782e93932ffso174436b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175779; x=1761780579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=eie2iHqWBraLG7QOFaE98V3yACkZbAXhXX06Rb9oxhN1G6M7gRyTz+KT8f3ZUG728a
         g59ybqKYXQjeWnJvIlTqIySz418GQRj5foZLXJdWNmUjOQTsHmsINf9yZJsHcftJMXgg
         6j8fUlqZlWIioNoQVk3ZVXJh7cuEOh452xWbweIP3+b6wFv86pljEfWKyeP0vbYx/lH+
         46PN+FSzce1N7itG65o9LHvJVz6LwdfyqypSOH8X0JGczKvhJJdlmuWB/3nf8bsjFETl
         hIK/ey9p06qZH83TPbU+94C2c08Ln1DxN4TwU7Z2hve3/aPO2HtJ+NCeJDq/STB+Ug9Y
         GOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175779; x=1761780579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=vlJOFXceuUCRZl94Z4MQGX7B4Gzo1d9c872RWJeFjFW0+iGE8EyATtl6Hv4U4TlmHS
         zT+kd5pbBM0Mvun4cAhDsfwZVzzcYk4j9/ndAwoxWuHNUgFJ+B6MLxQkOq1am3dtvvv5
         kcrJ2oPhwvS8P6SAv6msS3D8/7spteFnOu2gNfWSI7EHdxJM9uIJF1Vlo+f3grTOhtIF
         hkAdd5hPW4BM46h8gI+gcwRmRWFZyrpJOfiNuj3Z1inrnsrxv24MQLo5dd+T2O23uT0X
         tSZGutB55rA9ZGqXvlHdU+KLLN1BVXpXNwfTkHmKOSJRKi23215iEnMvDO5dz/aaJqVx
         VGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Atu+zFm/Z1Q7tEJqC4bbwSBiGLhWV7LndDbODEVc4m7y+WabBaQatzjXLZGOApGVvfNs9JVodsoe3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNHGbVMnXeyVcT/K87xyX9mViuuiw4Mmdw52ZEDSWXxodbQX9e
	+jrM+KFREBzwxHr1/jiCaDDArD6PX7RFnyyJ89pw+Ll+Uli1YZ4xT63142EjMY1F2Rw=
X-Gm-Gg: ASbGncvJuNXrQ+e2BPZfm5J2fGejqYBSX++K6ggJ1ffq75T5ZQiy0Zk709VIJWc3h5A
	ZYhSvocCYxcvcInOtTHFGqH+oWB4WCGzwe16Jjcri+VJygv7fItWqllzP/MZd5VaoEtUVf82GKu
	VC5mWi18zY7fJThg3nG5Li4TIMplSNNVZQaegoG5u/Y5tp7LdHIqPTCwtOtUAXjSXYkbUavycRq
	LPe+gChQ0WOlxKxnU8yunCwI4AsvjX+7s7SkTSi4wUFXgUCvQKXdnJq2ilLBTVKFpAN+SXPORzr
	pLNk2b9tQZp1Cgi1g8ZFrENvS6X0NWlmpm+Xy1dvN/B3BqErg7okBO22U/1jP47OymQhxDT4x+t
	ntk6j+0vgkrFYHKZck9zchRvMSrXG1bhzTJMCYjcS5SgAuVibW/ESS7ED+PooZqBO/It0VsMEK7
	ew80axqlqr+gw9REOGwLfv
X-Google-Smtp-Source: AGHT+IH4ZZjXE6CRjcaUUDddOYCxWrMkikF4wXTDboM+YAeQwS+9+Z5nilbrQH9D7uqvoUJQSq+yZw==
X-Received: by 2002:a05:6a00:3e07:b0:7a2:766f:518e with SMTP id d2e1a72fcca58-7a2766f52c5mr169475b3a.23.1761175779371;
        Wed, 22 Oct 2025 16:29:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:27 -0700
Subject: [PATCH v22 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-1-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251022_162940_345276_1686A531 
X-CRM114-Status: GOOD (  10.03  )
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
