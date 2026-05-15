Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E8BCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNTexWHv+NnzgDuJH1catwLApMZqSm9nLxYrEaKZ/TU=; b=i6n4NG1pUXr7wq
	uz0JvsEAZjPIGWPyKgyS233G9mFRyW1DNZOPUFatKDNMBPrrOi66IcYCyp7OC3pmQv07/TLzh+OUT
	Pb7egH7yYjLEyhrabZ7sTwQS/9Dv5dazNipBlaJ0zsZtSipmA5Tpymv6Tz0Ont8+kBKHm6uXZkzhW
	VNvyluokiTnPJoRIJBRKcU5s+I/AfCxBCdMl+MvyVqyXjlJ+YrC9+RW09Q6SmXo9TUf5Q6CoXq1vI
	zLS5UtR0oUwdQ0Mruh5DBSsnxC8Lf0XsZ6QtKoMwfc5cKOjlnbmRu7BBoL6GOJ+knFEoAH94hxFq+
	yxAbPCwzXuo4MRiDZlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFS-00000008XFp-2ZPL;
	Fri, 15 May 2026 14:10:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtFQ-00000008XEg-09Pj
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:10:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bb91b426e40so1543794966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854238; x=1779459038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKdZwHICxAcumd/0vYmGg6f5JCYmSEbXy5dzzVwJhKM=;
        b=VMHvYq0omQqpOo0YPVUO6L+oHuUEoaFgVkK8p9yuCuPlT5QyF4VlzunLSovUC3+peb
         tIbGiZwGHPExFsbVU9QB4LuSVonZfrH3n2FfTCIjk4eUl4qW5/8nyfdmxFVqYTbrNNu9
         +D1meFoXub8Q3yxsPulwgebOzrYciRBMw4WSod2KqPyg7LXxiUCQ4nPC++r+aXAADLJh
         hv8cPJR1GRsMzPlg/RR9u5yFtpu3UU2MBEJr0lCahbUzenyPNt6tGfUL+GsL/c5z1XvD
         GkLpUfZQ9DiIR3RhhehoOJ95UDkcxYNC8A4q27Lps9aug7KKM7L/ulHrCsdmo3JoPQ/p
         4dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854238; x=1779459038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKdZwHICxAcumd/0vYmGg6f5JCYmSEbXy5dzzVwJhKM=;
        b=PwSAvXXFFNWfZ42qnzHODSTfGWnyRbUh835dzZxjZ6cr4OZqJHbk5tJf/AEa9eq9P1
         WQzhityJ9lMB380aZt7uwS75sc5rYqq3A79fL27KU4KMhcELqKYt+zbJ2wNL98hIgh91
         uvD+LfUBvw0xll/VdF6XgCGEWqZJ0vgu5lnxDVLNVvH4yVgcFvGQFAPIr9EDUmn9B3/R
         m295SlHd1lQKgS3SPYCJegg4RQdwZAeBNexFS4gYcwID2r6dHGPcrG4HfQqF1C/n5ov9
         8HIzkULVTN5/ph598KH4D56FSyYlIK+JMMwy+VAZYKJx1j5YJAzKUI9XA5qN3VyilPEW
         DCfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vkj6ch6U9tT/tPcUNks3iuBK7Y8RVQ1+DMr+JZDvICgOgq0LTJ4uNHyRX9ti7OgYOWdXsDIsvnwl7Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd/8fMGdkYwS44kJQrT1rdjF65Hs+9XItBGtk1xgGFm5uZhlex
	Wry3dzYN1MQvL4ixjEjiAfq9y3Tq6JhBKOmt14tPKq5XhN/woCDWOTzb
X-Gm-Gg: Acq92OF78hLWvyRJkbh38W6cS5VvxFdArOJ5yvAf55VJ9QBHMRmtEw/665s1LL3Zk9H
	vVm4wUDWUtS38COsRM1q/USmMIizT4nWZ9xvcmZW9fKGNgyhGa7VXfwc/+axOeBU2N+Bz9Xyeta
	I861FeTD346NOMEEPuzCa+hYqoNW93lXreBL/pWTyrBQFb5LTtmSt5+Id3RrEJzvcOk6wO7/PJt
	qe51F6QfgYWxSj770gSm+tPORoNYclym0i4VOBgeO+RmdrpM49xuSantHzjFHWS+mGmeO7LxfiG
	0i2PoEW94+n3sy3SvbKR0UppoQPGP+LTCcBlgOwxhulGfnZGZsKdpqFy5oW9D6Uh3x5WlWvcgrR
	jF0JJWvgdJ/Lqw2HxYEMM4sNgtRIBTh1kqAytu7P64Q1wuvhdjYRpg98XuE2ioxw156uvdKHFDG
	YNB9asHU0/USF+quw4yiz0x5LCb5dwOw8SV6nhmQ4D0pB9EfFoyPSS
X-Received: by 2002:a17:907:8691:b0:bc1:36dd:c6c9 with SMTP id a640c23a62f3a-bd517928fecmr236919866b.33.1778854237868;
        Fri, 15 May 2026 07:10:37 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.23.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm2115768a12.31.2026.05.15.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:10:37 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v3 1/2] riscv: lib: add memcmp() implementation
Date: Fri, 15 May 2026 16:10:18 +0200
Message-ID: <20260515141019.1234037-2-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515141019.1234037-1-milant2002@gmail.com>
References: <20260515141019.1234037-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_071040_116272_E16A56FA 
X-CRM114-Status: GOOD (  15.51  )
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

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Add an assembly implementation of memcmp() for RISC-V. The implementation
uses the ZBB extension for word-at-a-time comparison and an assembly
fallback for non-ZBB systems.

Benchmark results (QEMU TCG, rv64, Aligned):

  Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
  ------|---------|--------|--------|--------|-------
  1 B   | 20.3    | 25.0   | 20.9   | +23.2% | +3.0%
  7 B   | 88.9    | 107.5  | 155.7  | +20.9% | +75.1%
  8 B   | 89.6    | 110.9  | 176.2  | +23.8% | +96.7%
  16 B  | 134.4   | 172.4  | 334.8  | +28.3% | +149.1%
  31 B  | 163.5   | 220.5  | 606.2  | +34.9% | +270.8%
  64 B  | 203.8   | 235.9  | 968.6  | +15.8% | +375.3%
  127 B | 224.6   | 268.7  | 1362.8 | +19.6% | +506.8%
  512 B | 235.7   | 271.1  | 1913.7 | +15.0% | +711.9%
  1024 B| 256.8   | 290.6  | 2123.6 | +13.2% | +726.9%
  4096 B| 263.8   | 302.9  | 2290.4 | +14.8% | +768.2%

Benchmark results (QEMU TCG, rv64, Unaligned - Offset 3):

  Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
  ------|---------|--------|--------|--------|-------
  1 B   | 20.7    | 21.7   | 21.5   | +4.8%  | +3.9%
  7 B   | 96.2    | 99.1   | 96.9   | +3.0%  | +0.7%
  8 B   | 97.5    | 118.5  | 110.5  | +21.5% | +13.3%
  16 B  | 136.7   | 166.6  | 172.8  | +21.9% | +26.4%
  31 B  | 167.6   | 206.5  | 211.9  | +23.2% | +26.4%
  64 B  | 204.4   | 229.9  | 240.3  | +12.5% | +17.6%
  127 B | 229.6   | 261.7  | 269.0  | +14.0% | +17.2%
  512 B | 245.5   | 260.8  | 269.9  | +6.2%  | +9.9%
  1024 B| 246.9   | 261.2  | 283.5  | +5.8%  | +14.8%
  4096 B| 250.7   | 295.8  | 299.7  | +18.0% | +19.5%

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 125 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6..5c5299678 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+#define __HAVE_ARCH_MEMCMP
+extern asmlinkage int memcmp(const void *, const void *, size_t);
 
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a3..b529e1be1 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,7 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
new file mode 100644
index 000000000..a531e481c
--- /dev/null
+++ b/arch/riscv/lib/memcmp.S
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+/* int memcmp(const void *cs, const void *ct, size_t n) */
+SYM_FUNC_START(memcmp)
+
+	__ALTERNATIVE_CFG("nop", "j memcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
+/*
+ * Parameters
+ *	a0 - Pointer to first memory block (cs), also return value
+ *	a1 - Pointer to second memory block (ct)
+ *	a2 - Number of bytes to compare (n), transformed to end pointer (a0 + n)
+ *
+ * Returns
+ *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
+ *
+ * Clobbers
+ *	t0, t1
+ */
+	beqz	a2, 2f
+	add	a2, a0, a2
+1:
+	lbu	t0, 0(a0)
+	lbu	t1, 0(a1)
+	bne	t0, t1, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	a0, a2, 1b
+2:
+	li	a0, 0
+	ret
+3:
+	sub	a0, t0, t1
+	ret
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+memcmp_zbb:
+
+.option push
+.option arch,+zbb
+/*
+ * Parameters
+ *	a0 - Pointer to first memory block (cs), also return value
+ *	a1 - Pointer to second memory block (ct)
+ *	a2 - Number of bytes to compare (n), decremented during loop
+ *
+ * Returns
+ *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
+ *
+ * Clobbers
+ *	t0, t1, t2, t3, t4
+ */
+	add	t3, a0, a2
+	or	t0, a0, a1
+	andi	t0, t0, (SZREG - 1)
+	bnez	t0, 5f
+
+	addi	t4, t3, -SZREG
+	bltu	t4, a0, 7f
+
+1:
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+	bne	t1, t2, 2f
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	bleu	a0, t4, 1b
+
+7:
+	beq	a0, t3, 4f
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+
+	sub	t0, t3, a0
+	li	t4, SZREG
+	sub	t0, t4, t0
+	slli	t0, t0, 3
+
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
+	srl	t1, t1, t0
+	srl	t2, t2, t0
+
+	bne	t1, t2, 8f
+	li	a0, 0
+	ret
+5:
+	beq	a0, t3, 4f
+6:
+	lbu	t1, 0(a0)
+	lbu	t2, 0(a1)
+	bne	t1, t2, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	a0, t3, 6b
+
+4:	li	a0, 0
+	ret
+2:
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
+8:
+	sltu	a0, t2, t1
+	sltu	t0, t1, t2
+	sub	a0, a0, t0
+	ret
+
+3:
+	sub	a0, t1, t2
+	ret
+
+.option pop
+#endif
+SYM_FUNC_END(memcmp)
+SYM_FUNC_ALIAS(__pi_memcmp, memcmp)
+EXPORT_SYMBOL(memcmp)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index b0358a78f..456929971 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o strrchr.o
 endif
@@ -41,6 +41,9 @@ $(obj)/strchr.o: $(srctree)/arch/riscv/lib/strchr.S FORCE
 $(obj)/strrchr.o: $(srctree)/arch/riscv/lib/strrchr.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/memcmp.o: $(srctree)/arch/riscv/lib/memcmp.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
