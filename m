Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AD0CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rgp6ceT4FwgCuzN7SE8l9nU4J0BPayXVxZqrbg38uiI=; b=EemqYHadypRZoY
	Vrvb2I8G53UyIKBthqCywgpvg0/Bcfh5VJstgLrj9P675A10qoK/9TOHQPCLrND0JYEoc/JX52CNL
	xbir8yBghP7UnwWANy5FwE3Vo/Pc8LZCiHaqV9t8wFo3rnaP/k04Q7SRhUorwLZa2UFbJiB3DR73I
	UtJIPwF69ZkUYxvrCDSAuOS+5CE3n+I9NJ1/8ufdFVR+RBEeBmoDEu5vOWo4JS8ZJAIkBIVM+lhRZ
	InHaOj2l0yBaeaXWbeBs77o5+Nc9q1m8/ogwJIi1UVSLLtN4CyZrBe7hxdg2KGTNz6ChT/JHhXUgN
	Xh9dBIJH7ivXCQ9cWwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI4V-00000001KcB-3Sa8;
	Fri, 22 Aug 2025 03:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBb0-00000000OOx-2u2j
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=; b=RM+/s/BryFemG7CM5/8MSRVDEM
	7mVpyOzLypWfN43WqsNlXtKId+/i3L7xhUwRAHJ20GwVl9Yn6oYdUjBGuCe3SkiBPEPHzvyaMdK/N
	MpIBF1hK//8JhTh7DBksBc12UqVsShvTr5bYkTBoCQPVrygfO6E8f7hxOOIIjyKMIwme2Do5E7j1t
	Oxri5Lr8GpK49nOa7T1eOgFbrZd9vOfR8FceNuJ/CBqKyb972PYJE1OxDp5D2gp38WcAsT5Kmb3mJ
	q881DNYr7G5qVsREv7erZR0SXt0SfDJcBdN7xzyxxfOo7E5FDuHLs72p1tRUYh3v5mKiBVL5tCUiH
	EQ6bwShw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBax-00000000fOP-2Hde
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
	b=F0rJ02Fy5sYdAzAIbmC3iZXjQcv2iB2rYRReDO6RkJ2QB4WZXKossWw3qqua5zDR5rxEDZ
	5D5PkzUYb9MZeHNBuJbCp/nQwthfcIkQ0hujA/CleQgbxuuoisYvpWU5+y0yne9tkyI6iO
	DhrZlsg07IslMxWBl8g+99lWRH/2Ptc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
	b=F0rJ02Fy5sYdAzAIbmC3iZXjQcv2iB2rYRReDO6RkJ2QB4WZXKossWw3qqua5zDR5rxEDZ
	5D5PkzUYb9MZeHNBuJbCp/nQwthfcIkQ0hujA/CleQgbxuuoisYvpWU5+y0yne9tkyI6iO
	DhrZlsg07IslMxWBl8g+99lWRH/2Ptc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-JMOncY5lMMiq0QkiLiY7Zg-1; Thu, 21 Aug 2025 16:07:39 -0400
X-MC-Unique: JMOncY5lMMiq0QkiLiY7Zg-1
X-Mimecast-MFC-AGG-ID: JMOncY5lMMiq0QkiLiY7Zg_1755806858
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0511b3so8301595e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806858; x=1756411658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
        b=mXayJO4VDBgnu0rB6OjgfMilen9rA2F0pfP53iLxgNgnNf3YDmlBudKI+6DRN1Mz3u
         8Vk6xIinQktHwp/boliBdqOr5uvwjQuLwVF97eR6trtogFRC/8cGH3XaMQdKtZNkbPel
         xGadFauShWStwjWnt69fwBHJ1pkezfvkV9ve8teIO2V8E8H/Q8gHSYzhKnR6fMj014qz
         clBZoAsfg9z1xpA5AeAvdR8uo3i6WGZ2S3ZMhjaxZcZFa887iGu1uvDMvqsELE2bPamL
         PozBvUKCwO3kdppT06XBpZIw0ZcSF6kcPP5x+wrrMNINGS0hhHQ9wywtsdNYA6Pfk1Z9
         2lyg==
X-Forwarded-Encrypted: i=1; AJvYcCVvCUbOnDlKxik84BLkd9Np//masDAxvIvcfVjYeDPB3eUJIErAbx0gWjdHqLhAnX048oOzTNbprMf0DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhzDQRk0gnPemzL7yxe6D3tmBCcqoodz0hXgl4yk/gKpHi3oSb
	Z/VYsawWb5uocPC9LWGRRcgcjGrAYrhks0eynAx4/wkDiXuEYZ+1OdS0I4WRNYacfqqhksvJQgM
	5dB51PAbEXpaugfb3jaVDEmCS1rKQu0K/B+OuoD4ZGuBn0V7XGtVGNCSXcAKDQPaEkwCUPA==
X-Gm-Gg: ASbGncuFBXNF6Q4g9R8A/Py08NLzvy7rNoo9/OHFgOXCpcHUFXCtUJpJ1orAP0wXMYD
	1OcBAoRyQaDbg2p8Q7hnogNNM/GK8I9EJ+k5UEcHmwMhQJ9yNEQaKNqc2W/ZEFLUkvNefrGkMxa
	InKek3pceqHhiY7mBYyDH2s5TRV+n/Z5nPTsnfzRazlG+6RMPz6YCxyWCi2PCJd7f3vJCkZXJ1e
	J/+NutGvKdidcVh/m/aApvdMJiadfmgiiqmiqR0lGAUxjt87IcwzQA2NFKhj8qT/WIlY3aikgmC
	/y3BnaC3Rs9kqe7oagkClxMnA/zJ2w76g0H2Nerl3wplaSo9kEXj5S7dUjsaNN5DOU53jSjNbvK
	2o7yaE3tfGSXIG+AK/wOYaA==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646645e9.18.1755806857895;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSU80KqPPviGOLp6CI40u/NjPujjG4FLCG6NoakJIlvY80lRDOTTm20w50mEKFuk0YjVSLQ==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646245e9.18.1755806857378;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e87858asm18672185e9.3.2025.08.21.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
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
Subject: [PATCH RFC 11/35] mm: sanity-check maximum folio size in folio_set_order()
Date: Thu, 21 Aug 2025 22:06:37 +0200
Message-ID: <20250821200701.1329277-12-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rtoPcZYUDY0fdgHcUmzJL7rhoPl9x7cEhQTyOjL49UI_1755806858
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210911_997144_89041061 
X-CRM114-Status: GOOD (  11.48  )
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

Let's sanity-check in folio_set_order() whether we would be trying to
create a folio with an order that would make it exceed MAX_FOLIO_ORDER.

This will enable the check whenever a folio/compound page is initialized
through prepare_compound_head() / prepare_compound_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc030..946ce97036d67 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 {
 	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
 		return;
+	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
