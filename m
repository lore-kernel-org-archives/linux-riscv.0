Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE257C87FDA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEzt44RmSzKjJZqUDpXOlsphVoiNxLOxkT5MkStS6dA=; b=UjNu7U/ecVRpM2
	uBgua7VDkMxGOAe4rHfRrg94nx/3JoUPq37IqJhqnL325RlLZyg5Aq0AEMfJXHNcSeO4qA0lZrKFU
	Iun0UbOGR/tyxynXTXP2BvtcKdN4E/A+nuRW6Vp0iJyRgrGBUCOgdC96dmKRm1SfipYLcCamYGjKt
	XVJ5C55aRQXqDmAFjBocJY9is3jnJEyEipBAMDuVg1lMOR/0Fr1LfglIowyR4WgFqIEUbEpthB8Zg
	QDgVzBnHRcIWRtkdYzUYMYVnsKeXIIAdXqPkgazvr/o9JSwBjzGg00R73NJvsvxW74wdRsgBxMBGT
	SR6YUp0TDxbuIBeTBZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNW5-0000000Dgan-0tCS;
	Tue, 05 Aug 2025 19:40:09 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNW2-0000000DgXI-0xrK
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 19:40:07 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e7f940a386so171993985a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754422805; x=1755027605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMI5Xwq0SqGXnmGRw5QTZMv+U2y6SNaFWej8c2zdngA=;
        b=DzVYlM95vItstj7rI1xzupX3on4b2yrEG24oQyaKT8fIdPK4M8/jyH4XyG1CsTTNtI
         YVEOVGjg4RTLjMYrPLI5VkCuGHAQedLmk5QsWXg5zvr1VOWU9Cvfqtav8+erOuZTFH01
         u67BQdty6XfLCyWICVwGQc/x7sa/T8PXqH1apq3Pt/ZuCFAmHHYRfXRDYGJLmeHu33rA
         m8eULoBK05PgC/KlSW1mZoncjOXpP3MNu2cesIvfnD4R6mYQHl1nilY9xX6l9JjN0fRM
         W+Fg0Qs276aI3XZO+neQE8nOVxB0U4OCxEd6JLFoujmtozzLelGxIjyjGAULeXgttRzo
         Lq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422805; x=1755027605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMI5Xwq0SqGXnmGRw5QTZMv+U2y6SNaFWej8c2zdngA=;
        b=VHdfcuXDD2K0iI+Xyalb3tqmhh95ZMJgDGxMwOQaQIcy5aVNbor8f1WZ4UNFaS0eEb
         3J2aCyP+9sPafIqlSW8Ik5YidM6zAbyPmxnvvpdgQztqWxVyrXfxxJvr5hZ7MPWp+fLv
         qU1X73dUUdODlCspzstjL2MDfkQffpOx0HTACThyQnFBxI4bphFAu8zyWu/US1geqj7G
         vFbc51aXHOUbw03ssD9lH8C8G3Nnj14+du1JXdwWmeM8pHAAJIghbzJaQT1fqwdmlwu7
         BEjbibix7DjHCe+leKdo6GAICgpL3nnCnXOJr1Q+f8ojEQbu9z4D5ZdCx6ByoaEEMkNo
         GlVw==
X-Gm-Message-State: AOJu0YwdaugNrj9v2HaYE003sbvGmfGpj36NouFCwNF1naJmfGCH0MuG
	LzTmoO494qOvWIEQ2wuxC2KGgxrM+s3oZrVkRxtZ13yrHwuzNgpHezRcQAhlXfRvWXsBQwOXeGL
	cH2Vj
X-Gm-Gg: ASbGncvDMtFt56v4sPxTJasnF23eKojmjaEnvK7+KUadPkVVARxPnH1RDRux6eYViql
	nKzaRf3FZp/DhkIirVFgbTopl16eE4VyPWVGaBrFHjaQzYvXHGzGGVbPYQgN3cDvBzKYJirurJ4
	ltxdtOe7uXpfYsPXSc8wLBBUH8rMPs8Wc4q0JlKhJqXgA1yHNu6ZcQEunIdf/r47pncBjEnU6oa
	9541WR5GNPXW+LyJT39LQMH0L7Wx0uMXdkCAFoOR5e+GrE6swzWTSQOUaOfasV92BadyCjQSl1f
	IC/ZP6emLKoOuccRGB0IMqA3NfFXRfkywr7QBXLjzqyhVOj3VPp5Azs6uacygGsdDgVlQVFA+j/
	2ytfXws5d5QOwuUNr9tka/nrMSH7CTtW+InqPUM/u53DU0sgkyc7MBEvD4pwCm81R2kPVflWrDj
	Pa7T6Ckw==
X-Google-Smtp-Source: AGHT+IGslZriZ3OsEZBWmVfkk5oCBsMISvqP0jsnyJuJf09cg7efSarv3MBZUu5//ACqxd//7g3UxQ==
X-Received: by 2002:a05:620a:430a:b0:7e8:2e5:feb3 with SMTP id af79cd13be357-7e814cf9504mr90508985a.1.1754422804849;
        Tue, 05 Aug 2025 12:40:04 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717855685a.54.2025.08.05.12.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:40:04 -0700 (PDT)
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
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley  <conor.dooley@microchip.com>,
	Deepak Gupta  <debug@rivosinc.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/8] riscv: insn: Add get_insn_nofault
Date: Tue,  5 Aug 2025 12:39:50 -0700
Message-ID: <20250805193955.798277-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805193955.798277-1-jesse@rivosinc.com>
References: <20250805193955.798277-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_124006_277037_7755E871 
X-CRM114-Status: GOOD (  13.43  )
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

get_insn_nofault uses get_insn with pagefaults dissabled, allowing it to
be called in an atomic context.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
Unsure if copy_from_kernel_nofault is an acceptable replacement for
direct dereference in __read_insn.

RFC -> V1:
 - Add new function instead of using copy_from_user_nofault
---
 arch/riscv/include/asm/insn.h |  1 +
 arch/riscv/kernel/insn.c      | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ba74e5b8262c..f87e0a48f786 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -553,6 +553,7 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 #include <asm/ptrace.h>
 
 int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
+int get_insn_nofault(struct pt_regs *regs, ulong epc, ulong *r_insn);
 unsigned long get_step_address(struct pt_regs *regs, u32 code);
 
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/insn.c b/arch/riscv/kernel/insn.c
index dd2a6ef9fd25..c8f77c0093c9 100644
--- a/arch/riscv/kernel/insn.c
+++ b/arch/riscv/kernel/insn.c
@@ -2,6 +2,9 @@
 /*
  * Copyright 2025 Rivos, Inc
  */
+
+#include <linux/uaccess.h>
+
 #include <asm/insn.h>
 #include <asm/ptrace.h>
 #include <asm/uaccess.h>
@@ -74,6 +77,17 @@ int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
 	}
 }
 
+int get_insn_nofault(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	int ret;
+
+	pagefault_disable();
+	ret = get_insn(regs, epc, r_insn);
+	pagefault_enable();
+
+	return ret;
+}
+
 /* Calculate the new address for after a step */
 unsigned long get_step_address(struct pt_regs *regs, u32 code)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
