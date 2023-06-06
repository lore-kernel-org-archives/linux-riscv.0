Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46872C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfZjFgGTUdmIlmveJxmpXQLNjoCH93EH6CxAS6LgLHE=; b=lQMof7xo8eG8lk
	QBrPbV3GuAr/kSDy1hFR8eEZjPCPV/LQwg/yQvD8lus9aH3V6vXC/mcc7anU2ljNFvFEkCe5HPW7N
	mGxNz46dX7DTfiMtDsAtZ6DA+MKu6WXyxjKTZ2/XgERbBjgVa0RmouEQldZ42luXnF4JoOosuYp6d
	jNki1yo8VydK5oQBoU86idaMqV5iT41z13DT08i4vEk2JoK0ZwUKYzFjwjX+/vCOaQM1veTwVVBd+
	i4aXTAoYTfW1+nosMuaHyqGOvOrDZoEtjMTGixJhlUAqT41VmmFYmw2gCSSAQPgQT7sztGDm0sZBO
	aYBwJaOk8ifvOWVscNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vtm-001fCX-2x;
	Tue, 06 Jun 2023 12:34:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vtk-001fAc-0f
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 12:34:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30c2bd52f82so6165268f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686054888; x=1688646888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq9OyV3mwmC73gp+6x0dBZhacfbP8G3diQ395jfv3ok=;
        b=xAuP23Wcm3hJ5u8RuGjA2DSAbeDrzRgabDjApm4qSM07TMhu6FLYH9iwZaoDInpmDC
         TdKoIkrHFaKFCu/85WvOwVL05y8FXi+YjCkz7OWcaDH/jvP1QAWUOY7a6/mXTEMaL0SZ
         pmNyYSMzavQxZBW+Gu6os8YyhBxvHab43kmPrSZbmb9GbKLOa1uok9LUHfn+zf+Bq79l
         bppDiuPf6YpINhHfIyYOk1WxQmjamzyVf/qudYH/8tLeVwSy0H26zzF6l76oA8cEXPln
         uXreK18yVq7HxjizfNBE2Lpz4x6JlqtRcgHQXGrCiAo/KlJjEweNm78mMEz2baajP+Sn
         dm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054888; x=1688646888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq9OyV3mwmC73gp+6x0dBZhacfbP8G3diQ395jfv3ok=;
        b=CehRb8FRDd5Hk9NoaSiQIainbYTx7jGlSAN1yMbOhMJbd/A3fJ/HDnixyUnmeBIO15
         fe2gLSOsDQymave1USycsD0UcYfqTEAvguYJdSEwOD4KsnntYNhx1nHgzra4dBk6yqV1
         jNIatBUCoQ08tb3hQ0aSh0yllvv6UxwW/il1NaAGNpG3Icl3zVfJIokFQUvPBPl0xLCs
         FEzLQS1IroUQxzNyrUyUqJwLecY9WENfoO8eLEmDH4yiJsWvux8mGaz0rEJ4ugOJzZum
         VqlYpt+YwBh96/hkDysFWdILtx5HpYLrTwkGDX4jQyRzEz0t1fRRJqa+1Db2UxGWs7RK
         g7iA==
X-Gm-Message-State: AC+VfDxvitlRW6nrr49xCz34oo3mA12L3EFjdEO9AXe9B6EAu07oJwOt
	qOX3AI6QNqGu/8Qp7QeskzwSog==
X-Google-Smtp-Source: ACHHUZ67BAHFCKRSpo8M5O911pekcPA9VZ39wl/9TcZcQKJ9eaNwpGlyHE+DRD1KIAuIueM7CGQNVA==
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id x14-20020a5d650e000000b003079da1c9d8mr1661958wru.4.1686054888256;
        Tue, 06 Jun 2023 05:34:48 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bc5d8000000b003f17848673fsm13979481wmk.27.2023.06.06.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:34:48 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 2/5] riscv: Dump out kernel offset information on panic
Date: Tue,  6 Jun 2023 14:32:39 +0200
Message-Id: <20230606123242.20804-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606123242.20804-1-alexghiti@rivosinc.com>
References: <20230606123242.20804-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_053452_249751_A4909E2C 
X-CRM114-Status: GOOD (  11.10  )
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

Dump out the KASLR virtual kernel offset when panic to help debug kernel.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 36b026057503..ae5c4c2971ca 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/smp.h>
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
@@ -329,3 +330,27 @@ void free_initmem(void)
 
 	free_initmem_default(POISON_FREE_INITMEM);
 }
+
+static int dump_kernel_offset(struct notifier_block *self,
+			      unsigned long v, void *p)
+{
+	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
+		 kernel_map.virt_offset,
+		 KERNEL_LINK_ADDR);
+
+	return 0;
+}
+
+static struct notifier_block kernel_offset_notifier = {
+	.notifier_call = dump_kernel_offset
+};
+
+static int __init register_kernel_offset_dumper(void)
+{
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &kernel_offset_notifier);
+
+	return 0;
+}
+device_initcall(register_kernel_offset_dumper);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
