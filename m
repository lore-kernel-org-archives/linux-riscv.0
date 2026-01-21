Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B528C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dca6qdCPebkoTYKOFgbL1wka34s+16osoT2SNt6K4Es=; b=u+opdB+XXhRPOx
	nDqnoBlZFo0LVAxCK9HE96frgcUhrs94uUqzdNxMPvZUFKN2WXn02yi7ZbjZaUDaGMdXDAKNSkkG8
	Wv9v55QZ/EXFROHCFRI+Zj5Ku/tuTN/1xH2F361XXPy+jS2rYwjBRFmj/DrcoFlCE8vGrzBjurgJV
	yQWYctZum68+Ug4j8BGehGtEbxSSprGYq2cbVdw0md2jrAd+t5ZPhHj8t64k3+T76g6S6v9yMil5c
	VPJSqpTdUvN3fiNEZA01R3O05JRGuJXTRSftAOrQJy3JJlBKQ420XUUcWBPuufkKelK4eRw/mcupK
	HoVvOUuoEodMemJP6ung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGY-00000005A1k-31DY;
	Wed, 21 Jan 2026 09:12:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGW-00000005A1C-0mkT
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 09:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11B3F437D3;
	Wed, 21 Jan 2026 09:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD156C116D0;
	Wed, 21 Jan 2026 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986758;
	bh=BAQTd/XLF7uD0uDdiaYj9e/wRwD4u1+Ng/MgpKb17yE=;
	h=Date:From:To:cc:Subject:From;
	b=vFoC5ViVjtdli//ZBwl21TjYj1itp0JiGWQUFYsqAzdL5B36gtWoMifc8VqeyBqF8
	 5/beh9wvA2+CbCJrGTUuRhRFCnrThlDMe4dgm1QNzuv4PREwCeHkzKmwj8yRCYhd+1
	 C81odbunshOpdh3nyb8ANkutFHtA09/40LXA9mysUXzpPRdIe9+AbT5JccXaju1uAX
	 moBY7xMRsbqbuLTuMQdLIpztexSK3Hxr+vZ0lD1xnG9GJczZF5PJcZrMQdCn+24mIi
	 aq6IWmXmcmjE1nnGwSsph57QXQMkyKIDQQOxfIqfi299q6NP8YdyftmkLpheMgjBuc
	 gmFcXwTfUjp+Q==
Date: Wed, 21 Jan 2026 02:12:35 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
cc: andybnac@gmail.com
Subject: [PATCH] riscv: signal: fix some warnings reported by sparse
Message-ID: <53f08d8a-3444-ec10-6aed-c0cae4f74e3c@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011240_250653_5B2FF682 
X-CRM114-Status: GOOD (  11.75  )
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

Clean up a few warnings reported by sparse in
arch/riscv/kernel/signal.c.  These come from code that was added
recently; they were missed when I initially reviewed the patch.

Fixes: 818d78ba1b3f ("riscv: signal: abstract header saving for setup_sigcontext")
Cc: Andy Chiu <andybnac@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601171848.ydLTJYrz-lkp@intel.com/
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/kernel/signal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 5a956108b1ea..dbb067e345f0 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -145,14 +145,14 @@ struct arch_ext_priv {
 	long (*save)(struct pt_regs *regs, void __user *sc_vec);
 };
 
-struct arch_ext_priv arch_ext_list[] = {
+static struct arch_ext_priv arch_ext_list[] = {
 	{
 		.magic = RISCV_V_MAGIC,
 		.save = &save_v_state,
 	},
 };
 
-const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
+static const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
@@ -297,7 +297,7 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 		} else {
 			err |= __put_user(arch_ext->magic, &sc_ext_ptr->magic);
 			err |= __put_user(ext_size, &sc_ext_ptr->size);
-			sc_ext_ptr = (void *)sc_ext_ptr + ext_size;
+			sc_ext_ptr = (void __user *)sc_ext_ptr + ext_size;
 		}
 	}
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
