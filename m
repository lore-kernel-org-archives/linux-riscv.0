Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBEC5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VNpOpQJTkXiQM20BnBGvAkTyeZ4MI+Vb8inzZ2D9hmU=; b=FsAX9pRa5pWNS0
	1VlgM1ZxAcVXvw4SjdFVwgkr6CJv8AhQ6WvEzx2gdKkFoOve1qQKjbmFp9Jki7exyQI0cmj8ooVv2
	HEE668hJ/kWL92kRDFecwrTEZn4tqwcod8d2n+SgnCrvlbkWWZlOjm6qjT9MQtxM6mv568/3gvBAI
	0rtV9kjmIvoEjOrTgUQEAHBMbXRF8q+R5NKiD3RedPjn+4QvUc6ufMMxh6iE1ETQ6yLsFjWZcR4O8
	/azIUKjLrGSi354W6kOSmQcCadoY9eWH4f98ccGIIoT+KQJB2hi+W8LYDfndn+aFIwLWDQ2HfLled
	S6faEmB2kHhKa/bC07mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyz8-0000000H590-41RY;
	Fri, 01 Mar 2024 09:15:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyz4-0000000H54U-3Jyx
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:15:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-412cb1564b8so69675e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709284512; x=1709889312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yprVHevcC7ppzCMdOTaT3VuCvD5AQnHTkhMmW9/Yos8=;
        b=XAaao3i5ojjx6RUuUu5N6zX5ZYoZibYubkbXuF2XLlUrMvI3ODJc7E65ZABV3khYnA
         ZBFYyxPedOnQcazLBNmj62TFEN6eunI3/J5CgplEW88MQzmfVjow6TV86H+OZd1h6ByT
         E8fKyBmnh19fd4wAcQbo3u20cHPA4VTZYisP+6AlYyPDeQBOcaKXsDZnQVp/49qIL+6Q
         hh6isWzlRf+/uXwAhdcdjY7KXc1jidh+Bnya5fVYjyUHGFmMZhI9yIayDa/4LG0mx9Pp
         RyU+0KcK/8UKdY5nwPBA97qXv3ItJOcLhKOi3eU+ENqdvI81y3YXkS0wBWuWGZKoIshT
         /5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284512; x=1709889312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yprVHevcC7ppzCMdOTaT3VuCvD5AQnHTkhMmW9/Yos8=;
        b=CHweZvHwQn+d9QgleG/sVPjoKYbirKAheLNFheksb3lqrZokOE4z2AOQNf2isijzCn
         vsjDojlCY91L3NcX2IlTzhPg6J5FTPx7vnOa3rHijkpW9cSmsyOhVMe2nTy1H8nCmotQ
         /eBgxJWctcDJACM3yIBWKmzMp45y952S9cfZzvMkrZXJByHxtoDuOw9TClp1ZWrua3XO
         ACxOVCEuAMELvpUWCd8jEsFrkzLhB68Axtb6nH6rkZh85/2hgpjUpUaF9PIRtlEQpwTT
         y2HJL69aKqdHoh65Oko1jpdB7gtqR8W+nxkuZF+rkGqcFesTXxibGqp7gJrglfOht+Gz
         2hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3fg8S/mRRa/jvc4oTmDcTG1qwGV/i8HSe1uR7mpc8BXXyVaw+/OPd5ooveMJ1WhnWWkOn3Llh14O+cmsP5/3DMuWeVRuRMdjxgvYNVPQ5
X-Gm-Message-State: AOJu0YxN1KA0C8D98RsGvljMRkfu63V4dmzkaxByNREHjOC+5BBa3fS4
	unl5+H640rA9HciClGasbrXtl82WwAvARSH2kQ6b0kkU+lIpCVwq3sYRTlQmaFA=
X-Google-Smtp-Source: AGHT+IHOEB7Wl0w/DP1jjp+wZ9IsZZPSGTyde6CCE7SA3irG+PXIOR/BUSU4UaYePPTrZ+YxqlSQWA==
X-Received: by 2002:a5d:5284:0:b0:33e:d27:2e40 with SMTP id c4-20020a5d5284000000b0033e0d272e40mr820688wrv.11.1709284512017;
        Fri, 01 Mar 2024 01:15:12 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d5503000000b0033dabeacab2sm4022712wrv.39.2024.03.01.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:15:11 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Fri,  1 Mar 2024 10:14:46 +0100
Message-Id: <20240301091455.246686-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_011514_865708_A3C49751 
X-CRM114-Status: GOOD (  13.48  )
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

This patchset intends to merge the contiguous ptes hugetlbfs implementation
of arm64 and riscv.

Both arm64 and riscv support the use of contiguous ptes to map pages that
are larger than the default page table size, respectively called contpte
and svnapot.

The riscv implementation differs from the arm64's in that the LSBs of the
pfn of a svnapot pte are used to store the size of the mapping, allowing
for future sizes to be added (for now only 64KB is supported). That's an
issue for the core mm code which expects to find the *real* pfn a pte points
to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
and restores the size of the mapping when it is written to a page table.

The following patches are just merges of the 2 different implementations
that currently exist in arm64 and riscv which are very similar. It paves
the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
reimplementing the same in riscv.

This patchset was tested by running the libhugetlbfs testsuite with 64KB
and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).

[1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/

Alexandre Ghiti (9):
  riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
  riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
  mm: Use common huge_ptep_get() function for riscv/arm64
  mm: Use common set_huge_pte_at() function for riscv/arm64
  mm: Use common huge_pte_clear() function for riscv/arm64
  mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
  mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
  mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
  mm: Use common huge_ptep_clear_flush() function for riscv/arm64

 arch/arm64/Kconfig                  |   1 +
 arch/arm64/include/asm/pgtable.h    |  59 +++++-
 arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/hugetlb.h    |   2 +-
 arch/riscv/include/asm/pgtable-64.h |  11 ++
 arch/riscv/include/asm/pgtable.h    | 120 +++++++++++-
 arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
 mm/Kconfig                          |   3 +
 mm/Makefile                         |   1 +
 mm/contpte.c                        | 268 +++++++++++++++++++++++++
 11 files changed, 456 insertions(+), 528 deletions(-)
 create mode 100644 mm/contpte.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
