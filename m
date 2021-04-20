Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771B4C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:01:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E0C610A1
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E0C610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDm9JQcH+LHY4G8oxRip9htKM8E22+hqt3zqPB4maMM=; b=IVpL9ymyKe4WiW/3V6bztqRHL
	mwxhZpRLEFZiKQgGr0SEIBxEeJqAYiAx2KNF4AVvEPQ5UHVWZRZV8LBVnJIFD7w/4365k2rVz40J9
	apthn0yl1vFuDKnxsA6bV1+qOADw86VAf8Uvw+3QAiGdEaSFBhdSPYheAZFMQY4Mxg+FCD5SoMO4k
	soKHn3yzgstrSL9wfl1UKNHN9PStfEjtbOY9Gkp+Tg/0Q4ZLlG2U4Fgcqqf4ZuQv2ItstdYVIAbH4
	I/zkvqTLQnfp6DIlMXZ8ksr3HBJJ0yk6Wloy1UcYJ4xkOTTKhamjZQSFhtWaWcwjt6GcA8VAbz3LR
	Iy0DlBGFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrse-00CPML-WE; Tue, 20 Apr 2021 15:01:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrsN-00CPJP-TH; Tue, 20 Apr 2021 15:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XTCOg+mbSoGeSJL5uKKs/bSw8a+3z2KtzsOjUQoNW5g=; b=ZWXOzzVSluy/uUEgvHR5kseQ1z
 EI6k+9xr5SD0lPKKyQcRt0nUFJI7LFZgUk9CAaxhwFd/+itp6LSxoGyFF24F5rguXcL5Fv4rz1sTW
 T5xlcaQPTNFv1/E2uoHBaOY0VXKxPKe/gOYi5ZKeVD9EbjLCq0XLvRKsOCgVIHrDi0EQuPbasGEqL
 MkPMmDe7keuMqaGZRUrMLF2t+wBkoDHqrMbPUo/10YgEOE9Jt8D6GkRAaUqofR8N/QpnbQVPRQY5r
 O0sW7ro3IkzsQbqJLi66X21lW+lXEu2khAjQbgYX7vmAwKATYTUKEZfzJUd8ljQMijkwNzhemP2Wt
 hMn17oEw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrsL-00CDOM-EF; Tue, 20 Apr 2021 15:01:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 755236024A;
 Tue, 20 Apr 2021 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618930876;
 bh=YWZWy73tqvCKAkk9V8YhZ1ig6ylDklRIyvUgj9G3Qqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AvfI48GQEUCgATQPRlh15VnMXoZu3ZrAzlargumz56omxGHSsgZ+X25Jm4uXtaP9d
 ZD8syRRrFQUMViRfNfGpwdlmr2B9H0YhE5g8MUwgj77Qx2P2KF7DwOhOnpLzhAnjUK
 78OGltrp46CIQR/BM0JZX4HYJTh1d4/YWOs9Mpqe8qVUCcsHXj6tcbDuq5s+irERZY
 1RNUZhlewg3bN1Hm3jmlnu1QSIsyknis7N9xgq+PavSOMRHXHp3DG9eKucgLw1TPNM
 wzWKpK6wyMtFcYr3RYfN9G6HVQdYyX+LHEnbZLQi8iWG535paN1bFibNloawn8SNOc
 xGt5UMlHKdsOQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v3 1/2] secretmem/gup: don't check if page is secretmem
 without reference
Date: Tue, 20 Apr 2021 18:00:48 +0300
Message-Id: <20210420150049.14031-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210420150049.14031-1-rppt@kernel.org>
References: <20210420150049.14031-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_080117_537917_496ED710 
X-CRM114-Status: GOOD (  13.51  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

The check in gup_pte_range() whether a page belongs to a secretmem mapping
is performed before grabbing the page reference.

To avoid potential race move the check after try_grab_compound_head().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/gup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index c3a17b189064..6515f82b0f32 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2080,13 +2080,15 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 		page = pte_page(pte);
 
-		if (page_is_secretmem(page))
-			goto pte_unmap;
-
 		head = try_grab_compound_head(page, 1, flags);
 		if (!head)
 			goto pte_unmap;
 
+		if (unlikely(page_is_secretmem(page))) {
+			put_compound_head(head, 1, flags);
+			goto pte_unmap;
+		}
+
 		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
 			put_compound_head(head, 1, flags);
 			goto pte_unmap;
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
