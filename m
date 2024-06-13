Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D3C27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwnVMX6JdVnZpzpZNGE/rdjRj5XHusa8J3P4pUXS1Zs=; b=KQUbzvwyCI4jyE
	NNUbbIKSdoQuaM04sGjmiykCog52qklIzJgSH6+jsWYsKnZQ1C32zIDA2ZkqiEtgp8klc58wWW543
	rZVW/mmHi/Cqsm3PvQl/2OJCAias4dnRvWkiRhYwYz5yubt9D/ogJ/obks/CSfQIuvZwlkiKmDEDg
	NYFJR4z58a1cX6Ss78BCkI2GVWXkiuwzRrvp/0ZcG5XDBtsUc6Ilkim4Uf0mVVbHNOaDEgvvFxzwS
	glg6EE2GhAlLsTY6v8DSVZ+QFDYjHFo4aTDIcH0tM4LGl4J0QSTS5bPtsX1YwSlGJCXoJzDA7mpmx
	/JmQFPR05aLyOJiHN9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2L-0000000HTw2-1R6S;
	Thu, 13 Jun 2024 17:14:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2H-0000000HTug-1D2f
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:14:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f6559668e1so11481355ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718298892; x=1718903692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV8R4Wka+kWZfjkzpKS7OzxP5uBoNS2Fqf1rx+C8LXA=;
        b=e6muc5+mLzTVgRiYP367E1Szywj2aGaNDRmJZhQ3X9rCo/jzpXB91I4ozNDWa4NQsO
         pnBHOVWTW8lQZINLVRkw5V7ymdxK+Nhu/NLR79mK7doU0zrztat4qvQ+Pov+yRJrdwoF
         XB8CmmjO+lp7JXAXbO2lFnQjRdX/BCE9sJFPF2JCMwMwg4e+x+OG1sF+9EZAzGWRgISE
         R0b98x/l/82fskHK3YY8dF1DzEwFzgdocVXOASuGz3/sd5chBcl91yGQdL9lUQZOkYGe
         OIlZWE2rMmUXXYHNwFyju2pbaZX/AsmZmXQrcSJydsDAHvHq8ylX/H7I2lVRxYmQ5kR2
         1WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298892; x=1718903692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aV8R4Wka+kWZfjkzpKS7OzxP5uBoNS2Fqf1rx+C8LXA=;
        b=NQGtu+ffTiJCBdh3PBdZ/+/TMmZbjFr2ReSjzDOKZXE3MST+i02SdGlLlsnJwZ4/Y2
         HLxS8AmiMBihHdsMw3YNlrkyDJSwbe/XU/68gQUNcGdRcSLyYqHwkk8Or3hPv5FsxYN2
         JtCkLmjmMtJvoU8otj6AphkzHexJTDKElOrx/insDub0fYQ3KLfLuw2eh3erfWnGErxg
         uupUkYFISD9D0Xt4skX35hu7dDTVISc3GjfvudUVZzu7d+8kLtkF/RLfefs5fS2bQRyX
         diMNAV45wUa+v7w3vycPgmuwcuamZHmN3PfmCxuDAcnQPqzkEeB9TPsn/Cmox4ub8gFA
         S9ZQ==
X-Gm-Message-State: AOJu0YxMHyy64kQdJnHephI19F8IRSZ3ud7Tu+CmfhWnjyqgfYOkZUQW
	jGCgQzBH4lL4zBn5wLKqUfSV3iMGGdM+r8c/VE6HEs5fRrLZgvufW+AADDZG2tKW5g4V1iAWbj9
	7SsIqtDLqaO9Qq7Kd1Lavxik2RbCC4taNL8kOAiTnL0NwXyr8PrtT6FbubnShXPug0no/6DqYeD
	CiQUgx89Dd5frlPuxgv0/N9/a3ZGm9AGgJihfnBRnangvPSNN3U5cjoUS+
X-Google-Smtp-Source: AGHT+IE+AuA94KlSOrMmKKMHWCbLkDJ+fe3SrEJ/Bo4TkgvXZJ6nzIlGMF8rhlIZJZU0Xh5kVXXaSg==
X-Received: by 2002:a17:903:41cf:b0:1f7:17c2:118b with SMTP id d9443c01a7336-1f8627c76a1mr3144095ad.27.1718298892234;
        Thu, 13 Jun 2024 10:14:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55eb0sm16445035ad.18.2024.06.13.10.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:14:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/3] riscv: Add support for per-thread envcfg CSR values
Date: Thu, 13 Jun 2024 10:14:40 -0700
Message-ID: <20240613171447.3176616-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240613171447.3176616-1-samuel.holland@sifive.com>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_101453_348713_3EC1CB1A 
X-CRM114-Status: GOOD (  15.90  )
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

Some bits in the [ms]envcfg CSR, such as the CFI state and pointer
masking mode, need to be controlled on a per-thread basis. Support this
by keeping a copy of the CSR value in struct thread_struct and writing
it during context switches. It is safe to discard the old CSR value
during the context switch because the CSR is modified only by software,
so the CSR will remain in sync with the copy in thread_struct.

Use ALTERNATIVE directly instead of riscv_has_extension_unlikely() to
minimize branchiness in the context switching code.

Since thread_struct is copied during fork(), setting the value for the
init task sets the default value for all other threads.

Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/include/asm/switch_to.h | 8 ++++++++
 arch/riscv/kernel/cpufeature.c     | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 68c3432dc6ea..0838922bd1c8 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -118,6 +118,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	unsigned long envcfg;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..9685cd85e57c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
+			:: "r" (next->thread.envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -103,6 +110,7 @@ do {							\
 		__switch_to_vector(__prev, __next);	\
 	if (switch_to_should_flush_icache(__next))	\
 		local_flush_icache_all();		\
+	__switch_to_envcfg(__next);			\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4347c9f91dc3..b5b8773c57e8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -772,7 +772,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
