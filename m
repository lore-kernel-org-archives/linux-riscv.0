Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A959ECD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+j8ILbLOGp+QGrmiMtka3p8GlRxA9TMnh5ZjdnRg1w=; b=bmWwzw5T21LuXU
	ZbrNiFMQCjedQVpQ/0OcpIQc9VvjlAdr0TyFP7dj7i/98knJneLCDWtJWeugQ+r+03RLauut1KJS4
	v/lTtgDVUDP3T5Dy+4SdWFrktsweoXubaQFjb1xKJgP4B2n85mlExKn12XI8uVRSn4evDa6HFU4So
	/v5lYiedCgLBUNQKbkXcXasW0ZfcrVao/2IlQ6vSJgFGq8r46R0MCnto6HnFPBgr2r43xzejREqhX
	x/Y37He9ELcaiRgTcea4QcHOGMoGWMGvMNvybNZBLnaYDFaAByUVRWYM7rHeYHbZ/hrasiZxYR4N+
	IwzHcG1iBp3dTlCMqITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq492-0000000Go32-2qCs;
	Fri, 29 Mar 2024 04:47:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48o-0000000Gnqn-1HuJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YO0iTqSJGMZjgI8FFL6Efs68zyEh3di0+Ee8Co7Xl3I=; b=FSsdDXrQqwZnkHTjqZUT3BPp3i
	Fh4PeyF6arFpymIpMC0Yqo0bMVwHRLxozgj/dy57dHxHoBgls4KS2IrHLgCe0BAZLSCoy2sjRSV95
	1mMvnZCcbHH/p869759H/ikg9HfiQPij6ulK7cP1mA0Kw7OHiZ5hGE/aIDvdKg5DfWLbvN4XwntCn
	yFAiM7ArnOfl/oD3QsLwUpcBjangIH9wixqzwMRNWU7XhrFPdmeQaBT83UZPxo8cm+LtcPyDPG7p4
	u1sQwOQNZz+DWpV6ZDtsP9uMFR2yz7CMdkb3kjjAA6Y4etPdkdqRHqjlYGxfuuZz68jDwU7WxOs+d
	Syfr1KYQ==;
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48j-00000001MYj-3hx8
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:57 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c3e6ea6d2fso867222b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687610; x=1712292410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO0iTqSJGMZjgI8FFL6Efs68zyEh3di0+Ee8Co7Xl3I=;
        b=pKN33DbfHUz1tUc2xBViFdYSx7jkS4lpXcq3lzoEFe4nYL4N3d7mKlIIt/66sP9NgY
         2qClKSkACiuXbrdN1GQJwC7J6WSlLo5UYmGfMTg84SwuOYwUtPwvpHNiWjRZENkvEht4
         68YLuSiX5n83TdwILqIe+5mV4WDT2vzUGmPHGZ4Ap/URXUAEXI1hCiRdVYrKZaxDH6Jk
         PwlpycicfnFhIeCRpA7wD1YtnSNauy+mjYACW3ISXDEy6pA5evsRAWkxEUtINcY54a/u
         pbGvU3UG2ktpsEs1bg8tUhLIl9cXmXyCs1AbMP3XFkbUdNBRXeae8EzB0X4mFo4gjwy6
         cwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687610; x=1712292410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO0iTqSJGMZjgI8FFL6Efs68zyEh3di0+Ee8Co7Xl3I=;
        b=vd/jAUOi9PHW0qI8ot8BrEzsM3uuc+sG9+nMmL4dNMm/SVR7tdtNkj/4NK30rO6ial
         BJFTM7ZjQpqIh6H8Lya6zVtH76pVXDY6qlY3U1ZgmNFQ94mxHo/TKVXKGSrVvfXDDUhA
         ZvtxfvAoSAUrXY49l6FFtMX9LjLej3iwqkywcYrNJD+xw82+jXwtcgx5IX4H8RQyGIon
         jKreC+ZMX5IZgIGdlcGSggsyHCIwQJ3OCDyfK5Joh+KEExZeR+8TaU9NJ0CtbTghx4cQ
         Uo5iIjds6ukgF8ZfBEFSdCO2XdMLec5z/6pFNCCwDuQpsre6ivnWqWmUpXLgaoFcTSv2
         owAg==
X-Forwarded-Encrypted: i=1; AJvYcCUZTGaVJMDCPEOi3Xae66xU5LO4InSQ9u7iNG4XeMy4WCJIHHQGFzylwwqi1LjxoYX8eHxAcp+hB6tMJW0foDl0sTbNULG/ykrJ1dcLUgcS
X-Gm-Message-State: AOJu0Yy/Ep0gK/LL2IXkvdqHuVfB+9qNQFLSM11G7SCwPdmnIaNiRHg/
	JLSI3VkgJf9ImIdrzPFLB3F2YxViSHHO0Xmnw5/pAYfWRHT9iZSZJpD5MFKQevo=
X-Google-Smtp-Source: AGHT+IEEkqqoh9ZCSipkYJyi1sYiOeAupA2Zd/Tw6FmqvNWOmZwwVKoooYj2QwBiFKxvGUt1R6r40A==
X-Received: by 2002:a05:6808:1885:b0:3c3:e436:881f with SMTP id bi5-20020a056808188500b003c3e436881fmr1602543oib.36.1711687610580;
        Thu, 28 Mar 2024 21:46:50 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 20/27] riscv/traps: Introduce software check exception
Date: Thu, 28 Mar 2024 21:44:52 -0700
Message-Id: <20240329044459.3990638-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044654_600955_7161FDF9 
X-CRM114-Status: GOOD (  14.36  )
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

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check exception.

Additionally it implements a cfi violation handler which checks for code in xtval
If xtval=2, it means that sw check exception happened because of an indirect
branch not landing on 4 byte aligned PC or not landing on `lpad` instruction or
label value embedded in `lpad` not matching label value setup in `x7`.
If xtval=3, it means that sw check exception happened because of mismatch between
link register (x1 or x5) and top of shadow stack (on execution of `sspopchk`)

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR. SEGV_CPERR was
introduced by x86 shadow stack patches.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               |  3 ++
 arch/riscv/kernel/traps.c               | 38 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

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
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 7245a0ea25c1..f97af4ff5237 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -374,6 +374,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index a1b9be3c4332..9fba263428a1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -339,6 +339,44 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
