Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C7C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HskkEfjBMczhxLgbdudn5Gzagk5sWcRZlv7q2YNwps=; b=seCz+StWusW7Iw
	dGn8nSko8XV5dNCYGqYQN5J12SWL3k96+Y1BFwQCWa2eD55pG/tAdwZlRYScdOo0yorIbBS0oN2+G
	7LhO4hcJ7pqhdTMoRQUzapuigVawdc8GEMK35+4hLsEHoJ+1EMhf2VWUa8vLbiYf8HFWGoevOLPTt
	lJA27mGaN4ksSeMuZvTf7fmjrcbbN7hzAqTIBnNMJDpzivRgdUga1xv1SOeI0V66X1hFKW62exTLE
	hi069PwwDscHVoT2UxcBg28OJymWrFKB2WVFcZo8QX//Xih+bVtKS9EpPftXiG8CIXgY/QLIvLkT7
	m7WZ0eYF0PDL09ZKCyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd1B-00000006wHe-2V2s;
	Fri, 03 Jul 2026 12:29:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd17-00000006wFj-32KK
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 12:29:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so331674a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 05:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081753; x=1783686553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+VxPGsXEB5teg9HEsa3LZ3vy1Qgi8wQBPtiYzVf6Qc=;
        b=TQa6HwBl6XcWGeFlVTdFLRqR6p0+9vQFVjGU6zw5ntQ33bv/kZZ9JeEJeKhknopNx1
         o99ZpUn8nboBD7bvczu4QTMKv7T8cwui4PdJmxjedpgIWXZDi/lv9SCOBLMe7IIWhLAa
         Ww8E+kHMTtqURSl/MNtXiNqmPoYDGZEWiLFKQCTuvQWWKDCrlMHL2N7bhabt9R92SZdH
         xXvtxtlCjn9kV68bZWQWrjG18As/DJ7RWYkRgkjAHXje2qmH06YKPY3rgxKSmEEuie/l
         AbtJvSyG/XYEJ4dW06Wa5qkyxfADRzArkYAmPyTnQ5mA0IdDu7sxFcmB8B5WNMa6TeRI
         qExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081753; x=1783686553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+VxPGsXEB5teg9HEsa3LZ3vy1Qgi8wQBPtiYzVf6Qc=;
        b=e/9y0fO3h/ZvdwvL2uHFtAKucLBAJnPcjbIvm6lMgPj5bgqbUH18dadw+wBeK9C8SJ
         8y7yFF65ueyp1ZZixHQ4obzIGEkpfZWwY+ZByQwpAzCXixzimTA+eUUejq46DMmkof4G
         bqF+bYMTHO1Mmto6BTNipcV7nM3FbTzDwOQiuCPf2hHMOQcMIPYUBCtfsFzQr7PVA29K
         omPxUYil9YTfCZXdYziC/VUoim23g9HvweoI5rp2cceAclQk1J1zd5pAENcnIw0pBKLt
         omPQG3xEfAengaYwecvuY6N6Ep/0/+gBLGCS5/zIoF2wXlHG6dDpikpV3WNR05jHHnq0
         Y6Zg==
X-Forwarded-Encrypted: i=1; AFNElJ/JDZaiMI7d7HKZj1AUPRM5s9gK3dehC8HbeNLoURrRtcknlovySUY+IZVkaZhkYIms2BpA81/coI2QTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJR52kBMi0FFkBp0fhH9tnPTYfdkZ/XFMPyOQSpDCqT7lcHgMI
	5SHQx9fmFvJ2GvX+nsGUHu7SZdjT+4TB9wn5/hhkk/F2s1nk9ucWW9pOA5CDRAjxV20=
X-Gm-Gg: AfdE7cli3FXJrlSd5ASJPhz97ELQXwlNFdDyz2G4UIDCOBoPcEXZVg6pq3B9tI2Vo5R
	FnM0pyhuTSGmgX0i71qW0Sh74Ho4FPXmHLTYYw1LOLAlN+0ZLS7KubKtaCb69x3imdglshfV7kr
	7dOoLdpKSXPS1vlGg9elAfq093Ob6lHx9sbq5fjgGg+fAs40bZTdHODI36Zye/qGqPDf4T7aWjQ
	/WcjGkD/EK46BV6Q3cdvr83OJCWlvT66+lnNMtZD0E5FSEZmnEj572MIOK+z3zFS9Btfh+Q7Vfj
	p4bFo8RWQKNTld8b+ajUV07VF09Cn0Wv6/dW+1Osr5pUxKK2HOQ/cUYI9b/sF2Q4vJoyXtaBAJU
	DbrCjqQOIl0dUKXY3ysgNvLwFwo5H/3NsJt3kR9ANgvSMiYov9LgSagJesQM56MTIOzLj+veQGW
	dWe/qbK7oFxVkDCDXeFU02TUFK0chWewnSlhQOd+8J4E5IFxmBiG0=
X-Received: by 2002:a05:6a21:514:b0:3bf:b960:6fc4 with SMTP id adf61e73a8af0-3bfed4701b4mr11795889637.30.1783081752569;
        Fri, 03 Jul 2026 05:29:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2705551a12.9.2026.07.03.05.28.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jul 2026 05:29:11 -0700 (PDT)
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
Subject: [PATCH v8 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
Date: Fri,  3 Jul 2026 20:28:30 +0800
Message-Id: <20260703122832.15984-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260703122832.15984-1-cuiyunhui@bytedance.com>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_052914_427338_AD0A5E20 
X-CRM114-Status: UNSURE (   6.72  )
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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
