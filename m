Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A5BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/pxjovqJMuR5ljCTVnLUvKwST7AQPGYfU4RwdpoCO8=; b=VzT6q0qV+kW9Ko
	1UkU7Nx9H3CQ0PbgcbgbbS+0B0os5f+H8wpsL/uO2zyN1yCdEGYY4RFXczEOHHMtFzoPl9qpo2D/z
	mr/jgMxclYDlhUDNnbfXw/+JsJlempUAlSkDtCTKrBtu3wa7WQppAM6QBL3XNtgG6anncE7krT+aB
	5Skmif0b+s7FiWfSjqbL3oa4h9rksMG0xnMPjABjEbnYQjXeKE+h5ORSWS8Jo4aXIqqTJIxDqFLuE
	IKD3wMF+GwKfjXfb9Knva26KkMtC/L4MD7UXrxgihmngsbyDwXpSQ/n3DRP5z1yWhUGOKDbaJhN9B
	RRrvqtpaGYzomZGlf53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66Pa-005Bcy-2c; Tue, 28 Jun 2022 08:17:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66PW-005BbR-SK
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 08:17:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A8856119B;
	Tue, 28 Jun 2022 08:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532B8C341CB;
	Tue, 28 Jun 2022 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656404245;
	bh=wuMCLxNzxYSmxOh5v/SBPcUTtvTDqjGgAdULUenQIXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pPb+/fENqMFaNUkZi6ql3d0fdSuDA7WTP/Lpo5BBmMl376GJTJ5wk6oq5bjBKJujt
	 AUAkSyTrMojK8B6lta+rMW/hVbpHJ4EbCDBZ3s1u2HDX6r9aytN5JiiJVFIfKbSUVJ
	 MDsa4DdyVpOAxrwZre4pbBxEtJENcdfdbbsl9zJETI27O4EeiRcHd5ox2nguiOMi57
	 7swCaCeIbQK/SbiHBmRrq/8mj7XWoj0oMDQfLt/ldfv4beWX37ef27Zq27Hh9ugOtg
	 9n1Ut6VjS0R+FmzLF8AhoEfAsSOtt/Dcz0LJCEAhgal1ah9yWzcfIo1IDAIzhgeCFi
	 KH3mqQj9ea+aw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary atomic_read
Date: Tue, 28 Jun 2022 04:17:03 -0400
Message-Id: <20220628081707.1997728-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628081707.1997728-1-guoren@kernel.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_011726_990683_325975B1 
X-CRM114-Status: GOOD (  11.55  )
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

Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
because the value has been in lock. This patch could prevent
arch_spin_value_unlocked contend spin_lock data again.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/spinlock.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index fdfebcb050f4..f1e4fa100f5a 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
-	return !arch_spin_is_locked(&lock);
+	u32 val = lock.counter;
+
+	return ((val >> 16) == (val & 0xffff));
 }
 
 #include <asm/qrwlock.h>
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
