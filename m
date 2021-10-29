Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0596C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 05:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C70860FF2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 05:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C70860FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqZdH9mFoRyByHR0O8zSeG37hasuJ+3UXlMJhA/4ZDo=; b=HAEu3bwwpJQW0V
	ukbpNUc63BAn5tp+0lVcGzk3Xa95AQba1TmtP094P3ijgtniGx8p80EKCKbOql3tFCn4+IetYjvLz
	ru8wpp/AqZUZozpsB9LY/nam+6mZggeHsUKdVmIwFPLbsp+flfvu0ZTZcSmVP4gRrefpStTgDRlyb
	nxgrydEPeB5+u0KBoEDH4Obav2qDcX5ypT6F5CKPpJ3bVxCpc5vDMjPXPFAdvqRZDOsMDQfYzt6Cq
	tBR0zdHAORTscIMrtHjwqlo0Om7F9w4AdfeRcy8omZ94ioyRdSWbZxYZrHNEPuqjPnvHA7mYdks8k
	cTUM2uoN1e/4wV1sABpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgK1I-009pep-2q; Fri, 29 Oct 2021 05:01:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgK1F-009peM-MW
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 05:01:35 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7322B3F179
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 05:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635483692;
 bh=e3b9czu737yTY5HxipcQc4ldTFaXsWhzUIsobScJLNg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=v36YWjIpshGN28LmZTMlYTchrfEpRmm8zy7WhCu9jg6STXdT8AXsobUn6iJAdoQYV
 vhhAvKyVfCWIwbH4PAdv3Fp4BIOONErrO0dQsThVJpHRdwb4Uv8R0UzB/NfRyjTLql
 SK0Homo8QO0fvFdLy/PcgnSECPLPu1IV1c4ZkOq4w4/k4dkWVdmBmMO90fGOFgjzaY
 2B8R/2t/dS3tsrY0DmDxaHsN6NC6nFdE1wz8GFKxZr9VzzqV/5VjQhNRX6Y1EwP5rX
 w4miUWbHiVzY9OZzsY5uFz/2dYfiaLw+2K0YIG3DVPSIjeFp6XOmJvJJxmnyEw7CjV
 1Zs2Ko5tI9aPA==
Received: by mail-wr1-f71.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso2989770wru.7
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 22:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3b9czu737yTY5HxipcQc4ldTFaXsWhzUIsobScJLNg=;
 b=69w334uKBVv0gi2m/Zcun2+/W9e2012qP6lj+i0sxxN/ePi4odtYjQSDQY6dl5vZeb
 cS5RBfyX52WPZ2vGMP6a7awuuVzkdR06h9f03NKEns11VuR1kpGGwwum0FnAsxiDw8f2
 dbKGMATdx+W/8lq6soJDZEduQ/J6ACu6zgRxLxHiH8YxhAas6yK0dAJHNQ/9cQyvU54U
 Q1/b+A/6dBiY5m2fhGAukpSSDXTPMoIQAJjbQZtCtwEGHwMkzlIIrXbyW4Vttul54TsP
 2zMoTdYIaa7vUKzS8SH7t8YeHjcQrD9mq4ZR5I+PIi6jlbtT0WrX/DIomjsueesWiof3
 C/0g==
X-Gm-Message-State: AOAM5300aXiXLCjBneRsuoLd/yjBp2AcAUuBVKfnmQDNvFO+3vZgPW6/
 rIr3BnnfbiQGMV7zy05V+NDaxDltDAWAADJnvvtqG6FlF6nijZajSsbKMOYAJEKDBAlL52it/MX
 hqsj783t03UyUdcABRsHY+X6dEgPYkCcaZBfHqeuf+Xftqg==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr11163979wrq.411.1635483692206; 
 Thu, 28 Oct 2021 22:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy45uLdWITkTDkf90WKQstb5F5keb7gLh0VcPQewoIS+qMfoL4pR4HNkg5Z76EZjhtB6K3l1A==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr11163947wrq.411.1635483692049; 
 Thu, 28 Oct 2021 22:01:32 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id g7sm6260959wrd.81.2021.10.28.22.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 22:01:31 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/2] riscv: Fix asan-stack clang build
Date: Fri, 29 Oct 2021 06:59:27 +0200
Message-Id: <20211029045927.72933-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
References: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_220133_890802_4D7977E6 
X-CRM114-Status: GOOD (  13.80  )
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

Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
Kconfig, it prevents asan-stack from getting disabled with clang even
when CONFIG_KASAN_STACK is disabled: fix this by defining the
corresponding config.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/Kconfig             | 6 ++++++
 arch/riscv/include/asm/kasan.h | 3 +--
 arch/riscv/mm/kasan_init.c     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c3f3fd583e04..6d5b63bd4bd9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,6 +163,12 @@ config PAGE_OFFSET
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
 
+config KASAN_SHADOW_OFFSET
+	hex
+	depends on KASAN_GENERIC
+	default 0xdfffffc800000000 if 64BIT
+	default 0xffffffff if 32BIT
+
 config ARCH_FLATMEM_ENABLE
 	def_bool !NUMA
 
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index a2b3d9cdbc86..b00f503ec124 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -30,8 +30,7 @@
 #define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_SHADOW_START	KERN_VIRT_START
 #define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
-#define KASAN_SHADOW_OFFSET	(KASAN_SHADOW_END - (1ULL << \
-					(64 - KASAN_SHADOW_SCALE_SHIFT)))
+#define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 
 void kasan_init(void);
 asmlinkage void kasan_early_init(void);
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 89a8376ce44e..54294f83513d 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
 	uintptr_t i;
 	pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
 
+	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
+		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+
 	for (i = 0; i < PTRS_PER_PTE; ++i)
 		set_pte(kasan_early_shadow_pte + i,
 			mk_pte(virt_to_page(kasan_early_shadow_page),
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
