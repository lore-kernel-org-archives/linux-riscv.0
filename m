Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D27C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk4M+U6toqksYhI4uQ7+J4CXcXgmEYEYkrKDnezr9L8=; b=5GiIo1S83rWdGm
	C1Si6Yhv3Kbf1EXXCyJ+4uxsCMI6M+rEPhau+r6zyOIoH9awARd9VzemSAsGDsg+eQXDAlmqYxN0f
	Sk6Hng06d4g0JdV+xJ2IImaEbRs7ChJiBHl/Tja7aH35Cc0RoG6cUESznV9umRzVp7Z4kCwGnZXhw
	LghjPxFMTBQehoQX/hcMDYduAXEEfgMbB7NRIp3MzZEhu1Uk+ISoMNT350OMZA2l4xP9oSEr565jd
	FJ0I4Yrh44M4B1OfVtFk+GwBB76ok7WcmLmHFpaCT8mLEcCwvpHVqvU/ttV9IdQ2huTDos7fmAdFe
	PLeHzLyhdDs+qXP2WYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu5e-000000020Dv-0jf1;
	Wed, 01 Jul 2026 12:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu5c-000000020CX-36R5
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=; b=I5OjDN9qRqMtAYhnzbEekuBiuB
	pA3lMQtITgeA1A/W9FoW79ajLa7Q5tNpLnPl/uqGSAcOtohjnBnLzgUCVMCD1p6jKLhWQb7bZnTsi
	CduJ2/JJbqH8sBDUaXofBvz0R3O/+ggeHvY4Okynpc441bU4kZpelArO74CBV5AMgtzqb7+pGAoyt
	yImzdtvBHs/7+qR2YfpsFmcwip0wE0eujGuKql0AVcV7DoTPMAh7C2x+rVNzkqI5xTM6/O1dEPgqx
	6p9vLHNj5G5gihYN+cDI8o/jHKYFFG+jhLBgf1Mc0Xuf/CS9nMJ2k/RW4hDpNmAkMQXvNd7Kr3fQy
	guGpGMRQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weu5Z-00000002l1J-3Wkf
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:30:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso3465555ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782909048; x=1783513848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=Y97abxT+2JjhOgbAFqROiOOlBUDz6fgtY2Njm+++uficvx1CNcEt8gpQoANSTSZKvq
         Kt+UBpB8lNn27eVkCdy5AmDFagEA0dJKCwMHMlM0+ShS18fmbF79YzcNbocpPrJcT709
         YJu58Xo4zhDUtOSy+DXQMQlLqNHAEd3O2ZLZoDR9LUt9Y5jCdjkU8tWWpE7DBbrtMbNJ
         TyiqynadeSfBcuIWKJxqzqwmIeLmfHfVpAIreM1xmFj9xkavHlpb9t+VzsZSoc64bbUR
         aymOzzLSxQsYcCEp1fFjnsv/1EflHNaHGgX7wwmsdRJ/0mTASni7vDmepN8ToPrER5nP
         /qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909048; x=1783513848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDd9DofNJHdq9P/rugFQPHi9oXh/6OPbyalY3nUgBIk=;
        b=Ae2He90kOjzpqhchMbfguxFk/J7kcfrcclQxsvlg/nCgO0iqV8/oOmDxa5CjtnSAGf
         6yNRpW5TVIOtxB3s8gp3ofBc9kxWBDyEc9YLT3dDkXZI5pvkyEDhEaQan4zVdrGcVjtf
         +tWocodVCnfm++NkPQJRzhdSP1xZmXQaJ3MAMR6JT7cx3+wZaqY8ZVRrWuXH8cGBfqls
         C8o+WvzZDCmiOtPrxDCeHzy/CBJrVz2/rgRCjlRI+BGxNGAijp+rP+bLpCFxBzNG1jjW
         ceooTajIXjdOXL7Ou43V/vDX710jUm1shbBGbxD2bluwHGpROmXNR552HammL6vFjTLC
         hlUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW5zIV5L3zMfbqrzMjXiWzhstPQAnWpvD8HUCs8TOQLPQ97OLM4ajc61XQfcxYxAFCnyGcZx1TNdI1QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3SJNEAt9n8ynjgGXKF4zExzcOTPuJFWD1pLhwSujwklMQDpQh
	dffq45ZZEfafykPFz4T6/Qf9WnkcJC8iJ2SCfLOOFAli7C3YMWLiZJBWo4QUXvlkUMo=
X-Gm-Gg: AfdE7cn/roOCYIJn0h3uh3OQRvqsOIYK1AyCRqQP+E1IS21NsR4KMenTE4o/igP58C1
	b0Uff7xAwMeAMdMc232dUWx7OgnrNMZuK+h4QmvQfzSo1VdB8t/NR1jRZBKUzTTEzOcO54KuLMV
	fvl4buk9swDcvfFzyVsSi6P3HiHo5OY9QlivqezZjfPxno02mqgeiFgx+tU4hZ3dk5fMg4D2oRR
	7dy4wHuXtxRwummeVXT7G33AI39EZ6tspMjII7RYkv316dPc9Q0/Lp/tZI+S74e67LJhLtktb9V
	Cn8hvS89qZSAzDLwT/Yx5xRcykG8fw0F6JVM6ByRiiJuVZ9UEmSgxj/GpDdDMH5NtEpIosfI+On
	066+8wpTaaQvuK+U+1vTbtJ5vZzC50vXQzJQ2AyappuAUAjx4nkuDke5dHbVK6efzAfDtwrssjl
	glikNg9vOaxO7PDgyPgWmgUtuoubWcJQdt/DflsVD9/yzOTiWGa5EVCVZI
X-Received: by 2002:a17:902:e841:b0:2c8:be9:1d9e with SMTP id d9443c01a7336-2ca7e86485dmr15171775ad.34.1782909047857;
        Wed, 01 Jul 2026 05:30:47 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm25166825ad.73.2026.07.01.05.30.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:30:47 -0700 (PDT)
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
Subject: [PATCH v6 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Wed,  1 Jul 2026 20:29:46 +0800
Message-Id: <20260701122948.57584-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260701122948.57584-1-cuiyunhui@bytedance.com>
References: <20260701122948.57584-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_133050_142695_FD03DC4A 
X-CRM114-Status: UNSURE (   7.08  )
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
