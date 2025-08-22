Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13914CA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLCS/GZZBZ1rgLOIivYoJXnh8Mx8zv+VRGweNCF4nDo=; b=0MAVz/DqqzRswL
	LYn+W5bMj0jyW5LMY8f4M8sd1KGSQAUit1vTAXk9ZjA3s/pmlOIBrJHGZUHkc/0zA6wfbJFovML0u
	nvpx4cdKKwIAIlGLdZhdBpRDD5bwlXv1HhbLy0R4zi6NN4KAHM5oKsokir6eW314pUZgrZ554pNDG
	1QwQBAVblxGnhBsC+htYDs52oT90LIvKRk1nKTb0tAmCQvFLwgq/++XhmPXwOpru+wgvAoo3chDSA
	4yaQhkTQPzooDbRoFMpfNBqtGwL4I9Em4rjwQctF48c8iVVyE1q/C3TIs5IVAo52BDq4kms7XdHkd
	Qp58ElV5a4NQXSbnYCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfX-00000004UvZ-21dp;
	Sat, 23 Aug 2025 09:36:15 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrS-00000003GH8-40Kx
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:37 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b10993301fso24046961cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884854; x=1756489654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/NZ3invqjYii7VgIefIBIrdQlA4A/NoIleSlxqcTKI=;
        b=fGk2frhTXdl9VWRC3VjHA1XzrswAlKKIX4ESYIdwMJOMOH+pHk8BHjLnDcsKsAFTx5
         YlFCOCOqECaV2M5uiqPpr5IZiyTazzvmehg2x1Eq3utPmkBFNrtZMMm/Ek9Zk8YDhTvz
         JS44L0/qMyOkaD6x9kU7X8tow4pedb2kheUrq48h9pJ0UdqP7Goz9/iZYB5G4I27k9KH
         7weJFWXjznvdMWLYi3S29aTWViSgAB2m/XRXwaxc87OrGkf7K6ems5CQKd5Tjh11f/jl
         nddyRAqv6orlcujwmtFNpazcHPVKv77w+9EPXm+rK3XXN5fDZpk7CtlaA8JlNQ3x11/G
         gRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884854; x=1756489654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/NZ3invqjYii7VgIefIBIrdQlA4A/NoIleSlxqcTKI=;
        b=JU4SHxwDOdM0T0/TU8MdFSQjXF8xI76GCRw4FRu+Z0oU5Gxs2Py3M5Eek5exRNM4UK
         1HkXwu4iNLsKNB3eDZCjxGjkSdpDZ9R4LC+i8QJYOX5ePlATymumTNfoVO5IU79bB3q9
         8SVn59EGBHuW5/1qa2uQH3ooacAI/fth+uL7OJR5KwPGeToGIx1CL+q+h+HKFoVTycYd
         dZVpaF4WA+as+ZK2CcxGaDtV7Iz1iBaQKpylkCB6bZUZnCLpvLBBuLEFxss0Ow16Asqr
         L9YHssejUyRxqaJAD/agQtqTnFnQIlFbjTv217ByB0mr9w6JJNwy/V9b1slrosAfECZ0
         MpSg==
X-Gm-Message-State: AOJu0YwCgOPL9X5UXkH4e4OyGCrJa6DdD4/Ovm1cGMMNvvv1cO+lt/8I
	BSU8ZUH12FEb3C6zqTr0mkYULd3cNe1rl5/2rQvfqD8rnldJYFxevt7UZCR/W/w0U1wfYVtZfnV
	JOrIc
X-Gm-Gg: ASbGncspc9uQN0WqjI/6+2VDtLtMH30RyNdxcPwzfvCUCatG2hS3iBNBFomiuquF8L1
	gwAqHdzGIe64CR0Wy5vY+Yamxkq75g/Mrmt4QdU+ARSROUuGa2pZhYr6RvduoyzlC7I3wzyOXgs
	qgCxMyWu24KQXaUBJd5lEHeT2+mKaje/afUyHE+ICyxd900sgsZRvy0awSg2uZ+ZQQJnUthsmNR
	BcpZz2fFM6boZ1bWbsCysZWgYz+nAtaaszH8m6rePqVw0kODe06kcTxxmlFjZ/qJTX6WNnp/LY/
	XeIGIJgHDzJpVdCghJjXeM8aQT0vCUPeZZCdsY7YDki9R4Zmaa3DmKbvHVqhDngSANouBIp/z5x
	e0/BxU/diwCTg5vUB1m42G7Ptmn7Pk7NbzBv8FQ2BgyRloSp4k2x+dEYdZJAtzMfi2wdttJaokF
	1qfmjWfw==
X-Google-Smtp-Source: AGHT+IFZbeEwjqDea0hlGgRVd9Xscw2cIAz+36MfAAXzcnD0U+Bx3mxtHkRwJItm6g9vdsmkz7a3oQ==
X-Received: by 2002:a05:622a:50c:b0:4b2:8ac4:ef7c with SMTP id d75a77b69052e-4b2aab4abe8mr43670911cf.75.1755884853830;
        Fri, 22 Aug 2025 10:47:33 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:33 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 7/8] riscv: ptrace: Add hw breakpoint regset
Date: Fri, 22 Aug 2025 10:47:14 -0700
Message-ID: <20250822174715.1269138-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104734_994314_DD4BA02E 
X-CRM114-Status: GOOD (  17.54  )
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

Add ability to setup hw breakpoints using REGSET use the
__riscv_hwdebug_state structure to configure breakpoints.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
RFC -> V1:
 - New commit
V1 -> V2:
 - No change
---
 arch/riscv/kernel/ptrace.c     | 59 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h       |  2 ++
 tools/include/uapi/linux/elf.h |  1 +
 3 files changed, 62 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index e097e6a61910..fbd0097ec168 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -33,6 +33,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_SUPM
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	REGSET_HW_BREAK
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -280,7 +283,53 @@ static long ptrace_sethbpregs(struct task_struct *child, unsigned long idx,
 		return -EFAULT;
 
 	return ptrace_hbp_set(child, idx, &state);
+}
 
+static int hw_break_set(struct task_struct *target,
+			const struct user_regset *regset,
+			unsigned int pos, unsigned int count,
+			const void *kbuf, const void __user *ubuf)
+{
+	struct __riscv_hwdebug_state state;
+	int ret, idx, offset, limit;
+
+	idx = offset = 0;
+	limit = regset->n * regset->size;
+	while (count && offset < limit) {
+		if (count < sizeof(state))
+			return -EINVAL;
+
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &state,
+					 offset, offset + sizeof(state));
+		if (ret)
+			return ret;
+		ret = ptrace_hbp_set(target, idx, &state);
+		if (ret)
+			return ret;
+		offset += sizeof(state);
+		idx++;
+	}
+
+	return 0;
+}
+
+static int hw_break_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	int ret, idx = 0;
+	struct __riscv_hwdebug_state state;
+
+	while (to.left) {
+		ret = ptrace_hbp_get(target, idx, &state);
+		if (ret)
+			return ret;
+
+		membuf_write(&to, &state, sizeof(state));
+		idx++;
+	}
+
+	return 0;
 }
 #endif
 
@@ -324,6 +373,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = tagged_addr_ctrl_set,
 	},
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	[REGSET_HW_BREAK] = {
+		.core_note_type = NT_RISCV_HW_BREAK,
+		.n = sizeof(struct __riscv_hwdebug_state) / sizeof(unsigned long),
+		.size = sizeof(unsigned long),
+		.align = sizeof(unsigned long),
+		.regset_get = hw_break_get,
+		.set = hw_break_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 819ded2d39de..7a32073e0d68 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -545,6 +545,8 @@ typedef struct elf64_shdr {
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NN_RISCV_TAGGED_ADDR_CTRL "LINUX"
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NN_RISCV_HW_BREAK	"LINUX"
+#define NT_RISCV_HW_BREAK	0x903	/* RISC-V hardware breakpoint registers */
 #define NN_LOONGARCH_CPUCFG	"LINUX"
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NN_LOONGARCH_CSR	"LINUX"
diff --git a/tools/include/uapi/linux/elf.h b/tools/include/uapi/linux/elf.h
index 5834b83d7f9a..b5f35df1de7a 100644
--- a/tools/include/uapi/linux/elf.h
+++ b/tools/include/uapi/linux/elf.h
@@ -460,6 +460,7 @@ typedef struct elf64_shdr {
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NT_RISCV_HW_BREAK	0x903	/* RISC-V hardware breakpoint registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
