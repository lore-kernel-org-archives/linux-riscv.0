Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE68CF042E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JDjluGDbtd55AaVgoany3gHIF6qjmSY9njzGWB72qM=; b=gbBtKtS6bxbjR2
	VqEEyHMzSxW9jlagcKDayxSAEPsWDY0YEEMwROZqvI22T5brwbkWbcjya47fVli8L/fbjcHQ3eOrr
	SjxtDmCITbM6FjQ8B9Si2Q2+E0ZDvsfo0G+YuXLv0VhmGSOU4f51gx+uPVZK6Uv2WxkpsywZDsDFj
	upMy9CHdIl2c7nS2FyUA/LGx4vLrMZmmwsCrTEkB9lDo06yAqXZkUCHMAe9k62MXXs0ZagSN+IF1/
	1b1+LT9L9BSZL1HbYVnekuftwr1K02Dyi/P/shbQcn/l5Wf8JCSkfrDJGGC41U0axtv6mzVavK1n4
	h0u6bA+HmUugKo9kxUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtq-00000007SM7-2w1V;
	Tue, 08 Oct 2024 23:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIri-00000007JlI-0Kli
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=asJrmHut1Q6UlWCCNbkBgTT2I9NUCgfcqtf1L3nHA+A=; b=S9zcvfIlHH2uwQNdG/sOLvRaTD
	zBKM8Iwtmkg+A18QonIvrvw6krIM4NalBlzzkd2amjVtToLZaRYzWVabFB/R4W+C2+S3naFrU09hP
	+zrB39Rdo5e6YKD10+TtWa7Y9w2KjE7snVc3nIrHKJdQUGCAqiH7liHpmCWe1e7jOxnzn/7qXtek8
	ixvhHDgBtd2UCCoPzk5IvywfHZBk7ysBJwpGauQ8XCc27Y4+9woSAyFmZI4iYEQnms3D0pOcX2Jim
	+cBHtjYFBmheb33029DBkRT5fNcDGB/JI8IpE58j21ezRaAQWUx63YBjpQOLjmz/exgPVSH+gkY+i
	KuiH5MeA==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrJ-00000004hoZ-1BsL
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:36 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so4577057a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427151; x=1729031951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asJrmHut1Q6UlWCCNbkBgTT2I9NUCgfcqtf1L3nHA+A=;
        b=DK1WVtUOL0F6nKUr1oym9cdfd6cwG6mqwZIaGB0ipONUBDDQWBoXC4nF8reR2aLPRl
         /8ix4xZol4KND0Qh1YpLG8JD6QhRrK8+BPwpPKie0sVvUX5EnEPOBvaFWxa/5irBVglL
         jpBosdMA5phEtbchq55VrBS0JkZ4zIm9a2aqeCcgv2SMlQtSs4OFy4C0lJQ/VIoAsnHF
         aPbmo/YG5wOmcyZ9LN1A7khB5xzkd5tyYpQUSTgwIitmTr0KqS8D/Zr1XFfGusDcBe7V
         x6sqdRJkDXWUQU+77a55d6CQprbLrFwhLHTJITy35j4Vx18kQ7zhsKuZvszUUTioJrDs
         6nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427151; x=1729031951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asJrmHut1Q6UlWCCNbkBgTT2I9NUCgfcqtf1L3nHA+A=;
        b=oRpiNAssRljqcHiH7+RK/QSq+Rx7ipMTnpUicc7COgBnH20CXFKUrT3OGVFZxPG/Xs
         lXc3+NabwbqkmoeCm+NJmEC1BGRy9cL7MXA8T+ESlY+sjLV/rTWKhwhSLfoUHIP3lyxz
         R6MltilBgi7D2WdYi5rvaf7HZWRKthzCO6TNh1hm+mhv3yZQg9evw9E+p/9dE69oNJ9v
         Mn3MsZ2eyhlwQB82bKJ3SaJqM5T7VuqL0MWDHVGxfDwl4pBpe5cuqRto+5znr7h7s7vp
         koeSSg1begKBpujdSKA0p69WYnk/pmr8PQC9osvg6xsp3Sh6P4M8bY872K1tbwvMmD0G
         08yw==
X-Forwarded-Encrypted: i=1; AJvYcCWyhrOCdjSOU9x21ertvoxwQM5cP8KUe3GqMGT45ABdbeEx8sG+2H14GHh+R1zG5h7yD/xee/D2R0zj9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykq6kqA9GEuaCqCm838ARSRo+F5NkQBu8XYW4uBGfZ9R/K0oKX
	+zZqvXbJQN4+FoSxY9HddmJRfyHygtOypAZ/2yCnzJKWKkFQwIgvT8gOV+Nlp/Y=
X-Google-Smtp-Source: AGHT+IEDqNZ//hNrN/QcTqq3QMYiauQAdv4OvwSpudvpfbUKRWUptDxZ/4bPpZt2oZiP3IfdvQ1Z7g==
X-Received: by 2002:a05:6a21:31c8:b0:1d2:e9e8:5e78 with SMTP id adf61e73a8af0-1d8a3c1e496mr717902637.23.1728427151493;
        Tue, 08 Oct 2024 15:39:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:39:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:12 -0700
Subject: [PATCH v6 30/33] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-30-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241008_233933_171357_B5E52993 
X-CRM114-Status: GOOD (  11.76  )
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
index 808ea66b9537..1335dbe91ab9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -245,6 +245,26 @@ config ARCH_HAS_BROKEN_DWARF5
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
