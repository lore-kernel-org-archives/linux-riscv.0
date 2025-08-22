Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C6BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVJQ2A2SXdsPdd9WlNM8RsyHrBxTU2YQayrscuykSnY=; b=h43W8dQcOiMsWZ
	eSVPEe0YdiWSlrt3pHCpLAuxQs/5FrQTGszNnDcnOsV+XSMqZYLN6ev5i5GASNDbQE4KqvGjwpgtg
	r0jZmE0D0SgIX3ab4oeSPUg2NIGljvQi8KJI9rt27WnwJlkcBBi/evS22o0zLN76YEOAoj1kykcuD
	/Zb6GuciWl7Q+yOTRsQ9fwKzDcjDoIsdZtiifJmBvtKHYGixKQZHQKC+BV3x8XAb523U/JTQm3dt/
	5PmNPKxschoPgfOVHyDbOvu2y1WVvWVHDSeaYeiYBmzr/lnppbbSTj60JkPEBSph17W4kwm5uxe9y
	u7Zy3UNiK/MHDq4XbZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwK-00000004DCi-0WqX;
	Sat, 23 Aug 2025 06:41:24 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrK-00000003GCJ-3KGS
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:28 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4b133b24ed7so19022741cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884845; x=1756489645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7icmFEtMbjG8nHUlUz3H6xEpzLvZfrYx0hP4AUrTZT0=;
        b=e88o/3chbeXCqhfK6VSb62Nc2XqUbkXJsapqT+1TPHF/GhxfNTZyjegN1JTHMKWnAJ
         tycilFVyQ375Xow9j6E6vw3PhGfL4j7A1/LGv6wQpFH88oB7fdxAv94cbncmLIXtT9/O
         l5UoFIzMY0swnGHve4rAP4GrsvtqVi8Q07YySKyPGogWf8iVfFu7xJP7Ba3LZbXm0Jc7
         2dswbLehSUitBRzgXNIyrdzF6dBUhYodVrHk9MDwq2iz1jYlxaRitxJMSgAmsnGr70y+
         jAc0tlenrVCP9j7zu/vl3ruBaEt1zOm1JPk7TNrxtsIrsnzmL2qg7POvn5J5CNyCF0fB
         9H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884845; x=1756489645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7icmFEtMbjG8nHUlUz3H6xEpzLvZfrYx0hP4AUrTZT0=;
        b=OFsbjyQKG2S/SWbdwamnBVf+gibXRuGWuqt8hFwUpxiuUoE4mBOafE8MIZUKM7FF6x
         ctIz8EyfEMf4EO7jf7O0nODxi38+8tQ3iUC40VnIGg3gPFcJpSlDuwMSH4EPSS901Ywe
         tva6oh0KZWX9ZMMCx/Ix4ZP3opASU5vIN17nBzf8H3fNo6b6mn+ic0EaVTCRyZgRe0KY
         qn1ukWVbYeASvgUBXI7eNUtearLF2l3M+Q+dxWTR9P9J3Zyej/EWHz+A0Pm0IYKtF+B/
         NkhAumnUmyiC11B8FJgpTb7wnoVadX0t897VnUpQx4+c/mdCzEy1mlqacissnERy0wjh
         E2VA==
X-Gm-Message-State: AOJu0YzXdX9DcwWnAfB7g2eQM82O6ac4cxS898a/EHSNIKpeYkWd/fhz
	53MjTtU+msyK+03g+iA9KQpfyszwJ/xuD3p8LZZ0YwqaHl0eq1pAljwkNhc8EX3bbKQvCAY1Cos
	7RMUE
X-Gm-Gg: ASbGncuEpBJBjh5TotOYyPVu3WZ302hPjZkk2VDlVc3kc09/jz7k+9uHsZVBVGndsiP
	BFBiCCwBHKMcPMAoj4veh5jiOJMHZ8b6l2h5JriHpCiYAraFhOLR8ACz1aTfsy+dM2NcPRDcnRu
	00sDJ8IfMmlBnyBStnh2X1KnM5gEkObY3oOlz2zcppblcXOm1X9SfdOMFgnpmONbBVVNBuCdz4/
	C8Ypj/CtMvuR6k0Svoumr/gHhw+Vk5N6TnK92ObkbFpO//RTEI9ARCX8Ufgq3zVtg+OwrwGU9Ub
	9aywdX9KVQH0aS2KcLB9/RiXTwH4Wdg2rsRqgjpzecCLylbswzdyvi/OyXpBff/IjiwgMBKdzLL
	CQxM5Q9DpTT/0NWq4Hg3zLyRzJK5smtYvgSNb3XCuVa4BAXRN5UjzXR3JPOMzPRKM+XwZRg0k1e
	t2H71I9Q==
X-Google-Smtp-Source: AGHT+IGt5FtRUkeNaYf2QqcOOYK1voNcUZefaLnp0B87objwjhy4KKvTzMxzHCr1EhOf/GN0KqwnNQ==
X-Received: by 2002:ac8:5dd1:0:b0:4b1:103b:bb6f with SMTP id d75a77b69052e-4b2aab276d4mr43535751cf.61.1755884845347;
        Fri, 22 Aug 2025 10:47:25 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:25 -0700 (PDT)
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
Subject: [PATCH 3/8] riscv: insn: Add get_insn_nofault
Date: Fri, 22 Aug 2025 10:47:10 -0700
Message-ID: <20250822174715.1269138-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104726_822926_5FBF556A 
X-CRM114-Status: GOOD (  13.27  )
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
V1 -> V2:
 - No change
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
