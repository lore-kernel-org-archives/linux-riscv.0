Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA3FC369D8
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BREXPaHPSCTZu/leGpXu+OKLbAk/8lTJsF2+7l/+sq8=; b=hXAXRfnn9qYUZx
	Txc4SN7DLEgtW4c96DvPhRCmAWiwiIO9qE8wBzuCfuvueP/Mlatm1DpYkQh3TYz9TkJIh8ngfnVVq
	K72yC5DS0RUDV49E4vDBp6sRdRueB+zwQgiqAIPOp+2dAU5ANJ/qeW8MLlRCAAw4SoGmV0FACPmYK
	izUSFHQE5x+PBhDIp2BB5KQ804AHanNXZxoBgkuTnCZhe7HMLcvOygH+Tmsh4+SOtZBpy7Vq4BxMY
	g0Irlb0g0+Tdw5nYM/7iNoCSvolaQIQXTa/Oz3NWvhs+6I0j11LcQAB2oS5F6++Ik0kU7z4o2UgLH
	bgueabPgu5WvrrtOWzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s59-0000000DLXY-1FtZ;
	Thu, 24 Apr 2025 08:37:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qu1-0000000D8SP-2Rk5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227d6b530d8so7000605ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479305; x=1746084105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBVVSv3Y/KskuIA9vtQck5I4HmCuzlUiTDqTTZjwDSs=;
        b=C/aeiIiQEI0KONIGQIU4SmlO7bv1TUuJrAaB9P4vrofsFUPfF0iGGkfYUHjyxFlNjy
         152WztrDIZ8UDZHIevU4gNrce2s2TmivF88fPvg6X+pQT9ma4DS9WSSzJETzpPYnc0GR
         L4gL2JWaWdmEflYIkNAp1uDXxDrzhunbAC01HaLjUBh1FKEqbSQJRY6nYBez1/8WWTry
         GjCtngXJ/tp6SgQDAvEFYgOfrLdUPNIr1mg2R2Bln2bYXRifK8yz7uDRonQQnQ9cSZMQ
         sZ4sWQxMAtc3oidDkCkeeNAF0wULL/IsW25T0rAEQiCM8TovKShc3GeDojHAV1RAw8cw
         iEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479305; x=1746084105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBVVSv3Y/KskuIA9vtQck5I4HmCuzlUiTDqTTZjwDSs=;
        b=fxeJ0XK0Tv7D9aBvOgb9zrCtGrA0NOm6tYmJC4iYeVFMZ9ZeU/NULgWNED052cnsYe
         8oeFqtDfqwkMhhKRgWMfk3uAYG/8/R+my1uO+b7oS+n/oi4a9NyEpo83MKE1r2L/2zuE
         8iX8R1MHyI7p7BwZWR5XmLtY+4cagSSUnkW3HPmlHdqnRh7RIaD1xyi4RwockQnijirW
         BlMLRf8RgGlnlEMA95ahUfxWT+Jf/7Je+wQroWL7SaBTxphHMKTZJB0DuhNX4ejEpJN/
         p3QKH4q/KkSl5c58tZsJspZjONctxVKwd5xgveAiC825qh9ca3lvs5VplhkcHxLvuPX/
         5qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXcKVrSCjSb+bxLm5uwkIX6RrW8gZMsunKsu1bhg/uH509QzKLwviN/AaFsqSmWlsoOIeabBui46OVcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN1PTmt6f2D1swszVpia6TGDuLUHHQ08s5Eli944j3qgR4LArj
	9tNrD1MqlrOqeZ8DdDU0FQ1KuaSmbegC8/lc073tbEKhz4mormyMOOo8uEZympc=
X-Gm-Gg: ASbGnctGre8r7+2wD6l2TnKuAJDpCi1pJz3ks20BcDObBIUGvOZrjHWLhB3I5j9rwI3
	t9hRTewvYzi1M/YjfkHFXI01F27847zoL24dmZMB5etlmRhbbmCUJ7B8pZOAlFfBEo9qg4EWgWc
	cK8h1nSQjHaSWGsZGNBB0diOJL64r3oDfregmwzY9TK9w6pAihUd8aGPWY73/TQIQjUqIr0cb0j
	tB0KBU3+kSaH949nMqkSZf/FuwJprOrXi5N8TUAPqQ/JcHXeBZYbzV5UyY37vOzPWsyL0OQcP/3
	plpy11zQgNmC2U9WlXkBLSO9SYmCAKi+yVtDDA6MpWzns1cFJU8=
X-Google-Smtp-Source: AGHT+IEz603dSSTLC0f4nDj+eBljayGhTKs2dK71FM32ph4jUbGIkkRXg43iXBmg3uxpH4oHFXtC1w==
X-Received: by 2002:a17:903:3c6c:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22db3c0c083mr22910175ad.15.1745479305054;
        Thu, 24 Apr 2025 00:21:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:40 -0700
Subject: [PATCH v13 25/28] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-25-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002145_664295_EA06FCE2 
X-CRM114-Status: GOOD (  10.97  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
