Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CE9C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dWALGt6xt96Bw1dbWvae781m0kHp3M5ElydlDeAUas=; b=aVY+9D1EaQM/4c
	hdlyMsQfUC6QiSBQ4X7/mhe9WhkUNoed3W1c54ipE5OWKrETEN7mN5TvAUOq0ZVhu0orS2M57iLIB
	m6Pm6kYLdfuXp3fg/cVrz0xdFKCX53rxEI1ZtZh9k7MEZR4aoN+EbPo5OS0MwGJBL0FFCeL7bO4VZ
	5XWLmgZpJhXunsNq3lKW/zeqZ14dGaCC7BoypNwISiTYBNEL1h1LtnPrf3yOBmERzbzi+igiyWwiI
	OBUmGVXFD1mqtHDo3q/NPGnUFLs5E/KfmdzUGz4mKyf3JD+7Y8WxsnY6211Kiqjtz7rVcwNhQlFXj
	B5vQhskcDkJnzST3q2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwZ-009u7y-29;
	Wed, 17 May 2023 13:11:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwW-009u6L-1k;
	Wed, 17 May 2023 13:11:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBCE1646FD;
	Wed, 17 May 2023 13:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C17AC433A1;
	Wed, 17 May 2023 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329106;
	bh=3mI163DMR4d+cuXu5u65rsW45kyqp2CKp+3eSlb6arE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fc6SUEmSZTQUkEUQjfQXj6txmruIJCzCuO4Ae3j0P53kfZPDs/OWZkdHVUzrtWv5M
	 0rPrYmGV3lkc2LdVoiXnN0tesbaj+I+HdnU+5OYNZ19tKdQSCcQFdCfF7CIjRf43g3
	 HHrOqIEp3ibRRhUsGRDH+Iul9ef7vI7xGy9SOg7wZXkSxKf5Bbrmmph902wZT+4dAO
	 hkBdrDx6I/lx0He0nfCXC9E/60W8qZMraYv4eYeOaM6lvyD6ZDXWH5H+onPY0eEF1E
	 Z4hxRtdg3qOggQ4VULZzLpo6PInRLslC9REuvbQ434IZjCDyjjo139W2Et9i6tb9pM
	 t75TKQPb0GvKQ==
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
Subject: [PATCH 01/14] mm: percpu: unhide pcpu_embed_first_chunk prototype
Date: Wed, 17 May 2023 15:10:49 +0200
Message-Id: <20230517131102.934196-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061148_628255_6A12866F 
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

This function is called whenever CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK
or CONFIG_HAVE_SETUP_PER_CPU_AREA, but only declared when the
former is set:

mm/percpu.c:3055:12: error: no previous prototype for 'pcpu_embed_first_chunk' [-Werror=missing-prototypes]

There is no real point in hiding declarations, so just remove
the #ifdef here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/percpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 1338ea2aa720..42125cf9c506 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -103,12 +103,10 @@ extern void __init pcpu_free_alloc_info(struct pcpu_alloc_info *ai);
 extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 					 void *base_addr);
 
-#ifdef CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK
 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				size_t atom_size,
 				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
 				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
-#endif
 
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 void __init pcpu_populate_pte(unsigned long addr);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
