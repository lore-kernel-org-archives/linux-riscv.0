Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA9DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gxhnDRbY2lv9peao5MXD/7kTKFE7ukvnIRv98J62BU=; b=ARxYnsFYryBfHQ
	ZuZ1bHpPNQsWtf8Br3R0VquXEhnsorB1vKRtfM9hHPknwHQoHFD/cZlaGpCaYVcK6qNiPhYtTM8AQ
	yf5xmvZ/thuid/pJw/twjQ2s+gWaZCvP4t5CQZwUC3i0kQIjj4k6vIYNK18lAk4ntI8rrVc6YCl1O
	WaAfypB3scO5AF65rLQcTTm0VnX6CM3OZTE9SgkrkDgnGiZxNr54CUuDAF0PywfU4j8HiyU5E/cdo
	5URMrkp1bPkjXNQ0RMUzKJQlx5GddEGmMXpdG3/wWIugrdYjvAB5EZ4wehd9cRAM0Fp61X4stzM2Z
	HgY+kn+Zcqy4EDWvIBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSat-00Dquj-Cu; Thu, 05 May 2022 03:55:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSap-00DqrD-Qj
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:55:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7BD81B82B79;
 Thu,  5 May 2022 03:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CE0C385AE;
 Thu,  5 May 2022 03:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722953;
 bh=PFNl6xABaY2in+HPLdVvyvlQKRywP5jYrBLTCrJwmLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUpRYvGbqagkM91KCHl9lnkgT0M4jydo1Y6ta+GWU2KUqBmrdLFm8jStVLcZIFsed
 a1RIgXuZWvD+s5Y13WJ0IQrQUKU4fwTb5IpgbM3TMbXKpuM8ipOoLuqko9QFs8Ybrc
 Qh9TnQk9+vMsNht8F/daDwNtQZ8jDPd5wvWbgzB/EgDJtEvTI8ToXhDjmrVbO3puHO
 oRiB0XGP9uSm6NMcM6QhpwLZ24EMTJuKrLNUpa2Dn6+UsWJ5mCOxIrHOONSpJEvjTo
 BW1TM8HoViprvZV+l/ZWMdKFMQZAkBcEnkyYClT4Ku7p8JDwg8V/L3DpN/HVdN4r8c
 zJwNNZFNa3lxQ==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 3/5] riscv: atomic: Add custom conditional atomic operation
 implementation
Date: Thu,  5 May 2022 11:55:24 +0800
Message-Id: <20220505035526.2974382-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505035526.2974382-1-guoren@kernel.org>
References: <20220505035526.2974382-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205556_217800_A332A7D9 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Add conditional atomic operations' custom implementation (similar
to dec_if_positive), here is the list:
 - arch_atomic_inc_unless_negative
 - arch_atomic_dec_unless_positive
 - arch_atomic64_inc_unless_negative
 - arch_atomic64_dec_unless_positive

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
Cc: Dan Lustig <dlustig@nvidia.com>
---
 arch/riscv/include/asm/atomic.h | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index f3c6a6eac02a..0dfe9d857a76 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -310,6 +310,46 @@ ATOMIC_OPS()
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
+static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
+{
+	int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w      %[p],  %[c]\n"
+		"	bltz      %[p],  1f\n"
+		"	addi      %[rc], %[p], 1\n"
+		"	sc.w.rl   %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
+		"	fence     rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		:
+		: "memory");
+	return !(prev < 0);
+}
+
+#define arch_atomic_inc_unless_negative arch_atomic_inc_unless_negative
+
+static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
+{
+	int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w      %[p],  %[c]\n"
+		"	bgtz      %[p],  1f\n"
+		"	addi      %[rc], %[p], -1\n"
+		"	sc.w.rl   %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
+		"	fence     rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		:
+		: "memory");
+	return !(prev > 0);
+}
+
+#define arch_atomic_dec_unless_positive arch_atomic_dec_unless_positive
+
 static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 {
        int prev, rc;
@@ -331,6 +371,48 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 #define arch_atomic_dec_if_positive arch_atomic_dec_if_positive
 
 #ifndef CONFIG_GENERIC_ATOMIC64
+static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
+{
+	s64 prev;
+	long rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.d      %[p],  %[c]\n"
+		"	bltz      %[p],  1f\n"
+		"	addi      %[rc], %[p], 1\n"
+		"	sc.d.rl   %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
+		"	fence     rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		:
+		: "memory");
+	return !(prev < 0);
+}
+
+#define arch_atomic64_inc_unless_negative arch_atomic64_inc_unless_negative
+
+static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
+{
+	s64 prev;
+	long rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.d      %[p],  %[c]\n"
+		"	bgtz      %[p],  1f\n"
+		"	addi      %[rc], %[p], -1\n"
+		"	sc.d.rl   %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
+		"	fence     rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		:
+		: "memory");
+	return !(prev > 0);
+}
+
+#define arch_atomic64_dec_unless_positive arch_atomic64_dec_unless_positive
+
 static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 {
        s64 prev;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
