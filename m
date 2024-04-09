Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6CC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEmv6NolJuvSnOEl2uB8YPhJS4uDAIcYJM7S5VdSoPE=; b=m+ZyEn8awQ00Zd
	qoUi3XUKhMTO+3QBnL/urWPG/CA/wEQP0V83aQL0HrTgOZoBGGzy9PTKEu0sPQhOtg6zwuBdupOkb
	aGFiNPvvlET47fTvn7VmKzLtRqm7n61nQGMcIUPdZ0KUxB+JAgWHnM7MVdi+YvXZ3DCEzZpdnntb9
	JgFhLXo3IqEKmdhkmuv8iCmuwP1b3ZvtRJk3K9ONm0YVCcmTt9uEVaOmiWD2oNocG1iVD4seU1aaK
	k76IoGkMX3kdnR61qrNGLFsavALFA1yUhrHiLzgj4M8lG1p1J6e2+08eAu3MA03meq9iFbJf6t+YX
	abWp/ydBYOUoeDouoEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iZ-00000000W2M-4AC9;
	Tue, 09 Apr 2024 06:12:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iJ-00000000VmN-32cx
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e2bbc2048eso43139995ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643121; x=1713247921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiLAeIECyw84AGrUV1USEqteoHaPU8YvP/EXtLFxWio=;
        b=HD78bOPzPC14t94S1VhddCge7N7ergjFL7hg4GVtdi+BZpy3PiXtZPXlRG//IDmPCG
         9p3uUkM729Lt671e4G9XMP9BO3czmyyTo0h3mnMqoOTaqSyu4W+Cg715a2/sOjhSxcrO
         lpu9uQ7wAGSugoyN8ZOgSVIjo4DGZJeScsrhpNwtBc3qaMTaF73Vx0UHH6s96Mi8uYrn
         KjJJJjlgEN31kilicY9UMkjzxnDRwujtWlHw+btXiKOu6WuGTx8SOGw3QFGjnzvhOTUo
         mqZ51FwJXjx01UDsfSLIZo/cCe9Ngry+oaBFfL+BH0g9OHn0m1Zf2qeRDTgpbEfd5Ow9
         N/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643121; x=1713247921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiLAeIECyw84AGrUV1USEqteoHaPU8YvP/EXtLFxWio=;
        b=w2H3EpeXjk7+FEnr05aLH8U8rtWG9YkYoMfYJQyhO7zHzn047CK4zrHqgsG3BoOqGU
         FP1CA+POYOH3Y0jaO1Fq5RP38XvR7X/HhKku7xoPBa9US9VBsnY5QMCk6eUNfb7pOBTi
         G9bH+AuBceGg4kh8PIGashyHbKhZhHVoN7DBT/wKf6zJEs0MjdELZBS2oArEiSFQZtOM
         doBN7i3oA/560saa4i4LGMqwjFPs7ofKs1gOdxOwJJHtrc8Pia97TKj3FIFT23otFjwv
         lsHRKeJOB4qYBuhQNpYItrpdUFbXrbvjd97hpkTIWDy9RQdUUuFAINQmzaMRjwrAN/M2
         2JMw==
X-Gm-Message-State: AOJu0YyBPmidqtG9bdKb3yXAi6nLUM6xoZpNxpsJi9RMaita+r22uXKy
	wuxgU9Fay5QdMePJQgu+tDW3kMcaSZNQIWKkmy2sZTN8UkAnH4Po23IVsKnEnt1PUVlCnX611bb
	6
X-Google-Smtp-Source: AGHT+IFEkDe2ZGfs1F8mvdmf/ch3SNQCuQFomQ5uVJDLwaNinIwMUeMD+w87Nmm/x+873W3JBq3PpA==
X-Received: by 2002:a17:902:ce06:b0:1e4:70d0:9337 with SMTP id k6-20020a170902ce0600b001e470d09337mr3182383plg.45.1712643121070;
        Mon, 08 Apr 2024 23:12:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
Date: Mon,  8 Apr 2024 23:10:33 -0700
Message-Id: <20240409061043.3269676-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231211_785111_BEA4FDB7 
X-CRM114-Status: GOOD (  10.67  )
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

SYM_* macros are used to define assembly routines. In this patch series,
re-define those macros in risc-v arch specific include file to include
a landing pad instruction at the beginning. This is done only when the
compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..bb43ae7dadeb 100644
--- a/arch/riscv/include/asm/linkage.h
+++ b/arch/riscv/include/asm/linkage.h
@@ -6,7 +6,49 @@
 #ifndef _ASM_RISCV_LINKAGE_H
 #define _ASM_RISCV_LINKAGE_H
 
+#ifdef __ASSEMBLY__
+#include <asm/assembler.h>
+#endif
+
 #define __ALIGN		.balign 4
 #define __ALIGN_STR	".balign 4"
 
+#ifdef __riscv_zicfilp
+/*
+ * A landing pad instruction is needed at start of asm routines
+ * re-define macros for asm routines to have a landing pad at
+ * the beginning of function. Currently use label value of 0x1.
+ * Eventually, label should be calculated as a hash over function
+ * signature.
+ */
+#define SYM_FUNC_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_WEAK(name)			\
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
+	lpad 0x1;
+
+#define SYM_TYPED_FUNC_START(name)				\
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0x1;
+
+#endif
+
 #endif /* _ASM_RISCV_LINKAGE_H */
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
