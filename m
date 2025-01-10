Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76F6E7719D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=JyRIGO+9nQbGjZCux6ySvoKOhfB1F93QUcE99/JTcns=; b=Wpt
	Fy41PKUjo6sMwIMV71jQ8z0bYQaIjsvS/AtF8A5NDnKy/NPRgMm3jjZXjcwKSkKRGEyztmu2OJjaI
	uYlLGJuMf7S6KJV/GPTkXqXMhdAWBx5nI0NtVDuqhW8UavUpuCFZoWVdR8GBIvWhctjIO2jW8DDa5
	XQP5DqM4PGOpBKcMju8NZvUi/vTJhdu5kfBKLnJVPq7Y7w2lXDaOMaWuMNQDFTY5wtM1tIY8px+Nq
	Uq0rYcXVrINBflV0P1YF43WBecwUK9SFnf+SXBqlrkG2s4CgtLZ9M/zbgtJH63Pqjs8pdKA8R+F33
	620vsDB3frP2v2mc8c02tBLenpaEHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJPy-0000000GWFR-25Lp;
	Fri, 10 Jan 2025 18:07:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIRq-0000000GMq1-0KQx
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Jan 2025 17:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:To:From:CC:Subject:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2TZI7R8IwcASSgx2EM8hQdgd0Rs2nSdKY5Cqp9obKrg=; b=ZQDhsP2kbsIcGm3iYjr7AnolO8
	eX6agfN2lf4NeiAvtYRJsiooLm1CDYFkCkKg0DkruS6hMtOvPyZUIoFIGv8h+J1C/ICwfC8069qg8
	DAXEb1Ar0YAD8APw3pIiSFe+qMvV7ucP1kMWqKQ5jekyznE+s9X1/8vIiMkOviGXm8NgGc0dPcmDt
	/2d+3SitnuuNhfwXADMx8y4pFlP654qU1mbgg8mg0TRcMdgiAtFAbuYkZYss4LV232H0XFjkS4vhS
	RwJxz4mks4JXkuRCIsE1CVr7GF+f5vSLgChCzQYb6hRaAkD+OTLYglbrgo/5qXTGtlmcNh/2U0Ttx
	sQhA33gg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIRm-00000009qqD-2OZt
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 17:05:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2156e078563so34058965ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 09:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736528717; x=1737133517; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TZI7R8IwcASSgx2EM8hQdgd0Rs2nSdKY5Cqp9obKrg=;
        b=GlqsI61co5R4LiOXW4/nAVExO1IctjKaJrBZGIe1Iw0/pi3E9WaMUMfh4H2K2If3kj
         gvPOO/Qy6f/Py8supZSnxTKb2WDPn48bB+vK9uGNJUce4d2sfHF5g/pjC7FP+jAY+yVE
         1PEcibruhGNHEYFUeHloTIlI46e4M3BkAM5ZrHofi0lYeWSun34JWEleWxTNi0TQKZv6
         MXomINzM9/dxzIlT082u3kN5UTJ77coFye+xzrh5a1x91CSD1h9vbGbjqoUk1O/5D6f6
         wLPOaykq0CTIF5JFtMecPJ2z5NP9EYU1wHzYYFtQPk40qYv//VEf0xkSBA/zJoqQbtps
         8qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736528717; x=1737133517;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TZI7R8IwcASSgx2EM8hQdgd0Rs2nSdKY5Cqp9obKrg=;
        b=sozdaxne7iDF5mBTvFxo9v38MmReeoH8zxAQ2I0hBlrg8v/FFmyM+pOpC1xJBZ54LD
         BmJPT0/WChFLMKydDc+kn1qkGrqhdr2/tePxSXjx8zVkc2nSKCGLm6wdacNxgqf3qx4K
         bfM1sfLw4VVQ5DU0eQHY25PZ5eyOzu2MRgefcX7cydmLPvTGob7AI7PYE4ngit+k2CfI
         hyEpJCX0wv5HCSHSB0xh98bHZydJreWjnqT/zlXdbyW4qayE7QNCkJOY5Yz0dqdT5wsl
         hORL8YNnK4K6O6XHWAn0NA/PqtU7QlI2+yxGGXwVD0bQe14wbJdOSHB6na/QWe0iEXxh
         BYCg==
X-Gm-Message-State: AOJu0YzMw/f5qxb7SAdHIDGHCenZMR4SzdfxRexc0wjZIhWYhDOpDOW8
	9uCyp7K5kM0yzkviDlDwKdO8jagNhck7K3uzKX8QSlg7N/oq+mXVi7H/TLub+a3Lo1rcNgtDYvM
	E
X-Gm-Gg: ASbGncvIbfdBIUwSvBtYTgoEmmdJspgZR1g7XukTbHlBlf42NMWx0XpYPbFYLsDVXK6
	aXLf4RUgM4qEuwoDf1Lqvf/p5QrhpvvObjF+woeScGC/hOgflNBDLlD6qFaA3M7CP8PgE/lNJro
	DE7eXsaaGKgzC7PqaNiddaCLoknMXBUwGtIUQfr/rnLTD2eJzziuoC6yYz/bv77a//FI+E6J0+N
	Rrk0IFw6UNVBY32ZP4jUb7iIOctvSYkniCTPgFdda8Q7xDtISnv3W0=
X-Google-Smtp-Source: AGHT+IHw6qL9MG39n2SMNzr9XoTnraye/leq6PnDhu0gpTw4ruB09Lu+e5nI5Ag4cANYPJIPxrUiCg==
X-Received: by 2002:a17:902:fa90:b0:21a:8d70:385b with SMTP id d9443c01a7336-21a8d703bdamr76772995ad.6.1736528717161;
        Fri, 10 Jan 2025 09:05:17 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d134sm15783285ad.187.2025.01.10.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:05:16 -0800 (PST)
Date: Fri, 10 Jan 2025 09:05:16 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2025 09:05:11 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.13-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-80978f72-8f45-4e7f-9518-8b12e7fe8dd5@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_170522_976581_81F4C268 
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6206626104100583049=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6206626104100583049==
Content-Type: text/plain

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc7

for you to fetch changes up to 6f6ecce59d99ef95a31a137c51e61c3d7b4ab278:

  Merge patch series "SBI PMU event related fixes" (2025-01-09 09:37:12 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.13-rc7

* A handful of selftest fixes.
* A fix for a memory leak in relocation processing during module
  loading.
* A fix to avoid sleeping in die().
* A fix for kprobe intsruction slot address calculations.
* A fix for a DT node reference leak in SBI idle probing.
* A fix for to avoid initializing out of bounds pages on sparse vmemmap
  systems with a gap at the start of their physical memory map.
* A fix for backtracing through exceptions.
* _Q_PENDING_LOOPS is now defined whenever QUEUED_SPINLOCKS=y.
* Local labels in entry.S are now marked with ".L", which prevents them
  from trashing backtraces.
* A handful of fixes for SBI-based performance counters.

----------------------------------------------------------------
Atish Patra (3):
      drivers/perf: riscv: Fix Platform firmware event data
      drivers/perf: riscv: Return error for default case
      drivers/perf: riscv: Do not allow invalid raw event config

Charlie Jenkins (1):
      riscv: selftests: Fix warnings pointer masking test

Clément Léger (3):
      riscv: module: remove relocation_head rel_entry member allocation
      riscv: stacktrace: fix backtracing through exceptions
      riscv: use local label names instead of global ones in assembly

Guo Ren (1):
      riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition

Javier Carrasco (1):
      cpuidle: riscv-sbi: fix device node release in early exit of for_each_possible_cpu

Nam Cao (2):
      riscv: Fix sleeping in invalid context in die()
      riscv: kprobes: Fix incorrect address calculation

Palmer Dabbelt (2):
      Merge patch series "selftest: fix riscv/vector tests"
      Merge patch series "SBI PMU event related fixes"

Xu Lu (1):
      riscv: mm: Fix the out of bound issue of vmemmap address

Yong-Xuan Wang (2):
      tools: selftests: riscv: Add pass message for v_initval_nolibc
      tools: selftests: riscv: Add test count for vstate_prctl

 arch/riscv/include/asm/page.h                      |  1 +
 arch/riscv/include/asm/pgtable.h                   |  2 +-
 arch/riscv/include/asm/sbi.h                       |  1 +
 arch/riscv/include/asm/spinlock.h                  |  5 +++-
 arch/riscv/kernel/entry.S                          | 21 ++++++++--------
 arch/riscv/kernel/module.c                         | 18 ++++----------
 arch/riscv/kernel/probes/kprobes.c                 |  2 +-
 arch/riscv/kernel/stacktrace.c                     |  4 +++-
 arch/riscv/kernel/traps.c                          |  6 ++---
 arch/riscv/mm/init.c                               | 17 ++++++++++++-
 drivers/cpuidle/cpuidle-riscv-sbi.c                |  4 ++--
 drivers/perf/riscv_pmu_sbi.c                       | 22 +++++++++--------
 .../testing/selftests/riscv/abi/pointer_masking.c  | 28 +++++++++++++++++-----
 .../selftests/riscv/vector/v_initval_nolibc.c      |  4 ++++
 .../testing/selftests/riscv/vector/vstate_prctl.c  |  2 ++
 15 files changed, 87 insertions(+), 50 deletions(-)


--===============6206626104100583049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6206626104100583049==--
