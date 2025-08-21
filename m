Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC19CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBwirCWIcUJOHKMnU3gR3csIbWcjUxZ34ZxUuf5bhEI=; b=Gala+2+b0A3K/x
	sZNUnExE2/6LTJ6AIxAzuuNtl0ErsX3PhcaaOED5RDkPl2+ZtNWO9CrJP0PKBq22l6a4LmWs13o4y
	N/h+afRVXCsLJsCz8oN8ulVRDzu3Nz43FSuCx385kVGhFjK1OxIIaDQH7pK6fh0WaCaeYp4fasY+v
	/TyYh1xrvb+Tm8eB5KF1QdcO3c3JCD2k3u7pOoSK/VoRViFJ3QhubsaFUSEJ025DWacmv5AAazQPM
	nAZxsqlkORSMUtiHmgplLukpiv186GoV0YbAPt6hESe3NzEtzTPIXU2liKb66n/1G9mX9nEypNh0y
	/bfgFM5xKuduuxN3u6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFxJ-000000014cg-4BVE;
	Fri, 22 Aug 2025 00:48:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaD-00000000Nzx-04kU
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=; b=pmQFcUAnNfM02KRrBttFFu71j4
	ZztE8tNkGGJjZ+tgA4BqzX+GMgsG3lDgtNdx1KI4yfOkLlV80MNDrE24rS6lEx5m5HyE/m0kKjF20
	9rBCKRY9/v+iePXN14q8bU7iUxqCUPWoS20GNN73KwrNwfAkeNWO448vzW47QQgYPELiKE9GZ6pN3
	mxu6bAZk00i3otIx4jcsWQ6JI7wCxzcpVWS7sl4gxYhuN5oV5X/xlRLKifCivwKhRlU0SwCOwK7IB
	uncjmUHIFrc8xy1bGXLonZGuMo4nKdY1LiSsQnEW66utjWhOR8G4k2vJQU+oF0uZks/UOWQD8CADr
	DBKre8Mg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa9-00000000f1a-3xiI
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=;
	b=YrchmRgTkp/T/Ji2mPCA7onSMi7eLi/o4YCF4d9LsqJfEdLjzYJAyO+s145PGvQCbZirUI
	/PQ1+BEOB7JCaEwWDsPOC7nG+VtsOhvsVL20QogiCVnsbqa9hdR4Ia4EjaienvCqsMY4sZ
	+BGHIk1FGeIsHEcrPSm+YMQL99QITYQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=;
	b=YrchmRgTkp/T/Ji2mPCA7onSMi7eLi/o4YCF4d9LsqJfEdLjzYJAyO+s145PGvQCbZirUI
	/PQ1+BEOB7JCaEwWDsPOC7nG+VtsOhvsVL20QogiCVnsbqa9hdR4Ia4EjaienvCqsMY4sZ
	+BGHIk1FGeIsHEcrPSm+YMQL99QITYQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-N2lx9Vp_NGKTQ5vIPbnXxQ-1; Thu, 21 Aug 2025 16:08:18 -0400
X-MC-Unique: N2lx9Vp_NGKTQ5vIPbnXxQ-1
X-Mimecast-MFC-AGG-ID: N2lx9Vp_NGKTQ5vIPbnXxQ_1755806898
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b51411839so824345e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806897; x=1756411697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5INZuVEW8ZoCVRVHt0CSLhpT4h786L9PUsnD4NVlnkc=;
        b=dDFlboXCko0M8HYY4i1S6NsKoXbUhmQKh9Y8001QlFXfgaAawktDw+U3jRQphJxNdc
         7DD1nY0ftcD35c/r/8oLnh94P6FJNAfLjNIm/f/2h479a6zJlraTm4Juk4dEBUs99TSC
         0Khc2QxnwzECcp1UAPCKN1XZI1LTmb5mt/PTriR6gh8VVVj5ZZrZ3ayQ5eqHs1tcSRRw
         QKBqDq+zXZ70SKj6OjUCB4bLr+EbnBi9NixD8UY/+19/EtOLXydc483nd/7tX3+hHam7
         K0o6mX+FG4mF90y3i4GqqghhYHEXM2mxrJOeNpstGGFtF8d87ORG2tqnAFdhuHDWV202
         TmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyiXHB4lp33v9XS180OAMgf+UKKQsNb5tP2AUHgC8KgjziTnVSMLVVqyyrGifl9C9gyy3LlJcge1FvXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4WqNVKu+2x7BH8FgSUchXeWEYVCzzuL65bFQUTTwmu0dLqetw
	u1nx/shaA/sPzeOkgeXJPNXvubc5Iz6Uhc2qIRgAW4yTD8p9vtTPWXRY1RkRwxkQyOftpKkid47
	SALXh4fhG3ogyiKAj7rANGm+tc2Dan4pVAym5p/ag9nuleTLGeO1xUuBo8uLXa4KNm7omMw==
X-Gm-Gg: ASbGncu8PDCgJ69WR6I0dMnKZhDxypWWqZMpemtpWLi0Rhq+bAB/WaxInJfk6aJeShD
	ydNIycd4z37Kmaw+DkZJr0p7QXjmQZ9cO5Jj+pB5O/oXqJCt5WfEdYc84CT2ot4SKF4qStezPBL
	zpPnoXUU4jncVL8Or98/Tb2ioTCsQRDPckSbzJf/XrRI7cGFXsbt/JmokTPzJp9m+sNIeRRDI/Z
	EvyOR6XmynBBd9SX+Rz/I0XcQKoDqft89DgZOzX218vq3XF5R4dV4P8QACvMnK4WkW/TMLJx3Ym
	gnNu6s1J6K7aPWzvWzTNuosbaxSoRlv8u9xHSUNzvpMZbldYpbTxLh98xd+lcrrkMAx6Ezvq4jb
	FIHyzwhIZ//rjLM+76V+Sdg==
X-Received: by 2002:a05:600c:470c:b0:456:285b:db29 with SMTP id 5b1f17b1804b1-45b517d416bmr2506335e9.29.1755806897494;
        Thu, 21 Aug 2025 13:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPdYXvWWhsiYzUao4v8GSpApokx2tOJxTxGWaryOs6bj53AmOc+7o5w7P2pIRGnKU6jzi+ow==
X-Received: by 2002:a05:600c:470c:b0:456:285b:db29 with SMTP id 5b1f17b1804b1-45b517d416bmr2505625e9.29.1755806896948;
        Thu, 21 Aug 2025 13:08:16 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e3a551sm8831035e9.19.2025.08.21.13.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:16 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH RFC 25/35] drm/i915/gem: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:51 +0200
Message-ID: <20250821200701.1329277-26-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mQfWH4OCYmqolfDx_YWeY7lmTFTyK9g7EPVJY9VHDU0_1755806898
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210822_249773_E6949CEC 
X-CRM114-Status: GOOD (  13.34  )
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

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index c16a57160b262..031d7acc16142 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
 	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
 
 	sg = i915_gem_object_get_sg(obj, n, &offset);
-	return nth_page(sg_page(sg), offset);
+	return sg_page(sg) + offset;
 }
 
 /* Like i915_gem_object_get_page(), but mark the returned page dirty */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
