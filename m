Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C10CCF9E9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUF9ZdNczvjhZ9PM5a7Pr96MQON0Q18TXT5j9CLDX1s=; b=S878Ukxgpgs0B1
	y/R+YJdQ5hNuuqKfIDlzTaFlTA5wfz/qYbXR1W21vcOO2OAC5enlitUlEh6YNRQMe6p/FYuAV37oX
	VmQEgr/jgdNeqE8Ot1NGtzR8k7d3LRRY1baVc9fWne4sqdpZj2Mn4as4gp08uNQdzIFU46+JM0yDx
	iYWTfeg0cU8MXsu5qO2GJf90pvs4ytbMrrFsPil+sJKh20eAUnXTSpalq82MifnWG8/pe4JnhaHVU
	5Uveeuc6BqARdwpXs9nxk4/I+V7scrznK7IRNyE99USdG2jzedHgziAyki5igE3flDhWNk/Wmr/al
	2WeDw7d+nd7g30fPOgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU6-0000000BlJb-2R6m;
	Sat, 25 Oct 2025 21:07:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClU4-0000000BlHA-2euE
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-592fb80c2faso3121101e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426450; x=1762031250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFxB+FMNooBfOd2zLjcq46e2Dj/CD31Cyo7lUKy84vI=;
        b=QUSKp+Zq+A392e6QxZphSC2I7ZcaRG5UXI6dkWAykKBXNsyZDWGJZGVayR9ErkfLam
         lpQRPMIs3NiUmTTcWhYPAQDx8h2lagIquyGB6Grzv2i/4xIuY7cEQYX6x8PsrlkgWEDO
         nsrS+u8PcLibZmXWtA5KhwtHrJ29hTAqU1HDnLGU5F0POdw0KOq6Ftobke3V24QbYYtF
         Ke8dSsqRedbpnse1bzoJttEDJe6iblgCcQ6kRBC96KRZdMy/Rl+o28DId0Dwgi/aKF21
         KpNNxlG570OgVUpSIUBfqj9NkVmvxJQyNHCOCIZ8blLBJ3TFPPrezdrn5HQOB2lo1HDA
         Zncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426450; x=1762031250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFxB+FMNooBfOd2zLjcq46e2Dj/CD31Cyo7lUKy84vI=;
        b=r2IoDWMQCrdJ1ttl8P0Q6nTY4p64np5kgHNaq/RGirHEWNQ4Vmhyk8/w30r231UFTi
         qYAWB40RyPu0OPdVUqZa1Vk8N/ScdIFp/fKwL7Qy9ez0RxLZUeWeWvlvuaskDrT3aoz/
         vhoVVKh3VzunO7VZxKJS6piIqYszdev+WVLgc4fzVU5mewdlkFxii29aN46cSStsn3ou
         damrSvAmASouzjWPmbBaSx6Z5FwZIEaJ7tz/qFfkgSRv0YR9AxTAn5OOAOJ8R7HX7ULE
         ggSlhqBjQlCQK4NwG7ssrRwHf/FMtFjx6jzXwgODV0t2xFyYYc1mQEs7aUz5POtABUML
         el6A==
X-Gm-Message-State: AOJu0YxPEfKg8qwsnfzPODGcUK2891tFuq7QcVCLyUHIXqOIjTyn1uKc
	eRXXhtbiDW9J5VHISkdKdV2wXPCFLYOofZPiSH++1UiaRSeRBMF0sRQfp5HA3gsXCs0=
X-Gm-Gg: ASbGnctTX4VanferWfhegP5Qj+U46Hv5pDhzBGhq2mPP03DVbFs4VauHInPJpr6CRHE
	nTbOKRegGRCvmvDrZ2AOAv5QzVbARyRSkpfmVA9WvyIHQ0VQKZ3hyxp3u4ziEhiyUNMlS5a4s1q
	gfamk8HnKZ3YmL8nqHX9BFmdx0yBVAjAdr2yPwdhwWZkWFkNquPXVUSLJixkd6onHZsw743AK+k
	fw7swNkSDi74fxbxDtilwk0U5e+k61elBPBtLTEDZmCw9WqQu494y801tTUIx/S47zdrcmgSl+o
	p5N7SDL0COvPb5mAX5NfYJWM61VKkN/OX3FDbktmH9CGApbSWSL537kHO2tthaF2ny6dhenxe1/
	XTuFBaNmQGaExi9AangI1rOB/iq/WUTakOvyBbyLpbXq+Yk9nrnsTz+TTaryvMXj52/YpUR2biV
	eyIw==
X-Google-Smtp-Source: AGHT+IGWWrc4WdF7FX7lRQrDMuhwqAOXh5C+jquwBNySEwQCE3G1DQMT0DRSQnyd9anBGi35RkN5AQ==
X-Received: by 2002:a05:6512:308d:b0:571:8fad:ecee with SMTP id 2adb3069b0e04-591d850c0efmr10901687e87.21.1761426449935;
        Sat, 25 Oct 2025 14:07:29 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:29 -0700 (PDT)
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
Subject: [PATCH v3 9/9] selftests: riscv: verify syscalls discard vector context
Date: Sun, 26 Oct 2025 00:06:42 +0300
Message-ID: <20251025210655.43099-10-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140732_690895_63C5D169 
X-CRM114-Status: GOOD (  11.95  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index 7e8fdebded07..51a7cc71b2be 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -183,6 +183,108 @@ TEST(ptrace_v_early_debug)
 	}
 }
 
+TEST(ptrace_v_syscall_clobbering)
+{
+	unsigned long vlenb;
+	pid_t pid;
+
+	if (!is_vector_supported())
+		SKIP(return, "Vector not supported");
+
+	asm volatile("csrr %[vlenb], vlenb" : [vlenb] "=r"(vlenb));
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
+			sleep(0);
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
+		EXPECT_EQ(3UL, regset_data->vtype);
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(16UL, regset_data->vlenb);
+		EXPECT_EQ(0UL, regset_data->vcsr);
+		EXPECT_EQ(0UL, regset_data->vl);
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
 FIXTURE(v_csr_invalid)
 {
 };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
