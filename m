Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A824D5B172
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iA1VfYsnIi3P2yBVN9TsF6R9JiS6RjH6CMZboRwrObo=; b=omisASSnTv7Xb4
	tlLAlDZnY7c/ya9GTAtNeE/xMZn4x+DHUur6Oxz6PHn15g8lWT8P1rYknDtkVDNvQjQrbe6DHOWFQ
	7p9rd3HNaX7zhocsBNdE4aiPugIgqDfDzrXHIs5YGnY5E/YEuBkpGdIsfCIqoervraisRMnBm5uor
	BUmWAmEEriaefy27KESxJ+3dLh75kLkGo5jaSE1jE9T+pYf+Bg62VLtjrKIGwzCUsU3kojaCIM4ym
	o5yWsPm04PtIpVIvJ0yecYPUaijvT6cExQ+uXulRMZ+FFV6U4AiE4McSNhIowN7x8wGhFZOhXqEcv
	n7hXMetvByceIMDEPK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4r-00000002aKF-0FuH;
	Sun, 14 Dec 2025 16:36:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4l-00000002aHs-3zJd
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:36:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5943d20f352so3340187e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730162; x=1766334962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH0zKZXb/Y5gUEGiokm3nZsvrljXzf5GckdYzZU3nLY=;
        b=MqaFGm5+Fj6vYr3ENNzKuCMCemoth+KOOZfDZXRLIk+/WyMkoIWUNHwSrX69a6PNDj
         rht7+GV3Pf/Y2SIMR4P1Bb7pUdYw8K8WKvLrkuUdyMJpFqK9N+kgKEJlP0FbKhcbIO8G
         c8pKdMZmTX1l7l/uhP1HQ6b+YubwR6zo64Q5Mfvq0b4Ppc2yP1PFm4w25rJ1ajVE0H/6
         IYLlyO7tpQFzrzl0e91qbxSmj2eq0UpdW2yknfp4BtqWUzBC5m+yeCSMNt/V3t7PdbN2
         XHU52vw3DHYojeEhsw7S97ec3sKJdcusnmvgX7yvPsTxRA2eQK/702H2/l1dAd+EOaSG
         wU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730162; x=1766334962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aH0zKZXb/Y5gUEGiokm3nZsvrljXzf5GckdYzZU3nLY=;
        b=Cttlk+s86vNFLtCu64fxjAcKtT3ST7GyMemxDEnUBVcsUcSogkbNgxafLsFAVp8CuY
         u9F4/J/vaXM/9OWS98iqZfaJjYG+uQyhMUR5hIotk8QvQW5E8De+SHy2+jmud3k2pa0+
         PL2fja36VuAYrTN6xfrDHqxfBufMZhC1FBcKJGmoqq/trlmnOAHV6sU3+cvEVmfq/bii
         /alaHLq/hP1x6kQKZe184DfkTbGNmN+IH2BaqhMpoTwM5zy17ALPUef7KE1fUVkZxgH2
         QHmCXeT0FbHvTWA+/K4YnZ+WJXPKDBRaXQEHHtTyX08fWlGnaQe+RMzjPWWODcKNQ0Ew
         1cww==
X-Gm-Message-State: AOJu0Yx3+NIJKOfUaPpkUkfTKXTXTk44uXpVKHajtFL+sX6O1wxY7bfy
	P+QH7iDxkFBaV9eIVTkUESdnmnM5B3uhqn2k/k2/VVxix+8Q8BsE8d3sxYIOaYCg
X-Gm-Gg: AY/fxX7xNWPgf7XP0nr/1yXUa6KG6L3kPNK4tU+7fJZAmPWSEdgHhpSEI8LIRRIIYOO
	pruesqzwJTZdsr6+g6vuMcjlBffX/1Kbp/WQ8SggnEoPYUG0P6k2ALh0lYTgCyv+knGvHD2+jd4
	5XmOhwPp2UYVAM3EIQZw/LpRl0PiQDD1YcS3vvaQ+AIKhEloBdx2HStLrdAT1Bai1WUsnuo+6tZ
	RGijIarDqey8+y3FiSSYAtPXAOquiW0pC6QDjlNd+NKQO+O3Vft1eIpWE93TboTFL9kWZj5vcFh
	10Xp1zYOcuQfiXmVM1vUs2Ghqp+FzlCM212ASmdN/6zJwvxzy38cYIQcbJyYnPgj69Xo5UXbXkD
	cux1vHJaWB44p3DaXTUhMfCP8z5SN5tYicLblaW43juhy22+U3ceVFvWJdEcry0MQ2lcULDqFl6
	i0VONN2xtYFjss
X-Google-Smtp-Source: AGHT+IGg2O6UbEA1J9//+XT5+Hs1atMO2Qc+sN+YnLd8rt1bcW3PK1V2c1Ri3kEauyeryHCL6gCzRg==
X-Received: by 2002:a05:6512:3d05:b0:597:d5dc:b3e0 with SMTP id 2adb3069b0e04-598faa223bfmr2694122e87.10.1765730161456;
        Sun, 14 Dec 2025 08:36:01 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:36:00 -0800 (PST)
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
Subject: [PATCH v5 9/9] selftests: riscv: verify ptrace accepts valid vector csr values
Date: Sun, 14 Dec 2025 19:35:13 +0300
Message-ID: <20251214163537.1054292-10-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083604_526010_76227F95 
X-CRM114-Status: GOOD (  16.88  )
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

Add a test to v_ptrace test suite to verify that ptrace accepts the
valid input combinations of vector csr registers. Use kselftest
fixture variants to create multiple inputs for the test.

The test simulates a debug scenario with three breakpoints:
0. init: let the tracee set up its initial vector configuration
1. 1st bp:  modify the tracee's vector csr registers from the debugger
  - resume the tracee to execute a block without vector instructions
2. 2nd bp: read back the tracees's vector csr registers from the debugger
  - compare with values set by the debugger
  - resume the tracee to execute a block with vector instructions
3. 3rd bp: read back the tracess's vector csr registers again
  - compare with values set by the debugger

The last check helps to confirm that ptrace validation check for vector
csr registers input values works properly and maintains an accurate view
of the tracee's vector context in debugger.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../riscv/vector/validate_v_ptrace.c          | 262 ++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 623b13e7582e..c72533a331de 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -654,4 +654,266 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
 	}
 }
 
+FIXTURE(v_csr_valid)
+{
+};
+
+FIXTURE_SETUP(v_csr_valid)
+{
+}
+
+FIXTURE_TEARDOWN(v_csr_valid)
+{
+}
+
+/* modifications of the initial vsetvli settings */
+FIXTURE_VARIANT(v_csr_valid)
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
+/* valid for VLEN >= 128: LMUL= 1/4, SEW = 32 */
+FIXTURE_VARIANT_ADD(v_csr_valid, frac_lmul1)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x16,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x10,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0,
+};
+
+/* valid for VLEN >= 16: LMUL= 2, SEW = 32 */
+FIXTURE_VARIANT_ADD(v_csr_valid, int_lmul1)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x11,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x2,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0,
+};
+
+/* valid for XTheadVector VLEN >= 16: LMUL= 2, SEW = 32 */
+FIXTURE_VARIANT_ADD(v_csr_valid, int_lmul2)
+{
+	.vstart = 0x0,
+	.vl = 0x0,
+	.vtype = 0x9,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x2,
+	.vlenb_max = 0x0,
+	.spec = XTHEAD_VECTOR_0_7,
+};
+
+/* valid for VLEN >= 32: LMUL= 2, SEW = 32, VL = 2 */
+FIXTURE_VARIANT_ADD(v_csr_valid, int_lmul3)
+{
+	.vstart = 0x0,
+	.vl = 0x2,
+	.vtype = 0x11,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x4,
+	.vlenb_max = 0x0,
+	.spec = VECTOR_1_0,
+};
+
+TEST_F(v_csr_valid, ptrace_v_valid_values)
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
+		asm volatile (
+			".option push\n"
+			".option norvc\n"
+			".option arch, +zve32x\n"
+			"ebreak\n" /* breakpoint 1: apply new V state using ptrace */
+			"nop\n"
+			"ebreak\n" /* breakpoint 2: V state clean - context will not be saved */
+			"vmv.v.i v0, -1\n"
+			"ebreak\n" /* breakpoint 3: V state dirty - context will be saved */
+			".option pop\n");
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		struct user_regs_struct regs;
+		size_t regset_size;
+		struct iovec iov;
+		int status;
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
+		/* apply valid settings from fixture variants */
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
+		ASSERT_EQ(0, ptrace(PTRACE_SETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* skip 1st ebreak, then resume and wait for the 2nd ebreak */
+
+		iov.iov_base = &regs;
+		iov.iov_len = sizeof(regs);
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov));
+		regs.pc += 4;
+		ASSERT_EQ(0, ptrace(PTRACE_SETREGSET, pid, NT_PRSTATUS, &iov));
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* read tracee vector csr regs using ptrace GETREGSET */
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* verify vector csr regs from tracee context */
+
+		EXPECT_EQ(regset_data->vstart, variant->vstart);
+		EXPECT_EQ(regset_data->vtype, variant->vtype);
+		EXPECT_EQ(regset_data->vcsr, variant->vcsr);
+		EXPECT_EQ(regset_data->vl, variant->vl);
+		EXPECT_EQ(regset_data->vlenb, vlenb);
+
+		/* skip 2nd ebreak, then resume and wait for the 3rd ebreak */
+
+		iov.iov_base = &regs;
+		iov.iov_len = sizeof(regs);
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov));
+		regs.pc += 4;
+		ASSERT_EQ(0, ptrace(PTRACE_SETREGSET, pid, NT_PRSTATUS, &iov));
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* read tracee vector csr regs using ptrace GETREGSET */
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* verify vector csr regs from tracee context */
+
+		EXPECT_EQ(regset_data->vstart, variant->vstart);
+		EXPECT_EQ(regset_data->vtype, variant->vtype);
+		EXPECT_EQ(regset_data->vcsr, variant->vcsr);
+		EXPECT_EQ(regset_data->vl, variant->vl);
+		EXPECT_EQ(regset_data->vlenb, vlenb);
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
