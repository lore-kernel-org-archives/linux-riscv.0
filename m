Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1DCA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jP8EL/c9pPuknzKvjbMdLTd2rCtDq2BH4N2MstKIPeY=; b=rE8lJycqjHKJHK
	FQdkWdaFlf8XSVMz5GllRx6HFtLye7V1Fw7QNFkCasWoidLig+ujjHWGSs1xl2RGSEoVVig/hcXOm
	DUp7HRb0YXUPCYl2wV245Lalao89unk+uzV00YGlHzj8cQI2hDDY7D3g1YH/D6fzuFwtCG99W1ZdC
	/7AmOT8bTlLWiI29GI0D/JVSrZ4YWdV3ar5Lt3kHguOpw4nnrHP42jgoJjx4o7cWukPk6a0yCtUHh
	H3+04yRX9KzriTp7eVyxXpNydZyAw8QEE0H6HXZDMZBbKI2dlN/SUFyX1+3t8kNrdJB/pwI+cE2Lc
	UsDXa/CqKV01k2jFeASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVD8-00000007ub0-3xdy;
	Sat, 10 Oct 2026 11:25:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVD5-00000007uZw-35BE
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:25:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso323966a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631548; x=1792236348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=Spb+kjCFHhGg1SsjHIQfK6c1hpHPDKTWMW2wAsFaOSY2xOiQLwcm+lTvkOO0pZs+GJ
         AtOGpF0DaknXgQvLwwV9J3HcQcldrXskuh1ZrdJ31V50v9oMUuHG71AF60kt2WCtFkXl
         3iwUhkIHM+M02EVlb8kBWbxGNSN/hoSNjeK24zBWvewblBFC7gUuih1fOw1rWYmbOJgi
         H1usf59iCeu8w471ckg3J0DL8YfAoKuU4uZ1NTXtZK4RMd+K7lGcd3ohgY4n4AAvLaZB
         IzWGMFEDT1UU1M336gn/r6rT3//sl/ihPgZN+Ybm2HjbHyzNDv7dmTel6K7rpXL1Mlck
         rbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631548; x=1792236348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=wkl3oFm9XdntHERpAq9nd7GwbgxT0A0wRs/uvLLeZ2aAMs0ToOcYOHIBwjc/1qLew9
         XVhIMT10dzrb9oIn+uzSvC8wubElcoYo5oanVoZK1ENPTsIpB8Ym3g9COu7Wh4yvx0PM
         XxAv/Y62K9wXGDncHkYhBXAYdv42IwHCvt+41juTxh7GeVWlqtBaWr+8AV4Im/c/aenj
         yP1aGPDBF7hGr8lw4QDjnN9k6dBcjg1SMgFi3sA4ZxK8g4u+VK+qSB0M0c8u/DNqIFPi
         DBp5xjNNjZ46z3Ge0W/KS7svnBrUbdvN5wWO0J8DBPp8rFaMRd1h0bob0iF/Hke2OCHJ
         OIRg==
X-Forwarded-Encrypted: i=1; AKwUvByW8JaYSOAlfwVg0QAOw5Q9jXjOPiyo4Qs0F1QzvQ5V4/Y9bTQpM2tpiIwPjblNquL6ye/6pf+6gI6UOw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJp240QiLONl8JdJVArZ5k+EM4m3HIx9LSAL5H4FFA8tdLqtCxZ
	70AGPBquky9EGZlloCo3zBe1NC6kkwI/hphBNP3F8XUcoUHuAHYhzopvpiUBdSZVoRc=
X-Gm-Gg: AYBFou3gHdJrelAjJZlCm9hUfUZ1l1J6JCOcbeBdKe4fF3SfDcEOEfgoFnJmSr1GUIA
	7zg1x9pFSqDfGHQvg8lKho3QS1aXPyqJhN0AfIcYQLLtCjriE4pyPUTJ/wcMtyDC3PVvQt5E61D
	EjMPkJg6Jmz8d0d0rx90zuTdB46zV5RLJZBh2gbPixzOt7MACQEZEErNQeB/IfWFlOFvNXbDutp
	yJUmvfLEsCiuHRmwZl/wIPzCtzy/S+szgMfA8eRbL9Uz5z49XPLE18vfH2V+BKMmLW7eeTR1lgx
	g13Y9x+8w6ub2H1d1xGK9fX6XE3n//UqbZHrkSXLR5WUbtPWWoD1UG86MX2tJjnYQQzzwagnJnC
	aDoNmO12VzOm7Jo7rdbfMKQYSd6nB2Wx6GKMposMJqmeQqoKi3yKzCN1atPXLPQ2calH0ikiR00
	3mizOSi9XmEng8POjmsf5CkVHQy7SpPTLyX6JYjRD3JE0P/fHs8kqEVWhroZN6OBs9wixEUsOf9
	vl7fH8Ogu+ccDrsRyuBkXDe9DzUp5rPBidt0A==
X-Received: by 2002:a17:90b:3a48:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3ab3a33db57mr4120069a91.3.1791631547298;
        Sat, 10 Oct 2026 04:25:47 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:45 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Sat, 10 Oct 2026 19:24:53 +0800
Message-ID: <20261010112457.49485-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042551_783205_B22A1756 
X-CRM114-Status: GOOD (  10.75  )
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

Memory hot-remove can free page-table pages allocated through paths with
different constructor state. Some paths run the page-table constructor,
while generic sparse-vmemmap population may not. The x86, RISC-V, and
arm64 teardown paths did not handle that distinction consistently,
leaving constructor/destructor accounting unbalanced.

Make pagetable_free() test PageTable() and run the destructor only when
the constructor initialized the page. The RISC-V and arm64 fixes then
use this common helper for their memory-hot-remove paths.

The architecture fixes depend on the common MM change in patch 1, so
this remains a single series. I expect it to go through the MM tree,
with review or acks from the relevant architecture maintainers.

Changes since v1:
- Move the destructor decision from x86 into pagetable_free(), as
  suggested by David Hildenbrand.
- Use pagetable_free() for non-reserved RISC-V page-table pages and
  simplify reserved-page handling.
- Collect David Hildenbrand's Acked-by on the RISC-V PUD fix.
- Use pagetable_free() for arm64 intermediate page-table pages, as
  suggested by David Hildenbrand.
- Trim and update the commit messages, as requested by Dave Hansen.

Muchun Song (4):
  mm: fix missing page-table destructor in pagetable_free()
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c  |  3 +--
 arch/riscv/mm/init.c | 32 +++++++++++++-------------------
 include/linux/mm.h   | 37 ++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 38 deletions(-)


base-commit: 8b38ed9ab5b09c8ba168cbcc49524e9b380ee5c4
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
