Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FFDC54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 03:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aMSSMae96GFUVmOF4zVx7YeLBzNH6v3MhBWeCrkBK/M=; b=XyXI95Wc1Plo6x
	oSAFmz2B1Cot+E6Io4dI2p5gxLmKrWLV0oSqJpoYizrsvRPKitHK+9jSDyGF5D1bkp8M2cTyTr1+l
	Iecv+LWKPAXEtu7QGWNM1W2UihpBjxvGiudeKUHuNvAvoV7FfQT32utk9Zath7h6D+BirgW/WXH0Q
	fJJnFpcVQkGlBuGke4CPVdVaUMUm5PGq4KbXbs7jK757Rgw06WQCTBlGEcWYj3gOpnRbeiuegKfXG
	zR3+DM/FXfvSsL+2gFxIdZXAzP5ujMUkexepDCmpAyR28DUGPBz0UMOnWcy0lpb9m9xIT63s+rWEy
	72XiYxwYf+nJzm45oP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqKl-0000000H2CH-260h;
	Fri, 30 May 2025 03:23:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqKj-0000000H2BU-3J2R
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 03:23:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23508d30142so16000335ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748575379; x=1749180179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wM1U4tWGX5o3ldRteBTkSHAy3K2Ji8GZf7I8eaIg24=;
        b=L9Y+2gTLdIQfRkNdREwRRhT0ximmtaZSXqGSLe5ReNQHiVJoUonEklBYlUVlwqWOiK
         AmS1LFtbjRN0GWPKX457TS0hGSOdkSQZegqupxjTPt6kyHyWVZlzsuyAeHc9VqD3p36D
         1YwHTxcgI3OG4MqJlH1s7TLQnuMCj1h8IooqHAgksmLVST+LuFV2nE1ogxckzDJ9/2gJ
         mG+hvWSez0trb7PLHk7xEzhFDDbVqPs8KzwznFh/r/o9MwzThUdJBR39Hj3MQT64XbZB
         QT8R9K45eWAjFBOX0IeouvnjUDrFaN7VRo03nMt873RM1xj7kKAcmFB5LZU4Yfg2hMOG
         QI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748575379; x=1749180179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wM1U4tWGX5o3ldRteBTkSHAy3K2Ji8GZf7I8eaIg24=;
        b=RhHwy2c0GOYyHHlXOlLKIiOpIDCyegP76Hg1i8XN00q1lsi65mc7dxoEU8SyeFuUZ9
         RRmxx56rGlao5YBtsDNbXD5Pu1tkCS3nfmPiRt1YPKgJAH1QYVrBsANSKi5Ar3aG/hx/
         8yUTE418fpsqqGwZP059qRGavm+0jl/wAFFNZc5hykqaOVCCvkC4LlbhQJ5idzttEusG
         lASLMeDu7qGleRr1cXgwbs3z6QkPh7ssV1XGPGUMkp7EM49JH1Vc8rDHo42W1UCQr38T
         Jyt0vrE8z9IEIaK2yiU/76yZZj0VkSmNCiEXsNRkT0IdfzWkJcqR7sbtOj3mhPPSUgGq
         LEhg==
X-Forwarded-Encrypted: i=1; AJvYcCUBYvY5gUF1lmqox0uWO+x9/vlnWEc9BJZozDulZsWNLlkDsrLGUDy67neVGTIXJ/64Ui3pU1Y4SBrNgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpNme0x3qFV4E7lhgBQUH8AulzK6Swwt4ik7/b0ZP8ev39QH9k
	9Kqa6LYDSJDf0UJZiEwa7q3q76WdpFiob6zocO3fRIU/uHfsP0e527/RUQixWx75rGk=
X-Gm-Gg: ASbGnctcjp1oBOrjZLzQu9zR+a2TnhxCN//NNowbse5r+YtE7Ty1tAKF9K6I0N4KeTh
	rDwN0TgwVNtXL9hXdYLlNak91duXqqWv3Zb1xwHKk+ufP0RB0Yvr1pwuwO2l7SYbQyyh+heUcL6
	3FBZzrT540jGtztFaPhQa1jPws13LhiogAFHTi1eL3YNK+0qmaKYb1ImTDxnQefPFQFFhjsET1n
	uqK5uBOlnPR2cJ8ianDxynZQEOOZW0MSMiegt7JBPKTOsdEPCnahrRGE6FuxdSUhATscwToyGF3
	qRQfO5pIJ9vhWkxTBzDDTDq0dR+uW//byNAo2Y6dfTQz
X-Google-Smtp-Source: AGHT+IFEDEelWj+6CI2BfcsYVRx9/81+DL2Rd8LyW7YcCbMOY3xavrgN5hBI2UG7v3u945J7lg1gig==
X-Received: by 2002:a17:902:f642:b0:234:de0a:b36e with SMTP id d9443c01a7336-23539648068mr9327765ad.49.1748575378042;
        Thu, 29 May 2025 20:22:58 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3535sm19089905ad.120.2025.05.29.20.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:22:57 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: use generic MMIO accessors
Date: Fri, 30 May 2025 11:22:51 +0800
Message-ID: <20250530032252.3092502-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_202301_831035_E83527BC 
X-CRM114-Status: GOOD (  10.13  )
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

RISC-V IO just reads/writes the memory location directly, so remove
those __raw_read/write* definitions and use the generic accessors
instead.
The __io_reads_ins and __io_writes_outs macros are updated accordingly,
as they don't have access to the generic accessors.
Simplifies the code with no functional change.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 arch/riscv/include/asm/io.h   |  4 +--
 arch/riscv/include/asm/mmio.h | 65 -----------------------------------
 2 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db..6cee9d083d3c 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -68,7 +68,7 @@
 			ctype *buf = buffer;					\
 										\
 			do {							\
-				ctype x = __raw_read ## len(addr);		\
+				ctype x = *(const volatile ctype __force *)addr;\
 				*buf++ = x;					\
 			} while (--count);					\
 		}								\
@@ -85,7 +85,7 @@
 			const ctype *buf = buffer;				\
 										\
 			do {							\
-				__raw_write ## len(*buf++, addr);		\
+				*(volatile ctype __force *)addr = *buf++;	\
 			} while (--count);					\
 		}								\
 		afence;								\
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 06cadfd7a237..61286ee65f0b 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -15,71 +15,6 @@
 #include <asm/fence.h>
 #include <asm/mmiowb.h>
 
-/* Generic IO read/write.  These perform native-endian accesses. */
-#define __raw_writeb __raw_writeb
-static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
-{
-	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#define __raw_writew __raw_writew
-static inline void __raw_writew(u16 val, volatile void __iomem *addr)
-{
-	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#define __raw_writel __raw_writel
-static inline void __raw_writel(u32 val, volatile void __iomem *addr)
-{
-	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-
-#ifdef CONFIG_64BIT
-#define __raw_writeq __raw_writeq
-static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
-{
-	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
-}
-#endif
-
-#define __raw_readb __raw_readb
-static inline u8 __raw_readb(const volatile void __iomem *addr)
-{
-	u8 val;
-
-	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#define __raw_readw __raw_readw
-static inline u16 __raw_readw(const volatile void __iomem *addr)
-{
-	u16 val;
-
-	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#define __raw_readl __raw_readl
-static inline u32 __raw_readl(const volatile void __iomem *addr)
-{
-	u32 val;
-
-	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-
-#ifdef CONFIG_64BIT
-#define __raw_readq __raw_readq
-static inline u64 __raw_readq(const volatile void __iomem *addr)
-{
-	u64 val;
-
-	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
-	return val;
-}
-#endif
-
 /*
  * Unordered I/O memory access primitives.  These are even more relaxed than
  * the relaxed versions, as they don't even order accesses between successive
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
