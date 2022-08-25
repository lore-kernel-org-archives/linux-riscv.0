Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF7FECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu5TV0JND/Qtg2wxmL+EZnOyoK297R5Q0SlAng1ohHw=; b=DT7znxFW3wndwH
	Mykz0Q7I0yBsu63DS58wiYPNh2xwjxDFUuEktiLuHuKXtP5vQ0GwbR6lQ4+rIj/+SVIK1sTOQh7Lu
	KXBu5gsu4rsd3ADqp4JJTjSujVo3SpRytXwtSLEo/YM2SUGngdaNLbAPrucBDEuG4sK67c+YFizTy
	I3Dm31yR/1qtekv3DNrDN4cdq6g4mn777lgRhzeT5dGPSAX0sdsc1QNlsZM0GoOvgmc3RkTB+Ptmm
	PeV8+BLICEeYuP70CoBTqgo3gVdtALjTGsa9xvhgDQId0PiIAJREUQUOrXDqzmja2KfASTBH5uv9u
	kb20JdpsEwMHz2peZzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMEu-004865-78; Thu, 25 Aug 2022 23:26:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRME8-0047fq-Px
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 23:25:37 +0000
Received: by mail-pj1-x1049.google.com with SMTP id z24-20020a17090ab11800b001fb2f53eeddso3763911pjq.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 16:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc;
        bh=a5nruIl0wNeupXvrAMbGBAS1GScaEkKaYOUNnuHLnXk=;
        b=MUrthn9a6RY6CpiffJkHt9EOPrKtSEGmXhqqxQ3D2qRZw+a7bNGa46Lw6wQ3BknnIy
         Nccq5f/lszbKbQJgrG/Y3TeW7LcYWHSCnV1949i35B4xTqNhw6TutpLsyYtPkh4tpQun
         8YqYEvHVdG6s/enTMEeqcr2tgcITSa5HsHiuHtd8k1okdf8J78W/3/sDX30h3JhVfrmf
         sDq9IBDxUOd9h4P2X17g89DICK0NQZ8O2oP1O3SUmdgBnpZE5Bd1EVN61k53zguEnNjY
         zxzQgf5iHjst9fKoqExYlsFYRa7aqRLWkLtfs18aJWmLVPp8Pj+CMrtVB/3l2rPzHLPo
         UUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=a5nruIl0wNeupXvrAMbGBAS1GScaEkKaYOUNnuHLnXk=;
        b=HbHPSeHgg7Z57rz8NCkRklB96r/rpjG9/QklEuN+ZtSZ6dlOmywc7kc7bDU+hSxEA2
         wDOZHzZq7PPe6bPkyNewTwQlD7WHjgBIXzReKrM/lDA1HgXdvmlR1vGDfInWk3HZFTYt
         +p25snbZoscpmWjGo4vl265F0u52cw8GXMc6gs3DmEuPFPcV9g9WH9h18OXdvUt9vCfw
         s4aFSdUJZDpUp6NJ64rZ1CewXomtIDNqkreeIRvaU89zNucXUkFRg6jczFhp/VwMBmW3
         MtdXV5bkmbJxn/1Y+2K1OEhl6GK+XaeD4xBKufPaK3doZEuX8czbhKf9SAJMNWc2v9R0
         I5dw==
X-Gm-Message-State: ACgBeo2g9eh95NSMCiXEvCEt9bZpdKh7wfyo+JnR1aRf7ilOVHE5jSqN
	72+C48nFFzlxBKrKHoOL7/8ENCHL+/M=
X-Google-Smtp-Source: AA6agR5ycc86vDkZZxz/2DKZfcSQPVYnqerGrhMoWS/DoaCwEB56TzgSv+N+GPw1ZMSLN5eesLErkDwOY7I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f542:b0:173:a8a:d7bf with SMTP id
 h2-20020a170902f54200b001730a8ad7bfmr1185847plf.134.1661469931377; Thu, 25
 Aug 2022 16:25:31 -0700 (PDT)
Date: Thu, 25 Aug 2022 23:25:19 +0000
In-Reply-To: <20220825232522.3997340-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220825232522.3997340-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220825232522.3997340-5-seanjc@google.com>
Subject: [PATCH v5 4/7] tools: Add atomic_test_and_set_bit()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_162532_910310_3986F36A 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Peter Gonda <pgonda@google.com>

Add x86 and generic implementations of atomic_test_and_set_bit() to allow
KVM selftests to atomically manage bitmaps.

Note, the generic version is taken from arch_test_and_set_bit() as of
commit 415d83249709 ("locking/atomic: Make test_and_*_bit() ordered on
failure").

Signed-off-by: Peter Gonda <pgonda@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/arch/x86/include/asm/atomic.h    |  7 +++++++
 tools/include/asm-generic/atomic-gcc.h | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/arch/x86/include/asm/atomic.h b/tools/arch/x86/include/asm/atomic.h
index 1f5e26aae9fc..01cc27ec4520 100644
--- a/tools/arch/x86/include/asm/atomic.h
+++ b/tools/arch/x86/include/asm/atomic.h
@@ -8,6 +8,7 @@
 
 #define LOCK_PREFIX "\n\tlock; "
 
+#include <asm/asm.h>
 #include <asm/cmpxchg.h>
 
 /*
@@ -70,4 +71,10 @@ static __always_inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 	return cmpxchg(&v->counter, old, new);
 }
 
+static inline int atomic_test_and_set_bit(long nr, unsigned long *addr)
+{
+	GEN_BINARY_RMWcc(LOCK_PREFIX __ASM_SIZE(bts), *addr, "Ir", nr, "%0", "c");
+
+}
+
 #endif /* _TOOLS_LINUX_ASM_X86_ATOMIC_H */
diff --git a/tools/include/asm-generic/atomic-gcc.h b/tools/include/asm-generic/atomic-gcc.h
index 4c1966f7c77a..6daa68bf5b9e 100644
--- a/tools/include/asm-generic/atomic-gcc.h
+++ b/tools/include/asm-generic/atomic-gcc.h
@@ -4,6 +4,7 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <linux/bitops.h>
 
 /*
  * Atomic operations that C can't guarantee us.  Useful for
@@ -69,4 +70,15 @@ static inline int atomic_cmpxchg(atomic_t *v, int oldval, int newval)
 	return cmpxchg(&(v)->counter, oldval, newval);
 }
 
+static inline int atomic_test_and_set_bit(long nr, unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	long old;
+
+	addr += BIT_WORD(nr);
+
+	old = __sync_fetch_and_or(addr, mask);
+	return !!(old & mask);
+}
+
 #endif /* __TOOLS_ASM_GENERIC_ATOMIC_H */
-- 
2.37.2.672.g94769d06f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
