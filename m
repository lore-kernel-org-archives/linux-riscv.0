Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E40CA600E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IBIIrPMy072SQgYChKIE8TwLgvauoqGnnvTKcitZqQ=; b=o42CY6VkmIDDXj
	nboNAP0pD66Bh2IK3yekFQtQ/DqrDAMiYD4GsifeYPklBR3JpZSGvLwff1R68kx5CZmJvqvkh5Sgg
	5wdv5C+uB9Dt2FlwGCxjtswB1mI34gRllJfaNZHFmMU24Mm3Dnp3DrX0czaQHrIxMQpH+9vWDVtDV
	DdshcSm4byx2HcJxSUM/SSvpVFNT06vpI5ndfEvB+2aaHjl6uztT65Ao1YVLStG7fq5PeJcZEekJ2
	c0vS68yhh2MWSXAOeF+1PZDTaNmcePxK5zGJfFKA9P0A8n0+fegy20Aqg6rAFsKu6oNkGVISrYaPN
	lAoB9u7ByJ2yJvE2eNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaO-00000003kV2-012f;
	Thu, 08 Oct 2026 07:30:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaK-00000003kTL-1SMu
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2722688a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444633; x=1792049433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=NO+B87ohVhoazrLs+w4QO3NlDr6R656j0TVZDQHCqRomvznijfPoe7xqJBqypOYn28
         6caE0ZwWGy1rOY+J8IbAyl9PoBi/YWdelfQxdwEdL+AWZGDzyx8p7JeUUYg7viXpAZKB
         S7NkVrY2U5OYypSIUKidXIXTKQ+/8rAmRRRoWlxSLV880CEeW5FnEIoqLdC25F5In+vp
         Go+/wox85UOgSYW081vypEhZXTfWm8ZTv6GaJZNsfiMJxcZOV9XO9epvbOq1ascOU/sn
         4SIugsUjvMGo1Qyns2b63sEbwc+YmAQuLd1MIBmKzq/xJ7j1zYjwJKDrw3wivSAq1cQ/
         U1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444633; x=1792049433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=OpfR6GY6D0QG0L/vhEQ9jxm4kuyqYueug9VSMPVWxxfuBnvSjVlbu+HLZzOHUXyXS/
         VotgpFCbJ/ad6stA8hO4t5dXMfErU/cmH94jS7XtrolGcugBDsCep5Ux3iaM/2zw+d6f
         DhIwyszUTEwj071NKu+3Ad9JbSJGCH80zIoFeo6qJhiEP+sg8b7YRSwmQUKKPI8LP59Q
         beqJofV8+rkt9NvvpwHf4Tw5NJ+YlJZYdFFnVujLUBCiajI2FKRW5ocgI5Gy6kvP/1yx
         0+/5Rs9IZI0Tc9x2F5WAwoBxBRvT4iJ/toT6/0xXT4+4QukWejUDQ1JKP04chqx0G3pH
         v9Aw==
X-Forwarded-Encrypted: i=1; AKwUvByFukqW9gNrUnewPus+npiF5xQGDUtRMm2z4Z9DFouDE+wSBSuZpQOmsTu+Pnd/PK1Rke7foM+8mXRiog==@lists.infradead.org
X-Gm-Message-State: AFq9FYKq67agjAi4qgnGFZXyWqmeAoV16yta5oybC9zGs7AD3yt7Niv1
	bUoJ+IsK2QA3ULDTKPxrw157OV9rv8QOi6E0rU0SpX+mMmz8i26b4NU3kMQmvdDXyzg=
X-Gm-Gg: AYBFou1kdVwfZQ35xsw04D6X6VUbiSzUJHLk0RDf/KfJcpF0nTkMcp2wgzLr7oY5cTh
	/qZnkTavlVU1k/r20QkkDnYEx7DodIpC1TJCp8Yg1QnUAJpmJwriPWKjDnz8tu1iAX2SWZZi+IW
	r8ALQ8asfPTANU+47XPJrvJ5HAACcl0fV9SRoYSbULI/kzCdFF+ieLEZj97ikqDswZWm+Giar6Y
	hficFXEavOUz9j8gUrpQWWnvsKr4R1rGAm0/Tj9YNnDvG5d/ytID4KSHE+aWf3Dy1Fvuaxgan88
	QYc+vFk1/avfbOkYzuBZkWUWVEiatYpTNaYi/VpjmptbYiJH/7HnjqffihKMEfiiCagrWZZOEQA
	zqVUVEHAEfS9I8Q46yY8h6pLEJrwskzyq6pu6Aecu9M1wm6WXZQiuwAZ0iHvpxe2p06bHV/94VH
	Fz4SZgrhoV/HmlfDtDVwujNK2Xyn8q61ntbMNUNFoF8hZLbTRA2ZHu9nFEJ/TZzALvRtDS3RjPM
	vJEPleMuQzlkBmnPJ0=
X-Received: by 2002:a17:90b:3ec9:b0:3a0:9aa4:f9bf with SMTP id 98e67ed59e1d1-3a8a072a971mr4136690a91.12.1791444632841;
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Thu,  8 Oct 2026 15:30:17 +0800
Message-ID: <20261008073021.2512665-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003036_395620_964041C9 
X-CRM114-Status: UNSURE (   7.27  )
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

Memory hot-remove can free page tables allocated through different
paths. Some of these paths run page-table constructors, while others,
including generic sparse-vmemmap population, do not. The teardown
paths on x86, RISC-V and arm64 do not consistently handle this
distinction, leaving constructors and destructors unbalanced and
corrupting NR_PAGETABLE accounting.

On x86, the destructor is missing for vmemmap PTE tables allocated by
HugeTLB vmemmap optimization. RISC-V also misses the destructor for
constructed PUD tables. Conversely, arm64 and RISC-V can run
destructors on vmemmap tables that were never constructed.

This series uses PageTable() to determine whether a destructor is
needed before freeing a page-table page. The RISC-V fixes share a
common freeing helper across PTE, PMD and PUD teardown.

This series is limited to bug fixes for the existing teardown paths.
A follow-up series will convert runtime vmemmap page-table allocation
to the generic page-table allocation helpers, ensuring that these
tables run the corresponding constructors. Once these tables follow
the normal constructor and destructor lifecycle, the PageTable()
checks in the arm64 and RISC-V teardown paths can be removed.

Muchun Song (4):
  x86/mm: fix missing pgtable destructor for vmemmap tables
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c   |  3 ++-
 arch/riscv/mm/init.c  | 34 +++++++++++++++-------------------
 arch/x86/mm/init_64.c |  2 ++
 3 files changed, 19 insertions(+), 20 deletions(-)


base-commit: a92f009ac1c21986ff1ea0706419e545a4739513
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
