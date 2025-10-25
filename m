Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540FDCCF9E5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVQBf3r4LCaaqSWXwdwYH2W9A4HofEm1EWqrpiqK05k=; b=IxmGsS7VawaDJh
	eJcbYi8oAGM/XaKUKZ1tYAWhCqjXFBLTFTynDPcI6GUi8JSlzweJ+LJNHyXZ/y+52JTPmoBGeieuS
	HcizJrIQP9ZRQzhtSuerEdCu7V5zsyG+oiyEnEToxK0fqVVCnLGNMmej1enhn6RGsXXl7SpTs+gq9
	bEI8/m9X5glsd+ioHp9G5FysvDXG27ZC3xZXX2E38eGat/AA8KhkF/x84FRsIsXB50rwLhkE+JBon
	dXWjq6u10mH1gjvmau0lwVxYJk3jYnaztKLb+edHN02zXPtBfjYNuFZ3Nv5e7zOQCAqwGQv0AqqQb
	XBHDaitBP1aGuUfSaDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU5-0000000BlIk-15Jw;
	Sat, 25 Oct 2025 21:07:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU1-0000000BlE5-32zZ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-592ff1d80feso1926018e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426447; x=1762031247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/WytJDhcml/wh8CfWvtXKArp//bBeFRbcjbh31QcQ0=;
        b=XfAX+gXJVAdEWCmp96wIcg9/0PJzyc+IEQANnSqcB1tckg5jAhXgBuEdBLjh3xb2PF
         7T85iBvN8t32PL3Mh9px15ewCdct8nEX5UMqcY8PFEkidgqh4LKrQOZkKNzHS/fo03fr
         RdTIPRaDrhRrE3tLqoF9ZKtyYZS8ypkPB9gkbTQeKF3DGlDEe2p24MOGnjDMRiGOzHHb
         vlDoLdhbqgC0uTS9F/fP2I+PoK5ED5y6PX0x0TauGbYt4fIFQU8yaOrnd+CmTuMyT0n+
         dVnKsmIBBazCzU52ViFE9qm/EsgN1M4nXaBQHRu/NnDImXR1tdZ4GheGF6ub+SCdtCZ0
         VKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426447; x=1762031247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/WytJDhcml/wh8CfWvtXKArp//bBeFRbcjbh31QcQ0=;
        b=VDzyi88Zt5irHLlz9inibfFtq4Pae1xf/lMCw+l6O+NMj5ym6rR8wqPMyI8Divoncf
         SzOmck5vYJLL53AE1YwsdDlUvEAknz6eydo0W0ixqKiTmg/z5J/m6wuudJgI60pNVQX5
         lVlHk3jEPBNuaTVHm7xduADShi9tpEVP67zEzC6g2Bdt0ahfJzZ1odI/OXc3/sMOQDGq
         H+UGUAY3Ccd4W8bZETl6HsdrlLQVBIXWf3k7GIEbU+2H0Boah61PrkY1H2WKxyJVaZRf
         bzFWnAsQiuuoxl7aSoMWb4pKLt14kZ9cXIIjW15ttAh4xuk0QNwryDu7+z2Q1lpOBq2T
         WEjw==
X-Gm-Message-State: AOJu0YwvBJ/l71ekPkftVR9t5T1Kg3FPFbAJM3QvLNGNe6iKv3HPq0dX
	rPoxS7CDT9eMzTVGRZ4lb7d0dDYnp+XTgrlwsC1TUyPT7oDoiNLRteTgAWyTIj6XJd0=
X-Gm-Gg: ASbGnctw1pJJzuqrAO7bProb8yl9rtIZUKLMkIA1xZ9sQaGbJh76pr95IaDogv8KOKm
	IxkQLHwUh6DHilImAQe4D1AsBWj07QVMlizl8eOZKi7pK8fayaN3diqVnVE66ymqPVA9LZVwDP6
	1RyabW3ioFQfKaaSw6G2n3/v4vGgqK7ILnZrJ8rA3y8xaAttmQSEaW+HiH0wYiOX8Jjml514o+e
	8aKnijMseyvdyhp3tCP2PmIUyxL0SQ+YskYhEv+yAZIY41tDJzXbD01dniIrFbr+drY/mPJn443
	ZCVHQB0b3rByhzP/bG4kIchIbyQM7up5x2/G7UdEk9tBo3k7o3L9gNrpTu9HyXPAPH7OsBzkItL
	mowpWnuJlA+r2/L78yqnTRq8U2ZA7vNDeACPXEarwG4kcaOVbrnwzfvEvr72LOwo2gRA=
X-Google-Smtp-Source: AGHT+IE1sREq3fH/oWR2aWw32GwHAGJvm4v2GsuZh2SMIXAA5/VrvNypw0BdSZVh8ZDIWto+ctm6iw==
X-Received: by 2002:a05:6512:3a8e:b0:590:656c:d116 with SMTP id 2adb3069b0e04-592fc9f7f21mr2234095e87.17.1761426447221;
        Sat, 25 Oct 2025 14:07:27 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:26 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH v3 8/9] selftests: riscv: verify ptrace accepts valid vector csr values
Date: Sun, 26 Oct 2025 00:06:41 +0300
Message-ID: <20251025210655.43099-9-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140729_811969_4CE84060 
X-CRM114-Status: GOOD (  16.14  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 6f3f228c0954..7e8fdebded07 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -415,4 +415,221 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
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
+/* modifications of the initial 'vsetvli x0, x0, e8, m8, tu, mu' settings */
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
+		while (chld_lock == 1)
+			asm volatile("" : : "g"(chld_lock) : "memory");
+
+		asm(".option arch, +zve32x\n");
+		asm(".option arch, +c\n");
+		asm volatile("vsetvli x0, x0, e8, m8, tu, mu\n");
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
+		/* verify initial vsetvli x0, x0, e8, m8, tu, mu settings */
+
+		EXPECT_EQ(vlenb, regset_data->vlenb);
+		EXPECT_EQ(3UL, regset_data->vtype);
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(0UL, regset_data->vcsr);
+		EXPECT_EQ(0UL, regset_data->vl);
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
