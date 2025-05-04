Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A76BC369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6FjnjsmMPBqMTV+cEdzb9nqq/y862GN25jsfm5oxWq0=; b=A2vYIJaGDmGbJ6
	+R341/+BbCOJmNs7cxG+hPUi14IuaJhwkMWqrjUkxgn48MDRSJm+f4ObKj4kDnb+ThA3ryRTaue7L
	DVk4LnW+ZW3VAf4ETKLjcD5kvMMJE3obXSJ6aZ1SC8go9K0+UHdLVQ2y4zEJi0y9MpA+s3p2G+vI+
	PQW/RWZY+lXhTHE70XVkCwripZEvF4PVVklYSs0orAT8GJKRo3mywMUpNFu7UDp8RLgicVGHMmdsk
	Phhvws6aBYNLgNDZTFHv4CdURZ/wvmn3Ildi7FzS0YbAhkwtFGde8P9IJjfw4sykbTffrO42qCRiP
	3+Jq8OC/i4X9QC+xNtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWRd-000000059zl-2eEv;
	Sun, 04 May 2025 10:19:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWRb-000000059yh-11Js
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:19:36 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746353970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jfl7SNXUW9QYMi5IdJsuAK6+WDbLVdSs2AEZKeOH8eo=;
	b=G0mu5QtnRB2C2Jr/mXDF6LW+tpTJ5RyHja/nqS6uGtlSLT43QUkBsbkYd7TcQN+G9wFLgr
	WIK/tu6GTUDjMPizI5qndS8zUro5Mr6xSNpUWlIubE+Dj3Fp0RmulFvuiHkQZsDKsVMLEK
	l+DX19+gay6Fb9NmQfJwG7GhkRM1U0oDdgF966qgc0tQDJFJHulsSISYmbv+fYlacai0tP
	LfYnO5BY/8K3DAxdJDgoSsHrpyJ7DySuCFD6Qz7JyoUdGkpPxKElVCJjXWDwiwoiqUqwGZ
	3yLheynP3GDV+PQsoHMOA7ja2ndz34GJB0nOSZd76QgTIx0zAsnfA6urcHhluw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746353970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jfl7SNXUW9QYMi5IdJsuAK6+WDbLVdSs2AEZKeOH8eo=;
	b=WDUKrNApCeBn1j43PZF1WmP+DXkiGtG31xxSQxqtGVor3nXAXAjSjqxTmtewjBjrjS/WC2
	g+xugQG1ONBsOBDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Date: Sun,  4 May 2025 12:19:20 +0200
Message-Id: <20250504101920.3393053-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_031935_422180_B6670434 
X-CRM114-Status: UNSURE (   7.34  )
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

When userspace does PR_SET_TAGGED_ADDR_CTRL, but Supm extension is not
available, the kernel crashes:

Oops - illegal instruction [#1]
    [snip]
epc : set_tagged_addr_ctrl+0x112/0x15a
 ra : set_tagged_addr_ctrl+0x74/0x15a
epc : ffffffff80011ace ra : ffffffff80011a30 sp : ffffffc60039be10
    [snip]
status: 0000000200000120 badaddr: 0000000010a79073 cause: 0000000000000002
    set_tagged_addr_ctrl+0x112/0x15a
    __riscv_sys_prctl+0x352/0x73c
    do_trap_ecall_u+0x17c/0x20c
    andle_exception+0x150/0x15c

Fix it by checking if Supm is available.

Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/riscv/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de77180..3db2c0c07acd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -275,6 +275,9 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	unsigned long pmm;
 	u8 pmlen;
 
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+		return -EINVAL;
+
 	if (is_compat_thread(ti))
 		return -EINVAL;
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
