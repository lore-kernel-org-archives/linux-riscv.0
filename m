Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5CACCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJziKA+KtUF/+1Yiv2mCvvNTRdttEXBJkqHOpqsoaZw=; b=GPgV62vZ9FlTX4
	rJhheuOUfGTPcT4dWlrbZG6GuZQJr0oxEsQHzfk+MCa1dlj++a+o6BtyRB7/QCeJLIuvBqnr5bdic
	DF6Lz4XkMmWL3VuxoJ84eCCTQyKvuxVxO4MYxmHuQ8ExYsD5eKHUCzzKKULVsT7KxajLmkDUL68M6
	hNIFXekorlwPqzAZoNAkG3HPF7AoTVB3hwciFA2LG+fXkqZvtuKsHH9RxRLTecF6XnfYLGkOn9V+2
	b2hUkGl5Oaz7R1l5Ynm8aTvmTml0UdprndlEtiG3cljX91KfuWm0tVCKj0118ade1KLczFguct5P7
	26MfvQMvhqC4EY+oPE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU2-0000000BlGb-3zwS;
	Sat, 25 Oct 2025 21:07:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU0-0000000BlCt-0WA9
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-591c98ebe90so3115355e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426446; x=1762031246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+3PCUAZa0DUv6sTvtwuDqroHsEJ3FLzwb4INWCxjQ4=;
        b=ax4LrgPo0Fonlrw6K7akhdgc3WoolwqjfA3w5GGizE80zVz5eM8FHg0N72iCRQuceB
         FBRxxOAtz6LIrt+9y7qDkiAXt4RgiEG9r5UlxLM3D8rQRUeRRYBiEQbPx7RRbsBhK7aN
         6FcDx7s9g8TFsYdyDSyaiA+4orIDn0240IwiYq9twCnfms/Y/1m1CHi+nKAbv7StlfwE
         UgcCP4hMJ1uA29qkXTB/72h1UYnGe2EUshMFJia2pIbCQDAaQk88pxIUBgsc/yTJAWz+
         IiWv4KL6a/MVyxRQUwcrhs3cFvtBlPysknrRYZYyTqor216Vk7h/N0xsVrEwWuPd6275
         VpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426446; x=1762031246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+3PCUAZa0DUv6sTvtwuDqroHsEJ3FLzwb4INWCxjQ4=;
        b=pmF8eJlCVMmJSLbOFFCNIkEw/8PQTqQYkEGKXzgiDkQZXGMZ0X2l6kTY8EBqR60KZe
         IVgboIV7mPNRTKQf7d7Ln/vfgyq5iyg6PegltW/IX/A3SXJZacL7mL2f9o1wGTQJDxrD
         6nUU/SKLhjNdl9fLbR+xD9ADA68rS3cO8C7aPkSmn2sQb3RLu2U56yb90U6TyCnPRAso
         xrN6ZPCu4T5Xq1jlHJDrTXDQySbMjxn8jlUKRstKsIUxkv/NELCWbU/CC7q7noqzgB7S
         O4xKlz6SoyVDO/2pgVfgDWbSFMDY0Q5cuXcjyCQMq3dGac2h9zqtAcdWYDpH7UpRKcE3
         N9+w==
X-Gm-Message-State: AOJu0YyuKJ5w9KAhrDratK8l2Ua3h14zgI1Ro4TIWR6yuVfhQ3x0j9cz
	KwA3R9J044dMWU8X1q80GvKZz7HgZZ1M2C3XLavPMYJ82ITd0Z23MiMtZA60aP8xvrs=
X-Gm-Gg: ASbGncu+KAQTAJRSlVRup4OY/Es83VBNlruyoLwCZ5o5Qtry/HRIDKJypvFxiRgt9Lt
	ugeuRwras88EH5xpcdJAr7Jf7WcZeSYjGU8BekRazsz9Q42yWidYAu/yM4fqL+HXo38LFHeVYYS
	onnoomr4CfPeEgsOqOZ+58XAyqDt17fy9Jbf+fnY9M8z85Le0dCVIY297+nKXmA//sLwosSM8s8
	XFlfjoVDP3ZWS4F0yHOZe4G1zGSnnOTXMUCiKvey4X9QnMr94QC2ZaIkkfDAaZvK5Qc2GmovFRX
	CzgWeIp6FQspKnkTC/xhzuYtaf6l0QByxSkdUqBM49fkBWTbiizi0HBKK2PtqMEWH2MG3wBuTVi
	H+yyXxNhGnIothDs7qeOo9ZhJUQDIfKAifxs36ByiYrGRfMSVDH2JZo3aEBQPVcw8FQs=
X-Google-Smtp-Source: AGHT+IFygmVOPWIUoykhoH5YWn53+/c15PZMNyiAiwvSLDcSRlng5caecNche3FLSu9Mte7G8CF3eA==
X-Received: by 2002:a05:6512:b84:b0:592:fae7:52de with SMTP id 2adb3069b0e04-592fc9d6dbdmr2248268e87.8.1761426445635;
        Sat, 25 Oct 2025 14:07:25 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:23 -0700 (PDT)
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
Subject: [PATCH v3 7/9] selftests: riscv: verify ptrace rejects invalid vector csr inputs
Date: Sun, 26 Oct 2025 00:06:40 +0300
Message-ID: <20251025210655.43099-8-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140728_210711_9BE307B5 
X-CRM114-Status: GOOD (  14.09  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 232 ++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 9fea29f7b686..6f3f228c0954 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -183,4 +183,236 @@ TEST(ptrace_v_early_debug)
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
+/* modifications of the initial 'vsetvli x0, x0, e8, m8, tu, mu' settings */
+FIXTURE_VARIANT(v_csr_invalid)
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
+};
+
+TEST_F(v_csr_invalid, ptrace_v_invalid_values)
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
+			asm volatile("c.ebreak");
+			asm volatile("c.nop");
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
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(3UL, regset_data->vtype);
+		EXPECT_EQ(0UL, regset_data->vcsr);
+		EXPECT_EQ(0UL, regset_data->vl);
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
