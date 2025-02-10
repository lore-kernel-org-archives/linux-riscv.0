Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F96C021A3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtbSUQe4nKmAXnCTInEk1WY5vPoUNqfHcvrQI2XShC8=; b=sKTwkSWSt3zOYq
	Tf4sCtf+LuRT4Y2icHoG/OBAF2yYUbEq/8+Avk2G0xcXmPvWgRRPgCsBgE34O5utjyOwmMLVj+xgX
	6uOrEmxlpknDgu2Xru7chO+I4Wn/ec4ZjeNBETCrivK8KUOwyCg2xOKaj6T2eB5CURDKJm5x7tSD7
	aZNPGixQT1L+KLDyNtGB/SiP4/7wOhfN8zeVwqOkztC6Yem7cvkcPPvztOxsCRdk/Y7GA4cbcBrMz
	mJ0V7l1mpgKiETC/5Gp+Cuxtgn9qzt6hacv79alHqNZl8KYr5AbQETTSfG/1/U/QIDkvNbGYReFAW
	frS08VaDoTjIiCsVCGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWP-00000001WoD-3Eyb;
	Mon, 10 Feb 2025 21:40:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNg-00000001KoQ-13sv
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=; b=OXlMqZAraBEpJ3RU/E26miRuPt
	lxDInAlhmKorM3WzYqDLhBLPGHg4fNGz8kVK6QqMHOlc4I/ETEHTJ6+7C7bWXP8pzDNh4Xx28SDJ+
	brVXzSWHGgj3iAnRhECHiv8o61eoc76LVdcQKJo2pR28ufxupgyO0TUqKSUpVWhlZFH9d3spPFIuk
	o4L7DHIHVE3w0rDrhqlzV906vYNPMPujRrcAdEK31UFFyL+oxqUwSBZSuzJ46cF0hoCO3YMiPECN8
	7K8N62/Z/YpDFP0LW18kepF/qq7q5J/HT8T5NUyLoJMp/RNIfWXxx+hLDRJ9kS4e4GdAug/Oij+/c
	YmFMCVFA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNc-0000000GioS-3MY7
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f40deb941so100127555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219262; x=1739824062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=I5RBVkqOqx5aU8qdT4FRiWvkoF8BxC2kgzXLcHL1pvneLK0Qq6Lw66gltlMZgPLkke
         5pXrHUCAw5tfapUHfiY0BTu1ZKDpEIUyXmtOqwE6e9MM/zrYMZARiw+ucbLK0FN/PVVv
         z0Xz8tTuKZox1VwisLzizxarCT0putMtV6JIW/UQSgHvutjy693SW8S5uVO3wMWhUvOL
         rJyKSEgkJByRypi8rwHu2RKuJJHurDLOSucjTDbe/5Tl/dFoKmZ5fUSS/Or24AIvxTfN
         DfUFNkKIZxIE8GF+MDFWqh5zkktpl45AflT4Dh1fwI8pNpnz+jyLIYgtDb4fPYuApjm8
         6OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219262; x=1739824062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=CrEQTKEMYs0Zls4y1D1EkHE51v8aVJUDTpqQSHYODwqJ58q2Ku03reIbBZMUnfd5UL
         53nBQpCuR336BD91RbVkMhdQk/1uCbbay9ZSBeC4g3+h+YyzgC/qcJUZXjy0DmhMYm14
         OkWLQzQHwgcTpItjJCrczwhKzc5AVZWqk6aAMI2ccRVIx940TRS3bwtJIuJOHpEb5yOj
         PcuyYklPqLTNQ3k/l4I4jMC0M2cojLictGVIB7tbyCKn4COgbG6LpCmpdvB9dyZaquib
         tW+f3ftYbrwvedpkUOqVuj/hBm0yAd+eMH1vh0IMIaDCcaDUdy8sfsLKUfSSViR9/wjo
         5RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDbC+M0q+nrW1ZtXInSOZlDNhfSO5M9lZnOOeZ/QA7tm5rk55/N+z3L03JW2l3kKZlgePI3lg+1FP0zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZwev/WhY/Hig4LQ+cWk7DDjRzG9165wrmZlCL2ebOblCZ+9C4
	jXO5mnfCru0QHRCfTC3VT9lcfWr040KMzOn/swFISJ3jvXtHKlEF/CXrSHTltgY=
X-Gm-Gg: ASbGncsqnBmucb1aaq1oau+Du7tDDwHOzUpHaBC5pctZRGfeeb0fS3DNrIMoT6yjmIA
	gO6r+5FSPeKg+epkNgRiRpGb57KZ52O3Eq/kRffn5soPWTPG2AguPnYBs1wfunPNRzS64ygzwP6
	HqRvJ/Uecj5iLwOSKQoaFeli1eh1tL3RCIADrmLptWmWP61f8THV0XjwGqJmGm+3SkyAOeX8NRc
	AkYsrdNdNXMDTuoloH1/V7HKCxcqG0oafwwOSXbOZIzjTciS1PFvnzhVxY84tRwCeptW7xiWsVh
	PcuRvIbZdrS7d4mrfT8c7xqswQ==
X-Google-Smtp-Source: AGHT+IGvJHthtMMIotmYr/CK0oOoURKWcK3k+qdOAPpSTfBW1H5FZ/zO8d2C9jHOqU/wdcn1U6s6JQ==
X-Received: by 2002:a17:903:2311:b0:21f:3e2d:7d36 with SMTP id d9443c01a7336-21f4e6ceb59mr270827895ad.1.1739219261893;
        Mon, 10 Feb 2025 12:27:41 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:41 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:57 -0800
Subject: [PATCH v10 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-24-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_202744_849533_7EA5D6F6 
X-CRM114-Status: GOOD (  11.91  )
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
