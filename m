Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23243C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 01:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C797061152
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 01:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C797061152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9XUSVkZkpYz9fv7o0X7G5ZSmZND7oQwKsoAZAiBvHM=; b=hxN3qVikgTs3qr
	4ocDLTzqfFh6Fb7nWzeana1u89STaeKv4UgLyO58BkjTldRIGa6HK8253Xj2chAkz3soeOhW+yvH9
	nxexfVveNRr+k02Lyn09kAAMUf3raw3TgpZoJ0490Jn3G8B8AVy6DqSpD4XzJIM/0joSbyAm9pNH9
	lpVb1ii9lNWjWO/RXYHWbE1EEvNKtmusSIsMj1Dp37UJp1P92CzGLKAC16mthW8fvHotqCsCHSNt/
	uWGOPl7Hj6a7lh3rh6qzWPfEC0RHbVSKHHbHMVPXhl0M6zLg5lbR0Yw+0vYlVToh0fchylYZ6B2cP
	z21z07Jh2Xgh41mjKAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTaR6-00Crhd-8F; Fri, 24 Sep 2021 01:55:36 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTaR2-00Crfk-U1
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 01:55:34 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mTaQx-006pXk-LM; Fri, 24 Sep 2021 01:55:27 +0000
Date: Fri, 24 Sep 2021 01:55:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-riscv@lists.infradead.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix a nasty sigreturn bug...
Message-ID: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_185533_002876_6C867CA5 
X-CRM114-Status: UNSURE (   7.55  )
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

riscv has an equivalent of arm bug fixed by 653d48b22166; if signal
gets caught by an interrupt that hits when we have the right value
in a0 (-513), *and* another signal gets delivered upon sigreturn()
(e.g. included into the blocked mask for the first signal and posted
while the handler had been running), the syscall restart logics will
see regs->cause equal to EXC_SYSCALL (we are in a syscall, after all)
and a0 already restored to its original value (-513, which happens to
be -ERESTARTNOINTR) and assume that we need to apply the usual
syscall restart logics.
    
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index c2d5ecbe55264..f8fb85dc94b7a 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -121,6 +121,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (restore_altstack(&frame->uc.uc_stack))
 		goto badframe;
 
+	regs->cause = -1UL;
+
 	return regs->a0;
 
 badframe:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
