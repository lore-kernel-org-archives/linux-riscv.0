Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC7606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=poihWLII;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CICN3gWg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5+3KlpXo7phlAtMs9vCDEg8B/h1QDYJ4ZKKASvQzvi4=; b=poihWLIIF23oCd1ZhK7MIhMtYS
	SX5FoVWU5R/BQGOzHLgoYQLYlzvIpYBxVffVpcmT2rgpW8Cjs0khhsoGGRSkeLSA6bQvEM2mcfDMm
	2T3VvEH1PYgrHhEKyqpwcDuNa3pJUBrUH0ELnoRhsJshGaWYjdvicnyxohu5SmUnRZlH8Nf3+rzRg
	S6GgxFbwOI+93la6eFNGU+sCm4Gxuvx80iFKP5HkWlViC3GA/gB/UsNJFzkPNgE8vSLleo2MprGUF
	tBj7KU+CZXHkGuZNT2ZLwmOOohWuZF3SzYRjC91YIVp+urgw3fBdU4HIheLT51BFMYozpo6YKnn8s
	HWwuMU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSIU-00000009Zf4-15Gi;
	Thu, 12 Nov 2026 10:44:50 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSIP-00000009ZcA-2PSu
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:44:47 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6181392eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480285; x=1795085085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=CICN3gWg03HG5xCWOfc/tz6iyKeWKRtgDBnmzh5AZUSwTLu6lN11Ej8m1tXe6GigqH
         GCOoxhnqswzXK9T9AIHp7EW5dPuGA+eT4Qxn4NxAS5VxhxM9rp3Rnxzoog6jmCnRmOa4
         ww+en4sgAKgmyCMrrmjJtZBuou3NH0et01kzEo5GZiktlmt3lyw/5XqUh0ElPfN1p1ki
         /Gst1EbBkSgeU8wz1eP2B6x/M8CcM/JnEUg7M8jPP++WURUL2toYe+n8sOqoKjVbl3VD
         5stTO6B/nvB/gNQydCz1uYAMgj0xbIzMuD/bFH/VzAI+dHWfIuy3NwzsBsLA74faETnb
         LwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480285; x=1795085085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=A4LM+U4zNCPc4KaHWml2QuxskNpLRdOJ3XCViHu6CUtIIbW1lORssHt91gp/nx+tQz
         Ha/VmR3iKVMpwPiZtXdczovXZVHDx1z5VVKKaLfiPYNcgDqd6xvKfUGz35Z5fWjqf7ZY
         Yf06DnlUKTN+rlrXEeTK7NiQq7MetkD9GCCN5eCH7JOuV2KRLe1LpCDojd24x2MTWwhp
         lX6BFr2YAYe+aUrKKIrPhaJsrNDedu2lpEwCJtfoKfcs4bhcw+HoR2gYpFb6MD7z5WeJ
         Rfqf7Jxau9jnmBgxIzQcAsJydt+5PrZAecjyibcX50kSLi2ePBFJdpcQOCrDxZONNFSs
         15ig==
X-Forwarded-Encrypted: i=1; AL+hErH7XHNA7q4a4CF/8hcGBKYNJXUNpvDhatQRRygje8uRs+4qU4lYWAAdxR3TCI6MaCUCy+ouH6XkfiSEYg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/CurWg/apGgkUdlHQjuEejtzIH4xfhpcBqZ35ITKrzExdFTabN
	M/VuVq7eNajl4vuDT4dNZ54VTvWkn28VXhqaQI5O1Xc630Y9QZ/A+ekqrmPj9zjuuu8=
X-Gm-Gg: AYBFou2EDEk8ToQCVSFdiTURgheFp9X0jJMYUu5pkw97h2BKfVZcJGA1lqNuSiVmoKw
	XdLskBJyWmKbgUL30YSTTQ0qaoiDTjLCsZx+fx22qgzn9ACHfyj5EtIeB/YpqvitzYzFKlJATsZ
	6IVN8f09a8jmHhYCnI/l4WDWtv80c36Z4QzWBBoW1JE/+TY/4YexNkxS5H00PKl4d1kHmp04EkV
	+5PMOXvPQ//a84UKsP82XVmivVVnToVLJMxbQ2D557R0uAm/Y2LWe+Pq6nPdYlxnUic+LNaNR2t
	zvQIBEh3UP8r7gwoPAYQer7rSwSsa2TQPsi3t6f7ittNxZ+Q/hkl4eWXFC4x9HUu48PVnKLehD5
	ecKA2SEvasihKb6MadiPdmyriEn6BMas8qcxiubYwdbx7eJWITiRXUG05aHHssV2XzMNo4z+8df
	ykSaPXKRiLls+LOP2VqWsH2lVbBkpedvJ1/iaggd1fmGgr3olefLCBcrw89Aj6cj78eMkEEHs+8
	YggGnOalQRzfEtie86gs5oFppCLsf1+NVWTwuaF0WiATbB1xj8xY75oYshPdVl+Vc7Q9sqBxPiH
	EY1Ua/snKybT9Fc+4/B/KsudSv0VUzvCa90FePoJeVOzz9a9LofI8bv5Y/SocrggLec=
X-Received: by 2002:a05:693c:6381:10b0:378:a35b:9e1c with SMTP id 5a478bee46e88-378a35b9e83mr512290eec.37.1794480284232;
        Thu, 12 Nov 2026 02:44:44 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:43 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 7/9] riscv: implement preemptible this_cpu cmpxchg operations
Date: Thu, 12 Nov 2026 18:41:47 +0800
Message-Id: <20261112104149.38589-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024445_617213_A4F4A733 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apply the recoverable per-CPU address handling to compare-and-exchange
operations. Providing this_cpu_cmpxchg() also allows asm-generic to derive
this_cpu_try_cmpxchg().

Use Zacas where available and LR/SC otherwise. Keep masked subword operands
XLEN-wide so RV64 LR.W sign extension does not affect the comparison, and
use typed helpers to separate asm-generic from the architecture cmpxchg
macro expansion.

Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 140 ++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 810f4c5eaa508..4d2fc10cbdab1 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -401,6 +401,123 @@ __percpu_xchg_case_##sz(void __percpu *pcp, unsigned long val)		\
 
 __PERCPU_8_16_XCHG_CASE(8, .b)
 __PERCPU_8_16_XCHG_CASE(16, .h)
+
+#define __PERCPU_CMPXCHG_CASE(sz, lr_sfx, sc_sfx, cas_sfx)		\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const long cmp = (long)(s##sz)(u##sz)old;			\
+	unsigned long rc;						\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas\n"			\
+			"amocas" #cas_sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr" #lr_sfx " %[ret], 0(%[addr])\n"		\
+			"bne %[ret], %[old], 1f\n"			\
+			"sc" #sc_sfx " %[rc], %[new], 0(%[addr])\n"	\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret), [rc] "=&r" (rc)		\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [old] "r" (cmp),		\
+			  [new] "r" ((u##sz)new)			\
+			: "memory");					\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_CMPXCHG_CASE(32, .w, .w, .w)
+#ifdef CONFIG_64BIT
+__PERCPU_CMPXCHG_CASE(64, .d, .d, .d)
+#endif
+
+/*
+ * Use XLEN-wide masks to clear the upper bits of an RV64 sign-extended
+ * LR.W result before comparing a high byte or halfword.
+ */
+#define __PERCPU_8_16_CMPXCHG_CASE(sz, sfx)				\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);		\
+	const unsigned long field_mask = PERCPU_8_16_GET_MASK(sz);	\
+	const unsigned long mask = field_mask << shift;			\
+	const unsigned long old_field = (old & field_mask) << shift;	\
+	const unsigned long new_field = (new & field_mask) << shift;	\
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);		\
+	unsigned long ret32, tmp, rc;					\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&	\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas, +zabha\n"		\
+			"amocas" #sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr.w %[ret], 0(%[addr])\n"			\
+			"and %[tmp], %[ret], %[mask]\n"			\
+			"bne %[tmp], %[old], 1f\n"			\
+			"and %[tmp], %[ret], %[inv_mask]\n"		\
+			"or %[tmp], %[tmp], %[new]\n"			\
+			"sc.w %[rc], %[tmp], 0(%[addr])\n"		\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret32), [tmp] "=&r" (tmp),	\
+			  [rc] "=&r" (rc)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp32), [mask] "r" (mask),		\
+			  [old] "r" (old_field),			\
+			  [new] "r" (new_field),			\
+			  [inv_mask] "r" (~mask)			\
+			: "memory");					\
+									\
+		ret = (ret32 & mask) >> shift;				\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_8_16_CMPXCHG_CASE(8, .b)
+__PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -421,6 +538,15 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 					     (unsigned long)(val));	\
 })
 
+#define _pcp_wrap_cmpxchg(op, pcp, old, new)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr,			\
+					     (unsigned long)(old),	\
+					     (unsigned long)(new));	\
+})
+
 #define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
@@ -480,11 +606,25 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 #define this_cpu_xchg_8(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
 #endif
 
+#define this_cpu_cmpxchg_1(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_8, pcp, o, n)
+#define this_cpu_cmpxchg_2(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_16, pcp, o, n)
+#define this_cpu_cmpxchg_4(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_32, pcp, o, n)
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_64, pcp, o, n)
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
 #undef __PERCPU_XCHG_AMO_CASE
 #undef __PERCPU_8_16_XCHG_CASE
+#undef __PERCPU_CMPXCHG_CASE
+#undef __PERCPU_8_16_CMPXCHG_CASE
 #undef PERCPU_8_16_GET_SHIFT
 #undef PERCPU_8_16_GET_MASK
 #undef PERCPU_8_16_GET_PCP32
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
