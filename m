Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6D9C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 02:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk4M+U6toqksYhI4uQ7+J4CXcXgmEYEYkrKDnezr9L8=; b=uPJacR2l+G+b0w
	GuaAd2PaZL57EKDIUaTXVm6ZZexcV/Qh4nl7YbL62/ihmGPI/t9bEULzYe0orJD8no4cGk2plsTRa
	puVyfClIfVSjNanFQdWnFYXGghOJUEYrLsJamaxC/FXtd6KqAAvnEBG6tWho4UdcBcpNzrIODSNb6
	U3c34GH6X6Tt3w4Dn+nJeVbb63r0vQBMh43d8+D8EErtb9Oz/o6fCmuGCCYHBzevUkaiEhjtqZeD8
	OtWX4u76LdAGA8ZCHcD+5/T48xr1F1zkUPSwlNnpv0R3PtzdnJEN6LCIiS2KQHxgvJo2DsZa9CYRw
	w9WPVwAgEcND9+s7gtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7aP-00000003S9Q-39M1;
	Thu, 02 Jul 2026 02:55:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7aN-00000003S8q-32WL
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 02:55:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8478a25f268so836304b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782960931; x=1783565731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=gAyDXJE557cL7DunSlD5gyyNHmGpVBP2BJTLtL3qQ7UlLcX83I/m/iUrSoTBqnjVtI
         PazFkOHoGMGuXVeiI8crFkCaAbJ1xL87/o0GIOtAbVKA8MaOz8RTJOP7AjxDfOm8onyR
         Dki47nwIS/9QalXyKjZGQlQyEUBaMz7yR8WMTkPPX4gdElfCfKE4jVEnO92xZZFOA6kj
         N+2HzzNUdYipk9e+hN8CZM8CyJ6V75FqCt6MMj9zjti6gdgoq3aHwkTp2QQZsW3/0WC4
         F3fFQGqOZn1E3EZiNtX5Gr/bz4PsyKxhyV+X7qobdEuIoWaX/XPFcvbmWPlbpJNd4qg4
         /rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960931; x=1783565731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=pmVmGgJXBOJlSEI5JxEc/qhWy0gME/sy8j4Gks+OuqYRusbzDPWVI2mU43pQfiYKxB
         QDB+qa9+WQ4iF+dqLwmxAd3kkn5TxbvTJfegVHmfO3r7OWiu6jixmgesYESpqylErzVo
         fbED+PN4sHrWLH+D638iewrtwFDqgz0QyLXAC18i8bBVApH0rMBXZOJCl3rX8ByEBbT8
         H3oglmf9omjQcIF1KRG1FRJNef5M1yFBW9KHch+S461GthZbHrOuNZPJEOetCZHolt1E
         zddA+E26TM1JFCeZohV0Wg6vW45CxUHcITP+4kUxZO+MWogM1JeW88Jjcn/t3sxvnoeT
         wNxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wKgProSCULy5cC6507q2RN90oIJJhdEEcVIkMkxdMl/f33kmlEDDt39PtU+ZqghD/dFMi1v0Amtuchg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyALUGPxcSEr+wMqvRSb41klVZg4N8ZXIiufBnQ/4eYg1l38XBg
	9L5z4jCU9p4EdfkDIMdyiPJO9eutAVI3GzH9WtrK8QOIVBzLsOGIJ8IiL7N01Lo7h28=
X-Gm-Gg: AfdE7cnaECGw2W3zjSVH5WocMQ7A7tAbSi/9P8jhbH/+LqxMERKN6/LLa3vC0IuNflB
	rk/8NRbTSUU8DGvlxYUvSHFQ98X4MQViPAfMGIhf+YMilvruHa4wcJRy2CPTMTI9Hgwg0IXT+/z
	8jPb4qTJnKFr4g8FhjtzIOCKLPC2sewHC60esczg+5beM4YUEIw2J2kRcF/gZEl8Wedng7zuXZ4
	nEZD5l8AYPUrjSOxlG1YGBhxwRmln381rJNUOMg86LY1KpYRs75nrNqkPgfL1pny0K03cVvrjYG
	8i6HT08os4VHjpba9uuzd7o59n2teLOc7rvknHPzGKkta4GfwKIyvbLQHtY2dqhCyBQAJqmO8xf
	InxPWP7bHmBteS5LMW55IOy4R3NYXg5DOvwCLx+VjEX7Y1dSLb4mk9UiZcKtWS30QueZVymrqQr
	thMY5nfjM31FTfm2OzJFrmkaguhXEI4O6nFo9JUxquO7+2gg==
X-Received: by 2002:a05:6a21:a517:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3bff4303b09mr3695006637.51.1782960930507;
        Wed, 01 Jul 2026 19:55:30 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm4358686eec.15.2026.07.01.19.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 19:55:30 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Thu,  2 Jul 2026 10:54:41 +0800
Message-Id: <20260702025443.83389-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260702025443.83389-1-cuiyunhui@bytedance.com>
References: <20260702025443.83389-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_195531_771599_8C017C8B 
X-CRM114-Status: UNSURE (   7.06  )
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

When port I/O is not supported, exposing the port-string helpers is both
unnecessary and can make clang diagnose null-pointer arithmetic from the
PCI_IOBASE based address expression.  Keep the MMIO string helpers
available as before, but only provide the port I/O variants when
CONFIG_HAS_IOPORT is enabled.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 09bb5f57a9d34..92d5f831f3495 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -102,12 +102,14 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
 #define readsw(addr, buffer, count) __readsw(addr, buffer, count)
 #define readsl(addr, buffer, count) __readsl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
 #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
 #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
 #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -116,26 +118,32 @@ __io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
 #define writesw(addr, buffer, count) __writesw(addr, buffer, count)
 #define writesl(addr, buffer, count) __writesl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
 #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
 #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
 #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
 #define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
+#endif
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
 #endif
+#endif
 
 #include <asm-generic/io.h>
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
