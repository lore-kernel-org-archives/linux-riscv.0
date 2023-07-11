Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20307EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzRkimHMmL7SLjtVI0KlBsykOvpOBiWz38cTN6zO5Bw=; b=l4ID8+vX9nvIeL
	vCG+1GBKmFT1P/VXpz15VQSBJVO3Xp+Nz1cRG5xwnGbrjb3r6dicqCedwpCdUXjXeIRM5j0LW9//H
	ynOnffh8vcS+MwrvcqDYupIZkD6bZeMLKH+XiWdj2U9ilxoe/mC0+H7rUc53IQu5XUpBj8cyrxTA3
	GA+DgOekrp7AoFgO6NMlah5cmQqA0YzKERvb4aa2dhBTeY0qu8WTrbRijPdeWNnrHI4Kqv+Ob57tf
	VOzUsLx/jYVQ0dDou431XPScOH3mLDg3R5fgdhGwUJzDMX09ny8213I+yGSL10N1SpQNBC7pR2uhi
	ZrfnvWq0i2NwAiR1JSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVO-00Ezbr-1R;
	Tue, 11 Jul 2023 13:34:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVK-00EzaX-36
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:34:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso5411442a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689082447; x=1691674447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEE57oj+GdsJXanw66t6tys98dAd0Zr2j6aIYgyrMwY=;
        b=g/WuLHQmL7CPdZ+Ok7EIf7d1Xu/fG+L/P6L7zVdUBdCdF3Ez6u2boNDYnk61d0rIwj
         CMhftbvXawRc4ut4OCxgXIiUPgbP/rsImTOz2B8HxmeRaq9eF6BKXeU0OJDsQt/9fq4b
         Omv7FpHIZKArHhSa7+IyI4hQwJ3p5iJHaq3UHvNC2phwTCWfaEMyiofpiQ6MctE1k0/r
         O8P6NU63aexh8ylJO9t0TTSgQDsNUhjUAKDpP8Cr1C0QRUBHHVSDQ2hL1x8j9PzOh30Z
         rAe63UFW8+oZbcuikCVhHBL6m6zB9HM0St0jXu6KU6VY74MNzuetN4VKurTuF6z6CUsW
         0GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689082447; x=1691674447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEE57oj+GdsJXanw66t6tys98dAd0Zr2j6aIYgyrMwY=;
        b=iuSZfYSRxZ7ohp2rFWfBLzA/rpvC2Lddatb69adlZXipRVUBZBRjLqsqboU3umjrbX
         w5KkIpMvU5mubvLcwweYWC0menuG5WeVjzAJ9iKt+BqHs7wXVakGnhxe775xYtO9dhzk
         gfks6JuvcoO1XtZqMEfsQcQl8yX4SHTMzvlsze8WLiD6VaePok0aD+nApa1b5FO94uf2
         5B1hJ1E/xytWW9mBLvVnfN446mmYw6tfzacSi+vX2TpCjX2OR/xk9EzmLhxh6xyOaLWz
         vTQ7hbxuhbeH3f13lOfX8neOl09My6Sfca7agLYC1wdKwKBkwpOS9u3lsng6YFe2ShRm
         z6/w==
X-Gm-Message-State: ABy/qLZ2ayfCu850IXJNk25nw0dW6x2RCMWpjEs3N9oEQ1X2Q+kH/O1t
	QH6he4NBDeBjn4TtmTUKZ1/DM4OAEMw=
X-Google-Smtp-Source: APBJJlECFO/61hgLZW4KZGoE5ATuuGswvkOlnPXeP+0NaXUEhKoKs3y0HJMojjzcdAiRR0YaNxWizw==
X-Received: by 2002:a05:6402:6cf:b0:51e:fa7:a292 with SMTP id n15-20020a05640206cf00b0051e0fa7a292mr14655910edy.12.1689082446838;
        Tue, 11 Jul 2023 06:34:06 -0700 (PDT)
Received: from andrea.ba.rivosinc.com ([2.199.74.220])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402184f00b0051df6c2bb7asm1276862edy.38.2023.07.11.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 06:34:06 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 1/2] riscv,mmio: Fix readX()-to-delay() ordering
Date: Tue, 11 Jul 2023 15:33:47 +0200
Message-Id: <20230711133348.151383-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133348.151383-1-parri.andrea@gmail.com>
References: <20230711133348.151383-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_063411_007101_4D3C04AA 
X-CRM114-Status: GOOD (  13.75  )
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
