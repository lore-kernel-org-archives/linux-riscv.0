Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5569C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UA/muhV6oOwiESEWj3gKoAsRJcZALXFOISm7iLeF+BM=; b=cGr+Y9hmoaol/h
	gyX/F5nawBTM7PVY3Mu4fx4Gk9r/FI82qdbi/x3LygW4vKw+tpG3J8W0Zv4vLI8ccQIiml6Tgy8sI
	Z5tqUGYpECCqvbo47QGyXLsZ59FlthEtBTqxrgZHM8PlivVBc694KZ1CRQGmlRbKkZ08b44ZLodej
	yBVFDHZtmJmL9shILhSx0h/esrDBgVBpt24+c9xTwgJlQLhxxADafs2mFaAjRu+hU+h2Tm6FG8hM6
	ET41I85ksE1wjIMEqlQZLMjBwG7uNSP6TQEqAeb8P7rkh88ylre5U4+fPganQ6i9albfLcaggEoZd
	mZ65BvEh+cfN/eKWNJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZC6G-00000001qk1-39Hv;
	Wed, 31 Jul 2024 16:22:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZC5y-00000001qgE-420f
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 16:22:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fd69e44596so8952405ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722442953; x=1723047753; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=5unxTmmxDtuJ6oKS3unsyO/BbIx/hjNzeG+OSpNJFyQ=;
        b=vt+TF++UwabS/QhPLWptO+RlXEv9IjRDhYgzU5onKWfBx2YxG9Du908jqjWSP2CyL6
         ejhmCHijqQQRFsn9GMcCCtaGvdjXA/zjZkjQDmiO16aBH/u4wCPkGP2QOyca/H3Zekli
         7fXEgIvGr4TXO3iIRh9RuqpY63clNOgndterLuAgLPF59uQUFpyuCFkUTXXoEeTnKV9/
         tqvbGUAQtZa38mNNOrPeeNLBDarx1HxUMvbXQJuJTUXy1/Z4CfrdMsBlzrEvlon1xJP9
         N8J7J99dRvFgZWGvtJ10tPmdiryTrqle2cTOwCwLK4dto6cUIcydvoi8w9jOVCt4rmkx
         QczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442953; x=1723047753;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5unxTmmxDtuJ6oKS3unsyO/BbIx/hjNzeG+OSpNJFyQ=;
        b=j5DJP0rY7GuhERsNaES4/p+So1R8gkeous5hEqi4YUn15DMEpb660AvOyY2rsOisAg
         /W6Nvc746aWBooIUk0FKMhdIo0ns1lfwAcNPnA8qW/Zmsik4PGgHl8X53afjgg580/7W
         d20YBBU79yQodhDWggFIT2m9/G2Q9z4YwM7PcLDGdzRtlyL8MAyh+VU9kAeT0YuYG0un
         Z36IoW9YJdI5AmJgMgWBxioUYSNlGk0nZkJK2AgrW4uO3Gz/+OtsbasZ1kJ6JADocnlD
         YWP+WHXcNO7ygNsw57RQX7IhMRVuLtuJ/0gFslAJt1dGiUzB4na7g1Wa07zBXUHXSgKj
         Muqg==
X-Gm-Message-State: AOJu0Yz03HBl/NlY5xLJoEaFX7REEUk9rg6Ny+4J3auG5JxBrTn8LCso
	gAJUTmnXKjJxBmiOEepWbSeLsOrYxeM09BtolyTWHNLXcCb5xZrHhm9NrtKfWakkPkmzMw/Vs/t
	z
X-Google-Smtp-Source: AGHT+IEVR3KtFKoVUokiDdLzkcXnzyiqYuHTKbhKTn2tdhGOJEuWOcd0riKhSWwUYwk+cxujbyeJGw==
X-Received: by 2002:a17:902:d590:b0:1fb:7e12:ee41 with SMTP id d9443c01a7336-1ff37c1ff84mr90779795ad.22.1722442953105;
        Wed, 31 Jul 2024 09:22:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff23ff5997sm60831245ad.267.2024.07.31.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:22:31 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
Date: Wed, 31 Jul 2024 09:22:00 -0700
Message-ID: <20240731162159.9235-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_092235_038706_718B06BF 
X-CRM114-Status: GOOD (  13.65  )
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

I recently ended up with a warning on some compilers along the lines of

      CC      kernel/resource.o
    In file included from include/linux/ioport.h:16,
                     from kernel/resource.c:15:
    kernel/resource.c: In function 'gfr_start':
    include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
       49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
          |                                     ^
    include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
       52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
          |         ^~~~~~~~~~~~~~~~~
    include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
      161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
          |                           ^~~~~~~~~~
    kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
     1829 |                 end = min_t(resource_size_t, base->end,
          |                       ^~~~~
    kernel/resource.c: In function 'gfr_continue':
    include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
       49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
          |                                     ^
    include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
       52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
          |         ^~~~~~~~~~~~~~~~~
    include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
      161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
          |                           ^~~~~~~~~~
    kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
     1847 |                addr <= min_t(resource_size_t, base->end,
          |                        ^~~~~
    cc1: all warnings being treated as errors

which looks like a real problem: our phys_addr_t is only 32 bits now, so
having 34-bit masks is just going to result in overflows.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This is sort of a v2 of
https://lore.kernel.org/r/20240729151652.15063-2-palmer@rivosinc.com,
but I think that was just bogus.
---
 arch/riscv/include/asm/sparsemem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
index 63acaecc3374..2f901a410586 100644
--- a/arch/riscv/include/asm/sparsemem.h
+++ b/arch/riscv/include/asm/sparsemem.h
@@ -7,7 +7,7 @@
 #ifdef CONFIG_64BIT
 #define MAX_PHYSMEM_BITS	56
 #else
-#define MAX_PHYSMEM_BITS	34
+#define MAX_PHYSMEM_BITS	32
 #endif /* CONFIG_64BIT */
 #define SECTION_SIZE_BITS	27
 #endif /* CONFIG_SPARSEMEM */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
