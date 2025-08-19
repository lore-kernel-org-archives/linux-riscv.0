Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E9ECA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/Z8u2Za0INlbLEaIPZRxjJj89vtzghJfSqxDUTE5m8=; b=inmA5hsR63FfZK
	WmqvIJNUUlwemqAo/VgmtNdk5tC1pqI2Yn5QYpK7l2owJy5h8+24CSZSmalflXMNN/erpgcH6zOXy
	n1XhzdQjaTWzsHeJWS1a3g2lMggDvx3ZOuKjToaqbpbPESsLeTLN1kKhWYGKnZSjMZseJgcfju/sU
	3HAEKZSQ0qf7goEiDxHU/X41Zy0kxA85vuWKIyPA0Yc2RojkWNsO2IBbudgsSt3bQeugjCQ3sR/6S
	xMhFs4w5r0/pKMNeTS75T5lnIgoDV6H2rWYgp0c7PVMdi7cM/8mDprCa8Lx/GgWuvVeHbBORytbTc
	9f7mO+J+lbVRuI0pT51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrC-0000000BELS-25qC;
	Tue, 19 Aug 2025 18:14:50 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMjO-0000000Aezd-0RkB
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 13:50:31 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso627491a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755611429; x=1756216229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwTW7izUdo6CYD8//HAPF56SDtcFaT3RKPdG1y/WRl0=;
        b=kaNCJ7XDkIGmov5tOxuqim1dBXLIl4HB6Gs79uiLPKBI2WQtp0PBGHXIlLwqdfWkWn
         dW7JcZqaxLpEt7dAfKD4wGCphBCDhWxTLDBJOZqZxVUzqjIHjrGOijwQEIBOyFH54cmC
         /rRlRnj0QDi1MJVpkGqBj+YQM9zi3EpoJVLn3gBzjiOt+TziHGb79bNVAHCJCZc5W/fJ
         5dH1sncVWgt08GtzNoiAI7kgICRs1K+raFoDZyKV8B07asTpmC8McfE7sbnQJmy5wdy+
         aO4/tIUmmMH0mDS8HUr8X7yhc804drktNyVw/JixreQITnfduwTCPsVXzDNtB3id9lPG
         tKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611429; x=1756216229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwTW7izUdo6CYD8//HAPF56SDtcFaT3RKPdG1y/WRl0=;
        b=EpKRPpM4/TAfG7QddLaTIJyb1F8gudv5ZmNDJcf7BHUBTCs1t0f24bvkFMmAPsVSMy
         6mKlWzhahuvFVMI1w2a1/C0+g7aR/UHDLUS4/azV3z5bbWsgxLEUbMGJncAdUFityc1s
         5TVgv08wVZ9IaDmKIOVMkw/vV+WUAUQOiYHVnY2HfQUqsJWj9WjBQ/vNWxjc8qNIzmGy
         TCwTj+evh+tsDhxR9IMyknlIQF3t4qSyrmbXu+dk+SnL2OO2UVSDwg4sY3wlMKoSrVo/
         ZsKxCnupp2X6vqyFsT/bGRnELyOIX9BYX4pjEM+WA9E5tP1b878Ky+FIiP3h5l6FM8OE
         sM0g==
X-Forwarded-Encrypted: i=1; AJvYcCXRPj8ofkuAl1+w/NKsq2A86z2kUmIFHtJBwhStfXdUi8MLhv27OvLyxN2tvbKMi7iq9U5w0ixl4KdJCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyacM0t703TJ2emYwhtBu5pWJ+dFfpiUysQniPjjuvkcYORYj22
	WDa51750gT+4ryvUAIhEaXZqaPlBi9H0xHXIwSCrLs4/+o938Re1gS0Y8hrYYoRg0NQ1royvMnX
	6suS0j6c=
X-Gm-Gg: ASbGncsL36goOnU6mubKcL2N1/76QOgW43slQKCZI6l3YwArR1i60oUIldxTmtzmEF9
	6mafiojol7CT2k94PZn2Ldrt98yEXFM8sSkBeDeTVWcKzgSAqWS/vE5ybHtIG+hRFcvghWOroe0
	LxkJBu3qRFVvVl2VcRDbvpxmUsJDFhxd4nb1+ZQjFvM1hriO+DYmJJMSq5Rq6nCM21ggTOme0Nz
	+uImjqyN2DgfG/jYWbVz+usHiQJtEMymZPVUPOqYL/GCKZj142gIZg4suVdPSrpFVDzLhgCqLPe
	uGHIIdcDm3KccFo16oUcITrupxHKfP3PlXyuNb9eRno+0WmdOyZcUOY4eDwyQO9jkHZW/22kZp1
	vjf4Sl6Yw5E55se/ZDI0V/lewjT/MzzEBaaS5f7CE+hw4hjW+KwJQdNxK
X-Google-Smtp-Source: AGHT+IG3M4152x1Qa0AohjmhQrhbPKACbweaZeZYf2EtQOf2Ag/TgiWDxzHEJsq3FzMfjcT7SEZo1A==
X-Received: by 2002:a17:902:e545:b0:243:8f:6d7d with SMTP id d9443c01a7336-245e04e232fmr28790075ad.50.1755611429240;
        Tue, 19 Aug 2025 06:50:29 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5533c4sm109937815ad.140.2025.08.19.06.50.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Aug 2025 06:50:28 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH 2/2] riscv: introduce percpu.h into include/asm
Date: Tue, 19 Aug 2025 21:50:07 +0800
Message-Id: <20250819135007.85646-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250819135007.85646-1-cuiyunhui@bytedance.com>
References: <20250819135007.85646-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_065030_146615_92BA0C85 
X-CRM114-Status: GOOD (  11.64  )
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

Current percpu operations rely on generic implementations, where
raw_local_irq_save() introduces substantial overhead. Optimization
is achieved through atomic operations and preemption disabling.

Since RISC-V does not support lr/sc.b/h, when ZABHA is not supported,
we need to use lr/sc.w instead, which requires some additional mask
operations. In fact, 8/16-bit per-CPU operations are very few. The
counts during system startup are as follows:
Reads: 8-bit: 3, 16-bit: 3, 32-bit: 1531, 64-bit: 471
Writes: 8-bit: 4, 16-bit: 3, 32-bit: 32, 64-bit: 238
Adds: 8-bit: 3, 16-bit: 3, 32-bit: 31858, 64-bit: 7656
Add-Returns: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 2
ANDs: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 0
ANDNOTs: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 0
ORs: 8-bit: 0, 16-bit: 0, 32-bit: 70, 64-bit: 0

hackbench -l 1000:
Reads: 8-bit: 3, 16-bit: 3, 32-bit: 1531, 64-bit: 2522158
Writes: 8-bit: 4, 16-bit: 3, 32-bit: 34, 64-bit: 2521522
Adds: 8-bit: 3, 16-bit: 3, 32-bit: 47771, 64-bit: 19911
Add-Returns: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 2
ANDs: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 0
ANDNOTs: 8-bit: 0, 16-bit: 0, 32-bit: 0, 64-bit: 0
ORs: 8-bit: 0, 16-bit: 0, 32-bit: 70, 64-bit: 0

Based on this, 8bit/16bit per-CPU operations can directly fall back to
the generic implementation.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 138 ++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..5a1fdb37a8056
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+#include <linux/preempt.h>
+
+#define PERCPU_RW_OPS(sz)						\
+static inline unsigned long __percpu_read_##sz(void *ptr)		\
+{									\
+	return READ_ONCE(*(u##sz *)ptr);				\
+}									\
+									\
+static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
+{									\
+	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+}
+
+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
+static inline void							\
+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
+{									\
+	asm volatile (							\
+		"amo" #amo_insn #sfx " zero, %[val], %[ptr]"		\
+		: [ptr] "+A" (*(u##sz *)ptr)				\
+		: [val] "r" ((u##sz)(val))				\
+		: "memory");						\
+}
+
+#define __PERCPU_AMO_RET_OP_CASE(sfx, name, sz, amo_insn)		\
+static inline u##sz							\
+__percpu_##name##_return_amo_case_##sz(void *ptr, unsigned long val)	\
+{									\
+	register u##sz ret;						\
+									\
+	asm volatile (							\
+		"amo" #amo_insn #sfx " %[ret], %[val], %[ptr]"		\
+		: [ptr] "+A" (*(u##sz *)ptr), [ret] "=r" (ret)		\
+		: [val] "r" ((u##sz)(val))				\
+		: "memory");						\
+									\
+	return ret + val;						\
+}
+
+#define PERCPU_OP(name, amo_insn)					\
+	__PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.d, name, 64, amo_insn)
+
+#define PERCPU_RET_OP(name, amo_insn)					\
+	__PERCPU_AMO_RET_OP_CASE(.w, name, 32, amo_insn)		\
+	__PERCPU_AMO_RET_OP_CASE(.d, name, 64, amo_insn)
+
+PERCPU_RW_OPS(8)
+PERCPU_RW_OPS(16)
+PERCPU_RW_OPS(32)
+PERCPU_RW_OPS(64)
+
+PERCPU_OP(add, add)
+PERCPU_OP(andnot, and)
+PERCPU_OP(or, or)
+PERCPU_RET_OP(add, add)
+
+#undef PERCPU_RW_OPS
+#undef __PERCPU_AMO_OP_CASE
+#undef __PERCPU_AMO_RET_OP_CASE
+#undef PERCPU_OP
+#undef PERCPU_RET_OP
+
+#define _pcp_protect(op, pcp, ...)					\
+({									\
+	preempt_disable_notrace();					\
+	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
+	preempt_enable_notrace();					\
+})
+
+#define _pcp_protect_return(op, pcp, args...)				\
+({									\
+	typeof(pcp) __retval;						\
+	preempt_disable_notrace();					\
+	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define this_cpu_read_1(pcp)		_pcp_protect_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)		_pcp_protect_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)		_pcp_protect_return(__percpu_read_32, pcp)
+#define this_cpu_read_8(pcp)		_pcp_protect_return(__percpu_read_64, pcp)
+
+#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+
+#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
+#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
+
+#define this_cpu_add_return_4(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
+
+#define this_cpu_add_return_8(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
+
+#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_32, pcp, ~val)
+#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_64, pcp, ~val)
+
+#define this_cpu_or_4(pcp, val)	_pcp_protect(__percpu_or_amo_case_32, pcp, val)
+#define this_cpu_or_8(pcp, val)	_pcp_protect(__percpu_or_amo_case_64, pcp, val)
+
+#define this_cpu_xchg_1(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_2(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_8(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+
+#define this_cpu_cmpxchg_1(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_2(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_4(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+#define this_cpu_cmpxchg_8(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
+
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+({									\
+	typedef typeof(pcp) pcp_op_T__;					\
+	u128 old__, new__, ret__;					\
+	pcp_op_T__ *ptr__;						\
+	old__ = o;							\
+	new__ = n;							\
+	preempt_disable_notrace();					\
+	ptr__ = raw_cpu_ptr(&(pcp));					\
+	ret__ = cmpxchg128_local(ptr__, old__, new__);			\
+	preempt_enable_notrace();					\
+	ret__;								\
+})
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
