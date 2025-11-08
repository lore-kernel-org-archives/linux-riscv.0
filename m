Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5369CCCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YOtDxIVY5A1QH0wnxdWR3k+g6V/jmU25F/Jt0DRueU=; b=dIXOoCDOFg44k+
	pKb3FX3yZDgjkBMsZlVlvxhDXvWDUsBdDldH1SUCL9cr1VQOxmdpzoJ0Jrus2XsLjUqsv1KGgBsOk
	MhaEPfUOzNJQIGbXkNdwC9+nalCZ5nX3b8zOvS5Zt1RyAAzq6Bi4UlDpDeXhnc6GaF3lct77q1rTd
	p7ptS4i2sIfnaa36H1YrW1vBiTl0byiV0IppzHQ3N+PnSmQt89OfRIGE7DS/uW6gukagGFhx1BeAE
	vHGXNEVVs2XahEotXNDnVqliGTjsJDnQw/ZL+SqLTpo1rj4d9licPXTDXOHu/eJzvkp5xNeRODFBg
	325VdLk2hq8hPL0MtXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopr-00000003P8H-2VFo;
	Sat, 08 Nov 2025 19:42:55 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopo-00000003P4G-1Em7
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37a3340391cso17514431fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630970; x=1763235770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRJxeXvOiEogIO9xMq6Bi1gey4v1YC+eoeXUVhZk5pE=;
        b=LdmUa2ebC1hnLXN0D7yGkAPJx6yOiL35O0nlGvq59FbdoX1/vxo6wVrvcQ31wsEV7l
         j+WvrDJDCU12MuDCRWHs617oVxSMOLivcJ1QZCy65MHkdxCgybpK1ACA27/oD/fuPntx
         9vTtJ7vq049vE9VmuHqWlDXx3HjzzfseU9Sk8IxpzenihRzO2weiUEOreiYVzXfp/FGd
         hMu6j43XNkgigk1TKQ8aEW17dsKjOecaIdwuvABFUo7MLLznMPyUifRuhnd11a99XNv4
         Acy4uqXVw4eyeB39YiW52O+mZe6E26MmC+/bmMnVuq/xm7lXu1auTHPmxtizA6d4sI73
         BoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630970; x=1763235770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRJxeXvOiEogIO9xMq6Bi1gey4v1YC+eoeXUVhZk5pE=;
        b=YuvBRaOuQEcFgBdOR9pn0zbXmKGjFZYKBTX+BXLSO/JMYXQwpR+Svzoto9sbb/Fq/c
         BwyoI0U2u8ENDmMWhkAbQp4HVeeBESH1V0fR2DiwFkQYiXz3fHIarJb+uzto5Gv6xcEG
         KuKWK2aJsxkocAyqUYKdGZDhd9NWNgvgSakGzMywNmWwWf2Vfo07lCclVPzVbm1St6+q
         6zn2gCVgRFCiXL3JcmLLFrauUi5HXzt9fTMPGoEfvstwDy2MQZM2D5MpHlOYJJvFjq2J
         5IiywE3cgBnlTUq4k1TdZSf5e+CCkvvxHef9KuR6AGfQA92+P2JhlodYjyaOgLt3qZpz
         sC3Q==
X-Gm-Message-State: AOJu0Yxuvk9wXeBJ1dtgBdYuHvpIKHlES1yQvoDI0oXOqSD+x6TT34ON
	+dHei0aB4YpxVp0Jlu27awAd2ue/Gsj+5N3mRRwiYJmDhMPjqybvkdl24GtOMulzjmo=
X-Gm-Gg: ASbGncvxlvtTQkoi4zkbH+nPhcObGuXQ8OnCemOCRl0gWeSMk+jzHE022e1eGZpOb6r
	t/hqdOXDbI8/gyGbb/tMcJCIcx7F1u5F/hJt9FmXbz8NIKKqCa6RXF0Ey5i/nLBgRlEDqM+Wqky
	cnj0q5TF3YNJ6t0uJqoPlwK4W1yT+tt6qbSa9xInaPTAN+2Vvl3cSk43BgAV30GWR1XBkxDr1q0
	h4l26YsnEnxjtYU4VsVqo80sWOKjvmy5GDmITz/dZNFGBoboAKYw8MDjqaouNkQoHHOzSpPeItE
	REt1lt+HruSfHCXOsE3DUlQ9SLfCrjtra14PLonJ3egdxehhZCsykFJhU+kCGrZKHAODAjFKnQ2
	82p11FGIUUVGIMmcX2TDk6URuBpQmBz0IfT8u1mwJkKcFbh6bBSQVfz3h8cbpSlM3I18=
X-Google-Smtp-Source: AGHT+IHlXDkvQRgzPuEt7DV3+vhlIfC3x/SoxFZdZvSyimgEP+WQTvBDKtkfBp3OnBFK8ucxkWoPdg==
X-Received: by 2002:a2e:86d0:0:b0:378:cdf0:ad51 with SMTP id 38308e7fff4ca-37a7b233aa5mr7561051fa.24.1762630969620;
        Sat, 08 Nov 2025 11:42:49 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:47 -0800 (PST)
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
Subject: [PATCH v4 9/9] selftests: riscv: verify syscalls discard vector context
Date: Sat,  8 Nov 2025 22:41:48 +0300
Message-ID: <20251108194207.1257866-10-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114252_970505_15DF2122 
X-CRM114-Status: GOOD (  12.19  )
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
 .../testing/selftests/riscv/vector/v_ptrace.c | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/v_ptrace.c b/tools/testing/selftests/riscv/vector/v_ptrace.c
index fb371a42de15..d4e947c33f75 100644
--- a/tools/testing/selftests/riscv/vector/v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/v_ptrace.c
@@ -183,6 +183,113 @@ TEST(ptrace_v_early_debug)
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
+		unsigned long vl;
+
+		while (chld_lock == 1)
+			asm volatile("" : : "g"(chld_lock) : "memory");
+
+		asm(".option arch, +zve32x\n");
+		asm(".option arch, +c\n");
+		asm volatile("vsetvli %[new_vl], x0, e16, m2, tu, mu\n"
+			     : [new_vl] "=r"(vl)
+			     :
+			     :);
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
+		/* verify initial vsetvli settings */
+
+		EXPECT_EQ(regset_data->vlenb, regset_data->vl);
+		EXPECT_EQ(9UL, regset_data->vtype);
+		EXPECT_EQ(vlenb, regset_data->vlenb);
+		EXPECT_EQ(0UL, regset_data->vstart);
+		EXPECT_EQ(0UL, regset_data->vcsr);
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
