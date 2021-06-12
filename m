Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD64C48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA9C6120E
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA9C6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kt/AmvcZj5CzykuenPjxtTizxLwlQIhB99Guxz4NTpA=; b=SQB1SHkGPSbM5T
	hdJEnJf5GJv04nQyFihY8tTXc1raeYvbThF0IzLyT7YoWzBiXYLt0CVzSkpsPH7qjeM44NH1Alyfv
	l6HTnkJeuNyo4LcPGZV5+pIU2psn3bVL04zEw4vrOzobWDzYJ8adHDaPDQHID5LiMMWvEe1ejKi+P
	yKnEZ2MAQpuG9gPBHw2XTXRpyyaHAdEpX9G0gm23Hes4+Ih0X5o7A+b/mOjw7xCbcOtjNfDJS1KfU
	wrULjEqiIUOTljshgq+J3R+64JZUZacfCo/K5N4qU4+gw88SM7U+HP2r/DjZ4ctkP6+em5p/1az7T
	uw6jE41NFxHJahRrs++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrulL-007k0A-8M; Sat, 12 Jun 2021 03:56:47 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrulI-007jz2-T9
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 03:56:46 +0000
Received: by mail-pl1-f174.google.com with SMTP id v13so3792094ple.9
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 20:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=akFvGOTPnrH1oZbsyh18q4gwMkUtme+zCkp52VPSqZw=;
 b=nBGjkv2isftJYT3Ts0j5r4K/CnN+xKidSd7pfDQQJCzMD3XlOfO6P0+4/GHxz/yglN
 NWB3/Mov8sTCoyyQ4qTppoJz6kq8qvMEA02boa60uTbhvlM8YkTRD6PJ3J9ijsoYEjRf
 TDfUyIdyzKt6vJfuTebGdQcvZA1reXv1ITiz8h/OpIvXD8SxFIlvF3onezT0lcBYRTbP
 M2g/v2pdTjekPqLlUxJpRo6KnOhViFQ23BuPHiiiRvhARR1PI6IWys66tWhxbWAd8339
 NCBCKLyUMJoJESoRgRoBYW89orPXZgwBV/5Dvhw8pW4L1pdQ7NBxH38rZL+CurvkYpFA
 0lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=akFvGOTPnrH1oZbsyh18q4gwMkUtme+zCkp52VPSqZw=;
 b=A0L+sDk8+rG8gBuDwhIwQQWC/QWMdGr/+hepYWbGQ7inZrW5aLxbajLaGOWUEtO6cr
 /V2QahGKGMyPR8ZFf2frNh8vS77F1E0iRW+KOHLAx+WuJNuT5jP3elgrZclZfZFWWkOZ
 6+DQJrpgtZK5YpGmzSfkSNdpOUlLfPyt80ISJqSjMptFYE9Lky6s1WEBEZxmCMBH47KI
 j+Ei61jsvCr6Fcld/P0lu+d1TXaxLgza19vpoNlGW8rN5u/u70d/n7F+bXSyqgRfYGWT
 2BWX1p/VjtRc+HGQyzQJBUmbL5+/i78vI5UIBo6ROiXmvujQbV2ijEZ0IiFOTY49+jD0
 nPig==
X-Gm-Message-State: AOAM530ls1+r0aKd/YcJWKUiniMPKH0VFXTtXxTQXGAmimKC6N0q8X7K
 aXjetKvS/r2Toum1IXMkfqZbsA==
X-Google-Smtp-Source: ABdhPJzdeLwROKg8BhvBACDaMVXVaBwD3wwoU2+GgRWGzQM5bfH2/FwPj5dGLu83nVhHRG7K7PmKpA==
X-Received: by 2002:a17:90a:f3d0:: with SMTP id
 ha16mr7721767pjb.123.1623470144207; 
 Fri, 11 Jun 2021 20:55:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bg16sm684308pjb.16.2021.06.11.20.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:55:43 -0700 (PDT)
Subject: [PATCH] RISC-V: Use asm-generic for {in,out}{bwlq}
Date: Fri, 11 Jun 2021 20:40:42 -0700
Message-Id: <20210612034042.3043112-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, Atish Patra <Atish.Patra@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_205644_961835_0FBE22CC 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

The asm-generic implementation is functionally identical to the RISC-V
version.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/io.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index c025a746a148..69605a474270 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -52,19 +52,6 @@
 #define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
 #define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
 
-#define inb(c)		({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
-#define inw(c)		({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
-#define inl(c)		({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
-
-#define outb(v,c)	({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
-#define outw(v,c)	({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
-#define outl(v,c)	({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
-
-#ifdef CONFIG_64BIT
-#define inq(c)		({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(__v); __v; })
-#define outq(v,c)	({ __io_pbw(); writeq_cpu((v),(void*)(c)); __io_paw(); })
-#endif
-
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
  * allows us to use the raw read macros, but we still need to fence before and
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
