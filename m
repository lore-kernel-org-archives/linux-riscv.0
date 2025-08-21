Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC314CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P169RKzhc9vLjY/40+3iR4ipPWLkZ2Wi6jDQ508BD8s=; b=bHUiSVXrHtK1AA
	mizwxpymu3HqZI7cOWp8MJBSNz2GV+uG3cMyLfYNYC78XQzCtCuED/Q8EOQ7UaUNu694FcGhNUjHk
	lL4KQNsZ93xUD+nG8BFAe7+oPTOD7fTOUkhfFD4UuXqwPhE60dsPxxhJ957AkuZH1wfqnvMGTJ5rE
	oAyxlX4CItDF6Y3RS9sKCXO6lZSHLO0U7snq42+V8Lz+JM54UdYI8d8N3N3X6UznVXdMIosvAPy8e
	9rle431ATxaDXxS5i+Zf0FETQ+MHuWqe1xl2rjraEPbgXq5YDf8Je3vXwFb8S/hqKmxUT/zuAIllQ
	wC3sxwqgmVllBEsh13Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFzx-0000000151Y-3Gth;
	Fri, 22 Aug 2025 00:51:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaS-00000000O85-19w1
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=; b=R1UDGFaRC0KKLFeU4uLPL9dNxj
	2uf3R0uVZ+Yc0h3c9w4FnZa4LS0Lz7qDIB5PvAFcWEkDB7ukiJw6Eu2OBs38L4klTwHR5C+ZCHdpq
	N5LBRmxt59shsnt3ZitTbDtQ2TQ72vw4CHLijE3docs0AZQ1URiyVN8w2SPEYSV4ErWMlA6f3grdE
	BCu7r6CdEfVVhuv4BnUG6GSnwIq8Mc1sgduf+8x4QquINgYy8BriFCNe4TfHLwsy/nJDnjpB3mKRk
	IRJHZ0JTUonGTLT4iJ7+czRIHBTMCTXcgCzHFrzm7Io3cUDRvfuJ9QVyGysRJKR5Ivd0GNCAGW9W6
	6LtDf1rg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaO-00000000f6V-1AAk
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
	b=ag6xg8RzWaSJrU+ClnXCDLD/Kbyx717TKNThcvwwxwgFVUOqkG8ZTWtaChZvfKNfFiUM6v
	Rpduca7XllUzA/bGrobbKTzBN3ZcwhgnXq91v23tOJzxAp+9aQGnGLhA3DindtKWmlB/RK
	1lyN46RpMqtWEucfaiouAF5o50sTj/Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
	b=ag6xg8RzWaSJrU+ClnXCDLD/Kbyx717TKNThcvwwxwgFVUOqkG8ZTWtaChZvfKNfFiUM6v
	Rpduca7XllUzA/bGrobbKTzBN3ZcwhgnXq91v23tOJzxAp+9aQGnGLhA3DindtKWmlB/RK
	1lyN46RpMqtWEucfaiouAF5o50sTj/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-cObsIrerPVyRMFybnGpOvQ-1; Thu, 21 Aug 2025 16:08:31 -0400
X-MC-Unique: cObsIrerPVyRMFybnGpOvQ-1
X-Mimecast-MFC-AGG-ID: cObsIrerPVyRMFybnGpOvQ_1755806909
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9d41bda7bso1054444f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806909; x=1756411709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kuJ+10C4pYxyWPcGDJkWqMBAcRGmXje5KFYns7NWu0=;
        b=cdyDcbx0Kgb6wnnNlNwxYkNg4ko2kmtyuXxUbvkotvGGLDR1FhgCnL1guLq8IVwVbM
         pinCg9Oc604d1lMbMhFyFMr4NNqRpvFS1dXJD7eCWawHIu5IAC/alXtssXOtYxuCwnly
         3uBZyqUGBcdY0nGnuDjWLtoumEcbn8UktJG8L1qOuEk+0hseTEb81Z/LkvawMO1z/ei7
         vmrInF55kMJfs+0k0+VVzxH6oX7f/ZAkqc7UycpBE2bggOXDl3TZBe1UyHFoRJcgXeW9
         j532er661o0HSxURi3cSCr2IoLEloPucJKTh+0z6eb2YG7X/KaCLKs5sGiJAYraT1c53
         WvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxEmzuhnjOGEH1nMUMR2eGMn6Ytm1REHzY5AFrug/EP6rj7aK1V9Eli8Ygspr3kUHBvziZ7i6E80onNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG5tmVXPZT1kCu3XRhqk0CKmknGHz3DPm8/eHyA+jvXUSDaKxk
	ROcvjeLQBnZgiSKSk0P8KzLmcFDEno4TZiANjvRzXSLzlDz60VTkfC/5vmtClvhMlIuvEa1qqM9
	0+hpSeSFVu04jCzhIPrdyU/BaiGdI4aQns0rDR4HRmciHwa9LUJm0EHEsN+DUAMMOwVHPtw==
X-Gm-Gg: ASbGncvaxZEsvFCDLr5TlFt2dC/cBRhhIytR1X3LxLk/vnNZg+GlGDes26Cvkxq5q25
	AAf+6MNkuVJG8UmdDt/jTyQxclCcGwDalFm4emmr7aLbK5kMUpa4IJGnP0r3srAiL6sLKq/zaVj
	s0/ziKnbDu/VJPPmGXL3o6O7UcOz+lPBSI2nAHz+5ezYEJU0W/V7+uMg15LZTRRy5tfPr75+n4I
	ARF38iFGP5FBsewHhLwqhLiPaGfH31lN3/+dAxvqGgcuNcYqaDFeG6eUj6sDf7wJ0LMEg2J071t
	rUcD0XWYwk43D/E+s0VH5u6H6yTnj4Kbn0lPW8t2XwJpq9K10c5IYVCBzWFBPAAGGikBTJxIyJd
	yYt02uokQu9CHtqcFkHQz4A==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3c5dd6bbb33mr155526f8f.56.1755806909430;
        Thu, 21 Aug 2025 13:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRykwWh31JVJGBkobbD9YNZEskJV981iF0h0FASAg1XfgxaqZA4MQnDyPntA4/emfIOpWurA==
X-Received: by 2002:a05:6000:18a6:b0:3b9:48f:4967 with SMTP id ffacd0b85a97d-3c5dd6bbb33mr155476f8f.56.1755806908930;
        Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c5317abe83sm2432791f8f.40.2025.08.21.13.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:28 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Doug Gilbert <dgilbert@interlog.com>,
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
Subject: [PATCH RFC 29/35] scsi: core: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:55 +0200
Message-ID: <20250821200701.1329277-30-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tkfeotWq4oQp-HXb0yCeGV7xFX2hAK-AoKBPuGp6kvM_1755806909
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210836_638459_537E7C7C 
X-CRM114-Status: GOOD (  16.10  )
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

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/scsi/scsi_lib.c | 3 +--
 drivers/scsi/sg.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 0c65ecfedfbd6..f523f85828b89 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -3148,8 +3148,7 @@ void *scsi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
 	/* Offset starting from the beginning of first page in this sg-entry */
 	*offset = *offset - len_complete + sg->offset;
 
-	/* Assumption: contiguous pages can be accessed as "page + i" */
-	page = nth_page(sg_page(sg), (*offset >> PAGE_SHIFT));
+	page = sg_page(sg) + *offset / PAGE_SIZE;
 	*offset &= ~PAGE_MASK;
 
 	/* Bytes in this sg-entry from *offset to the end of the page */
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 3c02a5f7b5f39..2c653f2b21133 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1235,8 +1235,7 @@ sg_vma_fault(struct vm_fault *vmf)
 		len = vma->vm_end - sa;
 		len = (len < length) ? len : length;
 		if (offset < len) {
-			struct page *page = nth_page(rsv_schp->pages[k],
-						     offset >> PAGE_SHIFT);
+			struct page *page = rsv_schp->pages[k] + offset / PAGE_SIZE;
 			get_page(page);	/* increment page count */
 			vmf->page = page;
 			return 0; /* success */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
