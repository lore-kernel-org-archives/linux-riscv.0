Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A770CCF9E9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j393dtTkE0CKQ+nK2W0zEkCsQJn4snCML28rEPCkwiQ=; b=hPy7aKjjqh353B
	9+8X4BcLLxYOy1U5sWp+Rp5IprRKMF8C49C27TH00R4jM/p3RXtGKKtB2jwmHxNiUfZ9iCqwnQ/Jp
	EbWcq9Uruog329KR+WtrKdmM9XTqRsyQUZKn7yIIzP2UyBNTb8oPqCbL87hrERlHEz+dXYJAtKxP5
	62vpvXMz32C+Ffu1wQqxsoRMB6ReJeH0PpxGmgOvTGksPmXa32FPExmiXs9BJ9CGwkEKOehC+sWjI
	kL0e7DWI+2zxKdEfBcbBAw8TK6PPYeRo76sPXjahZzKhVZh10g/REkcq8dbyCDJs32CU6HYgd8HAb
	x3dHfTSP+jMxUHkp7VsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTp-0000000Bl83-3Cqf;
	Sat, 25 Oct 2025 21:07:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTo-0000000Bl7T-1B7X
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-592f3630b69so3961559e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426434; x=1762031234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z9oJMGhMkRuSJL42xb+stRjYj/XQC2rSAWX+erznoA=;
        b=MeB/sxf2vu0tWBiI5dMldZDsM5ZDI8L2FsOSBXFzzFrOXjxf/u08GC6KQ++htH0MbK
         7R/fAtnJnuN7sp6AelnNhSX2H42xoAj2tAajh7RJJgGH9StjwAuEd8JGrjqidocS5zWQ
         ECYHJdBfTwXnkurvAQzdKtoDLWrNBnaK+zxCHSZD7HlY+3VYCP7u+4C8IjsKXyHSmHS6
         Qq5bAqf8bAM9HAWFoW8wlA0fxIuz/Qngv/6S/BnMjiLBEVtSbURTYzDze8mqpraeXCvR
         xYX6GIPSRN64gblsyaWYCufdx9Fexe50F/HjhBfPN5Oy6EaPiP4n4wEtYKvP3FNaU2bF
         bb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426434; x=1762031234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z9oJMGhMkRuSJL42xb+stRjYj/XQC2rSAWX+erznoA=;
        b=dkcpfA/sk+cezuuRBKIKgqRKaBkW/883oO3Vy/Pgti1IsGxIadxnrRX4LeGx8db0kM
         zfcZyn8ndDmR0bo56lVNiP1GDxE4UHsmTtPNWboQCTgQeKEZTNcqKpPmXP6D+Qltyj5w
         IYUpBzuSa1PxK7SyLMoIP9/2i6hCzEjZpaO15JB2A2NrTR/G5KWQo7IYPycOb3gsEgOC
         4/tfxymRTQxNc4b1pRvicg8KAF10IzhXCZ8SqbUrQUCyz2+o4c+ipZHg+qca7nB9/iSn
         Jt/LsiFD0ip8oOuquO0Lt1SMPpyqNuH7dtdsZtd8F4liA2WpfbROyQtxNAZKEWwf2PBa
         0JVg==
X-Gm-Message-State: AOJu0YwMcnHIqLEa70nkuSIepQD3We9ePqj5VBhFLE+eIO9hBOpDVULj
	kL0+Y9uLgE6BK50P3nh2kSuSw6nHcFHHVcBh8tB7cFRLnmXiVJ+WL/J1d81UKqxYvL8=
X-Gm-Gg: ASbGncuIEM4tgMOPQvLHVPVQcFn55v/KwnGb6frKeg66x5pyjIw+odrZy7Pe02sgRbM
	jHfQvJMi/oJFA9wpmSiNEummoxdIPYsej4xy605x/plMAZ+mLAx+dj5kCthP6J6PmeG8pEE21DK
	VfeyXMXmZIpSEpPOwUiPMEW9Bj9q6XMk6+gDj2IqCyC7pxzwpBMqc2eJpvSJhZfKsrdRQ4v1u9l
	8rWtFf0M208RRSeUPGumIQLIhOKKTAr+X0Q3HnpfIo7zO8hbIA2fQSVx787P0Uh2r33vrl2MG5j
	t2sCfi4psd2xelmWVwffKpxOMyseV0H/bAmvzvnO0UQk3FIxqxPJxqWuKTmDa2x4D3lcBfIUpyC
	thYMsnnk5W7Uh+NQGvwFpOy0D/RebyEx1X1QY68XXNnufcG5QlrnGHMf7OzgN880HFmk=
X-Google-Smtp-Source: AGHT+IFUdDmSd26EpJsO+EiP5G0k+Ebq3VVdqt8KbLEbTXtWf6GeHir1tww1xGP4PmC4wQzC5b6wjw==
X-Received: by 2002:a05:6512:32c5:b0:57e:ad46:b0a0 with SMTP id 2adb3069b0e04-591d84cf5ecmr11675494e87.6.1761426433528;
        Sat, 25 Oct 2025 14:07:13 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:12 -0700 (PDT)
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
Subject: [PATCH v3 3/9] selftests: riscv: verify initial vector state with ptrace
Date: Sun, 26 Oct 2025 00:06:36 +0300
Message-ID: <20251025210655.43099-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140716_350727_B8EAA421 
X-CRM114-Status: GOOD (  11.52  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 6a4b5a2ab4a2..9fea29f7b686 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -82,4 +82,105 @@ TEST(ptrace_v_not_enabled)
 	}
 }
 
+TEST(ptrace_v_early_debug)
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
+	pid = fork();
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
