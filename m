Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6C1CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9u+gIY5gWFEp8FiYu9MHTb63cWLFbA7AvaQ9zVazSQ=; b=4sq+FXq41kK+tC
	JUMV1Y6aDIxCUZqK2jjc9bau2TQ3Z3GQh1vpBVWwejexPx3cmbR9gsaY4F8S9SpY8fVq/CL1cxByc
	PFwk9RqHJDGiemrb9rOV3knH3rHglGRZaAhN9b4Oq4DTQWkGsDchs+5VxS+RK8Qjhith9KJDjsL0X
	StJZRoHz7aMuXQlFuNe4wN+NiZKcvAtL8hKvTnUFHxj3ydF7XJwmWSGYDURjnJoW5WNJJxEp3sKHH
	qUfdjrMLZjKV10qiv+xmeGzaYYyaWK+dBIX285wY81W7ucaM9RLR5sXg5PwWhCmoKXmWfWmH8sIyy
	5akl8mY6XZw0/V0PNVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG0w-000000015b4-149u;
	Fri, 22 Aug 2025 00:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaf-00000000OFD-3544
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XmvTcrL5C0dM7rPtm73IEcsYc8PUVzmaMdzwCc2EnvI=; b=K/z60T7wCsRWnmUrmDIlYDGF5f
	yNCig5cNw4kY1i4vQaFXAfZMC4mYUvMelOGeslgejNEzSkpetjeiTFtUeadR20FnQ+oIr0CQV1/iS
	JjhMHy9NKl5LUITd6PBJDz/Tp2xS7tlHrda4x5+m7Ro+IKZ6t4v/ZYMxJin9mMzXNMmcaZ5US0wi6
	yoPDZFcJTGWfTGseW5o72ECmlImcrtnjC4/C6dj0vWeNCkZO4j8M6Y7OrP+Ps9QLQnwpZ5SR7qXWj
	Wzeloos4XjAHIBILlBumHdtj7lpqQmaLr8DD4zpEqlHzCUrS3xCxd+YCPuQFNCAtOBK/NHplAeDnv
	Ipqs1Mwg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaZ-00000000fGi-0wLT
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmvTcrL5C0dM7rPtm73IEcsYc8PUVzmaMdzwCc2EnvI=;
	b=btRGvwQd5yEfPj1kifp6xEheNnjz998SBeyIWOi7oq/6mXKxnQ2bu9f54XY1VniGqLA3ZF
	+9zxTpUM6dkAvyV01fm0UpJuWQ6MGgKkQ+kaoZfk8em0o56R3zwEu2gnutQWGDro4s9/f9
	nKbl7ySrWTjb6gjZRh08nJJ3sjXjwxI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmvTcrL5C0dM7rPtm73IEcsYc8PUVzmaMdzwCc2EnvI=;
	b=btRGvwQd5yEfPj1kifp6xEheNnjz998SBeyIWOi7oq/6mXKxnQ2bu9f54XY1VniGqLA3ZF
	+9zxTpUM6dkAvyV01fm0UpJuWQ6MGgKkQ+kaoZfk8em0o56R3zwEu2gnutQWGDro4s9/f9
	nKbl7ySrWTjb6gjZRh08nJJ3sjXjwxI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-Ro38Sf9IOpeN_l3FN1vgnQ-1; Thu, 21 Aug 2025 16:07:10 -0400
X-MC-Unique: Ro38Sf9IOpeN_l3FN1vgnQ-1
X-Mimecast-MFC-AGG-ID: Ro38Sf9IOpeN_l3FN1vgnQ_1755806830
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b05d8d0so8767145e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806829; x=1756411629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmvTcrL5C0dM7rPtm73IEcsYc8PUVzmaMdzwCc2EnvI=;
        b=VXj4WczUlv89F9qyymUn4S0R+KJubTnFrMs+08A9F9zG1qVYVp8KvMVuqrd+t+wL8C
         qPTFW7Ws8WbLqBatLb4Ozxga1VlSAdfneA7u0AJtL9F7uufUkGJje3dgihghUMPs1ble
         0wTYGQFxZ6OD9FwOV1Dd3q27WqddElTujWnGS7LJZc1IJd5GQPco3iAiuJm9WuXVzUCp
         30QJaktvA0sypmKzdQJ+B+llzVfYhe7mIBJI83sPQt0sGGDmcgd54u7NpGJMWmQ46p0x
         q0e0gF5U0LDkRN9Mm0l7XKHJX18TgU+Yu4aYWLI/Tz5R/68aljmWsp4c09/Tq3tdfv6d
         H0ow==
X-Forwarded-Encrypted: i=1; AJvYcCVNqGJbjKWoODyChuDyrbDUR+4HLGswXAgzGC4A/8vb0haucjcdVTCVs7RC1a5uQ6Qcos5GNN/gEU2QYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdrGXrFm64WeHW8mjpPWv8GqQPo4IXi8UVxQeUwVo418Ptl3O
	947byHUuQdY0VYhCaIJiYUvdoNZl/q1Lf5xdIdqjP6SlGP9l0bJwOzozFIV76YE1p5pKimDLkKo
	buMf6VH5Ld2kfrJ1drZLz6PfuXvbTzxA33KhkP0ZLqPEtoVmn633Nm3tBcRrAXWf+JeOpuA==
X-Gm-Gg: ASbGnctOIJ6WqMJb6P4v2ZHZ0yVdoRSxakhdHNu1iDL38WOXZMKQ+4wQzLJztHlCLwp
	nDC1oiIbhLRU0e5jRoeAlg1R/sPNRzSKKdkhCjT5fwyIQF5s59gZkSD/sdj2MXi6m4BKucV7Kr9
	G5EPjlyy/jQgGYUpW913RPN1b3Mn68Fu9UMQzyvcnHqqisk3LINIQb0sh0TpYyeK33NAxC09s4u
	KzKXSyH+rchviNbdAPrZBYEMycpupmqo2WzYLcV6IMb2aG3mmguDSwEbYYyxaTgtgLSn5n9uvey
	LeLA2pSEr/Wv8qOjyD3SBbtIrUFFZ8tvJig3KGFmbpoZevATPNLaIetLz4HX8OupdYBCpJcUKkT
	4lI6ZIRZ1TE63hipA2saqCQ==
X-Received: by 2002:a05:600c:4506:b0:456:eab:633e with SMTP id 5b1f17b1804b1-45b517c5f34mr3673705e9.17.1755806829499;
        Thu, 21 Aug 2025 13:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvYkVaGxfZdplMxnR9eu9+L8mDJqjqWM2enq3Cze2cE8zEp05huuco+bDpuuERUQ/1xaOAqQ==
X-Received: by 2002:a05:600c:4506:b0:456:eab:633e with SMTP id 5b1f17b1804b1-45b517c5f34mr3673145e9.17.1755806828996;
        Thu, 21 Aug 2025 13:07:08 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e1852asm8722665e9.25.2025.08.21.13.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:08 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
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
Subject: [PATCH RFC 01/35] mm: stop making SPARSEMEM_VMEMMAP user-selectable
Date: Thu, 21 Aug 2025 22:06:27 +0200
Message-ID: <20250821200701.1329277-2-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jAIBqGfUrgPqZUJkR6ypVP5-Neg8mWfNq-sak70MWZY_1755806830
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210847_423656_D0891115 
X-CRM114-Status: GOOD (  14.22  )
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

In an ideal world, we wouldn't have to deal with SPARSEMEM without
SPARSEMEM_VMEMMAP, but in particular for 32bit SPARSEMEM_VMEMMAP is
considered too costly and consequently not supported.

However, if an architecture does support SPARSEMEM with
SPARSEMEM_VMEMMAP, let's forbid the user to disable VMEMMAP: just
like we already do for arm64, s390 and x86.

So if SPARSEMEM_VMEMMAP is supported, don't allow to use SPARSEMEM without
SPARSEMEM_VMEMMAP.

This implies that the option to not use SPARSEMEM_VMEMMAP will now be
gone for loongarch, powerpc, riscv and sparc. All architectures only
enable SPARSEMEM_VMEMMAP with 64bit support, so there should not really
be a big downside to using the VMEMMAP (quite the contrary).

This is a preparation for not supporting

(1) folio sizes that exceed a single memory section
(2) CMA allocations of non-contiguous page ranges

in SPARSEMEM without SPARSEMEM_VMEMMAP configs, whereby we
want to limit possible impact as much as possible (e.g., gigantic hugetlb
page allocations suddenly fails).

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 4108bcd967848..330d0e698ef96 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -439,9 +439,8 @@ config SPARSEMEM_VMEMMAP_ENABLE
 	bool
 
 config SPARSEMEM_VMEMMAP
-	bool "Sparse Memory virtual memmap"
+	def_bool y
 	depends on SPARSEMEM && SPARSEMEM_VMEMMAP_ENABLE
-	default y
 	help
 	  SPARSEMEM_VMEMMAP uses a virtually mapped memmap to optimise
 	  pfn_to_page and page_to_pfn operations.  This is the most
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
