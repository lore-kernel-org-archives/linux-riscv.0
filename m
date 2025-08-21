Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE034CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlMdFfkN5wxCpxlnpbLvAhVZuzPBmg7l/DogPRS+laI=; b=x4cmju98N1aQiV
	btCyzhRYHRR2CiywbKhenjdAg7MNTDjEoEk1ctBRvQI1Bp9AQuBrMG4dRchw7LUxRsfr3P+Y5YaNg
	4ZyYAZ4/+0dUHUTTgbbd0QxsmfNIL36GiltdY2vM7rhItldJypVtLt+W2CBcQ6XLFSgu9wTdjKrp5
	iVj/lJc8sm15vYKTo4CLDK5e25Tc+e6gJA7Q3YqtlAxPNSydwQUnBdAV9BLsvT1ZonVjZlWQup6uO
	bbyhQvcxowsIPyQFSrluHNaIYaqR6WEcS6pB8HyW7QeZ7gfVhskH0D6kbyu76yT0uGzYWDFtI5s40
	cNOilprZ2edZSjjzl3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG0v-000000015aX-2PGP;
	Fri, 22 Aug 2025 00:52:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaf-00000000OF8-2kH7
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=; b=QazDwaC9jxgrFY27owS0LQWJgt
	ohulZAdv3FwkUrKKmytvlW7JawijcUkgP09o14/kquaMA0VJirqqyXOOD4KA/wmGdP1K3/LW8nQU+
	S0Rpz52RIbqkexln5b6LrSwgtR9spI9zEkO48llGPg8ufZq8Uqi9ohAzM44YZln+HOkJwZXcRmLyT
	774ub9k5siH3mh9W8YAYIVtY/npxUovEbyCoh09Nz1UAnZEycdESHKsb4kK8eFZQQnwZ1djIN7GNc
	rEnk/GFEuj5ottpGSl2wqnK5j8K6AzoTE9HBo/Czz118CmO0/54cfkiSdtiT3odErRZwy9rvnYsLm
	PqqMr64g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaY-00000000fGF-3eWr
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
	b=UonbbPABs/WAVZJ+kINp2q/lhGgM2bobix8GHDf7b+5l8wT6zS1EEwQKVIipjhp7kANz1G
	6qN0HXc1f3tA5YdI62e4WfebyfFYLgR0INJwDIY+GOce3ZnZNdU9OpuLKm5ORDZ9vPb7NW
	kx5CHPOcDKoq6F21zkgReSDFBMZc1Mw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
	b=UonbbPABs/WAVZJ+kINp2q/lhGgM2bobix8GHDf7b+5l8wT6zS1EEwQKVIipjhp7kANz1G
	6qN0HXc1f3tA5YdI62e4WfebyfFYLgR0INJwDIY+GOce3ZnZNdU9OpuLKm5ORDZ9vPb7NW
	kx5CHPOcDKoq6F21zkgReSDFBMZc1Mw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-2d5QSKnSPeOFycnudZ5fkQ-1; Thu, 21 Aug 2025 16:08:44 -0400
X-MC-Unique: 2d5QSKnSPeOFycnudZ5fkQ-1
X-Mimecast-MFC-AGG-ID: 2d5QSKnSPeOFycnudZ5fkQ_1755806923
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b9e41037e6so864610f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806923; x=1756411723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
        b=m43Yxy8avv10wMUmoSSrWqcPSQqsumb0DO6bb5G59yDnR50YRPa5/Z11/rU93PDk1n
         iFR4JEK3C3MI2tA0LdEljaeN66I5sL0Eivvqtjxd8mvPiOmaqH1wv2/JiOLuaWAQJy8E
         zbTNnHSMiXATBrBVcka7PkUs+hqNacgFOqyFcxfUau5cFgzD/VF/iJ7B/uth/Gr7Jjtt
         /8UQXQduVuH61T8cc9TR5M5oHVCX744vkdX1N3YNfwEZyAYKKt6SpQlz8L7KUGHco8DM
         yhPllOERUcboxDRbxmuakaFRinTPUAQIzskxlDixamh1d/qqR5vpm/XW++E+lAmG76cl
         Ebyg==
X-Forwarded-Encrypted: i=1; AJvYcCUjWKcEishKpK3xwpbtvRWkaNu35zSflOnVPaUrGhoz2EEGSbl3ykhxZtj8oSvkEDjZGORiD9IEPh5VdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywaiyfcmxm8rhQKjSk8JZCcWaSl9LkMHqLD949hBCIGsOgb7lG2
	hBwu9R0NJW0JoaTXy4LQUIqkSJFldLA2oJYpbsJJASuP40Rl6U1Ioub5qwhOeGyPvvEOhkHi7QO
	pu+h3GSivNlBraP/C0r6UpPK7QhkD3sHcD0rt9tkY5OEBVRCuWW3+6uy+HendT3K3buuu7g==
X-Gm-Gg: ASbGncvVjcgGRT+Mfx7twErJb7Nkavaiga/UE+MfNieb9tCnL+cSQ93UAmyqR8dxpFi
	kOIHwra9M2EQW2tpqQMDabvQtAUJHF43/xkMQ57jmO0fcSnD573W6StKLhIWZ6VdA6tSODrWKMy
	/if0u2OgDpjmJYjLuA5aPKWAKTccNOtzT3dLBJzwu8YKuHrjB1Ug0hp2wSba/dUPMt0Gpv6FIRw
	Vmz8vwdg8h6hkxK/HHvdRZPNIZ5ld1XMJweiMGzV7GGfJYK3dYoip08WCKyoyRdpX7cGXcYtn0j
	VK3dgvQJdSJ0ZRSdKAlyou47mRhhq2G5z5b7VTEhorFyJVETdgyemR/++I6q0S4SaNFp+O3xNCK
	MXWbcpXXc0xuYP/iBnmm11g==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204686f8f.33.1755806922957;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHzRKC08dohUKQD/XdldMc6IWYVddiLtTh8Yidep5vx+5++gzVG23SiimMwYZ+HldR36Zkg==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id ffacd0b85a97d-3c5dc7313famr204645f8f.33.1755806922505;
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e3a587sm10028205e9.18.2025.08.21.13.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
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
Subject: [PATCH RFC 34/35] block: update comment of "struct bio_vec" regarding nth_page()
Date: Thu, 21 Aug 2025 22:07:00 +0200
Message-ID: <20250821200701.1329277-35-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 13UODRy5Kv8jqW9dXmA3uuQyn9MGmL0r2B619NOJxPw_1755806923
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210847_116307_4FA0DFEE 
X-CRM114-Status: GOOD (  12.10  )
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

Ever since commit 858c708d9efb ("block: move the bi_size update out of
__bio_try_merge_page"), page_is_mergeable() no longer exists, and the
logic in bvec_try_merge_page() is now a simple page pointer
comparison.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bvec.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 0a80e1f9aa201..3fc0efa0825b1 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -22,11 +22,8 @@ struct page;
  * @bv_len:    Number of bytes in the address range.
  * @bv_offset: Start of the address range relative to the start of @bv_page.
  *
- * The following holds for a bvec if n * PAGE_SIZE < bv_offset + bv_len:
- *
- *   nth_page(@bv_page, n) == @bv_page + n
- *
- * This holds because page_is_mergeable() checks the above property.
+ * All pages within a bio_vec starting from @bv_page are contiguous and
+ * can simply be iterated (see bvec_advance()).
  */
 struct bio_vec {
 	struct page	*bv_page;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
