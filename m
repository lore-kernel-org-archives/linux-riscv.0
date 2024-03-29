Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91150CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovpZn0++N+ROu3Z1beoy9t/e7cqR++m3mIdOFrE9PgM=; b=Ju4/y2vi44BBUA
	ZmHojxFhovNmdm3N48PRh3dUukWpCRJODsKhVtEHBpxIJsGTyA9TUHx3qTMpWXCPa83JjDPe3Oxr8
	hBGmQ9rZqWF6avc2sMpXx6prNymXahxSx/gy8GKaq1AvhdAEErTibil8SZwseqGAzOYUeZsPdvWV1
	/dkWabJ5C/wPIj3q6LyX8xO7MbZYDt7NxXbr06s01T9GpKDBZggfdv+kLPQoCfTXIrBT8HKUiqE0h
	VJPGPP8bZo9/9fMDEqBsgrOc+WWjuk77cvfyeb9dTZUyi69dirXdY4lZTMJQizrOe5LjWWLlqyx0c
	SkOd/U12uGHG8xQPLosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47C-0000000Gms6-1Rqa;
	Fri, 29 Mar 2024 04:45:18 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq479-0000000Gmq6-2PEe
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:45:16 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c3daebabe4so1045549b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687513; x=1712292313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txT/LccY8POETQDQkXcfynUkPCv6cjOV6zf46WX/Pcw=;
        b=kduWj2gz2jsDuO524XZr93rZPNQHMC5XlQx2UQxzWKWCywpkXFj8eOBxtrxauZR5hv
         dGWQTdaUPCcJ0+6L1C0e0gg8iCXO3ciYd6kEaxPvg4xS+i5F/sDvdauUBy3d8FDRVTir
         zQDYbNlVI1O1PjHb6dDiAK3UvKgWllR3yIMI6kEKDa/PaAH2EYfN/TMumXbvrUxw4Flw
         p6YpQyNXEDH3Gv5/UvRMRS6GKbZrmkPy3WuZMddOVgyLAj3aoO+fboE7a0YwBi43PZ0s
         qwCDBmp62/onXS2JbXqFHLQOdOpqfwUuxhId+63fNkaT5MuOOW7mXHZ4l3ku5/UdLC6C
         73NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687513; x=1712292313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txT/LccY8POETQDQkXcfynUkPCv6cjOV6zf46WX/Pcw=;
        b=BmCK6Ab+T/WXvob35/coQpUOpQFNH+2nL2zHMP2d/95aIOhjdalFQGyBn7aJ6jIdSX
         eqDSxeFIiMdxhv7oc3hgSUVCYQ09IhsZPCChNnVtE9MF6kFKgLHpit+rV2IltkwhL+rB
         egM5D6pmdeWQDOBiPEUFS9g9xNHwqVPJ4cyi0+n39PLfF8ITZU5mE1oUntJOf/k1SD2n
         sDiZbOsAjlG2BkI/S7LtuL9PPEQwRjQgodpeSkpL94xSO1EaqsUYknJJsTTfG053aZLj
         XxdpJt+XF15rf2fAav3y8Fu/0CMNKZc06B25TNxktST9Xa5IArD42r1kKPWw6BmagXXQ
         /99A==
X-Forwarded-Encrypted: i=1; AJvYcCV1Uo+mxbLASNWdiJXTs3QIn1iSrWtzCsiitb3kEXZrwfkstEVBOYVqrhrfPCBX1WLBhgERclYIb1APlKq8Kgb++TsfBahZ70dGo3y+avua
X-Gm-Message-State: AOJu0Yz4nmtEkX72KOc++fCQogjhmlthsKdu+J8ZCdOS6XeS5fZnFZXD
	u5aFJBYN8YMMThaFIU4SZ4vuXtEiGNHlbTf37PPsHG5YJg6iUJDHL45T1NOx3pU=
X-Google-Smtp-Source: AGHT+IEg1KTq7jE0OLYYVBAFrVsprg4r4Srip8vRVS899kAu1nJanfI5DM3TwMhj/+BfX0hVCMH91w==
X-Received: by 2002:a05:6808:1584:b0:3c3:e05c:f499 with SMTP id t4-20020a056808158400b003c3e05cf499mr1508075oiw.39.1711687513312;
        Thu, 28 Mar 2024 21:45:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:12 -0700 (PDT)
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
Subject: [PATCH v2 01/27] riscv: envcfg save and restore on task switching
Date: Thu, 28 Mar 2024 21:44:33 -0700
Message-Id: <20240329044459.3990638-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214515_649743_2EF577A7 
X-CRM114-Status: GOOD (  10.80  )
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

envcfg CSR defines enabling bits for cache management instructions and soon
will control enabling for control flow integrity and pointer masking features.

Control flow integrity enabling for forward cfi and backward cfi is controlled
via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and adds
logic to save and restore on task switching.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..2d9a00a30394 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	register unsigned long envcfg = next->thread_info.envcfg;
+
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
+							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
+							  :: "r" (envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -80,6 +89,7 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	__switch_to_envcfg(__next);				\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..a503bdc2f6dd 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -56,6 +56,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
