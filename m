Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2DBEEE276
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79H3p4vqvAh3F6CD4q6m7p1vjE23usVa36/TScZYlk4=; b=TruwqUTk+GBqWo
	li6f9kHUBxecm7yeP6VOidSuMJqXpa8zr+uE84lHoxC5iJ2ejmLkKR3m5zNkWHZXM9CuCZyMcqX0U
	BRrJMe6dmoNDDGhG26oexzpCXuPoogreo6wmx+nNnkgQdTCSf8+F9+vV8LfzHEzMnWPIdSieUMq+u
	CGkxAynV0MRJdDe5SGY8AX6Rnphg13uzhPHTC+9NBC3gryXKZ95JPoeZPXxN89WTjyD3Ud95wdu/q
	m/4/gcVN+ElWjwgdQm2yezhr7dAd/mR7ERRXyYoG+9ZUbhnYTFvdUV+hxpfq2gm9gE/1gSQPzwKc4
	kYTBwzMNfr2DaylRWxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDJ-0000000EaYF-2M90;
	Fri, 13 Sep 2024 00:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5N-0000000ESHT-0vJe
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yXfnoEa3i1wyQd1F0z4P7UzjOQKWsjZf9fduhQBzJq4=; b=WlK3wVsfcnmY/UA7uRsv+CTgpq
	zexpTKA8/sPHTSE7Pw72u8uJ1IeSPiZAFzzxGckhErb3kbBz5jyVffktEbWFYFgZcbIGiShaeJJ5v
	qCdC900943X5Lr3Mg5a7cLBbE4gH9/niVi4+I4lj0vKMnkiBatR0pdCSDSwduttMx71eiO280UWtc
	NOkIjuRpDty7wSJIuipZmiG14cK87vQkpQdGfKzPl6aJUSVKlrcwYQ9gVGyZmVKkqh0f5tg90e19w
	2lASNThfDCwm/N60xqd57DCv6Ut0f1G4tql0zoGLlxLpsS0j6uo1FeeIFC862RGpWQct32TReY/d8
	EfOi9Agw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5D-00000000YFn-2EK8
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2d89229ac81so1281796a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183118; x=1726787918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXfnoEa3i1wyQd1F0z4P7UzjOQKWsjZf9fduhQBzJq4=;
        b=UF6tF+4cJwZy12U6c2q8XsI2+XN5IPo3UO/elbxUBbKiTx0k5cgqPKTaVOwbq2MTYp
         5CwPychRqaEU31spdC5qb0wVbGYgVk8zJ7/mlHwyQ6KMlq+2IkHfCnSt0FBX6RI9fVqS
         JnxGbma0wzW0tRXideu/NgqldTpaCSbpiPMmgGWCCHxWYGfdGWtyMsABNB/xwj15Vves
         l8s9aAPWfKBuUOPsSv1UZn8lt5Ota/o27dO2WJZYlDvJ7qJUfSA9Gs8rvOslGCzPqDnp
         ZRKng5Vp99LTKD68vvOrZgWyVRvDgJg1s/zOkd3thgDCJNPHqKxZoEFgJOyGj6tK+jZF
         5Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183118; x=1726787918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXfnoEa3i1wyQd1F0z4P7UzjOQKWsjZf9fduhQBzJq4=;
        b=nYEdB6xrzl4BAFp6dowQ1FdzqtmJ7JL8DOFSQIGCAP/mDZZ0vGvWpVLNv5Qx8Z8lhg
         8cu95iyYpGZu4w0GRwHdTXrJR2lL+6Bl0tpT2lyQErqXk81Pp51f36h7fo3lbVIC+6rh
         spIezTkgCww8j+ZD1GleaWvihixQTz5eonrdalVWo6d5uFh8+ZJoLPe2tejNjJP1xxXb
         HCq518f2MMFdxJXnMQojwJQDzdlDYzXNhkJCCic8J3S3xtDW1omw8QYmA0IxDwiescvh
         fa+yCcVE7NIIV2pBRxnY/+mIhrqEfRncegkqeqw3IGaGaTCPSbRV9wYAM8cmRquSXWX9
         j5ww==
X-Forwarded-Encrypted: i=1; AJvYcCXx5Li/29mutY3Hz0MKpeRf+O/4GzqYqp8zwZRuASVOl3wVquE89OI5BMg5hjn+bOcrQKNMeCUWdkNiSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLfn0S/uq6TsRTrsTgg3xiGNRl0yOi71fbaJPsP2FWHUMJao0B
	wX5NLNtCtg50QA1xe4lIbtdSsiSHP9OHL5QC8uKY2rB3EvuH9sFJPro3eH6d8+s=
X-Google-Smtp-Source: AGHT+IFuYD8h65+1U6P2mbP/p4Fa/VUP3aMNny81RffweMyQhp3hs7nPg1eND2jqWBezKJj0ChZXLw==
X-Received: by 2002:a17:90b:1043:b0:2d8:aa9c:e386 with SMTP id 98e67ed59e1d1-2db9ff90b77mr5493054a91.14.1726183117828;
        Thu, 12 Sep 2024 16:18:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 21/30] riscv/traps: Introduce software check exception
Date: Thu, 12 Sep 2024 16:16:40 -0700
Message-ID: <20240912231650.3740732-22-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001843_423087_97EF754F 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

Additionally it implements a cfi violation handler which checks for code
in xtval. If xtval=2, it means that sw check exception happened because of
an indirect branch not landing on 4 byte aligned PC or not landing on
`lpad` instruction or label value embedded in `lpad` not matching label
value setup in `x7`. If xtval=3, it means that sw check exception happened
because of mismatch between link register (x1 or x5) and top of shadow
stack (on execution of `sspopchk`).

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
SEGV_CPERR was introduced by x86 shadow stack patches.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 ++
 arch/riscv/kernel/traps.c               | 38 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..4068c7e5452a 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -39,4 +39,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ca9203e6d76d..2ec75ba864a8 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -384,6 +384,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..32d1453bed72 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,44 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if (((tval == CFI_TVAL_FCFI_CODE) && cpu_supports_indirect_br_lp_instr()) ||
+		((tval == CFI_TVAL_BCFI_CODE) && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+					  "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
+}
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
