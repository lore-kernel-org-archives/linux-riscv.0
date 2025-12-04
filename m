Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723AAD29FB2
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR35CMGMUQ0xKvO1YKVP/wdsA95MH02s2fZhdC977sg=; b=TRR5V9lnC+qvJY
	zbtEqgGtEnhA9bNFlMEYkKRLlM8cJMlFeXaFDES2fQ/nJuwrPynMdmjWM3WFF3WhxJ1AfCKBcOCc5
	J2w9H5ZmfTohVCGf+7bhFKv/RpL0eAthTZInZmFdiOni8XQaZO8zOdqpwBkzpq5pa4CH3/xt3uZgU
	/FIYqO6SnnthjV72fA2yjGutE1iVDIjNjuyRmh4SbzZmJejwUADjIBlmLOwt69/jbXRkpJCRYihdS
	kuuPr22s/ADcR8nUnw8emAmGoIqXySaJKkac0jVJ/F3OCPKx6qI8Cc89fPOUS/vAUkkobMU+aWE1y
	YxO9ON3J7EcxhyKAontg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYa-00000008Y7i-2ONH;
	Thu, 04 Dec 2025 20:04:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYX-00000008Y6m-2M97
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1074561b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878641; x=1765483441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=GGn4n4YVERkYq6I7eEeQEfLOKwNMqnkwzlYq03RVDeXxAOsN5dPH9IZZsJrOMJE1T0
         /qULnQtDYg3dc69TBt9AO+BwZSmzfVxAtjL06Vhx0o2yNuB0vR5jBL96FcW1vcDgh5Xk
         QW5ScvoJR9m0lVrBbspzTbscpGDj13INzVF2xys3m/wF9LVxvO/Jqa/4wDsmYa27Spqf
         LAleFBYzblNFILDLlIyUbMbEbeErfQOTo9fnbUlI2pm6Wp4qyEQ53FiKMH13inxhnQVk
         yhDDT7oWqqB3R8NvtgC7kpk2cF8jXNGJo6w7LoQRpxw9gwukJFEd5kl8LcrQBB3YBuW9
         t7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878641; x=1765483441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=GBH335Fl3JUbn4iluKfK7oG9PTZ2xA8TZgcvqd2CIcYmZOvn3cONU07EMGugE4mB+a
         cLOQFJQw4MPXtkJaKcSHR56CB+YtLk86BQBXo/O952mqkzmkvYxdkxHaaaNL9ynqh4Km
         XWFA5T9BnXmPfMjueV9ZOEK+BbfsgO63aLnLuMpzDVDvIKsy4dZNLNMxvUfdUWBQa/q9
         CbqKJfsMfDK6kEa0glOdb2ZAone+LvDNMTHg8i5ijKB+Y1UAW1iEmBzJg2pK4cfbkI+6
         F538wOn5yIQEZ1kbQzCKOPgs25fFPNfUhXOyJ6M2OxRwVSm0wTid+1kCjSiF+TQn9GeS
         COtA==
X-Forwarded-Encrypted: i=1; AJvYcCUqKceOEQzG9MtAdgSYSefzlShkDJgbQQEmYaoPCV5O9vaGWF2QbQe3pPLloE6aB8EUOcDbwSt1n4lYgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqSQ7JkAJ+9lvkFrbNgSjNxr8O6rXXy/QAgRe6UFFC+lK1SYa
	Kr2G63xKGqT2XBFBXinlECBmvGwadRHBKEFuvSi7KHzDhmFY05nmXtJ7Na5HKslEGvI=
X-Gm-Gg: ASbGnctDpEHvVWTkkA4Xz6U1IIigcKL+lfiOlQ0+ITdyWPQov0i3c8txaaZNMnRIbF9
	FiX07XIiPbWEsEgYUtK4RXCqGwq1YfodrXXAvjbdYvSn2zYTXqMHQ5R64SiNqe1tQLmTFrFxcc9
	TVJWezWcabTT3ujBBfJi7/fMt/031oLocXCEJhPIOn780S3Oo1v/VhNmBwwNTiCJf2YD0yf2do5
	s9E9Qler2C/WkCzaUyB3COw+/AvOT5ADaH7m1c1ircP+EEm6JTgQSsPXqm/T/pPt8UciJdh0x87
	q3BxAyV0Ae9Qm/Tcjy5wO0ul2wZGIpfGE2qGc5v/C2BAH0zBFjgfnAV3vtU1JU4oWP3qfOaq4lz
	eRHW6MkQ9jkGOiJpdjnJ0guvr6I9ileqbNq9tvmcOUTa82CQGXIckYwbDtcU386naoHcMEMz0z1
	Ff8BxUn9rheQLYcQ8r7vs5
X-Google-Smtp-Source: AGHT+IFS3/LyaA7r+iO4CE8PdPOdVvp7/Ont/dyD58FlxgFclLSqiPQIEE7yhvikN0vHy7ae7J+lfQ==
X-Received: by 2002:a05:7022:925:b0:119:e56b:98ac with SMTP id a92af1059eb24-11df646417cmr2797504c88.19.1764878640495;
        Thu, 04 Dec 2025 12:04:00 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:03:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:50 -0800
Subject: [PATCH v24 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-1-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=941;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=BfqrkDAmEYT+r742gKB+SlFctae91M/veuPAGWY6Q04=;
 b=rLyoDrCEHiggT9VGWh+AV59ny1tITwEdtsn6xQ7T68CawzBV32k8ccRrfNpmgg6pBQ3jSqH1t
 By7DryeDPH3CNPKMe3XDDQ4h9GMvBJsJm+XUidd42pvbJxj7L7UGjUE
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120401_621320_5C1FB921 
X-CRM114-Status: UNSURE (   9.65  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
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
