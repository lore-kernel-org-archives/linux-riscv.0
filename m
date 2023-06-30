Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4973AEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vt9aJkWIl645UYOl+q9wrsdlDxhog3yKQPDbErabejk=; b=C7gonM0WW3/qn5
	GfGzRd4B9/xk9Ub8lOc/cA4Ivk09gUYPFxbOsb3Npq/9iVr3HxPifqbhhTvgDmMnlWSazbcCXjGBB
	cFVVvkXyhHHUrX9yFVama2dp69lmi5G8jNnMS/n6oDVcX5t0VxKOBrvXdIU+bqnj+G/cVluQIXJgd
	kjRTLICTzVFViE6NBmd6Ibh/wBa2Ny1F5F7byCC6wpclCAmWUsto8gtuSzWqROwlX3pXHdbiu0N6v
	TOinSiPItZRPiKehfPcYUdFyfoA/Wj4lQRoFkIDhXTQHFqqgG+Lepx0u/clGZpHzKvh4hrLecvx9H
	lgHXalYoUO0FIlI+xeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9Xc-003B2Y-1l;
	Fri, 30 Jun 2023 08:31:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9XZ-003B1F-0V
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:31:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31114b46d62so1809964f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688113899; x=1690705899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7xu9e/8zpZngb/8IehgWdJUCcpoeDVm3vpzs3Qy7mo=;
        b=H865ZtJHjbuc6MuFVYa6SgB+ccoXiHGJQIfADr+zwMK/j+TvVpF9r811O5KdXbAu5+
         8rnETbuyrAMsXoADgBZsmqyWAJr2v0SEQYshs1SJYhCXKgyoO6o3PJr4ldpS8G81FyDD
         5pJH5cSvZ1+TDWcK6vDQAbBn+F15tFvNuOhYAQrzT4I29Y6oNdLKn4cLGQ+ogAC/S4FO
         VTT6g+Rr36ezXTugl0LhtdCY68hxlgD8P8RQc//MOZj5goxL8G/fFJl97Hi8BBomykLL
         ifR/3V7HCfdYcA93pumIwoaa/E8SI7eQ7OroZqiDb/jdJyXWhiTW+FiT0P9QtP8R7EOe
         vpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113899; x=1690705899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7xu9e/8zpZngb/8IehgWdJUCcpoeDVm3vpzs3Qy7mo=;
        b=eJ4ZTWeKnxCJdP3Wy+0nLH2Ff9YuaGHGduHL5S5UP8bDDnqQ2EzwrRm782k+igaL7L
         MU9npBCsLFLb/rpYafz4BGjcojPWeQMdVbpGPuP9B9EblS39yvrYpmZTnjNRSZsCmAD6
         BA41xTDdG6FbHZMvynUrFsro99JOjfN1kANOdI8DNon77AcIab58NCl9A5n5FmBGYM3H
         hqGiatmni8ddwOF8MMIJDkTDI4nK3McR9fvWNr2c4KzPdEE92acPibLJr3v5LlWb3ZYg
         WwK5vde7V3jvI9GnpqFYQv9i1Pfrrmvh/lcAGKebyrAn94kRWNwShV09sSsVwPEYUpFB
         PErg==
X-Gm-Message-State: ABy/qLYZZ7y32FWTDJ74Rm0jNO5kOhgMKxJYDexQBUbIZn29lDiiK08F
	aRQSL7WNgBQMROVszPt5L6uoNA==
X-Google-Smtp-Source: APBJJlF2cVmZSXyEpZo5Wr+x3JPdjgQAG++Uz1dQG5lH+T/9n8SPtY5CQ+JHQXWfIJwLUbsOsOGQcg==
X-Received: by 2002:adf:f60c:0:b0:313:e741:1caa with SMTP id t12-20020adff60c000000b00313e7411caamr1823926wrp.25.1688113898731;
        Fri, 30 Jun 2023 01:31:38 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600004cf00b0030e52d4c1bcsm17976111wri.71.2023.06.30.01.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:31:38 -0700 (PDT)
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
Subject: [PATCH v3 00/10] riscv: Allow userspace to directly access perf counters
Date: Fri, 30 Jun 2023 10:30:03 +0200
Message-Id: <20230630083013.102334-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013141_288760_2B713BB1 
X-CRM114-Status: GOOD (  15.58  )
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

This version needs openSBI v1.3 *and* a fix that went upstream lately
(https://lore.kernel.org/lkml/20230616114831.3186980-1-maz@kernel.org/T/).

**Important**: In this version, the default mode is now user access, not
the legacy so some applications will break.

base-commit-tag: v6.4-rc6

Changes in v3:
v3:
- patch 1 now contains the ref to the faulty commit (no Fixes tag as it is only a comment), as Andrew suggested
- Removed RISCV_PMU_LEGACY_TIME from patch 3, as Andrew suggested
- Rename RISCV_PMU_PDEV_NAME to "riscv-pmu-sbi", patch4 is just cosmetic now, as Andrew suggested
- Removed a few useless (and wrong) comments, as Andrew suggested
- Simplify arch_perf_update_userpage code, as Andrew suggested
- Documentation now mentions that time CSR is *always* accessible, whatever the mode, as suggested by Andrew
- Removed CYCLEH reference and add TODO for rv32 support, as suggested by Atish
- Do not rename the pmu instance as Atish suggested
- Set pmc_width only if rdpmc is enabled and CONFIG_RISCV_PMU is set and the event is a hw event
- Move arch_perf_update_userpage https://lore.kernel.org/lkml/20230616114831.3186980-1-maz@kernel.org/T/
- **Switch to user mode access by default**

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
  drivers: perf: Rename riscv pmu sbi driver
  riscv: Prepare for user-space perf event mmap support
  drivers: perf: Implement perf event mmap support in the legacy backend
  drivers: perf: Implement perf event mmap support in the SBI backend
  Documentation: admin-guide: Add riscv sysctl_perf_user_access
  tools: lib: perf: Implement riscv mmap support
  perf: tests: Adapt mmap-basic.c for riscv

 Documentation/admin-guide/sysctl/kernel.rst |  26 ++-
 drivers/perf/riscv_pmu.c                    | 113 +++++++++++
 drivers/perf/riscv_pmu_legacy.c             |  28 ++-
 drivers/perf/riscv_pmu_sbi.c                | 196 +++++++++++++++++++-
 include/linux/perf/riscv_pmu.h              |  12 +-
 include/linux/perf_event.h                  |   3 +-
 tools/lib/perf/mmap.c                       |  65 +++++++
 tools/perf/tests/mmap-basic.c               |   4 +-
 8 files changed, 427 insertions(+), 20 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
