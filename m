Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ABB606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hzg1UGfr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=P59tH+5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=klADzHu0gQ1vKZ1dlbvClHAtbA1yv3/IA2d001zxkjQ=; b=Hzg1UGfr8PBGFCNMWs0mJMXmpo
	XV4HptUjGVGCqWNKhcvna41f2CJqJTeYTz6pxOUSoBLuVXOFeDi/UGOZ1ElPa3wKC9Kt9yGyI0zAa
	ci8cRS5+Fy4Ss1aVCDM0C3ooQScuyX+xRoPgQAybdXqSrmaf4UKhDZMcsmYdQTf9s749rvXBRMMo8
	KvglRDq40R5XcinDk1swO9NDMyz/pQeDj97KQu7jrHo2QIE+waIK+YeSv47yLP+jgReYCa3PNcFeF
	mH7fo9pMZlhGTBmPSvWD8CV5xu85TyD557XtjlqPNYxbytjzE7k9wRmaGBbXVw2W3s3lJQbykAhnz
	YTmq9iDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSHp-00000009ZOO-3bnJ;
	Thu, 12 Nov 2026 10:44:09 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSHm-00000009ZMK-1Fi0
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:44:08 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3714592eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480245; x=1795085045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=P59tH+5SJMNI1wCkfIZSaH1BjTDlEBlJXbGthb8ailr4tvaHDgNYBaX9bVUqPbmi+s
         keq+xl2378rQtizC5gAnnIfvaRtCSItFchF1VMa2mFycJAKLFq/my2ieIFTPdCol6LON
         WFAHtCEH67dJylbg7qDjfNHSD7E5UnUqAwqX/q8BDdSI4q9IfnngAVgVXAT2bU3uHjLf
         hBUIyZS6o2IEEStvYaH5I3vjL+siKcSHUuNtnTzMwgLX8gWzRQeG+k/rmN2OeUAiQkbS
         26oBinEPIOLdv27zU75P3svGnAG6zYc8oRoFHB/hZGntq4dGIDwDX+XJPl7t9QiU5IRx
         /bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480245; x=1795085045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=tbxRGDFB9MfOSSM842/voONYMpiPmS+Z6ek4oOkbyQGpF5lv/TCg3qhkYxVTQIgdKK
         Aya2Qw6kc4D0Ds5l/gngJVj+Y3lq0bbNryMbXbJzilC/TljLYPtUasHRQsPAK2nuOsf9
         M1pc3vyDdqOhdLK5+Z8BHdzvGVmMaRsQzyTBN+uEv5ZVt0DSEg6RpuP9opHiEVu+M5xS
         QclitM8voGUPkbhKYR/dWhLhw8yVcJAt15oZSaRMv4x4zrmmp7aOEU0pl5eoxJg2VM2E
         72ANjbeE/mMsRS4p1ZZaFoOelhJrLzl+aNbj0EhNjDLGrFRg9Guggn2B9aBFjImeYd3h
         URpw==
X-Forwarded-Encrypted: i=1; AL+hErGZdtmr+BIcYNCeu1KHXaskpmkP3oYbsgwEytG3L3SRXsEMe4X49kocxrYJsuiiz03VSLTjxtOBBhK/4Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/KwRhBirZdUk+yispAKjBXbwHTyAj0RJ+gU1TvrqJ8m2LMTuHN
	c/HpMfPLvRujKevNUI0HoAQ7WeAe8JBmLS76Cj3T4ytWnX/RgUen9l/hZhXpFkCcKZs=
X-Gm-Gg: AYBFou1R/GUV6R2PImmNgZoxIBs7BpO3sX1OhNGqI0dsznJm1kHovb+g6Y+PxALnEPd
	L4MeR0FVX4pepeB1YGhyYtURo4qlqQ7VH73/fEyLYOichw++lcVVwSI9it1l4Gn8WuhL48lv31S
	AhwPqNFgYbmKUiUtT31w7cU3ECWLFnIXIbBy9MtJaZIkR8DIBKWwj89E8oFrUYkVcl3sOoJZllY
	6vIxSZxnG0wa20lAgUo/sxgjhBs4oasSZAPurIoufh/Zqh335nJSHnlPblGhSRo6aKJkHO+5efn
	AmBYiV5DFLjaiA4j7IyQjN/Y/2EKO126cmiOtA+EBwFifhr2h6lSs9qvptD14sN861OuilKdIpM
	QW/fn18CTCN5g0UR1xfD0sDeiqLn2BQ7VBkExkV9zblAa3sAlYWKi1JfSJTubguOzcL8psaK8PH
	myj7itn8+XwE9NN60l3d9PC3O3oRP2x+Z/WoWPwrCpouN3LRpwFy2JK1AsLRH3o//9XEtCNcerP
	1a8hUzxnAwswqnLGR3CEhcT7XwKrkmilSztMxFNAt9nNFKtm7Se6ChJre1XBW/TANv4IDO++eua
	jlGK1Kmsz4mxoh8cETJRxJ3SOW7Njpi0usH0OTGFhH3Zra/03kECIOaopsCHkQjR8cE=
X-Received: by 2002:a05:7301:d80b:b0:375:370e:f1ff with SMTP id 5a478bee46e88-37687214128mr6314130eec.35.1794480245214;
        Thu, 12 Nov 2026 02:44:05 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:04 -0800 (PST)
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
Subject: [PATCH v10 5/9] riscv: implement preemptible this_cpu add_return operations
Date: Thu, 12 Nov 2026 18:41:45 +0800
Message-Id: <20261112104149.38589-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024407_194314_DCA10737 
X-CRM114-Status: UNSURE (   8.53  )
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

Apply the recoverable per-CPU address handling to add-return operations.

Native-width AMOs return the old value, so derive the new value required
by the percpu API from the operand. Use Zabha for subword operations when
available, or a masked LR/SC sequence that returns the updated field.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 46eafa1ef02a1..9ff02f3811550 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -203,6 +203,129 @@ __PERCPU_8_16_OP_CASE(and, 16, .h, and, "and")
 __PERCPU_8_16_OP_CASE(or, 8, .b, or, "or")
 __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 
+static __always_inline u32
+__percpu_add_return_amo_case_32(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u32 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.w %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u32)val)
+		: "memory");
+
+	return ret + (u32)val;
+}
+
+#ifdef CONFIG_64BIT
+static __always_inline u64
+__percpu_add_return_amo_case_64(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u64 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.d %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u64)val)
+		: "memory");
+
+	return ret + (u64)val;
+}
+#endif
+
+static __always_inline unsigned long
+__percpu_add_return_8_16(void __percpu *pcp, unsigned long val,
+			 unsigned int bits)
+{
+	__PCPU_OP_CONTEXT();
+	const u32 field_mask = GENMASK(bits - 1, 0);
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);
+	const u32 mask = field_mask << shift;
+	const u32 val_trunc = val & field_mask;
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);
+	u32 old, new, field;
+	unsigned long ret;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		if (bits == 8) {
+			asm volatile (__PCPU_GPRS_BEGIN
+				".option push\n"
+				".option arch, +zabha\n"
+				"amoadd.b %[ret], %[val], 0(%[addr])\n"
+				".option pop\n"
+				__PCPU_GPRS_END
+				: [gprs] "=m" (__ti->pcpu_gprs),
+				  [off] "=&r" (__off), [addr] "=&r" (__addr),
+				  [ret] "=&r" (ret)
+				: [pcpu_offset] "m" (__ti->pcpu_offset),
+				  [pcp] "r" (pcp), [val] "r" ((u8)val)
+				: "memory");
+			return (u8)(ret + val);
+		}
+
+		asm volatile (__PCPU_GPRS_BEGIN
+			".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[ret], %[val], 0(%[addr])\n"
+			".option pop\n"
+			__PCPU_GPRS_END
+			: [gprs] "=m" (__ti->pcpu_gprs),
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),
+			  [ret] "=&r" (ret)
+			: [pcpu_offset] "m" (__ti->pcpu_offset),
+			  [pcp] "r" (pcp), [val] "r" ((u16)val)
+			: "memory");
+		return (u16)(ret + val);
+	}
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"0: lr.w %[old], 0(%[addr])\n"
+		"and %[field], %[old], %[mask]\n"
+		"srl %[field], %[field], %[shift]\n"
+		"add %[field], %[field], %[val]\n"
+		"and %[field], %[field], %[field_mask]\n"
+		"sll %[field], %[field], %[shift]\n"
+		"and %[new], %[old], %[inv_mask]\n"
+		"or %[new], %[new], %[field]\n"
+		"sc.w %[new], %[new], 0(%[addr])\n"
+		"bnez %[new], 0b\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old] "=&r" (old), [new] "=&r" (new),
+		  [field] "=&r" (field)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp32), [mask] "r" (mask),
+		  [shift] "r" (shift), [val] "r" (val_trunc),
+		  [field_mask] "r" (field_mask), [inv_mask] "r" (~mask)
+		: "memory");
+
+	return field >> shift;
+}
+
+static __always_inline u8
+__percpu_add_return_amo_case_8(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 8);
+}
+
+static __always_inline u16
+__percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 16);
+}
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -256,6 +379,17 @@ __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 #define this_cpu_or_8(pcp, val)		_pcp_wrap(__percpu_or_amo_case_64, pcp, val)
 #endif
 
+#define this_cpu_add_return_1(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_8, pcp, val)
+#define this_cpu_add_return_2(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_16, pcp, val)
+#define this_cpu_add_return_4(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_32, pcp, val)
+#ifdef CONFIG_64BIT
+#define this_cpu_add_return_8(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_64, pcp, val)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
