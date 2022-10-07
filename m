Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75939C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b0iUCEHTr5uD25PKIg+vbojr5eOaEAKtYac7ipKM+YI=; b=JIWyGsbRiRQvx1
	e4wiJMTq3hJsMvS4RFW7F7lou8XCf3Gv+Xi/kX0DpcLm0RAJ/uudyZ4NLn8YdBm0DoITjkn8bp9mm
	bFnTd8V0ZRoHMRKMesQGnoSHudO+wC1rDBArmSY2KKeNRw1wiTDhvZl68Ex5WY8F6NdKKqd6Qewt9
	JDhzkIiIRoSL093DNisVaA6sWbrWQysb499RYorDZmrHocal9mnrgQjBzJYdz9iMrYZwG9vCnD6XM
	fsOHolNq3xWUhyb6pJAfwzSTxGY0+YDkHfC6RcJZX/bmCT0PxxhdsDb44mA381JJOKx4Ea/dC+RPI
	I2XTEDfZ4St+PNkXBFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogrS8-009wjj-6Y; Fri, 07 Oct 2022 17:48:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogrS4-009wiZ-U8
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 17:48:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id p14so1190334pfq.5
        for <linux-riscv@lists.infradead.org>; Fri, 07 Oct 2022 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcci2pupu9UurkJQkRA8mm21LocCWexyJenAk7+j02c=;
        b=JBaA3MUxHIauaERF+xT/NXVKefe2nI5Rs5pahUR+KKkSu/ximGTDyQa3CWCyEwR3LK
         aLJxtuFehllLGRa+RLC+bANZRd4zc5cmfHdl2NWKs3FE1/P2S9OjYQCrPO24tGnUKL7d
         tDlaHjZ6G70mgkKQnri+vaoLMAOfLTPoTOPGHo0ZnNmtcDijbEZmqaOqZsFWlFoxeIzM
         6NGZNegTPS/cHr3C1Kutpuke6AvKX4tc5IYExuqH0S2TwNNmrzJzf5sWRTnF7HetplX+
         lS6GKq1Fthn/AQqsEVzXde7WWcqszyKfNs1jh0l3KO9kCjYgJTCj6nMOaCZc/CQkHWdp
         cQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcci2pupu9UurkJQkRA8mm21LocCWexyJenAk7+j02c=;
        b=PeHsxx6AljpH04qh4wihXEmtzqobZ5dhHd3jYbwa5QNJQyVsxyAqTKvve+++1FiYuy
         +O7cN/XevKPmTl/EmyFGy0KE94sSTrqbaIL0f/qTfejFUYMH1eESg6DUQ9p9TuAG0zRA
         K88fmSnYz9czGvGa+2h6dfMBWuxPu+IXL3Wab9ktIhXjs3DZ0suZxaY4SHrDVL5yaL68
         16gyGJQfekaAb0qfbYtsH8nLvWSE/aRgpl05H5w9T6zyNVdP3LsBBpoMzfAF+PqbJaS5
         WxL4Zc9Hn0Ng6cgqQQ3kxGppJ+8ZMGfWW2n8zC0JDICIeiFu5dTjoZz+dXSYqKur1e/g
         GvfA==
X-Gm-Message-State: ACrzQf34asv9Icl6jM3ssAv/uRJ4z6OleQCJBeja+nnsFqL8UaVjYPyD
	Ijijbw3Uyc5BBB8siP0OvDZ9ZYmre18juw==
X-Google-Smtp-Source: AMsMyM7aAF88sHZdlMks90qeAjzp+bL0loKjCg1pJNWkvU4lQiJVetrYk08jOW3Kn1td4kBT6515Pg==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id c6-20020a056a000ac600b00530319748b6mr6538447pfl.80.1665164877695;
        Fri, 07 Oct 2022 10:47:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b0017fe9b038fdsm1700718plc.14.2022.10.07.10.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 10:47:57 -0700 (PDT)
Date: Fri, 07 Oct 2022 10:47:57 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Oct 2022 10:43:57 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.1 Merge Window, Part 1
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-6190fb79-f9f6-41bd-90f3-d4d6009d41a5@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_104801_197974_543D1095 
X-CRM114-Status: GOOD (  14.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw1

for you to fetch changes up to 87f81e66e2e84c7e6056413703d732a99c20c09b:

  riscv: enable THP_SWAP for RV64 (2022-10-06 20:03:48 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.1 Merge Window, Part 1

* Improvements to the CPU topology subsystem, which fix some issues
  where RISC-V would report bad topology information.
* The default NR_CPUS has increased to XLEN, and the maximum
  configurable value is 512.
* The CD-ROM filesystems have been enabled in the defconfig.
* Support for THP_SWAP has been added for rv64 systems.

There are also a handful of cleanups and fixes throughout the tree.

----------------------------------------------------------------
I will almost certainly have a part 2 for next week, but I'm not sure how big
it will be: between the conferences and COVID things have been a mess on my
end, that's clearly made this first week pretty small but it's also meant a lot
of stuff on the lists still needs work.  There's also some stuff that's pending
on conflicts, though, so I figured it'd be best to just send this today to make
handling those easier.

I'm still seeing some of these KASAN/pcpu_alloc related panics, but it doesn't
seem like they're more common with these than they are on 6.0 so I think it's
OK to just call these safe.  Aside from that things seem fine with this merged
into master from this morning.

----------------------------------------------------------------
Anup Patel (2):
      cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
      RISC-V: Increase range and default value of NR_CPUS

Conor Dooley (2):
      arm64: topology: move store_cpu_topology() to shared code
      riscv: topology: fix default topology reporting

Heinrich Schuchardt (1):
      riscv: enable CD-ROM file systems in defconfig

Jisheng Zhang (2):
      riscv: compat: s/failed/unsupported if compat mode isn't supported
      riscv: enable THP_SWAP for RV64

Palmer Dabbelt (2):
      Merge tag 'riscv-topo-on-6.0-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ into for-next
      RISC-V: Print SSTC in canonical order

Sergey Matyukevich (2):
      perf: RISC-V: exclude invalid pmu counters from SBI calls
      perf: RISC-V: throttle perf events

 arch/arm64/kernel/topology.c        | 40 -------------------------------------
 arch/riscv/Kconfig                  | 12 +++++++----
 arch/riscv/configs/defconfig        |  3 +++
 arch/riscv/kernel/cpu.c             |  2 +-
 arch/riscv/kernel/process.c         |  2 +-
 arch/riscv/kernel/smpboot.c         |  3 ++-
 drivers/base/arch_topology.c        | 19 ++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c |  7 ++++++-
 drivers/perf/riscv_pmu_legacy.c     |  4 ++--
 drivers/perf/riscv_pmu_sbi.c        | 31 ++++++++++++++++++----------
 include/linux/perf/riscv_pmu.h      |  2 +-
 11 files changed, 63 insertions(+), 62 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
