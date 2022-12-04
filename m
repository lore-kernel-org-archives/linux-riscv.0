Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A27C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tx36ddAdhjdteLIowm4+lOnQgrMggXVYaCRNhMDaTN0=; b=M+dybOwWt+zrUb
	Cj6PXzOtdbvAtqVedtzBvqAkUAFDLICNSm4h0gU4vJr4Hf338CcNA1GRQK6/Ld3t6IY6wmvx78xWz
	OtR9XclCzjsERsHokDAEezdTZoPCEM7nKfYbhDO3Xg1x3pPGJdHph+mK0FlhmMtw0eTQiccfTKF+2
	DOkea64lLbH+PoajadzwlEdcpZv15D6hjNK20z5JF2ercB8lZvbkyDf4O+jWPCjUid6Z3Qxahnpkw
	tABhO/ypd721vMxORE5R3W2jMKF5F3q7AiYsyBr1JxJVyhp6dZirgJbm3ZKf66Fiox/DZaa0n/VuS
	0PowaLHkS7PNds0FSxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tI1-00A7tn-I7; Sun, 04 Dec 2022 18:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEa-00A6ic-Ek; Sun, 04 Dec 2022 17:57:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8C5660EE0;
	Sun,  4 Dec 2022 17:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD8EC43470;
	Sun,  4 Dec 2022 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176619;
	bh=u5VhYmq8yWH9O8+BoW4qRUe99SmFaRTC5wB7Se/uBJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QpYNHilCA78Drqked9tH88Z2nzF/SNRZ+5pLsnrohFdVnwFtu9bdnJSV0FtaAjI1a
	 PSjEyjWDHSUFHy1ZNJl1NK5fT1Dhde5Ksxg6GX1w4lv0PEXz5V5ei0maXQ2AczJ8VK
	 1fUKovAKk1yaTBUYWKpfphDLSQ/EcjAypQw+bPjx7BzRKN3DKc5m0dJFmJFJx4U2o1
	 mNel4heiGwd54dMFQWIYve0yacnLxTTmgRTCe1t+t446rn5L4AK4I6PxuiWN+O5RSj
	 iuRPG7SrGqujbaILYtf6njMHGQFRUWsAkZ/yMG7X+3eKJ5diDVVKnQa+/dVdFxIGr1
	 sUplS2CbdsU1A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
Date: Mon,  5 Dec 2022 01:46:30 +0800
Message-Id: <20221204174632.3677-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095700_546794_275D9E7C 
X-CRM114-Status: GOOD (  11.59  )
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

Switch cpu_relax() from statich branch to the new helper
riscv_has_extension_likely()

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/vdso/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index fa70cfe507aa..edf0e25e43d1 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -10,7 +10,7 @@
 
 static inline void cpu_relax(void)
 {
-	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
 #ifdef __riscv_muldiv
 		int dummy;
 		/* In lieu of a halt instruction, induce a long-latency stall. */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
