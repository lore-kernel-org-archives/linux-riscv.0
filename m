Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF93C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbTE7zhDJI1xD4GuYOP4Hdt4Dxf0iniHltUJtx9NeuI=; b=SuHQrzgNr78+ET
	x8oXMpwM2rCnQP4a8w0xlo+s0MJa5FIk8e2jG4dh2LCjfzTl2g6RAhyJtKSvqBgfdgygbFo3/A8xJ
	lXdo5oHjpAhYNYCI8leccWKjtQGW0Rw5RJ1S4QnXdQNNP0r9wgOKQYkrDOqJlUoaZK8mohPp8hFCr
	UBgQsTonKFfQXjrbOwywBMttkijpyHUOJx8pAyzOhcdHwX7ArVA69vH71oL7nXVTFURLgZCdonW8X
	5BdVEylEbz8UZ0A2wLT/iMqChBJCQjCH50tP2QJuwINO7LRxhZ4zbNTFSsY1II+Ta7iiRJpFikyy0
	D1NQ9zRQnfkboyUSbMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjon-00000008x7c-0LNC;
	Wed, 18 Jun 2025 03:50:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjjm-00000008wLX-39DV
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:45:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23649faf69fso64065375ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750218322; x=1750823122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp8L94txKLX1tUimj0aQ6VWmmlTjnaKy7G6s2XINkmg=;
        b=f+vmW3ucz7IZYigAT/bjmYJ2WSEuqHNAfJOwqxbaNxEDVrJKA4JoAL+9QgWMReu+wk
         1/NzXRn8ipyjC52/MKA//ZeQbgDgiNpTt+GyIeWh+3xMNBOopxtcJn73ia5zQ+3KKu/6
         zChGAFSNq/X6AOVolqTdTIlqmvRVR181gETND2Z+7u/sJNDFaP8CuPauXGojIqi8qkqN
         RK0jw2X1cgNquk1cCpHc6BqRlnJqTstrYXDOsJHh9ThdL+QRNjHkT0DhdRlPfOY1G2Lw
         HcaMkPpFA2wCB6njaN3yKUDGnRmw+s06bLpe1eMiNqquzwkoaTW4W6CdnT8/CBu1RRrn
         i0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750218322; x=1750823122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp8L94txKLX1tUimj0aQ6VWmmlTjnaKy7G6s2XINkmg=;
        b=iZthVGCf1KkVr3YvHjmC4z3G9EqHcG92gONvPL3EstwMlac+ZepLzDUSezaBo6+Tf+
         ZcWBIO0QWf/EYlb4imSwhD1U3J2FOELJfVjFC8Km8YyFJkL6F+sWZTwKSkMtLBtsIzFq
         sOupkOGrFji/dX0O5LV/yV7DR1INDwo+Li9RsZZ4olFJOUZvm/trhp7ymzpIP5pTpP9f
         yEp5+AuJBUuddtuyiy5BrllqNQF4o349xXArcZTrG9zwRTmGDvLnEDy1bzv6iWRkodZ0
         8E9dVacgTBd4qGcXEAaHEK8IjP/q/3MDwIksc0hPTXBze/sUFrjsUB91YZdYIt8JStd8
         +O2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXr0AX30eKGZZUGqjzRpXMrLOhYTm2DKV9lwz/C8FyefhAnNzo5kkn2PUsCJ7r/oAd0/n53h9Y0dh8wQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdITl6PoQtIBK6cAW59z1BE2hPRb9CsjWDFPiuYWYtBCMf1znT
	XqCscZPEzxEYcuxuwEPKBeyuBnfHU6s/+noB0mE0ka9JeDE22xKmypQA3d9MTPJknE4=
X-Gm-Gg: ASbGnct+qWnpGUIthjCU4QrNYJVUECIQK3gNIjv2rExEgXvICITlN2fQi1fSoUSGfF8
	9k4QLAGMJ1j9nSguyPpw40K+pdYcn1VLC3LSgtpGAPgIb36m152nDvC2yGFJmASfr4tOT/DIAVR
	GkjNVeFQEqwzevkdFEGhZc1TeDsKMzygOqWVxFy/SvTeQZ72W4SGqFRvPW3t4EuZG0fU2pjHS69
	3cysXlkob0JpJd18NEbkJNBIREjyIIQjYSCjkH7LucvB2qpN7erIPWirO6+CJ1rupwcMGdtA7l4
	42D9q3bY1lbAV4gSo1MnsxqUM5gK+PQ32dbOg8qxaRt4s+QH6xb82IgwgmbkoIHQ6UJLvn0slgD
	AKFLJRpwJqapilzdyuM/v
X-Google-Smtp-Source: AGHT+IEA0+X7Rq7uEiWaNQh9VQpdhXbmkqBls8uQoP0FInjy3wJkHVsazcz6bn1o9ZKNOUFg3FwI3Q==
X-Received: by 2002:a17:902:ec8a:b0:235:f143:9b07 with SMTP id d9443c01a7336-2366afe98a9mr233361965ad.5.1750218322135;
        Tue, 17 Jun 2025 20:45:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1ab8sm89333465ad.84.2025.06.17.20.45.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 20:45:21 -0700 (PDT)
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
Subject: [PATCH RFC 2/2] riscv: introduce percpu.h into include/asm
Date: Wed, 18 Jun 2025 11:43:28 +0800
Message-Id: <20250618034328.21904-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250618034328.21904-1-cuiyunhui@bytedance.com>
References: <20250618034328.21904-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_204522_788422_1A01F5E2 
X-CRM114-Status: GOOD (  10.32  )
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

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 138 ++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..423c0d01f874c
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
+	"amo" #amo_insn #sfx " zero, %[val], %[ptr]"			\
+	: [ptr] "+A" (*(u##sz *)ptr)					\
+	: [val] "r" ((u##sz)(val))					\
+	: "memory");							\
+}
+
+#define __PERCPU_AMO_RET_OP_CASE(sfx, name, sz, amo_insn)		\
+static inline u##sz							\
+__percpu_##name##_return_amo_case_##sz(void *ptr, unsigned long val)	\
+{									\
+	register u##sz ret;						\
+									\
+	asm volatile (							\
+	"amo" #amo_insn #sfx " %[ret], %[val], %[ptr]"			\
+	: [ptr] "+A" (*(u##sz *)ptr), [ret] "=r" (ret)			\
+	: [val] "r" ((u##sz)(val))					\
+	: "memory");							\
+									\
+	return ret + val;						\
+}
+
+#define PERCPU_OP(name, amo_insn)					\
+	__PERCPU_AMO_OP_CASE(.b, name, 8, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.h, name, 16, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)			\
+	__PERCPU_AMO_OP_CASE(.d, name, 64, amo_insn)			\
+
+#define PERCPU_RET_OP(name, amo_insn)					\
+	__PERCPU_AMO_RET_OP_CASE(.b, name, 8, amo_insn)			\
+	__PERCPU_AMO_RET_OP_CASE(.h, name, 16, amo_insn)		\
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
+#define this_cpu_add_1(pcp, val)	_pcp_protect(__percpu_add_amo_case_8, pcp, val)
+#define this_cpu_add_2(pcp, val)	_pcp_protect(__percpu_add_amo_case_16, pcp, val)
+#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
+#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
+
+#define this_cpu_add_return_1(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_8, pcp, val)
+
+#define this_cpu_add_return_2(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_16, pcp, val)
+
+#define this_cpu_add_return_4(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
+
+#define this_cpu_add_return_8(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
+
+#define this_cpu_and_1(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_8, pcp, ~val)
+#define this_cpu_and_2(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_16, pcp, ~val)
+#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_32, pcp, ~val)
+#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_64, pcp, ~val)
+
+#define this_cpu_or_1(pcp, val)	_pcp_protect(__percpu_or_amo_case_8, pcp, val)
+#define this_cpu_or_2(pcp, val)	_pcp_protect(__percpu_or_amo_case_16, pcp, val)
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
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
