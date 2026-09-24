Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DDC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZXljjmibLi5VRcDmkmxNN/Y7Q/EGn7HCLvQHeA76O3k=; b=oDcDLmzHgTNqGG
	dfmZwsSg2UGKGs+fJPVaFYhN7zZYfDbQVvIlOFWivFjDk5ilj0PFY0wead5IMKCJnHqREv5TiqfGC
	I1Tv0nJi6dwb4dlssFJ7+h5uZXoLsDFeCFKoKvlTM1tsnLGH7Z8KmhaQT1EUL/aGZ+QfRwI0CZP27
	zE0qGZ0Ml28jh8ItID3Y7pIEJU3/6lSBH66q6buhpRjDFzy7abqaUGeMIRZK5bV/rW9zf8kwE7CUq
	kLWZrPyZkjWkcEGEH8vAgrKq/oC+/+6GywwdUWIoWAS9uK2QAhZ4EwJZAuuc9sqbaPeHYjrseI7qW
	mmmWRKaVwvgZ2gVGplCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9r4B-0000000CE1J-2gIY;
	Thu, 24 Sep 2026 21:33:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9r4A-0000000CE19-16nt
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 21:33:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56126600D4;
	Thu, 24 Sep 2026 21:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35C21F000FF;
	Thu, 24 Sep 2026 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790285597;
	bh=Gw17LO6QDibHnMy6NnQskiCePw9Il8gsoCqiPVTZRdU=;
	h=From:To:Cc:Subject:Date;
	b=oQVXouXSFS2R6CUhUe92NT7fhDID1egh1xFWicaAuNMqrQK+8W66njeo6lMJ0rxL7
	 wDExtQr4oyLQwhx/jaDXIvcX86z4+0Hi2FG3/8RW5hDzmxVq7kX3X0bBkE7c3eCRbs
	 0HH5MuPykZftMpDpc834Mw7ypVQC4sJoHENqKCZHXdrxhv+Nerhc+O6BCUiRGWb9Bi
	 Jnsz9EiDegmO3JkzwvrqopOh5KxMQNissdz633/BgdEvU+6c43F5y+KhtMeheznR0d
	 Lbca6gpl7uNEm47FQeHOosr7aJHeXv/vGiWs0dZCIQMzSk3gVUtSU3ufwEq99JqIh5
	 a/50e/jEJGlqg==
From: Thorsten Blum <blum@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
Date: Thu, 24 Sep 2026 23:32:55 +0200
Message-ID: <20260924213256.122530-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=blum@kernel.org; h=from:subject; bh=xau6Nm+dSBULnBcKscDp+maoooa7Of79tf/PHM8zSTs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlbp3OstfkumLdv3pf5sqZtm3WYmsMKdR6VHTbbIzDDR OxwboxkRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkmS4jw7TFWoeEDk7s3KIU pTPXN6zRyPr6aq+d733iP+rElNuy+DL8d77T/72f3bP9+prubKOWd+azLJse9ug7h9/MZuSeaRz FCwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

Replace hard-coded strings with the str_supported_unsupported() helper.
This unifies the output and helps the linker with deduplication, which
can result in a smaller binary.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/riscv/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..967c27f2ae25 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/string_choices.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
@@ -134,7 +135,7 @@ static int __init compat_mode_detect(void)
 	csr_write(CSR_STATUS, tmp);
 
 	pr_info("riscv: ELF compat mode %s",
-			compat_mode_supported ? "supported" : "unsupported");
+		str_supported_unsupported(compat_mode_supported));
 
 	return 0;
 }

base-commit: 5383cf280ef4f00b15f1d9e2a2886d0d02c0118b

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
