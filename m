Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23668C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FlWu+O6WWZs0yZbr1HbDhDim+TfbGdhx/kyyiKzjUaI=; b=Im/vZrGhJm4cKd
	snXZ7kOtVA0Rs7r3pIlWmrVdQTiyI/tFlTWFo/iTyErJIn/qLOLmcRaek44fBq/luKUwYry7WN2Qi
	c70A6qGgpDVQ7GF8wGgimNUa0wPd3oPGCfZtuSOR+E6qZxUr5Qq6oZJrF/EXrRsEM+ahU2fEI0Vrj
	j2IleIUJjxtAIMHL0MtJvgoznHzE0Y1ETBmjqPzEbASJODG3K4cBnIHYwt5uF56hXnFAHmbZgn8lj
	NnEZuv1esFheSMKSscIOBtxrEvA+Xs50cgYdVvh9q2EirQbPjVqR2uLmnFml5VOKobfyim/8G1blO
	Yx7Kv992s5lH7v2tJuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxX4-001o34-EV; Mon, 10 Oct 2022 18:29:42 +0000
Received: from mail.galaxycrow.de ([162.55.242.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxX2-001o1r-2z
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 18:29:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0242F61814;
	Mon, 10 Oct 2022 20:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galaxycrow.de;
	s=dkim; t=1665426568; h=from:subject:date:message-id:to:mime-version:content-type;
	bh=W58bxFwAIOUlrrxGdC8NPXHPCJ1U+6GxUQe5dss0k0g=;
	b=hvdsZm1ZY5PR2kFWcGYAB2YisZiNaIU08YIIdTDhmaArKJ+yczVlzi9WVqmwiklRZYqKPS
	5C26dbKJLJvt1QyX/GLM6LMZRmvO4ycOQLAehZVGWcFMJXPmk3E+qitfe1ZTtpPTZcymAS
	xFWIdrYcnaYxZZSx7U0sSYxc77I4NdGXlofCmcXeJJ8IZ7Vs5Su8L8VRTWgwp4a+hdiQ+N
	1jICrU2GdGAUVW1+wO43jKX7Xm/CER07V0EQdx7eo97d6iwUhADUG3dLjlf4WESmtlJEQ0
	9LproF4XdVh/CPEJyLZyuFuKRVLrMZE1cjlvG/Fso/tlQCcWBFQiAvbv/gosug==
Date: Mon, 10 Oct 2022 20:28:48 +0200
From: Cleo John <waterdev@galaxycrow.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <20221010182848.GA28029@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_112940_317885_9FDDDF11 
X-CRM114-Status: GOOD (  12.84  )
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

Change the two comments in ucontext.h by getting them up to
the coding style proposed by torvalds.

Signed-off-by: Cleo John <waterdev@galaxycrow.de>
---
In my opinion this also improves the readability so I think this is a useful change to do.
Please also tell me if you have a different opinion.

Changes in v2:
 - change the styling of the top comments too

 arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
index 44eb993950e5..516bd0bb0da5 100644
--- a/arch/riscv/include/uapi/asm/ucontext.h
+++ b/arch/riscv/include/uapi/asm/ucontext.h
@@ -15,19 +15,23 @@ struct ucontext {
 	struct ucontext	 *uc_link;
 	stack_t		  uc_stack;
 	sigset_t	  uc_sigmask;
-	/* There's some padding here to allow sigset_t to be expanded in the
+	/*
+	 * There's some padding here to allow sigset_t to be expanded in the
 	 * future.  Though this is unlikely, other architectures put uc_sigmask
 	 * at the end of this structure and explicitly state it can be
-	 * expanded, so we didn't want to box ourselves in here. */
+	 * expanded, so we didn't want to box ourselves in here.
+	 */
 	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
-	/* We can't put uc_sigmask at the end of this structure because we need
+	/*
+	 * We can't put uc_sigmask at the end of this structure because we need
 	 * to be able to expand sigcontext in the future.  For example, the
 	 * vector ISA extension will almost certainly add ISA state.  We want
 	 * to ensure all user-visible ISA state can be saved and restored via a
 	 * ucontext, so we're putting this at the end in order to allow for
 	 * infinite extensibility.  Since we know this will be extended and we
 	 * assume sigset_t won't be extended an extreme amount, we're
-	 * prioritizing this. */
+	 * prioritizing this.
+	 */
 	struct sigcontext uc_mcontext;
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
