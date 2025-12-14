Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7BAD5B171
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KA3Yg4bd4Fa3vGRDejJKXYZ6uxWaUkeWF8QScl7jTvk=; b=Tso/32AvMYITkW
	XA/2X13hnYvvVJC5s/ArFcpQ8XVMD4Z7VxGip3iV3JCreK0aSuLpqfS3a7m/6rVdIuywGMx+wWhnZ
	dCMSC+hDVh8JB8yl1H3/E+vAtAwcIMRiNEDQJ99SovzyxlGIDarK/ozXAbOEWve/IwzgvckALGmvd
	zQdG5HCWc1yKcZqi1xBvHxKcUKwr+dGj6zlZpMHuDfXt5mXkiF8CWq1a2q/mDV9jY2KB5lIdU/wMw
	PxaXnUCU3b2Sn7iOZyeF/QYKdeUQB5SbnYzYJjM2UQm/1fJRYFsihmjtRAGCk+BzFHL0kxaFlWxdH
	tL4rJiL59f2k+q8MF5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4n-00000002aJG-3IL7;
	Sun, 14 Dec 2025 16:36:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4j-00000002aFc-0Vhe
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:36:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5945510fd7aso2349238e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730159; x=1766334959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLvTGAt1jf9FADXLFeMcoHBdGn1FeJvj5K58j/U4zDM=;
        b=gb6rXPurkvijIzAwbjyiEy4HWpx4+9GbSaYGlAK2FmjolNm+XfYt9U3q5K3qyJkaHH
         tDnd3WL/WzBtzhGemowhEoHLdLPQbEaAYhLEVsUPGsBIwwLlz9QZbxzDPABLcqQ5r3J+
         mlrgdDd0o6EAoahWW5GHZMmmezd3XQqoX5zH4ydD7XFQxma0kxrTGNGOZ9CHdnFjV71Y
         9FkQZfgkiJ1/NCFT7BVbJOKSemoRH2wUOynS5Bz70wFNsmRG3gYPKneD3gtjDeydLkfQ
         XvR0MATeWSue9g0+6WhdbAlouJe29THoni/yRc+/gziiRh9ODtccvUqOEo5EckNMAyEu
         eTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730159; x=1766334959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLvTGAt1jf9FADXLFeMcoHBdGn1FeJvj5K58j/U4zDM=;
        b=lQY56dKa8TBQht5DAd6GUzXVBJ9s7c9BY/45w1C7UFrN+ow5Mv7iDFIhFDVItkNqwR
         8GuwMJ6no5PvY8ngmCm6iRi50lnYS4sSxtXPAm7/sGctGsE/UEEp/3PfKl7JlVatoZ10
         dlMZfGvtEbfhJY951rhJvS2oWYlscfNAEKDwhEYe+SAoGsUZsjNWMtxeThkoxVXDxqW0
         iFw5gLjwgUTWDSmHAduVrUEvZH/+DhTBGaKORzK7PP7i/JdSiPeo8FU8iojVpkXyP1NU
         3WxLfiJeNaxVezTUXdNTXUYfBmwCePsEOGivqR119WvT3m31gX8raXm/pCUcNjc7Xg2X
         XoNA==
X-Gm-Message-State: AOJu0Yzpk/atmvOsysoomAMw5smxKTZz+pELQlvMJHZcMxW+HC94u0G0
	WbCm0mXjlboyu9iL/xkLg4XxLL99n35TCLwlRrlBrql5QLkZiEI1amLB4tQg/dhi
X-Gm-Gg: AY/fxX7o+0s4sYYHgDjln82tvp9BdTnWwIIykwoOWf1w9MaoWBkt8yK4EQJtzmBcR+g
	OR9iN/Dj3zIJcj3czSc0VVGWEr4gY0QvcsuXupIohZh/W7OdKvYBskzva2wF0MnsYUcB0p4b99c
	qGPocTjL98qZkIJNcyusbLuK9wB5StZ1WXvqrO+8wmsawqCZxWOLlRz6cVCnpJVdXVNRMMKBIOP
	+3ZC+CrMmmhE3D29rtPb8GUFJLJEj/D21i9j/n1rCLznvkWTRFk8tgUIGxm7P5yAnHTmvRfH0v4
	oBsNXx8sRiEKhd5Gw93OUvJgzLmPtCLlTiYmQUatcTWtCPo+ZNtdJ/wHu/ptfJMWvtmx/4zjslM
	YOVWjIeorMY99smfX/Xq352rDbEf39NyGxdCyhRzlq3qlmLp9CUObH3anNaV8Q9r/tkgWEqp0ce
	r7Dw==
X-Google-Smtp-Source: AGHT+IEMgxSe+xOjvGBPNy2ALsapXgkNGgurTBHru15sXVWXKkYyH3kcS5UntnGJK/O/jOAOqloXjQ==
X-Received: by 2002:a05:6512:1329:b0:594:522d:68f4 with SMTP id 2adb3069b0e04-598faa80f60mr2571650e87.28.1765730158483;
        Sun, 14 Dec 2025 08:35:58 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:57 -0800 (PST)
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
Subject: [PATCH v5 7/9] selftests: riscv: verify syscalls discard vector context
Date: Sun, 14 Dec 2025 19:35:11 +0300
Message-ID: <20251214163537.1054292-8-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083601_336322_AF720460 
X-CRM114-Status: GOOD (  12.30  )
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

Add a test to v_ptrace test suite to verify that vector csr registers
are clobbered on syscalls.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../riscv/vector/validate_v_ptrace.c          | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index a8d64d351edd..2dd0c727e520 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -212,4 +212,128 @@ TEST(ptrace_v_early_debug)
 	}
 }
 
+TEST(ptrace_v_syscall_clobbering)
+{
+	pid_t pid;
+
+	if (!is_vector_supported() && !is_xtheadvector_supported())
+		SKIP(return, "Vector not supported");
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
+				".option pop\n");
+
+			sleep(0);
+		}
+	} else {
+		struct __riscv_v_regset_state *regset_data;
+		unsigned long vlenb = get_vr_len();
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
+		/* read tracee vtype using ptrace GETREGSET */
+
+		iov.iov_base = regset_data;
+		iov.iov_len = regset_size;
+
+		ASSERT_EQ(0, ptrace(PTRACE_GETREGSET, pid, NT_RISCV_VECTOR, &iov));
+
+		/* verify that V state is illegal after syscall */
+
+		EXPECT_EQ((1UL << (__riscv_xlen - 1)), regset_data->vtype);
+		EXPECT_EQ(vlenb, regset_data->vlenb);
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(0UL, regset_data->vcsr);
+		EXPECT_EQ(0UL, regset_data->vl);
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
