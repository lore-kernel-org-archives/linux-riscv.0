Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F46BC4CEC7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 08:47:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E88206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 08:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFBStCWd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jqiS0ZFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E88206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LCGsPgnFqC0MLIQnm09Un3LT4DeUUDsZYyVfQjze/Ec=; b=sFB
	StCWdzpaqiRUR7mZtqDAJ/kGvxplJYtJxUeKz80SQuNZbSz0llcrSNnZREyq4PKdKPKZyzjngBkmT
	8hRczUPTa7CAD96QzhlDg9Qr3SuVqEpVTCovUoTE+jUojDg54KTtZc4BUQj1aVfH0RurAZ8hXcgOJ
	OpzODiDehdskbTVJSNfqJLp0kHtDK0s9SWP7JTPi//1vtew6lOMDbirx+yNZKtQ9VxlK9c7i7cldm
	b3SlZnnXRj3WvO34KfsFj5iN+5b5GoUX06yBwNFq9qj3QUFzYHC5s5OMNiJYYmxFadqtfXMReB9fK
	rnCM0ZvoyOnJNg5UXVac1E7pGKkIkpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9mfm-0005mn-Cm; Mon, 16 Sep 2019 08:47:50 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9mfj-0005lj-Jh
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 08:47:48 +0000
Received: by mail-pg1-x542.google.com with SMTP id m29so3156420pgc.3
 for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2019 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3CZpSwxadNRSj1Aew/i7dMbdAcGWIfP93unPiLM5ZaA=;
 b=jqiS0ZFSBSprWyva+JnlQenT6igdLwqK1epfj9V9uLdYC6+tCap43V5J04SE/VvZgs
 wa3xeqG1Woik3lm8qJHsIPCNfaeMhcsEMjbWqZesf9lXSxEQDB5M8hhiZ5cmw6cifXBN
 wWENpDjdbNQDJbS4fYwQRAcJiKJ+YR0ITzZss4pLrlxjmAJkRnysEHr5mwKMZ7+7KHgk
 NpGxkz2KqgSVOsCkOTdInWYGmZjaeEIdDh0bl5M0yj51v34N5Q1iphu2Nl0sVtHG8kuT
 QpTIh7L7Y84+NG5hJuLslpEb66nB5qDo6N1Pb09bEAc0w0bJ+MEc1FsjulJ3Ay81JYWj
 z+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3CZpSwxadNRSj1Aew/i7dMbdAcGWIfP93unPiLM5ZaA=;
 b=Lb94oY/v5BZc1a9t6HzRScCRLM8dWJYtg0ilqvVCp414V8cFc+0LmzCQDXeb2MNdEm
 jx9ANmUJYZBs8/72X/NG37AlVJYNDxcgREKA6eDHig2lRg8+9KtQqTwM6RiLfNIWOwiP
 0Ogr8ZDQBTuspyOO/gVLFUxlJSmOSIK7pnl9RoutiULydCKnqqQ21JbgN4rdc+MuDdEn
 NYwms/1tKqh/O1h6ddzCFZF+R5aMzSyZfYO0Gvw0NpYWiWZ2R/oh+mn29G3c7I0P/e7C
 3olTSa2Ha+0831jvIJcmyWnlf6RCEbBGVZgunirsfbnj0IxWl4NEqISsevsVU3LZuudP
 APJg==
X-Gm-Message-State: APjAAAWt0vuiGlI2PW4MDKY6TeDfFUp13vHLTXuPbyQsZIvDsPhvdoy3
 5OfIo93eUZnbi1xCjffEHtYkLdFxdbY=
X-Google-Smtp-Source: APXvYqzF3P7Xmee+L5UWCWLQSIUPCOGlHYeDGEd4arwppxKxhnB7L78TUmaDyka2mnGECkrKSP4tnA==
X-Received: by 2002:a62:e106:: with SMTP id q6mr12426391pfh.14.1568623666402; 
 Mon, 16 Sep 2019 01:47:46 -0700 (PDT)
Received: from localhost.localdomain (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id p20sm29599296pgj.47.2019.09.16.01.47.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Sep 2019 01:47:45 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Avoid interrupts being erroneously enabled in
 handle_exception()
Date: Mon, 16 Sep 2019 16:47:41 +0800
Message-Id: <1568623661-16779-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_014747_682956_685E6DBC 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

When the handle_exception function addresses an exception, the interrupts
will be unconditionally enabled after finishing the context save. However,
It may erroneously enable the interrupts if the interrupts are disabled
before entering the handle_exception.

For example, one of the WARN_ON() condition is satisfied in the scheduling
where the interrupt is disabled and rq.lock is locked. The WARN_ON will
trigger a break exception and the handle_exception function will enable the
interrupts before entering do_trap_break function. During the procedure, if
a timer interrupt is pending, it will be taken when interrupts are enabled.
In this case, it may cause a deadlock problem if the rq.lock is locked
again in the timer ISR.

Hence, the handle_exception() can only enable interrupts when the state of
sstatus.SPIE is 1.

This patch is tested on HiFive Unleashed board.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

---
 arch/riscv/kernel/entry.S | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index bc7a56e1ca6f..80444f1e57bb 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -166,9 +166,12 @@ ENTRY(handle_exception)
 	move a0, sp /* pt_regs */
 	tail do_IRQ
 1:
-	/* Exceptions run with interrupts enabled */
+	/* Exceptions run with interrupts enabled or disabled
+	   depending on the state of sstatus.SR_SPIE */
+	andi t0, s1, SR_SPIE
+	beqz t0, 1f
 	csrs sstatus, SR_SIE
-
+1:
 	/* Handle syscalls */
 	li t0, EXC_SYSCALL
 	beq s4, t0, handle_syscall
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
