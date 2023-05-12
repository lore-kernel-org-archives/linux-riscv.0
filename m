Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885DDC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mSxnKBay3XnXv+o9xPyTUTw9c4nfYMneq25awQfp+JE=; b=EDiuMRPVYzv1Cd
	OG2Q1g7Vdw8g88Q5uTgwdix5jhG0zCbU8OBBurPf8EbuvPtkXlpyhhtWCIuAxfCl+90JPLUARJI3w
	EWpPFEwKwb+QxaYetC1TtDe/lRuDclTHYPByQj+B1Vb0YalKHWOHoiqvacZcnbIGAHM2kXvyzYcg4
	xfoL+HuMz1r+9o8OiXtne9c5FiEGfzL0ul/tcMVJmagyzaEaJUqOW9xnG7L/jwHqrVjGR47DOusoT
	ygfJnN8zwzEPTTghxjbHp/whi53oDrAavgAEKX1pMWI/EmZqK6wFQi6b81VweD4qxGAho8IS+vnsG
	2a+O9OFi8s+aYYnWLl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOXG-00BNoQ-0Y;
	Fri, 12 May 2023 08:53:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOXD-00BNn8-24
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:53:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f315712406so313069075e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881632; x=1686473632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUKnEzldAU5lVuG/jDXiwAN3hvqenQj1jlly6nl0Ii8=;
        b=MSFrF7b5hiO1ul3GJrXQGuAvBJZJjaxiZFm1B1nXYPy8Es1boj6Hg/UQTy0zngEWOf
         Hb6LMVmocFr2ebzFjeyGNAcGUgjlX/5LylebVGWKHj7CQcp6H32YRmIgUls62+6VFvdj
         0u/qcXaZ4FxgdRpeFM9PDSawxPeUenA5ZbKsI5axxJdnK4G023jROUWI6yJPz5r66sVd
         uUVQBgdQTf7bQHZRM1233MUCbAqwD8tnKjFwWiYXwEXLXTaIkPMARsPAOkXrBxWv29U9
         lBW8XXEZBgeJEMZFp341SW2ij8IB5Ln5tZwk1SsXjMSALbX1Ie4lPdLt5RX4d6UD9/84
         d9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881632; x=1686473632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUKnEzldAU5lVuG/jDXiwAN3hvqenQj1jlly6nl0Ii8=;
        b=gf9fZf0br1eSGZAIr299zSkQH/4XGCwz5cZSTKHV0PCi7UkivzpsfoyxasnJEGi1VK
         LVfRrgWwD0a3aftkdHMvp5khf0bSO8pq0MLzJKx6O7QAh8syPN82ZpnLgfQKGQv82llm
         rkId+azIX/nD4s07R2KV/2znnQCzkgZxevTaYxqv5ilzOw6po8Uk/IZf8arDlSv1PTV+
         fkhpJUdOWSXKALrty1tSf54EFPqs6IQBiy+L7mKwrSsgBdZqyfmFVy660vbgeGKSKmxL
         wrCJFCkFPLaseNIbb5wbKtme8s953kdNTVDpcFtyDA3V/+cjQB4dNe8B8YnZCoeny9yl
         61Eg==
X-Gm-Message-State: AC+VfDyzbFJhY5j3NvMjt/9NcAGnuWg8JktwbEY9JhG9TXaHd6d8LhyO
	D2XdLSoZ394yDx0OeKV0k+Q1rw==
X-Google-Smtp-Source: ACHHUZ6W5V7VU85NsIxu7FyCdJpo6FpNmv3LzOAktwEO7Ge0/BrFJAB/8b/RIFvFh0YGBU1HKaD2lw==
X-Received: by 2002:adf:e904:0:b0:306:2d81:341d with SMTP id f4-20020adfe904000000b003062d81341dmr21035750wrm.24.1683881632684;
        Fri, 12 May 2023 01:53:52 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c214d00b003f42461ac75sm15015618wml.12.2023.05.12.01.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:53:52 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 00/10] riscv: Allow userspace to directly access perf counters
Date: Fri, 12 May 2023 10:53:11 +0200
Message-Id: <20230512085321.13259-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015355_697005_C04CD5FA 
X-CRM114-Status: GOOD (  12.52  )
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

riscv used to allow direct access to cycle/time/instret counters,
bypassing the perf framework, this patchset intends to allow the user to
mmap any counter when accessed through perf. But we can't break the
existing behaviour so we introduce a sysctl perf_user_access like arm64
does, which defaults to the legacy mode described above.

*Note* that there are still ongoing discussions around which mode should
be the default mode with distro people.

base-commit-tag: v6.3

Changes in v2:
- Split into smaller patches, way better!
- Add RB from Conor
- Simplify the way we checked riscv architecture
- Fix race mmap and other thread running on other cpus
- Use hwc when available
- Set all userspace access flags in event_init, too cumbersome to handle sysctl changes
- Fix arch_perf_update_userpage for pmu other than riscv-pmu by renaming pmu driver
- Fixed kernel test robot build error
- Fixed documentation (Andrew and Bagas)
- perf testsuite passes mmap tests in all 3 modes

Alexandre Ghiti (10):
  perf: Fix wrong comment about default event_idx
  include: riscv: Fix wrong include guard in riscv_pmu.h
  riscv: Make legacy counter enum match the HW numbering
  drivers: perf: Rename riscv pmu driver
  riscv: Prepare for user-space perf event mmap support
  drivers: perf: Implement perf event mmap support in the legacy backend
  drivers: perf: Implement perf event mmap support in the SBI backend
  Documentation: admin-guide: Add riscv sysctl_perf_user_access
  tools: lib: perf: Implement riscv mmap support
  perf: tests: Adapt mmap-basic.c for riscv

 Documentation/admin-guide/sysctl/kernel.rst |  24 ++-
 arch/riscv/kernel/Makefile                  |   2 +-
 arch/riscv/kernel/perf_event.c              |  74 ++++++++
 drivers/perf/riscv_pmu.c                    |  41 ++++
 drivers/perf/riscv_pmu_legacy.c             |  37 +++-
 drivers/perf/riscv_pmu_sbi.c                | 196 +++++++++++++++++++-
 include/linux/perf/riscv_pmu.h              |  10 +-
 include/linux/perf_event.h                  |   3 +-
 tools/lib/perf/mmap.c                       |  65 +++++++
 tools/perf/tests/mmap-basic.c               |   4 +-
 10 files changed, 435 insertions(+), 21 deletions(-)
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
