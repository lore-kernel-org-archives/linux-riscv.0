Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8FFCA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFq0DXWa5VqE8Lv510bCnE3aGI10Lhk77iVALeCp31E=; b=cabPBl2302K5WO
	d25XD3Qcbm0oo4nXtbMfJ4zRoHh97xKiH+3/jlfD1zjdDXdQoMeF7+fUAbt2sp7EMskWMwbme/rEq
	7l6jFMoRtKNSya8uVGFpce6HbzmE0VdW9MliIq1GRWFHR+JLL/4Kad/Gfg+HEbYEFxfM42oEgJWaT
	/DtNnTaNFdo2mIbk+/LYiKoWEVh/Vdj35AAeN8gdsNuz8lS7wz5Ig+IJ/+PpHDg/yq1xHuH4gjn5W
	h1+73Ma6ntPp4oW+BINxQYfDoY2Q+8KV1Ju4kPqXERvwN/f+TUFR3Ft4YUd6M44SPo/1rmZxUxp1P
	2ibDcau3a/LHSDhBNiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1q-0000000163I-0tDZ;
	Fri, 22 Aug 2025 00:53:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBar-00000000OLL-17jc
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
	b=Bdgmz4F50vnwxo3DstKtUlRZYhdGlgLKxIxKYHuhVHyXhZlEEuyLts2IPeQRee+IxRjSxq
	4l4TJcL/JGQZyA1Q+siWx6Dgp3LtGElGaRPsF2znqTcPvgUZx+Xu1PmCK+BILX+hfICYeo
	G/RC4SGuuUKTdjEeL7FmT5sYIhrrgmw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-_N8GYyRgOeG7Tu3LNEChfg-1; Thu, 21 Aug 2025 16:07:31 -0400
X-MC-Unique: _N8GYyRgOeG7Tu3LNEChfg-1
X-Mimecast-MFC-AGG-ID: _N8GYyRgOeG7Tu3LNEChfg_1755806850
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0cc989so8650505e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806850; x=1756411650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
        b=Mv6jNb2C6vH9L0WyB1SDFt3vs4It4Xk7qiS+Z5EkaDR/LvFFRjQJrO7rwITAObpaZu
         /qDmOEp0g4tZ9rxh4iqlRHGFUm5qEpahef/5jkvSlzx1j6aYR/uYTDgSg8qdMfaVLsr0
         OAkJgB526TylGwTSsrwp+JjxP2rh936JEIlegvEdLzi18VM2zIqmQ/WX2e+8ShniJCje
         VDl6etEYKaJE4198pzrMs+hCXcUwbAp2EAlM+6vPSmm/sw9/df4u7CfP2jc5ZOEvCFFg
         zz9uVVAoBD/qW0r3PfNgFoRJnA8uG5o1LfcATCn+wskqOjrZZPaxxBmNWAjBxqQSUWVV
         wBfg==
X-Forwarded-Encrypted: i=1; AJvYcCXkURvWrQFfkGOOyP9BzJnsQW3tsCPO3cBnVUpgZRrlxLchQf1Tv87WlFUg+55QV8X8YQg7lnVWK99AOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPOaNAXhXJ+SDbXHn27V9Lk6KFTRAB2E6FlWLZ3zFrcHyyvoWc
	59Tu5qXn593Q64KVORdAQh3cZMPh7CwrSwlAYkMKp2o9T1N3mQgVl2EdZWPH3DZcxzrGs0PRzD1
	xc7ZRn5dg9HQOIhVnTutMLAmCaoZo6K/ndwf0BQlIrgf+vhFYYz2FIIoPe8QEHsIDBgZrYg==
X-Gm-Gg: ASbGncszgnWoNiwejQJmYPtU9pQ6YtJToNr/MNvLuTovPkBt7Wtxs+EXkIF0dXxvPB5
	BgN4W+tgTyqEl51CDYK9tbW0Q5XORMttQ3zZCt8SD009FNCtmgcWpKAjixUpC0H+MfjLQVpdD8S
	uNtU+3Wn2NpzWUpD6a+Uc3e3o+Wdo3g9a8VGIf4Ojww0Il+7W1U8uyWehBjNbywSdvR6316bYkj
	Ef0XehB/lmo4QornVP0I9CC65HDAWRoymIuErzYRU7xRTjNpf4yomG5zNJDBajBh3nAL12IIu5F
	qlyneNK098+tmaseXVkhK1bTjoVdljG9qAssTRefmrPMNBjAiA6avEVr20lyKIB7KYyfvRGJl9d
	phkp2Um0/lJMfZCpsYpPFLg==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id 5b1f17b1804b1-45b517ddbe2mr2956005e9.31.1755806850043;
        Thu, 21 Aug 2025 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPNoTdvVqQJqQwQf/z0aFpcDb/7HunF1Y6KwbAqmFFF4D3cnAaKEmAnoGbjwE6N5eIepmoyw==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id 5b1f17b1804b1-45b517ddbe2mr2955545e9.31.1755806849496;
        Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c3a8980ed5sm7242256f8f.16.2025.08.21.13.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
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
Subject: [PATCH RFC 08/35] mm/hugetlb: check for unreasonable folio sizes when registering hstate
Date: Thu, 21 Aug 2025 22:06:34 +0200
Message-ID: <20250821200701.1329277-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 523oPRNiqGcFrNQgU5I9jupV53zk54fqfZEWcQ9pZB8_1755806850
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130905_379372_C5258813 
X-CRM114-Status: GOOD (  14.05  )
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

Let's check that no hstate that corresponds to an unreasonable folio size
is registered by an architecture. If we were to succeed registering, we
could later try allocating an unsupported gigantic folio size.

Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
to use a BUILD_BUG_ON_INVALID() to make it compile.

No existing kernel configuration should be able to trigger this check:
either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
gigantic folios will not exceed a memory section (the case on sparse).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 514fab5a20ef8..d12a9d5146af4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
+	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
@@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
 	}
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
 	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
+	WARN_ON(order > MAX_FOLIO_ORDER);
 	h = &hstates[hugetlb_max_hstate++];
 	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
 	h->order = order;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
