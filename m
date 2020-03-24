Return-Path: <SRS0=58eF=5J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D50FC41621
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2020 07:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2D42076A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2020 07:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huNibd9G";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FFPXtP0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2D42076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEXvf7YM3IfG8+Nza4lz7YWo/aCxS7DRWP5Lj0YYBjc=; b=huNibd9GKkmBQ7
	4EUx80IFZlmqZiXBZSahDlWKgiwX/XCuoSbJylcilfbiKL8xH/eHpMSBc2k/rWHwVkK6R5q8fwnLN
	J7BbtQmRUBeX/LwBWo6oWlFa+p3nugSIAiBjEd0uI3UvReMhaIMh0D6utD5K79J+cKRdwhudTSDUp
	awf3Nuq2Jyff4AlEHRyYGR4IgbZX8jk1ZyMVSZXjN6t8snJUKkS3STaY5rdvf5JSR1Gv0viDyZaCi
	5lRj1heiC5NTxbFaVK4+82xAn6dWdbzurO37rpkEZqbVgHil18vxMMFJOtKhhPsNNqVdZZJmDMc6C
	8ZPMbD/L8Z5HaLi9okUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGe1t-00048I-7c; Tue, 24 Mar 2020 07:31:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGe1k-0003vi-CK
 for linux-riscv@lists.infradead.org; Tue, 24 Mar 2020 07:31:09 +0000
Received: by mail-pg1-x544.google.com with SMTP id b22so8597903pgb.6
 for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2020 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEXvf7YM3IfG8+Nza4lz7YWo/aCxS7DRWP5Lj0YYBjc=;
 b=FFPXtP0JGFZuxhK64DdBrFFIn56NYFvcpNK4yw2jPsrNBzClysK7yzg71194N9zxlm
 DahcEGASnS2ix5XgdwV4Lo9/xTQnS7dbdexFOYf9D9V/N1n6i5a6r5ro0rFbNJFZcj11
 zLkBMr4Vt++GfCQOzTAFEa0m+Wvc+ZyFp5Z8gZl6H6Yrdc0JCKu7QON2n2vuswysspfK
 FjefZR8RpVRjH6rQq94sITHb2ZfhG8tVOzJJsl4bUe2bFTLcio7f5m4GDprt6yrHDQlf
 fJJiesOscjpShsShndfOjML8ZFBlEYONjEBWGDRYn6lcWE46TdJ+ecom/MTHMqdtm32f
 wAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEXvf7YM3IfG8+Nza4lz7YWo/aCxS7DRWP5Lj0YYBjc=;
 b=Tvh5yc2LbKHSvRHbU+KIq0f45BSmavkmz4FQm7NBJq+HvsdrEzkm0TsH7OdDUJNRtA
 Qb0QWBDSEYfCtWGs0X9SjZG80JmMlfG0IMxg5+F+mNPllUNxl9CMMlclJj7EqUGiskao
 OR2yzc7Gl8iVBkHluH1//NvnlNihfkWo5DxCWURbgExE6jXp1Rs/G4adjPw1RAh3HFYX
 eCJ84W/C3O7C5FHakH5Y4Hbp/uKcaRpIEe2ydfVNG1CwWVNwcA0tycks1neGYd63Urdx
 2vwsbztdKx92EtqB4a1VhwO2ePeuF4khg9JozEPPAl4Qg2ycrF8XJ5+d//I2fxQ3jW5q
 3DIA==
X-Gm-Message-State: ANhLgQ0S98NCNoWqKxgMvQS2SXRmgZHQxc8GZS+rQE4VTVGFKQ3SWroN
 5F6PZlB4tghellRJ9vlsXeROpA==
X-Google-Smtp-Source: ADFU+vsdrPgNn4KpM07PAP6pvwMAOBhla8yo85VYdbcgVyUYoPwTMJ1rmnsy6w33qY/lkhlyJ+8YlQ==
X-Received: by 2002:a63:7c02:: with SMTP id x2mr26880475pgc.236.1585035067681; 
 Tue, 24 Mar 2020 00:31:07 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i187sm15124648pfg.33.2020.03.24.00.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 00:31:07 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 6/8] riscv/kaslr: clear the original kernel image
Date: Tue, 24 Mar 2020 15:30:51 +0800
Message-Id: <8373a9d18958b99b72ed9499786dffe45adf9617.1584352425.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1584352425.git.zong.li@sifive.com>
References: <cover.1584352425.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_003108_440084_43CB000E 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

After completing final page table, we can clear original kernel image
and remove executable permission.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/kaslr.h | 12 ++++++++++++
 arch/riscv/kernel/kaslr.c      | 12 ++++++++++++
 arch/riscv/mm/init.c           |  6 ++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/riscv/include/asm/kaslr.h

diff --git a/arch/riscv/include/asm/kaslr.h b/arch/riscv/include/asm/kaslr.h
new file mode 100644
index 000000000000..b165fe71dd4a
--- /dev/null
+++ b/arch/riscv/include/asm/kaslr.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 SiFive
+ * Copyright (C) 2020 Zong Li <zong.li@sifive.com>
+ */
+
+#ifndef _ASM_RISCV_KASLR_H
+#define _ASM_RISCV_KASLR_H
+
+void __init kaslr_late_init(void);
+
+#endif /* _ASM_RISCV_KASLR_H */
diff --git a/arch/riscv/kernel/kaslr.c b/arch/riscv/kernel/kaslr.c
index 59001d6fdfc3..0bd30831c455 100644
--- a/arch/riscv/kernel/kaslr.c
+++ b/arch/riscv/kernel/kaslr.c
@@ -356,6 +356,18 @@ static __init uintptr_t get_random_offset(u64 seed, uintptr_t kernel_size)
 	return get_legal_offset(random, kernel_size_align);
 }
 
+void __init kaslr_late_init(void)
+{
+	uintptr_t kernel_size;
+
+	/* Clear original kernel image. */
+	if (kaslr_offset) {
+		kernel_size = (uintptr_t) _end - (uintptr_t) _start;
+		memset((void *)PAGE_OFFSET, 0, kernel_size);
+		set_memory_nx(PAGE_OFFSET, kaslr_offset >> PAGE_SHIFT);
+	}
+}
+
 uintptr_t __init kaslr_early_init(void)
 {
 	u64 seed;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 34c6ecf2c599..08e2ce170533 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/set_memory.h>
 #ifdef CONFIG_RELOCATABLE
 #include <linux/elf.h>
+#include <asm/kaslr.h>
 #endif
 
 #include <asm/fixmap.h>
@@ -649,6 +650,11 @@ static void __init setup_vm_final(void)
 	/* Move to swapper page table */
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
+
+#ifdef CONFIG_RANDOMIZE_BASE
+	/* Clear orignial kernel image and set the right permission. */
+	kaslr_late_init();
+#endif
 }
 
 void free_initmem(void)
-- 
2.25.1


