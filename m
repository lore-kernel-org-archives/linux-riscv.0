Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848EDC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pXNUEigY5EVQ0GMfUUCeStwsXw//3pd6DKGjVzSM1Y=; b=OvmL5CJvD58Ggd
	TIejLctipRY1wp5sWgEIJ9KSzuUnHnqxdp797X5OXVlgyzCLd5wUpu/8YOPsYSALTTkRon2kxKHfV
	V+CN/2jSYrJ7xFIkJpGN6eJkgOhF0W8EmtR6uqQ+1x+liiu6O1LhfhkQA/Qs+LKnfnibCU4YX91T8
	lcwDhDlet1ocywucS8oN6i2g5mvLCwxZXJt28ApDHi6mHQ/KcBQ9h0pLAkPvUUx8xviZrP3cMb6g5
	Q0zdBXHypDpmM9AFFl2rfINgsyv9yTa4lgvF7f9jtn4ds0X667tUe7MlPzFIIF4kL33UWwXS/qhiI
	VAcbVwGGxydKN9VBkcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa7-00000004qJa-3nzR;
	Thu, 21 Mar 2024 22:08:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa2-00000004qEO-46EE
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=Z1QOr5VHwlnXVmwfQMhze8UZ86wYuDJEJRmDmm7Gd/MNIoSjQjosnXLK1+/tX4cfMTLOkW
	/grErCiT6duLwQtG6YQabPQH0HPqGZbdIpPnBmmZOlDv3FbocaTE0IBk1AYiZw6fGACvtE
	V0tbvz6WS6cNd0AC3nUqdbM63IySHWk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-JR-UATuJN1aJwyGbCJFGcg-1; Thu, 21 Mar 2024 18:08:08 -0400
X-MC-Unique: JR-UATuJN1aJwyGbCJFGcg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78a0e8a60f8so22222985a.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058887; x=1711663687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
        b=bXbgmonzUXAVnhdvGG7/xixOPXpRP9qRuzkcHV7VYmdUgVw4Go4nXV1wrwGPmy4tqx
         sdH/5CJh4D3QWZ2wnjhAUMT3XnPA6QuD4uM4C+0AGLZ/0fcWxAfI3WlXza2EltwDUyGv
         yTAD61BOaLpKNREiIPnliIawhINpJ/ikDiKKEf1TI9lbNkE7YbAMAE0eijUQ0Jdg/tQX
         YCft73m16lcijiCqjDr/ewaW/ozsITcF0DT8f6qsJoESO9QR/TkT6FmTXgO5DDG2o+rV
         nfEt1nWX5qk/M3YXVIXDW4M4PxTZbPuDkwuziZbO6VVH1hgdn3HadSjx5azP8kmGwr4B
         Qb6g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8jIRhyHBLm7tDUyMqB2NRPDMLKEoSP/vjQo9dnpBwjiffZbb2g2bFHTG1XEvr2qCgjLWzhgoNelYjcO+cfSEMUEGZ46Qj4ttAHJFykK4
X-Gm-Message-State: AOJu0YxYanb9xVLkAi4nSI3IeDhsM3+gl/YpZB3x0IO0e0akBg6T053W
	RJs29cmEXbKWAA9fR/Xz0pbJgKnwgcn4qz42wm9Z08HpEtHxasOrajkOvO4M5a+PBmCqXgYNKND
	jTHq57osMzlzS+cgjO4izILKwQdjKtDTPIT6XwA6eWL039gbGwc6leqX8YYkjKQ+ptQ==
X-Received: by 2002:a0c:e58b:0:b0:691:87dd:f836 with SMTP id t11-20020a0ce58b000000b0069187ddf836mr428470qvm.5.1711058887525;
        Thu, 21 Mar 2024 15:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbvsPPVNStAWHyU+pKNLEFDZ4j8yXA8+9tn+eCe8z7LjIA9ieYt5evzB7ZRQzGTHD3gHSYEw==
X-Received: by 2002:a0c:e58b:0:b0:691:87dd:f836 with SMTP id t11-20020a0ce58b000000b0069187ddf836mr428451qvm.5.1711058887085;
        Thu, 21 Mar 2024 15:08:07 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:06 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	peterx@redhat.com,
	Yang Shi <shy828301@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v3 01/12] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Date: Thu, 21 Mar 2024 18:07:51 -0400
Message-ID: <20240321220802.679544-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150811_100677_012718D6 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Peter Xu <peterx@redhat.com>

Introduce a config option that will be selected as long as huge leaves are
involved in pgtable (thp or hugetlbfs).  It would be useful to mark any
code with this new config that can process either hugetlb or thp pages in
any level that is higher than pte level.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index b924f4a5a3ef..497cdf4d8ebf 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -850,6 +850,12 @@ config READ_ONLY_THP_FOR_FS
 
 endif # TRANSPARENT_HUGEPAGE
 
+#
+# The architecture supports pgtable leaves that is larger than PAGE_SIZE
+#
+config PGTABLE_HAS_HUGE_LEAVES
+	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
+
 #
 # UP and nommu archs use km based percpu allocator
 #
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
