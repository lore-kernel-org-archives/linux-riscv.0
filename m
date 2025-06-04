Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A6AC5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC3vhOXnZcaGuPIuOOodQnOAY9DkBzqO03LZJV94UvE=; b=07BAETgmq7b0VA
	lmcei5Xyy3qkuT+Tv49Zs1z1hXaZUGystq5bPCKh84PrR+wRB2x346EKRoIOGEWb6mBj5rYZcdLdd
	VBP+VvZgiNLXr8i+rWS9ZZHMegyeBem4xHQg2OUfGhfnYTcaH5di6OIEW+KSLQ48ZfeGnqzGS1kJe
	ggBAQm6ekcoyK9gITBP35gcveLNj7ISMwJjd4wUWBL7FbLXrDKRRLPAM9zGA80b5SYSbSUX+q95jy
	dWMXDihkHKTO1QfI1W1YCQ3wuNDxKHoKmzM8iNPVJXWYPwkF8Cn0lnTqyQSCBCcy8mRzWU5lCQXzl
	o9txsbC8SiQa3REurDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrit-0000000Ds8Z-2KWL;
	Wed, 04 Jun 2025 17:16:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrir-0000000Ds7N-09PK
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so92742a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057376; x=1749662176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=fn/0kpqM6fJ6UjdaIz6BqzvCpgW1svDkvkJEYYxCN0VDnXOhsAYQhHePlYg1B5swzV
         32PhkBSTaCwJ2izAEFAhhGw2SXTx9ssTiygdyuG3EzPD2kgN+NLZPasB+3JZD1tdPVWk
         qFBu5ONmaKZOsvSGwVrvvl7QfR/UUZMaMg+VaaOT3xLHHyaYKk63pkxCUkTmZRBlYJUf
         vxpkp3pR2GIDeRIy9qLrh+WWr1D3gX4gEYVwWoTMZ4qHluguoCfAVLVzb/oxignSD6ZR
         y+sxB5obBOjty1fn1l6X/EF/X/qtusAKItRK02zJ5IWzU2M0g/G1G1FeUJgAXSOoNcNd
         fhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057376; x=1749662176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X54j1g90psIDWU5pz15Bdf5E+ehG4+aRIqU9eaNKxE=;
        b=YV6hFY1NkSVA2M6AkZG/6ikeW+3l5CewaEnDBzI/oSYAFwau1TaXqKhb1BdQj3/J4+
         T82gEXWAd4kywkfMcRv0InAqMIhG4kxQUzg+LuKHMpuoWTd87VzQe7OKyKimrIydJeT6
         sDf5VQDrHdsP79dM3Mi5Uy9odYbO8buj4b7SjedeDdSIccdgwgxdEclaFvb4v8g5f+oD
         DIbJFNofKHZ1wgWvMnRPb2xcOpVGSLAADMkYGqQBxtf1XgnBPmV5zYN7yaMEqk/kPQ/p
         leMXCDKHccrRw0sidq3ra4XaCtyi3vnO5RbWZgK4UFxNr7WUdKx16lPrayH//FpqlL94
         kwhA==
X-Forwarded-Encrypted: i=1; AJvYcCXHw4/kgPDKXW50khQ+p+zXgnehgjK40mPpWQXlEkRHFjE5CTAufaMVefmaK/EU2PLvM6vQNKrSwaCiOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy94UKgeL7khiQYH7JmaVaCdalEB0fTOJ/86JHBW73ND0VCohr3
	RBlrnIE+SBdrgra/4N1JFZA2tbCb5oY7ZL/xToQZDMIrK7D2yT9AWSJQTPmlwNj4V8s=
X-Gm-Gg: ASbGncu0PEbZBF4JFSwKZDoADwxYBvlR1Er9JVp3vQ1pdJDmcby4izTTFbTSmL006VO
	PErS9oDViyUfuOWHe4r6vXR+Hq6al0eq1++bggiJ3UoJR9WG5toz7Sq1XhWweAgIwHYfkxGsit7
	VaUmeX2Dm7i3UMP5/NfMnTdO6OaAd61k7aTG8OpJH9FUq7L4u7sTbNoS6JT7SKRBVjpAhMKbOa5
	s67ZHGTy82LmtzVVuBjVNYM1pglWW+PUp/ducYCPZ6D9W67ZYBbRv7CC4GTyqJWTb3lGQnAi8EJ
	Ot229PiG35o9N4ozhnOKvV62YPSeBEGsRgCkKLR4ItKZoyzo2H9e0w7mQ4/VNDgc+Lc0u29h
X-Google-Smtp-Source: AGHT+IHxPqIk1owtxlyp5LegtYf4MjOLT64nMI3kVgiGthtvO0lFym3JvM1rzmQWvRKFQF65n5vIwg==
X-Received: by 2002:a17:90b:28c7:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-3130cdfb38dmr4440357a91.32.1749057376016;
        Wed, 04 Jun 2025 10:16:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:25 -0700
Subject: [PATCH v17 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-1-4565c2cf869f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_101617_091270_35B3C668 
X-CRM114-Status: GOOD (  10.15  )
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
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
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
