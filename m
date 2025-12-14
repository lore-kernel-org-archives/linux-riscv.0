Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD816D5B173
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp9NwlgnQXSGfAQCN5VpaVJ6VeYrKZ2T2wTCivBPc5M=; b=3pa1ERk1HIMYuT
	QgHCihaDCzKMXlPMhvFPALYWdJdDjLKvMjMjM+fqC9ZgWwouvNOlQAhk3XmLP566p2nsP60HXMnKk
	/K0QJtW3/KKuQ2nl4AAETIItz4e2o8/nsMK4UIfWtZo+5CJA95p9PCZtBrZ1+e5lVa4RCFkiG5/1A
	3Sqrk4abz7/f8v0zp+YpbRqzXH6IYpEhsQKON44gqlbUp0yvY70Upce0vYdrgxqSaKYKiJhrg0eJ1
	E0gdFCQEMZxCjbvSwR525EKQMJE1qsqTWuHPJViVcNAkjSGGWcgKfcashcu/QdCo6nbKDhydIL6w2
	1tVfPpvrxHcHH+D+brzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4l-00000002aIF-1DE2;
	Sun, 14 Dec 2025 16:36:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4h-00000002aFN-38uy
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:36:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-596ba05aaecso3150175e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730157; x=1766334957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCjNPmJLrpJn3Ut2d1Tu4Faw1b2CRzQ8noRKY714zGA=;
        b=j+5eMK6iIqMcROqEAHlGUDdXWbaa1N89pOUltX/WmCQXKCyyVP7HTYqlR5sWX18qhJ
         F0iacF8WFw/n3UREGkCico4NhHSr47E1PqjhdlEpuaEo2xPlI94QhP32xYAIIonGAFEI
         6oixg+xO3TTMXIFup7k2Ygx3GYfQ/d1Yf5wYVCE3kvGrYh957jfWIkEJmsiFXz2dB0X4
         pEKooFMDgkppolVJlvaTt2yIW+b5D9F3Er+xA5b5Ab6z+Lhe2xSvHI9647474TYSXWe8
         pTa2OZFwWJ8haoFGgTLAixVcTomAl9aKK94VuR2WHRuHGG3Yv4ScEVRr3LBtg3hhqx4k
         fvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730157; x=1766334957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCjNPmJLrpJn3Ut2d1Tu4Faw1b2CRzQ8noRKY714zGA=;
        b=hW9sl73ZA+pJD/gbMfvjZdJEHK+Yz+7z277/4rcgVzc7C9kGaGMHd0+RRb2Jc6Lm73
         GxJeanrwQIDdyRr/esVVSPriDZUwwSE/6E6RAf+e7tENuUgtf4pR3xgp7rC+MPsT+bjo
         3+gsmFJ4xLPGJUOB4oHx7tj+1hnMdvpNrld1kTcJcc54Ey24jETarTghPNiWnQYjeQq0
         SDtd4qRajBlPrmmigY688QTl9lpTa5WmOjzJHdOwR96gEJn6UGHjacClnYatTBVP/ruY
         q7cgz5EgZiUyCD8UG85PCcuq7Eiu72AVx65eGqtt/fDdr6+tJCkYJqhEA5kwuOvE9ZnA
         IW7g==
X-Gm-Message-State: AOJu0YxOfvXZ7pcXNiKf1X1jERiW3WGG+yWC5BTdExfwfVM+84x2P389
	sDvc9S31cqzrHbhfOmqVhKU/vARHTx05YtG9F90xd/yJ2LeKFqYotBx3oX1BmWhT
X-Gm-Gg: AY/fxX6aog/FT1Zfyb1y4NXpkgxWoAjo21taH8XY5eaZW0PNBUn469cDmfbXaXSzhDf
	3Fn/jHVQfnZqeuHuPM61wVJ2KmyWOaIe0XYIYh5Z/B4Pni6P8JR0yT9swMMSFI4OemMLyFQUGkY
	Re1ohYLV9k7+iqYDMkNEp5En65YJoiIjhAGVH3sKpNsrXMUQcHfRtphKna+dSqwDdyz8cDOEG8k
	h/j/fpH0snlxoK/3YkPwcauZDkv2nirdk6ZOsz4muwve5PeLeYQBdZInd1Kj+N+JGBY+K5ReFmj
	SyLrljc192+I+IaA5Uzf1zNhuHmwf8KFJ5QaGmDVxqdF+29p4EQTQ0XE8GvMKWG1GLwWpgi1pxg
	6MBqUeJqeUbJfTx/SlcKry45zYZvpPl9nWzKWk+TmNnEjMFXOxrCVLeO13ZCSF2crR0N3YHIH2I
	C4UA==
X-Google-Smtp-Source: AGHT+IGRHdWeURxKMpbmL/T6K5rtF0X2VXcD24R+7mw/s+BE8VCrIbvP8MMR8nJUBe8utmaTLEJ33Q==
X-Received: by 2002:a05:6512:3f26:b0:595:9195:3390 with SMTP id 2adb3069b0e04-598faa1499bmr2813865e87.5.1765730157035;
        Sun, 14 Dec 2025 08:35:57 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:56 -0800 (PST)
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
Subject: [PATCH v5 6/9] selftests: riscv: verify initial vector state with ptrace
Date: Sun, 14 Dec 2025 19:35:10 +0300
Message-ID: <20251214163537.1054292-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083559_886725_179D5072 
X-CRM114-Status: GOOD (  12.58  )
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

Add a test case that attaches to a traced process immediately after its
first executed vector instructions to verify the initial vector context.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../riscv/vector/validate_v_ptrace.c          | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index b64986b42270..a8d64d351edd 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -13,6 +13,9 @@
 #include "kselftest_harness.h"
 #include "v_helpers.h"
 
+#define SR_FS_DIRTY	0x00006000UL
+#define CSR_VXRM_SHIFT	1
+
 volatile unsigned long chld_lock;
 
 TEST(ptrace_v_not_enabled)
@@ -77,4 +80,136 @@ TEST(ptrace_v_not_enabled)
 	}
 }
 
+TEST(ptrace_v_early_debug)
+{
+	static volatile unsigned long vstart;
+	static volatile unsigned long vtype;
+	static volatile unsigned long vlenb;
+	static volatile unsigned long vcsr;
+	static volatile unsigned long vl;
+	bool xtheadvector;
+	pid_t pid;
+
+	if (!(is_vector_supported() || is_xtheadvector_supported()))
+		SKIP(return, "Vector not supported");
+
+	xtheadvector = is_xtheadvector_supported();
+
+	chld_lock = 1;
+	pid = fork();
+	ASSERT_LE(0, pid)
+		TH_LOG("fork: %m");
+
+	if (pid == 0) {
+		unsigned long vxsat, vxrm;
+
+		vlenb = get_vr_len();
+
+		while (chld_lock == 1)
+			asm volatile ("" : : "g"(chld_lock) : "memory");
+
+		asm volatile (
+			"csrr %[vstart], vstart\n"
+			"csrr %[vtype], vtype\n"
+			"csrr %[vl], vl\n"
+			: [vtype] "=r"(vtype), [vstart] "=r"(vstart), [vl] "=r"(vl)
+			:
+			: "memory");
+
+		/* no 'is_xtheadvector_supported()' here to avoid clobbering v-state by syscall */
+		if (xtheadvector) {
+			asm volatile (
+				"csrs sstatus, %[bit]\n"
+				"csrr %[vxsat], vxsat\n"
+				"csrr %[vxrm], vxrm\n"
+				: [vxsat] "=r"(vxsat), [vxrm] "=r"(vxrm)
+				: [bit] "r" (SR_FS_DIRTY)
+				: "memory");
+			vcsr = vxsat | vxrm << CSR_VXRM_SHIFT;
+		} else {
+			asm volatile (
+				"csrr %[vcsr], vcsr\n"
+				: [vcsr] "=r"(vcsr)
+				:
+				: "memory");
+		}
+
+		asm volatile (
+			".option push\n"
+			".option norvc\n"
+			"ebreak\n"
+			".option pop\n");
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		unsigned long vstart_csr;
+		unsigned long vlenb_csr;
+		unsigned long vtype_csr;
+		unsigned long vcsr_csr;
+		unsigned long vl_csr;
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
+		/* resume and wait for ebreak */
+
+		ASSERT_EQ(0, ptrace(PTRACE_CONT, pid, NULL, NULL));
+		ASSERT_EQ(pid, waitpid(pid, &status, 0));
+		ASSERT_TRUE(WIFSTOPPED(status));
+
+		/* read tracee vector csr regs using ptrace PEEKDATA */
+
+		errno = 0;
+		vstart_csr = ptrace(PTRACE_PEEKDATA, pid, &vstart, NULL);
+		ASSERT_FALSE((errno != 0) && (vstart_csr == -1));
+
+		errno = 0;
+		vl_csr = ptrace(PTRACE_PEEKDATA, pid, &vl, NULL);
+		ASSERT_FALSE((errno != 0) && (vl_csr == -1));
+
+		errno = 0;
+		vtype_csr = ptrace(PTRACE_PEEKDATA, pid, &vtype, NULL);
+		ASSERT_FALSE((errno != 0) && (vtype_csr == -1));
+
+		errno = 0;
+		vcsr_csr = ptrace(PTRACE_PEEKDATA, pid, &vcsr, NULL);
+		ASSERT_FALSE((errno != 0) && (vcsr_csr == -1));
+
+		errno = 0;
+		vlenb_csr = ptrace(PTRACE_PEEKDATA, pid, &vlenb, NULL);
+		ASSERT_FALSE((errno != 0) && (vlenb_csr == -1));
+
+		/* read tracee csr regs using ptrace GETREGSET */
+
+		regset_size = sizeof(*regset_data) + vlenb_csr * 32;
+		regset_data = calloc(1, regset_size);
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* compare */
+
+		EXPECT_EQ(vstart_csr, regset_data->vstart);
+		EXPECT_EQ(vtype_csr, regset_data->vtype);
+		EXPECT_EQ(vlenb_csr, regset_data->vlenb);
+		EXPECT_EQ(vcsr_csr, regset_data->vcsr);
+		EXPECT_EQ(vl_csr, regset_data->vl);
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
