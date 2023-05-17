Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48216C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwUX4XQjIWTvJNX3TCBG+3DWZsvn/mdt7ubD2bJn9UI=; b=rfgQ7UqQtLsIdu
	7bmdW9OE3O2DbCulwt7GkZsC0isJffo63uRmfr4JixDJDKtloCchhpdkLY0E12XgJxlvMS1Q2HFhf
	ZyHFi51pf959Y/MHavG3iTSuyH7qSCkByn/pNNXrGpuBH7okk0708Vp52lzwlEKlVO4oA4mzxqH7x
	w/kbDVAgjs2KICq6o2kiwU6xQvAn0e2tBO9p5tkOzOeR8xV0iNMVk0VNjOia9UGs6XkATS7hV05NT
	qppEpKE1QSB6YACZ0DUsYkJtbaw4hJlkgUA+f4hMD0H0c3vqYPy1kUttQK6bkVghtqfo4gzXOlaOo
	cjfazqbPaQYNlvsY60Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwo-009uHu-0S;
	Wed, 17 May 2023 13:12:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwk-009uEf-2G;
	Wed, 17 May 2023 13:12:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49DC4646FF;
	Wed, 17 May 2023 13:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E14AC433A1;
	Wed, 17 May 2023 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329121;
	bh=ZEuLmqNfBu4LwIeDkvzu7YMjKyFq0rMolN8SHAt1hRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EYIGhjskS/xv5B1p/ij9PND0/tmwkdiUYlvegDshPwFUbpxuTFyigABp4MTrw0TuQ
	 P78r6F9mokfxX2GOn5NNxJ7Y8gpKeQ2JIJPOlwKyXwrocJSsJPMgZ5so90ndZnWLIH
	 aGDrxnHeZ7PSsfX8ujY8+iBUJh64lKQ8tuj1W6/9ZjHk9UY72TP6XbnI7D4PlCH7We
	 aaUModTzCCSrDAZVc+++qyvzPpkjq5ahpjt1CIVik3sjBmumD9LM7YmBA788qeLjcM
	 2OMcn8FcIbxKuRPscWnHIx9nPzp5O441qpjTVop2Tg6G0Jcnayutfz950N7PCb338P
	 sb4vFIfH5scjQ==
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
Subject: [PATCH 03/14] mm: sparse: mark populate_section_memmap() static
Date: Wed, 17 May 2023 15:10:51 +0200
Message-Id: <20230517131102.934196-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061202_790133_B1130196 
X-CRM114-Status: GOOD (  14.96  )
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

There are two definitions of this function, but the second one
lacks the 'static' annotation:

mm/sparse.c:704:25: error: no previous prototype for 'populate_section_memmap' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/sparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index c2afdb26039e..b8d5d58fe240 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -701,7 +701,7 @@ static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
 	return rc;
 }
 #else
-struct page * __meminit populate_section_memmap(unsigned long pfn,
+static struct page * __meminit populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
