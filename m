Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5668C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JIsdvyAuEhNxYATDrT1nj908uqwbhLfk8qwUd37dago=; b=FVkzJOR2p+uSxR
	rJRcxgk6o0o1STNPpbe5aSIHt0QA6YK7luHdBrobOq2DdIl66p+4Z4Uf5pKzuOekNaXtHWFdoKJES
	iJ23RXCjxsvH7YKjYLjuzAZBSSIhSTRF24eES6KikJalh90ov0trzeXk2ZJtzSGoc2raMOk9Miofk
	puWI8eGGg+ucSkr3SLl6chJXR3NdsAOZ4nHK19OK60+zZOLSUdUJHbC5BaQRCtVQKIlIfiQNBlJQA
	hNuWm8ep/nafhffSBRZF/HvQfa5fzzz47SHdfcRWt07fYcn3gITKNYlfDW6S3u5womHkj2gRxBXaN
	emaXoyEmTk0e7CP7pVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppaHo-008tme-0r;
	Thu, 20 Apr 2023 19:49:44 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppaHl-008tmJ-0p
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 19:49:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-52079a12451so1088484a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682020179; x=1684612179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UtIV1rNad+J3zNsKedH1zIW6ZGZZJZBqOnwneD7uhk=;
        b=USPH5vqFJff9A1Oux9rh+4fIhd2akT+l2CVCPVya7BR8ATdGcYQJ30iedgbwQwhrwM
         Dy2n0hD2K/9hF7IuePSh2ZNH8q0uCzE+cKoLXpwzOxYP8J7cCQD1fL7wPuO3GsOVzWKF
         ysapgyhSVbgAUWR3VO7GI7WPEzEP8nAUDZkUrkqcQzYClSWkN9wXCDiNZzHqxiApod1U
         dI8OuOXA0qMeIhWG3W+gAK060cJorOhGUaxwVAWjV6DjiioAu0ml9L3ODLgR7cGZNEiV
         Ffd5G7V5LrhPq3UVBiMh7OmutIZAL9SIL6wyEH39YUlY4MobnrJzPdf77Da7rfv4o8E/
         6n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682020179; x=1684612179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UtIV1rNad+J3zNsKedH1zIW6ZGZZJZBqOnwneD7uhk=;
        b=debn8vPbosAnKuXI7ZYR1u2JP4r7NQO7aaw+lLOea+XygwMaId8QzOguAx/FSqvfy6
         TgtQHA2c/66Yc58mS1Kf1q7/+UTyNml6ddm5kFtObDNAyd+CBju3lwrlrbLpW7EULKi5
         0deVQRxcGY59qUqAmHy2cD0XlhmXzyb2UsDsFxvKF2U0Ou/mEvWKh3rlIwL5GvoE7vEx
         hsTNeSEd98rvBaa9Q9FRE0FALzvcY5k3EJTcaeARhr4FiW6PkoOm5pF4ulswQQUe5lOu
         fKJ0AdOIg4deVg0TnSZgViBz9OfjvfE3je8U0srVpZ8IgC1mX0CyLlcvDR/uCKER9Agg
         J/MA==
X-Gm-Message-State: AAQBX9dBEt1FiQk0uD1AmNBmRv78vR7zN7NcZnvsfpBF/0/UdC8waO1b
	SEL6Yz77iK7Wch2y2GFBDV3hew==
X-Google-Smtp-Source: AKy350b0kirUfjsxMugPMVjEp8DXcYkAaH0bwjlPrCUmR6CEf9zui9W0nRlSZFo0ZIo5fFxgbUJ8dg==
X-Received: by 2002:a17:90a:6486:b0:247:abb6:1528 with SMTP id h6-20020a17090a648600b00247abb61528mr2653185pjj.2.1682020179089;
        Thu, 20 Apr 2023 12:49:39 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn14-20020a170903050e00b0019d1f42b00csm1514395plb.17.2023.04.20.12.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 12:49:38 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: hwprobe: Remove __init on probe_vendor_features()
Date: Thu, 20 Apr 2023 12:49:34 -0700
Message-Id: <20230420194934.1871356-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_124941_299713_4A6A0B98 
X-CRM114-Status: GOOD (  14.42  )
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

probe_vendor_features() is now called from smp_callin(), which is not
__init code and runs during cpu hotplug events. Remove the
__init_or_module decoration from it and the functions it calls to avoid
walking into outer space.

Fixes: 62a31d6e38bd ("RISC-V: hwprobe: Support probing of misaligned access performance")

Signed-off-by: Evan Green <evan@rivosinc.com>
---

 arch/riscv/errata/thead/errata.c     | 6 +++---
 arch/riscv/include/asm/alternative.h | 2 +-
 arch/riscv/kernel/alternative.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 1036b8f933ec..a86c4facc2a6 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -118,9 +118,9 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 		local_flush_icache_all();
 }
 
-void __init_or_module thead_feature_probe_func(unsigned int cpu,
-					       unsigned long archid,
-					       unsigned long impid)
+void thead_feature_probe_func(unsigned int cpu,
+			      unsigned long archid,
+			      unsigned long impid)
 {
 	if ((archid == 0) && (impid == 0))
 		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index a8f5cf6694a1..6a41537826a7 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -30,7 +30,7 @@
 #define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
-void __init probe_vendor_features(unsigned int cpu);
+void probe_vendor_features(unsigned int cpu);
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index fc65c9293ac5..6b75788c18e6 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -31,7 +31,7 @@ struct cpu_manufacturer_info_t {
 				   unsigned long impid);
 };
 
-static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
+static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
 {
 #ifdef CONFIG_RISCV_M_MODE
 	cpu_mfr_info->vendor_id = csr_read(CSR_MVENDORID);
@@ -144,7 +144,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 }
 
 /* Called on each CPU as it starts */
-void __init_or_module probe_vendor_features(unsigned int cpu)
+void probe_vendor_features(unsigned int cpu)
 {
 	struct cpu_manufacturer_info_t cpu_mfr_info;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
