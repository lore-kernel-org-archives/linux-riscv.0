Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB051C56201
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:15:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6737920797
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t34y2XHa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfWfJNsC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6737920797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3G1VT36SF/Knf2F7P4TlNXUhAvo7LSDHksdmcVg7y90=; b=t34y2XHabEW4QYgIrnZl8GJft
	r31Z7PxVMHia1tNerXQuEqEB4YcYCO5dbs80YgnyzDH1U8gbku0F1GnVDWUsDuv02JLkhWdcMI7dN
	jF4vPr8NImmBp8yYW5CYB7W1Zdq5t7WeNHimr4zhEGuuavRho+GmJsay9l7qXeOm15s9Pxs0PkdK8
	mDC+AmHx1wZNuQt+GmaTew59NwcT8Z9LJxNJFat1wo9ORwen+o1jX1USrEEsBsy/SSPkibvtBBWle
	WUfycphJiiLTuQBJz1m1pmjb6sKnftant8LuexvM/vpSvwbd4WS12/NabNvjJI3G/R/+OVPZrsmGE
	Ats0xcMww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVMr-0000Tg-4F; Tue, 10 Nov 2020 15:15:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVMe-0000MV-2X; Tue, 10 Nov 2020 15:15:21 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 604ED20867;
 Tue, 10 Nov 2020 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605021319;
 bh=gq/nxZiYj8wSo5fHYvxwQbeui4caUA+z/EhI20F60d0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OfWfJNsCq9gt75RENdSu2GKfMcqpCrMELDl2XedkRe+oxJBg1WplFAPwP6Vxi59Hb
 UijP3DEF0010afZsEPcJKDqCIwiztni/bnwnMvTQpk3eoCID5s/P15yhC/2gfftAl6
 4EcD54f14gDNou8ASy8II5OWkYJoBDS319M6scGk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 2/9] mmap: make mlock_future_check() global
Date: Tue, 10 Nov 2020 17:14:37 +0200
Message-Id: <20201110151444.20662-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110151444.20662-1-rppt@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_101520_224258_70A22381 
X-CRM114-Status: GOOD (  16.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

It will be used by the upcoming secret memory implementation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/internal.h | 3 +++
 mm/mmap.c     | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index c43ccdddb0f6..ae146a260b14 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -348,6 +348,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
 extern void mlock_vma_page(struct page *page);
 extern unsigned int munlock_vma_page(struct page *page);
 
+extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
+			      unsigned long len);
+
 /*
  * Clear the page's PageMlocked().  This can be useful in a situation where
  * we want to unconditionally remove a page from the pagecache -- e.g.,
diff --git a/mm/mmap.c b/mm/mmap.c
index 61f72b09d990..c481f088bd50 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1348,9 +1348,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
 	return hint;
 }
 
-static inline int mlock_future_check(struct mm_struct *mm,
-				     unsigned long flags,
-				     unsigned long len)
+int mlock_future_check(struct mm_struct *mm, unsigned long flags,
+		       unsigned long len)
 {
 	unsigned long locked, lock_limit;
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
