Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A71DC77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hY0Z3YzxSqtQ49Ur3u4ZjmDLTaydohi8Sg1ejZQI1A0=; b=WNW8CSwNH0xgQH
	9bl/usne4KliiAEhEEId5u+7dV4JJ+EMDlDdi99SmT123Uw6TNrecGUp9yfBKVWoOo2h/NOmRVNiY
	ym5jV/KbNet+etZ4QPwAfIPKn4R7ZnZBxiEisS2/D/dzNfPB2OeKgkNL0+EXj01cd/85dG2RYA4AB
	YkGUtfAuqqQs24jEqTEg13k6ZYg/iJk+Y8k2DM7Cx+KAhH7ZkZ6lBcdZUxnhA/9fUdjcLVVaVbayE
	YTM4cUjWKHSbk6oQ30u1F5Qd9BDRBp23M0TKQITKZTSlZ7mKvprHeVbvYEFsuDXM9JmQVhEKbzBMo
	EyOEUuL/CjUSxi8RCIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzdh-006dE6-1K;
	Thu, 13 Apr 2023 16:17:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzdc-006dBC-2c
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 16:17:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id bi22-20020a05600c3d9600b003f0ad935166so927038wmb.4
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402650; x=1683994650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38Yb3K2X39JYdroVCYnZn1iH0zsgOPm1opWg6u9OrnA=;
        b=FYMc15O2+ikuHwDZXewujBymuKjb0wLG3G9POi/bxOvkCAVqfUklYRLX0godmEWGyl
         Mb0djbmpWZ0hLSRiWdLcrBCLV45eQOqDXCa0Nc2vK5NzWC60U92C3lcWGqlYAXV/KtCQ
         rCqtnkk3YhyRaaoUwTApDJTHO7XmmgvmhppYk+Dlp8WGbqjPYJPws+iIgqZTOLr5qqxA
         ICXBCUnEN9BY+gBFYb06nnH6hPPOnmzEqivs0CbguiSY4J1A6j5dGec27xGTfZ2nKqbp
         76aOt1t7EtPrYCm14ndD5tk1sxdtnsLnaaLtQ2NHqC8XWn1I6tX1sRe0BuacrDD9WZRx
         hJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402650; x=1683994650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38Yb3K2X39JYdroVCYnZn1iH0zsgOPm1opWg6u9OrnA=;
        b=TXqdME0+HIatJbw5m+BEEeWWGcRn19AuG+du/R5zuPhNe4FG8fjDqwVwNkwAdhtzPU
         RxJsoUKBAo3Cl5e1tQw8wGUR5T7aIQx1TL8jHRB9RDanMgsZiyS/nvVYsoD3kykFiqoL
         lPq/XQzh25aoNYg7CjVQ5Ux7Skhlzb9RO+7S5hHUaw1yIyHIqUm1LRqI33+M8LrGMIqn
         quqKRYZUM+6Nf0QJC3HjW0rplgBUcUQviNR0RPGJBfIlygsRP2hj78oqiZENRr7UgXG6
         L+/X/ofMzUwvl0rUsru2gXLzwY6B1RSTTByyir3wYUkMWTfYy5nT5Pir1LqiKve6j7X5
         KCfQ==
X-Gm-Message-State: AAQBX9c2IgDOQJrJIf/srBvdQoERHFO86ZvjymxfL5G/6/HVK5hjzaMu
	oLsu8r43lUGxYWrChxNRnz2VAA==
X-Google-Smtp-Source: AKy350bmCsEok/fFa5YgX7ncV0/zToqAzAd+sbPw5hmVDKRgBIpNP0624v+FkMa0rAlXJlrVKb571A==
X-Received: by 2002:a1c:6a14:0:b0:3f0:7db5:607a with SMTP id f20-20020a1c6a14000000b003f07db5607amr2179470wmc.33.1681402650384;
        Thu, 13 Apr 2023 09:17:30 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b003f092f0e0a0sm9350624wmo.3.2023.04.13.09.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:17:30 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
Date: Thu, 13 Apr 2023 18:17:21 +0200
Message-Id: <20230413161725.195417-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_091733_038743_D4ECB736 
X-CRM114-Status: UNSURE (   9.27  )
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

riscv used to allow direct access to cycle/time/instret counters,
bypassing the perf framework, this patchset intends to allow the user to
mmap any counter when accessed through perf. But we can't break the
existing behaviour so we introduce a sysctl perf_user_access like arm64
does, which defaults to the legacy mode described above.

The core of this patchset lies in patch 4, the first 3 patches are
simple fixes.

base-commit-tag: v6.3-rc1

Alexandre Ghiti (4):
  perf: Fix wrong comment about default event_idx
  include: riscv: Fix wrong include guard in riscv_pmu.h
  riscv: Make legacy counter enum match the HW numbering
  riscv: Enable perf counters user access only through perf

 Documentation/admin-guide/sysctl/kernel.rst |  23 +++-
 arch/riscv/include/asm/perf_event.h         |   3 +
 arch/riscv/kernel/Makefile                  |   2 +-
 arch/riscv/kernel/perf_event.c              |  65 +++++++++++
 drivers/perf/riscv_pmu.c                    |  42 ++++++++
 drivers/perf/riscv_pmu_legacy.c             |  24 ++++-
 drivers/perf/riscv_pmu_sbi.c                | 113 ++++++++++++++++++--
 include/linux/perf/riscv_pmu.h              |   9 +-
 include/linux/perf_event.h                  |   3 +-
 tools/lib/perf/mmap.c                       |  65 +++++++++++
 10 files changed, 332 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
