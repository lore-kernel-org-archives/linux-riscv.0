Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA82C46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2AZlmWIt+bmAma3+PNbI80Rb5mGGBeQxrAnMDcFGf8=; b=tpnHLSx9oPjWyI
	2hS1+axkmKRocG81fiSl/GnSoL8ApBl7OfTX1ydRDjbpSVFlQ0qXKc9zhF/dIRDj0kDF9De3Daiob
	iyCjrEbu53NqtrojZPNDFUk81P3ANS4u7WJDT2QSRByOPP6QljWln9DAZVpgBrmBZ1ByO5wargr/W
	KZkQeBmhgtNtibuRTmBbBlPQGRIljXnrajd1z/ksm5TO/LpqoQJNwMWqUjL1YlF8a2haru81rItAw
	LXUXYYwvN/yq8ukLcpEiOYLqobwpAWM0a3Bh7GDZ+cf6yjVeUesJIvXUdWIh197d3iiJYsym9PQSk
	v+GRgVFDsZWW7U3Buz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9i-005sGy-12;
	Fri, 22 Dec 2023 11:57:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9f-005sFn-1n
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A59C61B60;
	Fri, 22 Dec 2023 11:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7F8C433C8;
	Fri, 22 Dec 2023 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246245;
	bh=OMHoJ47sH8QL4h4TQhZ+b4gxch9yOK4WdYt6lzVlcv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9qp0VEOGkrFAhxqIe4d6Y9gIs4x6sOfZwhGePIfwsqsVInwDYDn9xyPy0D6jHDf8
	 l80dp1DCIjiaIdq+5PnC7VMWBk1I1MVo2Kvz3lRX0lS+aStpiAEZpUTJ8a+nK6Cisq
	 NPYiyqFkNnPd8iWk2opA3z9L0YWxKnMqBqifWtQZIoRcJt3hQZ5/8BdK20/JycOtV9
	 Vbu+Nf5bLXqImKx4F3uGjyRTiWakhBpnEd8OBDrR5Ky3U9rAjZcwI9w4n3wFEDlAUO
	 JZQPQG3kpw5ZQVC2kAlMqOCLgqXJ97JXpA6tIzhx/yl2RMQQcSH9BYkEJx/5wHioZL
	 HHbRAb8qWlz/w==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: [PATCH V3 1/4] riscv: mm: Fixup compat mode boot failure
Date: Fri, 22 Dec 2023 06:57:00 -0500
Message-Id: <20231222115703.2404036-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231222115703.2404036-1-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035727_635113_7870C1A7 
X-CRM114-Status: UNSURE (   9.80  )
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

In COMPAT mode, the STACK_TOP is DEFAULT_MAP_WINDOW (0x80000000), but
the TASK_SIZE is 0x7fff000. When the user stack is upon 0x7fff000, it
will cause a user segment fault. Sometimes, it would cause boot
failure when the whole rootfs is rv32.

Freeing unused kernel image (initmem) memory: 2236K
Run /sbin/init as init process
Starting init: /sbin/init exists but couldn't execute it (error -14)
Run /etc/init as init process
...

Increase the TASK_SIZE to cover STACK_TOP.

Cc: stable@vger.kernel.org
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ab00235b018f..74ffb2178f54 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -881,7 +881,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
 
 #ifdef CONFIG_COMPAT
-#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
+#define TASK_SIZE_32	(_AC(0x80000000, UL))
 #define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
 			 TASK_SIZE_32 : TASK_SIZE_64)
 #else
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
