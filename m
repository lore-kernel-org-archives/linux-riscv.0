Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143CE606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Edks0TfgqA++srh9ToHA3cBB0O3cPNEWsetfQALJpVw=; b=DrH7y8qkYCa7tpbLMe25uLww1x
	F88q2BZwpFHOCIsx7TNp4fApNlkqSq3db0G20/hapNKe+kP8yvVYFiEIIjGJLvajlcoKMrD8rMpDe
	C7ZQVMbM92Cq9UuJJyEKvLUdeakIzq9+KYc6ZK7FJ5WNIIMgz206JN5iIVC/TcplaOdnxfTqcHMF2
	dZWoEV5b1hkKtZQHCOZomOVggkGV5IxtV+3uSF/x6CIAt/To8TyO8+4ftb/1xfKVJWRH3MLegurTB
	wnydUdns5P/c2h/NkhQk48V4wjmXNNaWtPNdC9K9WAb/kJg0jD5mtq6SanddELQ1RoSGvSEzMmnsG
	g1ZjU9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKx-0000000BTuk-3thM;
	Fri, 30 Oct 2026 10:59:55 +0000
Received: from out-220.mta1.migadu.com ([95.215.58.220] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKu-0000000BTt6-319W
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:54 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VzDmls3xFLsfubnFzXQlx1U4XfDEnnN9KmRFzEhDzIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793357990; v=1; x=1793962790;
 b=QOVpmjIbMsK4a0sCC/JyqeXysKcagljWXqo6wT/YtIwC5IZIiJtI9K4F4M2FzFeJ29gi841I
 m6DEK2GK/bTugMSpkdvORaiUuUdBw8T28lZ/fMJyYq97PYkPT0yUGf7p0181+ihSZ4wkaANxcMq
 AKDE46C4cZJCcO/BqsXzH2Yo=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5ee6d4bb77ebb1ef;
	Fri, 30 Oct 2026 10:59:49 +0000
X-Mizu-Trace-ID: 5ee6d4bb77ebb1ef
X-Migadu-Flow: FLOW_OUT
From: Jackie Liu <liu.yun@linux.dev>
To: akpm@linux-foundation.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	glider@google.com,
	dvyukov@google.com,
	elver@google.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com
Subject: [PATCH 0/2] riscv: fix KFENCE pool initialization
Date: Fri, 30 Oct 2026 18:59:31 +0800
Message-ID: <20261030105933.4180-1-liu.yun@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035952_912893_731DF394 
X-CRM114-Status: UNSURE (   4.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jackie Liu <liuyun01@kylinos.cn>

RISC-V KFENCE pool reservation failures can prevent the system from
booting. These fixes allow boot to continue with KFENCE disabled and
prepare late pools with the page mappings KFENCE requires.

The first patch fixes P4D leaf detection in the linear-map splitter.
The second uses that splitter to prepare late KFENCE pools, while
retaining the early PTE mapping.

Built RV64 kernels and RV32 pageattr.o. QEMU KFENCE KUnit covered boot
and runtime enabling, pool reservation failure, and page-table allocation
failures.

Thanks,
Jackie

Jackie Liu (2):
  riscv: Recognize P4D leaves when splitting the linear mapping
  riscv: Prepare late KFENCE pools with PTE mappings

 arch/riscv/include/asm/kfence.h     |  4 +-
 arch/riscv/include/asm/set_memory.h |  3 ++
 arch/riscv/mm/init.c                | 23 +++++++++--
 arch/riscv/mm/pageattr.c            | 59 ++++++++++++++++++++---------
 4 files changed, 67 insertions(+), 22 deletions(-)

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
