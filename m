Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6243606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGWIhmlo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iSumUcoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=br9zwlqq6VBBdGVw1fw91ZMkDr7Kg+DdTFU49nlXDZU=; b=fGWIhmlomMLHWE1mTDQqAdlaAV
	xJWEkyZhVqUpZwTmW24VcpxXBBtcf5+EJ8PQKLFnFAuIAiXlsOzjYZRcCa7ErZOtNUwMFitbaPtII
	FajO2kzgxPaGkyyXyZwa1TrT+ssPOEVfqQDzLiZ0qooW7w5cM/apopGiIATbBOBEv0oJPVb/tcSMR
	XOM5rF0Nby7txTny8ItwhwdSeyKnST6Q6dSBCe6bZ96noiTBX40lHFJmjd004mz6l3jt7FBFIaVCu
	ENHBOm2nymVlN8EvI6+R/YsX1a/PakPPmECyL1A4GuQ3xRUc1UWrQ+2EznV6LBsZSnjuDhNmU9bXY
	foYE9M+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rW-0000000FZsX-1f2u;
	Fri, 23 Oct 2026 06:34:46 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rT-0000000FZqp-0e8n
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso229456a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 23:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737279; x=1793342079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64tBqhaCstcvhuNkWvz0hImiXE9PsoHY46iN8B5GY0M=;
        b=iSumUcoILtWST7ulihlVQYL1FwGYdMZiC6vAoP0rAJ0TgnG4eqqo5176Ymko+CHNwn
         p20QK5sL9snxQR4CCTqRhp17A3RvkdQa4C7bGmvoR4C3t0Wr9oNsiMN+d26cstOW9Ba/
         GXqHhqHlSrRlruANUvqk6mzZTXdUkwLhTXJvHasw+RL7x8wa0aBDTB1o3bdJyXODUaTH
         3faxmpf9RQzCc7nAM4KgcNZSC+9ihmmOFlrYmMys8ZwtcHMTGefXKWpiNlp2ZOJEHHLs
         Luodh0GiBITz+9QjM+s5BYX22jchKcZQvdjpt1ODkHtmeMYAV+1A+rJM5ubMz9JhhL2b
         IGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737279; x=1793342079;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64tBqhaCstcvhuNkWvz0hImiXE9PsoHY46iN8B5GY0M=;
        b=n0GfmkcOWbJekdfDRt36wkDRNuPs67KCkHKToy1dfcR2y2KjjUHLtvm4RsO35OwFdX
         7pqrl6PTuxtt9+oypKEnMlRutCNXdRntsTWfHWC0kov0HjHybHEaMldubj5h2U7ehZEK
         v6ls8wZqZS63fD6Q9Ec1PIpImMh+b158DKeJd1TSpnLHikgas/tIpPISCwbyoPvYeJUL
         q99XtPVQpa3nAacJ7IQEMnoNaizbrYA+g8Iz16xCEKljzpR5jyOGq5ZHTttNE9XBN49r
         9SwrXTIfin4E7E/iOEPmAw168+cKaMNHGHCK82e1CsU7pECbaZLjMVf/8NL7nfmB6HcQ
         uYQA==
X-Forwarded-Encrypted: i=1; AKwUvBwnJocfR0b0e9gah1kjHxCzGAzVuG8PjEJCHX0Mso7wPJTKmkADDll78gNzjBZZN94CC3jsY6n7114CeA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLWOuo+NtMgNj5P/PF0DHoGEj7HFxKRTKwKA4HapmtyMeXxoPCq
	GOLPYqtD/39fqXTNYnWmurWVRBLBJ9XKnIMAEXeUkaLn0LJTYnQ5wiMEQ1oeJ160TeI=
X-Gm-Gg: AYBFou2NPwRFWLZmNFeZUso33Ze3ersgD86fLX+8t6KwhOM/oOPnFVjTQUpbWpFMTv4
	pwK4LTWhaXSNjrVw4H7sTMrePwapfRyV75gulHz1rlY2A57Iii1UIoqUYNTFGdboKx73sm6aUL5
	KNXznchqYY5BvUGiGGxhziHA7VzjVQf5BoNxRR5x0ciAQGVhCEn2wmk/ybIMFct3zkirHUUxLpA
	cYbS0n0Oxm/rlblwqQzUaTwc8C7wf5wntmXEflKinR9LdTJUkKMfu8xKGF97yTwgWmJh/kEmBZc
	VVBKeq9apF4IJIskJIoA8VAIOss2iYfSrAIRZawAF/vgR/XeYRuHKZno6Du9sICFeMbEepPKK5R
	Dc4JAEpF/k9mlNpUTMC3f5NawLDks3SB2BF6kaqL9K2agdHmbdx3QalAJ4vlDkhM+/OEn8hKjKl
	1lbEcInSSpG5uL1HvPqW5q/qmhhI2Hk6+Gusjdd9PKb+P6KJO0rEVWpFKVBvarCl/l9x+VMucjc
	qW29V9Ab/gLLUZvGe3JsJioUBXwGB4OiPfR0iaPqZE6LhfUZF7zvG7bAgjZGkBpK91jE6oQOkcL
	Nw==
X-Received: by 2002:a17:90b:1c82:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3adce0ccd3dmr1138974a91.7.1792737278490;
        Thu, 22 Oct 2026 23:34:38 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:37 -0700 (PDT)
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
Subject: [PATCH v3 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Fri, 23 Oct 2026 14:34:24 +0800
Message-ID: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233443_302058_EFD7E46D 
X-CRM114-Status: GOOD (  11.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Memory hot-remove can free page-table pages allocated through paths with
different constructor state. Some paths run the page-table constructor,
while generic sparse-vmemmap population may not. The x86, RISC-V, and
arm64 teardown paths did not handle that distinction consistently,
leaving constructor/destructor accounting unbalanced.

Make pagetable_free() handle any remaining constructor state before
freeing a page-table page. Callers that already ran pagetable_dtor()
have cleared that state, so the destructor is not run twice. The RISC-V
and arm64 fixes then use this common helper for their memory-hot-remove
paths.

The architecture fixes depend on the common MM change in patch 1, so
this remains a single series. I expect it to go through the MM tree,
with review or acks from the relevant architecture maintainers.

v3:
- Explain why pagetable_free() does not run the destructor twice.
- Add the x86 stable prerequisites noted by Jose A. Perez de Azpillaga.
- Collect Acked-by and Reviewed-by tags from reviewers.

v2: https://lore.kernel.org/20261010112457.49485-1-songmuchun@bytedance.com/
- Move the destructor decision from x86 into pagetable_free(), as
  suggested by David Hildenbrand.
- Use pagetable_free() for non-reserved RISC-V page-table pages and
  simplify reserved-page handling.
- Collect David Hildenbrand's Acked-by on the RISC-V PUD fix.
- Use pagetable_free() for arm64 intermediate page-table pages, as
  suggested by David Hildenbrand.
- Trim and update the commit messages, as requested by Dave Hansen.

v1: https://lore.kernel.org/20261008073021.2512665-1-songmuchun@bytedance.com/

Muchun Song (4):
  mm: fix missing page-table destructor in pagetable_free()
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c  |  3 +--
 arch/riscv/mm/init.c | 32 +++++++++++++-------------------
 include/linux/mm.h   | 37 ++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 38 deletions(-)


base-commit: 26d7e34b4226709084461a07bf28d9066fa96d8c
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
