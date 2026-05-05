Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421E7CD13DA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 06:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vP9FrF4ETizQjmUYfrktqS1hGH9jPHIfQDNTlMmkXUk=; b=V1SxCjKx7PbfOU
	DVRmiBVk5TfIf2LnDUeUjrkW2mSVj82SYoKoJiwD7H4BPyv1+4FaAq8b+bZf/QD10rfqOZ4kODkBF
	4WhzO38TuMPhUbAu6Vhj3PXnexiXKK7sqXDR1M5i0wGv0ZAW8WE6DuZ08tCswo01siQZSAQ6DCrv1
	+F+lQuTZoMLuoTINz/zioHtrL9VB0RWgMRqpfs7UZtJRKksKl2C9VaLHsCfykXcE8MvP6CkcmkfqO
	04HVW38sJgDZmQqbNSVgt6Vkbl2ipvCP4rcDDcxkfdowPxe1pVFKW46Qk8+crHThlwZiHaVCGzoDL
	QVt7ecOthxSYf4kH2XZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99W-0000000FH5j-1gza;
	Tue, 05 May 2026 06:21:06 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99U-0000000FH5J-17MR
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 06:21:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so805063b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777962063; x=1778566863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUWhdkh+jSa+kjESo9b/CmN+H/tJl8wa3ioBeRpyc7Q=;
        b=coXzCPJLwHcXiomO3jH4z/Qg0GCE3WccN74de57aFW1vCC0cSqbI1DZpntlwWZNCsL
         WQuYMVcL0xH6zfAZ58f1DLKJd6v+1Fy86F+6F5SOWCHC5ue6+q+HVCJyruB11U7nIFjC
         e6jv8zl8iv1QQwAFgGxhCOBgr7gezfZ3JVl1p2xbkFMbt/z6GipXT3Vln2o7Px5S0HKy
         lQD8Lj9GPouBnqAjUBI7fcn5Zra4Y1XRRkQMW2frlEoynXPh+S14IHhxn+AeRMBk6ZVs
         a2pGsUaq4ScIaq78dfcF0fyVkDyn1Q7AWaSvCY07q+Y+E9/d/PeTp2tS8veY409qT7P/
         1dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777962063; x=1778566863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUWhdkh+jSa+kjESo9b/CmN+H/tJl8wa3ioBeRpyc7Q=;
        b=QzgsbUVOOBGdorR8dV4jb6MFG9/9upe5jGHsKPR4aNWe3FTgs7lYTTdL0ETvi8fH6c
         U6EdfOBeAGkLg0NSoBWhLwl6febSpdc/rD35GA3SY3i/g795Hb7jrrMyYjbFmiUFjcfh
         bjT2ve9QuQlF6mfhakTmdktkPY6t1k+HSe07epKm9os19BE/top7glzEjfr/EY/cYtPO
         r58AHmLWSqYdLtQWZim8Bd1QbpbFzHiRaJeECzqTARrgeKuh9RECZHEy5Sbi2X9P45i1
         uQCcfaflvua5278EEuPmoNOwNHLJSW71x7BLGXjZRqneGiMeyEat5lh72d0Lxym2AHiR
         3Aiw==
X-Forwarded-Encrypted: i=1; AFNElJ/2kwlVrllFCtLCS8Cb0x0A6u0yxdVMWvHspJ9WuEkyWGsDWl+Yyc3Zk53pkqnR9djwzTt0PVvPm0kavA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwouWAqbk1w9GeKpnMIEmG4roxp4bIfesMWTjuWkJ7m5PnIJqsU
	E62SOWQQVyPDzrre2kgCa0xNyp/MkU1XOlw4Gp7tSSzP1PjcuOdNsd2eD96AI6A60wY=
X-Gm-Gg: AeBDiesee8yIyLeMXipXk8dbzeE83pNgaZoYXIspC11IkuLuV3V/henOjeG08tYaxqG
	h1QLIHH6KYIagVQNkfn2+0QtpDLX2R2FM19DJyT4GRxW7FZDEPOJ3beHtAqMr6KRZw1q+NQkioF
	qtItaDkgzKFeL33k3fEgNKjEAJR6cp/u0x3xm/2G1GEo05xsMQIG2JysmAe50DHs5+Z6UN2Tpp4
	MpW9YFJhxa9CTrF2cujs6buj+3h4dpHoZOstCuG+FJxccbS5CMIOGb1+92IrEqJX4PJpiFmOqr6
	iGCAByNZZAStlOnJzJiUmRr1fKkNAvSkKQI3L3bZyUeqzsvl1oGlanN46NF/Loj6eZeVg9+43VC
	rxeefdFY5jkX3plEtV0E44omK/02HIvxcWxQ0N+TsINWyQ3xxaBSsARGVQZSFC0Vraxe51o8YyM
	pdRS6pbFj2Kc4qUTzCYZCsKW6CjqzWAcwDeSIyLcVp3OXG7CdPYRgVTwbQYx0KSuSF
X-Received: by 2002:a05:6a00:4b55:b0:82c:d9d0:f482 with SMTP id d2e1a72fcca58-83924eb8dd2mr1858261b3a.46.1777962063135;
        Mon, 04 May 2026 23:21:03 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm880738b3a.37.2026.05.04.23.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 May 2026 23:21:02 -0700 (PDT)
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
Subject: [PATCH v4 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Tue,  5 May 2026 14:20:24 +0800
Message-Id: <20260505062026.91724-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260505062026.91724-1-cuiyunhui@bytedance.com>
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_232104_311130_EB569815 
X-CRM114-Status: UNSURE (   9.96  )
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

The RISC-V PIO helpers derive I/O addresses from PCI_IOBASE in ins*(),
outs*(), and ioport_map().

Under configurations where I/O port support is not available, these
expressions can still be formed during compilation and trigger
-Wnull-pointer-arithmetic warnings from clang.

Introduce a helper for the address calculation and guard the PIO-only
helpers with CONFIG_HAS_IOPORT so unsupported configurations do not
construct these PIO address expressions.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/io.h | 26 ++++++++++++++++++--------
 include/asm-generic/io.h    |  4 ++++
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 09bb5f57a9d34..6f5d70313c83e 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -56,6 +56,8 @@
 #define __io_pbw()	RISCV_FENCE(iow, o)
 #define __io_paw()	RISCV_FENCE(o, io)
 
+#define PCI_IO_ADDR(addr)	((void __iomem *)((unsigned long)PCI_IOBASE + (addr)))
+
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
  * allows us to use the raw read macros, but we still need to fence before and
@@ -102,12 +104,14 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
 #define readsw(addr, buffer, count) __readsw(addr, buffer, count)
 #define readsl(addr, buffer, count) __readsl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
-#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
-#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
-#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
+#define insb(addr, buffer, count) __insb(PCI_IO_ADDR(addr), buffer, count)
+#define insw(addr, buffer, count) __insw(PCI_IO_ADDR(addr), buffer, count)
+#define insl(addr, buffer, count) __insl(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -116,25 +120,31 @@ __io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
 #define writesw(addr, buffer, count) __writesw(addr, buffer, count)
 #define writesl(addr, buffer, count) __writesl(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
-#define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
-#define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
-#define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
+#define outsb(addr, buffer, count) __outsb(PCI_IO_ADDR(addr), buffer, count)
+#define outsw(addr, buffer, count) __outsw(PCI_IO_ADDR(addr), buffer, count)
+#define outsl(addr, buffer, count) __outsl(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
-#define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
+#define insq(addr, buffer, count) __insq(PCI_IO_ADDR(addr), buffer, count)
+#endif
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
+#ifdef CONFIG_HAS_IOPORT
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
-#define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
+#define outsq(addr, buffer, count) __outsq(PCI_IO_ADDR(addr), buffer, count)
+#endif
 #endif
 
 #include <asm-generic/io.h>
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index ca5a1ce6f0f89..d799e5ccc9437 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -1205,8 +1205,12 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 #define ioport_map ioport_map
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
+#ifdef CONFIG_HAS_IOPORT
 	port &= IO_SPACE_LIMIT;
 	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
+#else
+	return NULL;
+#endif
 }
 #define ARCH_HAS_GENERIC_IOPORT_MAP
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
