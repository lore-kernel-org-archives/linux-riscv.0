Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726A6C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66u0pIpSnw9lwauc+0erats9HQHJ8B9OZSlJOTSlrJc=; b=Kko5Xmb7mfgAed
	LFStW141CoKunX6MgG39JjWHIZuPnx+xK42laS8aeFhNWLbYdd70PdNcXuV/bcmWiIK0LvAO1viOX
	24bIPazQFKNKb1xWkA/BdfoM2wxW/SFaHsR+QpDo0b9GrNAV9y1apI0Tt6NprVz/F8zeBDP3vbEIW
	DmFSrw51IIvoOXXkVUOEe9A1L6FRmlWX7lewii1YR6TYuSYDUVO+m26iIoapx8Jlr0eqULCoX82Hm
	3vxyAkcnRY17UVI2EACDImVUReGWnqBWrnueNnE5kOwkNn7utu2+RXCQwciv1IYTHM+JX7jQs4xLF
	tIRRmITwxTPdg6SIdpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxJ-009ujL-1y;
	Wed, 17 May 2023 13:12:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxF-009ufJ-1N;
	Wed, 17 May 2023 13:12:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E626564717;
	Wed, 17 May 2023 13:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335BEC433EF;
	Wed, 17 May 2023 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329152;
	bh=wIpq6dQ3SrZ+OFpGPswN9m0xaTqULZnHSrUinkSrQZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sXIvKHQgTrqznMJvGuTDhX84E9WFuYptr8V3Ek7xw2qzSKUVOylJd5AIRFHWD43cs
	 rY9FXAfbijzhcRJ7xB3TlUNAPXZltMOT2Gu4HfBs6rSenBQe9xDB/DkigljyzJ5y0q
	 NqniEOZEjINgmXRhB2DOJQVMCw6aB5m5fkNbmxq0hQ2kjVyy2Rz5uAkz1lxR6GK/pc
	 kmDhZQgZnArP9xfDPRLQii+MbSH3WYm82+2YK1Gsm9qH0+4zeAr7ziGBnxhAtpe3t7
	 S5c12dcl36AQVcUIP/lTS5gtzL2FAYQNXRSkp6OFpQMsIrlhIqSx17r+jWyW/eaEgJ
	 v4/2vi76yp1wQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 07/14] panic: hide unused global functions
Date: Wed, 17 May 2023 15:10:55 +0200
Message-Id: <20230517131102.934196-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061233_508013_43B74C91 
X-CRM114-Status: GOOD (  14.05  )
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

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows warnings about two functions that have
no declaration or caller in certain configurations:

kernel/panic.c:688:6: error: no previous prototype for 'warn_slowpath_fmt' [-Werror=missing-prototypes]
kernel/panic.c:710:6: error: no previous prototype for '__warn_printk' [-Werror=missing-prototypes]

Enclose the definition in the same #ifdef check as the declaration.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/panic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 886d2ebd0a0d..10effe40a3fa 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -684,6 +684,7 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 	add_taint(taint, LOCKDEP_STILL_OK);
 }
 
+#ifdef CONFIG_BUG
 #ifndef __WARN_FLAGS
 void warn_slowpath_fmt(const char *file, int line, unsigned taint,
 		       const char *fmt, ...)
@@ -722,8 +723,6 @@ void __warn_printk(const char *fmt, ...)
 EXPORT_SYMBOL(__warn_printk);
 #endif
 
-#ifdef CONFIG_BUG
-
 /* Support resetting WARN*_ONCE state */
 
 static int clear_warn_once_set(void *data, u64 val)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
