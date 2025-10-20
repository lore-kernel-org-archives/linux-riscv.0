Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6ECCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn5pc0Z7pRllLUJDV+DiohpEIXuvCc3V6lsTnn5fGkc=; b=qZXxbJkDf9I0ub
	Gv3+hj8YPNevA0L3ff/cp0XMpenj2zg3h3PSxy/7T3Q03eteqLMJPRYep/EepM4v90bHPcbQXIBvE
	bAlrz0Wnuf9FFdMKSkNtHPMIbYOj6xkbOwkxQNK+X6D15KjvAteEGGHHjqVTrH9CyRQJk22gzRn1y
	VIfoQpgTmWOBL1blFF/P+9RuDKhcQErBUJj/rsP8YOW9C7+QFgj68MLFmPwRbfsqebNAMD6iyqKbV
	IjJ/d2JhJ8cVyd/Sd1ptYPbij3u0MM31DttcOMb49r0/WRr2RQTbos7xeVUxMF8SSDiNZP0ZIc0uV
	JQgkAxrU8HpWlKdJqoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx3L-0000000F1H6-3b54;
	Mon, 20 Oct 2025 21:04:27 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx3J-0000000F1Gc-2nHt
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 21:04:26 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3c97b52b031so2675926fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760994265; x=1761599065; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=Pq/0VjQlggAYCfICkywCsbGDyvFIYHuSjg3Q3p+p4tdWnzTIRf72GFizzpxGfjCQmm
         pSJmYL0mwUrJZGXBCbaFfHQ1hcNVfwlGm4ibg4XOm9Ql97RrHV0JedSXIonguHltKCQZ
         1PrWd0dAZ3izVinyMJ8dq1qH/Qm6w9rvh0ReXM8XZHl2aihZ4E8qjewl1zEMweDncEXb
         PSBUEHxuDZvq31pGp/PAnfoFcS22xNksa0RkVXxxxTdwQFzgOHBwHIu6WN762mo2/HVU
         HFiTQSg0w6hHocbiIuRZJl6KdEWYH9lTh4HYe/JLhlvQLrUXzX9mPa6UcBNhO0+zJjV7
         +4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994265; x=1761599065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuPJu5G7SzSWQtkc01838lduYo70q11KgqBzT6e6NXg=;
        b=T07xnxiTPepZ2I24z4eACHYo5d2zUb837jCcKjKnvljyZ3WCBWjOMzXhNJqmTChRm2
         C3Qi86zDPGffgDaMRls2lR/fbStui0nVVuj849aN92E61RHmyVLkL7EWTu808RWcwQ7j
         zWZpgUn/Rj5vP43YHt6/HAceWsvCcgNyqMMew9rxAq14zFKRPMCcE+FVWW3WKq0ck6p/
         nI6XBZZodyMuIoWrH7yWhpdvSN2JVGqI4gmerz6LJ1iA85oeKo2YjTmhDW3OUgUvFEGi
         YH8D9U9n9klolszScqYJzU+UBTGLkKXrdCWMvmWPpxWerDbQisnMqyqrLml1HmFUBy+2
         d+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX/mCUawsJh1A+vmb0TjNygT5J6IB3KucfT1jqN2rnGqIknDxb8Z+V6oipC55rFh1kgIEQIuL5L40J5gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxjqUASlHnPOp77qXYX3DeN7CVpjQLr4ZczSlvYLwpeYlQr3wx
	XLEbilXKZ9HpGqhAFGcyt2Ni+b2iiZqrLH3nLxS8vRl37fpLGNmTjkuDc9ToF6HzkHCJ7pLaEoj
	L8FTP
X-Gm-Gg: ASbGncsph4qgFYVkU436I6WQ4u8yXeOt1svl8DmPLbxTVMsI+nvyeihw+WRBRgtyqFM
	v7AVPQGVmfYii4oGm1qv405Qoq2E0POEq5k9Tq0fOhOG5M66c78YqwNMFku/tNWb+lX6nihTpR1
	azEpBadMJ30L//rWeydQXEe8R+Z8znfzRybpFhQ5ffpgX5pK2MyPxRpXzEUngXzOriyCJMMcxAP
	6nQS1jXmZcP17ZKugng2fN9b1uDxwA1TPh0R3P782pt34SdrxjmKcaXzCUEL6h2fNTyOtvNBpj/
	wXfWuqdToIrULToH6xtkuQsEJwjvrpgP5FEZIbn5PUo/UlgBTqABfULRzEimqnqj+Fuv3Fh2MVL
	NfL6WyeMJeHbScIVxvtvAiL4Y9P1Dp7r8TVB51Sh12pkLG6hKFahX4HxlLkFDkrm7ZCLn1DMbgF
	plxEsmLaf/qKtOb9qdpatF
X-Google-Smtp-Source: AGHT+IEsg+UZtjwN6GyVBaH9enzTC3xW7GiUIy1dtvM7p6mWAAST23WNYHXDrDm86KscnwevzOzJsg==
X-Received: by 2002:a05:6a00:a8f:b0:792:574d:b2c with SMTP id d2e1a72fcca58-7a220acbcabmr20617941b3a.15.1760993616488;
        Mon, 20 Oct 2025 13:53:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:30 -0700
Subject: [PATCH v22 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-1-9ae5510d1c6f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_140425_703488_8733B747 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
