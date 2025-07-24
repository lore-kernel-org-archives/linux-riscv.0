Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4777C83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilV3MDTnTXs8lEzhsxUrNB5ma+3wYGl+EdFQTsPSMmA=; b=a7anUCyV0BHej3
	V6ubuw7xCWHWke5jOvKJV6Yq57N73eFD1kpATn9CZ6dd34Y8lDCcqY1674DaCZUuG6gcwWrEyGmm0
	+EyyeaJ4MFBZ+c11ZPEIC0I3yhV5gbIg2TJnN2O98IRd4sJtEUMuInKtH7yIOGbKLLIPOkmRYgkw2
	6R2w1QkNMy7dVGLs+p4ZkcZWOgsrd9YUDCtAK5R5/OhNGK8Uje36ovziSSr+bP0NSQqWt9EWpTPBq
	k37F7uYBpffPpcW0KqzSCRNbTOeo1i7Aywsj5SDEzOnEGZFU/2jcd6B3EoMuryJCTd72KAYdWfihe
	f7pO3AFgwHhq/jzkFAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f4-00000008iBA-1dVX;
	Thu, 24 Jul 2025 23:47:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Uz-00000008h0d-21H5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2349f096605so17992455ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400236; x=1754005036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=QtDrIzZW1BLqHaTEkTDZ4IehRQMzv8OwsWYrk3zOTVSNSuCfVZkmbuzm7VMijtwwo4
         ZGHKpBbtoXK2+E86whArQZdR3wNZD+CNZtrjay39tkeTbMrveNwWUotq7Zfjf3B3vvp9
         g3lGkaXQ/JZVzEVsd0SUG7IgRVqWBHbfSj/s9ua2tvCegUVW8ZfgGfeulX+RMR9ttRTG
         qRvRQ3Ljri41DRa5eyBsNcSBRAH3rPuJuW13dMAyoPFnqYPbk5AQuBJJWad6WYhtu9Yu
         PLHLGGh+sPqfePe4fUSjQHi2grhT68M/o19FPY9p1ZebFhbNXE2ceVDnFrWoF8/uacUI
         gtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400236; x=1754005036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkm+U+Z8JovOoe8ArAZBSUqCVEx3YFZYKLxHXbXYTzk=;
        b=CGad6Cc2/3DLLOZCr7tesbOj1LuAuliqxtt+xt1KTbqzM66o6pN0b1gwo4MPwGDF5d
         so3YBXUUiRvQKM3u7S6zlLDe7DTUg+nJphM+5o+MD4+wrA8e2twsjl6RqbQLucvv8ihn
         gEgk1ENZV3ihua3PaKx5EM6scGivalkoI26EjLY+Rr+lWrFaJdxIu2oF7ULhqG7+edIf
         Vo6SB35+PPy0Yp6IKvlcVRj2xVRWaZbiAvG5s5hqOjowO4nmFXw6ARv0DaVOgQLNsv1J
         gWZeZkghn3H6Q2k57vBs3YGi0JQ4dgTDo56q8Knc54jvlNODjJ1q3GXcQA753cRFIohF
         NqYg==
X-Gm-Message-State: AOJu0Yz1Gb6z5qw5j5a33vgtK6qr/FvtnpEfkt8hjHOosiTotY1WwJXp
	lSmiwYbMXlLn9ngA6g3bS5Cu+GJ5GJjeYYqi41rYN7Nt/EwJipu6Z4RCB/ArvVCj7eo=
X-Gm-Gg: ASbGncuq/GChmVTfvS563iG+nPGbycBanZSwPnWe0z8rUQwOzNrN9qgOZH6qYsSvCSk
	6cypAwixZgrvCmgl113QiJNrn/NGhguJ/QxdUZ4JA4UeoDgNvSgQ/XkI+P7Tmuz7wGPm/nqf0aA
	f+RAr+tRtaou0aivxdFE2eR6TYhWT1yNM6DpNu9CYR9W2b3vVtGjgUI/ueqv3YP2UlWUDzOLOpY
	7hAT5i+Jxt0E8FZVLNElS734hO7FQ4gYhE996/o2qoC/cPriqIywO7kF0OTACOWfKwWdXaK9E+I
	6Yr/KpvLhKT/80xW6W1TNR0vA1iueLlPo/99/+5KpcUKeIzsH+BeamDJVIj2TvetVjztn/qAt3Y
	KKQrP64Q/Hd0whWNTVMnyybB955uy5Pxm
X-Google-Smtp-Source: AGHT+IH5SBpkVu16UrwUXGB277v+OXuJbFLj21IH8FU8jVfnMFq+cBM3PPB90wB16oPa9iIZanRWnA==
X-Received: by 2002:a17:903:24c:b0:234:9094:3fb1 with SMTP id d9443c01a7336-23f981afcb2mr126281075ad.35.1753400236613;
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:58 -0700
Subject: [PATCH 05/11] riscv: enable landing pad enforcement
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163717_522588_D71950EE 
X-CRM114-Status: UNSURE (   8.79  )
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

Enables landing pad enforcement by invoking a SBI FWFT call.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index e4d55126dc3e..e6a9fad86fae 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -536,6 +536,7 @@ void asm_offsets(void)
 	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
 	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
 	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
 	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 #endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..59af044bf85c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -185,6 +185,16 @@ secondary_start_sbi:
 1:
 #endif
 	scs_load_current
+
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 	call smp_callin
 #endif /* CONFIG_SMP */
 
@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
 #endif
 	scs_load_current
 
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_LANDING_PAD
+	li a1, 1 /* enable landing pad for supervisor */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall	/* check for error condition and take appropriate action */
+#endif
+
 #ifdef CONFIG_KASAN
 	call kasan_early_init
 #endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
