Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A66C67872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 11:11:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B94DD2080F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 11:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZqjuAbuF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B94DD2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WcHVvHPegg9Hz0Qt5vGPWDfiEblRLopzTqjW+3BoCTA=; b=ZqjuAbuFFtm7sX4fg6qZrYBV9P
	wdlY4NQZ2VWt4Bk1Qgf0teP2gke68XEL9ustVkGzeTGzTBjx4k14KLiXjM0FQ2aJ03cqwokvFGbGk
	qzp0ycHXVVxqPeo34cUsSMGK+X1th3zUcERJBxGbDSzZ9PoyyPXJBv0wnzwANkWXgylf2XqmPRMjT
	KRYDpifpm5cU06dAuDaci/a4Ka7dqpYHNH/qOWPoInKCROW1rxWfhNq3mTHUnm9nAIfb6bg1rado8
	Yf4bPWkBBGWOLX1rJkvf7AqV5/gPcS3+1vHO0nOfnXINkhwySazklGn/s3XLtYaLSXBHuXJ+5NlDG
	QNecdFYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXlNT-0008AS-R1; Fri, 14 Dec 2018 11:11:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXlMs-0007XG-JT; Fri, 14 Dec 2018 11:10:56 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39346DD9C0;
 Fri, 14 Dec 2018 11:10:50 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-139.ams2.redhat.com [10.36.117.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC595DA2A;
 Fri, 14 Dec 2018 11:10:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v1 2/9] s390/vdso: don't clear PG_reserved
Date: Fri, 14 Dec 2018 12:10:07 +0100
Message-Id: <20181214111014.15672-3-david@redhat.com>
In-Reply-To: <20181214111014.15672-1-david@redhat.com>
References: <20181214111014.15672-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 14 Dec 2018 11:10:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_031054_655180_FAD475E5 
X-CRM114-Status: GOOD (  12.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 linux-mediatek@lists.infradead.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The VDSO is part of the kernel image and therefore the struct pages are
marked as reserved during boot.

As we install a special mapping, the actual struct pages will never be
exposed to MM via the page tables. We can therefore leave the pages
marked as reserved.

Suggested-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/kernel/vdso.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index ebe748a9f472..9e24d23c26c0 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -292,7 +292,6 @@ static int __init vdso_init(void)
 	BUG_ON(vdso32_pagelist == NULL);
 	for (i = 0; i < vdso32_pages - 1; i++) {
 		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
-		ClearPageReserved(pg);
 		get_page(pg);
 		vdso32_pagelist[i] = pg;
 	}
@@ -310,7 +309,6 @@ static int __init vdso_init(void)
 	BUG_ON(vdso64_pagelist == NULL);
 	for (i = 0; i < vdso64_pages - 1; i++) {
 		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
-		ClearPageReserved(pg);
 		get_page(pg);
 		vdso64_pagelist[i] = pg;
 	}
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
