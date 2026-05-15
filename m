Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3BCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pue/FXgHYfnEAENZf0wWVEOIPdBYdkvzRTaxC6O4ulY=; b=fs00gO4EyaXexW
	z2qhwPqi7zNRp9u4fZ8OlPA5w4C5hMpTBFQ6gVONYileq91zoy70WxiaUgiOudCFCQI6Cv/lsHv9B
	SMfZl0n7EdsRZoeJ7Z6hyxsGTW1zwiEubOIg6Nw9+apClQI33aYbNVnJDcWgfAHjkMtiTR4aJN9kk
	yt9GnObCNWAdMqOby6VasiAubwtJtqFuT1y4GOA72shj/hJfZPcAQibCCVyKqCEIZ2EQlVMGkK544
	HImwrWwQdbVp39F0TifQicpaBuabdqTjRUG9QphReGU062qt4N8oUhtPFe7mQOR9+jMuKSPNAfUcb
	7NqurnXnXiFvIzVY/4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtrg-00000008cRf-3Te8;
	Fri, 15 May 2026 14:50:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtre-00000008cR3-1LDt
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 14:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5wLPJ697j15buFae28nKx+T1fmX+G41ijvIipmfeRcg=; b=Ejf4cdFZdm56cwxBL616pz+A9m
	bmr1dODm33eeAAIzTx6gQBc0S2avZMsmb3Ls4J0c9moo9kqfuOUv3/JLC43EcGq2vc9w4LW1cKW7Q
	Cf1yF9GEjXIebw2MTkr9kalwFdWXA8364Z7/CvIgafQJLnJ12p58x4iZoO8VwcDYt5VuQgJdjBJBz
	GgVcIIl+p2T8nYCbsg+Rj39WUoA/hZaPDE2T0qDC5MlRMtL/Z4n26wM6ZJ4vO/ccSE2tsW+5X7V7T
	QObzfJEvRm0MjxQajL71aGSnvRH/6MZQOgmnj51o8zxvrMUYgnNj85sZv//C1kz61D7BsPPjFVjzH
	LIgAMvXQ==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtra-00000005UoR-3vZo
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:50:09 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so13510049a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778856605; x=1779461405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wLPJ697j15buFae28nKx+T1fmX+G41ijvIipmfeRcg=;
        b=Gp+NEaTh8o589ma8maWWZEfcVjKV7b7vkGpJkgrO8GhlS8M9fj8MTfvM42kNNJQ5M3
         a4/LI6j2J1+Eq+EEKHE4ky5Fn7em/WATCvbq4ynLYSerQJHkgJrcU1cskaCsapGw8AfU
         23jUtLfQAIxtpu46Sh9yjMH5Jwot69wHQMZLMsZaMhdIZQ/arWDqeyMAUeO85HzVqZ/2
         VZoUqJ9jMN7EZLi8PCdcqmXdlioPUCwK3Z4L6XlvtPCeidx8ks2jdUbh/o+Ql/dZAy0h
         8XiSuPqT6FljJhxR53wiJntqUrHEVueaZBgYnIVLDk6xFxD+gi9pDFNd//jWwMkwbqHa
         3gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778856605; x=1779461405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wLPJ697j15buFae28nKx+T1fmX+G41ijvIipmfeRcg=;
        b=i6LQDSEKu8s50d5mj1NWPIHKR8LcjsGGaWsCrhUA+VIzFLIEISDNggrrKV/OpzPaj8
         SZahUszmXqHPZXQj+kWX+MYQi6D9GxCMkgppQpfwGfI/bzzZ7dClPuMbakscznpcSteN
         eBDzsp/5BYcIPbQPfbGWHrAE/Gy38a+dd/TdjkT876IA6zkxaw4p29+LDYgIQ6dEzLqf
         e1d31pX/bhcviznD95YVatS+PSN2dEuo+lfwf9GlXBIYYEleJUo2LRlo1fTIwXFiSI/z
         681BRu0DbZolnWKIMW0jdg+nRbUgyC2EXXa98VVyyaPVfzWk4icQ/sbNL1XlNg0xlAFc
         K2Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8ECpkeYc/yV3eZxrflsLogCiFuu00AShqNy1+CU2CY55ZtcdMN/Gooy5sbpHah9WJNuQ+drzNpgBrvLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy438SmaWe4VL6kY1eO6BFySzt+b2+ia+kOK9M0VhuQ6yWVGhk+
	K6n/FyrNqMr1rp5BLjSYsRJMoyipn3fKx7A0UDDiRypYTJc1kNeyLJ6d
X-Gm-Gg: Acq92OG7bbbheLdERfVWAPALJf0+jeyvrZN1krJuu6Rc0nQAIMd8uXkt4GEa5laMMnN
	S5ImVKrukI7vxf5w0EPtXPFRagRyN6rggd7tbjbstaACTfgHje83N5xnR6F7xRQ4yDXl57zl92o
	G4tTHPKzAejhOMAP/nUPI+LLZGoKEP2ZZEBfcRnZpsFKwl7iPHo6awig6Ok+ABRVaJCS0e23JIY
	iz7CKlL37AKcHTJHzUsyqJt9sSIkFWOVi4kKbseS+bRhiPdZw5jU9n9M86r+I7ec3tFZJ0BuuDr
	NKvygZ3S+D7WE9OcbVv0qb79vtzM6bFFCWcIMb6FGOSeN08wOt6kko4rfgIDZEN1hxO/NOP5WNp
	mcH3pBE1y2xgjC/j1rcgs52Y4PQ4QZeJHp5M3nsROFwLHG7HdXPrdLKmPox7SEp4A9t5coPOGMd
	JrjkAfN5JHiwINfMry0+lEF4yKHfOhO/B94o/lev+ktA==
X-Received: by 2002:a17:907:960a:b0:bc6:502e:6d68 with SMTP id a640c23a62f3a-bd517acc9cbmr218905566b.40.1778856605098;
        Fri, 15 May 2026 07:50:05 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.23.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm242038566b.24.2026.05.15.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:50:04 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v2] riscv: lib: add strrchr() zbb implementation
Date: Fri, 15 May 2026 16:49:56 +0200
Message-ID: <20260515144956.1389792-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_155007_388428_8BA1792F 
X-CRM114-Status: GOOD (  11.26  )
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

Add an zbb assembly implementation of strrchr() for RISC-V.
The implementation uses ZBB bit-manipulation instructions such as
orc.b, ctz, and clz to process multiple bytes per iteration and
significantly improve performance for longer strings compared to
the generic byte-by-byte implementation.

For the test case, I used the existing string_bench_strrchr benchmark,
but I changed the input character from '\0' to 'a' to obtain more
realistic results, because I added a check for '\0' in the assembly code.

Benchmark results (QEMU TCG, rv64):

  Len   | ZBB    | WoZBB | %ZBB/WoZBB
  ------|--------|--------|------------
  1 B   | 20.0   | 22.9   | -12.7%
  7 B   | 87.5   | 110.1  | -20.5%
  8 B   | 166.8  | 130.3  | +28.0%
  16 B  | 329.5  | 189.1  | +74.2%
  31 B  | 366.9  | 195.7  | +87.5%
  64 B  | 870.3  | 231.5  | +275.9%
  127 B | 1007.0 | 278.9  | +261.1%
  512 B | 1751.9 | 305.5  | +473.5%
  1024 B| 1841.9 | 294.7  | +525.0%
  2048 B| 1955.4 | 310.4  | +530.0%
  4096 B| 2034.6 | 312.5  | +551.1%

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
Change in v2:
    - Added #if defined(CONFIG_RISCV_ISA_ZBB)...
    - Link to v1:https://lore.kernel.org/all/20260514160910.1796966-1-milant2002@gmail.com/

 arch/riscv/lib/strrchr.S | 130 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/strrchr.S b/arch/riscv/lib/strrchr.S
index ac58b20ca..82a50d440 100644
--- a/arch/riscv/lib/strrchr.S
+++ b/arch/riscv/lib/strrchr.S
@@ -6,13 +6,17 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
 
 /* char *strrchr(const char *s, int c) */
 SYM_FUNC_START(strrchr)
+	__ALTERNATIVE_CFG("nop", "j strrchr_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
 	/*
 	 * Parameters
 	 *	a0 - The string to be searched
-	 *	a1 - The character to seaerch for
+	 *	a1 - The character to search for
 	 *
 	 * Returns
 	 *	a0 - Address of last occurrence of 'c' or 0
@@ -31,7 +35,129 @@ SYM_FUNC_START(strrchr)
 	addi	t1, t1, 1
 	bnez	t0, 1b
 	ret
-SYM_FUNC_END(strrchr)
 
+/*
+ * Variant of strrchr using the ZBB extension if available
+ */
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+strrchr_zbb:
+.option push
+.option arch,+zbb
+	/*
+	 * Parameters
+	 *	a0 - The string to be searched
+	 *	a1 - The character to search for
+	 *
+	 * Returns
+	 *	a0 - Address of last occurrence of 'c' or 0
+	 *
+	 * Clobbers
+	 *	t0, t1, t2, t3, t4, t5, t6
+	 */
+	andi	a1, a1, 0xff
+	mv	t1, a0
+	li	a0, 0
+	beqz	a1, .Lfind_end_zbb
+
+	slli	t5, a1, 8
+	or	t5, t5, a1
+	slli	t2, t5, 16
+	or	t5, t5, t2
+#if __riscv_xlen == 64
+	slli	t2, t5, 32
+	or	t5, t5, t2
+#endif
+
+	andi	t2, t1, SZREG-1
+	bnez	t2, .Lmisaligned_start
+
+.Lmain_loop_pre:
+	li	t4, -1
+
+	.balign 16
+.Lmain_loop:
+	REG_L	t0, 0(t1)
+	addi	t1, t1, SZREG
+	xor	t6, t0, t5
+	orc.b	t2, t0
+	orc.b	t6, t6
+	and	t3, t2, t6
+	beq	t3, t4, .Lmain_loop
+
+	not	t2, t2
+	not	t6, t6
+
+	beqz	t2, .Lonly_matches
+
+	addi	t1, t1, -SZREG
+	ctz	t3, t2
+	sll	t4, t4, t3
+	andn	t6, t6, t4
+	beqz	t6, .Ldone
+
+	clz	t3, t6
+	srli	t3, t3, 3
+	xori	t3, t3, SZREG-1
+	add	a0, t1, t3
+.Ldone:
+	ret
+
+.Lonly_matches:
+	clz	t3, t6
+	srli	t3, t3, 3
+	not	t3, t3
+	add	a0, t1, t3
+	j	.Lmain_loop
+
+.Lfind_end_zbb:
+	andi	t2, t1, SZREG-1
+	bnez	t2, .Lmisaligned_end_start
+
+.Lfind_end_pre:
+	li	t4, -1
+
+	.balign 16
+.Lfind_end_loop:
+	REG_L	t0, 0(t1)
+	addi	t1, t1, SZREG
+	orc.b	t2, t0
+	beq	t2, t4, .Lfind_end_loop
+
+	addi	t1, t1, -SZREG
+	not	t2, t2
+	ctz	t3, t2
+	srli	t3, t3, 3
+	add	a0, t1, t3
+	ret
+
+.Lfound_zero:
+	mv	a0, t1
+	ret
+.Lmisaligned_start:
+	ori	t2, t1, SZREG-1
+	addi	t2, t2, 1
+.Lalign_loop:
+	lbu	t0, 0(t1)
+	beqz	t0, .Ldone
+	bne	t0, a1, 1f
+	mv	a0, t1
+1:
+	addi	t1, t1, 1
+	bne	t1, t2, .Lalign_loop
+	j	.Lmain_loop_pre
+
+.Lmisaligned_end_start:
+	ori	t2, t1, SZREG-1
+	addi	t2, t2, 1
+.Lfind_end_align:
+	lbu	t0, 0(t1)
+	beqz	t0, .Lfound_zero
+	addi	t1, t1, 1
+	bne	t1, t2, .Lfind_end_align
+	j	.Lfind_end_pre
+
+.option pop
+#endif
+SYM_FUNC_END(strrchr)
 SYM_FUNC_ALIAS_WEAK(__pi_strrchr, strrchr)
 EXPORT_SYMBOL(strrchr)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
