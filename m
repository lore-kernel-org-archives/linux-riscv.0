Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FABC77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mj03HR0sWxpf22CyZftN5aVGyvHkohnFZ8Fgzhre13o=; b=g8wMs7RJpYUztj
	gdAWNbzKBr7CqE4Oh5RbyGRHy8AWAneZymWQRtk3VjepkQ+X3yKeQJdNI1TjMAqeOwejWFUxHhk2H
	TdqMn+GsYa/ydl8x9o83aFlQn3ZV1KILIjduLYmxegTwlKo0E0wlP6wbYSEpo1evglbLp5stok40C
	JFiSqCciRJAhiF1TxzTtLBVBSYyVYIIt4t4h25p9dkbfbNQ2WRtZtWVBHe9a7OVjYnBN+TKOFrA2m
	t2IoIyYv4oxuGexQavqymQLiICfu6ldyUK2Ai6TjHKcCXO++J/jU6RkBZI5UgLgj2F4pIE3+yYRwl
	GC1uzfaJYPboHolECx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxg-009v5r-1C;
	Wed, 17 May 2023 13:13:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxc-009v0s-1J;
	Wed, 17 May 2023 13:12:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E097A64719;
	Wed, 17 May 2023 13:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC7AC433A1;
	Wed, 17 May 2023 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329175;
	bh=jyfIU4kb2iohIZExECeJDgccrpywO2d4N5RO4/Lz9/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5AKMGQ6H8c4SmWJA9acjTbaFCzZ0AA2wm05BPlzt7RdfOUiogdQAYWE+G+NGcZdX
	 yDjsODiNdpDTqKlvtQXPCuaGA3VC6/f234nMehw9xGV/czmg096DJmqiZsDf12qqFe
	 ej546ikNtCrc67wnEUFw1c3f59H4n265vxwBWYFw7f1ACFpU/dNvgnfSCj3KARvmhc
	 okU5JO6mfHibgPJap1ViK2c3byQdkDKbjHgzIgRlSYBev2T0JJyKlGkP2OUNIdoni8
	 hQe43lij086yvsSwf3Lz908iMLuTejdjlTVVg35FM3ecRVrHkCom9/KKxw7ZIB2uTs
	 DJJKGGvs0X6mw==
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
Subject: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
Date: Wed, 17 May 2023 15:10:58 +0200
Message-Id: <20230517131102.934196-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061256_507002_A79370F0 
X-CRM114-Status: GOOD (  14.19  )
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

The arch_resume_nosmt() has a __weak definition, plus an x86
specific override, but no prototype that ensures the two have
the same arguments. This causes a W=1 warning:

arch/x86/power/hibernate.c:189:5: error: no previous prototype for 'arch_resume_nosmt' [-Werror=missing-prototypes]

Add the prototype in linux/suspend.h, which is included in
both places.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/suspend.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index f16653f7be32..bc911fecb8e8 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -472,6 +472,8 @@ static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 }
 #endif /* CONFIG_HIBERNATION */
 
+int arch_resume_nosmt(void);
+
 #ifdef CONFIG_HIBERNATION_SNAPSHOT_DEV
 int is_hibernate_resume_dev(dev_t dev);
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
