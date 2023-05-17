Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECA1C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMBtztfwbv4XX96o7hFSPGHnJeyoQXoQVUa4QecqsIw=; b=BC5TKnY5f6RDXM
	Q9skBUzw9QEjtZuwrzLr0Z9Rfok6bjZqa+q718cgD97eLBMwWlyi7Ntp8bfB2AN/NDC4C+3M91z9q
	55F52v1g7rvmE8XKZNiOqNp+OmGbf4o7ksklH+N+2B9qBbJcJ5W1Qmj/ZmzvoqaPvekbviiIiAVLS
	fhswS1O6yChLCkbPxOJdBBZxZ+tUpSXkrVd3Ye0gwOYXTKiBSfiHI2hzHEC6T2Zw5k7ke+zveMfRU
	iW5OohxWVzY52BxpseOCRwsaK0EPCGM5Tl4mm3YYBUfmNhOWbWA1QA70IG7A1suwLe36Z6duRMzrP
	u35dUskFDDZBzKZ5jzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxB-009ucs-2Q;
	Wed, 17 May 2023 13:12:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGx7-009uY4-2p;
	Wed, 17 May 2023 13:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5223764715;
	Wed, 17 May 2023 13:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF66C4339C;
	Wed, 17 May 2023 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329144;
	bh=gekqQcdwspAqcYmV4wkiul0gbNa5okADC3lRsox7SxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhmQcB6Wb+ZcCRzLdjmx7/zFED4SNzs0NBaokc4G4Ef+SjGqplVRCUUlj8VOql7xc
	 tVzUvC/YohY4HXanpHjF8gzBHtwkxcmoYXP+MIQ4qBiVNrFkbviwAVNhlQFEM5aG9z
	 u0KG2wrGCIiO4fxkS7CsDg7SKssZvao8JQ1WexuQEtCpz47qaTuW3Z1bOQL/MmRcVt
	 J43Gz9r687q17jYwvjwLN9fs0kn3xObEo5/anSq7dT5iAh0lVVtxnk6xLq54trRwvy
	 bwp4gagapMiXtQeSik0KOYf0nVPAhKydrIyt2a5DIE7rfoyB8tfvUPUW3O+QL/VQu3
	 AKt6l4x3F+ppA==
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
Subject: [PATCH 06/14] locking: add lockevent_read() prototype
Date: Wed, 17 May 2023 15:10:54 +0200
Message-Id: <20230517131102.934196-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061225_958837_8DEE50F1 
X-CRM114-Status: GOOD (  13.10  )
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

lockevent_read() has a __weak definition and the only caller in
kernel/locking/lock_events.c, plus a strong definition in qspinlock_stat.h
that overrides it, but no other declaration. This causes a W=1
warning:

kernel/locking/lock_events.c:61:16: error: no previous prototype for 'lockevent_read' [-Werror=missing-prototypes]

Add shared prototype to avoid the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/locking/lock_events.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/locking/lock_events.h b/kernel/locking/lock_events.h
index 8c7e7d25f09c..a6016b91803d 100644
--- a/kernel/locking/lock_events.h
+++ b/kernel/locking/lock_events.h
@@ -57,4 +57,8 @@ static inline void __lockevent_add(enum lock_events event, int inc)
 #define lockevent_cond_inc(ev, c)
 
 #endif /* CONFIG_LOCK_EVENT_COUNTS */
+
+ssize_t lockevent_read(struct file *file, char __user *user_buf,
+		       size_t count, loff_t *ppos);
+
 #endif /* __LOCKING_LOCK_EVENTS_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
