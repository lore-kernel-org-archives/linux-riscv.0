Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25702CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbx7zP+ISLbumCV1yPs+slTpq2Sky4a2PxiEnBsnkZQ=; b=OeMZ4sFtg1+O2y
	G3KPKAc0G2i2p7Dhrp+49014yhY/Wm2M4M4Rmo2LJ4hM6LJOJeCWIfr7CKENo0YbvYme5rxbJ21hT
	0pyehN7lYAyV6GeJWt9yDMK5epYmclUvhessqZqiNIPLyYkzWXBpuYGi9A28Ar/j+2FylStQUHRI3
	CtoP28J4uV3K61YwDfSDGge8YIDxXRWV4BHp7Ril9c1Bsie4/V+zpveioga1PHMX7ubMp99/tZIN/
	WtIAmkC77i8MqrK/ngOi908kRdwB8jUm2chnbCmV5Au367gvQP+rTuHflGO261wPSMZ7Tid9Rixnl
	kcALC3Y/myU28H85Am8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1d-000000015vV-2mvm;
	Fri, 22 Aug 2025 00:53:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBag-00000000OFd-2woS
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=; b=obOYy09Q7q0IFh9EpHjcOliOzn
	MAkgnNOQw3uhpe2X7eS9o46N5+ftseIttdHpvLAbSY0JXI7QAXBPJj7M9J6EF8vGR2P44DK37uO1v
	M+qwkxoQf/IpeBOZf3B7V/fkMK0cGiNf4alRHCpHmpkb2OVKUF0l51nlDtRQ8hYyMVmZ3X355lwL9
	4uvFcRdSU9J5SgYmjlNDe3FJDAsyIWY4n6ofHNwlouE5omqBDqiuc33AtBu37bd3rXbhCyY5d8QH2
	RMz76r13RCgZLSylMdtl9bDYgn2e2tZ5McaEHG4Zzfe/qNQ0/Un7/oicstzvOkhtqJG3zqSRziG84
	CRtGOazg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBab-00000000fJ3-08oI
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
	b=ekCMa1uSNOfMT8TPOtxb39v7zQnhgNvpmaHSeMozdkcVO4ZCalHs2XP89i/xTMCkL0H/pc
	WRBxfr/Bo6eQxpVsKzsGZyHxfE1p4T16P1IW6H79hDMNZhnYaWKrqJ7xLNJXIhV78u0y7Z
	vJCZTAxQI1zeQ9JPvFOPEtLEIFN7WxY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
	b=E+EKZVNoIN341jMTTRkCIXdmOqy0S50EZmPngqAufEwPbx8Oovknj/Of1Vh+DK6sLftdgY
	L++eBcRmIkt7n+h5FO9EfzS43bnLz3RahmZyzXuxYejpK2VM4NKGP871WLsIEKMqLyzFZW
	j9CGwzD4GF76CZDfMH8D9xnFLWmSOgg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-JfQOSzMqMPmHE96ty3DSwQ-1; Thu, 21 Aug 2025 16:08:46 -0400
X-MC-Unique: JfQOSzMqMPmHE96ty3DSwQ-1
X-Mimecast-MFC-AGG-ID: JfQOSzMqMPmHE96ty3DSwQ_1755806925
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0bd6a9so6980025e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806925; x=1756411725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aQmj/0+AYT4mPx/DatgQPPbmq0Lkvm9KCqKkKCdC9Q=;
        b=pcbi4ws1aUBNqF9CXH27s/0SRYzo0zL3L1QNsmGfxLB2kbn7UGkrWDlxgKV/v9Fz0h
         fTgn76W+fd5nC4qYOs/Siki5kiN9xwC5Bup5Pnksu9inmDNm7fQrPE/4DE63tNoijVS5
         xbsR8TgxUfCaQx8BrcsVTGQk4TbgJo/ujmqKPjiXE+M4raS5sJSJeqWx1948uHEgzPiS
         jWKRTN27uyLNlikGQZlA47M5gvE26/XbRi2wAfkn/ZXPUG05iZOQx+4rxe4w8l3dASoB
         b6SJxw2TEi4WpvdPyb6KUlyrWoU+0HJW3JW8diQjX1iKNRoPe9WCRUl4LEMvy9AMyMad
         SlPw==
X-Forwarded-Encrypted: i=1; AJvYcCXGFjcaz/Bh6I1AzU+OjS8EOZZ1wmvEUVq1/LNmdIVV+CXjABF8K6EbCSMdwYS12W6y6O6F1KY7TFIUtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYQ7wUvOxgAouCZpEmrllZ/ZhqdoYZh0L18+Kf18QcdsWdUomr
	vEfz6+UW0G2sfEnuWB6QgQNxvi2+bAaJgIjmqqiyZG7dnBFa2haEE9JaxZrJQI6l8Xzqve1BQ7C
	EQVKolDqsx+lAqz7zaxCKuSX7xu+XcFUA7IomZxpmeEX8n/SnUDzZRu2Ipv8MqCAPOoNJRg==
X-Gm-Gg: ASbGncsKm/XEtzMHk+LT7AoiVMGLGFim7ym5UpJ938jQSYKfbBPyl3s2vVsLH2uzyJE
	R+tvlqdkSOg7WFaE0pHX7FL+plegHXhoV0CdbWaMxHmUmlsuzoIn8bFAL8qZUEBDskECKed1j7a
	DbDUPevuu0Iy1JCwCvxtkdjgnSZTusq9CZV6RcsBDns2KATA7hCSjgdSIiB8ifo+wAbmlA3hyOu
	onKDglIpKzGOKMXOr0SLxFWQ0qn9m+RTmXe7yW2tIedzxDg5Hd/DlWuOe2KGezkAz3Scipr4si0
	x+5mQxM2+cbGbXAFH1kUoVLgeYavKZYhO7e0h0OkvvpY903Nur1DB09vJHjVeF1pCwt7TRNv80d
	WcOXU+UwK1bUnUMSNSE24lg==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-45b517b008dmr3774325e9.16.1755806925531;
        Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDDv+I9AWZPVyKVFD2prHDmQqsK3mzEWwP5yNf0oRJXtHjmqgi3hMC3hwAmszm5rTAtK85Rg==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-45b517b008dmr3774035e9.16.1755806925116;
        Thu, 21 Aug 2025 13:08:45 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e0a479sm8895255e9.21.2025.08.21.13.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
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
Subject: [PATCH RFC 35/35] mm: remove nth_page()
Date: Thu, 21 Aug 2025 22:07:01 +0200
Message-ID: <20250821200701.1329277-36-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0sAwCwq1JX2JO4nAhblEzdx0NZWeFf0mxujpu4qZ9NY_1755806925
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210850_879516_117CD52D 
X-CRM114-Status: GOOD (  10.84  )
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

Now that all users are gone, let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h                   | 2 --
 tools/testing/scatterlist/linux/mm.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f59ad1f9fc792..3ded0db8322f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -210,9 +210,7 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 bool page_range_contiguous(const struct page *page, unsigned long nr_pages);
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 #else
-#define nth_page(page,n) ((page) + (n))
 static inline bool page_range_contiguous(const struct page *page,
 		unsigned long nr_pages)
 {
diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
index 5bd9e6e806254..121ae78d6e885 100644
--- a/tools/testing/scatterlist/linux/mm.h
+++ b/tools/testing/scatterlist/linux/mm.h
@@ -51,7 +51,6 @@ static inline unsigned long page_to_phys(struct page *page)
 
 #define page_to_pfn(page) ((unsigned long)(page) / PAGE_SIZE)
 #define pfn_to_page(pfn) (void *)((pfn) * PAGE_SIZE)
-#define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 
 #define __min(t1, t2, min1, min2, x, y) ({              \
 	t1 min1 = (x);                                  \
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
