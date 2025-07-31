Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048DC87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EY3iZnCcrycQ+00l67BPez+lOn/UNb4EkNRyQ5tMoB4=; b=17R9by7A79nvGv
	m5nIzvk/2iY6/Gue41SE0KTwoXsD1/jI9PJ0KcqF9pY8lHP244hf0i4VjvUM/tqP1hhSFrHm2R6HG
	1rMugZruL0kSLHEE+CqDTtnqjx/VrRicQs1i3lG05EgisfMU9lQb1mFukOsih48CM9JAV+VUqJrnm
	OZTWP62FR98tCzfwOLEJV+HYShJPCKc03IVxzOBLfdl1veeJFNthM5fkMtCtVn41YBuz+R4A1sNpY
	A1nT4HA61O1xF3Eysq4qlurKmZKm25EZpaDsGrJJl7ArUj+midNOANOve8yU9rUxgsj/Kbf9SwXC4
	Q7IsniqblMsrwf5GFu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVkO-000000041qq-12u5;
	Thu, 31 Jul 2025 16:03:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVkL-000000041pS-2IZu
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753977760; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kNoE6JDxCi1zslQy1xpg+mF1/vsqY1D3IqpBnpStBmj+OXDL0sRiK9X/8RP0WJWhQV9EKf6arQbng8mdB1tISDmG3vzzJlBS5uQb92J4ctr3c0tK6Divd0PQ7nSxl5QW/LjfuA7kV1cn+p7frVI8nWvHO6p15RpIQAnQ81pLKM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753977760; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CXpQvoH9jL/54pJyNmcqlS3Y6t709TK/3sP/jYyYCZU=; 
	b=NZyZzrXp0QdTzwxwKsCxIjIaiVVOA+no4R91yXoWdSxF0z/gyHj5/Gpjidw12oRfYSrdld3Yzur+XoJDWV9ZfNDjTkCXXsjngucvUvvrykcXVyW/yAXYwv+80v8ozhEpkkaUKJGM7OqeS8arsYYbWWHWniiSLhs950yL99WZQRg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753977760;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=CXpQvoH9jL/54pJyNmcqlS3Y6t709TK/3sP/jYyYCZU=;
	b=S1rC1MQyyVxUh5al7QzD/wEtVu0CmD2bLe+i9LKJ+7ptHaYzR0G48z6r+BrAVQW7
	jYiG5zrcVD4s2Lfc/fxvmu6Yth9ziyoLW5uiVmJVlmwAKFvZM2WY+t0wU4jbYoDkg5t
	7ThNDHHQcLZAZz6U2Oa5pA93JU1WwkDUolq7NmkI=
Received: by mx.zohomail.com with SMTPS id 1753977758262407.9841044700861;
	Thu, 31 Jul 2025 09:02:38 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v2 3/8] selftests: kselftest.h: Add __unused macro
Date: Thu, 31 Jul 2025 21:01:27 +0500
Message-Id: <20250731160132.1795351-4-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731160132.1795351-1-usama.anjum@collabora.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_090309_644452_2B416CFC 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Add __unused macro instead of using the complete verbose unused compiler
attribute. The raw __attribute__((__unused__)) is quite long and makes
code too much verbose to the kernel developer's taste.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/kselftest.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index c3b6d2604b1e4..8d17036d88396 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -92,6 +92,10 @@
 #endif
 #define __printf(a, b)   __attribute__((format(printf, a, b)))
 
+#ifndef __unused
+#define __unused         __attribute__((__unused__))
+#endif
+
 /* counters */
 struct ksft_count {
 	unsigned int ksft_pass;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
