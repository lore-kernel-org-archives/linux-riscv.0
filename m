Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418EFC00449
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111ED2145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qAbp/e9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 111ED2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmvNlkkU3OhX59rrCl5reAcuSwMwPP2IjcpKjEI85Uo=; b=qAbp/e9F0gz8Y5
	HJJN1X5EW+Y2ndArYlVDPiJAzECJIZ08rZk9ardJq/K/+Sgu0V1iQ4rHGRnVbMNBmrKGKpb0pmkjK
	UYvkV3EY15ekcFUxIEwv9/1L9uVH+6G1P/askfExzgC2NC8/UIFWtBLUIMUeQzHuc2+zGR2KLbhbW
	G8sT3zoZ785k4eTEcIU+M40A+a/VtQ7oWbu8CnJHE+aHxyNQmOfnFy1s1eKF6pn5eakDZthd33wRC
	42C3qzL3nFEssbQXzz4cBKv/XnhZiQq3JZwPaIBIXJwjoMGrcBtRSshVk5PL5ixY/ledGp2JWnMul
	DwUwP0lxKLBGgXKPvnjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9hca-00044F-Tj; Tue, 09 Oct 2018 02:19:40 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9hcW-00042k-UJ
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 02:19:38 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w992Lr5Q032591;
 Tue, 9 Oct 2018 10:21:53 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 9 Oct 2018
 10:19:12 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 2/5] Refactor FPU code in signal setup/return procedures
Date: Tue, 9 Oct 2018 10:18:31 +0800
Message-ID: <1539051514-3658-3-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539051514-3658-1-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w992Lr5Q032591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181008_191937_239558_E0E1B137 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincentc@andestech.com>, Zong Li <zong@andestech.com>,
 Alan Kao <alankao@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009021831.AyPHK8_ri4wbehJetZ0QehZRZiwqY5PiwKyFcIMt8Ok@z>

FPU-related logic is separated from normal signal handling path in
this patch.  Kernel can easily be configured to exclude those procedures
for no-FPU systems.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/signal.c | 68 ++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 718d0c9..6a18b98 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -37,45 +37,63 @@ struct rt_sigframe {
 	struct ucontext uc;
 };
 
-static long restore_d_state(struct pt_regs *regs,
-	struct __riscv_d_ext_state __user *state)
+static long restore_fp_state(struct pt_regs *regs,
+			     union __riscv_fp_state *sc_fpregs)
 {
 	long err;
+	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
+	size_t i;
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
-	if (likely(!err))
-		fstate_restore(current, regs);
+	if (unlikely(err))
+		return err;
+
+	fstate_restore(current, regs);
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
+		u32 value;
+
+		err = __get_user(value, &sc_fpregs->q.reserved[i]);
+		if (unlikely(err))
+			break;
+		if (value != 0)
+			return -EINVAL;
+	}
+
 	return err;
 }
 
-static long save_d_state(struct pt_regs *regs,
-	struct __riscv_d_ext_state __user *state)
+static long save_fp_state(struct pt_regs *regs,
+			  union __riscv_fp_state *sc_fpregs)
 {
+	long err;
+	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
+	size_t i;
+
 	fstate_save(current, regs);
-	return __copy_to_user(state, &current->thread.fstate, sizeof(*state));
+	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
+	if (unlikely(err))
+		return err;
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
+		err = __put_user(0, &sc_fpregs->q.reserved[i]);
+		if (unlikely(err))
+			break;
+	}
+
+	return err;
 }
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
-	size_t i;
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
-	if (unlikely(err))
-		return err;
 	/* Restore the floating-point state. */
-	err = restore_d_state(regs, &sc->sc_fpregs.d);
-	if (unlikely(err))
-		return err;
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
-		u32 value;
-		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
-		if (unlikely(err))
-			break;
-		if (value != 0)
-			return -EINVAL;
-	}
+	err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
@@ -124,14 +142,10 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
-	size_t i;
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	err |= save_d_state(regs, &sc->sc_fpregs.d);
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
-		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+	err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
