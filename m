Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9F8D0C604
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/psCW2xxPz0+dxHAm0x/113RbF0Y/ofVpFXeZDlLGPA=; b=4iWa8yN648/m9e
	7AcRXvnh6QGElOFC2xd4zzNVubfGkiqoKd3WBahZKBGJ23S0wNZy+vBnjGjv7AZ2csO2qPc4US7b1
	SyEV21jM5Mcv1Z1cjZVXfbVO3cX/y+xSVM5GZKSsvoQiZCbsKwVCNcVw3ZPOsQm93x2TV5JchWi1K
	14JgK4s2Qw/I0WY+XHPRlwjqmkCSlRgm3gzVxBc23KhD51hSSShHtf0ni+GKvBndU9k1U381HkolZ
	jvb5DukKh79OT/IooDFz1gaYFSFxLW7dysx9M+O64SyAV0CUepeBri3J/qzdLOQTybagAqVdtaH+K
	bzThPOidCEBtnUviE3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNI-00000006x8l-2ovZ;
	Sat, 26 Oct 2024 17:14:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kND-00000006x6Z-2nHw
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso2429923a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962886; x=1730567686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyKlYhyoQTsAn4L5ymM1gqMGEqmqMMy28NtniO4HhLo=;
        b=VZGj+EsB1FzJVg0Ws9LRujr0zhwJwjhmu3MJwK+p/7b1dYQZzgzV8bO5FPCw8o/kWB
         wYZRbsU6G/KdRjm920p98jjzWqCHy+yEozGmht93TWcRWNoCtiGuexrUJtX1mnoqtw8t
         B13kzAfSgmQuXmDflYmVAJy0SqYv/wosMkTyrvtudnqy400TrCId6eoRzlYEVjm37MO3
         B5pwU/Yn5EuUjU+AMpnwb4xfFmNObgRGb+6xwHdaLbHcRyKjF/Jx+Q/GEjSR+kTCE2Ci
         gn2hk4KXw80EOOegGYaDCiyzM+QxIC6GbGw0ioAJdPPb0rXr1bGAVvBGvbSkH/UftVk0
         +VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962886; x=1730567686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyKlYhyoQTsAn4L5ymM1gqMGEqmqMMy28NtniO4HhLo=;
        b=Oi7R2cJWMlA/NZWvU/J98DkfH3xr7JMZ4V6V+diG3VoRpMRGAah4e7RTfC1/vktgq+
         12+3nc/s4WeNkedQt5kKl+yYvNz5qib3u9hD0qeH0JPICaTAIhNsOOczz+3GyrwtZGzT
         sKUGJcbVV2QIgKCJavMbfm6ZL8HdoCseo9fCgIiUMcDILPfHoBvDcgnvyNe6ix46C9Ze
         Swpzuh8Ah9T2OIBsCdQ0CWv8n6diFi/+4IGG3XfMmBuaM+rKwUua53TgdCzbbYgHcxWj
         4H87m3EtpG/nj7YFHUfWjX/aahsGTHxcixZ2us7nCR89Q2kRH9HG0/6JYRvLOyaxUqQs
         nvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc7VOmuMj/XfIvhLwuC2U6EKEvtnZGvtVUfAJT8Gja3ivCrSBAF4Ntune2iAYWhTzqR0xSYte83Qv2fA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk6fjClVs0/s6vS1AYElg3adfvvI4yAJJJXU9gd8Be62tgzXEH
	Im6iRyhvkLykJjLULjOXReOHDJnnmaBhPaefIBWU2LLjpWaYbx1AJAdm5x2IJP8=
X-Google-Smtp-Source: AGHT+IGjNDukwViDngFMKYKbWwFFp9ljp4jqD+5ryDjxC8VoVYiX7cXbg3yZQRK0W4GSuzVMjeVSBQ==
X-Received: by 2002:a17:90a:7847:b0:2e2:c69b:669 with SMTP id 98e67ed59e1d1-2e8f10a6f5bmr4102476a91.27.1729962886541;
        Sat, 26 Oct 2024 10:14:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:46 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/6] riscv: Allow NOMMU kernels to access all of RAM
Date: Sat, 26 Oct 2024 10:13:54 -0700
Message-ID: <20241026171441.3047904-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101447_729810_EFB2D72A 
X-CRM114-Status: GOOD (  13.21  )
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

NOMMU kernels currently cannot access memory below the kernel link
address. Remove this restriction by setting PAGE_OFFSET to the actual
start of RAM, as determined from the devicetree. The kernel link address
must be a constant, so keep using CONFIG_PAGE_OFFSET for that purpose.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/page.h    | 12 ++++--------
 arch/riscv/include/asm/pgtable.h |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 32d308a3355f..24d1ac052609 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -26,12 +26,9 @@
  * When not using MMU this corresponds to the first free page in
  * physical memory (aligned on a page boundary).
  */
-#ifdef CONFIG_64BIT
 #ifdef CONFIG_MMU
+#ifdef CONFIG_64BIT
 #define PAGE_OFFSET		kernel_map.page_offset
-#else
-#define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
-#endif
 /*
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
  * define the PAGE_OFFSET value for SV48 and SV39.
@@ -41,6 +38,9 @@
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
+#else
+#define PAGE_OFFSET		((unsigned long)phys_ram_base)
+#endif /* CONFIG_MMU */
 
 #ifndef __ASSEMBLY__
 
@@ -97,11 +97,7 @@ typedef struct page *pgtable_t;
 #define MIN_MEMBLOCK_ADDR      0
 #endif
 
-#ifdef CONFIG_MMU
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
-#else
-#define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
-#endif /* CONFIG_MMU */
 
 struct kernel_mapping {
 	unsigned long page_offset;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e79f15293492..e224ac66e635 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -12,7 +12,7 @@
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
-#define KERNEL_LINK_ADDR	PAGE_OFFSET
+#define KERNEL_LINK_ADDR	_AC(CONFIG_PAGE_OFFSET, UL)
 #define KERN_VIRT_SIZE		(UL(-1))
 #else
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
