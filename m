Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D9CA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqBep2z9pdfpSOu50XWU6Te6gGFVdmjYICr51lv4yV0=; b=w9RT8+AqOniX89
	cd978aDiYK1NjeFwu1f1jblH7O5hZghSySz06lMzIoAIQmomJ4ud/2oUEEMdYgvGuirOl7kywdkoI
	nwkMEdaKjPpd8kha1zjSj8Z/4WzEb2gqgFMz7GbiUZtvcbUe+xfaZELxTwTIUInQLlkMmqTxZ7Bqp
	T9qHzc1OSxNH00vFLDXVQFN0qm6BAErb0QTk8WKyw92hZEazwud8Vb1lyZbOLmsdVJe6tV13eAlMf
	+qe72BfPQVQeX5ZaYMsRUJlmTUbjnHJZ3q5ds8q0itigtyEkbLEypA+Rf/b2Fps4vzt01dDXYjDwm
	4iDK/wweMl3OTvoN2/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI4V-00000001Kc7-0sZ1;
	Fri, 22 Aug 2025 03:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBab-00000000OEB-3vWc
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=; b=CEOIsL+ehyeq2oUxCrCByBC+o3
	LARu7KEIqy90lkzxcJIQeO2L/i3dXhAMhJ6HIuUCPzCVVUp1YqydHCu4gzm3dalhH9R5DGNHUX6aY
	bsmlsNoOhkM7UDg/AmwwAj2wSu6zHe5p1umTkliCfDTbrKbdoF2B2YaHstEUFB+lt4aPuQEG7S/J0
	hxbRnB7ZOt0ab78+4lCN7puGyzsIkH06j2LUOqUVXYmHznz9kmGAr/Zk8Faie4TNp696gzQMWpPVA
	TAJ1N+MxUpshOX91c98YiGcrAXfrAS5gYjuaBUMX+XEG+R1t9QoVMFguj4BmEn0BU7+YCrke8DO4k
	JzXWEIcQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaW-00000000fEH-00WB
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=;
	b=I0uT5YO9ymeJ9nUGEOi112C/zecLuoUVq6HD7j0IltgyZruk3yNufyI0SseMIyIY02eRsj
	m256WzSG2djwKqGgMaW2wffK4yBA7efg8FQkh4HITgmAkwUFvTmOoEafi7kwYUycIqAWq5
	+0TIzkI4V2Ew0QBIt5FK/C8yjL5ILwE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=;
	b=CzmGaUiiH135QgXQPa2GhxtkqHGW1H7LLKC59fxfjy/fCH7u3PG6m1Jw3xTI195snKEAwO
	MKwmOT8pxEhTVPupqSKUKXZDR8f6LOvZWaGzkF3qZDd/4qRO9CeWunW6QgOekDSW9NiJK9
	Ql3EEslQ0UceZ+uqpdIGpf4/iz2sLlg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-hoY98zD0P8O7s5Zzla4zoA-1; Thu, 21 Aug 2025 16:08:41 -0400
X-MC-Unique: hoY98zD0P8O7s5Zzla4zoA-1
X-Mimecast-MFC-AGG-ID: hoY98zD0P8O7s5Zzla4zoA_1755806920
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9dc5c2ba0so675764f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806920; x=1756411720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnKBChYNBt6k7pWFZ1VK2zlCQ3hhOdGhc0x5VCAB6rA=;
        b=Fo3tbtturR50xFHUiYBr5NlHDypacAexydrCNO8earBLeM53j4QpH0+Nor+iQbl1qs
         TdlRrDxjQ7Be+ATyrmJDDmdfKWvXz7KG37X0DtFLUl/M8Z/XXOIR/N+7amuV2FiWryij
         OLhj9ZnVPJVMsX/+nHUHtinuJx7yWt8aOStyHOGFGQ/8bYjQPox+8V41MS5Z4w7Njqb9
         q33HFDhDIHcH2PGILB90igz9wjCIy91PKM7QEFKOvrO7WJThwHsnBujbtN1XUU4VIAe4
         +veHUCMx08ExUUzShNuIPgbg2I59iPSJsL1yBpsD+rCaCHC4sLJpwSDLornqBgmLQSE6
         edeA==
X-Forwarded-Encrypted: i=1; AJvYcCVLvvJm5g21NRf5pN3ZkB8uOau4b2uU7Hf42pAqJtrGJnpvL7MaEUbv1DASjLGHNwsEQgKU5RlM141xfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDO3GlSVA5eWhmp7v8qpBni7PRxy4b/EKkTQfouL52r4U690vr
	h2z/UdKQ86em+pI/mSk10x40T61qD6AXsliGCwe5GYzDGGY10wT6r1792sZKdVAo+IAlcH3+je9
	Q1nwmH65GHUnuXAcr/PVFPyu5NpVaUv1lcvFBNKMVckbb4u2HqtCYB/phB22JBvzLGzocsQ==
X-Gm-Gg: ASbGncvhUMCJQaPhh4urHq66OFLpXtryMbmHXupseLDkPMujVbIftiGWjpCu96Azibr
	hZao/ffqD8iUzeBD1MnWnJpeb7zbkapSRbNxUbNZaEy0MGqwIv5DeHKB0UQNaAj+IbxTUC3W130
	iTSr+Es9k4uUr/Mv+Enu2z2kI4EavzyU1lkzig46RYafRljk0PLK7nMu273fwjSSHw88IdI9K+S
	sw/u5gPzofY9pz+7PCpPvRTj+fLn6DaCymOoyP2r5kNdoskNb899SqJNVGltlEMYgZ/w3Y5yfc/
	UGxwBbUd2X6X2/+EbrWe3bkcFPdO+jVvSwu8+ysECDwblU3E1DrsAGMP9odIIMB+WinxyT3NlQv
	V4D+FgN8Dpxu/9u2CyYFqRg==
X-Received: by 2002:a05:6000:2405:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3c5dc735246mr192361f8f.33.1755806920383;
        Thu, 21 Aug 2025 13:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrWn9aM0C/1GZBHvF1UL+fKz7WhllpDdsBGpm2GmVOIF4Yc/dULhABMcTdk4u9sLFplZdR3g==
X-Received: by 2002:a05:6000:2405:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3c5dc735246mr192328f8f.33.1755806919917;
        Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c166bsm12920369f8f.33.2025.08.21.13.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
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
Subject: [PATCH RFC 33/35] kfence: drop nth_page() usage
Date: Thu, 21 Aug 2025 22:06:59 +0200
Message-ID: <20250821200701.1329277-34-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAEtle_Gl-3qYnpNJXel1WrmLAKrqSPq_0Wr91p1mzA_1755806920
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210844_374782_0CFECFAE 
X-CRM114-Status: GOOD (  14.88  )
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

We want to get rid of nth_page(), and kfence init code is the last user.

Unfortunately, we might actually walk a PFN range where the pages are
not contiguous, because we might be allocating an area from memblock
that could span memory sections in problematic kernel configs (SPARSEMEM
without SPARSEMEM_VMEMMAP).

We could check whether the page range is contiguous
using page_range_contiguous() and failing kfence init, or making kfence
incompatible these problemtic kernel configs.

Let's keep it simple and simply use pfn_to_page() by iterating PFNs.

Cc: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/kfence/core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 0ed3be100963a..793507c77f9e8 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -594,15 +594,15 @@ static void rcu_guarded_free(struct rcu_head *h)
  */
 static unsigned long kfence_init_pool(void)
 {
-	unsigned long addr;
-	struct page *pages;
+	unsigned long addr, pfn, start_pfn, end_pfn;
 	int i;
 
 	if (!arch_kfence_init_pool())
 		return (unsigned long)__kfence_pool;
 
 	addr = (unsigned long)__kfence_pool;
-	pages = virt_to_page(__kfence_pool);
+	start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
+	end_pfn = start_pfn + KFENCE_POOL_SIZE / PAGE_SIZE;
 
 	/*
 	 * Set up object pages: they must have PGTY_slab set to avoid freeing
@@ -612,12 +612,13 @@ static unsigned long kfence_init_pool(void)
 	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
 	 * enters __slab_free() slow-path.
 	 */
-	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
-		struct slab *slab = page_slab(nth_page(pages, i));
+	for (pfn = start_pfn; pfn != end_pfn; pfn++) {
+		struct slab *slab;
 
 		if (!i || (i % 2))
 			continue;
 
+		slab = page_slab(pfn_to_page(pfn));
 		__folio_set_slab(slab_folio(slab));
 #ifdef CONFIG_MEMCG
 		slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
@@ -664,11 +665,13 @@ static unsigned long kfence_init_pool(void)
 	return 0;
 
 reset_slab:
-	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
-		struct slab *slab = page_slab(nth_page(pages, i));
+	for (pfn = start_pfn; pfn != end_pfn; pfn++) {
+		struct slab *slab;
 
 		if (!i || (i % 2))
 			continue;
+
+		slab = page_slab(pfn_to_page(pfn));
 #ifdef CONFIG_MEMCG
 		slab->obj_exts = 0;
 #endif
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
