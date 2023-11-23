Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB781C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOUwrHaQcz7nu9S9YHdnG/SeivdgCBocsA6+Y4wBGgo=; b=ZoD4AGb/P0sSgS
	4wIYDtvYb1GfMsSHtqONaSbHxDwAY9sMzpRBTuQ+HYsX2guOEXjFPLQEFUgnLQ4ETZAnL0ED+VoLJ
	JmIBAmjO7gbXJEnQ0uI8QfXjHUjv6FltywTvg6QIzKjGX745QK68RrUDHjLr23GV0cebQJXiyJ5Yb
	651f6BYocvPn5X/Avn4O6bisop0o5uDOr0iD0QPbqi794VItnSrZaU8DkVgCIqQQYxOx+ejIhmB/V
	+CR2E6wI46bm7QakKxZs6d3FLV6yJQkXMlKmr9DB2NmVd7e19VqwVXrjklR20CYfll8FMa4P5VjVH
	vwc2UssIW78MoPmDhluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Afm-0050l7-0V;
	Thu, 23 Nov 2023 14:27:18 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Afj-0050k1-1W
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KsEGyo4xLuPNHGa1b7DoFLq+js4MZH59xg//d2NjkOE=; b=tdaFQMUbrOWxmVNenjZWG9hSvE
	KCa3l44k/k+jfnOjKCkQ3bpyv3V0yEXW/dSJ4FfxtU7f3OMQ9SPp8T6aZcJ9fuXQ7YbvgNWsbLKEr
	TI8pbF5w9zHSaVCFNFcdfnKNYso4A95r2mfnWnTjpoeIC6+hAxr/wvidPiy0sCsC1mm+iHh9R3nE+
	g0MSSrdphNd0FJ0NnSjGhvr7piw0qzXLC3beMi0hjXuq1vWRvvMKTTmOSMqin+4kmvJKwPUi04z4Z
	FRrUVYR8SbSc4Wt5ZtMBtEfxJs/Jhi4UpxhhKDtknHg0vXtLrXaFZ9LOaPW+SUjo6u47jfh5ZkVNg
	d4XOLwag==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r6Afd-005B1Z-S3; Thu, 23 Nov 2023 14:27:10 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r6Afd-0000000165i-3trc;
	Thu, 23 Nov 2023 14:27:09 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv; fix __user annotation in save_v_state()
Date: Thu, 23 Nov 2023 14:27:08 +0000
Message-Id: <20231123142708.261733-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_062715_590797_2C91D750 
X-CRM114-Status: GOOD (  10.58  )
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

The save_v_state() is technically sending a __user pointer through
__put_user() and thus is generating a sparse warning so force the
value to be "void *" to fix:

arch/riscv/kernel/signal.c:94:16: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/signal.c:94:16:    expected void *__val
arch/riscv/kernel/signal.c:94:16:    got void [noderef] __user *[assigned] datap
Fixes:  8ee0b41898fa26f66e32 ("riscv: signal: Add sigcontext save/restore for vector")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 88b6220b2608..33dfb5078301 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -91,7 +91,7 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	err = __copy_to_user(&state->v_state, &current->thread.vstate,
 			     offsetof(struct __riscv_v_ext_state, datap));
 	/* Copy the pointer datap itself. */
-	err |= __put_user(datap, &state->v_state.datap);
+	err |= __put_user((__force void *)datap, &state->v_state.datap);
 	/* Copy the whole vector content to user space datap. */
 	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
 	/* Copy magic to the user space after saving  all vector conetext */
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
