Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E196EC61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z0h8c5KvkwHkYYfZ+ffp6HgBEIRiRAInYPSTIzc8WIg=; b=PwYKA6OhU2gzZy
	9nZA+bG+ppVIZqs9A1g+qjZ6aP5CLwBPpbCAbJ48rSN+W0EyQx9Dyg4xb0mWEZjwUsiyJwRmvihda
	wGiLFi6U8/oGg6bHaEgT2b9o4D2m+xzhgM7FbzrQPnnOZJZQFgyHCYmKSJx181oVQDgwtw5qpkDB/
	2Klt/aTFnu79Q5iAiGhTXswlWxZL4KjHSNvKSSspJ4EzqmDS1CaOwRNoODEIu3IjnBdWezIR9OmAh
	yRVxKdnlZdZPstNwYtyoYFAJf6vZatgJHArf4/XjnCuYmsrh6PUfxxPOsyv9H4SEqn0ziPFwDL9N0
	XnPDSyEJPYpa6usHP94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj3-000N8C-1Y;
	Wed, 22 Nov 2023 01:08:21 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj0-000N7P-2W
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:20 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so3754780fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615297; x=1701220097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5K3acMXD355Dnu5c/0LgKAwcyMlLGIb9WZpaCFq6NtI=;
        b=HYKQjb5L9sI9sAh7ZNwv+Tkqm5RFTR69VLak6w1psMtavV3aeLyVSJDgp/gwxOsMzm
         O2wPlC+Gl1qYkbpkStnVUbsR1S1zenvEX8qWbvboDF5ah0X5Zpw30SH3p4OhFkAWOeUh
         TcHzgG2zg7A2Lt1/2weIZDuAvpCEvj+BKZrl8UXVUioTkEbIVh/6Cwsk6LwmO6ScTa2c
         Z9wbdzLTdBNBphkuudyZqKu/g5VYwNpUe9xtfILZF5q4Yco93VY9OWI7J5L4qKEkvx3l
         q20dNNnCa+47eQL/6uj08Pq1jK8ur0ZSnDbjoI1SnLGgqTyWFCM3S54n5F/o01aGQXHO
         dgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615297; x=1701220097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K3acMXD355Dnu5c/0LgKAwcyMlLGIb9WZpaCFq6NtI=;
        b=gEc04g6voOGwvAq40iktrW10wv5nlxpJJxroRco2yMcGHYGDD+ipB5D4Iqv1q57azV
         yH7E1ZzTEFNV7eOCrF0p3PIJT5tXi62Ot2HnSTgb96a44kA17WsJMO2SnV2pDolTSyYk
         dnG6ROn3eWxwuhh/oprzqycHLcGxtLuP7kzu3M+4wGWncKpW8v3MhWAHhbEzSJiU2lmO
         nIYJbzp4GROYb2FJCxf1TObS2rJBLFRyOtphOiIpeoT+z0c3xlhSM3In09+De4il0PTP
         l9ItXUedOI46movaG7JjfZkI/9+uvWOnWlOrigqKbI3uZTUUxQBAOvY50ZZO+3aXJ0Cx
         tAug==
X-Gm-Message-State: AOJu0YxH+fqa9F0gUflvCX1nKwTtwSYi6d+8cDeqcVGjDkbjyyU/v1Vs
	oYOKocqGIpb3fCOV6ler27tUDg==
X-Google-Smtp-Source: AGHT+IH6/NUuwGldOP1aJCDWjPm+XWVk8E4Msjy4/jNiAvoh03MIiSiJCBFz4I47qP2HX2IfskLVbg==
X-Received: by 2002:a05:6870:816:b0:1f0:1c00:d860 with SMTP id fw22-20020a056870081600b001f01c00d860mr1172251oab.51.1700615297034;
        Tue, 21 Nov 2023 17:08:17 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:16 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 0/8] riscv: ASID-related and UP-related TLB flush enhancements
Date: Tue, 21 Nov 2023 17:07:11 -0800
Message-ID: <20231122010815.3545294-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170818_825021_3BA4721F 
X-CRM114-Status: UNSURE (   9.79  )
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

While reviewing Alexandre Ghiti's "riscv: tlb flush improvements"
series[1], I noticed that most TLB flush functions end up as a call to
local_flush_tlb_all() when SMP is disabled. This series resolves that.
Along the way, I realized that we should be using single-ASID flushes
wherever possible, so I implemented that as well.

[1]: https://lore.kernel.org/linux-riscv/20231030133027.19542-1-alexghiti@rivosinc.com/

Changes in v3:
 - Fixed a performance regression caused by executing sfence.vma in a
   loop on implementations affected by SiFive CIP-1200
 - Rebased on v6.7-rc1

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

Samuel Holland (8):
  riscv: mm: Combine the SMP and UP TLB flush code
  riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
  riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
  riscv: mm: Introduce cntx2asid/cntx2version helper macros
  riscv: mm: Use a fixed layout for the MM context ID
  riscv: mm: Make asid_bits a local variable
  riscv: mm: Preserve global TLB entries when switching contexts
  riscv: mm: Always use ASID to flush MM contexts

 arch/riscv/errata/sifive/errata.c    |  3 ++
 arch/riscv/include/asm/errata_list.h | 12 ++++++-
 arch/riscv/include/asm/mmu.h         |  3 ++
 arch/riscv/include/asm/mmu_context.h |  2 --
 arch/riscv/include/asm/tlbflush.h    | 54 ++++++++++++++--------------
 arch/riscv/mm/Makefile               |  5 +--
 arch/riscv/mm/context.c              | 26 ++++++--------
 arch/riscv/mm/tlbflush.c             | 41 ++++++++-------------
 8 files changed, 70 insertions(+), 76 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
