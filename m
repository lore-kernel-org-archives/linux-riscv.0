Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B15C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1Klq47FqiibsTMhxXEGQCGZdse1qk186Qn/imMFbQ0=; b=BbqRMaJ7UbeVHN
	VjZscq6OsAb+9x73HGmpTR4pVpW51uMoeFgYfJ1FpS9Lb/uCMkWCqExwTQ5cRmvd4ocTa7b1ep1J8
	Mewe6KrQwjOQALVHJh5EcNR0Q0vNapJ8BGjwxRTKIOHu7QleUiqPUI2fJY9rn0tfq/M+xrJURKpH+
	jpTQJy/d7sRHb5bhmLk5vh84tA0iXOcsOvF1lgk7WZ5Im7Tfl9ZbQhb8fpMZJfcNb2VUEiPMevrfm
	rIIZvF8gNaQkFjsXbUBr9ogBjLTLYVrpDB1/q6b/Ng9dBWG3ocacdjSFXkxglRqt2ZcUVHClUOvJs
	tbO070tDLAKtY9ry2/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIyO-008S7l-26;
	Sat, 20 Jan 2024 21:33:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIyJ-008S7Q-1v
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 933BACE1051;
	Sat, 20 Jan 2024 21:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86040C433F1;
	Sat, 20 Jan 2024 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705786423;
	bh=ggK882gPcvFDbkLHIJzDPNuG5aqZmqVFz9H9u19MILY=;
	h=From:To:Cc:Subject:Date:From;
	b=XkKzrtQKGts2brCMmCZ5q/1ZCSjfXbAirPlxQTSwPxe6qmbN2steOWoMR4p9y3UdP
	 LXOjz1dpAhLP+ZCe2lGm+SCqaZw0ru3FZn3KXLeKvumzOIfX3TZGLQJbwDZNpT+aJf
	 zPvPm3w1712JBE/t+sBC8m1a5ZYNMezNVrlTGgHSpbYZ+nibs5WOgBU80WOA8cFy7i
	 0inlxtT0T3JBx90zpNz4p8nNlXKv8sI3ugocmyez//3n4b5IVmUHFntaF2MclIa2l/
	 u2g6upW94BVJO7qgT3QiSLORsIK0bDvrghj2ztyHor7ZbCECVOoKLhlbglVGLgVtqq
	 mqz8g9cusUPfw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] riscv: remove unneeded #include <asm-generic/export.h>
Date: Sun, 21 Jan 2024 06:33:11 +0900
Message-Id: <20240120213312.3033528-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_133347_812343_FEB6B0D1 
X-CRM114-Status: UNSURE (   8.54  )
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

Commit 62694797f56b ("use linux/export.h rather than
asm-generic/export.h") replaced deprecated <asm-generic/export.h>
inclusions.

Commit c2a658d41924 ("riscv: lib: vectorize copy_to_user/copy_from_user")
introduced a new instance of #include <asm-generic/export.h>.

arch/riscv/lib/uaccess_vector.S does not use EXPORT_SYMBOL, hence this
include directive is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I CC'ed Al Viro in case he attempts to replace <asm-generic/export.h>
with <linux/export.h> again.

Commit 62694797f56b was suboptimal because arch/riscv/kernel/mcount-dyn.S
does not use EXPORT_SYMBOL. Removing #include <asm-generic/export.h>
was correct.

I had submitted a patchset earlier, but it was not picked up:
 https://lore.kernel.org/all/20231126151739.1557369-1-masahiroy@kernel.org/


 arch/riscv/lib/uaccess_vector.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 51ab5588e9ff..7c45f26de4f7 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <linux/linkage.h>
-#include <asm-generic/export.h>
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
