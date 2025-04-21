Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1425C369C2
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFU2NVb7aCOrTwaQG//Z6fqX73OM6VHcwPJ/sr6bDDo=; b=L7GTeoZa+zzH/w
	i+YqrYD7ZHeIPLHjzqKxn6vhI8xNkMkQF77pEZVCecTmAHkLUSXO+P8PR75SUTe41K8uuCLdvjPHj
	nVaT9Ny7XECsD8SJA7oDG5J1d7F8AG53qCm00hLbqD6D5g+hUlR7xVLz6uAYqVXKoi1sE0IVbxTJ6
	ABm4YFl+MPQZIOE2sGbkIPl6Uzn/z/ua68rOE4sbIEGVBOXPlXqFhAHG+H9/1s3O6XbWLjV8K70Nd
	D/Opn/WLjpwa/yvnrUnYktlssNaqGIW4iwvBqS/QGBhLP/poTyAWRJ5lGFT/VgAaeNgUuV0QSuUdU
	4+atAxAVZu6cuRvY2dEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s8O-00000004SUl-3OGl;
	Mon, 21 Apr 2025 14:28:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s8M-00000004SU8-0y7f
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:28:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0782d787so29475175e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245709; x=1745850509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgXsecntwfRSGjrcDXCs8qD6E3/9J+RIf148wqrIpWA=;
        b=HH3A5DlEVf3k3nz5Rsqu34m5hVepjHhDoW60oeK7b7TZ1dQSOsKXfCjX9AVtvGmynH
         aJqXFtBbczGGJMg6TXTIO/QCwOJ8a3r//2GXhzdw2pQdAkPYjBzbu/6UZo0LN3l7sehU
         3o1go7konkQSrrIsSwwwR1WfpcQLjKRtbclQ2JLFG3wVSkCH6HjXNpo4kl5FOAhPbA3c
         xF3s+Q7tZg3w7GYRtPwVsYl7zno5X0NiwVNI1kFQttPutHYeN7BoBVWuEka+3pE+/5KS
         Lb8j500nsoFTSGHrq29vvtBj0VuxqL6KFgiGj1Y19ZXOlucQpkLZsguRjc1Krb8Lf4+T
         cvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245709; x=1745850509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgXsecntwfRSGjrcDXCs8qD6E3/9J+RIf148wqrIpWA=;
        b=ZSpujNChgNVXyg7g0F9V6/Pcnzx0orXIuV3jkJT0St9GGL16VQS4x+bFV0suR/gzCL
         4jlkCPNcBb6CU25c7/Xwh5CGSOAaKv6KMwT7P115lSbew59o3/87cVSkn1O1YjdpyGQ5
         9gwnqkcP71GF7QSVEPN3Q6VCYGuBDbY6/mV8+XoQKP60hyzXOS4LS3doLg/s6L6JoFxK
         9UHqNFgThR9jqJFzSkItj26miQlJ9kll0UJaWbxWEHTj8QiwFVl6DLWzfggb8NZla5QJ
         0AdBcbdAgBmTuc270TZXeBY69vpKodR6I9LZSM9BLSq9tmZscKAu8nci9MQvnT25vCCO
         hgRA==
X-Forwarded-Encrypted: i=1; AJvYcCVgKrqeTQWQ+IyREKBJKYokzN04eJHhEW3GVbVEURNtWNd6g/xmukHK7tD89NnlsaoFdbzGqLFZFhTfcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcSRCXVc1uJxs9tv00g++GEC+PbM11cb9fD0krqEFqFD9NL2ID
	wCr4RFk2a6xMsO1C1lk2/clCmoqemuSn9XQukYg1UBtzp3/l2jdPg5y53m6wJqo=
X-Gm-Gg: ASbGncv+XEwoO30E6ey+EYw3KKoj2FkM1KjE7yIvOjq/2EGM1UC1gCUMn2x38teHJ9y
	rvnabmWIqudDz/4uU/efRiFr7eOwsbH8gTz74WHXw8qFmVMg+6mJ+w7OruhSEWan82QfC7hFX3C
	0uKJuFyd9A4I+vjYLlfrgnlzCX/bWZBAteiUYnKsLiu8ljoqHLZHyWpdMzNgLck1DBqoEBeYV3c
	tNqUb8+n+6ksBdxGg5dL85pwjaheYmx5bDhL/Aei4YCTF4C9lodh1IVe9s72QW70/x3KP8M7fOW
	fPoaTT1GawePO+4IT2qgvqaan7dkz9UWdSr3IRi5V7VlZJIUQwZE/Zpo3LE=
X-Google-Smtp-Source: AGHT+IF004bhFEXPI3CCJKmdwXsLTAbZYWv5EdIm3QZ5L16mdpCbU2yQOcrSdZib/PGDekiXc//UtA==
X-Received: by 2002:a05:600c:8411:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-4406ab944edmr112676395e9.12.1745245708719;
        Mon, 21 Apr 2025 07:28:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e1bsm141981795e9.8.2025.04.21.07.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:28:28 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 3/4] riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
Date: Mon, 21 Apr 2025 16:24:40 +0200
Message-Id: <20250421142441.395849-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072830_269937_B9F26509 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Enable Linux prefetch and prefetchw primitives using Zicbop.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20231231082955.16516-3-guoren@kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 09d4c963399a..39dfab495a4c 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,9 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/insn-def.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
@@ -135,6 +138,27 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
 #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
 
+#define PREFETCH_ASM(x)							\
+	ALTERNATIVE(__nops(1), PREFETCH_R(x, 0), 0,			\
+		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
+
+#define PREFETCHW_ASM(x)						\
+	ALTERNATIVE(__nops(1), PREFETCH_W(x, 0), 0,			\
+		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
+
+#ifdef CONFIG_RISCV_ISA_ZICBOP
+#define ARCH_HAS_PREFETCH
+static inline void prefetch(const void *x)
+{
+	__asm__ __volatile__(PREFETCH_ASM(%0) : : "r" (x) : "memory");
+}
+
+#define ARCH_HAS_PREFETCHW
+static inline void prefetchw(const void *x)
+{
+	__asm__ __volatile__(PREFETCHW_ASM(%0) : : "r" (x) : "memory");
+}
+#endif /* CONFIG_RISCV_ISA_ZICBOP */
 
 /* Do necessary setup to start up a newly executed thread. */
 extern void start_thread(struct pt_regs *regs,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
