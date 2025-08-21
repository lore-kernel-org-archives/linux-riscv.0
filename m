Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED7FCA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWYZoaalNsM3pNSIwcX39zXfmP+3YfdkUUB0QbXMemE=; b=icW3YiEcRUA77y
	t6XS/lwC8N2vT58PJszPlLbsXNjhwJ2b9WXJEJA65EJTH0iMa+SSvDoj603f4JaaaXIDmgQ50Li9H
	ZR2yFGwswsTfDe6v5J/VG66n2ysof9vvetVUVqGYkR/7qJuUDzIbFDirAiqtNkl0ddCyEGW8gOFFj
	s7A5lvyhJJNhOAjmLVsHtoVErGM1dpUpwrUgtFZuQKVqU2Pg4f9uu5+rJIIiv5OBZthR4gXpYtrR/
	IGi7a+U5/SKXjamDK7txd7GTTTK493H9ymvG7H+N1n9El5W05TAN+IyEAY/+Z0NN8XwwQY91607o5
	9a70x6iigPQfJUvfUDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFzw-000000014zq-0puf;
	Fri, 22 Aug 2025 00:51:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaO-00000000O6J-2Lhh
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIthYg0x+2djveHghlw2Jb9wmVGYKVQz7R4ULrPQfiU=;
	b=B3sr6LQtuUYizDjn6wgyn4F8MIpcNMkOlNbstW7Lrh1yOQfJh6FyQI1fBivC8m3n1PEpt4
	or15qoSGc60hlmpqErc5TRvoNumZc2o1aWXhvOjmhZGsMkhh4ujr9jVxpNuvhFhsQF64Pd
	VV+9mXFF+oho47PjJV9PGd1WQovW/gk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-wxIIWbfJO4CB7CJqMoal2w-1; Thu, 21 Aug 2025 16:08:33 -0400
X-MC-Unique: wxIIWbfJO4CB7CJqMoal2w-1
X-Mimecast-MFC-AGG-ID: wxIIWbfJO4CB7CJqMoal2w_1755806912
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3c584459d02so247639f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806912; x=1756411712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIthYg0x+2djveHghlw2Jb9wmVGYKVQz7R4ULrPQfiU=;
        b=oJK71p9zcvAZKNa3KRizehTqj/DEqI56nE/4WtFO8+eUg4tCiMqoOI/qLXhPqgAYNS
         PcGpXEbrpcm88qkQZ+ztkE/tXcSnXAC6+968zrJXjQEBepg5rdS+pShn45z/dplXiCNJ
         yWxgclh22mpiI0Ho9HFfUOutHZU1M2XJA5F/UaBzRsBQ2x2dExjGKAodrtnTMwqwnuGB
         sVkIzX5yrZRsn7QF+qXIyYfHA04JkaCuVbWaxupbQatSRfG2LXLJQkvLbfziWnfw5N24
         GfWlh9+9OH+Wn0G6JP5JsXe0r9dz+T9ZXvoo9iVOstG1ZBruc/4SPP4JL1CspbrGI1cs
         Kpbg==
X-Forwarded-Encrypted: i=1; AJvYcCXOjfrIMsSnFoFQBQ8pYeE35EJruOWu0v43AuSJ02RRgK/AIw4vNYE3Tv7yD/ApRtMbmpr0VpvQ1yk8TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YweL1MWMFebqJ5KRVqALa3WUIa0QdAHSRomb23VvCg5p7hr0GGQ
	/WNCsJdrAXzFIMqem1EVoPeN8Dm9J7DDvWnlnh0qcRCCWJs11DhxQTGbvc9Q8ok4wrxGkT5qTig
	zfi8sAVr9oONlqKRTq5b1VsPQrm5qWnPrLZoJo9EtQjK7VhNkQCrstSwVPIND902DcC0lMg==
X-Gm-Gg: ASbGnctTOmKPKAttlHKjcUFhfCCwt5sOorbZK/mvgrhUfrIun8RO5nA5/aZ/bBYA+PT
	0zrhaIA5Je3ddBrY6jN7qWqvBnkOFfAqYJhVoUAdE3o1/BInA7zKRSkeyRfUsTmvkmx6DBbJuOT
	r9OtGbG2xT4ncNAnaHUCTVdlfmH1tG03jBG5wAwJt0NVwrtmWhTXFs/EiW2cFWGnT/UXL8uUNEz
	aywHspwjfA5OnTY3esftMwp06ayUYYTSBXDUmojoQKILohxVXy+6Qin1+aouJet29vow9bh3hpR
	t0178WG62wljhlKbe3Al/4gQw8wQ3gnZ445DFMC1syVMvS6mKx2RBkQ2rC8psTb6q/aJ5lCikGw
	no60K2j4XBhUSa8BJz/fsuA==
X-Received: by 2002:a05:6000:40de:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3c5dcefee22mr195298f8f.59.1755806912332;
        Thu, 21 Aug 2025 13:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRe/VOMg0cdir08bDTWMwU06A85Ixelypa7wMbtHpunFYS8URS38ofNnAO5nDnYJmoWLlWSQ==
X-Received: by 2002:a05:6000:40de:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3c5dcefee22mr195231f8f.59.1755806911819;
        Thu, 21 Aug 2025 13:08:31 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50f16eb1sm7598185e9.3.2025.08.21.13.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:31 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
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
Subject: [PATCH RFC 30/35] vfio/pci: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:56 +0200
Message-ID: <20250821200701.1329277-31-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aj7drpUrEmvOIXTRjxBt4HNTUTcYOmdjJQDcuwwyxuQ_1755806912
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130836_679136_BD972583 
X-CRM114-Status: GOOD (  12.85  )
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Brett Creeley <brett.creeley@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yishai Hadas <yishaih@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/vfio/pci/pds/lm.c         | 3 +--
 drivers/vfio/pci/virtio/migrate.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/pci/pds/lm.c b/drivers/vfio/pci/pds/lm.c
index f2673d395236a..4d70c833fa32e 100644
--- a/drivers/vfio/pci/pds/lm.c
+++ b/drivers/vfio/pci/pds/lm.c
@@ -151,8 +151,7 @@ static struct page *pds_vfio_get_file_page(struct pds_vfio_lm_file *lm_file,
 			lm_file->last_offset_sg = sg;
 			lm_file->sg_last_entry += i;
 			lm_file->last_offset = cur_offset;
-			return nth_page(sg_page(sg),
-					(offset - cur_offset) / PAGE_SIZE);
+			return sg_page(sg) + (offset - cur_offset) / PAGE_SIZE;
 		}
 		cur_offset += sg->length;
 	}
diff --git a/drivers/vfio/pci/virtio/migrate.c b/drivers/vfio/pci/virtio/migrate.c
index ba92bb4e9af94..7dd0ac866461d 100644
--- a/drivers/vfio/pci/virtio/migrate.c
+++ b/drivers/vfio/pci/virtio/migrate.c
@@ -53,8 +53,7 @@ virtiovf_get_migration_page(struct virtiovf_data_buffer *buf,
 			buf->last_offset_sg = sg;
 			buf->sg_last_entry += i;
 			buf->last_offset = cur_offset;
-			return nth_page(sg_page(sg),
-					(offset - cur_offset) / PAGE_SIZE);
+			return sg_page(sg) + (offset - cur_offset) / PAGE_SIZE;
 		}
 		cur_offset += sg->length;
 	}
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
