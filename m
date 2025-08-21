Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592ECCA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZvlFtfgJAWdXY9+lBaUodebXeebw9yeFt+85NJp1ss=; b=sDNU9lnndKmCsj
	ulIy4e25w0ayIYJaQ6/EY9djdeNoCOBtis/+oLUDtDAi2qnTZ4RFYgQctBErMSr+hABlcHTPKk50z
	OxcMg9Cp9poEYEORmugGMd87MwngH2AgauPfYiPd05q4yunEqXrUP5AmQEf9/4yb0DhuAWQxQKrwE
	J+A5ezSSNwWEAVNz+3zsNDawpkMbBPyTEDsSuoVCgSF6WR9ipA7pDJxMJ/6jv/6BFgT30kCAiCyVs
	Pws0MGBcHsKONzCR1Tpm+rS+/DxG2mKgx+iCEU7y23MMjpIlah/miqShu8JguIlGLG3OL1lcJt/5H
	wZvwMCeNDqhoiowPYJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG0R-000000015Ic-2wTz;
	Fri, 22 Aug 2025 00:51:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaU-00000000O9A-2Z4F
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
	b=JxkxZadlDeHHnazH3t93dNRHHEHYq8fohyBI3UTHKg8vkhg3iGxfuYzbkoDz8I2CfrcDvZ
	kiCXQdTDWdM4c6pOlHq2LtKcdw1GFWKtpvjiwq/rS4kwbIHjan32wCNscN25K6DMeQJZFZ
	pGloWyBHkPEKCJXOyrfUCA6IQEeXsxA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-C0qDTrH9NiWuMQnPIPje3g-1; Thu, 21 Aug 2025 16:08:03 -0400
X-MC-Unique: C0qDTrH9NiWuMQnPIPje3g-1
X-Mimecast-MFC-AGG-ID: C0qDTrH9NiWuMQnPIPje3g_1755806880
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so14273715e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806880; x=1756411680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
        b=JZw/4ZZjELS05jjjPr9I74qCkmMTYCZx3yy3RahrIZOrNwM/PJnJ+CH1/9+SSLOuJP
         4sqQIQR3jQobuO5LKFGWQEPJrhYSCOhOafm6nkFjoBMNZcMDr0TyaDNUqg+gsqjYd3ql
         /GQrhXwuwvYhtgeZSRplJ9jeKieAyMHC0GBUV8tv9EYhcCGXVjmqtAXG7jmw41CWVJh7
         UtJnqibuOK/vXHPS0JiZ0u/vfbbqU6kAsEJpPJSmER83y/kj2xr3kteEA5+YOyvpZiCc
         P1M31lvsMU8CWhnY0Y5Aq+u1V5zPPTIzH8nJ7LVW0Ojg7D1sMxl15wIQmNfy34Kp8wF1
         Q61Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8ns6ShcuWHAxbG8rMx7Nvd+l15vwThBBf6AizgQvVHSICz0RXucL9oPY1FUnt8EU+u9nKqYwLjrCevQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1GKe4KDvle0Uq2WUDUaJXx9di9n35DTqucflKU48LT8O8HLGb
	XMnynf9t1BwO0IEQeCLVRq/NJwuTTLPrBwOPOReOGZliffmi7wgBZiVkaH9pDfwc2hSGnCdwxcO
	rpLesZZMrSV3k9SghOCdjniKMJM1m667Q9gEQyQvah8PF3qHOM3KGMz8oIjBS1s8bIZNV9A==
X-Gm-Gg: ASbGncsFI6kbpsb4IMSkAVbHizjWK/inLHNMGpWBBD4w9sh7JeukcaWUhy+NoE91ph4
	/Afq51uq7zXcTigg6k1b2Kdvqctgwq4/+0qA5W1b3v9lKZd8Nfs2A4xMPH70aXJCfv4TiodPUTw
	YGlsGOQz+JhvfcdYeyLaymOHhufpG2qPwCSoS422I8lyS8+QLVomg0SqLT8YIuHUJz41gmT/1hf
	A3FyuyiSPOFKvTKc1Jvo5qIpnH1ZBqP9duoljk1bFL9prGHTFaQpwQCcBneDoVchWNbluIpzzTf
	7A+Ys+g+GsLLqdf4RaG+TJ1QKQ26WYX23HNuln7zOaoWZxCgqlGyS4kdMhTzIxShC8uY63W6nRY
	hv9TNz4/PSMrcxwAGWDNNxg==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45b51792539mr3328925e9.11.1755806880062;
        Thu, 21 Aug 2025 13:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ciI0WdoI3CxhUtu7m/cESVsdReJmvmXFWCMaWsO+hhXySreox2GeOL2sJ8kVyLPwCYhbEA==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45b51792539mr3328365e9.11.1755806879543;
        Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07778939bsm12219075f8f.46.2025.08.21.13.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
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
Subject: [PATCH RFC 19/35] io_uring/zcrx: remove nth_page() usage within folio
Date: Thu, 21 Aug 2025 22:06:45 +0200
Message-ID: <20250821200701.1329277-20-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 06oWlD8JIMuRp_bH3GlCs4Z6VkyRGKPKDfLLEeqVNic_1755806880
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130846_754585_BF5B84A8 
X-CRM114-Status: GOOD (  12.92  )
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

Within a folio/compound page, nth_page() is no longer required.
Given that we call folio_test_partial_kmap()+kmap_local_page(), the code
would already be problematic if the src_pages would span multiple folios.

So let's just assume that all src pages belong to a single
folio/compound page and can be iterated ordinarily.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f29b2a4867516..107b2a1b31c1c 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -966,7 +966,7 @@ static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 		size_t n = len;
 
 		if (folio_test_partial_kmap(page_folio(src_page))) {
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
 			n = min(n, len);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
