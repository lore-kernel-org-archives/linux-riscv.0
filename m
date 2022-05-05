Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBF5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 08:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h3dRf/7AW3Jtcd7DbME8OZUq+6gqHCC0G6vqaRruNzM=; b=bIlo9OspCl3C1v
	La5GjjMqLAvCiVBOeKMu2FYGeyZBaE+sXszgE9oMkC/0c6kJaAM+ZAqWj3Sq+VMV3YfGUydrrDroR
	pyr+d9gI/AfF53vChJ4aO1mSH4Hk2YGRNW1OmbUBzpM1v4OZ84Mznkgjv0eGAoQcNus9ZJoVuX+T4
	zlsKgHWh52iVgKlanezB6v4HvHiWvVqNYvpSDjrxVOPl/efpOcOOdRFwHISbvo+jKDo64MNfhYRcI
	GJA4wjt7XYOJiG/Bb6Ak+49CE1Lf2lYc/TlrC21l5TXNr2zPzkmxxv4Xz3EVCvql1x3x+8MHQ6wkc
	WYgdBG559X7dPY+fwl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWoq-00Efz1-2J; Thu, 05 May 2022 08:26:40 +0000
Received: from sym.noone.org ([178.63.92.236] helo=sym2.noone.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWoZ-00EfpR-Hu
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 08:26:24 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4Kv65g2Lwvzvjfm; Thu,  5 May 2022 10:18:15 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: [PATCH] riscv: Wire up memfd_secret in UAPI header
Date: Thu,  5 May 2022 10:18:15 +0200
Message-Id: <20220505081815.22808-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_012623_770611_F0B63DDF 
X-CRM114-Status: UNSURE (   9.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move the __ARCH_WANT_MEMFD_SECRET define added in commit 7bb7f2ac24a0
("arch, mm: wire up memfd_secret system call where relevant") to
<uapi/asm/unistd.h> so __NR_memfd_secret is defined when including
<unistd.h> in userspace.

This allows the memds_secret selftest to pass on riscv.

Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/riscv/include/asm/unistd.h      | 1 -
 arch/riscv/include/uapi/asm/unistd.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 6c316093a1e5..977ee6181dab 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -9,7 +9,6 @@
  */
 
 #define __ARCH_WANT_SYS_CLONE
-#define __ARCH_WANT_MEMFD_SECRET
 
 #include <uapi/asm/unistd.h>
 
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 8062996c2dfd..d95fbf5846b0 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -21,6 +21,7 @@
 #endif /* __LP64__ */
 
 #define __ARCH_WANT_SYS_CLONE3
+#define __ARCH_WANT_MEMFD_SECRET
 
 #include <asm-generic/unistd.h>
 
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
