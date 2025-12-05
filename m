Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7150BD339AE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR35CMGMUQ0xKvO1YKVP/wdsA95MH02s2fZhdC977sg=; b=eehqBqNc8BmlNh
	cel6nn/H+eeANKORR7dz7+w+B3VoD3bIFLxdvoeDHBY8Eh3ROjuvf0B0hHesyvyI7WiRfTX0wXrbO
	zrjh0iaHMs1SLcir4tWul/kBx7nuhMK+cVZ8kzM3zP8eRlDEVwFXn6/vRY0YeVJWlY5Ev3hPf1m7g
	qy+sezlH3OBhTUeI0vLQD/eLCEmTRHRkqcTV8nADNBlu+kJcF37oZQqLLzag7hOeR7MYqSgRLRNjG
	U6n6WZ/LPGdRSFkWwyt08i9w0Yf27FTe5AbnBqPgWnBaFUS2/XUrZsgKIIWtqAN2bY87IHphfKPIo
	+PL5W+lx2zNZOAFgILZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafo-00000009p3U-3Nyw;
	Fri, 05 Dec 2025 18:36:57 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafl-00000009p2b-3esQ
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:36:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso2127551a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959813; x=1765564613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=R2yx+OyrZf/v20MlMMVJ10R3frHFJ7J4cHBjAHL8X+b+odzN6EYOwG5WJWHQ0VJuQY
         boBSIYNXkT9EsUZr8qFuvaLzKcYhKQNJxnZ33HSpnUr4fnjFFFRH8razWnsHjw7dySKR
         UnBLzAhYNf13WmlobGWN2VDewtNDiPTSEGOVUKPOCFghZo2sfy7Sgzf/fYIJ49HZIX05
         n9f0UI8u78rrS9WkbAsgch4BBHLml0N4wHxNlUgclZzQpDbMPYHBdXeBxVynx+n3HbUn
         teaDq8VBsUj5IcO4t5rRmH9SvIEUengRuUbRrSFC7w9AbUkKIggz8Jb1yaMHFBvv5YGc
         KtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959813; x=1765564613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzDCu7IaTRxcq9mEPcCPJw7K7qmz1vUabcyA8OBdm1w=;
        b=eJMTFwPj2Qr74jnQ0I0CspzuoXy6x0NXGRvSltuoFKX/JN/bf6JbsUHw6f1+O64K6E
         QkaSujd7mcmf/KN5BcDntI80IJx3brZQoLBVYxwTi9TUrzLMweqqrHY93+2KBvvO5ur7
         SSNTl4kmYdJEqZ899jj2Hx1lvr7h3efqPfuqVB/dJAzYhOlGnnL60t/9AJUdsKbgV+bD
         MGCgtRfxmiFALe+kpWOnD3G3qBflHe1ItvSyQwxzGWTCv9wcsx+9sN3np7iuBdcGNNyH
         v2EdRnYPF3F5aj+EM1f0Jr0T39ePGDnKbloUCgmWDnHlVNViURt23qymtu81ZADoJPLe
         DPig==
X-Forwarded-Encrypted: i=1; AJvYcCVaTTBr5yeQaLxX4CzihT5VFqKfSlZWJcpDBnjyotvaX7fOkh7kin+fFOv9Wa+/7yZpxukkGUBMdS4cvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+lg+lb4r7J/k444m/y1eA9UsJk6D09cwb/agpViH1BTLfA0dw
	nvUvNeorJpdyfFbgMs0v0QJV5625M6de4hqoa4owTNJcX1Rgmm4wWim07aowjDAHqvc=
X-Gm-Gg: ASbGnctWafY2sZSM1WuKPzdBUSc3woNvVDWrJW6dApXxA6nbveZN6v4rys/kEGzgrVj
	tZytiMOt5nTT8QP3s7T/q8ac56auo7fv1olDbR513l3oUODAv41iPrzeZDeq9ClmqHv9vJDY/9m
	Z5bjKc+Y1gK0B16r9fA92O/r0SAYCvwNbovB+ZZT1aZ9bm06NmVIbu9c5xwAKA1WCo2MPCBiFHi
	MFmRjmvh14HfXtPz59dAg7kewqsgaXRtU8wWaylFmFHg96cevvD7cwwcjoCDVRJu++5Ug5qfjs5
	vDhH/pxpt9FVSKOGCK6sJQuxqookQ5eQ++bU43cyEKhMoZL7BemKQ+9mH+bRtbnT26oFs34OOKh
	fHgWBDMUJu8BYPkhHyKZPaSHXy0VpHILtcTe1hulrG68dEwE7Rf/fbE4rbvFCO2M0AkSsiyr2VC
	7+7igfC6QF8/V096LoQvnC
X-Google-Smtp-Source: AGHT+IGMTXNhEE0AGobVo0Q+Qpcz65YU2t6Uoez+HvjFdTXQk2XlyYkBUQRk9w4i9DYExo/tp12ayw==
X-Received: by 2002:a05:7300:bb08:b0:2a4:7270:1788 with SMTP id 5a478bee46e88-2abc720149cmr114273eec.19.1764959812961;
        Fri, 05 Dec 2025 10:36:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:36:52 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:47 -0800
Subject: [PATCH v25 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-1-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=941;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=BfqrkDAmEYT+r742gKB+SlFctae91M/veuPAGWY6Q04=;
 b=wb8Cvp9WwhgSAwjQuZXG2bfRw8uKBYeoYJuQ+D08ldqWnIr/+SHvUA9MzZ7+c1hnN4WDZnkHs
 M6IZRQCZeBaCy67MIkBFvjWj4owucJIYwhEmnGzRtLdXw0MOWKyNECN
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103653_909701_C1A349F6 
X-CRM114-Status: UNSURE (   8.80  )
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
