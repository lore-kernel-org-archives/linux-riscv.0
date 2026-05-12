Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E754ACD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LIiA75Nv2QyJzo9NkFjwqPsrOvbJnsuQWPzylT36vCQ=; b=Q8cS7RduM5ispO
	pDNoIr6eHbyTWOiwSKjZbL3CDnynFvcrVe3cFhNYLlC10KJGrCfwoRAUEgjwVSmTbESsN/wL4kxIj
	K8YJMd8waiT1lQWuLcQTtgwVVkzpP4nQpJZcsypKnS9FPHOV5ED8Xg7s2tJzUtyyLEJubtpt9UIT5
	YiRS4lCS4U+pRNVPcDGW2C7niiiiHMhHGVmH7ToV4rtTTvnApHW5p45AM0H6I3IG+jltcAfScBUY/
	pE1BcDod9v9GZm/+QhLt9poRfxS36694apmE0WtQ8sTMKwAyX09XJD1AB/f4H/f37lF8tdwOYIOhw
	55nW42aPGdl9qxU4m7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnoX-0000000GyNN-3Fhl;
	Tue, 12 May 2026 14:10:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnoV-0000000GyMN-26sd
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 14:10:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso51437065e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778595021; x=1779199821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZM+fzCNYkJrcKy3N4OsZwqA734P6megTGbF20hl8lY=;
        b=HA+FaLOb5BRaynJy2srlbiU6afg4aBJekxTQmFKKF4Evhvhh0UEFn0OeCVdicRnVmU
         8zbRbkx2p9kd93DOBlGFOlSG6ZbQIQ9CvaXkrsv82r28+F77AR9wQM6qZZGsWL3qRq/g
         PbRCFk53ere0sNzyMg8kDXffixdth0CRDb9tdv8o1Wh022L5Khk8SEruEQJWmXDS5Ffr
         EUXvhHecduEOlofbtt7zNVdXWUTLdQXwKK5naxUEWp/6zi/LxNyzSCyeFCOi4ZOTQg/d
         YfP1zv8Xi7vsLrlHyuxOG78K5JpEPm7KS+H3hE63I0XdHfNvXjLg3qfbUEF3J8McIGAH
         cZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595021; x=1779199821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZM+fzCNYkJrcKy3N4OsZwqA734P6megTGbF20hl8lY=;
        b=EsoMwWE1jwBrzDkXdFS8xtSKcp49Ffa42LG83dCdmOF3z+wNSiC8qxaheJFJcrsFxz
         dH9sOg4IzMP8cshrbgv4+EkCrszdmubHyWZw5YsPlYKKCqHKn0LCySgSUgDGY9QG0X5Y
         /tps0syhxsuATHCE0Sy4Zuh5vy3bG+hDmQrcQQ3Oc+BHJCQtZMYi0VQw5Lo1IsW/SBlJ
         ogkH/Nu9aaC4AjtKGQDmk4i3PzPCUS0PvkBPv9k5ti/gebU9/7pFsTTXqYnolfuOnNAa
         GvtA1eXyvYM0kniPeWjd514LSvl0HOYAhRBIkL4eI9yzjw4r1Xmj0K7DrGSerKIvisHE
         PW6w==
X-Forwarded-Encrypted: i=1; AFNElJ/r0moM1ZAGQIf7Y9tbN+5aPsClzQp3Kok0wQ9kQtaQ6eK/hr9RTsEbnXNQq9WCZCXiU0BrXtFA7cm2lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrY/AnV5HHyrhuxhPLJnu5cAaT5dfLZEH4fGdgGhTJ55QkSCAI
	uYuRUYzUfPTEncc6DS8fHc+xv73lZGVK0zoysYv5g2CC+rViOF2BbD7r
X-Gm-Gg: Acq92OFmemmguU2+Za1enKJcOOhtOnOASmI5MOyhMwqEiyTATxZ4z7KkUBIXeFwxHOw
	aVx0i8x43mYJ2VnAnNkn3OO0IXzGMP8XGd86O2JzIJ3LFrgPU2bgO7wm5wicD3WG44//rdf2zd0
	68dACGhsEQ1jvftgFaFIkJ6z4m2I3xnXss6isF9vacGpJr0OThQOc3R48ZsJ2MzMnjMS/kj1jJk
	T94KPCJoiubjENxOIS2X2KtZcvn7dKW9bV2JwtGJPafQWiXM6elK3SM+mV5/ilgJ6Vdf7isr8KD
	c7oHkLobIxA6wnpuOb7KIlfz1Ws2yQVKQ2/LwWCJ8BCMgJVWRsxEjDVwWTDmf6YhgKJ7FwS3iQ6
	dzr7jOotkbmugDpttw+gmFDa88gNTucIj77wTaU3jPkM5JBBGol/tsEM4BjWsYBHJv6hNZE2LEc
	dSbrjkQh15YnDvGmGRqv+PzyCOsm73xvfrXhj1tPHvoA==
X-Received: by 2002:a05:600c:8706:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-48e70696dfdmr245353365e9.12.1778595019740;
        Tue, 12 May 2026 07:10:19 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e568b04sm40557965e9.0.2026.05.12.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:10:19 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Dusan Stojkovic <dusan.stojkovic@rt-rk.com>,
	Milan Tripkovic <milan.tripkovic@rt-rk.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH 1/2] riscv: lib: add memcmp() implementation
Date: Tue, 12 May 2026 16:10:06 +0200
Message-ID: <20260512141007.1193033-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_071023_600929_A194BBA4 
X-CRM114-Status: GOOD (  15.46  )
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

Benchmark results (QEMU TCG, rv64):

  Len  | Def   | NoZBB | ZBB   | %NoZBB | %ZBB
  -----|-------|-------|-------|--------|-------
  1 B  | 22.4  | 24.6  | 23.2  | +9.8%  | +3.5%
  7 B  | 96.9  | 108.5 | 107.3 | +12.0% | +10.7%
  8 B  | 107.0 | 116.3 | 176.7 | +8.7%  | +65.1%
  16 B | 148.4 | 172.8 | 315.6 | +16.4% | +112.6%
  31 B | 182.2 | 217.1 | 377.6 | +19.2% | +107.2%
  64 B | 220.6 | 239.4 | 874.2 | +8.5%  | +296.2%
  127 B| 213.7 | 254.8 | 1042.9| +19.2% | +388.0%
  512 B| 255.1 | 269.0 | 1778.6| +5.4%  | +597.2%
  1024B| 252.3 | 280.9 | 1887.7| +11.3% | +648.1%
  3173B| 241.3 | 288.7 | 2063.2| +19.6% | +755.0%
  4096B| 240.9 | 280.5 | 2064.5| +16.4% | +756.9%

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 103 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 4 files changed, 110 insertions(+), 1 deletion(-)
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
index 000000000..444b082d9
--- /dev/null
+++ b/arch/riscv/lib/memcmp.S
@@ -0,0 +1,103 @@
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
+
+memcmp_zbb:
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
+ *	t0, t1, t2
+ */
+	beq	a0, a1, 4f
+
+	li	t0, SZREG
+	bltu	a2, t0, 5f
+
+1:
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+	bne	t1, t2, 2f
+
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	addi	a2, a2, -SZREG
+	bgeu	a2, t0, 1b
+
+5:
+	beqz	a2, 4f
+6:
+	lbu	t1, 0(a0)
+	lbu	t2, 0(a1)
+	bne	t1, t2, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	addi	a2, a2, -1
+	bnez	a2, 6b
+
+4:	li	a0, 0
+	ret
+2:
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
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
+
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
