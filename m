Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D98C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 08:03:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556DC20830
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 08:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xfe5Rvb/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVLzstJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 556DC20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1urtAQD73q94qWDI3QUiYDKz5r2wEYT6TOYZBVe9vH8=; b=Xfe5Rvb/GeFfxo9mR4o6cp/dnU
	tyxva5KrR2qmcw+3hY05SB7QZlPoDXGOZei3gZ+qJfC5BAvNCiVOamj6PuP2Rx79WaIkavT8iAbKQ
	HS00/TyB0yqOlJ7kFyNEDp0Q2GUxm857Sj2+v5SeA0AtzLTyiLKD+gPqEoZLF2REaPrdS2z06Dgpb
	F9wdLz0lMnjG1joCY+qy1tYZFpIH8hMXckiobOS2NFf2A+OeE+S9rhvj0OX10tJELFklEBJZOFnoW
	c+Q4mxXPSjlx+T9/dDHmejF7jlMwYA+ROfR31J8FkziBplTSsk2wmji/nlkk2VCnzrpGpuZb97iz5
	lLzUPnKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEOT-0004am-Fg; Tue, 02 Apr 2019 08:03:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEOQ-0004aL-Lu
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 08:03:39 +0000
Received: from localhost.localdomain (unknown [115.192.191.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 167F620830;
 Tue,  2 Apr 2019 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554192218;
 bh=lXG61drHYKWkH6JkBOWzJQigVdmu7d5++K4qQ0nR6fY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fVLzstJbIsNs/lJESTdus9nNjlp+OfV5VYENhKjX4AVWbE9YpNfZuZxVu3dN/1AO6
 jOsUpiWtHRiwfFMOALwW0wSIYn/aDIDtluGkd/cINLiHJlDDsAsnhSWZLuzEGQq5P4
 7mcPBIx97phlkSwKEKndqCtQfUfOrh6qkVCq2P2c=
From: guoren@kernel.org
To: arnd@arndb.de,
	palmer@sifive.com
Subject: [PATCH 3/3] riscv/signal: Fixup additional syscall restarting
Date: Tue,  2 Apr 2019 16:02:33 +0800
Message-Id: <1554192153-2587-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554192153-2587-1-git-send-email-guoren@kernel.org>
References: <1554192153-2587-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_010338_729790_8BF20577 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ren_guo@c-sky.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

The function of do_notify_resume called by entry.S could be entered
in loop when SIGPENDING was setted again before sret. So we must add
prevent code to make syscall restart (regs->sepc -= 0x4) or it may
re-execute unexpected instructions.

Just like in_syscall & forget_syscall used by arm.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/kernel/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 837e164..804d6ee 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -234,6 +234,9 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 
 	/* Are we from a system call? */
 	if (regs->scause == EXC_SYSCALL) {
+		/* Avoid additional syscall restarting via ret_from_exception */
+		regs->scause = -1UL;
+
 		/* If so, check system call restarting.. */
 		switch (regs->a0) {
 		case -ERESTART_RESTARTBLOCK:
@@ -272,6 +275,9 @@ static void do_signal(struct pt_regs *regs)
 
 	/* Did we come from a system call? */
 	if (regs->scause == EXC_SYSCALL) {
+		/* Avoid additional syscall restarting via ret_from_exception */
+		regs->scause = -1UL;
+
 		/* Restart the system call - no handlers present */
 		switch (regs->a0) {
 		case -ERESTARTNOHAND:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
