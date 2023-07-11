Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4EFEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsIlQ9TnuJANddTfoX0y1m1FlOv2N6agCEQinQNEGZ4=; b=wOHI+ZSzt8hvLF
	bhQus6JZ0WiwnNcUCM0bGuKv0KwYkxW5pAq7cNSLhmuiKjocUgVduITCkNQfn47KHCxQlqUOtUL7y
	/Ar7EK2ejhcX8LWpvVyBdSDKwzwkZVjYZXeRa5Swf81Kg3XQlq83N3jtmQ98lnnmqSiDuZc15+30c
	IB+tzgvvAz3MQ3ypLxBET56bhLS6yg0dfn8ko2+41w1QthgKUBjxvSp9YztFdYtoccQ3utYOhXwQz
	IXcNOIZasBX5yIBw9Glhh/6O/Ak7+HX2iksaIVNpjlpMyTiwwL0FaLYY+zXkcGO6Zvdl5IDjIyB5C
	APc3gdkPQ7HSJeX16Qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVR-00EzcU-0M;
	Tue, 11 Jul 2023 13:34:17 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVO-00Ezau-0k
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:34:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e5da802afso2249761a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689082450; x=1691674450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjSbzIFEjI+X1OOQ6m2DfrSrdZF0QXWrCZ+NzN3e1QQ=;
        b=E3/CeuSOmwHqwO+eKZA0MFEDZyoi+dMeScbz3G6OYrKt8mh4aZZM7S6KymL6RNKNoD
         WHfWPkgnXI4zx5iu1orD7MaeYfxvjK9ixUXu1C7nFV/+07WQ/6hX87o+ZKBKnA8Ftz4J
         CKeFy+FPHNKj46RX9EVDvyyOurs3DAKRtNUliIbMQqDeMlJhVnf/B2NbULja41sPatlr
         NiGNh1wqSnM5Ni70yYckNFhrF/z0QkztqpHl+9cjWZA826bk9gXyO4MuOCJ6avQsUV2Q
         4b3vStTEEH8VMLEAfWa9X4EFMrqkwezg/ckw4ybLwccGyHIbHbYRQa6xkCwBaEeqTLrE
         ijgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689082450; x=1691674450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjSbzIFEjI+X1OOQ6m2DfrSrdZF0QXWrCZ+NzN3e1QQ=;
        b=XNAkfnDQT3Et8WwXpzg+SCzwmNYvQwHxS1+n2GY4yjwDE2miKSB1V+5SWMtIOikj8u
         2TnllDcpZn48bpjzLNJ3nVoczA9bi94oSrOxnfu8qE5ob3WjUWs5p+Py4RzTChQIRoe5
         UKQ57Jk6s8rMg5w8H3oukk96Pc6eGb8mSXeoMeZpaH9N8ZZ4pAwK0DGb1tFRw9gDb4Po
         c83vlrgR982RbaMBPDlxQ82KDPWa5EoyFNvgpCLLYMxv1AkbUgFLw5QqUuRlJaz3dgyB
         a5xCKdB13XtHB8woTyt4huU/UwHi0pqqKUcq2zu3X/gKPW/uFDfNp53hAEbPQ9cMS5hW
         zMkA==
X-Gm-Message-State: ABy/qLYSIsY4rwMgWZCferHprYVBA3RI6ijy0Y5X8LL1TWKy3eCh1KkT
	6SN7Fh1BP5kFnqpVZuQdVwg=
X-Google-Smtp-Source: APBJJlE/81QBvB0nKkNxHUfF5FvAefEWCsBQWnxuBLjwjlyq4Q3DeQLemAoCPTEAmYt4leMJcio/QQ==
X-Received: by 2002:aa7:c442:0:b0:51e:293b:e1ce with SMTP id n2-20020aa7c442000000b0051e293be1cemr14093106edr.31.1689082450137;
        Tue, 11 Jul 2023 06:34:10 -0700 (PDT)
Received: from andrea.ba.rivosinc.com ([2.199.74.220])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402184f00b0051df6c2bb7asm1276862edy.38.2023.07.11.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 06:34:09 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 2/2] riscv,mmio: Use the generic implementation for the I/O accesses
Date: Tue, 11 Jul 2023 15:33:48 +0200
Message-Id: <20230711133348.151383-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133348.151383-1-parri.andrea@gmail.com>
References: <20230711133348.151383-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_063414_269640_822F3087 
X-CRM114-Status: GOOD (  15.18  )
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

The current implementation of readX(), writeX() and their "relaxed"
variants, readX_relaxed() and writeX_relaxed(), matches the generic
implementation; remove the redundant code.

No functional change intended.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/mmio.h | 68 ++++-------------------------------
 1 file changed, 6 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 4c58ee7f95ecf..116b898fe969d 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -80,72 +80,16 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #endif
 
 /*
- * Unordered I/O memory access primitives.  These are even more relaxed than
- * the relaxed versions, as they don't even order accesses between successive
- * operations to the I/O regions.
- */
-#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
-#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
-#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
-
-#define writeb_cpu(v, c)	((void)__raw_writeb((v), (c)))
-#define writew_cpu(v, c)	((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
-#define writel_cpu(v, c)	((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
-
-#ifdef CONFIG_64BIT
-#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
-#define writeq_cpu(v, c)	((void)__raw_writeq((__force u64)cpu_to_le64(v), (c)))
-#endif
-
-/*
- * Relaxed I/O memory access primitives. These follow the Device memory
- * ordering rules but do not guarantee any ordering relative to Normal memory
- * accesses.  These are defined to order the indicated access (either a read or
- * write) with all other I/O memory accesses to the same peripheral. Since the
- * platform specification defines that all I/O regions are strongly ordered on
- * channel 0, no explicit fences are required to enforce this ordering.
- */
-/* FIXME: These are now the same as asm-generic */
-#define __io_rbr()		do {} while (0)
-#define __io_rar()		do {} while (0)
-#define __io_rbw()		do {} while (0)
-#define __io_raw()		do {} while (0)
-
-#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
-#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
-#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
-
-#define writeb_relaxed(v, c)	({ __io_rbw(); writeb_cpu((v), (c)); __io_raw(); })
-#define writew_relaxed(v, c)	({ __io_rbw(); writew_cpu((v), (c)); __io_raw(); })
-#define writel_relaxed(v, c)	({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
-
-#ifdef CONFIG_64BIT
-#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
-#define writeq_relaxed(v, c)	({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
-#endif
-
-/*
- * I/O memory access primitives.  Reads are ordered relative to any following
- * Normal memory read and delay() loop.  Writes are ordered relative to any
- * prior Normal memory write.  The memory barriers here are necessary as RISC-V
- * doesn't define any ordering between the memory space and the I/O space.
+ * I/O barriers
+ *
+ * See Documentation/memory-barriers.txt, "Kernel I/O barrier effects".
+ *
+ * Assume that each I/O region is strongly ordered on channel 0, following the
+ * RISC-V Platform Specification, "OS-A Common Requirements".
  */
 #define __io_br()	do {} while (0)
 #define __io_ar(v)	({ __asm__ __volatile__ ("fence i,ir" : : : "memory"); })
 #define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
 #define __io_aw()	mmiowb_set_pending()
 
-#define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
-#define readw(c)	({ u16 __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
-#define readl(c)	({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
-
-#define writeb(v, c)	({ __io_bw(); writeb_cpu((v), (c)); __io_aw(); })
-#define writew(v, c)	({ __io_bw(); writew_cpu((v), (c)); __io_aw(); })
-#define writel(v, c)	({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
-
-#ifdef CONFIG_64BIT
-#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
-#define writeq(v, c)	({ __io_bw(); writeq_cpu((v), (c)); __io_aw(); })
-#endif
-
 #endif /* _ASM_RISCV_MMIO_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
