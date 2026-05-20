Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ED5CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8pKrRLTdJmZiY2eH6Ern5qAGUUgrxth+lazwtOUr0U=; b=oGjlVSe7ECePxq
	K730DQib6qckU+UfniIvOnDFm55uvUkwT+BiRf1M4+JiPfwiPiVbEX1fHfNKsYVLUGXNXbz6Fh356
	BBCZj5fdYwwOw78q+itDG/XEUCFYhK0KhlCbvByGzjLcdBIywJruxrBzLPQDgtOEFmw7ibgXiZOjm
	lJnfXN6eDOQiSkExHsYoMOBz52FRAJi3oTmqIM133s6+kK9ApoHRvhqKLr+yjoFxvXhrLJKSI1YT2
	Ct3tGk+8ZBbdHyRtHwm4X6Ycd/9xuzp74YwRGHMTLjWSNlRfFjYbq4GfpSEa9FRIgKV3GQ7HET6Rv
	MqRhDHVezCTs1Gye9CNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDX-00000004aSs-4C5Y;
	Wed, 20 May 2026 12:40:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgDV-00000004aRn-1F70
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 12:40:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso24653295e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779280803; x=1779885603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuH6Fo8n73X094Nx+BXIM9AYUCXKRRgGdAspq57tSsc=;
        b=RpBeXLFmYX2iEgY79A21RulRNThEtqz8TngX1xlmEaBSKk6Ue2UTQ647ZzYGuQxfcj
         luB80P3ByZC2adsq1lekcY00DrwggctUCkrRaJ6DzDrMd8s5VCsAIjULPzdBkec4po1H
         2gh+vLshKnttw+JAEfmkvqNk+hN8EZ+n3YqibGhnJJgKoSHN5hcQSE1CGXTz9zPS13WW
         khsRtF2LnHqq6Am9fzL63eC9PkR6lajffzCfhe/6X3lsOLP6M9eGKlGdf6qj62Mb3KeX
         CCeCgwVGK+PWEkrjwkolY9DrkvHm+Zz68TbvrJRTk3Gix6g4r0dAAVnUOmz6MHGs54W/
         DmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280803; x=1779885603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuH6Fo8n73X094Nx+BXIM9AYUCXKRRgGdAspq57tSsc=;
        b=AoYIzmJ5puOslvMFS4NZlq+GUH7AKahMtohhTynPgH80vQ/ImyEYo42pZdU8FllkCp
         X+k3Nc6NhP0tdwM7qU3ZWo01vFv/IfNvYxUKC/05IHdiUP5QrrRst+TDtG4QBBOGlkFL
         G58EWxKF/vz5GK03AJXluKBttT/XxzZ+d2pZ+0VYYFpnp1PxfH4i/oIZXW+VzvipHtK+
         AVwP0vHWDoxUHHtGNE0gk3Gmjzi4HAZtTYYFbjpZHjdskaxb9vl7Tifpz7jA9LKV/60Y
         5XD3UaScp2lOKL84h6uDnUVfHNGm73bmkK7UNZ0CRa4lETzrUoG+oBA3GmYdeW5Rr+9t
         XcbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AqoZoG40/kaSHmAWEyrTs+dL4X0CF5kdoO8+MVYdyoQJQBmhEYcO3AaZnlGwqA53Y7KEpcnsz9lLSIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7N6jPnvLgGfCKnU03He8gnsJY7h+Or+KEfwspMByG90NdUnOM
	9d2npsxwpA0GksT2FNF44iNNwh8K+Wk9OSgbgjOytJ6D3rv7C2QC4Sc5
X-Gm-Gg: Acq92OFCli/aJG/+E6zpxQo+R1D2hLFtuhbL1rWRjo31M2PFHXh4oVaTKAJGmm1waTQ
	+qihrKx/cZMxao9dVZFAIIO+92zeqKvQy/6Xv2FHLzwCn5SJ/qWveOZVIRW1dUe6ryRKeGAyZmt
	wmfhMhgCFYfgD6b82+0QS1DpKoKlmKuLS5m3iO6SpoAXT++bLabZvAtG+37kVlJa1i7hyVUmYsy
	neP44AXqhTdbkX+46orOI3aI/tB1sek7MD/I5HTxgGKBdiuC+borFO8EROCCd7wIdOXU9o8L5KM
	0+2/Nxn9m9OejEbXskWLzpXvOIw/pJK07SqIfxE8/gTRrvhikj0MG7EyPZTSlrmvginWeDA8XOe
	9kvnRpwVVl2lH0gwd5x2wsVtRxMzaiQvz27K0vSY5mKObmgSTvRduL+zX/pjsC1Vb7o3/J6AkE2
	PSIJO0Y5QjIQVpghxfg6HVcdMv2Y9cstsiENx9WQCkEg==
X-Received: by 2002:a05:600c:1d0d:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-48fe632343dmr344264205e9.19.1779280803275;
        Wed, 20 May 2026 05:40:03 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm54460252f8f.12.2026.05.20.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:40:02 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kees@kernel.org
Cc: alex@ghiti.fr,
	andy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <milant2002@gmail.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v6 0/2] riscv: lib: add optimized memcmp() and extend KUnit tests
Date: Wed, 20 May 2026 14:39:52 +0200
Message-ID: <20260520123954.379630-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_054005_353224_EDF05B3A 
X-CRM114-Status: GOOD (  10.16  )
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

This v6 series provides an optimized RISC-V memcmp() implementation 
along with extended KUnit tests for functional verification and 
benchmarking

The memcmp() implementation now uses word-aligned loads for the generic 
path and leverages Zbb for fast sign resolution on supported hardware. 
A robust fallback to byte-by-byte comparison is implemented for non-Zbb 
systems to ensure correctness and stability across different toolchains 
and hardware revisions.

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

---
v6 changes:
    - Fixed build errors kernel test robot noticed. 
    - Link to v5: https://lore.kernel.org/all/20260519140029.1190381-1-milant2002@gmail.com/
    
v5 changes:
    - Removed redundant warm-up from test case
    - Optimized generic memcmp path with word-aligned loads.
    - Implemented non-ZBB fallback to byte comparison per review.
    - Link to v4: https://lore.kernel.org/all/20260518131407.1026049-2-milant2002@gmail.com/

v4 changes:
    - Fixed build error: call to undeclared function 'STRING_BENCH'
    - Link to v3: https://lore.kernel.org/all/20260515141019.1234037-1-milant2002@gmail.com/

v3 changes:
    - Split memcmp benchmark into wrapper (string_bench_memcmp) and worker
      function (do_string_bench_memcmp).
    - Removed all C99 mixed declarations; moved all variable declarations
      to the top of each function.
    - Converted len, iterations and loop counters in the benchmark to u64
      to avoid implicit casts.
    - Cleaned up spacing, indentation and minor style issues.
    - Added #if defined(CONFIG_RISCV_ISA_ZBB)... in  memcmp.S
    - Link to v2: https://lore.kernel.org/all/20260514121359.931999-1-milant2002@gmail.com/

v2 changes:
    - Added alignment checks for buffers to avoid expensive misaligned loads.
    - Optimized the loop using end-pointers to reduce per-iteration overhead.
    - Implemented word-aligned tail handling using ZBB shifts.
    - Removed redundant pointer equality (a0 == a1) check.
    - Retained BE support via #ifndef; ZBB rev8 is used for the LE fast-path.
    - Fixed KUnit build failures for Clang and non-benchmark configs.
    - Link to v1: https://lore.kernel.org/all/20260512141007.1193033-1-milant2002@gmail.com/

Milan Tripkovic (2):
  riscv: lib: add memcmp() implementation
  lib/string_kunit: extend benchmarks and unit test to memcmp()

 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 107 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        | 106 +++++++++++++++++++++++++++++++
 5 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
