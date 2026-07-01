Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D8C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWiia8RA1iVSKYmGnFC/obmdTDGt3f4L7cOZwnqLQnk=; b=pZU4D7EZZZJrwK
	rsjMBOp0z005BBf6fi4/HHFfGl8io+V11d5/oDelvlTzTyY80ueQzQ87IJHisdpfDLzBzPv/qBkff
	CkUDVnkLCZsjNrj2Rv5+xtWoflx5Y/JIGF8ISZpf/kP9zJcdTJCvadicpV5aVgrNY2KsjShfywwAg
	d2s+p7IhUnEpOzmAbJq+t+EVmZ1/6slSugTmnaQ05vU16795g1qPFs0CzpwlqOhJ3qa+v4AtQNb1r
	xkujav/KvhIety4ZQ/OpJGtBRRkZJHXaGZL6+1o3PeJ6L6oTCZqs1Hj5zXsG9JKdw11ifFfTD6Yyy
	OnffWejIU0wUNDV+q/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemS1-00000000d80-0pTX;
	Wed, 01 Jul 2026 04:21:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemRy-00000000d7L-2XId
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:21:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c9b19bbaefso1383865ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782879686; x=1783484486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/qkNHfsDn8w5YxyUx5hOgj0iL6zLAhryV4C1f/Kz/4=;
        b=MN4ryKAR8DVmkjFex+cUNawfpDOfUxPDHXzz3gsoLHUueuQlWUvTVMCKiXpLF98QGz
         N0n43R2Bf7bN5xxHEthiOuIOq4lVZrLf5mIsVPdJfOxBhGcPy3N9wvHRv0sGi5v6RSHj
         zhhumIi6JntC3KXNHjbwvjpWwUaOARFvdIA0d8BoH4oS/vqingj5h+riXir/srT8imUm
         A5Mv3vVawFblLrTOAc6mnb3p5AjnP/IlbmqXg4LSOIxi2YGzDuTau8emrYMmeEgStMS8
         EzwcD/Wh1eOlQL5BpyLh3Z1YxU9zxm8e8sxI0MjAwMOJmfjdmldBGLEMMDdxvFDpWj0h
         bmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879686; x=1783484486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/qkNHfsDn8w5YxyUx5hOgj0iL6zLAhryV4C1f/Kz/4=;
        b=DfCRHe3v07VpycTFZLKheMc26roOssUTKSpMUbbB3dLuNOlYuGWGke441PF8R6oVzl
         aXcALc0MbsLxFP3eWxQeyPKKzpgAccJwb2buuIppK8eLx1jai6kszJ5aDTOckoTar2zz
         pt6siXLTEmDYIKwI59dhMwV2SdgVCBf81x0uYD+GTHKbXPbIPFVmoYgaxuj2krnMuwhz
         LWa4ZejF/MfvGnyrE+3phwAg6kUPHhBtJ2KGEcKke4UAmIpIqpHphLOnGCfEZz4n9inR
         1IzU7/WWlskmqz3lor4xBgDXO5eoqbcByTBY094bHb1VEoXDVawYYGKsgiIj7oJpnFRK
         N2jg==
X-Forwarded-Encrypted: i=1; AHgh+RpXTH+h+OY4gh63swKaaLnHAXsOIEatWvbXGtEj0GUeTnMW8iCbRucCt8EdttfBaQIGbriM8uKJ9rfhAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaLVxFo4voMxs0pXZSrSF4u5PYS030WZnH+P4MEL0VJA3i17w5
	WhLRQOCvW/XLh4ofQYsTrcqC2MyA2OhFkVlawJGcYDZ9831nR/LHbHOn/7YLMSr512U=
X-Gm-Gg: AfdE7cmeflmXI85zYhh83FOvuxasx7wdtD77g1CibnJg0Aw/LEYw+hBzWxigYnezgX/
	lxOWigwpBBnUhtAZthz6Qi7Dduy3N1UxENEQIJ27XXxngko4aX0kUYPgWCpBg7ObA39+uOPV40I
	X9Dlr/xGIdr0VXhzOHNC3m0pYdrYfxX9PjwfwfkAmJL2I8fuxQAXgXdmnDTj4VuOZFdDcjhi4eI
	N7R9xANWBXY34faenI3L+bW04FFM1A8enh+L7AnCbp6rj63YpSMJwpt3I4nJoeZHEhtbxxOQ5Nu
	Y7GM3gmkrW7/e0pvDu3snJRsk0JXTLAuhYJCdpPAGQlw9LXXUrGisrN0Th9ts9woSp0gN+CtZAN
	ThOfUoa3VF1d3ioObEJm2k/ymnJ3uTAnivooOFfM0m0JYRbw1f7nCmcxaR/3Bx0C/BhNW3mVJ4X
	25e7K4OpynQL8kBL68KxE13gygMCX0+H8H4/PmM9CQOUHDZSGt1M56hSCr
X-Received: by 2002:a17:902:e952:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2ca7e75031amr1396745ad.19.1782879685487;
        Tue, 30 Jun 2026 21:21:25 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c73a9csm24450865ad.21.2026.06.30.21.21.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:21:25 -0700 (PDT)
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
Subject: [PATCH v5 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Wed,  1 Jul 2026 12:20:39 +0800
Message-Id: <7988df83f6341ea045ebd7294af2e8907dbd5ee7.1782877663.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1782877663.git.cuiyunhui@bytedance.com>
References: <cover.1782877663.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_212126_771622_22C9ACB7 
X-CRM114-Status: UNSURE (   9.63  )
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

RISC-V implements its own string I/O helpers so port I/O can use the
architecture-specific ordering rules.  These helpers build an I/O address
from PCI_IOBASE and the port number before calling the raw accessors.

When port I/O is not supported, exposing the port-string helpers is both
unnecessary and can make clang diagnose null-pointer arithmetic from the
PCI_IOBASE based address expression.  Keep the MMIO string helpers
available as before, but only provide the port I/O variants when
CONFIG_HAS_IOPORT is enabled.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/io.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

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
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
