Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A194C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bhWTUnhhtMPWtdzGJS/t6Ic2JiMogPpkcI1Y0NeaGQ=; b=wcZEiOXGrEL/QC
	rhmW/8L966FphvhzSD6/iLSOeFHWgTD2SglHvXkw2S7j6T01R5UYlmQ2bk8yQsfsEJfVPmg7qmVfP
	YwgT0ZcCR7ZOINUa8eW8VBgspXCoMoEoUPy6YSIUI9rZEU8Lh0ZqAZ92F1jzlpy4ClbPIoydNMOUl
	IPcJ/UUs2NhO1wINRwf06NW0pQPQ4Xd/q6GMAGlW/xI+IWuaVxn3Fx5UyLr9ccx9BS7j7GH0xFOzZ
	Nx5u2UsM2z0DIWIlkvR3Rvtlr/OMFxBI4M/MpxqP/9EOUuT7/ziL4ezJ0VDlTSG7+P+4y+E6Ezm3e
	ijpI8ph2nuWfQdxJlPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnWs-00GVTU-2c;
	Thu, 16 Mar 2023 13:20:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnWq-00GVRq-1J
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 13:20:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m2so1516354wrh.6
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678972822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNtcjIvt7Jcu6BbJu0k6G/sx5AHflabOU3bxX5prrUE=;
        b=L6eAT+smuQGoJO4DezL+IdwC0T7yTp/6MdgBgpSYGnzsE3GMtH0OsHZCA5KvkK/jsL
         SCQbzTNJRG+h5gG55AwIc3rp3qvPJ5HvHBpBdMMvum+UhNDX3K0d4mevTt2us+FFR9fP
         /SkYJ3PFgwjlEeZJ4QPID/NaQDyD2lSqhEWFJsMLe0iYwjDfErv7L30D/hLJYYVSFfx7
         jrT7h87/rKRPpMs9Aij8oJj9DBxmwR0E5LN3DULWfc0aFVYbJwTggaKYwjOlxm9f5rbi
         T0csEj0sYOg1wDUvvVEpshdAj9QA/fAZ/IJurP8+1WuNoMR3+2zSN2/cqzpGfR2FuvNh
         EyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNtcjIvt7Jcu6BbJu0k6G/sx5AHflabOU3bxX5prrUE=;
        b=PmcNDcUtri4aBiWFUv06XcktSkcbkMDC/PWJ3k7l8m9hPz5MyY/qm7idWxCgvHWtWx
         AAsoz+0kiTmQuR863RFattNTejT0LTXB0an3mZIJBV6eF5Ny4ME/dxmaQrA4qu7Rji1x
         fNu/RuoQqNUr1hfxb+qr3Gy3B2ecuchZLQWmBlmGj9Gv4LRaExWY2tboXV3bl7y/+55f
         ChLVoo7No5lIWPNJeb++t3qPMgFaRjBys/fvZGB9t0DlbE1YXRU3KAtia9tyCetUjYL7
         0bx3xBvOaxvs48TnInr29J/Mz59IZkkoltbI6nGpeylsNnJDh/qm4/8VCoiYOBcprtuR
         Egpw==
X-Gm-Message-State: AO0yUKXRuvVJWQoCcO4TQRpFQYxj2hzp4NRkjG3jSaGYGTcU5moFfyOM
	PvS3YKTB4aUSh6J9mp0Cn9uzow==
X-Google-Smtp-Source: AK7set98CBvIraFbTCbJWdo8CgRP1gvKzH5/GyoF0yuADO0rA+pPToO5CbtwnI+LruqnMYg8TXy3Ww==
X-Received: by 2002:adf:ce11:0:b0:2cf:e3d0:2a43 with SMTP id p17-20020adfce11000000b002cfe3d02a43mr4536359wrn.4.1678972821966;
        Thu, 16 Mar 2023 06:20:21 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (238.174.185.81.rev.sfr.net. [81.185.174.238])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d6544000000b002c56013c07fsm7218162wrv.109.2023.03.16.06.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:20:21 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 3/4] arm64: Make use of memblock_isolate_memory for the linear mapping
Date: Thu, 16 Mar 2023 14:17:10 +0100
Message-Id: <20230316131711.1284451-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230316131711.1284451-1-alexghiti@rivosinc.com>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_062024_443952_13EA0822 
X-CRM114-Status: GOOD (  16.34  )
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

In order to isolate the kernel text mapping and the crash kernel
region, we used some sort of hack to isolate thoses ranges which consisted
in marking them as not mappable with memblock_mark_nomap.

Simply use the newly introduced memblock_isolate_memory function which does
exactly the same but does not uselessly mark the region as not mappable.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/mmu.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 6f9d8898a025..387c2a065a09 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -548,19 +548,18 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/*
 	 * Take care not to create a writable alias for the
-	 * read-only text and rodata sections of the kernel image.
-	 * So temporarily mark them as NOMAP to skip mappings in
-	 * the following for-loop
+	 * read-only text and rodata sections of the kernel image so isolate
+	 * those regions and map them after the for loop.
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
 
 #ifdef CONFIG_KEXEC_CORE
 	if (crash_mem_map) {
 		if (defer_reserve_crashkernel())
 			flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 		else if (crashk_res.end)
-			memblock_mark_nomap(crashk_res.start,
-			    resource_size(&crashk_res));
+			memblock_isolate_memory(crashk_res.start,
+						resource_size(&crashk_res));
 	}
 #endif
 
@@ -568,6 +567,17 @@ static void __init map_mem(pgd_t *pgdp)
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
 			break;
+
+		if (start == kernel_start)
+			continue;
+
+#ifdef CONFIG_KEXEC_CORE
+		if (start == crashk_res.start &&
+		    crash_mem_map && !defer_reserve_crashkernel() &&
+		    crashk_res.end)
+			continue;
+#endif
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
@@ -589,7 +599,6 @@ static void __init map_mem(pgd_t *pgdp)
 	 */
 	__map_memblock(pgdp, kernel_start, kernel_end,
 		       PAGE_KERNEL, NO_CONT_MAPPINGS);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 
 	/*
 	 * Use page-level mappings here so that we can shrink the region
@@ -603,8 +612,6 @@ static void __init map_mem(pgd_t *pgdp)
 				       crashk_res.end + 1,
 				       PAGE_KERNEL,
 				       NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
-			memblock_clear_nomap(crashk_res.start,
-					     resource_size(&crashk_res));
 		}
 	}
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
