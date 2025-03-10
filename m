Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F281CC282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtbSUQe4nKmAXnCTInEk1WY5vPoUNqfHcvrQI2XShC8=; b=MkcU3bYs23P+qd
	w2o8Yr9Zbl/K2XfohMh9n9HnXtw6aZFos2yFtBUBt73WWTg7fbsl0FOakoUnmuWOpGV218A5n2RGy
	43rJ6MDlbC7thIlhacsbWPdv5IO6W5NpyEAEWX22htNRHi2z+hNfYXoLrkz9A6P05p2qr09gZ2yyK
	W05gfs0JjuiPkWVdbe52NbSdbt6r1Q/zNnWMVI7hQTfZYdTos0AL2j6Guq5TBmGWrXkEvUx7tueCT
	O3WTbw8HTWwxnnqgmu1DDT7vImrjpXJJ4OGel7v3vDW04KkhtGIomzVO5cw1ngo9dKq+LdfBgZYN2
	Ss1xZ910OkVtLdCNIZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfIZ-00000003Exe-3Ika;
	Mon, 10 Mar 2025 15:44:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVX-000000031zP-3mSC
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2239c066347so74061835ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618411; x=1742223211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=QCyOZ9LW5lFIq+4CKR6YFmrAH5SXIn6i2WvDTYMQWpB0ZoEn4eJtskoaB438jBxXav
         dEdG9rlZyPbrgF/1PZmIUljpsb4Hrh2H1G9k+eUaEwbq2G0dF0J1veA12oG/kkohe5Ud
         sPTxY+eNto9RalhNu2rl9J36DL2XFGGV/2hR8r2rnPDe6xL8QUL9JAcRADUnlcMseJ6m
         rDsmAEw6H4vkgEC4oWUDHverk9p7m1imVaGjTthUs1O0Xex3hcsUA6MO94C3yAHEai6b
         I8M7G8H69ARvCLbDKX1IontXWFt6TxIPQ5Y/xqrR4zRUaqcEFF3PW4vmGFz7ys6n4CxB
         WrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618411; x=1742223211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=Vs9K1N0m9EsmbtFcki+3Ms1RyIJ9tuqTmQWNvjPr2wkj7d+zuKAeQqVY3E/Xhe/ReG
         xc0z44yuynp4/XxC4Om5EC1Ay2Y3kSW+9u3kO0GVF7PR5oq76XrMbtzG/QidQFSetAva
         YPwMts8IetCokJqc0BGZNmhacyAiFLWZGoL5LjKd+RPCogwjNMQ7+pwliblo0OkNI8HQ
         tupJqVE8eG2I8Goq8y6FBRSoLc9g9aXR+VDPhMurZnBdDplHsGyCnKC40I0DrCjoTELI
         zaeKNx7AsbqnLLbFnRis88iFtjAi/nboXJcR7wcTx2Ojwrisaftxc54dDdpeBxAj1sQC
         9P8A==
X-Forwarded-Encrypted: i=1; AJvYcCXMkSNCFWbBMMoSbgf/MpzJmxlpoiFD4qZhGzWoekaCIlaA7sc7pyT+j7mHfHFMZ4D9r/WOYbA9o0sNvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGe07wTjnvXIK8w+ytRnVu8DQNGqTZShKktsEoskDhSJ1eg6as
	h94pcuIXhiVYyz3+7MvNTZTvDrOy15d/feIqdvb9AhqaXmBHx0kH2DJ5rGt+H6Hi9TNASEGXW44
	w
X-Gm-Gg: ASbGncsovnxuKH+5h3K4EBXIk5LE4FP9rI1Z3XH5Kei2DHpry5eeGukzhi8u4LiQ1BB
	UtGK9JQ7c8qdOiTcZ3T4JBwDrVJfbyWaN9YnFp2D9Tbfe5MaaVKllVDmkXPp8WfXX9PRrw/uF7l
	e/vSIA6b3N3mdTLaZ2Pa2IilEb1/qrF5EFoQ6SBclL2+S8rWynpb4+gKwpkoyDVBOZF8zxfIfD5
	erCe3GKsCdlf7V6YSy6lXIoMxs00ZyvR/KdJ3Z9fZDciSV3+45jKAjFGvPZBPlKxbHU4RpDB9s/
	4bxGOgqRcHw1MEVRlTNKkMalkpcViy334cQ2MHux09kYDdommtT4cOA=
X-Google-Smtp-Source: AGHT+IG9tC1WaMP/xC1ABIbEOt50ns/8+sJ1nYsKd4Gr0OatbIpLJiaEKJdeufsJkmLrEp7EYv+TbQ==
X-Received: by 2002:a05:6a00:928b:b0:736:5dc6:a14b with SMTP id d2e1a72fcca58-736aaa1ace3mr21470128b3a.13.1741618411393;
        Mon, 10 Mar 2025 07:53:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:46 -0700
Subject: [PATCH v11 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-24-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_075331_945655_AACED02A 
X-CRM114-Status: GOOD (  11.61  )
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
