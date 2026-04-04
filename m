Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA70E88D70
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lg7+vonAoby0R5JQPPHHQmf9scUuei3OOC6Wj5qdq+8=; b=r7He/uA7+6kHfX
	EQtrqmgQTpaNVgUMnSkc8Sb0gguvgdC6kM2jMbKyRO8YTbUDUDAsSTVSqJt7MlL1wSDerrEe9U8+3
	fotMz4k6vIqLYnDBA4QP/DuWFfS+1iIifxE1lQRTvCzANW3fBWcECZtkKxD2evaDf7w+dFdPhPQO5
	RQ33NhFhqEFxO3FCTcgIepHm3uoK+oG2BMyuv3PaLRD1eDD0kC5mZE0Um6VuLhyByQUs0VWa0hRhD
	rGLbSmZN/5Up/PzBFbrR3VFO1Z19p/WsrkCnxstpo7AYnveGkJzDAClzcLBEQQ0QN+8k3wVQ6juVe
	f3tUeM211zXopm3nrKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGI-00000003EY8-1gSd;
	Sat, 04 Apr 2026 07:17:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGE-00000003EX9-2YqP
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 07:17:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ad9516a653so11958455ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 00:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287054; x=1775891854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=MP1MPHPAbVuciyfBK5ezp0ZyFs0uX/Hhmky6feyfnRJP7vm4+AH2poHcdK9zxqR9Ky
         l3/tKvuoajzqIWFp6uYADkp38AufysqrrVednR/K8XgnQNmFlK6CeUdLb0uKszi7ftZp
         QesFeYy9tm5M1AMU2k4CMEDJsNJyq+UL1RelIJKdHNmVGQTAYP12/EWL3HJd2hxr/Pyx
         fERwhG7k8Ws+cKVbHC9dKYpplL6bB11+mQqRItQxvCFF5wGyiLDI57hVcg/aFeaplqrF
         976VSk6WSSRydn48pk8tMqkCKEyC/ldomC3rVHEL0Yu2urAvfSos7Si6pV4XfQNHCeEM
         z/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287054; x=1775891854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=KLNALr8VmYjXqAhIQ9OYLlLEiQ6/RPjWHmdXsaJS7ehzqzDAkMr0PIr2slEvtxVlC1
         +gN6imErmjn1la0CnmneCnxt6v/XXVem+pk2bFpfmviHN+maWLhuY1HOy8WsnIaTiZf0
         Amg6+PE17/N1F0F8UIAS1oH4QXSke6lStJ9S7Pfitoe2xmQ2OZmhps5FboTsI6iSRWAt
         oGRReZumBTjicmd+jOkHK167RtaI4aeC0LLgHf0ZwyXIMvMKKvgqb2qUna/TBedGsn1F
         cXeZ2Yr9VJenwkwHRu2rSwYpF8TXhzk8Kc+EkjI4Y8+P7g3qak2N2nS/ed2znZX/rsWz
         o8mw==
X-Forwarded-Encrypted: i=1; AJvYcCVZORUEGsQ7v1ldjY0T5XThNPMoGCBZpzrE0BFXx1Tp975RBQmZ6AumoSofRe0Fg9+BmTyRgogIISdy0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0dBkAZM4PV9k2daibjjpS2KXym1Jx2Rx0v6/F5e1nx5Pig1FU
	2Y+OvHT9mClhe7E+yCY3A8hnREKi/opC8Jd+TLJ6X/1Q3MPOMk1oOvGZT6NjLyDk7pA=
X-Gm-Gg: AeBDievA//so/omrzvn3COmoywESzOQg6I69hVLtZw/vmT9fq7DQ1u6QQj2FbnNgmnt
	h8H5ShisIH1q2XVSkIR5gEU1nzhl0DVUHz+hXFpGTX6ffeTEdS3Y4LNrrjx82NsUJLRkzrDYdM3
	Avx7khcSJmIShgrYubj7/M8+Qp6pCtPt89tv59nNtFhpUrYQI0Mb+BY7PQI47WbOTc+DNKutSvr
	lrJmVVmHwqMJoHDjWyjtWiPXCY9YRu8yCj8yrRls7PJLRAB/8EZkQyUi9CU9g8fTytOO1Zy5yWG
	rH4UOke+SYL328A2U9+DXMwfB7HQ0rCBMPJWFXjRAEF0JCR3c4aKJ8remvhIXKyOtdADaYEKJXA
	9x0L72Rs/+c1iil7M1wgJJJ7VBMWfsODjE1jcqhJoqAJx2Zbz+kurLO8dAdkXz+B0IctV7q2CuH
	8zhA43uff17Z9oYW6oqZ/rYLSR1w0E9RfC37tqn9kJ5toWh7lsoxnIiw==
X-Received: by 2002:a17:903:2808:b0:2b2:539b:d29a with SMTP id d9443c01a7336-2b28178ad30mr37104585ad.23.1775287054199;
        Sat, 04 Apr 2026 00:17:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Petr Tesarik <ptesarik@suse.com>,
	Austin Kim <austin.kim@lge.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 15:17:04 +0800
Message-Id: <20260404071720.3577290-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001739_006437_64E427F4 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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

The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
currently no-ops on every architecture, forcing each platform that needs
them to duplicate the same handful of lines. Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

This series drops the custom implementations in arm64, riscv, loongarch,
and sparc, replacing them with the generic implementation introduced
in the first patch.

Muchun Song (5):
  mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and
    vmemmap_check_pmd()
  arm64/mm: drop vmemmap_pmd helpers and use generic code
  riscv/mm: drop vmemmap_pmd helpers and use generic code
  loongarch/mm: drop vmemmap_check_pmd helper and use generic code
  sparc/mm: drop vmemmap_check_pmd helper and use generic code

 arch/arm64/mm/mmu.c      | 14 --------------
 arch/loongarch/mm/init.c | 11 -----------
 arch/riscv/mm/init.c     | 13 -------------
 arch/sparc/mm/init_64.c  | 11 -----------
 mm/sparse-vmemmap.c      |  7 ++++++-
 5 files changed, 6 insertions(+), 50 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
