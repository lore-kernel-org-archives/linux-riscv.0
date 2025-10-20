Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6817CCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8j+peV63shmNw1CIvLBiXP+ythnNQu+HMfQDsn3XJg=; b=Bz2X5Htw0IdXhk
	V4ApeoFP8Ff4jNuSaLGCsk83J/BFXMQk9IcM2CayPju9F5SGf0b5AdzyaEf0Mlp0nquMIjZqxAuRz
	4/fx9FJcpz0YyiJxiiYqZFuJ9dLnElqwQAqRUaZF6ZXQeOCzYEUJeXxHCqVf3bm9U057bL0Y10lNy
	h330k/6YzfXXKEx0DMM8ouRwG3IgrEM+DYD4CG0G9EEUuP1GtFUC7q0rexq0JvgssHqhTvf3vD+ip
	Wx84OKQCxwDSBUOZfanUnMjnKz6Ur+76DW+21ceQB9fTeJUHXdiKaqzNLvi+y7YmEmlfokBKtZX+M
	1tpq8VmHbXiuUtFaKecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwOw-0000000Esea-0DJX;
	Mon, 20 Oct 2025 20:22:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwOu-0000000Ese5-1l9V
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:22:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27eec33b737so72139875ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991759; x=1761596559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJyf5Mfx2dyzbSqpH6VID/K8048gVV4D981NLyY4E6w=;
        b=MVIowrTFOXqnB4qNHAF85cV3vQGbXUYTNCSZbaw9mQ7R9keCNssCK6gH2/9XLht3mK
         pk/sYy/VQIEwa34bc7r2u+3pKxJfW/f1cAK7MzC3lJIgQKB9EYH6PSHsBvAG8RWoBg1A
         LjkPcHYJmPBapys7c7Z2km0q39Ht7Nn7K6u5eA/SGDNJBfH4SjjHb53jalv2/5LydwVb
         GGdN2IGV/g+4PugQ2N+zp2JnFty6oicYVeCh+t5ucsB1d0EWhdQLC1Hzm4kWL2zQc+Rq
         9m3SMSpGykPzsgI6TfL5/1YiUQbA44CUKHhW2Fq1A+N0EhntUMNfrrDYOScLRiexzrzq
         VU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991759; x=1761596559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJyf5Mfx2dyzbSqpH6VID/K8048gVV4D981NLyY4E6w=;
        b=w8tq1XjCQjv9jFc+UYOmq1W38VdwO6ICHbtAECINy4hNc9WPRiMO57IsDRRT1zpYpU
         qQrHjYL08LGYNKSeWCe7No/hjo9HyUKMXM5+j6lOR7WXvUGWSqzP80a8Zei28oWEBawl
         L1gq10YEO3smyUf1xRHKdjj19eLZCZ3GbKPQMo5Za7Lm9YuOTyDuBxTokrS9TThd75Ie
         fUjfM0W59KEviDcLIl6zaMDpQxwLjMp3PdZFh/PSSzo5EV4bHCO5RmPwjvREQKB7AC4q
         OjqJgk7owjHiVTbyX7A2UxUnLAPteL/VjqfYfU0jYVeApX5aj1fE0abLMC9vEWxRSJSW
         8F0w==
X-Forwarded-Encrypted: i=1; AJvYcCU9My7GjXUtd0BRbFqGYl1uK3V8n63kcvaKHXLGWvwDDysLMUOSWsWkTOz+7XcbeOEiqW3r6wcDa+hioQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTTG7KK6Z5fMt8ovDgj4915nZw+ktZw3ditSI7HRFoSlOsAgyG
	/aQLeMYeENMx3emrB7iFk+2iW1XyqV/pD+3zqD5cH+I/UH1308a1jzjOEE7MQmIP9SU=
X-Gm-Gg: ASbGncsYwZN+41UzUgSXb1luyEVtwdO9UIH/lZdJdTb1GZ/I5jV9TjfrvJurLAYl30G
	C3TBWLnO2hQeuhxOZ+EOvX2Td1YMTsOPX8hBqm3kkD4uHV1D59AbBbNMnDnz2BPqFkZf25E39m7
	0+unhhzDSqXQx6GU8LYcO8d3bbAZWNPIpaAJBadVnxtp33HZLVEbRhZllsP2E25DrIT5m8/0jKb
	yXZ5aGOlpwZOSOIfPmRnRL4S1X/krfhkxZdGsnzw5d7WxEAE7Tstntil7nbGl4kHq83hi56yhM2
	eeCPwuTL7xHpJ4a6JUR6UujyM6a+WD3Zi5xrbaZLEaJOMk3ahaPTMoyd3oeDIekRgFKq6xpj6V7
	fM4JXlxsJoJ95DUwmQ/ku4wdiOlLx5wIVxPr8acTdS2X+v+qWTLaltuSFEN+yBcgJP0xtKHIMmy
	n4dmFBqKErPg==
X-Google-Smtp-Source: AGHT+IG6TVxooarevlSjW8zrVFT+uyU8PdreEG2r0xgjTATLXR8OeKKNJ35yKTRzDmtjqbRnxjjd+w==
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id d9443c01a7336-290ca121e99mr205845775ad.36.1760991759471;
        Mon, 20 Oct 2025 13:22:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:30 -0700
Subject: [PATCH v22 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-1-66732256ad8f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_132240_467039_3C7CCB4A 
X-CRM114-Status: UNSURE (   9.82  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
