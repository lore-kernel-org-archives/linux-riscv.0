Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49843FF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 04:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFeDLm/5xsjyopz1xmm+FY4SPpe+gnnF7DQjDTyjo0I=; b=Y5mvor7uWWy/jJ
	oXBkTj1Qb6xwQeS/H2d4jYUBehswkXDnH2dS4Y6FJ3epN7p9/Q5OoM5XEugnbqzg0V9U551arPc8g
	h8gOd3/AC8V0nkgPqg6bR4Vg3iZr53O3Y9sxflOzv1y5myXlZfjr3Brine6cjUOw9zq+Sj5p2TmRi
	7kIHdMKJOfMjNL3A2t2rs5eQZK5hCWwSovrUpgJJUxcWwEKQseNUGXbLGibHx/qkjACk8cYrZBnb8
	G5Tgxff27NXyK8n4lzCcP4ZgV70Wtze8XTMvV9mtkCUXIlmVZSdvc+0XVYuD0tzhyy4qTnPqGRqs2
	r3G3e+5Uk6dFLAhPfZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIeR-00000004d0r-1nuU;
	Thu, 30 Apr 2026 04:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIeO-00000004cxz-2rM7;
	Thu, 30 Apr 2026 04:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4925435B9;
	Thu, 30 Apr 2026 04:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6E6C2BCB8;
	Thu, 30 Apr 2026 04:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777521919;
	bh=pbXcAk16+rZv3mixELQ0Ipha1GpoRaVFtegxsWu8Zqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocBfK8O4Ywas1DnfVulkPf8JAygFLLLSXfSSIhFab5aPydgPGyQRMZl4VC0fcDxzh
	 ZSF8ZjBo9bGMKXhwl/M9RckUdNTcuoEDs1sQYC8HxwbacO47214ueIB5PuN5R9qPyl
	 7/vXQCjK6DhEeLKCFGPA8mBl5pi8Xir7/uhc151Nze4/YpDG2oez+rIhbMYqevbaCB
	 eLjkznrbZrf9uMIIMqF0/apYtZGMqURcRmb3l4AFBitMcYEDgyMeHrj8n9yVB0vf4O
	 no7KHvYOh/5gIxhaiyHe3dpMaQbh59rmzxY6J3CuNafpQ/IRafc5BIkfCVPTmXqOYt
	 bTDK/08BVuABA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	willy@infradead.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jack@suse.cz,
	pfalcato@suse.de,
	wanglian@kylinos.cn,
	chentao@kylinos.cn,
	lianux.mm@gmail.com,
	kunwu.chan@gmail.com,
	liyangouwen1@oppo.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	bhe@redhat.com,
	youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v2 5/5] mm/filemap: Avoid retrying page faults on uptodate folios in filemap faults
Date: Thu, 30 Apr 2026 12:04:27 +0800
Message-Id: <20260430040427.4672-6-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260430040427.4672-1-baohua@kernel.org>
References: <20260430040427.4672-1-baohua@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_210520_743743_55C7199F 
X-CRM114-Status: GOOD (  10.39  )
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

For uptodate folios, we are not waiting on I/O. We should
be able to acquire the folio lock shortly, so there is no
need to drop per-vma locks and perform a full PF retry.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/filemap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/filemap.c b/mm/filemap.c
index b532d6cbafc8..0d2f6af5d0fe 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3533,6 +3533,13 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 		}
 	}
 
+	/*
+	 * If the folio is uptodate, we are likely only waiting for
+	 * another concurrent PTE mapping to complete, which should
+	 * be brief. No need to drop the lock and retry the fault.
+	 */
+	if (folio_test_uptodate(folio))
+		vmf->flags &= ~FAULT_FLAG_ALLOW_RETRY;
 	if (!lock_folio_maybe_drop_mmap(vmf, folio, &fpin))
 		goto out_retry;
 
-- 
2.39.3 (Apple Git-146)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
