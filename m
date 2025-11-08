Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65C2CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIqi49iVlzQguHF2kIibfZGzq3hNZNEmFo8qKNhNqLE=; b=2OB9rvR9LWgPn9
	95C6upPdTm6te3IJuKmATJv7Ol+t1kzkut+/S38bw3EWmbP/AofP+U0U7GzkQQxXFi8QJQg0InCgN
	1nFIzOrJuRxLCtO39I+bKRt/Elb9Nqsg9Ul34XdQt2VtdpWu7xHSxeBZuFG6Z1H9GIJlfBnWCozip
	AtomsaodvoZHJzTCvtd9LQZAzt6gQMGQrsPrX8Fn8YPshg1Pt32xy4cHit1m1Y5VOVKF6Yi0rwt99
	knH5rjHZqKIdov8zxvMXhSpW7elnp/6sRjGtH5VYeF1UnzRX3aOYIJs95XRcDUxBEwi2u64HC5iaJ
	+zeHPx02Ragr8sxiGwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHoph-00000003OzK-3vJm;
	Sat, 08 Nov 2025 19:42:45 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopg-00000003OxI-1FNN
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:45 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37a48fc491aso17596691fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630962; x=1763235762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bbYFW276/qh6UIEkMA7XQhtcFTp5iMt1YWKBt+vv1Y=;
        b=ZsavYb+XGhTO/RU1rPf/u8XQ+gY8LxV3P+PNY/NJAGSUZyGbvezDMHY0WPXj4VeRfm
         AkuH6YaWQ+VIAjYbu9gE3CSIDTC/Fp/+zMYl3BtTO/8Lx7Dhc13HODQX2dUnrCHqC3vK
         mlZjRr7fv3GQQMThHCMZCj/GhsGTzwLcgYAOhxqz9qNW2xirFk1P6K/gCBhF5yCMEy1z
         DBiKrHBTRP5xDVOMG8h9wleRn/Mnh9wRhjKfzQ3P4Y2SEXe+F1YEHp1YArYhulJyKpbr
         wwAfOuTseqwxBBnbUl13xsVcUv7ia0TTZiA0X/ap2Pa0GWvThCDUuzQaS0h0g0BUWqNq
         NshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630962; x=1763235762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bbYFW276/qh6UIEkMA7XQhtcFTp5iMt1YWKBt+vv1Y=;
        b=ehJr/20FMKXiZRIoEeJsvkzuK1ynlEPI/3V9AptfMIw1dgneJF1uaM4wg+leIaKuWV
         bPqBTk3cVjDmmlLM1aOE93iCoufultSNMgpaP+GS8y+43sCwSIhOal8g8ouf6M7cqyoY
         5x/4ASqzgWPgJiw5yj7VdxIA5HHdzoObY3UF7xTwmbHOVlSejkbb6jFzkv7ytR62WJqe
         xj7KvM9JnBxQAJZCM7q9Pk0Ri3CARn1tfv919SGF8U7FsnYqOBcVqEK6qYvpA1Dd28pd
         fo/AqPyS5FrhS4eJfYdJDZXl38UdiXx1dt3aLHTt59kSRN171OHgb3eXmhIIdpqSTaXp
         nb5A==
X-Gm-Message-State: AOJu0Yy+D8OZ3mr316Pbf37qEC/Q58jJxMRVBlKBKf5dxSQRJTR88fJk
	m+ggqRI7Hkf609oefzN9nnVRfHj3mSJTFv8VyTCztjUbMbh1aul7+sISDjp21qkHx9c=
X-Gm-Gg: ASbGnctbeNPqXpzLFzsRibja0moUgEe2K8QjiP10tB1LFCsDV+ANkAWOINN3giJSyM/
	tZ0QZtrayODgFT/7okYRbq/Uyy0OzntjhvKP3DajOSMyhRzhxSLBbUK1seao2eXcnCohC6qjMi3
	Ks0iE/0jg+t7paZ93THNPdI6ftWms42Ip3v8Y8ZDJtdBBm5cfL+onTWij1wVsV1YGaK3J8YKyst
	sBg6CLEubNuoOmwr9jIAySHh8H+HBzj+mnFEYJ1tH3dGCysDgeGoLLKuFokJb6WdS5cDWE79yrR
	4A+gVuNESDIXZQnWMJEUVppm6hF7D1bFj8BYCERI4ZiqHAeanVNIb0/KjmOdh3aig8/zEC5k6Gr
	BCo9NknN7AAH4Ygi7MceS6SyH6NWfExaF5WWqMdSDlrIJjQ4nJLrViy01dR7VVij5TXqPCgBUtZ
	Aoag==
X-Google-Smtp-Source: AGHT+IGbqfLpIHEmSZirHycm/m3Wf8olNlfmXdlwHAR/tE60r7C92aNsJU96025k0i2AD9bl/9coAw==
X-Received: by 2002:a05:651c:e19:b0:37a:4d6a:313b with SMTP id 38308e7fff4ca-37a7b1d8abdmr5874861fa.17.1762630961836;
        Sat, 08 Nov 2025 11:42:41 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:40 -0800 (PST)
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
Subject: [PATCH v4 7/9] selftests: riscv: verify ptrace rejects invalid vector csr inputs
Date: Sat,  8 Nov 2025 22:41:46 +0300
Message-ID: <20251108194207.1257866-8-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114244_382218_590D113D 
X-CRM114-Status: GOOD (  14.43  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 9fea29f7b686..023e1faa84bf 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -183,4 +183,242 @@ TEST(ptrace_v_early_debug)
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
+		/* verify initial vsetvli settings */
+
+		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
+		EXPECT_EQ(9UL, regset_data->vtype);
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
