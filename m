Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B629C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 04:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9tuh1LhiMQuLVHPZnlv+Dhr3ZK3UtO5LZw9rQmNdwM=; b=YkeZttOxcY9NKf
	FwJ/C9061a6eHYz+fVjKyqoCPsqUoVRJ0NClqwClirtN2Yg9cm20YOtK+RCS+SYPFjmI9GgaeLktT
	WUTZMA/24UcuLFmsX2cRXq9/+rF3DiTsrnah2afJPnoDshaSkXXxOewvL9A23WcPqugrlD3G46AVO
	93Q8BeKFGdG2vASa1i1i7nXxP9MM7bpw4wi1mm3C829fbx5lcHZUxK9mW8a701OjGkxYUHPHZmKCm
	MdZj4O7MdjUFxFRcvBmV5aCh8YcutfJs4KbCWV8E48N93eqN/yOZJQJ6UkmlcpgHFhgWdcRzxTyWT
	JjHJ70xaK3GpCUrlHWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPwI-006cZx-2w;
	Thu, 03 Aug 2023 04:27:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPwF-006cWM-1R
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 04:27:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5221cf2bb8cso567925a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 21:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691036866; x=1691641666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zc4fKZpvtCamX6sgBaS463wBLKH4MpwEP9vDGVPDIZs=;
        b=Egl2+MgBN+YIyuX/3RSTHmzC4j0m+vmprmny8glLiHeN3qb4t9FK2El2eXAxeBFwf2
         BpU1zJX2iFbwLXkQRVmHH59VKITRjWahkpsgR8BaH46srfiIsDLpjSsOLfuUMwOfs33h
         KRqYCz4Mjcx06EoWWyH6ZG+sYmKzy6kzp5llzggEA+mRoL4yfLzeHmYLVYUXxcU4hF0U
         9XcD140gRuVq6swTilOXJPNehGezj/UhSROAmF6OkF9QiicPc8f8Swv9nDGpqYnJMpu2
         lirINJYQVBWT+aEZCscGvBEQPXhJ6mUp0TN8wpzYIVXimXPZb8S29OwcVQa3mkk+mSlY
         PQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691036866; x=1691641666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zc4fKZpvtCamX6sgBaS463wBLKH4MpwEP9vDGVPDIZs=;
        b=EGt6gAo12O2NU99Kgka81p3ZMHch7ZlKsxyCr1d+N0kWbpVLMJhPF3mdd3/LrKOyeX
         N4HmfY7tjAw8jjYOTmmxnFmGdjVx2gUyQX1zqdkkM0iWEf44yxhxO0RYiL3F6jGaAvE+
         FElZphN9Ul3rgv1Z7vrJveY+MdXLzF7uqcacIvHP/WSIr/p5uLkW766en6H5LbSrlKA/
         AAPcAbVOSQh0zLdatEzR5GKMw54vapYAN9SToJU1rMt3iDEHabNoWyZp7/DICVTOQJ4Q
         KW1xQJO/BpXCK4Ljc2CZs3SR0PPI1jNjTB0EUGmc5xtDecpZOIs+AkTKkn9El0rdbvp1
         dStg==
X-Gm-Message-State: AOJu0YwRAyvIHw0ynWVBhArVyYp/8xpgBJRKSWonVB9jjB2M3eWeizfM
	Ig7KB3ixS7Mr/+ZOSB0VT5c=
X-Google-Smtp-Source: AGHT+IGv7afoJa7YCQjcrnx3h7TVpsBXcfQhpdU+L/BetHl7PXElFdOIgObMjCHWcm6S4ULc2zSMmQ==
X-Received: by 2002:a05:6402:1b08:b0:523:73d:84c8 with SMTP id by8-20020a0564021b0800b00523073d84c8mr1608703edb.12.1691036865844;
        Wed, 02 Aug 2023 21:27:45 -0700 (PDT)
Received: from andrea.. (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7d54c000000b0052217b3a10dsm9337094edr.63.2023.08.02.21.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 21:27:44 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v2] riscv,mmio: Fix readX()-to-delay() ordering
Date: Thu,  3 Aug 2023 06:27:38 +0200
Message-Id: <20230803042738.5937-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_212751_489027_F4BA23E9 
X-CRM114-Status: GOOD (  13.40  )
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

Section 2.1 of the Platform Specification [1] states:

  Unless otherwise specified by a given I/O device, I/O devices are on
  ordering channel 0 (i.e., they are point-to-point strongly ordered).

which is not sufficient to guarantee that a readX() by a hart completes
before a subsequent delay() on the same hart (cf. memory-barriers.txt,
"Kernel I/O barrier effects").

Set the I(nput) bit in __io_ar() to restore the ordering, align inline
comments.

[1] https://github.com/riscv/riscv-platform-specs

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Changes since v1:
  https://lore.kernel.org/lkml/20230711133348.151383-1-parri.andrea@gmail.com/

  - surrendered to the intricacies of NOMMU/RV32 builds: dropping #2
    (takers are welcome! ;-) )


 arch/riscv/include/asm/mmio.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index aff6c33ab0c08..4c58ee7f95ecf 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -101,9 +101,9 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * Relaxed I/O memory access primitives. These follow the Device memory
  * ordering rules but do not guarantee any ordering relative to Normal memory
  * accesses.  These are defined to order the indicated access (either a read or
- * write) with all other I/O memory accesses. Since the platform specification
- * defines that all I/O regions are strongly ordered on channel 2, no explicit
- * fences are required to enforce this ordering.
+ * write) with all other I/O memory accesses to the same peripheral. Since the
+ * platform specification defines that all I/O regions are strongly ordered on
+ * channel 0, no explicit fences are required to enforce this ordering.
  */
 /* FIXME: These are now the same as asm-generic */
 #define __io_rbr()		do {} while (0)
@@ -125,14 +125,14 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #endif
 
 /*
- * I/O memory access primitives. Reads are ordered relative to any
- * following Normal memory access. Writes are ordered relative to any prior
- * Normal memory access.  The memory barriers here are necessary as RISC-V
+ * I/O memory access primitives.  Reads are ordered relative to any following
+ * Normal memory read and delay() loop.  Writes are ordered relative to any
+ * prior Normal memory write.  The memory barriers here are necessary as RISC-V
  * doesn't define any ordering between the memory space and the I/O space.
  */
 #define __io_br()	do {} while (0)
-#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory")
-#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory")
+#define __io_ar(v)	({ __asm__ __volatile__ ("fence i,ir" : : : "memory"); })
+#define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
 #define __io_aw()	mmiowb_set_pending()
 
 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
