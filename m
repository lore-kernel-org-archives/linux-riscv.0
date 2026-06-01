Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CCECD6E60
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFlT9fDenfr9ZHoTVM1rdr5TovRVrAjSlgLAydNj2yE=; b=K+5MMg57B92aus
	WG0svuLeBF0EMA8ZChGKS8pwRn5UFWJ5wMvX3TNeONzz4PSfhTsJq1CjzAyQLmMuNbpwRJQBZNA/8
	Yb8ubrPG6ZKqbgG4qyNsd7sOWhSkK32ESVLYUHUfhUApP2WizD3NWwDedl9KIEuWzzY98QC4vngQh
	Etzq8SrKvjjnrVtEitPFelQM/mRUFNyAUwx3BaN2OoabpGuHMblzSi1PYXp8NjHCY1aYmsKSzk2MO
	oisDubolh6j5V22I4qubkfSnYiQ5Umk7wRj/27EvzjvikuQAUb0Hr6zYMfFZSdf/c0r6QZsNcuMol
	NqFDRRMuUyxpQbXr5yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKX-0000000APmI-3cHj;
	Mon, 01 Jun 2026 08:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKW-0000000APld-2AzA
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=; b=E5hokOmAR4s1Hgh+EmAEU1P3Nm
	SS6wn1f4ZACWKn6ccnmqZY7VWGJevoptV80B7LtRiZE8SZ/Umq9rbYvYR0EE4F3bmb/jgtUpCUWgl
	3DOnG/xbE4GgM+ZMEnKdxxthF15wv7uyz9OwdQDBhh/uAn1/nR32+y1oRXOotq6bnWK6vukhCIhMB
	t8z+bMq9ZuUVg2CE0qgsvyLdG6LoVjAPUfR7aOOcXzXK+bv6Tq5MieYQOrT1Dx83A0IxC79CX4+BH
	RStBUt43a9i3C0V9O0Ul9sAW9uq7gwBbTMmbm3OHhWO9LwNI7jt5THqkQPhFX5E98/2iue5442UTY
	zXVUuw7g==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKS-000000067aW-1Any
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842307472d4so286353b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303735; x=1780908535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=fQBA0uH7eFLIGtIPsBMnwGJtIhP08HeQDWZi8uDunaubHp+7Ch2DGHCVwmD/x+PS/4
         tGgdpJfFqpZyJmpvXX/nLDj/q3gJbRj51HrK4lbEuOu0KD1eREeDakO//UPRQKe3DEIl
         5SBjUs9Ib8LtSMH0J8WQ3AUrYc+lHmte/D2ig71y0fUCuat5dOqnE4jzIEwXirXtO0Rk
         DDdGbY2bAoyz9AKQMo8Py7UsVQksmtG1gjuiAAq+na38nzrT7MWr5mQVFKyilBCApoNN
         S2mLJRY0Dp/PXuS4+9NBiawsuAJd6XjibZCkxqNz7bsWdOHdvyynCXx9+kBTJscnEi39
         +w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303735; x=1780908535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=SSkCow+JdVLXEJGBlJGDk9TIeeYdRxo2HKDdl/3QNLsqArUgS06osZqzZCEuEc4GQA
         aOA0n4CrUqJJ4KrqPcmq8PlPBQYo4RVidf1mYOiJlIZod3gEs6j5Gd4KcJ9O/z5Tsg9E
         MpErOJMc+LRuMSYOM3Q5Y+V9wKORHbOw+1pnyJ1m5iiP42NNpZ5qmbL5KoxCFQSAOWkB
         QQWy78ArSVwM7rnspBwAXgUjcV+X/9qHTxNKt82hFoaevYch0X+NEsuqUEFzRLdAXQyB
         pPGvRSl7kJEul9aIzYncNNEJcTRCZoxMJt7tAJv9PwOZ9TJ2StmCaBk1vtxG2gns70Jo
         Z/pA==
X-Forwarded-Encrypted: i=1; AFNElJ+H+5ZYVVdR8sUI9QWSgIGBWBvrNfUegA9G/5SLhAZ9grAVz4exaCUvqY9D+CpwAeonwlAGm3FlMEB29g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoEQjffIjYHP+HjxSvPvhqyvpSTZDwyLv5oODT8uwF2bgEYaUc
	oUSk9yyyS3uZ/yhtv64x3+kWAma7bVO15+swRQYaBq4RfLRjuLl0VscVqalx+ytQMPg=
X-Gm-Gg: Acq92OFRKxGNN3z3oYh0k6JMDDbgy9FDvOdPoxpyuRx6ItjcXaVZXCJEPexV65vG4na
	Mp0prkDB+BeZWIeSbbkWs7rk8/97Rb3ZtXCcaFriHweTvbqClXfkrp7+ZL5hEsTFFX5suRX0Pjk
	0T6FL6o3AqYWgsbCR0zTfu9m3Hwbeaddx1Jc5NCLUkB8WRnyb1TfEfGL2Pm6Wpi4GkehLCobtuI
	+IsZdJ+Upno2TnhU2qzqywZKAAVQyeEGmcaFlrw7U8cW1nUDmEc0/xiIMgTUIIlY35TR82fWIT6
	M23s+NC1z94R9eP+fsT9x8qDSHQaYTOYEg0C3vlpVxJDuDzPrVUKpuAo/goBdzdP5idoK85Z33M
	ZkoDC9BzV0MfuzDC5gACF8TF0K5BnhwlfZUN7eCek/Oqj4EjGEzmlSN5STEBnGRpHdEQHzmmLrl
	r4/NnbtGqKL3dwXabdFb8R7P5ExcANL9Wi3tcH2ixevL3DoGgXf60Ang==
X-Received: by 2002:a05:6a00:1822:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-8422575fc22mr8798151b3a.50.1780303734571;
        Mon, 01 Jun 2026 01:48:54 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:48:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 0/5] mm/sparse-vmemmap: Provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:39 +0800
Message-ID: <20260601084845.3792171-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094900_734679_AF632ED8 
X-CRM114-Status: UNSURE (   7.28  )
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

The weak vmemmap_set_pmd() and vmemmap_check_pmd() hooks are
currently no-ops in the generic code, which leaves architectures that
need PMD-level handling to open-code the same logic locally.

This series provides generic implementations for both helpers in
mm/sparse-vmemmap.c. vmemmap_set_pmd() installs a huge PMD with
PAGE_KERNEL protection, and vmemmap_check_pmd() verifies a present
leaf PMD before reusing the existing vmemmap_verify() helper.

With those generic helpers in place, patches 2-5 remove the now
redundant arch-specific implementations from arm64, riscv, loongarch,
and sparc.

v2 -> v3:
- Replace BUG_ON() with WARN_ON_ONCE() in patch 1
- Add Will Deacon's Acked-by to patch 2

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


base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
