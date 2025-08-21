Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFFCA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVmeujhBKUvMUva3/GwX/g5eWvcdiwBBOnW3yGey744=; b=Ck61xlXETEqy3E
	GVCA3hxggD2L1cQ+TTFQAXJhm5w5golWECxwy95HDkKVVBAMHA7ETHgKiWITm1z+aPRfC0134fqgX
	exgqe+iu4H6OJqoa5cefsFBQyKFRLwDErPf8hbfFVK4e1nNHPQeN5UGHU0r1DHHy6zpVZEJ3HMFI2
	npk4R63NRn9yrYxcGd5rO21QvmZbBLEY5VMEXCyO1O+MbVsRLTyTZ1iwfwO7vhRC6m96hi9rPsQVX
	Ap37DyA5hYICyg+HBrztmfMK40xoH/yMzYnq3WIT0YMz/sCbAle4t8mZOj8tRh3vIJYesbU9PG2c9
	B1B3KS74iz0SkEqTWflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1r-0000000164R-0DGW;
	Fri, 22 Aug 2025 00:53:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBav-00000000OMY-1GPl
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
	b=WC4XnnAPB7YEaE+/MksoI/usBnjZhyDMr7s+xHmjHuHlvWe82fWZD6PNcEaMem1Y0z3tLw
	5O/rroRRHaVe7N/tk7lP39qBWCa/WTmviK+cHyvgg2hl5UJhN9wmhDszRh35xaB0sblLHQ
	/EHgsvhrwl7+lBBRBpgcSBBjRRwcoyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-EQT1eQ6FMF6DNjSgNWdqAw-1; Thu, 21 Aug 2025 16:07:48 -0400
X-MC-Unique: EQT1eQ6FMF6DNjSgNWdqAw-1
X-Mimecast-MFC-AGG-ID: EQT1eQ6FMF6DNjSgNWdqAw_1755806866
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0071c1so6420435e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806866; x=1756411666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
        b=VbR10zLE1LBNiUKH0h8bzdZ+C9QC6RuDtdd9pOENACoqwwA7Svbr2kudMP0seMr/k4
         MlFVYVL2+GFj90DH9D+Eiaf3LUhyC8xH+haXkDc0i2YMoYc6uWskPf3eiJfFADJon7dV
         Bnmel/9h3oq1FhEJcagLTPKf7NVlOm1XDbIgHX9Ubk/UdfmE2qkwZ4msxe3eV7OZkM1F
         Ymk3ySkWl/k58kOV2adeR0X4iWkZJNmfnTB7/ZRHCYk0ZV81kDL+8kYGY6+qMD0x05SI
         eQZl1QmOK4bcIGxPBDyX1jYC9s48xLD9GDdsp+8JotZySi+HpsziN8yvBtv9B0JDp/cz
         qHYg==
X-Forwarded-Encrypted: i=1; AJvYcCXGuSvUVSngxn8h8Wd8K20Sg4ypdgZwkE1fqUoKCyJLSzrxhttqVL1DbenBqcAPQLaNXX6mMXbCmb3p1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG0XOdk9b0r/WmoixNWFK871tW2wDOP8W3uFlY0jZ80aUW+7Cd
	2HpdnP+bsPyDI9qDUeBZ9J6Ph68MrgfUbir3w00Am+nCFcEPJvGQ54osKPpE9e17l4wuoFmBay3
	VQ3yK/YUe/YDe5ACAwTFil9M1IeBpna3LBKKLRU0G0oxG9jK7p/anMMRyW0kh/XcWw33VkQ==
X-Gm-Gg: ASbGncuhOaltQ/TOz64refN4ZetE0pmHvkT4TeMHzFIB2AeJXnZJS31cudRdUrkUOWJ
	NYnqAguQCwdp2lrzZYKooxP/zS21QK29vNTRKOvCls/SLfCpmvTXbUMvV8nbh3qesdIqGLqJEkq
	ocgWfvBSofg+s0drG1KB+vXnxp9w94BXVcwws8O3KMxen8zPuh5jBfNpJLHRjO1vgshdo6l9glq
	yrHd8x/s3+E2iBhp70r471MgDNYfv14XmsksW+jX/ZAbSaSv3Dk/u+BLBHj97k82s5Y6p60Db1T
	d/DFzXs8mNxoQ4xjOsITkZfcX9je6/yZaUs2JOAk+36k66qBqCK6kIThqTYq2w4hzgIlIRhdL+d
	LIqHzP4ihZbOmuqIQnrkcXQ==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45b517d4e23mr2819215e9.26.1755806866167;
        Thu, 21 Aug 2025 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtzGc4rPv18tjnV22wd1xjfGI25AJiVbHUBF3o7jj7YvZLrrv8XzLc39l/Z4dCqHj4yY2QA==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-45b517d4e23mr2819075e9.26.1755806865726;
        Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dd0380sm8632985e9.10.2025.08.21.13.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 14/35] mm/mm/percpu-km: drop nth_page() usage within single allocation
Date: Thu, 21 Aug 2025 22:06:40 +0200
Message-ID: <20250821200701.1329277-15-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2BFqz4MFtrkLD8SPcNKOrN9pIs9WMjUEtXkDukOlUU8_1755806866
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130909_409892_16EBFEF3 
X-CRM114-Status: GOOD (  13.15  )
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

We're allocating a higher-order page from the buddy. For these pages
(that are guaranteed to not exceed a single memory section) there is no
need to use nth_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/percpu-km.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-km.c b/mm/percpu-km.c
index fe31aa19db81a..4efa74a495cb6 100644
--- a/mm/percpu-km.c
+++ b/mm/percpu-km.c
@@ -69,7 +69,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	for (i = 0; i < nr_pages; i++)
-		pcpu_set_page_chunk(nth_page(pages, i), chunk);
+		pcpu_set_page_chunk(pages + i, chunk);
 
 	chunk->data = pages;
 	chunk->base_addr = page_address(pages);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
