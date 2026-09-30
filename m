Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A33FCA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KD68/fQfTzNlq4PRFsd15H6PvZ3wgxiSbSQJgM22i+g=; b=jflVahOjFMNJuB
	tnUk76o1GUkSmAN+eOXcjT44lvmVnqTniFPRMxP58fvlKBsSVTcDmCUGTtt7NkeRAfLFpCy0F7cya
	pgCnY3eG6Rt6nCPw0hGQ84jvkWkryYnTMu7UePWafl/Eb0gjpHQIQbdukDVx2iyc6HgqtD0UlYte/
	tDpT0mfXVhiQQJuoFP/s6IB/57twCtdefj+leTJcz6H8kLD07i4hc5USDRZU3AvXq8pjThPcDsndH
	KhnMFY6ne7RKleG+A7I+XwnZVz3lcXRueoDBBAWo1mHXmZt5EsW7C3xDDAFztZykY/SvdqhM/tzdq
	mH92X4e1WfhCXT2vBIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyZ-00000005A5K-3uqs;
	Wed, 30 Sep 2026 06:39:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyX-00000005A4i-13nw
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:39:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6Bge72411332
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P1d6kMS4BrSsV+WBzmEQwwGwhBFS1xtl4NE
	IYUH1ui4=; b=KwD/loRxaBjPCa39wHnGLTbrs31X/zSYtp56ZGmt+whfVSh2Tav
	zR5OG8HMZXup5LHih4Sn5wzeUI4OEvZ39MlcIa4dLYFz/1vUyBVJ5rBziObat+hZ
	ooFKavKFebj5EgrbX8n4Qmzj+XEmpfj9CvLgjBecyF4d8j0pi3CGBVdpsa6gI5SD
	uQHakXW0a+eJFJLSpJrpgJ8jdxvjFKWKpzjVmu007TWbatqu5MZ179xs0DhrMQzI
	JHqJmHbJmJIFi+2hcVhz49TidP9VH5ECkhPHYUCuHzGfPoVRKRQW7nPVZGc72tiQ
	Gt5aaya9DNo3Yv3eg3/mv+Ehutnx0yAQXnA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97tr2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso7435805c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750370; x=1791355170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1d6kMS4BrSsV+WBzmEQwwGwhBFS1xtl4NEIYUH1ui4=;
        b=OEwOdZbUqeZFBNkCjCBzJSCLuibAdQJlVJV0VSt32o1nUfjnqAUGCSpZ6RZY7P62vs
         e3soo1KtKjPjmUiwdELZcn+oO1T6YbOQBAeaQfM3ULNBGiPAdI0oNqGLHA/BMaDxv5bP
         Hca2AgrHRpg3+9PZ2VedwxuVm4EnvGwqzbn299EvibvskDmA6t0/EcsxG47Gx5ONwFLH
         NssV9D6ked5qOnZhaDKbWWNVi46GTxbKkmDdrTH3tZfBLGXXCq5OZsDzxadue2O5Yw9w
         BYCSAyHs5n31+e4lqcJPp60MiH9KOFlb1WDCcWM1cFiu9rbrALUHGtwE4ehNJxC7ONTk
         pQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750370; x=1791355170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1d6kMS4BrSsV+WBzmEQwwGwhBFS1xtl4NEIYUH1ui4=;
        b=x3t7fHHqOZW3YOU7CuRPfqyc1OIOA6fJ2mfl//4pC88WXF4w4zkzt/3LY4lb1r1hKD
         wqXNq59TNbVJdr3br+LPndc7Pd7ZYWrfdL+V1f38hl//FrHid2BGCR4+Ia8wIESSqB1W
         DCJIDBzXdwf/27HnAo89010QNfYkSF6q+7KOlGeDxrZeZ9bsfBg0gdiEx8oZC9m28K4m
         yGp4d+qDofIIbnaKylyFGxa1hMtRnj+E8wKR9pK7Lnfo4hHVYPsq6bKi65/ewkTOeHyi
         Fls3m0u0UWOVL5tj46xCStJ5nPAXANo+4p7/+cTnRtdoeVqJvNwl1iyb2vcvRrFgCZ7u
         Pm8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4lKWC3c0T9QuXYqZRQrgf4Bt78tvoQQXnpYJIfxdFez9l9tuyR95+TexYJ0YFgDKIEnpO0kB6EPl3qQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ll7gbueX5ueyYkrd7nFnHyE2RQrYOLfe5ao9t/PaNlwh32eTLv
	iYRGjAsroBQQv8saHG4sxx8+/UbQa0+dAuVrQJtY9wKLoJM5UMt3G3525fm8i4BiapJhfJb0viC
	1ULdr4Dj4Oxj4RrodO1NCaP4UmVjssbFc4tqXFflWxedxYWcUaKlNF4+Nxl91PoZEeClS4Es=
X-Gm-Gg: AYBFou1B0XXjZU/S3fGnk7Y6WuQLvS4ctN9Osxg2U5FYTZIVjnxafR+MdM8/Lns5X1B
	ZoTKiIla4CLy17KUMu1E2ng+gJbQp+/oBdMW9zj9bvKsJnySba8aqWybR5wzlcQZUMkaJZzP4hZ
	Pz8zf0ej2E60Vwr1S9OyxW9+XbgXxjQC4mNm3GTqhx9dLwODAl1lrGvTI0Qog69WHfKoptNtJQ+
	8XnLtVzwBIIwRZWWiZ3urLyfv0tVKdBwT49wfM3/i1g2AiMQteysddRGpvQjEEK+NpoKRNWFC9F
	vbKNk3V47SGwZLdNgEZX//ocaj1Qc7LxmhjrCaT69LfgB5qoyIl8KISCsVAWIdKtAvzFjBiRonf
	FZtXwN5yqXtIj4Xh66Z2lEboAgSJH5nogciwIYxhC/mwwp4fptk6jdiXo7tZ2zSxbX7wB5wNIoC
	QeUvqvASANnRsmSQ/b9891gUnz
X-Received: by 2002:a05:7022:4595:b0:144:ff51:2d5f with SMTP id a92af1059eb24-14d332a3143mr486566c88.33.1790750370177;
        Tue, 29 Sep 2026 23:39:30 -0700 (PDT)
X-Received: by 2002:a05:7022:4595:b0:144:ff51:2d5f with SMTP id a92af1059eb24-14d332a3143mr486496c88.33.1790750369416;
        Tue, 29 Sep 2026 23:39:29 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:28 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 0/8] riscv: Introduce support for hardware break/watchpoints
Date: Wed, 30 Sep 2026 12:09:11 +0530
Message-ID: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: TplYkbKBC2Mc9BY6Wioz3opxyYMGhU9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX4aTsPvp774rx
 uaL6ZgaU3EuasqrD1AJP7dsft4umO562yNodU1U54UdR6FEnX3/NoDStmg2KuPKvcKddiz9uIub
 7N7irCo84JtT6JptQcTAifE9oVshkS6ivKfDkGPIguTJyyeQbvWsER+c2rAsCU1i5aQCkEjeHoX
 c8T9RABpz89q8NIYHv6Qh5vJ+oRtv0sxcLTssK3SH6KWQwAPIxFU3m5g0k8EmkuDIuTpPlWVYxZ
 5Mn5MKfcIv1+0HPOF/gmABeMyCJenGmXhy18aV+siDaxkJma2R1Yddg44im0kPayalMe2CE2vnQ
 M4D8T0mRnvfWyD8b2eVLMh2YLMfQvEUotJctBci0qYmf+Qi7Pxj7AjcH64YQ4zu+AbL/ygPBHRa
 yP8Z1gEPEwabroBayV9S0IQQImstTwK0Wt8IZhDOFB9TUip0dZ8eXyodPIndh9NxdHM3OgUcjK9
 HwK6jEMm1nQfgbw/BWA==
X-Proofpoint-ORIG-GUID: TplYkbKBC2Mc9BY6Wioz3opxyYMGhU9Y
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcaea3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=ClvrxCKNdzey32-IL00A:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXz+Kwb4rvvTYW
 moG9EUywRf2/6fcTpaHytpAhH9xpiyUtsIx+T+z6/CPBhJpvspRQUiz2qBR5amXAsPPSVpMiVsO
 /UKOlKiyrfQxnRqAO6LJaaCvK9cIBtc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_233933_413191_2F6B72EC 
X-CRM114-Status: GOOD (  19.90  )
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
RISC-V architecture. The framework is built on top of the perf/ptrace subsystem
and the SBI debug trigger extension (Sdtrig).

Single stepping is ready with software support and mc6. Once, icount is fixed, the software
supported single stepping will be put under a Kconfig option. Until then its default.

Virtualization of debug triggers are pending. Patch set is ready but needs testing.

Changes from v6:
  - Rebased to v7.3-rc5
  - Added HIT0/1 bit check/clear in breakpoint handler with EPC/Bp address check
  - Removed dbtr_shmem null check as pointed by Qinfang Deng
  - Fixed MEM_HI/MEM_LO macros to work both on rv64/32
  - Changed unsigned long to __u64 from hwdebug state struct and dropped packing
  - Gated HAVE_MIXED_BREAKPOINT_REGS with PERF_EVENTS
  - Software base single stepping with mcontrol6 trigger type.
  - icount is still under development.
  - Moved and and reworked instruction decoding code to a common file.
  - perf test suite now supported.
	- Breakpoint overflow signal handler
	- Breakpoint overflow sampling
	- Breakpoint accounting (needs sudo)
	- Watchpoint
	  - Read Only Watchpoint
	  - Write Only Watchpoint
	  - Read / Write Watchpoint
	  - Modify Watchpoint
  - __test_function in "Breakpoint overflow signal handler" is name noinline
  - Fixed warnings from checkpatch.pl --strict

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

Specifications:
~~~~~~~~~~~~~~
The SBI debug trigger extension is specified in Chapter 19 of the SBI
specification:
  https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf

The Sdtrig ISA is part of the RISC-V debug specification:
  https://github.com/riscv/riscv-debug-spec

How to use:
~~~~~~~~~~~
OpenSBI:
  https://github.com/riscv-software-src/opensbi.git

QEMU:
  https://github.com/qemu/qemu.git

Linux Kernel:
  Apply these patches on top of v7.3-rc5

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

Perf Test Suite:
~~~~~~~~~~~~~~~
~ # /apps/perf test -v 16 17 18 19
 16: Breakpoint overflow signal handler           : Ok
 17: Breakpoint overflow sampling                 : Ok
 18: Breakpoint accounting                        : Ok
 19: Watchpoint                                   :
 19.1: Read Only Watchpoint                       : Ok
 19.2: Write Only Watchpoint                      : Ok
 19.3: Read / Write Watchpoint                    : Ok
 19.4: Modify Watchpoint                          : Ok

=== Test Summary ===
Passed main tests : 3
Passed subtests   : 4
Skipped tests     : 0
Failed tests      : 0

Himanshu Chauhan (8):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv
  riscv: ptrace support for hardware break/watchpoints
  selftests/breakpoints: extend riscv test for ptrace hw
    break/watchpoints
  RISC-V: Add fetch and decode helpers to a common file
  riscv: Add software supported single stepping with mc/mc6 triggers
  perf tests: add noinline to __test_function
  MAINTAINERS: Add entry for RISC-V Debugging

 MAINTAINERS                                   |  11 +
 arch/riscv/Kconfig                            |   3 +
 arch/riscv/include/asm/hw_breakpoint.h        | 331 +++++++
 arch/riscv/include/asm/insn.h                 |  15 +
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/include/asm/processor.h            |  18 +
 arch/riscv/include/uapi/asm/ptrace.h          |  50 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 879 ++++++++++++++++++
 arch/riscv/kernel/process.c                   |   5 +
 arch/riscv/kernel/ptrace.c                    | 507 ++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 arch/riscv/kernel/traps_misaligned.c          |  52 +-
 arch/riscv/lib/Makefile                       |   1 +
 arch/riscv/lib/insn.c                         | 263 ++++++
 include/uapi/linux/elf.h                      |   4 +
 tools/include/uapi/linux/elf.h                |   2 +
 tools/perf/tests/bp_signal.c                  |   2 +-
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 769 +++++++++++++++
 20 files changed, 2874 insertions(+), 53 deletions(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 arch/riscv/lib/insn.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
