Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02D6D5B16D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvIBTynk2EERpaeTMKGx/ERQO41kiNC0ur3mCwx/m+I=; b=Q8mQZWjJ1X4D0G
	/OXZ3DTF+7bAW3IDJdMkSpk3Igeg+I4e3z5tMZGmNerBPRZnDWdf9YVOaNd0kspkIUbRIDv+SjVrQ
	k4oy5izJU9VuJ/lUTHQeS3Dv04xnrylR+W61q3iQ5EWTLatYBrQStISsVAvfKxSG786KjMp6A1z6Y
	daCzpMCJfBFoXJ/wNAZJul/N73cogPxHJ8VWaGT9Mg9KkhbP4drAYQ8ZndgCvVP2u2B9kfvSrAs/7
	y5dgvxpb98F/49TC8bGDT8xCAIE9zXBEw8s7leL1cvKKlGXkvrzLj/IU37bn+YkPeRaaXu0ZdSBEE
	sWxBk1r+SymXEWo2CKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4o-00000002aJW-0IX6;
	Sun, 14 Dec 2025 16:36:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4k-00000002aH1-1uYM
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:36:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5957c929a5eso3980227e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730160; x=1766334960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQaSn0DLqOFOsA8M/K0su83gKd9Tn+v/MOGwCqXayKA=;
        b=mTJuRGeYVEYMm1KkZFCMMGruNAQLPwnl+9QDoDBOcO15Pn+7ukvRuHepM1sJY9Amro
         6KZkWaa9eUJ0t/ne+8XKsfR/YZ7rw3r+KD63DTaG8In9vvGFGk7oKahBb/ESWeO2FCCH
         fspKnTu8QwfXK8Sz0YwKspUjqFTJyw5y2qNMxzaxo+bwPWBmM9iw1BZSvQZ3rHpLRTLy
         dytYKzRk0peKXfalcVo2bVei7T+e4b8GRIwNl5qtrRz9brFtNH5uV6glwRphjC6cgFZD
         AQmzyEdID0mwtSYJyaMQCIfKDLTKxVK2XU8pSczjL9T1f8SXSNP55rvRHP5WCdX3c78Q
         SepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730160; x=1766334960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sQaSn0DLqOFOsA8M/K0su83gKd9Tn+v/MOGwCqXayKA=;
        b=PPPurkt+n808bmbSVfr4Xu3ICI5Z0ugYc3GdLq1pXSGzViAQ2/E1InccHQgwIgP6be
         qSSc+XeqW/E+lBpBoA/9Okxu9hfihmX6s9wRY6F2qdDiZwBoIas5RuWwdQMcASRQXseF
         s0YtlUJ3ZMfX+YkCoqmCW0b5XnVabb5odm2m+U0ItajRwCd3QX4XzxnNBV2RSN6tPiUl
         sNSsvy+qJKo4e/xp/0mF0JvRLnIs+LtzpQ0t4b3g2LtWSFjL77YCFhjnmuUzm19h0Uhq
         0ilHcboTVSsNE+BIYhbB0BvM3Ms5prk9opNfR+eNFTF5W8tHCxvnjNnOtMZg6p5uf+kI
         zJRw==
X-Gm-Message-State: AOJu0YwBMX9nUTGScJxoVOT4++GJ2Rrtpmu+TrANt/99o+ohr71fIqJT
	04B1qw1EEw0gasofmY9DMQ7n6no3qZy03Enc28DrmmPO/DNYFSmMhXOkJtqKAA9y
X-Gm-Gg: AY/fxX6P3CZrfCiOy5UYOUPcgkLk+rFABaU90wA4ros6GYBgDqc0lfOENjSTfPqx5nC
	v1wFojVwtwHeUuQcnRF14En0nLCmT6i3FErSpJu5ZfnGzgaXAkmWu4E0/LYlMLZlI5zKU+x/Gqk
	NwEY39xNOVXPAHlrdeoBKEslGxd1+FeEjc1OREK6BZdxSZKgUQGlNSU2+BgQ3r0BcewTkrOCdSp
	z0ietZICs0Fur2Yy+ml3Ln4bD75SW0tbHirvEjjnE6+qnSznZD6JXnuYDPhYXYxYi4TQN5z6X7O
	Uh/EyWWcW0EeNrUaFH94osKZva+J1QUIHO3Sfj+oHy3vjqjlltuskTavIaLHPASJwZrdff5eVRt
	8e7wmG4f9A1hWL2Ln4prsuZoDe/3WJ0VDhfCHSnpcr58FoqQ8EPWegQJF8vwVy7bQDG3iWB6x9R
	IvCg==
X-Google-Smtp-Source: AGHT+IF2w7XngXI0Qr5uEUjrppLH+KRGrVaFiuWS6ITxuOpJgvkDn9nUFBqzNj2KkczyUIhqPar1hQ==
X-Received: by 2002:a05:6512:3c95:b0:594:2a0f:916f with SMTP id 2adb3069b0e04-598faa9299amr2673562e87.43.1765730159952;
        Sun, 14 Dec 2025 08:35:59 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:59 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 8/9] selftests: riscv: verify ptrace rejects invalid vector csr inputs
Date: Sun, 14 Dec 2025 19:35:12 +0300
Message-ID: <20251214163537.1054292-9-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083602_591833_643DD4B0 
X-CRM114-Status: GOOD (  14.95  )
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

Add a test to v_ptrace test suite to verify that ptrace rejects the
invalid input combinations of vector csr registers. Use kselftest
fixture variants to create multiple invalid inputs for the test.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../riscv/vector/validate_v_ptrace.c          | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 2dd0c727e520..623b13e7582e 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -336,4 +336,322 @@ TEST(ptrace_v_syscall_clobbering)
 	}
 }
 
+FIXTURE(v_csr_invalid)
+{
+};
+
+FIXTURE_SETUP(v_csr_invalid)
+{
+}
+
+FIXTURE_TEARDOWN(v_csr_invalid)
+{
+}
+
+#define VECTOR_1_0		(1UL << 0)
+#define XTHEAD_VECTOR_0_7	(1UL << 1)
+
+#define vector_test(x)		((x) & VECTOR_1_0)
+#define xthead_test(x)		((x) & XTHEAD_VECTOR_0_7)
+
+/* modifications of the initial vsetvli settings */
+FIXTURE_VARIANT(v_csr_invalid)
+{
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	unsigned long vlenb_mul;
+	unsigned long vlenb_min;
+	unsigned long vlenb_max;
+	unsigned long spec;
+};
+
+/* unexpected vlenb value */
+FIXTURE_VARIANT_ADD(v_csr_invalid, new_vlenb)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x3,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x2,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0 | XTHEAD_VECTOR_0_7,
+};
+
+/* invalid reserved bits in vcsr */
+FIXTURE_VARIANT_ADD(v_csr_invalid, vcsr_invalid_reserved_bits)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x3,
+	.vcsr = 0x1UL << 8,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0 | XTHEAD_VECTOR_0_7,
+};
+
+/* invalid reserved bits in vtype */
+FIXTURE_VARIANT_ADD(v_csr_invalid, vtype_invalid_reserved_bits)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = (0x1UL << 8) | 0x3,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0 | XTHEAD_VECTOR_0_7,
+};
+
+/* set vill bit */
+FIXTURE_VARIANT_ADD(v_csr_invalid, invalid_vill_bit)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = (0x1UL << (__riscv_xlen - 1)) | 0x3,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0 | XTHEAD_VECTOR_0_7,
+};
+
+/* reserved vsew value: vsew > 3 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, reserved_vsew)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x4UL << 3,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0,
+};
+
+/* XTheadVector: unsupported non-zero VEDIV value */
+FIXTURE_VARIANT_ADD(v_csr_invalid, reserved_vediv)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x3UL << 5,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = XTHEAD_VECTOR_0_7,
+};
+
+/* reserved vlmul value: vlmul == 4 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, reserved_vlmul)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x4,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0,
+};
+
+/* invalid fractional LMUL for VLEN <= 256: LMUL= 1/8, SEW = 64 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, frac_lmul1)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x1d,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x20,
+	.spec = VECTOR_1_0,
+};
+
+/* invalid integral LMUL for VLEN <= 16: LMUL= 2, SEW = 64 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, int_lmul1)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x19,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x2,
+	.spec = VECTOR_1_0,
+};
+
+/* XTheadVector: invalid integral LMUL for VLEN <= 16: LMUL= 2, SEW = 64 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, int_lmul2)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0xd,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x2,
+	.spec = XTHEAD_VECTOR_0_7,
+};
+
+/* invalid VL for VLEN <= 128: LMUL= 2, SEW = 64, VL = 8 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, vl1)
+{
+	.vstart = 0x0,
+	.vl = 0x8,
+	.vtype = 0x19,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x10,
+	.spec = VECTOR_1_0,
+};
+
+/* XTheadVector: invalid VL for VLEN <= 128: LMUL= 2, SEW = 64, VL = 8 */
+FIXTURE_VARIANT_ADD(v_csr_invalid, vl2)
+{
+	.vstart = 0x0,
+	.vl = 0x8,
+	.vtype = 0xd,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x0,
+	.vlenb_max = 0x10,
+	.spec = XTHEAD_VECTOR_0_7,
+};
+
+TEST_F(v_csr_invalid, ptrace_v_invalid_values)
+{
+	unsigned long vlenb;
+	pid_t pid;
+
+	if (!is_vector_supported() && !is_xtheadvector_supported())
+		SKIP(return, "Vectors not supported");
+
+	if (is_vector_supported() && !vector_test(variant->spec))
+		SKIP(return, "Test not supported for Vector");
+
+	if (is_xtheadvector_supported() && !xthead_test(variant->spec))
+		SKIP(return, "Test not supported for XTheadVector");
+
+	vlenb = get_vr_len();
+
+	if (variant->vlenb_min) {
+		if (vlenb < variant->vlenb_min)
+			SKIP(return, "This test does not support VLEN < %lu\n",
+			     variant->vlenb_min * 8);
+	}
+
+	if (variant->vlenb_max) {
+		if (vlenb > variant->vlenb_max)
+			SKIP(return, "This test does not support VLEN > %lu\n",
+			     variant->vlenb_max * 8);
+	}
+
+	chld_lock = 1;
+	pid = fork();
+	ASSERT_LE(0, pid)
+		TH_LOG("fork: %m");
+
+	if (pid == 0) {
+		unsigned long vl;
+
+		while (chld_lock == 1)
+			asm volatile("" : : "g"(chld_lock) : "memory");
+
+		if (is_xtheadvector_supported()) {
+			asm volatile (
+				// 0 | zimm[10:0] | rs1 | 1 1 1 | rd |1010111| vsetvli
+				// vsetvli	t4, x0, e16, m2, d1
+				".4byte		0b00000000010100000111111011010111\n"
+				"mv		%[new_vl], t4\n"
+				: [new_vl] "=r" (vl) : : "t4");
+		} else {
+			asm volatile (
+				".option push\n"
+				".option arch, +zve32x\n"
+				"vsetvli %[new_vl], x0, e16, m2, tu, mu\n"
+				".option pop\n"
+				: [new_vl] "=r"(vl) : : );
+		}
+
+		while (1) {
+			asm volatile (
+				".option push\n"
+				".option norvc\n"
+				"ebreak\n"
+				"nop\n"
+				".option pop\n");
+		}
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		size_t regset_size;
+		struct iovec iov;
+		int status;
+		int ret;
+
+		/* attach */
+
+		ASSERT_EQ(0, ptrace(PTRACE_ATTACH, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* unlock */
+
+		ASSERT_EQ(0, ptrace(PTRACE_POKEDATA, pid, &chld_lock, 0));
+
+		/* resume and wait for the 1st ebreak */
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* read tracee vector csr regs using ptrace GETREGSET */
+
+		regset_size = sizeof(*regset_data) + vlenb * 32;
+		regset_data = calloc(1, regset_size);
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* verify initial vsetvli settings */
+
+		if (is_xtheadvector_supported()) {
+			EXPECT_EQ(5UL, regset_data->vtype);
+		} else {
+			EXPECT_EQ(9UL, regset_data->vtype);
+		}
+
+		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
+		EXPECT_EQ(vlenb, regset_data->vlenb);
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(0UL, regset_data->vcsr);
+
+		/* apply invalid settings from fixture variants */
+
+		regset_data->vlenb *= variant->vlenb_mul;
+		regset_data->vstart = variant->vstart;
+		regset_data->vtype = variant->vtype;
+		regset_data->vcsr = variant->vcsr;
+		regset_data->vl = variant->vl;
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		errno = 0;
+		ret = ptrace(PTRACE_SETREGSET, pid, NT_RISCV_VECTOR, &iov);
+		ASSERT_EQ(errno, EINVAL);
+		ASSERT_EQ(ret, -1);
+
+		/* cleanup */
+
+		ASSERT_EQ(0, kill(pid, SIGKILL));
+	}
+}
+
 TEST_HARNESS_MAIN
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
