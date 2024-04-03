Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE95CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tl25D7o9mt1wM2Nc2nQV/+/x2oefr9YfG83fbilHfXY=; b=y2QeSOjZh05Em3
	iLyO0YZ9ow3pvUAawWTsT8cmH/SyPYgjHnJLmR1zrgSSImpKFpfAmvP6JKjSI1YW0iirymNEMMXr+
	4AqEv9wLIFJc+aUrQJs2ZV4Xfhe/EPe5YhWe9DzrBw+fuxXnMk4f+xGHKhSQ4eSo1mwc6CTlQRG+c
	9/rA2f7aAg4I23whkwKNWi1VcL+b7djWsq4wPkByawnz7yIV9X1C035iJLGXaa+NRAmiARBXN4tgz
	GnQUNUsWdFTIgFM8dCIHwqTPafs5hF5cCoxemwMbYJSlL0BqAXK2GH8WzsCx6QjmrIYH+bMw56rMK
	uO4YLy3xV5+Q8SmQppvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAGl-00000000bMz-2C6C;
	Wed, 03 Apr 2024 23:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAGM-00000000b12-37Gz
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0OEwRph0hX4JYK2tSpTwj/IHXbbgfxXFL6/9jyQkq+Y=; b=Qb2KY3pPJjKxw0DePq99VLDJjh
	1uj10setzI27tdLJIzmbxCKTxsCeie3wDy4865deggKiqWWHFmT/JVXn1m6VBN8fROSHA9WeXumfn
	jXa11qX2vVHnnElG9kn2lkRc9rnc+quNHyWquFYx/gZJSE5node0j/whk2VHvTMAXOz4pw0XSc7ID
	p7s8RoQ6gXz+/SZPJbCMFl2jwUtVPCrXcSLi4PUXSC+jD7SRATNDmPxkuctVdEgOjhznmWue5IWj0
	wZgzS93JsKVPKyLKqevUasbW2qZ79QutAY9tjAE4OCfsknMHB/wVIrHKHUEElre58HgSD5PGei3NG
	i8/gSCuw==;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAG2-00000004U1a-1cuI
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:43:11 +0000
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so327858a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187754; x=1712792554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OEwRph0hX4JYK2tSpTwj/IHXbbgfxXFL6/9jyQkq+Y=;
        b=FBT0JAYNPCMh4HPPY0uoo+RHvynXA9uh5KJ8XI6iB+T51g6gE/SLJlRM/Pv90ZhziW
         GQJ1GKpXO3hbkMAX+Ach9W2Z+RpKYrn5yL8AlB5T3ncoXeKUmt09nBWCJOfM7LGxnZoB
         mYDV2CFjlThZ9d0Uv0niL9PHkE6io2OKKq9QKitWAhTfzT1I0oBZrcW/e7yutgH34K5W
         y9pHDbAloPZ7rtwFgiZS69TxLbPIQMJwT7H6AhglYKulgOA2dielZ+Y0jH3VWJPb1sVP
         T7aoOKnd9pXWyIH997nVSem+BR0XgD5xs0gRKK5KZuzX9kjkRq8UYzu+I/aW4ufVEqyq
         eNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187754; x=1712792554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OEwRph0hX4JYK2tSpTwj/IHXbbgfxXFL6/9jyQkq+Y=;
        b=aFR/sMmDRUAG+u+8env2QqT3ddPLWXY0pAutDZVkGziD9OdJzS/fMU6qK0du4nGP3d
         NBQ3+Xa/aAbVCcfYXj8GrtAJ7DepzzQT/E6iphiuAEOxY3pJWMKzVcxKlJIKGsxD3aC4
         2qNF1SycD0/RBmU6YuAgOj1TS+2aQdEPysErK9CG61aoFLiXketfjr+YB1+lhxGlzxMe
         LVKLgS3lpyil+8MwmnkCI7hbcMAY/uhHrq3XKP/yXNsIK0jRAK6YZmw0Cso0o2NiL6UN
         s+91Z29g+LygNg4jjDv5aXPlVpHF8OzaK0cP83+LKXxt5C32Xv28+LjjPA/FXDfLZN6k
         NWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUulyivwvf8RD5Z8zTp+samhYvqMXR+2uoC48hutx8Y8f6/Rpws/48JTrhPBq+l9lkwnxPhL6X0wUWRc0hWp3P4nLgEOf8O3BpvmKq5bVdw
X-Gm-Message-State: AOJu0Yx6EofkLqIP69Jo2Clcam6YFHi6n92s6OQZRleJ70ozN9Dt0pBq
	37rSmM/GyGas3DRw8RoM1Fvc4KfPKCC7jMh8DL85PSFNN6BxWA8j5uK+DJHczJg=
X-Google-Smtp-Source: AGHT+IFFY1JJO6kTtTJnAWqFL/OBzyhhxXawvUaTnL2Gmm8PkkBK+tirtybimz9kqqx/Fu1xtzZ+EQ==
X-Received: by 2002:a05:6a20:6d9c:b0:1a3:6833:1cf5 with SMTP id gl28-20020a056a206d9c00b001a368331cf5mr947386pzb.29.1712187754011;
        Wed, 03 Apr 2024 16:42:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:33 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 21/29] riscv/traps: Introduce software check exception
Date: Wed,  3 Apr 2024 16:35:09 -0700
Message-ID: <20240403234054.2020347-22-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004307_751461_B6F7625A 
X-CRM114-Status: GOOD (  14.46  )
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
