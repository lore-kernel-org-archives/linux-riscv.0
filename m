Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE3C32774
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 03:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUgEnsLG3dECmqXJVlGnUMKaaz/TLc6SywlKX8nSSk0=; b=bb+CHEH2XWhY+n
	4wQunNnb/FBwuT3gNBa47TwR7fy/i7akwZYpD6aWL1k0b0vXsXKkcFoiHQS1M0efLe2PSnUE2SXo4
	T3SzGciw7ud5CCGwzLwGTFanE3VCzRdUsFMsYctAriiVSOraxa0dBk986MiwaZkPbNq/e97mUIQi9
	AVGy8t7HEUKL42ckhIDQl/Xm2Ba881BWBEwBVakPmlqDNz/Liw8x0K7B75HXusvW20Fth+B0iuYXW
	GSiCjUNLkJcDxd/0ft4nb1LhPeu5EQOKRfPjQHEj07Dgq/0Kf6RL7wjrGQmcYm9+br/SETbVvHU5C
	IsEnQZz0RSzRA1rOWdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgyX-00AD1h-Rr; Wed, 24 Aug 2022 03:22:41 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxL-00ACPp-Bb
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 03:21:30 +0000
Received: by mail-pl1-x649.google.com with SMTP id n8-20020a170902e54800b001729df300d7so10184331plf.18
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:from:to:cc;
        bh=DiPDkyCUU5+qWi0FAGBrmfRDeC2PU2rAf87l6jKus4Q=;
        b=XvXBevlrlAqE9wagoH125syNrQYxrpHCiRlRfiVQtu1MdNipV2GG0TAviWCkY42kue
         40hfNKd+srF0kxrbk+L6cIyjcvRD8ldiLVaaVnTF7/0DWZuQLDQlKmMKu1ugP09CeNj6
         VfX9VSOzSDrnlZamHjfahcZ2qWLNHssJ6Tq+/c4s295toNWRhLpMaKG2PErS9+FS8eu/
         nEwvow02yLb8KzgPd+H/QmXmd4FUVqVHY6f7qsUkwmsM976gLKCuj3wk6E+/Ec1o7Qk2
         rSKdgFoFxqyd41Hj6wSl65wgpFaa3s0g/kZVmRXjxDr+uNytf2U5o026FzYj9bwJFc5X
         barw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=DiPDkyCUU5+qWi0FAGBrmfRDeC2PU2rAf87l6jKus4Q=;
        b=JQzAn3/GVAhtecDOwvYj9TyqlLEIEGTuaIGi1MOVcl75mqBwh8fNcIQiBNYHyYLgoD
         HJtOMHAdca5k6U+AtOCfZso8djOCsYOcJINsJmYWZhRxuC3UhMm95iYOXigiJyrpObzA
         pSP8LaeP4m9pOVMvA62LP+YW2nu0zxOkKoLPqs5V8qR1XShgLs/jBVbX1JJV+iTM/6bs
         UV03XGpZjNq0ALFBbD5lFCWl18RFGKfKzXmmKuGnjmrpJucxqADeoikOzm21y5l5oKqU
         xiO1rI5ziDNy65SG+HUnqKrHR4dInXym70pf0kMW80fuaCVc6eeJou4lKpwdQIfeNVe2
         OAcA==
X-Gm-Message-State: ACgBeo0RR8pR8zxGeEoDccMhu5ZmxDvsCXuekWAWsETOa6zZBP7PG3xm
	cz7x0Y0VRA9QRn87PrG129WQ02l0U7I=
X-Google-Smtp-Source: AA6agR7hkMAlHzZjMos7RFjUz8V/HjO4UccQUnDLH/uwK3wpKW33JaEUPX9HlB35rLdBTEQmTcaewjVzFKc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:301c:b0:52d:bff9:5004 with SMTP id
 ay28-20020a056a00301c00b0052dbff95004mr27937449pfb.84.1661311285738; Tue, 23
 Aug 2022 20:21:25 -0700 (PDT)
Date: Wed, 24 Aug 2022 03:21:13 +0000
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
Message-Id: <20220824032115.3563686-5-seanjc@google.com>
Mime-Version: 1.0
References: <20220824032115.3563686-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 4/6] tools: Add atomic_test_and_set_bit()
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
X-CRM114-CacheID: sfid-20220823_202127_418781_2A697274 
X-CRM114-Status: UNSURE (   9.48  )
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
2.37.1.595.g718a3a8f04-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
