Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5EECA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jra6u0iZry1YrpLk5S+SPdGBt7k7Oq7ag/ulVEe39uc=; b=eSbfIStT5SKN/F
	xDCbpsH0YBBvN9c4DPM6EnCazC2VPSU2fdYdgqKjvyAKx8X5S9E6jIDDakr7mTVQUeKTiE24CR99o
	4RJp7qKs9RgSNQz6zljvPG/t5UvvVDzoO1+dO9g+blOWe24Uhrd/9u7CalFPh0hjkp8j+JqOVCpAX
	CMXtC/xDM9e+vCC6J5v1Wlkogq1IorkZQ+JrrO/HtCwc+eOm7iqJEsXp8umgiMoJTpQk5jByrtapw
	DAhO3pUNYJAMs3RCihFbHtSFH0rmIPETs4UhkaLO1lCfsEvDHUzV3kRBpDqJzik4YChODZqTmipA4
	AvmJAoRejMSO2VWnStfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1e-000000015wR-3wT2;
	Fri, 22 Aug 2025 00:53:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBai-00000000OGx-2p3S
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
	b=TID1tlCALB2KAoF/JL6uu57s96m5Qw0/LyFOiObPboxVZmDj15dsZANIbcGHVr8J+QFPS9
	cBCNynkQyx8sWPk3LUIjf2aKjDNLLzPlbtgIGCd6FrOGNMcMlk5wmLeTBmw8DTzHFbE6v3
	0kLIpgqZnBF7QQhllKBePfOBMbopNiM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-cOumwj-TM1eDEs9DVEyDgg-1; Thu, 21 Aug 2025 16:07:28 -0400
X-MC-Unique: cOumwj-TM1eDEs9DVEyDgg-1
X-Mimecast-MFC-AGG-ID: cOumwj-TM1eDEs9DVEyDgg_1755806847
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso10735315e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806847; x=1756411647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
        b=leeW5U+0BWBC2LjAC9X8wDAeouuVhhgMqxFkgL+63cEIgNfcTmTWMkFYrhE3rPu1uV
         4lDk7Bwral2RAE3aSYPHS5qext67drPOVOqJDeRoemlUrGU0tonKjR4ZN6BZwEV33TYk
         opjncK0KgevinIDeYn5zh8AqBnGBTDTJL4IqsPr0MrWVfBI/66zfbWYCaVre/2zX/Cyh
         oqFUy3lJrfVFJwegys8Z9cBCyq8So7xjCvneJ+0wiLadk+PTdhtZpclCP82O1vhbAQvn
         I9KGv85swEOAHZH/FVJ+C+YMwHcRiuEfTGtHstaFjbAgxUCHFPWk84MfH8RZJaFM6aM5
         5m8w==
X-Forwarded-Encrypted: i=1; AJvYcCXa+J+TGTTMfHS9/tHUcMzK8e/hhIXP/ieDmqoI9qA9N3LZvftGl2xpvcvCM2HbzvJ0X8cNBaGZXgxbMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2TSycmATJXX9akDUdNiSxWuNxu08Q+3W6WGMIsOn+Fox8v/7
	r5XbEKFDjXNxnND0W/BZhlmAtRoebQDR/k3TyuEYxcpFEKCOryGRl/5AC0S6WOx7cqrnFlp51SI
	gvsNJbkoP40w0PTopygmrxudNuPzdPkm5N7KVLLDThsJk7o9kp0sq/dzVLeo/rdrSxPsg8Q==
X-Gm-Gg: ASbGnctZy+V3M8UMZlLp7bfmkzQmms8/AGFx07bKgEIL1pH3q7Foa4FThKhuCL5wQWd
	Aexk032nJvM9uVbT1LlNlEAPsVnaZg5KfPergVNTI+lphk5LtAYMp7BdVo0P+EfHy+NXTMykArP
	C7eJG9LJKs+EY4V6V4cqjSx0CgsUnJwtqdcYJQm1anEScyeF/5bMoRCIjoAtWjc9bipnawepoU0
	bEhDO1kZT5WQNEmd6rP8/K2+PA/uzDzXEkpOYdb7A9u1Thiyk7WQBKETbz0TXDz8cW5tz/gDmtw
	laYgGPRkIgqWFH1l8uBQ6vBZyN3dBq8/twS3LWXcloKKX/efBZOSs1jzRvZfo7VOVmu4NSPPs3c
	KTCMlwYZ485vCQWeFI4ES9Q==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2922415e9.26.1755806847247;
        Thu, 21 Aug 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUeapMM5JkcwJNJXC+LM6ICHu4lGUEF2ir46AAuHXhYXAFzTcPIdec/q/lplZD/isU7mGEgg==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2921795e9.26.1755806846742;
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50d62991sm9535385e9.0.2025.08.21.13.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
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
Subject: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound page sizes in memremap_pages()
Date: Thu, 21 Aug 2025 22:06:33 +0200
Message-ID: <20250821200701.1329277-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iGEa_kcIHuEUwIc7mbfJ7DMLGqQjy5yJbmu6FUzWu_M_1755806847
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130856_779211_FC367668 
X-CRM114-Status: GOOD (  12.90  )
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

Let's reject unreasonable folio sizes early, where we can still fail.
We'll add sanity checks to prepare_compound_head/prepare_compound_page
next.

Is there a way to configure a system such that unreasonable folio sizes
would be possible? It would already be rather questionable.

If so, we'd probably want to bail out earlier, where we can avoid a
WARN and just report a proper error message that indicates where
something went wrong such that we messed up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd8..a2d4bb88f64b6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -275,6 +275,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
 		return ERR_PTR(-EINVAL);
+	if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
+		      "requested folio size unsupported\n"))
+		return ERR_PTR(-EINVAL);
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
