Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A927CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn5pc0Z7pRllLUJDV+DiohpEIXuvCc3V6lsTnn5fGkc=; b=zQlbApJgJ+hCCw
	iuPJ2BDDH7SPdP5gL1dhUB2mPleMLdy/cGH3en580mJCCGZUZeCdlCGQGpdvMGWrfEyVHgGKwu+tC
	T0Zzyg0z1WI97KydZ4E1FV+MBJcBrmPwNkL030drYAl3iymTo2Ww8v5388OkbRbs5oHOADuz3pB6D
	gULmMYBKpvBIvpEnkCYiokUOeOgB8TACB2cgi5+xJXQ79j/Js/vss5nHIT8cL0J3hCRGEHusXQmZG
	l+h3xLUTnf1PH/YGJOwo1JAMLIdRikn3zV+ZAh33WzEtqzpvwJ59e/NTXuL8qaZuaQ6O0iDEOYbUg
	AkaXpwfCOnI2MvoKAcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWT-0000000EaIi-1pNf;
	Mon, 13 Oct 2025 21:56:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWO-0000000EaFY-3rdN
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32ee4817c43so3732607a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392560; x=1760997360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=ONvmBM88atBIhvzbHMyR9dV/RUwCTDA/bPN/oBUUc1oPEZ8xDDyH7oJWO5A1uk7DIs
         4YK3EBJ2WViHuV4FzS07dQO66ubKH7lSfEY9iqHfyVYCV8VRnf5d4hcMMLk1fRiytZNr
         WM39rfYf03HWgRQwdh/AkL0zLo0dpSFYRKeo/B/LlIG3nT2q0aajMaddSL3s5596kg9M
         t/AqB0UilJVlTN7Fo2GCYI7Rm0FY3xTsBsxQnYpCvDot39uUtM0a0X1Ny0V3NMphR2Lz
         8XVVtLOOPNEAtVsks5/CcUfJyEoHN7GfqJc7U6vjuK8wTxEwcd//INe6ZeiDNv/dYQDD
         K92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392560; x=1760997360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=SgNxGjzovdGQxNwjg70OSE6tY5H7kLh580xUctU8q9lp+lrRAXOEaijzplJFQ6S8pb
         poJ4eAxLmzS7TkexKy5h0wOD0umCD+6KaYqnY2NglqIVRkACxdq6CI5VStk5U3C+hCTz
         xyFfxxopXUYftexXQN5nZJnxN8uvfg6+0lhhpvlTKTQ+AaVU5xlbPIOhngYNRzaB590R
         Ed1B/4iMm0zBniHL+hwF3CSxXN3uwNsAWIXkjB4niOqut0ivJkbONhh8OgZ1P+V0QDuN
         u5NMzE7PtPNBfM+k03TD7NoZYPPZr3e3Ka/uOSOT+CH00WkhxK0YO4qoosoTBbEtm4DF
         TSXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVme8g7d4Uyq1KHeHlEOyuRJXwrylC93bRr525OcQ52XITecbEWdTOdFxnPtPzekdrI5fX3eD3jSNN6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfchUyVvdr+iZzVQYfhBTzkCrckEPbEStYE7TWWQJEI+m68kxx
	izhPtJyP+QylTXLMhmWc8wAlsU27kupB4k4stF+NTMxffKFczkChEqRmpBjyyxDFs48=
X-Gm-Gg: ASbGncuqMkOwWKKMcDeTxjg9M8Ak4M7CILVOh413yrA/raMtl34xxbmaHh+TjIM/GAr
	XC6Hgzs+ZHTfQ7RgeS2l8WzEEdZbTiJjD7uFxFbFMCieJz9AuhJdXGh/pAwnrAYY4dlfmXxAp6t
	C8Ds68k10A4vvPlaCRj5hBqSTEZjZVfeNtL29tuXYlok+QzGADRqtnPhKc7Z+eghxGG0WcIDaaR
	QbaDhfSoT+l5GdypWnZ2QbdXj815xRlS9oJqV7CvmAG3FYLv++t4rOiOyBzpwG887Z6IsUK5a+3
	L0QVNFyK2D45KDthVbrPCWF8SbS/N2kNFWwixv8SzQofvnH7PjfK8Y5NBsF1qm3edZ5SNuobyeM
	zxeOPWN/sM3Hcg8C+l8Ch1ULXmIxiCOt/Ljv/GgbgIPrkzuAJsvOJknlnM2uMIw==
X-Google-Smtp-Source: AGHT+IFqzpISbqmNZOG0bEFOm6WKZWXC8Tmhcil3Siykq0hDNGwZJ8D8UA33BLPp/sr08wWkDb8lvg==
X-Received: by 2002:a17:90b:2691:b0:330:55de:8c20 with SMTP id 98e67ed59e1d1-339eda4935emr36148338a91.2.1760392560121;
        Mon, 13 Oct 2025 14:56:00 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:55:59 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:55:53 -0700
Subject: [PATCH v20 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-1-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145600_965929_74EE8252 
X-CRM114-Status: UNSURE (   9.66  )
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
