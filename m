Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C276CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZ576Dzfm69iB/K/mElVuFQn0ZlVIEBxVb7p6cv5fjU=; b=W3KKTbvUeH9ONQ
	Ur9iI7HOlwrbQS7SHz4pc2EtrJ2tlacTs/UVT/WlQdjaNPqv6nr2R0nhF5iSt2yHw6xvRlzT++AAA
	pt6HvxYjrME6IKG8DgRgsSt+zviCcLOc0LhYEnKZKlc0VJFNjPsSKaL91DMXDy46Fa89dF5B4Qypr
	BEdgRneB3C/lJMmmPble5OMKUsXfEne8P8cnH/Yz1uDFPuyKk/XxHNCST1yhWd6zuM6y9Aer4fFR0
	h7cRck+6PXZO2GBpxLQWOw8+zH1K3AXOwpXptVgIyWzJyfhZJqJxDxDfFE3vIMKlXMIODbbyIac96
	wpJtbNmrSc24pWGAZdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI4W-00000001KcI-1oVQ;
	Fri, 22 Aug 2025 03:04:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBb9-00000000OQG-0IkV
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
	b=BPNX0n+snjvOGKGtFLC4Bj0Z6NGwBdIUcKVaNkpRbpEtsYtNlZuRntNWWEq2bZhtMHFrJx
	cZP57UHAfbl3M6iwbxB0LPVrpN40p/2SzYMBIKSDo/dWQmqSslDQwDR4JbxXDMrdj10p0+
	2kxF3EF+nZn3RT3ce5DXRKyvLwei5Ts=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-wz5mUNarMlmmcvLYo6jstQ-1; Thu, 21 Aug 2025 16:07:55 -0400
X-MC-Unique: wz5mUNarMlmmcvLYo6jstQ-1
X-Mimecast-MFC-AGG-ID: wz5mUNarMlmmcvLYo6jstQ_1755806874
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so6771775e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806874; x=1756411674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPs2EdTZ9fd3MpWdb0ATDCa6nUqfGtFMv2uyZP7L+uU=;
        b=h6jHjoPHythD4S5AZEO1qygrQiKRegyzY4KUxCBrkN6MAvKRqwyfAUhZPi/vMVMWsU
         CsyGGETmGxYRXgsieEgTDgHFHLT53g8RmwMvwvSSdLXNzMKrq5IupCmcScrWUnl5CjEN
         k1rVz5eZd37xRwHf0tmG/J0CHWPbppK1gWcCDccEttOB//obuflg6ZTzIMy+OdONXYjC
         OzD9hnpo+qn/f/xhZAAKizQycyGY1ak9DrvQ9SPrjQSh0Mbq72aQ4XfQDVALTyJ7PLRY
         qA1dasWVt29PO1JVlIcaMsjI7ZEflGzrbGd+B//CiS9WL7v65MDQxT5W8wkYbbepc/tM
         9UFA==
X-Forwarded-Encrypted: i=1; AJvYcCXOmpzbdOQe5s/IZMKsApqa9fDQQVsCNY9GaNC8dMPluFyGKfBRSDGlQmLxey2Q8qs1S6Bzaqj4lzzbzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YymfSnxflSgVK7ff7WliJbpAXGPsnFKAfVnjSp2CFuizJwiSCiX
	Xv/NGY4WGGbLjzqmKlTUUaTcxEBK1tDNchlewYHBxLCKP2nNb6F7wMEV2xheWh9+vK0Hc9n+RI1
	Hf5nCRT0pFIgYYfq3jBXLNtK/vDdixRhwPXlhJKf50d/b/EM2Kj79zRBg9dvFtSTlG2EMtw==
X-Gm-Gg: ASbGncvtNoLYUrOXRIL2ETZi+t57+Ki6TAnK6IdgqegehgM/EOc4bSqjWq/xf9yc/2p
	hhsLCwqt3tcp+2hMRDIL6T3FbNmGkCzchqxUxqQ6ZsS79OZIy47OWni9DaPwGk78oLJXCp6h6JW
	F457HSSdbbxcwV16IY3jGS5u4yhRrYhJxqyBez4UeXqy03DDhX1mDk+fTaw2uq+o0RnOogwZZUy
	uCbPPO4uEdVR/FMUq/Kr2CZ4X0ej1nzC704QgAgmFIhOZEw5rEO3+7JUZHiZMkrkpyKOYCtIO1K
	6PDhIRuRj/6FttxrEisQzEz6+2AK+LBzczkSZyUdfnw2dS027I3+PmPhCLRveHAs0k6PZfUWlya
	g0hRUJKUP3UsgUmgh2cLeeQ==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2554165e9.24.1755806874307;
        Thu, 21 Aug 2025 13:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo8ikhW4DoWVw60oDeAXqMRvn4UERlcVawLCjGel2pacwRc1R1ONhYVQm5EzuW0YIJQT4FDg==
X-Received: by 2002:a05:600c:1388:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-45b517d40f2mr2553905e9.24.1755806873856;
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487a009sm12690403f8f.11.2025.08.21.13.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:53 -0700 (PDT)
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
Subject: [PATCH RFC 17/35] mm/gup: drop nth_page() usage within folio when recording subpages
Date: Thu, 21 Aug 2025 22:06:43 +0200
Message-ID: <20250821200701.1329277-18-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cp2WDk1tm7itmbg_i31fKDSMgSMO5OT4onQErCpgYQA_1755806874
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130923_176175_8573536E 
X-CRM114-Status: GOOD (  12.49  )
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

nth_page() is no longer required when iterating over pages within a
single folio, so let's just drop it when recording subpages.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b2a78f0291273..f017ff6d7d61a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -491,9 +491,9 @@ static int record_subpages(struct page *page, unsigned long sz,
 	struct page *start_page;
 	int nr;
 
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	start_page = page + ((addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
+		pages[nr] = start_page + nr;
 
 	return nr;
 }
@@ -1512,7 +1512,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			}
 
 			for (j = 0; j < page_increm; j++) {
-				subpage = nth_page(page, j);
+				subpage = page + j;
 				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
