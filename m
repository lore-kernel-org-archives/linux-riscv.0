Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2935BEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eghq1xZ3BuVGaOvceYYfb/w2vBUd2e+s1ljNoGYCRVQ=; b=KN0HmkDlRopOJX
	4/5+0b40QXJNAU1x11wtzxoUcFXQ74ag6OBOxCYmzprTAX7ht4yEvlPbYYu6JSjJm6cNzSx9Ie7Gr
	alIC+PM6fvFvCzXL09p75CnYxyLUl2Pq3NzU8wojP7AwES04qkNKrtW4rn+l2a4Rgyno+98r//JrA
	HJ4rg4O4yV1P9+2stAWeuYp7qKmSOmUTdewAcuG7FRXpVa2fGI1mKVjvWy4yva1wB08b8HBGAjn9y
	EMRMEaByzBeainY6aDtHadO4u7LbDhJKYCBQartnSFAN03NLk7MqNimHk9dcgsw7KqjvTqwtfEcpF
	E9kr1J6N019Q3TmzhJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERDs-00FDlY-23;
	Wed, 28 Jun 2023 09:12:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERDq-00FDlA-0f
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 09:12:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE00A61274;
	Wed, 28 Jun 2023 09:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CBDC433C0;
	Wed, 28 Jun 2023 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687943540;
	bh=4+LWuCHhCgLBPx3TQt9FM+S9EBnOCqZEpjrJRHY4slg=;
	h=From:To:Cc:Subject:Date:From;
	b=tEFODtSPH9PwiiyWel/MqR3Vzv7WJ+Q5hdPMZOE5rk7JHo0dmjMiWCJ3fD/rindP7
	 laSw4+QNVvtyArW+7XMcYXsP4eeI0/NYxQQMseeQxRlgpWARua881xj65+f/uJbjhz
	 45w9SypuKhJeEqOKycFqmczZbUVGO8x+mkK21HQZqmX1xHxnIzOWwiw9EFoUwveugr
	 o3HyCoZOCFma5KOz2/g7d6kxzG8ptoXNAGbMStOCprEngfPpRxhUIM5hnvc6/w6Ao2
	 dPDZsqtsuAo75kd9lMATaxw9CsHPsy9aB2yrXu8MF5ncYvJDC8NvYuHG46blzHg7DH
	 SP/E+6MYRdudQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: sigcontext: Correct the comment of sigreturn
Date: Wed, 28 Jun 2023 05:12:13 -0400
Message-Id: <20230628091213.2908149-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_021222_305964_498C6CB7 
X-CRM114-Status: GOOD (  10.92  )
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

The real-time signals enlarged the sigset_t type, and most architectures
have changed to using rt_sigreturn as the only way. The riscv is one of
them, and there is no sys_sigreturn in it. Only some old architecture
preserved sys_sigreturn as part of the historical burden.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index 8b8a8541673a..ca5b5c8391a0 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -23,7 +23,7 @@ struct __sc_riscv_v_state {
  * Signal context structure
  *
  * This contains the context saved before a signal handler is invoked;
- * it is restored by sys_sigreturn / sys_rt_sigreturn.
+ * it is restored by sys_rt_sigreturn.
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
