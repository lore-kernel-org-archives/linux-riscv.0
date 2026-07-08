Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C574BC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OhbNQlwHYAh5aPqSL1J6p9ukIJCZBgnJtIcyTFsHVr0=; b=xNabiBXMMqwkyl
	o19AZQVDRo9QJ1daDvrhsY2jydzMplJG5kDnyHKhbd0Sp7XRMr2Ayq5Z/Cz41ATTt6jDL6vA3FIN9
	M8ZbKbgfCgiXaiK3sqwTIZpwZ7ioeM2pRZbAhstOdvMipR+gEqQmQKMnc+h6zbo8JmgR5tbqkBrzM
	4Sed6sEs2gVfDT8aEivEPlsNTJdATljjdsgzIDm6d5g9rQ53ij87kIKsox2QV7qnnEW3Owagw/AGZ
	CzSNIaP26bO1jK3RUq8SGFMcnOOaSQ+RCUKL4xmLcIzDfKqJK2sWUQAyonoR0UZhRzHf+NKC0eZ+0
	oIDCjBXeEFcEGa1w3vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjm-000000003BR-2ltd;
	Wed, 08 Jul 2026 17:07:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVjj-000000003Ae-3qBF
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-847e6f03df8so1104111b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530423; x=1784135223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=amf9A3ny0stjzBNYa5xxQpkuKUHxHwl/QGUYuXrMddg=;
        b=jiRz4hjv8tOT3T0Klo5vBE7wQsacDisZVt0TDNIPseZfrlFUD3dUff//h0wq0+YxTn
         yX4VJbEo0KHqbYwMXt3PGxON1tGGEjwbQpSgFzYKRzjZQy0nYsJRox+6WGhShsDK1nmt
         0NeIDgAMnuxIdUPJr42kr5YSRr0lcG/cjYChc7CR69k0PDSPVB8SDPETvZ5OcAsQzXz8
         PwK92I5KP3xXW69VisICPpZQkz8Z8W3BGD8Q+O5CEfVS/wZeoGeunA8Tb2Jv7kg6h9pt
         v84yiwL3QUktRUwOKw531rE1jaJKafpJfWJaz74FtTISAY9MuLcto6sA9PueWSDf2AW2
         Uncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530423; x=1784135223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amf9A3ny0stjzBNYa5xxQpkuKUHxHwl/QGUYuXrMddg=;
        b=KtVbYbjzihnkfsgr6TNFXCyI1NwE5ZMQQ2vpygVsr98Vo9IDVRzAGXXjOO6JObfYlH
         8tRaM5xq4vT5BPiwSipPGqX+2zkcFCNN2mmrTmgootXkJ13aSYZf0u+7VbpjAybjrNnh
         bCLrrmHMhCj0Q3p0gHk6TRGX4TyOqN2eJXSDW4F2lUZAjrjz2msoXl4cFB5O50Nfouv0
         JcvpkyAQO/lxzxdXbc+beCcS5nfLbser8OBcLXGC4b1Bfsx8CajFgKczwLaBcU0BjeO6
         dQpK2K2+IzXA7pZlHryMN5oOLvZbR8+SZc/0C1GviLuYWXuQIeQAiPMaseurBnLS98H3
         qZjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQiDwr1xgYgKS3CSYHf1uO9DSjTeYpJcjbqwmX1v2fCL7R/m+MwFPfPjDrXTncGUzbp7t6YSMFLWMQuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqS2ZkP9ZNQCFHoJHtXJI0ZQP9KjRX4EYOHHUQ9stKFK0dmnIk
	w1YmXfm1m5aKYa85UJpqI3nmgxFmt9voULlZH5wrju4Ml+c+xyYMAYZC
X-Gm-Gg: AfdE7clfM6lZG8LMNVyqnfTc8OQYN0/OQ/iNvajheQTaYuftOYtCKWIYJrc68fT+HSQ
	conPlG1xqEH5YrG/7Nm2TBW41sDyWTO00yvGLsOTe/UiFLjoKy/6HBI3e6ZgiM6IzL/l88miZJs
	wGnwXxm5WZt2JBlrw+1+FiWa39nwt9/PZwa+clkTxx/D3mF+qVl8583uH5rzk9AsoVDTKJvD70p
	m2NuZzZBxAwuIkpnfGK1A81iT1+o7laSmsMkHZizP/bhdx3MTNnG5Rhq78N860msn5pSA3aY8gt
	0fTow09zSiJJba9XMXDDxnXjsL1lG0VMV+oIr96rC3yZJKMYer6JTD6vF4brWzkhiOvwxrzQ6jG
	E0wJGHz0WmDFGvI76Sfrjzw6yRswEvsuFak1fPNoFqRKxR12MNuiZ9xJnU5ILmf5wqkzr/mfJf5
	r+qjl2ROfedNFtiYr7vg==
X-Received: by 2002:a05:6a00:a15:b0:848:2f77:e2df with SMTP id d2e1a72fcca58-8484392f4a8mr3717327b3a.72.1783530422835;
        Wed, 08 Jul 2026 10:07:02 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm1119528b3a.22.2026.07.08.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:02 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH 0/3] mm/early_ioremap: clarify and clean up early_ioremap_reset()
Date: Thu,  9 Jul 2026 02:06:44 +0900
Message-ID: <20260708170647.362562-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100703_959693_E12745D6 
X-CRM114-Status: UNSURE (   8.85  )
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

__late_set_fixmap() and __late_clear_fixmap() are only used after
early_ioremap_reset() has been called, but the comment above them does
not say anything about that. So arm64, riscv and powerpc, whose
__set_fixmap() works before and after paging_init(), describe the same
situation in three different ways:

                 calls reset    defines the macros
        arm64    yes            yes
        riscv    no             yes
        powerpc  no             no

Patch 1 documents when early_ioremap_reset() needs to be called and
that only architectures calling it need to define the macros.

Patches 2 and 3 remove the unneeded riscv macros, which are
unreachable, and the arm64 reset call and macros, which change
nothing.

No functional change.

Sang-Heon Jeon (3):
  mm/early_ioremap: clarify early_ioremap_reset() semantics
  riscv: remove unused __late_set_fixmap() and __late_clear_fixmap()
  arm64: remove early_ioremap_reset() call and __late_* macros

 arch/arm64/include/asm/fixmap.h |  3 ---
 arch/arm64/kernel/setup.c       |  2 --
 arch/riscv/include/asm/fixmap.h |  3 ---
 mm/early_ioremap.c              | 10 +++++++---
 4 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
