Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE0C54F30
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1baXPx9r+mhtRYp8Lwm3jMlW+ayianDSYxiAHg1Mvk=; b=MSYRBEdlN1wvRQ
	NVhGYwL4RbpDyzt/VDGYR9Fg2QyvqqLiybZns2jPuMIj4KGxbdKQoOj88mjdqzpQTY17ySLXw8N1i
	j0BZ4XrIg/FgL8xxemZuF3qpzbtME/c/Guz5xxY33y8t/f0H6iudJS0jFfUUY54SzmQTPYEnl89ji
	zoJxleWE78fNK9773/59AG0MX3UcHc3mrB92BV4gqI21lSlxKzD2pNFdRe7dAixLoWKSxSZTJ4GuH
	5IT1xGTXDR9XjpZsjKzniHt0ngWUKnb6s6Y0ucWRW27wKU6eQeUWr1Hdy4yQSAE3plZrg/Xx/RJSs
	qzuutsYZpSz/bVCIeDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDy-00000005yJ2-1qo9;
	Sat, 24 May 2025 15:55:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDw-00000005yGs-0gEh
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 15:55:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23205d55bf4so6219965ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102147; x=1748706947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XEj2bDzjI5RZaf4AQVAydyOkb+dFtV7mE+ztvzkolw=;
        b=dsmWB4u5oBiRwYK/SbWjuJ11piugQSEDMJ+Jy/5XdjahXJCl/mdn2BjlYYekgZAYXZ
         L4bJo3uukJ5GOTmnj6iIsJ/1gFTCTV+XywYo+Vyc0cUxfEN7Nrv63wVjDqfgNI5IpBFG
         raQWTbEd9wacggN7WWFZ4fT9ETfVTi6OvNtTKYPBrK0KqpuRbgECOkupmskVixB4aR8M
         ZvcYDOmZDBsqjfiXALz/bgMj/XjuOBOM7tbxqAoNJmlk3zKCdajdEF8h1hzNJ89iN2tp
         Wn1DJ7YYPYVILZsx8kjUGDg32DOto+CkdnLhEUtrPLLOYXiKwgWbUUGImPLQfQdoj9lY
         v+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102147; x=1748706947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XEj2bDzjI5RZaf4AQVAydyOkb+dFtV7mE+ztvzkolw=;
        b=vJLgRAMbJ/T+ZisNb8quN/c9HJpGZJtVkcg3RSehpGlna5yCv2vI1drCnhSmLNB/3X
         I827o2b20VOgk3uv/EUXUU8iFX9RfwEPx/hLBSbvlH2qauLsfcXCTU270rPEuqMOb09C
         wQTlONQwDodMvc7A5O+TIPwimjUtfVKRccV9QWnNsK171nkRsz6VtYOjnyWbthB7w6g6
         xVdScj4lFophK3Zxp3xn0MFSbWWsvnTZ0M5mcbaom75TwM8dpHy7/59bFKUSOunidu2Y
         phGpdZ+2LnQSShuFnPcIHXgJeqK5KE+b3NBGJXJTxlTo7+w/f1ypC3jGE50seqWLvi1h
         xxXA==
X-Gm-Message-State: AOJu0YzdIj7IVZKWwo4BKQblPM/SYc7Q5/P3UZ+hLUDiMxVHq1AY1z62
	D3HvtjHm3vUUbHI73jVrqhIfICOl1peSyJl+6n02dHpLkuyUEuLqEUYHl2qttg0M
X-Gm-Gg: ASbGncuUkIXXmwU6jg33M3Qf27GODg5wVEIYoeDbtfbbkpReoxG1gwb53PfQbres9qi
	b7wmUsL2rm9Jzh6u3AioQiLX2uU+UZle5qeDx0bM7s/hg9IeQZ/mXtPc1pDgshNw6PVe/PBHOa9
	UUd5isT5mskLu/bcGHwSGp3UdU3+On8D7f5jC4KnZYScyCtxBCe3/Vfz/EA4ByS3s/jvKB08UFg
	loFBb8uFtJ2QaXFQ3TfPrFwpD1w9JuIepuIHzmbVUewSo8WFaPDvLh1jCtwuBo23542H8M11Pwe
	OzAD/WX8cS2Zamah/F20KXsas7AauM/fZM00r+ejmpsC5HMDGwxDqNAmshb8ogRcx9rgbwEmCvt
	rFQi995Uc7bTprN6h
X-Google-Smtp-Source: AGHT+IFJr9YZ2XIjARlbWHrAZjs3d7ZcQweRgWi1fq4Jo17NP2mGsaaRzDetVmjg1S6Cr0UjlcknLA==
X-Received: by 2002:a17:902:e80e:b0:22e:50e1:73e with SMTP id d9443c01a7336-23414f49fc9mr43253575ad.14.1748102147183;
        Sat, 24 May 2025 08:55:47 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 3/3] riscv: Optimize gcd() performance on RISC-V without Zbb extension
Date: Sat, 24 May 2025 23:55:19 +0800
Message-Id: <20250524155519.1142570-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_085548_209472_C3E9CD71 
X-CRM114-Status: GOOD (  11.70  )
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

The binary GCD implementation uses FFS (find first set), which benefits
from hardware support for the ctz instruction, provided by the Zbb
extension on RISC-V. Without Zbb, this results in slower
software-emulated behavior.

Previously, RISC-V always used the binary GCD, regardless of actual
hardware support. This patch improves runtime efficiency by disabling
the efficient_ffs_key static branch when Zbb is either not enabled in
the kernel (config) or not supported on the executing CPU. This selects
the odd-even GCD implementation, which is faster in the absence of
efficient FFS.

This change ensures the most suitable GCD algorithm is chosen
dynamically based on actual hardware capabilities.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/kernel/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7c9a1caa83e..f891eedc3644 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 #include <linux/panic_notifier.h>
+#include <linux/jump_label.h>
 
 #include <asm/acpi.h>
 #include <asm/alternative.h>
@@ -51,6 +52,8 @@ atomic_t hart_lottery __section(".sdata")
 ;
 unsigned long boot_cpu_hartid;
 
+DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 /*
  * Place kernel memory regions on the resource tree so that
  * kexec-tools can retrieve them from /proc/iomem. While there
@@ -361,6 +364,9 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_user_isa_enable();
 	riscv_spinlock_init();
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
+		static_branch_disable(&efficient_ffs_key);
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
