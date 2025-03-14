Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FE4C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLjBUaJSvHeS+Pvi1YHmXoRETe0+NAMVpylojWqMGNY=; b=jFYXT0uULeuSlc
	bRIRlPxmEYZXP2rI/gOnjqZ8Um7CWhSubzeB7MlQsbV1XqHFH7si3VABPeD77vDXgAK78WZAKLxi+
	ciaWjnQqHANsAHcdEwRt7K8R7K9DJBzTbXjT8i0YSWyvDs7Vy4flL714wArhm/g28kSoGJUv7uzx3
	oWwkouzR2CIiem217vFZyZJkiZT+F69BrigfcylND/kaF+C9m/2Mrf1+ydCl8UasaGxgFLNB3R3z9
	5A9SL7sCgAHOHj2rkI7JxjwzJILvLtDjAIp01bw30izIkanlMoOcBExZZcnyx13dk7GO6FyR/qHZE
	r7WSIJQjLYLQN/zfyhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDry-0000000FSt0-1UYR;
	Fri, 14 Mar 2025 22:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClS-0000000FLB9-1ntJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2Qy+LghJ4/M4JzYV3TrsgP9mTB2OIgCnt82uf+yKrnE=; b=QWVpmbQODsZ+mXIi0lMjFzIF3X
	Q/bP8+Pyy2Fm22U3SjSEyEaDwjgD7jStVK9M9Gta8De2ChUXFVbpBQ1dOypOGb3g2iqwHkvBHW4Qx
	BOCRWNjDVxb4FwM2AkIyZe9hb8Uz17EvazQPYd8Ke3mSaukuRi5OD/LEQU2LDrLDg/bItgR4p3QIk
	GxY8sIrOCaaellg9apQEwYD8iOFdi2wOyAU+zN5fTNB8vWnlEDXjA+KuIQuZcD0EvQSVano/SIyPM
	NjrBkKr9AiqGyZYuSgiLSGVG16NFDI1FE3U8oVU0DeJ7YjT5ZF+T8cyUUBw6DJ5weIBQEQtl2sr1t
	VMAnb6cw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClJ-00000002x8A-2Blx
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22580c9ee0aso48362195ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988406; x=1742593206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Qy+LghJ4/M4JzYV3TrsgP9mTB2OIgCnt82uf+yKrnE=;
        b=rcEn89yanN51rfe33Mh5NkZJicfjEonEKmeV/K/2YXifFU57zS3VKsfAYnspmTTWwn
         x1Yfi8RzL+PbLguHXTPFJ9YY0LL3nDqrviGy0IPl/66bQluz1xLnIPxEIdjb4NNyF2GO
         QTMVnja6hgAQELPt66C4nAk2L/z5dOcqlbNae1VuXn5VoN003xSTVnfXJ33SmtgJ0HSi
         yJnq9erhfvS56kzLkdSgb4Bv7hgvfgWi0eogvUMDovC4xTl0v6hSU2glnWDIoScOa4aq
         gAgA/wbi42CaJ2GUDorto/J9Gj1seXOWhy5JWn7Bg7MSt6NShkyHW5bpub99yemTwmde
         Hxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988406; x=1742593206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Qy+LghJ4/M4JzYV3TrsgP9mTB2OIgCnt82uf+yKrnE=;
        b=Ljwl5wwu3t5vGD/4LVFSGun9mFKWbv9FNG/TvpEN5+v/OQIG/xH3nn4mNhn4qmfIP8
         wdTGDGNK9nuMXoo6XGTgWQvWtGf3VK4E23OxEKphtu5QRB+XIhOuub47Gd2ugOl4jKN5
         M9ReHwI3z5FWE3CTu6DgqqaQj7IBwNhVAkvDvChe0I5YyFwRsD90gC/6Vr55BbuNsbw1
         jBqzHhuX6CCeTSCW3Gh6i6a8tBcw2dCC6bOfbIAJcpygDEmCgyselSLzD74BjgwTPzjK
         +x42Xy+HOqWrNPoG3VSLe8Bdj76u7q/PBNWRzJod9BDq9YtYrr4ZFm80wWFCJPzIXF6y
         KYCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvi2yRYMicuOJBhrBTDCmYEgmLyndn8azKjPFks/0KAhYGq+WL6Ey5Jwy8cnMqXLji8R+bDOuGACJDqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKrGQW/Zp1Re090V7Q6URJ+V4DFP/1EwMQKkC35P+qnkW5oeiQ
	xj4Gj6bDXgK2GOq2eINiDub/mpw/Sqx/ou/4D8y7uVthbXmVX/dDB8DANndT5U0=
X-Gm-Gg: ASbGnctWeMDlI60776SQOJBxMmFkLCxEqozyvGpDlYvtIPLSL1qn0HcvBxUvC+hKffM
	UMmjcSnLE/irivfsx10svgO9VAF4CjpET6Eiml+cMbIdoxdd1eUANnV3bbEM1oLUMs+l6+Fio4/
	lShRkrAOMxRvUjDztoTowHRbagS0decKgPD8KMTTrHvc0k/ipxhrS+tkIOfsGCVu6yyCHPtwZMI
	/31Xk3xH0+f5HEDFb/JxAH6/FVQx2oTNMOYJ+NU/TookD3kUZyWadH+hE9Bi5iF8w4+mTEI+9wF
	CeSB5NK4/w+eET/94/FIQjPYzZENWALdtlljbA8hkRibA7a3yHULQopfa+X1pCfh1A==
X-Google-Smtp-Source: AGHT+IFZGoCstNHVFobdYDMcxqcukAL5Q469eJyWCBWchEfbvVnOKA7zPff+GIgC5IBMZVr9zGx+qg==
X-Received: by 2002:a17:903:40cb:b0:224:a74:28cd with SMTP id d9443c01a7336-225e0ab5216mr53565875ad.31.1741988406346;
        Fri, 14 Mar 2025 14:40:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:34 -0700
Subject: [PATCH v12 15/28] riscv/traps: Introduce software check exception
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-15-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214015_262956_6F78D1C6 
X-CRM114-Status: GOOD (  17.82  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 43 +++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

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
index b28ccc6cdeea..34ed149af5d1 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -40,4 +40,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 00494b54ff4a..9c00cac3f6f2 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -472,6 +472,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8ff8e8b36524..3f7709f4595a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,49 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	bool ret = false;
+	unsigned long tval = csr_read(CSR_TVAL);
+
+	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
+	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+			      "Oops - control flow violation");
+		ret = true;
+	}
+
+	return ret;
+}
+
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
+		irqentry_enter_from_user_mode(regs);
+
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+
+		irqentry_exit_to_user_mode(regs);
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
