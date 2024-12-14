Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A44E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 04:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PT/Hp8EtGvakr8ba2tFSfP8hsmKGNWURPK3FvX+ZQhE=; b=merb/wlc2lnZQi
	dBFfR6AdfhRQ4b+Z0p4WmQKNAfg63dpAhCEDgEbwAloSjt3l5xArYj/iRCXpnQ6uF4NkEAcjbArDF
	/7vesq5bSWRc+21e/EN/tuCfXm3IyR1/tG/C7hzbOqPI1pKkB00mcoFvrCjEWlqIerlAYnYXOsXcC
	r0L9HGKA1DQpT4HIFVGQUMTLqJ9O/DuVYOdxG+LLspp1sgmT1krXt4yD3lP8cofkbFrzIxaBAlKk0
	Fe0QOhAJR1zNatccet+AP2KkcmMVk4J0JUUVd3bpkXfFjB8PAMbXQCy4WwNT41T5dX8VHQ8mM6XN4
	3RwsGz7b+8KukOHJbgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMJsQ-00000005hXX-1XEn;
	Sat, 14 Dec 2024 04:35:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMJsN-00000005hWX-187X
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 04:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D707AA400B8;
	Sat, 14 Dec 2024 04:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBEBC4CED1;
	Sat, 14 Dec 2024 04:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734150930;
	bh=mmMDThyct6EjeRdz+fnJe0nY/rASetZ3DPQ1Cq8H384=;
	h=From:To:Cc:Subject:Date:From;
	b=E4BkmSnedgzzT4cVwOmNzbEN+zUhDvU39RGbzF6nDW9RtB/W8rbalUutbh9LT8p3J
	 KzHeXK0OliI9AFwc0tncM/gdseC1bR0Az1vbgeJtAoqPOsrZej8mnL7qxLxQrESzXQ
	 lTqUyhZpkKSYruLIXDGUl4tJ1h099QU0qIWh2awY9lLzXGulQ9hinIbTVOTGhX5qJH
	 7DI+Fu/9tAGf0nx1WU6AUyR/bgNFWWTQv+Z/gKB2ZKTpsOMNTYwa2aNyS7U7swokwE
	 m0KexztfVqwb7C/G0BC7kLDRChtYa+m71niYrtX5pNwEenASPYw3sQ+ONk+yuBzxjv
	 CJQpjW/qzcLhg==
From: guoren@kernel.org
To: guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	bjorn@rivosinc.com,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	corbet@lwn.net,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: Add riscv_force_qspinlock for early_param
Date: Fri, 13 Dec 2024 23:35:10 -0500
Message-Id: <20241214043510.3795984-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_203535_381111_DD6E5D97 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When CONFIG_RISCV_COMBO_SPINLOCKS is enabled, permit qspinlock
force enabled. See the Kconfig entry for RISCV_COMBO_SPINLOCKS.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 arch/riscv/kernel/setup.c                       | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3872bc6ec49d..43d0df2922b2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5887,6 +5887,11 @@
 			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
 			CPUs.
 
+	riscv_force_qspinlock [RISCV, EARLY]
+			When CONFIG_RISCV_COMBO_SPINLOCKS is enabled, permit
+			qspinlock force enabled. See the Kconfig entry for
+			RISCV_COMBO_SPINLOCKS.
+
 	riscv_isa_fallback [RISCV,EARLY]
 			When CONFIG_RISCV_ISA_FALLBACK is not enabled, permit
 			falling back to detecting extension support by parsing
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45010e71df86..74b13bc64c9c 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -247,6 +247,15 @@ static void __init parse_dtb(void)
 #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
 DEFINE_STATIC_KEY_TRUE(qspinlock_key);
 EXPORT_SYMBOL(qspinlock_key);
+
+static bool force_qspinlock;
+
+static int __init riscv_force_qspinlock(char *p)
+{
+	force_qspinlock = true;
+	return 0;
+}
+early_param("riscv_force_qspinlock", riscv_force_qspinlock);
 #endif
 
 static void __init riscv_spinlock_init(void)
@@ -267,7 +276,9 @@ static void __init riscv_spinlock_init(void)
 		using_ext = "using Ziccrse";
 	}
 #if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
-	else {
+	else if (force_qspinlock) {
+		using_ext = "force";
+	} else {
 		static_branch_disable(&qspinlock_key);
 		pr_info("Ticket spinlock: enabled\n");
 		return;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
