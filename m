Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4197C55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jaOW/30UjSt59B90iZqbFVMHgjQSWANR7mDVvG7XT3M=; b=M6CJ9Ye/BAA7ww
	br129ecJxH2I/0hvUq+J9Vpm37b4JvePaW3ZYlUmva0aHveyHfy5ioGUqbkeKMYHHJmLclDWGN0LN
	ETPk3DahHGE4J544oEdYxHRdx8rGfsPFqzgV+xrRdMrK2B7DfKAeiVlS6zzQV9D3alwiJk7fTOnU2
	XcUaoW2zMrST7niFMTilMPi5rzH2WQIgblayQowBsU2bkPE4a0PfwEiexlktTVacqlWvpFf5CWXMP
	n9sLige/J9PHb7vDTUxAFhKyFpN/XjOIcic8xZzp7fVNFvnToWMeTts9F36CnnpX/NRGnUX1yq+II
	rO030+W2iUUbJ48oC+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2r-0000000HFVM-3rIG;
	Mon, 03 Aug 2026 13:49:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2o-0000000HFUX-0IuH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:49:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRgMr723432
	for <linux-riscv@lists.infradead.org>; Mon, 3 Aug 2026 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LaA81qaNbrY1YLttx6AnIVlkjw/iQrLtgmE
	4RYoHXf4=; b=ObQnEI3PvkDz2oiZxJnfMlhG1B3de4QrfSXH7hxnu1Wf2gHlOj+
	yf+l8zzLuVbJjPJt6vg858Cu6TWTx9h5Rr0bzLoRpq7OeJcYJyX6cJJLu6ODYryu
	upv7oqoozu8jzm4O+QwNQWMZok2KuQvxChAdBUh+Cpy2m1MF5IKURZ5p4qn3tX7F
	tKZwdHqBwwSou0q5blBfI6xpmUqQMvEuGtcRtcVBiYN1L10bc4HTzUzrBgufWTOK
	9nd1g7ZUnbQOHF9zsp0MsFK9XqUdVuETyvAJLCGnX9EY7PuBtDfJn9w2TYkTaME6
	Yc1kKgFRWHRDDLv4shR2HSR0BNCufmOClig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkhva1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 13:49:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso4602857a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785764967; x=1786369767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaA81qaNbrY1YLttx6AnIVlkjw/iQrLtgmE4RYoHXf4=;
        b=PqGVu8MyXwsT9NP5eVsUaA7Kgxf6cUN/lq3RFzrJ3AihbmOfcKcZDb9o3f060dhT5P
         +kWBcIDMZTq+011kpraWBiTA3c6nX+9HJ/Qgoc73LtZ93EZRuMNqLk4RaeB3GhkWpVY1
         Zgs6FW4gdxwDL1zwiBMEqcIokIOxPba5ypQoekYTJ/Ue1Pe29mPXMTDl3yp2UUOnucAU
         zfdh015IGpUbIuKwEP3cHJsiQKaFP0aifOniaDfvt8nab6MX21sIl78GDUGuIcfWXJ5Y
         UVBZIpRjZnII2a0Ee+LlmPsU6oF9qQ2EM/aGZqi9Wyh5Dd1wFDuD1JvQURuS2HoMgVbC
         eYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764967; x=1786369767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaA81qaNbrY1YLttx6AnIVlkjw/iQrLtgmE4RYoHXf4=;
        b=HydXU+54JTGYoMm5iZ3HmwkgR0/XHVETfe7YWZVFHb5dLWxUuHPHUUdVzo2YxykQQP
         xjeB67Qnd+y17InYgAD+E2WFanre0gVh1saTPFxGK3DluabTIcb+3BrIQq48cCbq6/yg
         n+076Ugj1RwH+16CCNXHseHd6Rl80hchB66PqJCKv1Kc2Xkoqo8evkdneYu+nDtShrMt
         INnI4Bbj2e47xAAsPFRWqpFaKNsKwcE71jLpF7CCrI60PUzeDvMckd+QrCpEzoelOmIT
         8gxqjE867bbgU1U6AFwbOkrSD3GkfKpFiiJKR6fcR+FXOaFURHZDGci0kdrRw/iTtHNg
         WR8g==
X-Gm-Message-State: AOJu0YxK6SB+rezJPpKlnrcOA+CQz8JgY2t1YqgWtVROo4omcNNTF953
	yvdXy8FpMA8d7KP1yi6c6xLkDQyfHRhe+Kg5WBYok74xyhsqIvfgS59zvctmbvzeEDCU8L4dGo3
	iep0mUZHWMJJHtjRpFugkGu46+0VYAyu+WvOStCpliSBdBBqf8Uz5el24vl92hpVhcto55mDjZR
	MufRU=
X-Gm-Gg: AR+sD11hTpFXtDosoV0faq3c7R4KchbUMtehT7BWrol8T+Yb1mOcqMniq4cZZ1cStQe
	dl1kh8p3dYYsC9WGPPTzPo/3Vcqd8EfwOpuGX7foR1hH+EiUV1OwpodaSOZgFWyeRux2ENIroy7
	10QZXgBF5uNYYEax62nseC9Kl/v2/mEMOwbb+DR62ChmYPtpO7BaEkb4xJTvTQMWzdUZf2+GB0D
	mor8bNQish6/FLFiSFkOMHQJ+VzbvJA3WhUpOvqQxf1R9TO4sQaK/BieO+KPaXEa3JfnKpXEdHM
	yMdrff5/rsGonaFmUMTsN0Iy9O0uaAZ+2u6YSXT1RWCAIDz1LsTafZuZgFpvRVyq4jMf4gp1OWF
	sxZ0r6UsVDCBkzVBpnWAq5e52E9m7X7XxD5XC9W/simynYo0GbLfGa1ocKyHt5hp4anBPGMcQM5
	o76Dk3VMo6yhucwuyPHBknuJRy
X-Received: by 2002:a17:90b:4c51:b0:38d:c0f9:30be with SMTP id 98e67ed59e1d1-38fbc5bd83bmr9000691a91.38.1785764967113;
        Mon, 03 Aug 2026 06:49:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38d:c0f9:30be with SMTP id 98e67ed59e1d1-38fbc5bd83bmr9000649a91.38.1785764966565;
        Mon, 03 Aug 2026 06:49:26 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm39278870eec.30.2026.08.03.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:26 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
        jtaubepe@redhat.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v6 0/5] riscv: Introduce support for hardware break/watchpoints
Date: Mon,  3 Aug 2026 19:19:08 +0530
Message-ID: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: vScysk5q5GhA_WyrqAVn0MhYf8OfRdKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX52TfAV+WHhJz
 WrtIVEi+aYVy8iTGPHSQS2uy9hH2nQTCjpGlGAtXWSvfvIJOvdUDsMFGCwFyPvKSBBc9F2hw2SB
 q+eGHajOSSjhNZpaBN/V5tKYK/d+brkVcpO3u+ssfQ7jBs1PU4UHnFFe5eGn09vt/a0LJY7vJNo
 Hf+tmsPnoZ6S6jP+0z34kFteab79P3ULW7PgC3CGIthuVENJHvT6i6vly9mKORQNSzVh9GNtvDD
 ++DTkpZf4fbeEeIx7sVLe5adhwdyLf+v90IuI2bm+dPRgnHwOmvY5eZPRt4MJf8QxPg6NTJTmQG
 y3WTCRmihU5z4xz/Yrb1DQi7o28gLiXpDSZJyxac+LAJ2HAr0Hr95DwEgiJO8qVWmBgRMcanUwP
 lYehrbeFiNYt+7Z808iiO99zy+E7IAPbtxBCOYfmfGDQVL+4sNemAXTAaUI+OROQdkwHwC7ZnlD
 EWVr7Gz5qm3V4Hn4Llw==
X-Proofpoint-ORIG-GUID: vScysk5q5GhA_WyrqAVn0MhYf8OfRdKL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX5gLaIMAo+Gyc
 +W9yhGDomCMidsbf0UcrgWMJQCtkaid7eq0r3FLnouJfiboiuahAU36h/wl6RtQMCtKecH8n5h8
 m9XAh9Zg7tjBPf4V/7t+ywqlRdKdAaM=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a709c68 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=Gr54bvSM7lryjJAaCBAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064930_229137_70A12883 
X-CRM114-Status: GOOD (  18.18  )
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

This patchset adds support for hardware breakpoints and watchpoints in the
RISC-V architecture. The framework is built on top of the perf subsystem and
the SBI debug trigger extension (Sdtrig).

v6 extends v5 with two new patches:

  - ptrace support: debuggers can now set and query hardware debug triggers
    through the standard PTRACE_GETREGSET/SETREGSET interface using new
    NT_RISCV_HW_BREAK/WATCH note types. A simpler PTRACE_GETHBPREGS/SETHBPREGS
    request pair is also provided for direct single-trigger access without going
    through the regset machinery. Thread flush/copy hooks are wired up so
    per-task breakpoints are cleaned up across fork/exec.

  - Extended selftest: the existing perf_event-based selftest is extended to
    also exercise the new ptrace GETREGSET/SETREGSET regset path and the raw
    PTRACE_GETHBPREGS/SETHBPREGS interface.

Single stepping is ready and test but to follow this patch set.
Virtualization of debug triggers are pending

The SBI debug trigger extension is specified in Chapter 19 of the SBI
specification:
  https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf

The Sdtrig ISA is part of the RISC-V debug specification:
  https://github.com/riscv/riscv-debug-spec

Changes from v5:
  - Rebased to v7.2-rc6
  - Simplified Macros in hw_breakpoint.h
  - Took care of the review comments
  - Added ptrace support for hardware break/watchpoints (new patch)
    - PTRACE_GETREGSET/SETREGSET via NT_RISCV_HW_BREAK / NT_RISCV_HW_WATCH
    - PTRACE_GETHBPREGS / SETHBPREGS for direct single-trigger access
    - HAVE_MIXED_BREAKPOINTS_REGS selected (break/watch share trigger pool)
    - flush_ptrace_hw_breakpoint / ptrace_hw_copy_thread wired up
  - Extended selftest to cover ptrace-based hw break/watchpoint paths (new patch)

Changes from v4:
  - Rebased to v7.2-rc4
  - Fixed rv32 build error
  - Added pr_fmt to print KBUILD_MODNAME
  - Changed type of shmem_pa to phys_addr_t
  - Use per_cpu_ptr_to_phys instead of __pa for per-cpu allocated memory
  - Print successful registration/unregistration message when no error
  - Added RISC-V DEBUGGING section in MAINTAINERS and added myself as maintainer
  - Fixed warnings from checkpatch.pl --strict run

Changes from v3:
  - Rebased to v7.1-rc3
  - For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ and keep
    STVAL-based matching as fallback
  - Improved watchpoint matching when STVAL reports the lowest accessed address
    for wider memory accesses
  - Program execute breakpoints with SIZE=0 (match any size) to avoid misses
    with 16-bit/compressed instruction addresses
  - Updated selftest to avoid deadlock by replacing unbounded sem_wait() with
    sem_timedwait() timeout handling
  - Updated selftest breakpoint function so it cannot be inlined or optimized away

Changes from v2:
  - Rebased to v7.0-rc1
  - Fixed warnings from checkpatch.pl --strict run

Changes from v1:
  - The patch adding the SBI extension and function IDs is already merged; this
    series builds on top of that
  - Added breakpoint selftest in tools/testing/selftests/breakpoints/

How to use:
~~~~~~~~~~~
OpenSBI:
  https://github.com/riscv-software-src/opensbi.git

QEMU:
  https://github.com/qemu/qemu.git

Linux Kernel:
  Apply these patches on top of v7.2-rc6.

How to test:
~~~~~~~~~~~
From the Linux kernel directory, first install the UAPI headers (required on a
fresh tree so the compiler can locate <asm/ptrace.h> and the new
NT_RISCV_HW_BREAK/WATCH definitions via KHDR_INCLUDES):

  make headers

Then build the selftest:

  make -C tools/testing/selftests/breakpoints/

This produces breakpoint_test_riscv under the same directory. Load it on the
target and run. Sample output:

  # /apps/breakpoint_test_riscv
  # [perf_event]: Breakpoint test passed!
  # [perf_event]: Watchpoint test passed!
  # [ptrace]: Breakpoint test passed!
  # ptrace(PTRACE_GETREGSET): Number of watchpoints: 2
  # ptrace(PTRACE_GETREGSet): addr: 0x82888 control: 0x8080
  # [ptrace]: Watchpoint test passed!
  # [hbpregs] breakpoint readback: addr=0x10472 type=4 len=4 ctrl=0
  # [hbpregs]: Breakpoint test passed!
  # [hbpregs] watchpoint readback: addr=0x82888 type=2 len=8 ctrl=0
  # [hbpregs]: Watchpoint test passed!

Himanshu Chauhan (5):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv
  riscv: ptrace support for hardware break/watchpoints
  selftests/breakpoints: extend riscv test for ptrace hw
    break/watchpoints
  MAINTAINERS: Add entry for RISC-V Debugging

 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig                            |   2 +
 arch/riscv/include/asm/hw_breakpoint.h        | 299 +++++++
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/include/asm/processor.h            |  18 +
 arch/riscv/include/uapi/asm/ptrace.h          |  53 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 677 ++++++++++++++++
 arch/riscv/kernel/process.c                   |   5 +
 arch/riscv/kernel/ptrace.c                    | 507 ++++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 include/uapi/linux/elf.h                      |   4 +
 tools/include/uapi/linux/elf.h                |   2 +
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 765 ++++++++++++++++++
 15 files changed, 2355 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
