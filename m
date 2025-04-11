Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573EC3601E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 02:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SaBsUk/jeLmW0hbEEcbz9a/myYFaHzWnU3N0Z9/ftiU=; b=ovEBe94qjtqqR+
	U+k0EoSgseLBeKsuP8XxqEaRXM8mKnh1ZjPCIOfh/YJt9DvhzodU+xWJRVnHNc+bdwjmr7RxsWITn
	5Qw18kwcIOqMlDeyid4XwfBK8Ay2htWfC0LK4p6m7EGu07QedSzBKNDQzw6zhfOerOIZauqhlMS12
	kYBAPN2IAsSReGd0eI4RkNmG5eoXoHOM12PaYGZ4f1H6yatTfIiH+QsxryrP5KFLoX3PGBOTMbcY6
	rMwlQEIaTFwuP/Btjukciw82ySVCUJHpQyUIhijSaK88/XAgE3l7ZqhYxzr+0jnmYUDRB+tQaYyUj
	LzM6zjzTPleBOokaXn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34FL-0000000CK9j-0D3W;
	Fri, 11 Apr 2025 02:35:59 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u34FG-0000000CK7c-38sV
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 02:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744338866;
	bh=lOEueMjEzcQH+7FTLLQIxv5mkIyaFq/uP1KvEW094o8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=T51oKA9v3cKxJouRx/J1OTjy3lODYL9E+eMIBgdy/vB0+Edp/GvCZ/TCXyCUTk4ub
	 3VfRLph3nNLlxViv+hvEUwP2QYDAPGtyz53TbQ7SKSRCaXOvfiYk8bxM5MFIA3c2XU
	 zpwFbiC7FNvzCWNwbWSYFNMgG1e32GRI3m32C5WQ=
X-QQ-mid: bizesmtpip2t1744338855t90627c
X-QQ-Originating-IP: VREOsRjt7J4ccSVoy0EUwQUzXam43CY8I2m/vm0gMqE=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 10:34:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1101699977250414760
EX-QQ-RecipientCnt: 17
From: Liu Runrun <liurunrun@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liurunrun@uniontech.com,
	mingo@kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com
Subject: [PATCH] RISC-V: Fix PCI I/O port addressing for MMU-less configurations
Date: Fri, 11 Apr 2025 10:34:08 +0800
Message-Id: <20250411023408.185150-1-liurunrun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-0
X-QQ-XMAILINFO: NbaNCZAwxYkC8tz94DCqbTpaeh94MQnqpC3mPq1ebrq+DdWnJfrq9WlZ
	vOrgaYvRO8LT5nnQSg/+77xKWgjWK3rD1Vk6/KvO7mjZ0KLPWYxmThR7fUUMVvJ07zRybCj
	UViYu6iwOUjedgSLhCJZIRDpMKpcSpqH/t4UPjGG3HyzN+GhkSc3amwdmLYhvyvZkke/Yv7
	6zpKoGtIYpIcd6WQYgwuiXerRa9v+DRLEZ3gzPnzi2NyNYQfJ+v6XNuI/SEqsjhe4RPW+vx
	nvf0TBttg21VhrOB9n1v4gzkSJp2yZgbTiepUUKCX7mN7B7+Jredb0bhYgUbRvHrabUTW3G
	qwEWQpS2Cqq9svdIDwIEcKk/OgtSoC0j9B5QrxCJ1Gdub3e4eon6EfaaYVpxFS6q7xXV6X3
	JosoQ5atIsqcTyQP7OGgy0utN8HKQlDNypW3RdjxXtbILln3uxgWTdEwGiwtedkzwrBvq/X
	qOkFQ2rbv3crtfaRJktVudRbLhig6TWEBIKqYYdf0mjXujRwPLhBjbR6i5q3M/ryyL3n98S
	e3NAKVKreQ2MWXEQc583xImaKOFVrEkCTcUPj4Hvlth/tyxeZ1kCyLGOXCazrsXIdayIjMU
	XKUgzii6dUGghMDCAkpExb/nTW9MvH3d3KiPPg2azPo03cRzUf94jjj9dtx8qoiYpNzb3CJ
	yMTMNxfGoL0iKyP+n8Yn9RvmurLq+uGB/6Okk+JunNnELOnnGA53rXr0mH6OoYaPh2Gz6CH
	J+akQoK2Vz2iiRNUV+4pPmHMhim0Xo+yCY0jI61WQGxcrlvPmQt6i2J2O2Q46LVbSPCwpeC
	Xec1I64hYJsPXs/fw2UabrklF3Sfnl24CYrL3WOJRmTccpycYGc5tA3GtTn99CRE9EL14ji
	f+fs/M/fUO6tTP9hVTn43PZxIzBriHFER4+FgTBE/Y489O5RdwkWxV1z4taQy0luN7JdyaE
	cw+NxcmLIgG8pEsbUf5qmuv9VL+2/DEBJe9N/YcPqcBZeFhc5rmdLYd3S
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_193555_172675_AEB57E0D 
X-CRM114-Status: UNSURE (   9.32  )
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

This patch addresses the PCI I/O port address handling in RISC-V's
port-mapped I/O emulation routines when the MMU is not enabled.
The changes ensure that:
1. For non-MMU systems, the PCI I/O port addresses are properly
   calculated in marcos inX and outX when PCI_IOBASE is not
   defined, this avoids the null pointer calculating warning
   from the compiler.
2. In asm-generic/io.h, function ioport_map(), casting PCI_IOPORT
   to type "long" firstly makes it could compute with variable addr
   directly, which avoids the null pointer calculating warning when
   PCI_IOPORT is a null pointer in some case.

The original implementation used `PCI_IOBASE + (addr)` for MMU-enabled
systems, but failed to handle non-MMU cases correctly. This change adds
conditional compilation guards (#ifdef CONFIG_MMU) to differentiate
between MMU and non-MMU environments, providing consistent behavior
for both scenarios.

Fixes: 9cc205e3c17d ("RISC-V: Make port I/O string accessors actually work")
Reported-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Liu Runrun <liurunrun@uniontech.com>
---
 arch/riscv/include/asm/io.h | 22 +++++++++++++++++++++-
 include/asm-generic/io.h    |  3 ++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db..d5181bb02c98 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -101,9 +101,15 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar(addr))
 __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
 __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
+#ifdef CONFIG_MMU
 #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
 #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
 #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
+#else
+#define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
+#define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
+#define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)
+#endif /* CONFIG_MMU */
 
 __io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
 __io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
@@ -115,23 +121,37 @@ __io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
 __io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
 __io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
+#ifdef CONFIG_MMU
 #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
 #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
 #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
+#else
+#define outsb(addr, buffer, count) __outsb((void __iomem *)(long)addr, buffer, count)
+#define outsw(addr, buffer, count) __outsw((void __iomem *)(long)addr, buffer, count)
+#define outsl(addr, buffer, count) __outsl((void __iomem *)(long)addr, buffer, count)
+#endif /* CONFIG_MMU */
 
 #ifdef CONFIG_64BIT
 __io_reads_ins(reads, u64, q, __io_br(), __io_ar(addr))
 #define readsq(addr, buffer, count) __readsq(addr, buffer, count)
 
 __io_reads_ins(ins, u64, q, __io_pbr(), __io_par(addr))
+#ifdef CONFIG_MMU
 #define insq(addr, buffer, count) __insq(PCI_IOBASE + (addr), buffer, count)
+#else
+#define insq(addr, buffer, count) __insq((void __iomem *)(long)addr, buffer, count)
+#endif /* CONFIG_MMU */
 
 __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 #define writesq(addr, buffer, count) __writesq(addr, buffer, count)
 
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
+#ifdef CONFIG_MMU
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
-#endif
+#else
+#define outsq(addr, buffer, count) __outsq((void __iomem *)(long)addr, buffer, count)
+#endif /* CONFIG_MMU */
+#endif /* CONFIG_64BIT */
 
 #include <asm-generic/io.h>
 
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 11abad6c87e1..c0409188bb5e 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -1172,7 +1172,8 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
 	port &= IO_SPACE_LIMIT;
-	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
+	return (port > MMIO_UPPER_LIMIT) ?
+				NULL : (void __iomem *)((unsigned long)PCI_IOBASE + port);
 }
 #define ARCH_HAS_GENERIC_IOPORT_MAP
 #endif
-- 
2.49.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
