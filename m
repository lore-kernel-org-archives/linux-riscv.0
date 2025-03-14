Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2FEC35FF7
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UR1+LlIrSYvWOuZqUZXBFYk+a2om5cnc4iuoNRvUgpg=; b=cN0+5bALx3hbEI
	qeStmbcJeFO4TXbSsZs6fxkGHRxvonUIdHJv2bch2Ans7kukRuF6bD8LiVwK6EQvINFCjo24ddFsI
	i1RqNxI14LPvBYH2V+IG4MfNFdNvwywnO01JJ5fdwdOyITXc9Swnd4aJHNN6fUmgT1hd2T5ugHg/7
	3LaIFlVWTTDk1q6eZcJL24s7kRPDjF1xzc/tFeDQ8o5Kw0WmoeVbVvjpMDQ/roXH1GavzMfvGEF0Q
	HUa47WE/8g4YqrJOzHsK6sOMlriU61eE6Jng83vxGhrlpQ0r+0DokyQIrADgMASUSEm5xKt48tVGd
	Jq0R7WGaKuBjgPf/GIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs1-0000000FSvc-1Se0;
	Fri, 14 Mar 2025 22:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCll-0000000FLPg-1YGW
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RHgO3WLw+YmwdWGhLYAhQ6tJSqW/uFwu3lLubQj4jZ0=; b=rMuMF7XszuKdUiZNe3pn+G7Fll
	CgvOoyaY693WINQg8NUt4aoV8XfoL5dipxG/811wVZ8Gnc9tMUGlyxftLgIBOXEe/49jnI3FsP+oi
	qP/WuZQiWkCc9hZamj6AeYyE+E0knzg7coyoZ0QxnnP5OZs16Hnm9D7CWsLIPfJNlkoeIQ9/V2ecL
	BB6zT0nEJmJ+5lCnb1pnssfLYvZP7iHeG7+XHwMceR276Gx+i/yaedO4LSDowOD/3aHITo/45ZwrZ
	w/US6mR3lcpQduQlrDFFK2ZvcvI2ZtHdSyIkD8IRHuSybwKAJUHcps9XSHVy6QDO0pxkRjWXjLoaL
	6x5VBGHQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClh-00000002xIf-0iJE
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22349bb8605so56814425ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988434; x=1742593234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHgO3WLw+YmwdWGhLYAhQ6tJSqW/uFwu3lLubQj4jZ0=;
        b=Kr82odX6gR++vjYic6H2KQyNIRaKUjReB7v8yKmj7raoFI2uNMrbyJCgnHmRZlew6g
         eniVzlsWvA7uXdqxxfU2N9z6IfPZ50kA8T+BptNFdmMzCBHdehtberSoE41FNTRzMbnt
         cSNiXD467M+WVLyLxEjBXM8HhKSKgnz0LWd+iahuV10KSCq87TugALNl1MkZKMq+3alo
         AEwPY/ByXI36bpi9nGuLlTjrcmlnBbgzWvx21AGk9+yAtxI2LQVJWGEPrKh2R8pVCNxJ
         R8tuMDosW7BjUrYPguOSaiNtFOCpj0dnB2MxtRUrFzvntUtdcaR9qUNKRr0YM2aywmcS
         Xpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988434; x=1742593234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHgO3WLw+YmwdWGhLYAhQ6tJSqW/uFwu3lLubQj4jZ0=;
        b=YjHCKSG46HvkANu8dGwGimBCwYw6Br5fCdhDXAoOxFaWweIwcK+t3FfQ0go1f5jxy8
         VnjZBv4+ByZWc5BaQ8PvetZDDTDWxlLe/H7AgbbA+FUr5qXDEAE1xDvTt0QsokM0kdCV
         2abi7Be/U0RJ7oITM79NjBUYOvPRB1o3X+X5z8MZk5fjgKmtfNNshmjlluvNMYZzNePd
         4KtRMktRV45Yx04IawecD0zI6amjjuztsnh04kXyrRuq0jGrzSWdYaYpz/YE+9Mrp+80
         EaeWBsqSMSvRA/coD69HQF9koYrJ9Ao1cCWFjfcrozK8FO46U0+D8I8iK/XOv2dzIIHF
         XsBw==
X-Forwarded-Encrypted: i=1; AJvYcCWfaosIcHJ8ESkMf38EprRrS2RaowwWftGu7FvN6Kn8AAqQnCxRCQNo/cab/qCva81tRXLgRTazabNIJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpaZRkwg/GU1qX5985VzajQOEqE1+afDz4L+7Zn0rbpzeN4v8X
	78BlEkwXCzrKt/kNU0EOSyUoaQ84qSfersReh3zPQsCBVczwrWj+gbyIlSZ38Ag=
X-Gm-Gg: ASbGncvrA/hUfDQcE56Oua2oWWXnWtLtRj4RSZjYtWSC7NFDcpMmasLq47s9MLyWevI
	mnyFskgospckmv7SV47jt3kpcUtVhlXM9SQWE3dXCpBguLkUCzncmM1u/kRJtruxbXtAar9zvZA
	x1Wb9uw2ymxYL+diHgXvPcP/5pZc002beGZBp7EMpeRjJgl1/+ELGjbJJCY4lN8bdPXXhmzFMeb
	KlV/crpbp53oCr5kSFS7dZ67bXEwTui/TLo257etAYaJtwoArC1kZfL2JtKAYl8mRSfPmo6KAAA
	ftDLmccA+G0H2Cc+10uZKqgFtIg1+meNHLj5caBP7CEaX0bIoKf+O3Y=
X-Google-Smtp-Source: AGHT+IGwO6FdmJUbA9RsVYM+YTvEHEJUu4luaiuDWiqjNtcj9WvZlSftHA3OvhahsPKrta0EdbsKUA==
X-Received: by 2002:a05:6a21:394c:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-1f5c119438dmr5984307637.21.1741988433739;
        Fri, 14 Mar 2025 14:40:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:33 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:44 -0700
Subject: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214037_487192_4F734482 
X-CRM114-Status: GOOD (  10.89  )
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..0a2e50f056e8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
