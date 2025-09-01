Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E830FCA1000
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=El0bmzYzM7vNB9uw1OuABU+Es2KayafFkdvyYYwKIRY=; b=JqW1FO7+sG+S6w
	jI400evo5Gd87Wg9Zb/SU6529QG7Q/b0MHS278VT0ps7B3d+jEvfvYBYu/j5Ku/2+DW4fARN8LHuK
	qGHFypysLbRXkYkpaq/ObMCXHuG55Gfu7dTaRa2guetpsp1L+syI087CVi02STlOQ6Vfqvi3LgqeD
	zE8V0CqWdShfURXCvSSXzjcMJEfaxZUIPbgYc9RdF8AXDu04OoWP79H/FqkJCwwBX2alzIzvKs0+D
	WbVsrfpRoFdK54ep1oKA5rOV/doYj/KrJRsKa6/wRSOy20aKBWQA69PvFsFkhT2Y0n76P34zXInrc
	5bYcGorYu6HDk40HORDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4ub-0000000CkIp-1MUY;
	Mon, 01 Sep 2025 13:49:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2v0-0000000C5gH-3uc9
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:41:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2489acda3bbso33763425ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726910; x=1757331710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UG+lvIiNfEGRGKGGi3uQF0nMgFjeuxKOjdv0x36fKk=;
        b=TJCYd+GHhiuglYv7JIv9zzHifooVestfQpTw03T43P8QyVNyLFGm3rNQ+DhieTgjVo
         +JQybxQ3PHaF2hLApNnqZxZDxa7oUfdyxQR8m3zuCerv8V36vXLbiRSKY6UG+2aGwaJo
         Imrkoh0t/bdjROKszKS8BnlKl+CHudcZadD1c6qZeZ8TVzBwqrmp4y2irjBXjPENPgOv
         1I8hY00gfJ8SnxVKMxQuMa/zs7FhY63fg/hN6q2odXKuBVF0EZiQWZqIY6FPlCSplcJK
         aSVeYwImKV2p9a8r5LlpTazag3sPaVRlNlqfenAWxigC0xsg1ASbm0ATXJ5JzkRgyVKH
         AefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726910; x=1757331710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UG+lvIiNfEGRGKGGi3uQF0nMgFjeuxKOjdv0x36fKk=;
        b=aPvhHaJm88UWc6vFuNHifR0Md9eygKL8GU5BFj1IfhCC2yFof5V+f0qbHi5GKxks5B
         peGhQ5uogtSMjHi0p4LuJ2eoYSLzlGUWfPBhkeMHQv48VHZ7kCE71h1iGz6HsLLC+pJc
         UvUR26tFOFYlkfo/ikJXIPejnNmYECZrSdREntntyzSjSWDNyXZ+z8QOnZBY4ChepIeh
         zTVp4VBsCUNlj4sWvCEQ/Z3RezdCwZj6w/PBY5r698DUqbJlnDEx0JRKxFUnl/l0okfk
         Fz3d5jUJy5pSHRpkEOvzF7Dl+HmNfN0WlbRMd+9btoHgRKzJ8V70doJg8ZB827Pb8jW4
         RKAA==
X-Gm-Message-State: AOJu0YyWhMhVyWBvNTc90HqzlLVn5wStzx/++UxBxgSHdDZSUClk4zc1
	shjQrG5DmaVQVdTHWE4NKXvD6ESUxAfmbF34H9TFFl6bD2ZtFQjZN9u9iLAoN7K0qp26iSy3doT
	9OaX9ICc=
X-Gm-Gg: ASbGncthrQLtONq2sDrKQmTuD/6obpTijAWC+GavGGPfJv8bpx82UH7QFlb9vaYyYiL
	iPtdH4PCWTkept39RDYf4x6y0SYxSjiq7Tey9mWaLApfN0gXQLG3wEMsJCdI6qPvKV6qxagiHIf
	/PyI5Y1FsBfbs+wmWrfW7FAG9/mvE7uLz3/nTg4dKotTstVEysYIvVTOS5GaJXRZqasznF2ucj1
	b0OUyAoom7/O9ESwotjS2jRaYIKUs7CwRRZSR2NGbAOMeSTR48+2qAsEjtN0cGbTtlgeldU+5Ci
	Ey33pxME1XQMBk9UVZHvlB7ZbFdsQfTlRu7g2QOuJ4pJXo+kA6mqgW1Hxa50yJsmaJ3yP3Lu3jr
	6IPt+hyuNj8Piku13I9obUVfyxL46YU74cK/4tLZHneZBU4ZSxr9TahX4UZsX04LlzweS7AhfEL
	aA+lhHvZZIqyhBkLQ8oobm9RugxGZDXGaTMkcK4Ln7kjQ=
X-Google-Smtp-Source: AGHT+IFq81D08oCFEiAMHWfG42pjL//afZ3n6oV63VBN6ou4vT7wjYbmjcFWINr8zZdT5opJWhPK7Q==
X-Received: by 2002:a17:902:f64a:b0:24a:9105:d020 with SMTP id d9443c01a7336-24a9105d719mr59364105ad.51.1756726909672;
        Mon, 01 Sep 2025 04:41:49 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e042asm103147055ad.146.2025.09.01.04.41.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:41:49 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND 0/2] riscv: mm: Some optimizations for tlb flush
Date: Mon,  1 Sep 2025 19:41:39 +0800
Message-Id: <20250901114141.5438-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044150_974207_4314A4AA 
X-CRM114-Status: UNSURE (   5.40  )
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

Some optimizations for tlb flush on RISC-V smp:
1. Apply Svinval in update_mmu_cache() to avoid flushing irrelevant tlb
entries.
2. Clear bit of current cpu in mm_cpumask after local_flush_tlb_all_asid()
to avoid potential IPIs in the future.

We saw the number of IPI reduced from ~98k to 268 on mmapstress01
benchmark.

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

Xu Lu (2):
  riscv: mm: Apply svinval in update_mmu_cache()
  riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid

 arch/riscv/include/asm/pgtable.h  | 16 +++++++-
 arch/riscv/include/asm/tlbflush.h | 23 +++++++++++
 arch/riscv/mm/tlbflush.c          | 64 ++++++++++++-------------------
 3 files changed, 63 insertions(+), 40 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
