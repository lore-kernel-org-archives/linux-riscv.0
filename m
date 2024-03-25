Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A200EC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+o6GilBLOxzDZOoGXLFPlh9Tipq0zaOilQdWJViFH4=; b=hXScbbR0diMsUz
	0xJoE+fi/RueIYB+OwqiBNma3D2jcyzmHZzQRLUqt9FljQzK/jdmBzhJq3+xxI0SRBEbAyYHMgHZl
	939uLmUw+Atb8tWxCQmnNhES6JzQp+v5QqUjKFALSfrGFj0Iko1IfXz8VffF7Ep/AaPQIb6BgrYqE
	jIZWA52ppWieL5+BRhk9ctcgl0grY0JkI/fe/ffaqeef016B986dqdwUYYksud7yCUjdJb30pXd/Q
	eWj/UAi8+6CXF6UcRGzsfogkmCSHazKNvrrkG8A9Qf7lsEHUnHOxMgPMTLOL63rycLyjBn+iZqsPL
	0UbdJPoiLwy11EE93A+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZy-00000000slL-0al4;
	Mon, 25 Mar 2024 16:53:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZt-00000000sih-39BA
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 104BD611AE;
	Mon, 25 Mar 2024 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECE4C433F1;
	Mon, 25 Mar 2024 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385620;
	bh=w6ZM0qzs2PGzaQXvUXmLy9gFSChzi3ytqtQ7RsJPkIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqpK//uSQEaK2p8j5RufU/zoTdsqlJw9JaorQ6kkKPd4MTQwJgbjlLTxTI6S3nS7K
	 BPva1d2LxjAXvyR93epam3JmVqaLdtPWjtZmwPBIZmuAL44cT/GoxvwiBj7/WCLkvT
	 45zGIyPMbG1FaCOV0OraeQKppFqC7Ml2wQABrVv2U8eNs5iYuDmu26OWqQcPFxovTj
	 JRly5wAASJkRRvtBGFMjoZ3EoTPYm7867mTqnJXydye4VSabI3bZGTw/OtVj5AlzAH
	 bogv6Zx9BSin3R+FSuPeXGrDU+epew4dyKbKvQHqNQZ8kxPoePqh5NkQdFrg4OY++g
	 lKd7Mtvm7a2TA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] riscv: nommu: use CSR_TIME* for get_cycles* implementation
Date: Tue, 26 Mar 2024 00:40:18 +0800
Message-ID: <20240325164021.3229-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325164021.3229-1-jszhang@kernel.org>
References: <20240325164021.3229-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095341_874032_141BEC1C 
X-CRM114-Status: GOOD (  11.42  )
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

Per riscv privileged spec, "The time CSR is a read-only shadow of the
memory-mapped mtime register", "On RV32I the timeh CSR is a read-only
shadow of the upper 32 bits of the memory-mapped mtime register, while
time shadows only the lower 32 bits of mtime." Since get_cycles() only
reads the timer, it's fine to use CSR_TIME to implement get_cycles().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/timex.h | 40 ----------------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..a3fb85d505d4 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -10,44 +10,6 @@
 
 typedef unsigned long cycles_t;
 
-#ifdef CONFIG_RISCV_M_MODE
-
-#include <asm/clint.h>
-
-#ifdef CONFIG_64BIT
-static inline cycles_t get_cycles(void)
-{
-	return readq_relaxed(clint_time_val);
-}
-#else /* !CONFIG_64BIT */
-static inline u32 get_cycles(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val));
-}
-#define get_cycles get_cycles
-
-static inline u32 get_cycles_hi(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
-}
-#define get_cycles_hi get_cycles_hi
-#endif /* CONFIG_64BIT */
-
-/*
- * Much like MIPS, we may not have a viable counter to use at an early point
- * in the boot process. Unfortunately we don't have a fallback, so instead
- * we just return 0.
- */
-static inline unsigned long random_get_entropy(void)
-{
-	if (unlikely(clint_time_val == NULL))
-		return random_get_entropy_fallback();
-	return get_cycles();
-}
-#define random_get_entropy()	random_get_entropy()
-
-#else /* CONFIG_RISCV_M_MODE */
-
 static inline cycles_t get_cycles(void)
 {
 	return csr_read(CSR_TIME);
@@ -60,8 +22,6 @@ static inline u32 get_cycles_hi(void)
 }
 #define get_cycles_hi get_cycles_hi
 
-#endif /* !CONFIG_RISCV_M_MODE */
-
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
