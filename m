Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77923C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AgiqEHKDZUDMZv6MNnGzvIX4F1XnbpaZMHXTQRGAmHE=; b=fq+iWi2cGsJdRN
	QjVgVBEyU2C/8sWhqGC71E1c5BrFczJRt5QpTdhiyCnecFtfbeKx3KI1Ys9mFA/FJW1E3FY9+C0Rl
	6bDXhqK1vVirnAxY133hENdH57JpsAzxj4wvrFE+QfdBzjJsYW6BaeZPv+zI9iD7EVHmmRlKTWVAC
	q+AJnOsEeSoGS0HquiT0hfZtHzr5sRgkrB1bmjWXnTF8RJQPI0AzjkpS+uYsIWGhLgHv5IBxeyBCl
	ii02YLN2581kDHJsz4bRhRdCvHUlzvNH78GriYBek5k8nBboOVCzObV9ObXWgot7AgDu3mDWj3pqM
	fSxCluhd3Hvm1HQqXa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDhsW-00HKKC-1I;
	Thu, 14 Dec 2023 09:19:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDhsR-00HKJV-1x
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 09:19:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3364a5ccbb1so157265f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702545568; x=1703150368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6KCWUfDFNx0O1wfeTExInhDSJOXnrOXPLAO9F5T2Tc=;
        b=3C3Fry0Ayf2f9PzGjti8nyTRRhOoxUMNejYnIfC70+EvibpWksJ9Yg6+exwDrt2KNk
         HrLbsHnM936B2VRr7MAH8iH6OJd3a6kSSvPcEydQ8DO2Rz49K2rKquPDHm46rlfEEMHI
         PWC7LLzectgGbT0Bij6votMHQITHKPeCXLcdcT7DRbc9Awe5sWisk3ublnPD4PypT59M
         5gB72DBDZiZastARx78fbKoKcpJqi+e6Jjm11dD/X/3z2f1R0Mm7SFBEwX3p3lbJypfJ
         4CdL38+P/qNqu9TUUD3Vvsq0bzBH6mpwjWKroxp8zHWNNTfpxZWZt6+D3C6t1fmaTN8P
         LY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545568; x=1703150368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6KCWUfDFNx0O1wfeTExInhDSJOXnrOXPLAO9F5T2Tc=;
        b=pCXi3oe3QoN1L7ILCi+AvLfLpYrMxd91zjiTv1TVkICoZ0wvoLLjuFhG3BKICJpDsv
         uD+4qbe9NVQuWqqqGQyBnsKSXGd2cWHVmfp/iBxUXLOe65Fz//TYfF3apG4ULc9OH3FB
         y1rZOiETG9/UA5vga9z6UJFw+3dlvzEJ5zQIEQ0zBpTj7c+p04uM/T+t8T+MtCwZlHqi
         3sooLB5k85UZPMBktGKmsuiMmsCZPGfh8kW2/MaGt2GpNlAXXHcZDlqIGRdnKob4EO8V
         CHMBEHTx2H7kSVizbLlDFlVNBKY5svOzSnLAzKDe2GZeTvhDtka3hwFxRF46xleNW6zF
         FnKA==
X-Gm-Message-State: AOJu0Yxd8shcZ3hC1z0kH5xSzsJ/+N++8VAYb6Q3jyO1s1plgWXJ3mAY
	uuhq3wrXKcBpeB982mvl9aP85w==
X-Google-Smtp-Source: AGHT+IE+/WP/FC7LiEa4MnpNFglnHlJbYeul0msNqi5hQUjLnP0ubLugQKBNDKkqr12g0ooL+bvRKA==
X-Received: by 2002:a05:6000:4c6:b0:333:1c97:48c4 with SMTP id h6-20020a05600004c600b003331c9748c4mr4481255wri.7.1702545568234;
        Thu, 14 Dec 2023 01:19:28 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m11-20020adfe94b000000b00333504001acsm15470130wrn.15.2023.12.14.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:19:27 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes v2] riscv: Check if the code to patch lies in the exit section
Date: Thu, 14 Dec 2023 10:19:26 +0100
Message-Id: <20231214091926.203439-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_011933_408613_AFC26256 
X-CRM114-Status: GOOD (  13.64  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
- Fix XIP rv32 build failure

 arch/riscv/include/asm/sections.h   |  1 +
 arch/riscv/kernel/patch.c           | 11 ++++++++++-
 arch/riscv/kernel/vmlinux-xip.lds.S |  2 ++
 arch/riscv/kernel/vmlinux.lds.S     |  2 ++
 4 files changed, 15 insertions(+), 1 deletion(-)

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
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index 50767647fbc6..8c3daa1b0531 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -29,10 +29,12 @@ SECTIONS
 	HEAD_TEXT_SECTION
 	INIT_TEXT_SECTION(PAGE_SIZE)
 	/* we have to discard exit text and such at runtime, not link time */
+	__exittext_begin = .;
 	.exit.text :
 	{
 		EXIT_TEXT
 	}
+	__exittext_end = .;
 
 	.text : {
 		_text = .;
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
