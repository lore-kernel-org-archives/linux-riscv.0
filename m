Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F215C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLIh9CKviuBoJrTppI42yPS0qCYZsxF8DpT4gPKnTEU=; b=woUjt6W8KfX16j
	CQnt4AkAY0APUf0osHzEozxy7msIFu1tvLMd+mCusfYmX8tiHezY0w9Ag8NwAI97ilPDBvoPXe9Hn
	eNJhv7eekOmksrFcGEKmH15+69RP6/xEzxWrPU6a2DgynYQE0QCTlPxcGr2BRF1KYiR/ay4beKFyZ
	Zuo5bhCI55sNXQ+CTIajuKe74yaFMFaVAETuqBGyVkY89WP7z97ckPB0s5fH5jvd0VrcDt4wsOkyr
	GaIEIZr14WI9Jcc5vqyVEEI95eqsDssr3c1lyNf7x5UFhbAeDX9NaQxOy0ERmESD4FuOCev+CRG7I
	E0RjUd90gtMC6kDm4Keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeM-0000000FoPJ-17Rd;
	Fri, 11 Jul 2025 20:47:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhJ-0000000Fg0l-35Wj
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2267434b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263177; x=1752867977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=Jrn4EgJKzc/uZxMbRZTbf+UVy1HCfoA49kNSUp0FxGXioM5fTlJKdAJdHC5E9Vdcd8
         UsmV47aS2xtiBLAHI4uL+6H0NlTuaexpQB81Ck14SjT8oOCUsFfhds4QvCEXJ98w/S8q
         5lTr8HUTCd1T/8gnuUWU4bIKhFjMfP09Xn2kUA6bh2Y6Z4ZohhEeyyYLkCkxhdl1OrlL
         ZRbshCSZ3blqVKMNh4gwXdPER8YWv7Dq1sCN6am0al2bwhXFpxRl0BHv/oISuUWXbixr
         1MyT0pzAwsJweTFwYT/1nUP1ZtF573sgnrOYuXwwOuBxMslo8ExMQWfeYiAWRc73UFdk
         BSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263177; x=1752867977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=fjW93Fl1dDQVsdD/X6qhJruHuQYqJIFljdFV/1xrwaDmc7wUDS0sCG00K7du77XMX/
         ZA/K6NjPcY7RyHhg6jB4oMtkTZwkFagHAsipYyxpkDJDqNNXhFX2EWl3hip5hg8W/SqA
         np3dXuhzuYbK5nlgemdrRmUTZuYSkcA1T8B/kSZ32JI1tuMp/4YcR+P6vTxD8L0NfTvd
         Lb9iU+mXLj0IFHms5AaB18ViZnf5G1Fu8fiPxR6gBHD7SkDxNoATaWJuDOjNf+l3+XvI
         cxQ0p17+VA30CDI3m79n0mfslKpcjuZKzRF3CtLhbg6rv9CLGYhEm3Quv7h/3jEMtSso
         xKTw==
X-Forwarded-Encrypted: i=1; AJvYcCVpJEfW7VgMxSBNhoLig7V2eu2RRI+tPxA2qCNx5np9RHXbJ4cIvS41zqCHF9YIhi+Rr9tJe6nFzud5lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybHv1tEKWansY6PxhjC1OS0uizxeH4H38xMq+R/fVdgyVtyQ/O
	y7BBqaQRHGb6pMnWRm7qcu0myotcUB9XKqWbma7dBf2RYW5mcqmrdf+xjrn1wUQ/Zwg=
X-Gm-Gg: ASbGncsZOlXDpSJXEAG2JxFxP5E3jMVV7mHD3O1cy3+tUfBR5Z0b/aEo3GeH971LRzZ
	NWV2diEg8wlXysFA9P/uwS/srzCRChwtwyAa/5SApD9sm/ulOsnfYasdqVCiYdmwTUl7jmq8rxn
	NzWDQ0wgJVVP7RoUdnKSr3pc5Mn7fyrJFbmdj8xcf/tnC8BkBD74HSGESAWHrOKea3M0hgeQ7EM
	FbzMrc8wQdgYr795hAuun20bxAMw/1cLMs/dO7EDC11F3kKHoE8KAXDYuOgBT5+mY/XqImNaDCV
	PCHBt00C1gxIujvxYaDKjnOyOA/qQl9Cz236n6xCAY8ySt5ZmEe9GOk99mdgzBY04iztaukzeBT
	I/orJUd4nVd7a4vhnyXDriLcOnBHDg4Ade7kuRVIy1bg=
X-Google-Smtp-Source: AGHT+IHiT9dG2vPXDdmDzQOmWqgagw8g0E9RV6u9tAfh1pEL4PA1GTNnT+r9tqhN9VGCtBB45cyRbQ==
X-Received: by 2002:a05:6a00:b90:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-74ee2c51089mr6267738b3a.11.1752263176893;
        Fri, 11 Jul 2025 12:46:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:06 -0700
Subject: [PATCH v18 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-1-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124617_787409_666E43FF 
X-CRM114-Status: GOOD (  10.06  )
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
index 0ef2ba0c667a..eb48924105c4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,6 +353,13 @@ extern unsigned int kobjsize(const void *objp);
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
