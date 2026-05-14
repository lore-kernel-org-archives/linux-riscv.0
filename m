Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA656CD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O+QAJ1mphhk55AapwazfdoD6Tt8HgsW+TvSmEMMUtuo=; b=15oFDw0e+WY7In
	kvsqyUD0rLBqUaZSiCHNCW+/Vj0TZmjqdXw004i6PaeM2ZAj7qer8xDLCUQ2OHQGD/ekIXls3viff
	NRJqc8BThBKuELoU7quBiEF/9UyVF8/6K3BBXEZpiAcKGWwQEkdRrzaUteetb4Uvs+gaupygKW1nh
	tWfzSqCRjl4fjvTkghp1mz2qb7DAOie6ytt7oq4+2z+ylLwQTOLldPXxo4VVeEVu/+71sEWFboxrl
	V8p2sF8E2GKJFXUxDZnO+MbnCQhfMWbh0oFgYFDo/3twVm8aGTX0fPelggU+Vv2O6kvUlynnUQ3Q3
	qfTgPmd6O2jHyqr2bnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYdK-000000060Do-2XWf;
	Thu, 14 May 2026 16:09:58 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYdI-000000060D8-0w5e
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:09:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b9382e59c0eso1333580166b.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778774994; x=1779379794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/TOhWCMb69A8t8x3HcmEMu6AFhsGlWitaL0c7QL/dg=;
        b=MY7gV5eA9h3fLgyUTyExUABFdJhvN28BGUb0TCrcnLCALOG1hJCmE7KxmsV64UZVGb
         ibv5jMqS1awS4nY+K/a5tRbVVWGH+tgD2Cx26dI4/hdL+XWDbqq+Lf0eP7M6/ovWukUM
         v0ivNwdt6z9cLntQFbHT9Ha3e7VgxVogfDpUmrAUkyAC+Zhd9LRLxDz1h6m5vBKaOnt8
         cvZXivwp7gL7F8R9QdlDFg9bh7U2rI0Msgd4FhkDwbia48JMvVJPR3SlYCrkC+0oCzuC
         GjP/gpKXA9oOcste5GqW6V5kupTLBJa3iDj4LnX6owo+beS/8ZjIyQ+1k+epLmSiij6A
         8Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778774994; x=1779379794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/TOhWCMb69A8t8x3HcmEMu6AFhsGlWitaL0c7QL/dg=;
        b=RT1zq50e4HJpKf2w3VfhU8xczvlKsBBg6MRUqRvOrW5JlrTtjPLHFEqw100qc5O/xA
         M/s4N3slTAxGtCoe36kA9FOQJZ8i+8jiXQxkDYui1ptEW72gug6sj3qYrBy3aNoyK/7e
         /6DInjsp4sSvnUcI8wu+gWZtKIdERLTMSqxsCcljFyvB1M3O89eQNeAaLC9Fw7JKPVP6
         87qsGcRBSOg3BO2v4o18ZSPUSNYqo65CU/QGgXKyZrfMM7EnOHQkiVeYPoav5pYLQiuY
         XhV3tv+sWaqrcm6qZBX7i5StJhshZlud1W9rJoiLepbC72FWWSYh3VwVGEjD2ebSJfNK
         HARg==
X-Forwarded-Encrypted: i=1; AFNElJ9vb5LLPEuXijHgE8ecf6qViPsitrFioPAt8/kBIMEg+/4ZTwL8O92gOfjn2nUBmeljyLrX1QA6PTha/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKiOQPpVJm5rgGPUfk+IsD8A2yA7uF/Ja5JqFpLLHOVyVuT/q
	zB/oF46JUNsWrU25EkGvRC3KFvCyLlWTfye/+LKWmH1vdMYVDSksfYlh
X-Gm-Gg: Acq92OGJnznzsaGE5SrczbO1zu9AW2UuDoJDoobVGUvjpmBtH33g+SWmaIzgMYPKkj+
	QACVMw9EKNmTi/7mlDBJ+Cn1Dt+dRC6IBf7aVhhoQVInVwzyJUQXT5iNo1S+MUFno7pXs9OjTMP
	QKueLv9lKct42M6oXYEepS+O4j/f/suGTZ35D2gOsLMbIg1k3U359FANfRGzIpqgaX+d0jRr37s
	e7/3HKFOHtQCojMS6ybeeIq06kStNxb5UuXr2Mu5IzfpEH9GS7Nnz+w/pYEPXtEiR8J0AArITQe
	DwKN38EqkQHuG07sUS7a9FFUcE05BzgnNDdxgpzE4qxho8L0hb3oQscWM44fG6pKGlupoPWsnHt
	7JdTAYRVB3ae5gRmRZpJQ5CCjGwhqdumKDgtkZ5g0GG7pG6IP6AwTlvM/6TFW5dXrM65yOyMCd4
	uKubdRfpxDXH+nMUCFtPB5ahMxk+eW+MCDhe51qhb4jAHvNowOF4Dm
X-Received: by 2002:a17:907:7255:b0:bd3:5e5d:7ea3 with SMTP id a640c23a62f3a-bd3c181e7fdmr577804766b.33.1778774993895;
        Thu, 14 May 2026 09:09:53 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4969850sm107368966b.0.2026.05.14.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 09:09:53 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH] riscv: lib: add strrchr() zbb implementation
Date: Thu, 14 May 2026 18:09:10 +0200
Message-ID: <20260514160910.1796966-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090956_287640_5781635C 
X-CRM114-Status: GOOD (  11.53  )
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
 arch/riscv/lib/strrchr.S | 129 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/strrchr.S b/arch/riscv/lib/strrchr.S
index ac58b20ca21d..46ca232a6b43 100644
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
@@ -31,6 +35,129 @@ SYM_FUNC_START(strrchr)
 	addi	t1, t1, 1
 	bnez	t0, 1b
 	ret
+
+/*
+ * Variant of strrchr using the ZBB extension if available
+ */
+
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
+
 SYM_FUNC_END(strrchr)
 
 SYM_FUNC_ALIAS_WEAK(__pi_strrchr, strrchr)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
