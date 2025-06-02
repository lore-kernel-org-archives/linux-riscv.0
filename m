Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A6C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnT2HP3TwYBNK43cinjtl6jT7Z4sfWXr63SlzM++7ZQ=; b=zKNC/aQpMuBRZN
	LGEs0VYsUeSwURyr3qvukH6K7fcdDFYVoUvEsjoL1BP2q2LjrbSKZj3QAlYe51nTfU6c5chSWTNSh
	Qm9dX6vbyW7ohJxwb/12+KxePcDfc5mxPdiRmkECEdKmSq5H6PZHLyR8XvDsYv9LytDZrUkehlLT6
	KHVDmCI7s9Y5KSt6WqeUjYSFBQ9zwp1u4j7/bx5VGyD7nvzpyiPRRH85HthwHRtK9GD9iW+2aBf7P
	Gt1QqEeCOAIbpsnLp8j58+0A0UXNeHWXWB+yo+CWg3Kavelr0O2hQbkTM/avRFDOnaArbDMhB8cj4
	8SGDb3+ukXfHvCVL8iAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBVy-00000008gyu-02Zs;
	Mon, 02 Jun 2025 20:12:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB5D-00000008Zhr-2Xhg
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 19:44:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2352400344aso33296555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893471; x=1749498271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zur8vnBL/aIBIBT0v6Ls3k2PGwSe6i2tzuRUsrSMGvQ=;
        b=GzIUYh03rE+vZpJIFoQOo+mrc7MFvqW+g6updh976+5rB/ihF+smWiDqXLMwANsJxO
         Bei+B1NPizujT+wLwPBEhN/oHeMlQ9/RYAC9gQymVs6qAwZqv+Ouy6SMu4uRnHViqvZy
         BsFpDFaw1QiGKA7upJuu87miQIAuywJGagdH7Lb3G1QGJzWzLqRJ5g7n51xl9MDzhlws
         TA6sNYJP0BbFBT7Hw1Wct1qsS3yEBlqHb/FnuEoBOH2ROYCbNN9LFqiVeBSvzAjC6/Gd
         zgVgCRJOGKhP5EzOBwL1XiLvQGeE5Yl+yaNrLwsHAdM9mNi+GnUEND8k0BJmNFSel5/8
         LSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893471; x=1749498271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zur8vnBL/aIBIBT0v6Ls3k2PGwSe6i2tzuRUsrSMGvQ=;
        b=h+nxogIvs1XDdQGy33EKoLyybolEqnvVvUHRkTPlyFAPam1kQ7Dq//+6q10M2WT5lH
         7fs0fPtd1O0ATz3bx6UXsCdMbJzknYKCMOhiT+LF4FsH1Y65ZVDxjoVNZy8caFeQYmwq
         cx1YCtWFHD0wAtUmoHmSXkrVkwcM54KFj/ozWMS/HHAaXlRQfIi6D8R3wgXC0MNA979E
         IqYOcMxMUNrlFFl1X+rTMhDw0KM3UNTzQZGMLQjswPfd+cl4l3NroFRLMf0UNf+zkP3G
         7icZx1t6TrJ3D2hpQFebFv6Qp+vAUzc9mdYSKNvxBWvImGW2J5u8UAZZNsNEAieysWIb
         CiwA==
X-Gm-Message-State: AOJu0YzHaBDdRfmOK8Ietz9cZRG4iqYD/DAO28k1Vsw41OQaDzezQxmX
	Q+M2FLYb08DV9ws2AtPCnpEMnhKJ8wwON5K+7AUFG4/pNhgM8Dc2f0gSKmZNiPIID8EkEejXvIA
	/RLCuDwk=
X-Gm-Gg: ASbGncuntGop6Du/TxxYl8hLYlpSKK/bb5yxPSIXTtAc9h0Zg4B/WbqD4Kxg+JHXtTE
	pkrrOiQ+Usam4u6a9JJSXT4UELitCEUBILd/PfWOBPliJAMdFRk1ASGzBFOFyLGdRWbMBCn+xAk
	C02NuRBiOnTjpXIeKPogK5CQPp4hDgtlcQLNQJeql1MixPL/DIc5ZK8OuOHmfJz52+ar5hDz4WK
	cIhNBClImJgAbki6MCuFcZIxzytI0cofziPIp2jrWIbW9w3aQtViLiWOiqv59GjQrOIHUeOTGJz
	sHU9eMhS/OeltMKwEw6ZxZFDnBprZyrOCYwvA/uefBGtJGbej+3/
X-Google-Smtp-Source: AGHT+IGGiWE+FvM3qtu3me1rB36Kwx5uGw0pOGBY7v2J71v6g26D+49dy3A/NTvFDvJEI5GYayYmlg==
X-Received: by 2002:a17:902:ea08:b0:234:a063:e2ac with SMTP id d9443c01a7336-23528fedd7bmr219553865ad.2.1748893470551;
        Mon, 02 Jun 2025 12:44:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/3] riscv: make unsafe user copy routines use existing assembly routines
Date: Mon,  2 Jun 2025 21:39:14 +0200
Message-ID: <20250602193918.868962-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_124431_650879_73932002 
X-CRM114-Status: GOOD (  15.61  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

The current implementation is underperforming and in addition, it
triggers misaligned access traps on platforms which do not handle
misaligned accesses in hardware.

Use the existing assembly routines to solve both problems at once.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  2 +-
 arch/riscv/include/asm/uaccess.h        | 33 ++++------------
 arch/riscv/lib/riscv_v_helpers.c        | 11 ++++--
 arch/riscv/lib/uaccess.S                | 50 +++++++++++++++++--------
 arch/riscv/lib/uaccess_vector.S         | 15 ++++++--
 5 files changed, 63 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5d10edde6d17 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -12,7 +12,7 @@ long long __ashlti3(long long a, int b);
 #ifdef CONFIG_RISCV_ISA_V
 
 #ifdef CONFIG_MMU
-asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n, bool enable_sum);
 #endif /* CONFIG_MMU  */
 
 void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 87d01168f80a..046de7ced09c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -450,35 +450,18 @@ static inline void user_access_restore(unsigned long enabled) { }
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 } while (0)
 
-#define unsafe_copy_loop(dst, src, len, type, op, label)		\
-	while (len >= sizeof(type)) {					\
-		op(*(type *)(src), (type __user *)(dst), label);	\
-		dst += sizeof(type);					\
-		src += sizeof(type);					\
-		len -= sizeof(type);					\
-	}
+unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
+	const void *from, unsigned long n);
+unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
+	const void __user *from, unsigned long n);
 
 #define unsafe_copy_to_user(_dst, _src, _len, label)			\
-do {									\
-	char __user *__ucu_dst = (_dst);				\
-	const char *__ucu_src = (_src);					\
-	size_t __ucu_len = (_len);					\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
-	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
-} while (0)
+	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
+		goto label;
 
 #define unsafe_copy_from_user(_dst, _src, _len, label)			\
-do {									\
-	char *__ucu_dst = (_dst);					\
-	const char __user *__ucu_src = (_src);				\
-	size_t __ucu_len = (_len);					\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
-	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
-} while (0)
+	if (__asm_copy_from_user_sum_enabled(_dst, _src, _len))		\
+		goto label;
 
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
index be38a93cedae..7bbdfc6d4552 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -16,8 +16,11 @@
 #ifdef CONFIG_MMU
 size_t riscv_v_usercopy_threshold = CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD;
 int __asm_vector_usercopy(void *dst, void *src, size_t n);
+int __asm_vector_usercopy_sum_enabled(void *dst, void *src, size_t n);
 int fallback_scalar_usercopy(void *dst, void *src, size_t n);
-asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
+int fallback_scalar_usercopy_sum_enabled(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n,
+				     bool enable_sum)
 {
 	size_t remain, copied;
 
@@ -26,7 +29,8 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 		goto fallback;
 
 	kernel_vector_begin();
-	remain = __asm_vector_usercopy(dst, src, n);
+	remain = enable_sum ? __asm_vector_usercopy(dst, src, n) :
+			      __asm_vector_usercopy_sum_enabled(dst, src, n);
 	kernel_vector_end();
 
 	if (remain) {
@@ -40,6 +44,7 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 	return remain;
 
 fallback:
-	return fallback_scalar_usercopy(dst, src, n);
+	return enable_sum ? fallback_scalar_usercopy(dst, src, n) :
+			    fallback_scalar_usercopy_sum_enabled(dst, src, n);
 }
 #endif
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 6a9f116bb545..4efea1b3326c 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -17,14 +17,43 @@ SYM_FUNC_START(__asm_copy_to_user)
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
-	tail enter_vector_usercopy
+	li	a3, 1
+	tail 	enter_vector_usercopy
 #endif
-SYM_FUNC_START(fallback_scalar_usercopy)
+SYM_FUNC_END(__asm_copy_to_user)
+EXPORT_SYMBOL(__asm_copy_to_user)
+SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
+EXPORT_SYMBOL(__asm_copy_from_user)
 
+SYM_FUNC_START(fallback_scalar_usercopy)
 	/* Enable access to user memory */
-	li t6, SR_SUM
-	csrs CSR_STATUS, t6
+	li	t6, SR_SUM
+	csrs 	CSR_STATUS, t6
+	mv 	t6, ra
 
+	call 	fallback_scalar_usercopy_sum_enabled
+
+	/* Disable access to user memory */
+	mv 	ra, t6
+	li 	t6, SR_SUM
+	csrc 	CSR_STATUS, t6
+	ret
+SYM_FUNC_END(fallback_scalar_usercopy)
+
+SYM_FUNC_START(__asm_copy_to_user_sum_enabled)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy_sum_enabled", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
+	REG_L	t0, riscv_v_usercopy_threshold
+	bltu	a2, t0, fallback_scalar_usercopy_sum_enabled
+	li	a3, 0
+	tail 	enter_vector_usercopy
+#endif
+SYM_FUNC_END(__asm_copy_to_user_sum_enabled)
+SYM_FUNC_ALIAS(__asm_copy_from_user_sum_enabled, __asm_copy_to_user_sum_enabled)
+EXPORT_SYMBOL(__asm_copy_from_user_sum_enabled)
+EXPORT_SYMBOL(__asm_copy_to_user_sum_enabled)
+
+SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	/*
 	 * Save the terminal address which will be used to compute the number
 	 * of bytes copied in case of a fixup exception.
@@ -178,23 +207,12 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
 .Lout_copy_user:
-	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
 	li	a0, 0
 	ret
-
-	/* Exception fixup code */
 10:
-	/* Disable access to user memory */
-	csrc CSR_STATUS, t6
 	sub a0, t5, a0
 	ret
-SYM_FUNC_END(__asm_copy_to_user)
-SYM_FUNC_END(fallback_scalar_usercopy)
-EXPORT_SYMBOL(__asm_copy_to_user)
-SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
-EXPORT_SYMBOL(__asm_copy_from_user)
-
+SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)
 
 SYM_FUNC_START(__clear_user)
 
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 7c45f26de4f7..03b5560609a2 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -24,7 +24,18 @@ SYM_FUNC_START(__asm_vector_usercopy)
 	/* Enable access to user memory */
 	li	t6, SR_SUM
 	csrs	CSR_STATUS, t6
+	mv	t6, ra
 
+	call 	__asm_vector_usercopy_sum_enabled
+
+	/* Disable access to user memory */
+	mv 	ra, t6
+	li 	t6, SR_SUM
+	csrc	CSR_STATUS, t6
+	ret
+SYM_FUNC_END(__asm_vector_usercopy)
+
+SYM_FUNC_START(__asm_vector_usercopy_sum_enabled)
 loop:
 	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
 	fixup vle8.v vData, (pSrc), 10f
@@ -36,8 +47,6 @@ loop:
 
 	/* Exception fixup for vector load is shared with normal exit */
 10:
-	/* Disable access to user memory */
-	csrc	CSR_STATUS, t6
 	mv	a0, iNum
 	ret
 
@@ -49,4 +58,4 @@ loop:
 	csrr	t2, CSR_VSTART
 	sub	iNum, iNum, t2
 	j	10b
-SYM_FUNC_END(__asm_vector_usercopy)
+SYM_FUNC_END(__asm_vector_usercopy_sum_enabled)
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
