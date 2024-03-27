Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42E6C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pXNUEigY5EVQ0GMfUUCeStwsXw//3pd6DKGjVzSM1Y=; b=ULqGuCeAjP6jH+
	EQmwfTKLrFnJmU9NM+leqW9W8pZscfV70NWxLHRJ9DYwXRvojuuh1fE+uXIs9i9Orn3gdFbWm/4NA
	FNJyISZen7sd+y8LW88WzB4wlTdEJkc4UJf3gMgd14GpKYOsf5KG6HnW1U0TmlDMDzRyJLYtEnFdz
	OV1d7M5hm8lVfnh6nL2P2JuuNqGr7AWH5PHoLev9oOhNvjyy1MSVNbKGMa12TMIt8SdeHevqrNIsO
	Odmv/0xA/s5+bXkn5XGJubXs5LJr628gymX5iuNRNwrZJrr5LnHzwtdHB9yTv9Y4VYqnb7y5ewvTC
	FE+RCFfZA8c0sZkHzbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWDG-0000000A6MT-48pi;
	Wed, 27 Mar 2024 16:33:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV7t-00000009lBO-0NGP
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=HERAnwdQFeymCFyZMJ5sMV/5gQjSvaPy/RdTHP7LaZE/FfItyTkEm2+wEyl/4vAdJOfMng
	eu2EkyMS/bU/fvZ1Eaado6rPk6CA90KZAqQ8PLDg3KzMJl9PcK5mqPk/YNRGtu7oxM4HmW
	wIjMW9VuObrzex/ogw08x4jN7sMWhTI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-XJOn17scOeeSA-M-j7KkiA-1; Wed, 27 Mar 2024 11:23:38 -0400
X-MC-Unique: XJOn17scOeeSA-M-j7KkiA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-696a9c482a4so3595376d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553017; x=1712157817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
        b=a6IbiiBLrTyKHBzsImhuWsDc6WkCTicKXfySfxOch7MubrGPp1smP4cT66IhItR3tX
         2yNNEarBp0XCxi44rGwVrUZ4pK0N0VtTcRDozAySSNG//HxY/tN3SK4blqMGHMtRPm9/
         uJM9Ge/j3NlPXsUWsotSX7kjaYN2JT0XUSTtGAMiZX0J1Pgf4DxGUwA91xDq2LbfrMBN
         vByDlShMfP7Lc1iFgBYYNbIRsbLF2hXKMLXFeN6jK1NWibpz9dhZoItKloPqYdtIDnbQ
         qX4UbZfgnuHb6vHVbWyKR0WHajN+FPYHFj2cwh1AENIO6bQ+T6ldWHbqox9eU47Urjpj
         tqSw==
X-Forwarded-Encrypted: i=1; AJvYcCUUjRCWzDGsAc6dhiHYxSYifjNA0FsdQR8y+q3pNtiQ6EuiGCEOuB6KnQUcLkRex/vRQUdmPUyGvQMNSjkGd04/QssBXJVbGyjXXSeldk7h
X-Gm-Message-State: AOJu0YwAVV0Pno5G78nd9y8kX6VpRWSzNvwShixfHZL18eYp4ss5PCvM
	hH8oRVWAzKV1b3SNhMIMd6jk2iWa3IOMTZKxAeBD5pRlAM6cbbJXwx5xcm7Flqa6mDk8fg9KxLj
	poFy58P+HUwzkOjvqtAIJie8C3uEIixQ8CvsNKdSYKlqg36wtnZqyZUkmRoTqhBrkSQ==
X-Received: by 2002:a05:6214:5d11:b0:690:3c85:c5b with SMTP id me17-20020a0562145d1100b006903c850c5bmr14918711qvb.3.1711553017548;
        Wed, 27 Mar 2024 08:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFplzIHsd2VycAjj5oUNWAa5qW9RFPqJwKtRaT5aqzv2S9fkhcwA1AKc/2h1PXS7yh/3x/6aw==
X-Received: by 2002:a05:6214:5d11:b0:690:3c85:c5b with SMTP id me17-20020a0562145d1100b006903c850c5bmr14918682qvb.3.1711553016992;
        Wed, 27 Mar 2024 08:23:36 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:36 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	peterx@redhat.com,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v4 01/13] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Date: Wed, 27 Mar 2024 11:23:20 -0400
Message-ID: <20240327152332.950956-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_082341_448737_A7D954B6 
X-CRM114-Status: UNSURE (   9.20  )
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
