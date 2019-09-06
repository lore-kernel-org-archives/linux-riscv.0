Return-Path: <SRS0=7IGV=XB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4095DC43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 06:56:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF2A206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2019 06:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rURNfjYF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hardenedlinux.org header.i=@hardenedlinux.org header.b="XfrsGKJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF2A206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hardenedlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ns+qDQ2ShN+9JP9Ppr9x2F5aus/rwce9nUhpz+qLDfA=; b=rURNfjYFZVmLay
	GpwLY2lbL4HYFojAVY3jWV5hgCaWqzFbXwlaYMGRPArMUNyiPb+gqfJOIEZohcKNfd1PTPYvq0+E5
	jsuJHw1ay8KpeECssN+8UrFG8WU0QqlAR+toYXo99iVrgfQHgSY7z0p2FMeaChwmQxoN9A6ty/Pzp
	uUcsOKef89h17Zzv3DjBBrX4VlVnY/hThHz2EHDkoUrlhlsAeLnH+4tFdqILVPS+Xzr6ZfxeFtRVn
	TZF4uxSzwtc/Qryyr5M8/SC3LVEl3bCKFQLRNN9aFc0qIlCP2R0FGsdGcieJKk4vdiOs7RhcNuNHp
	bXcT2G38rH33T5uoHjRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i68AX-0006wh-M6; Fri, 06 Sep 2019 06:56:29 +0000
Received: from mail2.protonmail.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i68AU-0006vy-G5
 for linux-riscv@lists.infradead.org; Fri, 06 Sep 2019 06:56:28 +0000
Date: Fri, 06 Sep 2019 06:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardenedlinux.org;
 s=protonmail; t=1567752983;
 bh=tnjEQHsjLTOwlXpsM+jIBd9kUJcYGN4t3QPxOXWDZXg=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=XfrsGKJAJrPo4xO99677ifuwvEb6/N4sg/bLFpox2BYBgnyajpCyTUP5pNywekQuh
 fUloulGna6+oMTCTSCvnclVj3heLf04JYo0pVKGDMIsquM6Y53GQv5st+xArh1Qqp4
 zMYvDAlY+xu8EjJ2Do84Lb0gHmymoWVNsYM6lRv8=
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Xiang Wang <merle@hardenedlinux.org>
Subject: [PATCH] arch/riscv: disable too many harts before pick main boot hart
Message-ID: <AMJe39pHTcb4gsI-_Dv-wmR8_x9EbCCN9LKI47j34_8vBKRqzFxPrjmZvBtwV5OU_HcOiRkKUG66xVaNQ8VAXw7Ws0CCK74gpA8pKaYN5wM=@hardenedlinux.org>
Feedback-ID: BRRa7Rf7LqOlikZR00e5gSr_IsihWq0drDTak4NnawY-ONQTW87vpTHz90bkJTl_rn8r4L6gc-nP1pm37CQtxw==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_235626_695254_37C060C5 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Xiang Wang <merle@hardenedlinux.org>
Cc: "citypw@hardenedlinux.org" <citypw@hardenedlinux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From 12300865d1103618c9d4c375f7d7fbe601b6618c Mon Sep 17 00:00:00 2001
From: Xiang Wang <merle@hardenedlinux.org>
Date: Fri, 6 Sep 2019 11:56:09 +0800
Subject: [PATCH] arch/riscv: disable too many harts before pick main boot hart

These harts with id greater than or equal to CONFIG_NR_CPUS need to be disabled.
But pick the main Hart can choose any one. So, before pick the main hart, you
need to disable the hart with id greater than or equal to CONFIG_NR_CPUS.

Signed-off-by: Xiang Wang <merle@hardenedlinux.org>
---
 arch/riscv/kernel/head.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0f1ba17e476f..cfffea38eb17 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -63,6 +63,11 @@ _start_kernel:
 	li t0, SR_FS
 	csrc sstatus, t0

+#ifdef CONFIG_SMP
+	li t0, CONFIG_NR_CPUS
+	bgeu a0, t0, .Lsecondary_park
+#endif
+
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
 	li a2, 1
@@ -154,9 +159,6 @@ relocate:

 .Lsecondary_start:
 #ifdef CONFIG_SMP
-	li a1, CONFIG_NR_CPUS
-	bgeu a0, a1, .Lsecondary_park
-
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
 	csrw CSR_STVEC, a3
--
2.20.1








_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
