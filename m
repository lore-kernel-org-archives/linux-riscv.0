Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2753C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9UmR82Zq7T2sgigRlCja2AlCa8StD82F8B5jzbfdB4=; b=tab2K5aJsVY0k4
	js/OkIW8CP337lDNKxYJHGExdZZlDGB+Kn3br+ihSTO+uVVlIZ8faElnUDHWCW99/0K2uiynzHgf8
	+84GQinwy757IYHrvdf6v5Qe9+e0NuNXCoI+FR1b7KPtgekdNQTaZ2jHYLIcjMubQ/tdk3RnLL22D
	ZsRPOp6MhdrVrt6475nZi43DSfGwse/KsD/ZGe+Tn6XZB/NonqZ3H/B6lpO+MvcOKcEQNu1dOo0NJ
	aFStQmCY1wXiBc2irNONzhKF4gbW7ONPbbKc21hTaVVlp4O7QuEfJWtt+XfPUeDos+YAsFyX67eWd
	Ob0Js9uZO95oaLl8MlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwv-009uNF-1y;
	Wed, 17 May 2023 13:12:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGws-009uKP-1W;
	Wed, 17 May 2023 13:12:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF48963B88;
	Wed, 17 May 2023 13:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E219C433A8;
	Wed, 17 May 2023 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329129;
	bh=m4CC8jzjsL/DB4zhl/Y597jyiUuMzUYclEl5YRgzTWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6TCINxJI0woqSGR6ssIvaSj6epLLVO81LOzyVaPT8/vzZI9AB8IWfkQCSXQEHhXj
	 emmu7MtAnphbx6efp3NtZZlhdUPe7PobFSbrgE0GW1MxwsjqRKhXtsARowKgI7TJl1
	 M8K+xUmMlgWQeI0sMhDqBlo2KcTRfdwZaRrzSuAmdzwi2gCudljKNjdsRsUPUgknLD
	 dFngQPAXjy/SCR0E/q5jywBkSs9H4bdCiuKXgEHWHkpEKogI02+rydRudhNs/4FwF/
	 rKa/Win+V5kAOFnp1Q7tVYGNdR9eUslE6Gou6+cruOq5EcoezzwmGP3r8Tp1Dhm35i
	 hSLiw0TbCv7FA==
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
Subject: [PATCH 04/14] audit: avoid missing-prototype warnings
Date: Wed, 17 May 2023 15:10:52 +0200
Message-Id: <20230517131102.934196-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061210_594283_A9396F50 
X-CRM114-Status: GOOD (  15.77  )
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

Building with 'make W=1' reveals two function definitions without
a previous prototype in the audit code:

lib/compat_audit.c:32:5: error: no previous prototype for 'audit_classify_compat_syscall' [-Werror=missing-prototypes]
kernel/audit.c:1813:14: error: no previous prototype for 'audit_serial' [-Werror=missing-prototypes]

The first one needs a declaration from linux/audit.h but cannot
include that header without causing conflicting (compat) syscall number
definitions, so move the it into linux/audit_arch.h.

The second one is declared conditionally based on CONFIG_AUDITSYSCALL
but needed as a local function even when that option is disabled, so
move the declaration out of the #ifdef block.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/audit.h      | 2 --
 include/linux/audit_arch.h | 2 ++
 kernel/audit.h             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 31086a72e32a..6a3a9e122bb5 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -130,8 +130,6 @@ extern unsigned compat_dir_class[];
 extern unsigned compat_chattr_class[];
 extern unsigned compat_signal_class[];
 
-extern int audit_classify_compat_syscall(int abi, unsigned syscall);
-
 /* audit_names->type values */
 #define	AUDIT_TYPE_UNKNOWN	0	/* we don't know yet */
 #define	AUDIT_TYPE_NORMAL	1	/* a "normal" audit record */
diff --git a/include/linux/audit_arch.h b/include/linux/audit_arch.h
index 8fdb1afe251a..0e34d673ef17 100644
--- a/include/linux/audit_arch.h
+++ b/include/linux/audit_arch.h
@@ -21,4 +21,6 @@ enum auditsc_class_t {
 	AUDITSC_NVALS /* count */
 };
 
+extern int audit_classify_compat_syscall(int abi, unsigned syscall);
+
 #endif
diff --git a/kernel/audit.h b/kernel/audit.h
index c57b008b9914..94738bce40b2 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -259,8 +259,8 @@ extern struct tty_struct *audit_get_tty(void);
 extern void audit_put_tty(struct tty_struct *tty);
 
 /* audit watch/mark/tree functions */
-#ifdef CONFIG_AUDITSYSCALL
 extern unsigned int audit_serial(void);
+#ifdef CONFIG_AUDITSYSCALL
 extern int auditsc_get_stamp(struct audit_context *ctx,
 			      struct timespec64 *t, unsigned int *serial);
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
