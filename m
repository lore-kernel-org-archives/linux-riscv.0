Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8416C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vW3jRTuHBRNnoBDDIGP39j0SAbryVgV/pAaj5lbFhsc=; b=oaagrXPo+vWaIa
	aPhSTwJXdoayuN3lZXo2WkEVwGwvzoUolEBzVY8ZXzuLILTgJnomkpo4iJ8QtsDida5pTyzCr+i6R
	XubQT9YU1whkC2/QvVHiFugKAGOu098Xa7tlmf6QDIE7dRFgaWPTvH+9+c8AAytyFwmhwZ4y9KJ8v
	KnVp9An5hs+dydCvSku0tNuX1gNrD6A8QR9y//IQgUEaVPeHFYZHKrJm2YD/4jFKuMT5f4uxPBF+l
	MK4Ray4yRokjOqGptBIzSRrwEG4m2QplsoCppqYN5+WSLHrG5kHt5qc+nGf5daRXeI8HY787WQusf
	T/r8ltktsX+tpk5EmDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvB3-00Ap7e-1q;
	Wed, 06 Dec 2023 16:55:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvB0-00Ap3Y-1P
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 16:55:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33330a5617fso992460f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 08:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701881700; x=1702486500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11Qvm73V/R4oS4z1zzbUqHU36xrwvK0hc2TtJL/D01A=;
        b=CzlLdZ6Bp/oMuLPV7OZ0Tb5tYflLKPYOPtv2PeRx/qxIaqjR2Xw96f34AkMT1gQjVV
         XctcYiwvjvnSZ0ax8BJMSbl6aNNcgzSE66ibyiupTq08QERzv3/BBNRzI+1CqT57WQUG
         RXBLCyhOVb8tg1OYJjp3anr8HnWRgVSyFMOX/XT72wGKCgdleiSxRifW/0uUj5Is2M78
         4oXixGvtc9soAlubDXC0LrXUEDWkdhr5AWMF8Aw0Na59D15My+pn1ikBBx2xjss8mW2l
         Q22MbES6PrRXRCu+ZqbpN7zDQMSQYI2HsOTCdfwLKXRaGlUr4iSnXTESXL3pc3ZOj6vU
         pRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881700; x=1702486500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11Qvm73V/R4oS4z1zzbUqHU36xrwvK0hc2TtJL/D01A=;
        b=ssvEtYI+NQCwnQJx3nqwq82BRpfxNL9BJxzL8Kw6al2Ro6vpA+jZ9wlicXbDMHROVw
         PiHLmmwiVbJa8FmrBC3P8rKxA/uGXQMMskbwXjw7KbKm8s1XCWd7v2aMvucIicyjUkaj
         uKlw6kxUPeufeMiRDAHeG7UPeVrV4ivvBR/dlP2s9fUdvrnaHnE70XcMWSCbzpA81qDB
         092CaewP9IKLsjFrn+XLdP1FB6yWV15rSAxFO7xU9At4DSigvmQEjKPMMeMfr4AJKbFU
         uskbr9cpqEwd/CGJhnBqrJmNVBP20hg0QrSk5JZN0unvwZpbpLSy8uBfDw+n074pvi0a
         KGuA==
X-Gm-Message-State: AOJu0YzhwY7tfJ4vc2u7gMEwQTdhvp6/ZLDSI6T+bQQxkbR+jnzJJPsL
	SIKn4Cf6zhgDtBJ0mrJ14yC4Cg==
X-Google-Smtp-Source: AGHT+IEWj7IINYNgOfOiEmwYeJkE0Y1KTlaky3I47a/47VFbSS6FDRvec3zWR9HjMHUj9F/PMRO1pA==
X-Received: by 2002:adf:a3cc:0:b0:333:10f6:29c8 with SMTP id m12-20020adfa3cc000000b0033310f629c8mr1093444wrb.20.1701881700471;
        Wed, 06 Dec 2023 08:55:00 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d5409000000b0033349de2622sm108599wrv.94.2023.12.06.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:55:00 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com
Subject: [PATCH -fixes] riscv: Check if the code to patch lies in the exit section
Date: Wed,  6 Dec 2023 17:54:58 +0100
Message-Id: <20231206165458.40610-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_085510_473895_99785747 
X-CRM114-Status: GOOD (  13.42  )
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

Otherwise we fall through to vmalloc_to_page() which panics since the
address does not lie in the vmalloc region.

Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
Reported-by: syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000ce4a27060b39ed34@google.com/T/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/sections.h |  1 +
 arch/riscv/kernel/patch.c         | 11 ++++++++++-
 arch/riscv/kernel/vmlinux.lds.S   |  2 ++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index 32336e8a17cb..a393d5035c54 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -13,6 +13,7 @@ extern char _start_kernel[];
 extern char __init_data_begin[], __init_data_end[];
 extern char __init_text_begin[], __init_text_end[];
 extern char __alt_start[], __alt_end[];
+extern char __exittext_begin[], __exittext_end[];
 
 static inline bool is_va_kernel_text(uintptr_t va)
 {
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 13ee7bf589a1..37e87fdcf6a0 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -14,6 +14,7 @@
 #include <asm/fixmap.h>
 #include <asm/ftrace.h>
 #include <asm/patch.h>
+#include <asm/sections.h>
 
 struct patch_insn {
 	void *addr;
@@ -25,6 +26,14 @@ struct patch_insn {
 int riscv_patch_in_stop_machine = false;
 
 #ifdef CONFIG_MMU
+
+static inline bool is_kernel_exittext(uintptr_t addr)
+{
+	return system_state < SYSTEM_RUNNING &&
+		addr >= (uintptr_t)__exittext_begin &&
+		addr < (uintptr_t)__exittext_end;
+}
+
 /*
  * The fix_to_virt(, idx) needs a const value (not a dynamic variable of
  * reg-a0) or BUILD_BUG_ON failed with "idx >= __end_of_fixed_addresses".
@@ -35,7 +44,7 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	uintptr_t uintaddr = (uintptr_t) addr;
 	struct page *page;
 
-	if (core_kernel_text(uintaddr))
+	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
 		page = phys_to_page(__pa_symbol(addr));
 	else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
 		page = vmalloc_to_page(addr);
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 492dd4b8f3d6..002ca58dd998 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -69,10 +69,12 @@ SECTIONS
 		__soc_builtin_dtb_table_end = .;
 	}
 	/* we have to discard exit text and such at runtime, not link time */
+	__exittext_begin = .;
 	.exit.text :
 	{
 		EXIT_TEXT
 	}
+	__exittext_end = .;
 
 	__init_text_end = .;
 	. = ALIGN(SECTION_ALIGN);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
