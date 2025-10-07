Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD0CCA472
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2f3EGY47/SdynHSu2A5+vKbh0MyBLM96CybTIR82VU=; b=UUgM6SwK5afGZz
	1Dhddqk4hNC1gZ8rC8gdPg3tvqwcio3IvxXnX+73sWoXhD/BdzxZ/Ix17aPUFumrbx9A5hzSep0GJ
	3bww+C90xXPOWlPZIbNv+NVZcmEH5Bo4UWPDI7Mqtk38xe+NQb0HmMoC5ny2ls1TJZcHLQ9/xX1A2
	5nwqVH65w6gceBy2BujI41Q0I4tyNBqUNPKdc1vpR33TBewTVDt9IPzlYKV6PUAwq0Hm8+Ixnq9Vt
	01wBB71szVwSEUJeLY3XYeZgNu04CJXDieLoiWJcebawLDs0/ia7iY9S4VqhIJOlbn8Z4GWAgQHgZ
	aXIsO0WvgknP6T78UOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LG-00000001w2a-43cM;
	Tue, 07 Oct 2025 11:58:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LD-00000001w07-2seV
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5818de29d15so7639510e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838329; x=1760443129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz5jQRJFoVK4+PdvzI4TMgPHFnuOpO8O5iQSmwwrcRs=;
        b=mIneBk3BG0K7/FzKAL8h4Sn3BDPktuNU5kuUrhQGwSy3uxVhLQK2fVtFRZr3WuWJRD
         RZQSEfhLtMNMbqeIwgcU0l/YVvM8UnJGtzEA8UkGN6SjY0Y8vUujGwOiMgIAy7cnVA6R
         aZ0nqXoTA5Nr4HZWa+j9BwQrJspxKc+HutIqoG58wC0iJg025/HO3NsPa43Z/Z72rMYn
         RDq73vSjKPtTSkgArWVUDBTgU1i24PzgvWucq0MAU7/B+rr2BdSvIE2hSSahce/2Cz3P
         ikB9OXG8JJQh+SjGNVlO0rLVzWwfzqIvkN8WOOIbbu6LOKFYul9z25RzMZsNWIpkyMxX
         7i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838329; x=1760443129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bz5jQRJFoVK4+PdvzI4TMgPHFnuOpO8O5iQSmwwrcRs=;
        b=ga9GO1GSDzl/cLXAGJMXIfPnvl1IccB1a5PgbJ/G771HHekWuyt3RDEULLqSCq+IUN
         UZsRYpuUpbLC9vBIi86mrrKOTSoEFqaXNuVGPyPiCFsQeicvqdhWaeMTksHjE7RUlZc3
         xLHadMe0B9U+NcfxwaPe4gbgDDyycQFSQJ296owOScssytorLp/keFxLeuaGfNmT4UFl
         M6W1FffcZHRg5MnW/kvEsVygu9S1EYDftYIC0Jp3wZ9a8CjUeAHl51JKo/5qqPhWE941
         NFYuGcsjsqB5n+gB3ZPe1KMyBRnM08m7tFPo1z4Jzng+4j8CETWQt6obTX8vwkEFDpi8
         /T2A==
X-Gm-Message-State: AOJu0YyjaCim1YtMJUzsbnjJEpoeUtwl5OFLNOB3j36zp3tDJhaqk2eo
	dwPg4SABTEQnF4DG/S+thpE0f6Wz8Qq/lcNbP4PR9CCBe3TMPLwHSamihjTOHFib
X-Gm-Gg: ASbGnctEqxxpTRFnFVYJ2HNBnbbk0sJRpXuVQ3HAILlKlba8av5AMTBfuzR5gAgfL0j
	66ckjBLAJL0e17dvHWc3+ZT8zDfXzTtwvkWXwSjkkstAeEhzcWuKDu1FknHtKOPcEFXiRPuF6bF
	hE/wHZ0QL/2xtGLBc838PZcxH6BniUB3dRDthKe06OgIxtTkuaFhcC3U3u3sLmqz9Dt3C0Dur/Y
	6oTdWpPd36cKh4E7vJQad11VQmvce/TucCzPzu3tQAjsAzCKHHNiMHCxEyh14qPbITXY6fLWNoE
	yav/1rYRqaSLqFiVSOWYnKqt/0uTi3r6PYYE4Vfhq8FAtlGwS9ytrk8yycOeAgfTFRko46XfMUW
	oS40cdSsehZwAG1VFjn70IIy43FWzs+DRYoapRg==
X-Google-Smtp-Source: AGHT+IHybbaDTUuq3OR2dTh3PRjAv16cf+ofk/HgCXjX/Glsz8ylZkJGopHKGG11y1fc7qEDafksGA==
X-Received: by 2002:ac2:5bcc:0:b0:590:6119:6b73 with SMTP id 2adb3069b0e04-59061196f21mr616166e87.48.1759838328903;
        Tue, 07 Oct 2025 04:58:48 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:48 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 3/6] selftests: riscv: set invalid vtype using ptrace
Date: Tue,  7 Oct 2025 14:58:19 +0300
Message-ID: <20251007115840.2320557-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045851_767085_770F0E79 
X-CRM114-Status: GOOD (  14.85  )
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

Add a test case that attempts to set invalid vtype value using ptrace
and verifies that the 'vill' bit is set as required by the RISC-V
Vector specification v1.0, Section 3.4.1.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../testing/selftests/riscv/vector/v_ptrace.c | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 6a8d56a5c4f4..ccda8a4dc49b 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -84,4 +84,116 @@ TEST(ptrace_rvv_not_enabled)
 	}
 }
 
+TEST(ptrace_rvv_invalid_vtype)
+{
+	static volatile unsigned long vtype;
+	unsigned long vlenb;
+	unsigned long reg;
+	pid_t pid;
+
+	if (!is_vector_supported())
+		SKIP(return, "Vector not supported");
+
+	asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
+
+	if (vlenb > 16)
+		SKIP(return, "This test does not support VLEN > 128");
+
+	chld_lock = 1;
+
+	pid = fork();
+
+	ASSERT_LE(0, pid)
+		TH_LOG("fork: %m");
+
+	if (pid == 0) {
+		while (chld_lock == 1)
+			asm volatile("" : : "g"(chld_lock) : "memory");
+
+		asm(".option arch, +v\n");
+		asm(".option arch, +c\n");
+		asm volatile("vsetvli x0, x0, e8, m8, tu, mu\n");
+
+		while (1) {
+			asm volatile ("c.ebreak");
+			asm volatile("csrr %[vtype], vtype" : [vtype] "=r"(vtype) : :);
+			asm volatile ("c.ebreak");
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
+		/* set invalid vtype 0x1d = (5 | 3 << 3):
+		 * - LMUL: 1/8
+		 * - SEW:  64
+		 *   - invalid configuration for VLENB <= 128
+		 */
+		regset_data->vtype = 0x1d;
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
+		/* read tracee vtype using ptrace GETREGSET */
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* read tracee vtype ptrace PEEKDATA */
+
+		errno = 0;
+		reg = ptrace(PTRACE_PEEKDATA, pid, &vtype, NULL);
+		ASSERT_FALSE((errno != 0) && (reg == -1));
+
+		/* verify that V state is illegal */
+
+		EXPECT_EQ(reg, regset_data->vtype);
+		EXPECT_EQ(1UL, (regset_data->vtype >> (__riscv_xlen - 1)));
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
