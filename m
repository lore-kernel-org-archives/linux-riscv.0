Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A7CCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuwktqF8LlmtGp9oM3PUK+fS2OYPs2p+f6lSL+D+4QU=; b=JTLqwXQG9bsOHX
	B2y9NFJLS3Ild1MB9yLlNeWYvQ1uGenJ8JuqT2XFcac0wtPB4qWODSyU1AvGHRFmbO72wB6VJYBNf
	pds5vljwLUw33SzKN56Vuf/HNQImKBF6cYinT+cMurjaOqBb/pieZ9JGtKoML+sc6FJLukLJize5w
	0jKOdM/WH18i6taECrmvG3ugwxo8wPTZQg3Rv6mmJ9TePi9k2jEjHz7mjqbsPDO1eDIn8Hf0J7ifi
	/E8fy/2CwPZCNE9B0xIgWts5cu7VtHUrnS8LH2lDnW5VNO2pzalA0ewaIMBjizgYQuFTcHQJZC+tk
	tzqvwDaVlkDK5mDZqEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopn-00000003P4T-10av;
	Sat, 08 Nov 2025 19:42:51 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopk-00000003P0B-0xqb
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37a5d03b53dso18115071fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630966; x=1763235766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MFI8F8MhzTGH2Tkz0Xnk/at+/PFhFqLHCBOZQcDhpQ=;
        b=jma3kzLiPmVXk/AvAUKh6bQS0Z3FuN+Pi4PN6Vs8uh+/4Roz6Dv1FzBhValtFFl5g2
         xBEyjB3KadTzduj8b+Aa4dyffF/WOazrZQut4/8xAPZHzpuu1N9Azr4yag8g/qMGSh8/
         KIptLodNh6jkys04sxZdLODlo25CsuJ6Xw+DZC04pu29MGViRB0fQSj6IhuRScKIMtWQ
         itVCEyG+Ux2qE9kA/dzwxLnCN25gAOshtApw8ZOdTZyW5r6WWIAexcWOm0RgGsq3igiP
         ejQPtN1KII3FEvVlgUQE5pY2Q1zISB1WHl9ZmyrvwG9T0Lgou7oTljDG2H+4FLoBIWPa
         70Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630966; x=1763235766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MFI8F8MhzTGH2Tkz0Xnk/at+/PFhFqLHCBOZQcDhpQ=;
        b=hDKJPDWlKtBalPJK9Bk0Pm8bIp6lIMnugmJa7TZEaRwjqLeBKvd4wkuTgZcMQKzXAl
         Gjbnbhbj99PcTI8tVvQp4VNjzelOS84TEzC1QXDwY4CTNRZ4N/TDhSnl25/LWB3bWaBk
         6jlB/YGkGMe8CWKXMyGLg6G3gmsMzjF+S3Q5pbKsU1W5Z6tWgjRZmoI7JoUwk8XbqutW
         MH+wQfVV/WQP6tOqx+02o0/qYDNEYahlkHq6KwiWZo3fEh57dFKSeCSB8M92Em0YFZFy
         mEkKJOPxD5aOOPqwe6dM80ADWcjC2R6Xl7gutyDuwpd0ZNIujdGchoyuf+BSVSkbdlMg
         jH6w==
X-Gm-Message-State: AOJu0YwOUoffo+8VBsUEOCt1VowC/Jtt3Xk6sbfvjxs7sVE3SzIYaTIv
	MQAi8b2FB4AonZs0MX51O6b/dA+s5sZmc3MMPYTWUbI+aVUpKlQUi3xUzmy3kd6W9vQ=
X-Gm-Gg: ASbGncvPbBVPs9lHzOkeATlRBOD6Jl5lnrjxMx4YdlOkb9fYV6hIT9Jk74/BhB3oe8t
	D9cym7ZcXnC21b0sK3cBmDLgO3lndOH2X9J8mQh52CW3a/zdNgxFW4g4j5xbkyNekCLO2MotgxZ
	2gW8nqtcf8DEVOSqm5nxJSBOj15CO08jzQ4680yGVu6PPgZIaDiYf7LHjxdalTl0kIrJIG8KOxo
	2eVMw8Lj+7YrukgwIedu0uOxF8OUUb0ehjDGDlIoT7W6oKkPBWpG0+4NZmwYlmYx2Kh28HOWHBX
	h5cd7xQdd0myR4PcSLMvZ5mHhZ8jENDajchz6OQ4Xb5CnoORpMl/nfAz3f8wj+v2OFookg8Keke
	CaQYcfUolkL1H2wD8HjJPAZzlqm4pXAFtosApIFYCP5VxBt8g7rVcj3iBHQpyHE/gyqqB+fwtId
	UHlg==
X-Google-Smtp-Source: AGHT+IHbYn87jHk26NRP1W1uXjBVOyzCstea/e1FIM8sKuFxADbEgxnxI++FMyPzsOedM9+Po12fWQ==
X-Received: by 2002:a2e:9bc4:0:b0:336:ca4c:df40 with SMTP id 38308e7fff4ca-37a7b188b62mr7853891fa.12.1762630965754;
        Sat, 08 Nov 2025 11:42:45 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:43 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 8/9] selftests: riscv: verify ptrace accepts valid vector csr values
Date: Sat,  8 Nov 2025 22:41:47 +0300
Message-ID: <20251108194207.1257866-9-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114248_343570_E6AA94B0 
X-CRM114-Status: GOOD (  16.47  )
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
1. init: let the tracee set up its initial vector configuration
2. 1st bp:  modify the tracee's vector csr registers from the debugger
  - resume the tracee to execute a block without vector instructions
3. 2nd bp: read back the tracees's vector csr registers from the debugger
  - compare with values set by the debugger
  - resume the tracee to execute a block with vector instructions
4. 3rd bp: read back the tracess's vector csr registers again
  - compare with values set by the debugger

The last check helps to confirm that ptrace validation check for vector
csr registers input values works properly and maintains an accurate view
of the tracee's vector context in debugger.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../testing/selftests/riscv/vector/v_ptrace.c | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 023e1faa84bf..fb371a42de15 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -421,4 +421,227 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
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
+};
+
+/* valid for VLEN >= 32: LMUL= 2, SEW = 32, VL = 2 */
+FIXTURE_VARIANT_ADD(v_csr_valid, int_lmul2)
+{
+	.vstart = 0x0,
+	.vl = 0x2,
+	.vtype = 0x11,
+	.vcsr = 0x0,
+	.vlenb_mul = 0x1,
+	.vlenb_min = 0x4,
+	.vlenb_max = 0x0,
+};
+
+TEST_F(v_csr_valid, ptrace_v_valid_values)
+{
+	unsigned long vlenb;
+	pid_t pid;
+
+	if (!is_vector_supported())
+		SKIP(return, "Vector not supported");
+
+	asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
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
+		asm(".option arch, +zve32x\n");
+		asm(".option arch, +c\n");
+
+		asm volatile("vsetvli %[new_vl], x0, e16, m2, tu, mu\n"
+			     : [new_vl] "=r"(vl)
+			     :
+			     :);
+
+		while (1) {
+			asm volatile ("c.ebreak");
+			asm volatile ("c.nop");
+			/* V state clean: context will not be saved */
+			asm volatile ("c.ebreak");
+			asm volatile("vmv.v.i v0, -1");
+			/* V state dirty: context will be saved */
+		}
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
+		/* resume and wait for the 1st c.ebreak */
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
+		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
+		EXPECT_EQ(9UL, regset_data->vtype);
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
+		/* skip 1st c.ebreak, then resume and wait for the 2nd c.ebreak */
+
+		iov.iov_base = &regs;
+		iov.iov_len = sizeof(regs);
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov));
+		regs.pc += 2;
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
+		/* skip 2nd c.ebreak, then resume and wait for the 3rd c.ebreak */
+
+		iov.iov_base = &regs;
+		iov.iov_len = sizeof(regs);
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov));
+		regs.pc += 2;
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
