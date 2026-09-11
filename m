Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198ABC88E45
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GeNMEXA8dLtI5NqluNpMIHgA+CL59NcTVFIzvBdA2u8=; b=i1v4T+9VGetiGMb8nJx1mYAznZ
	QaLboXSQE7kAn0/LBQSpQTjhXUaGdwmWyBQexEBBn6H6lu4y8vVWQdaTKDaVUrIKziSbywDJQOm11
	PgDrAaSf4lIE+NDGpzyU+kiqUaN6zjJNNrTw/Bh8S6+xE92D8WUGiOxwVFUVhePy+i27TeegCuf7W
	BZIeuBswrVCCcpFS+L4vPNHa7DFdblQ/swSm9DJwXZUYlaXMyDrDogLak0hvT0LqYcKk1HN1UUka7
	w7/j5g0lRGyFtnrgcEJmGSkiR30omLiqDZkoJK5lXEQvcJd5HwD7QMKETo64h8kr4Dpqh4jnJXDHx
	JczD4noQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJ3-0000000FzO5-0YG0;
	Fri, 11 Sep 2026 07:04:17 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJ0-0000000FzNT-2GD8
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 07:04:15 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2dcfed75f77so8096445ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110253; x=1789715053; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4log2b7lXSyNC0NL5JxC6rtxmWq5NdYaV3uhGWFgpQ=;
        b=nOtYjXqoykjWAdsYEPIMvNZjPLnd7R9H9Vqn5h0jCLuFB8Y3yTqtO7F/PSxJMfz4iK
         jf0SAW1fjOWywcL+Gg7XPjkQ9eKkLUYwO02tjzNCorYhBBJ+C26wjAwVQHfrPgKNT7lI
         kQBoneY5LyZJ3RiZcSsRlnDaUX/15uV9qLtRZ+f/tJtpDSBZUtws+HrJ1y1eoAOJTzZJ
         wSa2DBAT6aDC+gvrj02/+xw1gCyLHBVPDLZBD41cSphwmv7+8YJ6bXgc4OZvTIA7KqeX
         myA/24LOrB3EhneDvSEXaapWc0rzppXv2jaFc7o2HB4j2h4YorvTYaJ6H87WpVFQnDl3
         w4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110253; x=1789715053;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4log2b7lXSyNC0NL5JxC6rtxmWq5NdYaV3uhGWFgpQ=;
        b=sS9GXK6x0V/dgyRB8ixFhimBj6QzItpyQpwaWikTS0d2PGmfADnZmqhsfuDtvdZD/o
         De4eiqNl2KNw5rzeNAmQHSwGR0ovw6hrNnzdM2DRxwHlHQqso3L58jqVAzVInIi+aI3U
         czwwuOTZvolp4njXU855WTCosLMUFFdZ/6ujaH21sBuWja/6oV276L9qWaUkF+g+IheO
         p1MiZGuTSDcuzw4AcJjzwjdazuYYwDhgytS+gxLI1Byuvo5EqSILot/Bb4MzFYTvT4gS
         Lb4oW6XnjSYVNoR/066UxoKE8uHts5dZq19H7wUvNQPyGoUe9PWjXOwImmk859bxY0qO
         Ehyw==
X-Forwarded-Encrypted: i=1; AKwUvByTTPfw4/RkpopSEouaV+v2mPLa9xhcZO4Ru34Kilw0gJty/lIhM69TIlL9EFTwAn9ZtGv3rtxwci3dcg==@lists.infradead.org
X-Gm-Message-State: AFuF++kAU8MZwmsIYDQXEkuMCevJNXXFhysVKyZi2z9snFoDP2HUdjci
	ms7nNkw4ASpqLUAkmxVyl3SDQ4Zbu3L/cpmaFW48P8btDwrrwmkpDoCC5biDt2I6qw9lKDUZVd2
	7
X-Received: from plbmm11.prod.google.com ([2002:a17:903:a0b:b0:2db:34ec:27e6])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2983:b0:2db:257c:9fd5
 with SMTP id d9443c01a7336-2dd2a35dd2bmr69446655ad.16.1789110252766; Fri, 11
 Sep 2026 00:04:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:40 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-3-morbo@google.com>
Subject: [PATCH 2/7] x86/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Collingbourne <peter@pcc.me.uk>, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000414_587352_D1ADD354 
X-CRM114-Status: GOOD (  19.35  )
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

load_unaligned_zeropad() is implemented as inline asm plus an
exception table entry on every architecture, so the compiler never
sees the actual memory access and cannot emit KASAN/KCSAN
instrumentation for it.

Resurrect the instrumentation that was lost when migrating from
read_word_at_a_time() by renaming load_unaligned_zeropad() to
arch_load_unaligned_zeropad() and adding a common instrumented
load_unaligned_zeropad() in the new
asm-generic/word-at-a-time-instrumented.h, pulled in from the bottom
of asm/word-at-a-time.h. This mirrors the existing
arch_atomic_*()/atomic_*() split in linux/atomic/atomic-instrumented.h,
where the arch_* version is the raw, uninstrumented primitive and the
plain name is the instrumented one everyone should call.

The wrapper is __always_inline, so it compiles down to exactly the
same inline asm as before plus instrument_read() -- confirmed via
objdump that no calls or relocations to load_unaligned_zeropad(),
instrument_read(), or the KASAN/KCSAN check functions remain when
KASAN and KCSAN are both disabled.

Convert x86 to the new split here. Follow-up patches convert the
remaining architectures (arm64, arm, riscv, s390, powerpc) that
implement load_unaligned_zeropad().

Fixes: d94c12bd97d5 ("string: Add load_unaligned_zeropad() code path to sized_strscpy()")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Kees Cook <kees@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Collingbourne <peter@pcc.me.uk>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
---
 arch/x86/include/asm/word-at-a-time.h         |  4 ++-
 .../asm-generic/word-at-a-time-instrumented.h | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/word-at-a-time-instrumented.h

diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 422a47746657..483d27dc96b2 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
@@ -81,4 +81,6 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif /* _ASM_WORD_AT_A_TIME_H */
diff --git a/include/asm-generic/word-at-a-time-instrumented.h b/include/asm-generic/word-at-a-time-instrumented.h
new file mode 100644
index 000000000000..8a66d53bf538
--- /dev/null
+++ b/include/asm-generic/word-at-a-time-instrumented.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_WORD_AT_A_TIME_INSTRUMENTED_H
+#define _ASM_GENERIC_WORD_AT_A_TIME_INSTRUMENTED_H
+
+#include <linux/instrumented.h>
+
+/*
+ * Each arch's asm/word-at-a-time.h defines arch_load_unaligned_zeropad()
+ * as inline asm plus an exception table entry, so the compiler never sees
+ * the actual memory access and cannot emit KASAN/KCSAN instrumentation
+ * for it. Provide the common, instrumented load_unaligned_zeropad() that
+ * every caller uses by wrapping the arch version with instrument_read().
+ *
+ * This is marked __always_inline, and arch_load_unaligned_zeropad() is
+ * itself a tiny inline-asm-only function, so this compiles down to the
+ * same inline asm as before plus instrument_read() (which itself compiles
+ * to nothing when KASAN and KCSAN are both disabled) -- no actual call.
+ */
+static __always_inline unsigned long load_unaligned_zeropad(const void *addr)
+{
+	instrument_read(addr, 1);
+	return arch_load_unaligned_zeropad(addr);
+}
+
+#endif /* _ASM_GENERIC_WORD_AT_A_TIME_INSTRUMENTED_H */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
