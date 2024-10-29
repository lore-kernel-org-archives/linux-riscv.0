Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E4AD7494F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAnckOz7TWzCuFjVdMEJqv7/PvwWPXT1Vy+gJFG79wM=; b=O2fEkkOgatZCSQ
	4PtTFc4IsHxW5PmSjyXmpsxDHEWiNeIjgEghYO1B4unF93bAAFdhQqVCfoe9F2MINeBsq5yKgn/Wb
	ZJd75oJbytaxn8kRnPA/JSxd65kz81CCeO0si+SoQeUdG5QV/yNI1l6Xh7t+y1Rf3tnMENsF8S1BS
	BJTX6cyfms5+q1fgAp8lTJHZV/mdPwsafzcJAVne1yz9rymO27dpC5YAEDEoknHbB3e3cNr05xalt
	NHoM3vxQ4TF7YdAqM+3xbTFY7DVuJVSQJoGTGrULaU91rYtBrGgV73/B4JJo9lwNGFlR2oknmrkPL
	SleKopZ5hH38mQFpW/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vst-0000000GDF3-4B82;
	Tue, 29 Oct 2024 23:44:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vso-0000000GDBE-3Nic
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so4598191b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245458; x=1730850258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A27TSZWEvDZAFIGCzgSTP5vgsRCljOGvihxqekfN1m4=;
        b=T80YEOckH/uvbqIKo9msgqaQ+9JoJ0pT64GXBB6Hp6oEcNmySrqgytfES5gUACIgRn
         mNHfXZF6MfrtjyCZGRKp2FpNq0AUZeL0ODwXY3CHRFTK70/v6KoStlgNHfHbTYSTVi6o
         b8OPcS6Qs6dBn58YMIvDVTZNWDQmMHGEyoGfUMFJuoU8V9ZhjO+qlAfONTgFU8n82+fE
         2Nitn/Ceh1d1RMlsz9SXBBKJLiFEpER0MT+7fK3lJFWAqlo4JELdcJFq5QQ5i+1DOa8Q
         Kpa4LGuOW6uQ22TvztYoQwl0D5ol5A9OQn6I/et/58E9KVRSjiphr99epjqNDWVC2leM
         6bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245458; x=1730850258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A27TSZWEvDZAFIGCzgSTP5vgsRCljOGvihxqekfN1m4=;
        b=DaHHXYgePnVrkJoIOURMBQSZ/fRlPVkntp7WchY4lTR4sWtXJjLsYgHbttLC2U+Cxt
         S8F7MTCy3LCcEaIjVxMOutLPdGsLCF6RydkHtMz9Pe+a2sSuDvuils36keIAVZfRtMX9
         ETNi9LXMnB+z7RMDuNxujkm8g526b7iMCIIbCu2IJlO1Jg3Zmyak1Q6YsUlUnJ5ZUzhL
         oQPPPCJiExC2Xacly1FF7i3CKTmVLPSyujLkxIgw5dDRHWP45oYAYL7jJzs2w0mxveKS
         DrWf8kDN7XOEB73+69Kj3D+XHnXDlUu4g0/t8BfV8PFtxVh5J3vRhcuzEHvskU2puGhv
         r11g==
X-Forwarded-Encrypted: i=1; AJvYcCWm81Nx8ZWSZleIfETotHfs6a1mkALj1tSy9QiqdI3TLlsqjKYA0wfrc79Z4Ph7jiuvTXgXzQtri777VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj4p8p1rzTPZSl3bvtkrSVUo0ovU1KNbqJYo2uBP8x9Ncbiuv4
	aevQJPj6Kblwk//nBzYOqeNYR7V0jPxSMiIoWFV9rvZ+JJlui5+48vgAfoRdNTk=
X-Google-Smtp-Source: AGHT+IEl2QOb2QqMdMEvJJy28IFG3kLdP55DbuAo5+86qcvJIXvWMGt1Fwpgzfx+V0+HBr7ZrtesUw==
X-Received: by 2002:a05:6a20:d521:b0:1d9:181f:e6d8 with SMTP id adf61e73a8af0-1d9a84dd394mr17393682637.31.1730245457862;
        Tue, 29 Oct 2024 16:44:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:01 -0700
Subject: [PATCH v7 01/32] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-1-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 rick.p.edgecombe@intel.com, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_164418_895232_6AC0E600 
X-CRM114-Status: GOOD (  14.99  )
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

From: Mark Brown <broonie@kernel.org>

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 2 +-
 mm/Kconfig         | 6 ++++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2852fcd82cbd..8ccae77d40f7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1954,6 +1954,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..23f875e78eae 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -971,7 +971,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ecf63d2b0582..57533b9cae95 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -354,7 +354,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 /*
  * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
  * support core mm.
diff --git a/mm/Kconfig b/mm/Kconfig
index 4c9f5ea13271..4b2a1ef9a161 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1296,6 +1296,12 @@ config NUMA_EMU
 	  into virtual nodes when booted with "numa=fake=N", where N is the
 	  number of nodes. This is only useful for debugging.
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
