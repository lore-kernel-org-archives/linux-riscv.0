Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901F8CCD185
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00qeJJUrzGwHWzHODFlFe4Bu9aJ7WUWnCjq8TYqoHQ4=; b=Iedh+XCdeUkHdk
	Xbq0Ri+PwL7+LN2YQEBkNjU1gu/QsFMzLFz6onH+VEX5yC3j39Pd23DJvKfRcEN9wL5i/iZrzB/pR
	mglWLO5Di/mTAu3M1pRjs94Zw7/VauKX2fFMk+GKHdwu98dn4SeKeO5xamci8Dd8ZzOOOSU3kKEIy
	ZzNyWDpoMBEFx8/2z3l8eRDTxMk+TkJ7IjZG+ArLBUaQKXpIv0KXUrWknQq0Q3qdvfCPRZf4PqYXI
	mDlKp1NFHaByBFQlAvCqojAMu3lOCTlcilvDv6OAvE1Y1JEH2+0no4unUxQj7fVZ+qTWYm2HwUZn3
	JjZ4poKompopbmbVsBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LJ-00000001w5B-2RP0;
	Tue, 07 Oct 2025 11:58:57 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LH-00000001w1e-01lx
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:56 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso6726684e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838333; x=1760443133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHT1PRp2JY0IGazIqjL1tLWH/amjUJ0aFr/0p5QGBFQ=;
        b=iMxlt2Uk/E6O0I+IBNUJROpvSCJ6rD5vxJ5zOvJRjDEq/aFAZWVaj6e/I+GeUVyF5k
         R5SADQR/7dZEq4JnmmBUO0/anc2uY31aC0glnYHnz4E6oQox2UBUdOtdPhU326r7faTa
         UvjEkLu/jeNG0V093mxAl/A9u71+pet1C4ILY+YEeexfjaaogVaD29kYKfFia3QLhGkb
         aIafd0k5HFNLtELdfk7r9OWuvQVan1klJRMc1H3tnltJfng56Pzc38RV8m9KFCK8It/F
         g1LYzNPsh1ILmdRv+1lKTfU8s3LeYMzlxEkiH9L48oL2OtvhMT0ili0TP4NMaCkmOtC9
         znVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838333; x=1760443133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHT1PRp2JY0IGazIqjL1tLWH/amjUJ0aFr/0p5QGBFQ=;
        b=c/baa1TpVyKRiVJEnNs4z2WklFGh1aqdS1BeQDxMgFjs/3XSwVSqbfuJTm4FdZ4Uq5
         nr/VQPoFrG9hwbi+L7exRX8pdgqRZSk/UR4sMk8ZLhyW/IalXxYtVv9cJW8CDR/ah0d3
         qNlZ1SMVkjY4eme3vWLdqRzwwO1XSKSi9jStoEHDaBMNEPk/dVbH+yMHNxiDXDpq7cH4
         7i9uSg0tm8HMZLRHQTqDAJ1xNQztfB5BNWD2UACeRdAb46iQSqMQfP1EyV/KCgbAs/NS
         UaavdWYjmR2XfdZaLK702ddozuDIVOPferbT/tEinuBwJUa9FY76nsbgylJ+yWY6yssH
         AFOQ==
X-Gm-Message-State: AOJu0Yxy9hCvWgtqD2Kh2E1DG7Z34oZpIrkgMPNyhnQUGPmd9yQK0nMm
	qiKIbLOJ4HrcTxbmmUP+okNs9sQXU9TG8yIkw391lckOSOIC3/OMVaGcL4jr0b9n
X-Gm-Gg: ASbGncueWpZasZSf0sUkF0Qe9/YzYrNVKTvQLKJtSOtchC50CbEGQkGpk2IZKPQY7tt
	a2Ww7Iaffwpy1H0r5dJ1TXpUcK99k7htsUF9vCPIuvMosCEOOs0Cw18Qf40NAGxBF/ZG568IonH
	RA2hALjT7lWcLz6eEI8YpTZyfl6c2ZSJMtbV3jvzyUdm8N72tscxWiCqM2QLFFs10yROofP9Gkd
	nOcZWO4gwDpX87Ix+Z+OSfWrLovX8ciejlZ/sFieKE7p+GyPsSzYPmFHuF+76oKSv94xhrbAaDw
	2jI2IdRe++pDOSkce8JRnK+T2ug8jmt9LzyGiUlrN3jXf0FhcimlrnWEz5zSx/EJgxTk3rE/c7L
	Z+uoaSOwTt8lpVozmrH8rxWeSSAn9jIo7sdV6ZB0hLglWZU7T
X-Google-Smtp-Source: AGHT+IEzN3zS6xGqVRO8VCU7zICi7Cd8TK0JwH77VbJyPE7udYDtblpgFcyovJkjgfD5sCBUy3Ty/w==
X-Received: by 2002:ac2:4e0e:0:b0:570:daa5:de18 with SMTP id 2adb3069b0e04-58cbbbeee5dmr5043998e87.33.1759838332383;
        Tue, 07 Oct 2025 04:58:52 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:51 -0700 (PDT)
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
Subject: [PATCH v2 5/6] selftests: riscv: verify initial vector state with ptrace
Date: Tue,  7 Oct 2025 14:58:21 +0300
Message-ID: <20251007115840.2320557-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045855_082522_788B2CF5 
X-CRM114-Status: GOOD (  12.21  )
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
first vector instructions to verify the initial vector context state.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../testing/selftests/riscv/vector/v_ptrace.c | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index ccda8a4dc49b..f452e04629ea 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -196,4 +196,107 @@ TEST(ptrace_rvv_invalid_vtype)
 	}
 }
 
+TEST(ptrace_rvv_early_access)
+{
+	static volatile unsigned long vstart;
+	static volatile unsigned long vtype;
+	static volatile unsigned long vlenb;
+	static volatile unsigned long vcsr;
+	static volatile unsigned long vl;
+	pid_t pid;
+
+	if (!is_vector_supported())
+		SKIP(return, "Vector not supported");
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
+		asm volatile("csrr %[vstart], vstart" : [vstart] "=r"(vstart));
+		asm volatile("csrr %[vl], vl" : [vl] "=r"(vl));
+		asm volatile("csrr %[vtype], vtype" : [vtype] "=r"(vtype));
+		asm volatile("csrr %[vcsr], vcsr" : [vcsr] "=r"(vcsr));
+		asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
+
+		asm volatile ("ebreak" : : : );
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		unsigned long vstart_csr;
+		unsigned long vl_csr;
+		unsigned long vtype_csr;
+		unsigned long vcsr_csr;
+		unsigned long vlenb_csr;
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
