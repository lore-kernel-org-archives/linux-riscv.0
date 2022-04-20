Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv6NVglxPDaJYSYkyBXsaZsqY7Ym7PgXnW0rhOU1Kzs=; b=mUMC851UmIYXHj
	QFzMGBkgrarGOQxXXARm9N8El+mpkT6VgNEtlRZeX7opeT3m8vv37B8yOz1hse4joHIpW0FLk6YJt
	fbGmO2iHb3J5u6psDlt/dslSgXgX7YGS9cgmEUKTzMh7UBucoySWyr/3wKMJLW9WBRWXTKBcHPh3v
	usOnSS3zSXOu0dMhq7OChlEyLx+u+DWBFVafN12SYv60ff5q7VhQdmmCN1A9fFgumlGmJMjmAY5Yt
	IeJ1Hln4kcosJbCJmrR4eNiO8DNhW3yjkwkJPrRIlpOWp5XAHqcEPheQKxNMTwJDBycyph3QaBXxR
	mUpiczkfF7pnVPARQmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBZk-009RUP-6O; Wed, 20 Apr 2022 14:45:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBZe-009ROg-1Q
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:44:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A28EAB81F16;
 Wed, 20 Apr 2022 14:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEC5C385A0;
 Wed, 20 Apr 2022 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650465891;
 bh=uhUfyEvMq+wqDi6kDMjqVy2PHOt/CvPeNGoHGdg5hr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZZIMXDq+kA8YeVTfqhw0qC4fqHVN56HMMHEaEDn/0GQjStW7aOmFByvOIvov2Ol4i
 iNcGQL//4xEg3r+cQzmkB728AHYHF6CLTT8Dh3mMy38JFkme7CWoW9C8R7pOxj6y7h
 6EJtlr0+9A0T2m1A44CeFYm75ovrK2R7uRCAdSKTc0V4tUydNNLJGTiMk9PPvgTfxB
 5S/WU6AGyQnA8opiXLWGC/e0uv4COExuwGq5UPtN5QrwBb8H5ipK4vxBo4grNokhRz
 U1A6NFo5X0liMzHZGeC8KDCml7sKqAnvt4lyofJjiYNgWMwj0gmIJX3NwX1mwhBRQ/
 A37xq72Z0v1xA==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 5/5] riscv: atomic: Add conditional atomic operations'
 optimization
Date: Wed, 20 Apr 2022 22:44:17 +0800
Message-Id: <20220420144417.2453958-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420144417.2453958-1-guoren@kernel.org>
References: <20220420144417.2453958-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_074454_412224_F1E42185 
X-CRM114-Status: UNSURE (   8.54  )
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

Add conditional atomic operations' optimization:
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
 arch/riscv/include/asm/atomic.h | 78 +++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5589e1de2c80..a62c5de71033 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -374,6 +374,44 @@ ATOMIC_OPS()
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
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
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
+		"	sc.w.aqrl %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
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
@@ -394,6 +432,46 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
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
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
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
+		"	sc.d.aqrl %[rc], %[rc], %[c]\n"
+		"	bnez      %[rc], 0b\n"
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
