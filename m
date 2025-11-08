Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB954CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j393dtTkE0CKQ+nK2W0zEkCsQJn4snCML28rEPCkwiQ=; b=dnnf6rj8GbFdVS
	zvR9stSAVI0QYwhUDnH/278h5/ah9LYUnFX4PV/q87Yuwis6JNU2HxeyC1k/A+2ow4UVFWjec6yPv
	TEo8HtOFdmhG787/S78OBZDoycxNgYTio7yUnLxD7XRWEB7p6CdNMk/Ywy+j3yxsTYDD/ZaKs/xdw
	pZX3gOyyRQXYqiVqXKga5q122eTEbd4jjeG6LRkzPFUFxs04i7M7/18iAD8KmLPI7nc02FyeXFFZA
	BNADsLBLJD1zv6JlaQx37O0xQ4uKbdSqBJQk4es9pZDZSuB53ZFgdhoIXSOsQrisYnf2l2o5PB2nj
	S05zag+P7EnKLUw/Sw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopS-00000003OsM-34Qn;
	Sat, 08 Nov 2025 19:42:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopQ-00000003OrR-3pI6
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3717780ea70so17845351fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630946; x=1763235746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z9oJMGhMkRuSJL42xb+stRjYj/XQC2rSAWX+erznoA=;
        b=iAag3YRMoACVAYV3BzM7g4Wpacy6D6lUKLW6k/X3Wp2n8aF+jsWCUdEoEUw8kL6dgO
         drwjZ3iNvUAGqJU66eLv5ydeAjF0uY2RcqlnPRuklyfsYW68e8MmLp+Gzsd4+o/fPRNU
         vIjUSbegneCdSTx6dCtGaFjCP+ATnbkLTawd71yH5vYXGUXvUO3YOHNLdhe/FeZyYrNZ
         DSgl8r6OKUvZx/n7rmNLbTpmwK2WxoIXjd10Byx45JtwYNx/m/+OsvK5em/03AyzmsJ/
         05p1yQmEurrt43C0Pk22YIfnxPre0wRJhTF7AK8q1tYNVe5lgA8sBUpbJcvoOwWqV3ie
         nGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630946; x=1763235746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1z9oJMGhMkRuSJL42xb+stRjYj/XQC2rSAWX+erznoA=;
        b=bundp48SLyqib/+XIvRSCOyd2jDvDH4NxBJB1b21/+DGKX5j2G9obXxU1aQJ0Wh/+i
         gM/mMKU0LlqJNsloY+tGAMR/w25IGbqfaQcL5cJmuZLjMUpSyo5SDuA0R486ZtVf8Dq7
         gtqRPZ5oYlOMCFilLIvG3ODMKRGWc3JamsecPM7qP5mb/YYXZDVM7NC/jejwY23CnBft
         1Jp/Ft0FNq/DkZ0SO+kDKRnd24LP5rn837JoqeixcQRfIG0AaJ4jE4qqsDH1GUAh2NlP
         dv+DweX8rCHp0FbwSNYYDE1g3NUsz1bChH/iznKx1mqfmwdL0Im2seblJhfy6dinIQgO
         q94Q==
X-Gm-Message-State: AOJu0Ywhyctl9QE0Sx27nkN6cqeXWvW82M2pG0d9jVzmddCTkLg5/nvf
	oWZ/mytwyTSr+wTVcCV+Xi9T8Kw5w4HZC0PJ2MTbWnwgaN0GiPVTtx6RaYVv0AS9AYo=
X-Gm-Gg: ASbGncumEEMw5xVb94UZQmAbaAed0pTX+AySVMo4LwE6chEs23XtTKSK/k1Z76fSVDS
	MgrdREZVBxtGo9Lf89LLToDtMP/zueTXgew6UqLSGkzYjMaOmDI/4ZDEA4CjFYAErZJxG/mznWn
	h1RASWREjko+9FzZGVOLZDYAq6oeU4kMO5MBI+EBowIbkFWELI8Co/AixF0KTGv0YWoDtD7560R
	qxp1cEDOkKMggboxacjVq4PVpVfnHRGkAMbaiA5Q7eOJtb10pjIAXdL0vJKMb2TIvSm+S83Puin
	0mMvHT9RYvyGp4T7nj/krLqmFLTHDXhx3TRwKHQs4pWbRumlt4kqDCsPPrNxSClxzRM3AndVx+B
	jVp36QdFrjTET4QB7YrGdFCIY65S37nEtQFoNVwOStT2PpboS1Z/4jMR3gyU1DFvvKSy7G+ODNz
	fblw==
X-Google-Smtp-Source: AGHT+IFqruWPxQcVE5BSlkkAYUO3qtnystNc9jQjX4jqelXJHwKhoZh5DbK28uyPKpvnw5kWkw7ZbQ==
X-Received: by 2002:a2e:8653:0:b0:37a:36be:7282 with SMTP id 38308e7fff4ca-37a7b23fac5mr7888391fa.41.1762630946307;
        Sat, 08 Nov 2025 11:42:26 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:24 -0800 (PST)
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
Subject: [PATCH v4 3/9] selftests: riscv: verify initial vector state with ptrace
Date: Sat,  8 Nov 2025 22:41:42 +0300
Message-ID: <20251108194207.1257866-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114228_982059_D9C2E322 
X-CRM114-Status: GOOD (  11.75  )
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
