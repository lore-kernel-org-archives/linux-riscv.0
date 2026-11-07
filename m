Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F29606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fNKJoQHH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=prQuEx/r;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0Pd9hIV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z5bw4QRQ8nrO3CE8j27uyi6thW7sQr6sOUc3iG3w57c=; b=fNKJoQHHR5CTWJ4BE/f6uFwPp7
	3MWLz2GD5tJBSCyadK8AE5+ZTj+7I4G6+cwddB6zAfCSB2mu9W7e7BQA+GIl6Vc7nnLP5M4VhD7VR
	E+ss93CVStiqudQ54xU+VvKaEjXLSVpdg9Io4U9imWzuicqwt5THTtfNzOU1OUbrYoRQ018ee//mu
	qOa0YNhEse1LcZIRwvbS7COQLTRdADo8hTD8gOFKbubpo61e7cu2inpbL88MeIDu3xWheqlcO5cME
	Jyg2UdhqK0O7RcK+DDWfjRqNS5IqM6gsjIN/y1WfYuxhvaPjvbZqcVBd/NWzg1uoRXRBWNGUoZdZ8
	YYsy3BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLv-0000000E5VB-3tX5;
	Sat, 07 Nov 2026 02:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLN-0000000E5Ob-3atc
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 02:40:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72B7Ne2152458
	for <linux-riscv@lists.infradead.org>; Sat, 7 Nov 2026 02:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5
	RdhnO7D0=; b=prQuEx/rq64IvGjKtB6ZhmV3sHxdSim4xZlwhchPEwZk9dCeAhW
	6wq4vss9cQEzzvbBiUFcavNg/55mtjMFdkL7yTnfk7DdRQU8ib40vIgMvtRSKel1
	du8vGjdJXtkdGXU3VLV8eJdvRU9c0mWi3bGd1xfAFhwnqAoW05/n+jIQcUWQwI59
	AP+oJfOH5JT5l2ag+lVDGj6FnaLUR0HQfX/DQ5Gc3cOkgQsegAcMsR98NR1KqcZL
	5qlz0xq31NJrMmWl9yXnpxGS/dBwApzyjkikODk4y0oHfnd+AfNSVQjDgjUFV2aS
	BgSMpAZj+6OTfvE/SIUj4h4NwH1P2HKsH5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn0e15pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 02:39:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3700be873ebso307344eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 18:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019172; x=1794623972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5RdhnO7D0=;
        b=M0Pd9hIVPO6JtF3iSs5sIG2f3m33PZbkY5jrttqFMfO5j/lpXPs0H3PhmPOdIrwgVV
         HHz5RLKP6riq9yuXlnCIGIm0uKSkue2ppQ0lfKvo3lsME+iEAoimLEpZ7lolCx/zK0et
         PcaooMDWcvpPrFL2nkTTe6BbBXtuErXaR4TxZCQizIkzYYcg+GzJw/lzlN6z7Sz0CIvH
         ZaMpURGTBurTNioE9JFqLq+vfIr0vAssb527PN1GC5Iurd25wDxzZ8Ar+fywLhtadn2n
         fGalbHs64YYGt2H8qUR56xn+gSIMwoDnKhR3OmFQ9ku7oUtDd31mxNN9caPyzpYrQKDF
         bEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019172; x=1794623972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5RdhnO7D0=;
        b=Bk12gE01nauROcr8ZvePwm4K+mzm20UT0nTMLXZFrEWwathlcIV1II6df6f66eis+y
         xMFoCZkVq+jQ1yhwADmZ6TfxB9pjkbvQK9H3pLJ/foHqXfuOVDTjPQEaIIPJvdgyHyWR
         zpPDMc89bwskoFIu/oaHRg+j+fWfr1wooK1tzZQFWoIq7YcEl7aIKnZjqRygGtujaAIs
         JGtIL2Q7tdUnzfFpT8lChDGqhSS4RVsDw8FhsoJm0piK9tLeqD2qytKIXc9tqMdEoE4O
         xlKY1KdkgbmQDZ78fYcb8omqb0DkQepvbUscPEY/zeAUeOgtdNJM9M6ZgZjTyUtpj8yr
         US0w==
X-Forwarded-Encrypted: i=1; AL+hErFTUerNJTM2HaB46x6SZH4knGzt41SMN3piUPU6ZAaxXyHDXlKk8KsctfNSaKK9aTj5AmoPGTkPzQNIMA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+cuNYQtIcENwhk17tDqm7U6tWp+zsWz3PpS+5aUVz892sjiFWg
	9EZYfVXuo8bdsO7iiNIxQ0MQc0MP2niuX8CTMED7cs5IYpPq8f0Yg+8ljQihWR98quEqcETOJkV
	bso+9zp4FD1KDm2+C9Zzmx9moezMdO7cx1oRKPKpe+Dwgh0BFibZLbwFyuV5szZOlWMh6QIc=
X-Gm-Gg: AYBFou2MCsPWwHa2atUShj5E98W+yLUGkJLJvmMuXCmryaSBz6Y2BQ4gD1m/izJCXqt
	PqNfYRjbQgbLrhNjOLNm+vGQZFF5Gy/oHm2MvGA8U/sPm3EKj77li7hCv7++tzOkMMEtVxdeuoN
	wixL+/IFe3f9TZi/9lTgf+oAL7hSSax66o4UGIT28Uu/Y0ioGNsLvJd5d7iQiK4Km1dCQDcMJ+P
	nXE0uGW5k5RB6ZX6azAxIq86tM7OQCyWFFJZkSWQZXsm4RU2Y7ccmWXeoGilytHEYqwHKgTsCgm
	Pja+D6tHVBFvLvUl12in4Q45B4zgQVLQkqP+F1EDfQ2i1iYD84eH4S/tMNdQvdrPb28ytWzqa68
	ec7Yq+pdsgb/k/GSTMyEoTVWROv4JLejtHnIe5s+Ij2pLvQoJ+cj0GYc514n9D4njXmcpoGDgq6
	23bl7wTD8yT/QUbaR4x7gdwfaITk77v6qRPtOwsFr9QInDF50yMrWn2ojYBpRtx12cs9U5rt9AZ
	A==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr1169926eec.14.1794019172296;
        Fri, 06 Nov 2026 18:39:32 -0800 (PST)
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr1169834eec.14.1794019171274;
        Fri, 06 Nov 2026 18:39:31 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:30 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 0/8] riscv: Introduce support for hardware break/watchpoints
Date: Sat,  7 Nov 2026 08:09:09 +0530
Message-ID: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: WkyOUCK4h4v0G0IFiqEZH--HzN5HJt3u
X-Authority-Analysis: v=2.4 cv=ffA4WEQF c=1 sm=1 tr=0 ts=6aee8f65 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=HwFc7jivAAAA:8 a=_NFv3PjsgsRmLWfyS6wA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX4RS5PX6sLvC8
 MKj2J45hnDJ7AP8pQA3tRFLkupwm0ZwGWbGySQyGUwlHA1MXEgozlyle/jDtNl/5peQAjkhUL48
 O2TBzoXOkXfGz8JToMYbj5+Qz4vQODoVfNZWOpg0O7CAqarNZpeCSj78phwd4Y3jaFMNAYduXYg
 lwSMOARaPZd5mL+ZmBCqOujjYMGnOfoFqpMptX44w/AwC7E5LnNPn5VJ0Oc1+5QCOPpzlyPEwxY
 uQVhQjFnMLcVyLEwVr3y5/8vZgdi7N7grbcZZM9+JNL18uUEwgYWHL0Zz6CdWE8daOjolyr1wPs
 n9h3bIbndfDyZbzv7/xuhoth0ub7D68mpM+gqECUG+S5D6bPNtQb52DY4wYWChQCESQnMG9nJtb
 8jqVAYmhG5N+fEp5rj6/EE8Iwx3P9fIlwqEpX1a29HJydBRJWiD33HW50vePyAobcAZ3a0i34/l
 7j61kyHcsIXYVXu07HQ==
X-Proofpoint-ORIG-GUID: WkyOUCK4h4v0G0IFiqEZH--HzN5HJt3u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX0vaIN8uqywc3
 7P9waqYpb201QYEuVuHOMwMSwq08JfPcT9FF1HKk1BWOqbvj2FrQmI1yS4pLKaPYrJKSvqRDjSP
 a7OIuqRB0kbbf9xtYQ+3qVdAsunRHHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_184002_559638_7229FE37 
X-CRM114-Status: GOOD (  25.28  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patchset adds support for hardware breakpoints and watchpoints in the
RISC-V architecture. The framework is built on top of the perf/ptrace subsystem
and the SBI debug trigger extension (Sdtrig).

Single stepping uses icount when it is available. The software stepping path is
kept as a fallback for systems where icount is not available.

The icount path depends on a QEMU fix so that, when an icount trigger fires,
the exception PC follows the Sdtrig action rule: "xepc must contain the virtual
address of the next instruction that must be executed to preserve the program
flow." For QEMU testing, please use:
  https://github.com/hschauhan/qemu/tree/hschauhan/sdtrig-icount-fix

Virtualization of debug triggers is pending. The patch set is ready but needs
testing.

Changes from v7:
  - Rebased to v7.4-rc1 and folded maintainer entries into the patches that
    add the maintained files.
  - Reworked the patch structure:
    - one patch for the direct single-slot ptrace requests
    - one patch for the register set interface
    - debug trigger encoding details kept internal from the introductory patch
  - Tightened breakpoint and watchpoint handling:
    - trigger setup, update, uninstall, cleanup, and error paths
    - debug trap races with trigger programming
    - hit state cleanup so stale hardware state is not reused
    - cleanup across program replacement and fork
    - bounds, overflow, and wider-access watchpoint matching
  - Improved ptrace support:
    - both ptrace interfaces now share the same breakpoint/watchpoint storage
    - 32-bit traced tasks are supported on 64-bit kernels
    - partial writes and bad indexes are rejected more carefully
  - Improved single stepping:
    - icount is used when available, so the hardware reports the next PC and
      the kernel does not have to decode the stepped instruction
    - software stepping remains as the fallback and now handles indirect
      branches, kernel-address instruction fetches, and mode-specific temporary
      triggers more carefully
    - unsafe software-step cases are rejected instead of looping on the same
      address, and the original breakpoint is restored if stepping lands
      somewhere unexpected
    - CPU-wide software stepping is rejected when icount is unavailable; there
      is no task to follow, and the fallback needs per-task state
    - unused saved trigger state was removed, and the QEMU icount fix needed for
      testing is documented
  - Improved selftests:
    - icount stepping over a taken branch
    - cleanup of failed child processes
    - failure propagation to the process exit status
    - bounded waits for expected signals
    - breakpoint/watchpoint readback validation
    - native riscv64 build handling and RISC-V-only test flags
  - Built and tested QEMU, OpenSBI, Linux, the breakpoint selftest, perf tests,
    RV32 compat ptrace tests, icount stepping, and software-step fallback

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
The SBI debug trigger extension is specified in the SBI specification:
  https://docs.riscv.org/reference/sbi/v3.0/ext-debug-triggers.html

The Sdtrig ISA is part of the RISC-V debug specification:
  https://github.com/riscv/riscv-debug-spec

How to use:
~~~~~~~~~~~
OpenSBI:
  https://github.com/riscv-software-src/opensbi.git

QEMU:
  https://github.com/hschauhan/qemu/tree/hschauhan/sdtrig-icount-fix

Linux Kernel:
  Apply these patches on top of v7.4-rc1

How to test:
~~~~~~~~~~~
>From the Linux kernel directory, first install the UAPI headers (required on a
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
  # ptrace(PTRACE_GETREGSET): addr: 0x82888 control: 0x8080
  # [ptrace]: Watchpoint test passed!
  # [hbpregs] breakpoint readback: addr=0x10472 type=4 len=4 ctrl=0
  # [hbpregs]: Breakpoint test passed!
  # [hbpregs] watchpoint readback: addr=0x82888 type=2 len=8 ctrl=0
  # [hbpregs]: Watchpoint test passed!
  # Icount taken branch PC test passed!

Perf Test Suite:
~~~~~~~~~~~~~~~
Run these perf tests sequentially. On this perf tree, the watchpoint tests share
one watched variable and the default parallel mode can make the subtests
interfere with each other.

~ # /apps/perf test -S -v 16 17 18 19 20
 16: Breakpoint overflow signal handler           : Ok
 17: Breakpoint overflow sampling                 : Ok
 18: Event re-armed with PERF_EVENT_IOC_REFRESH   :
 18.1: Software event                             : Ok
 18.2: Tracepoint event                           : Skip (permissions)
 19: Breakpoint accounting                        : Ok
 20: Watchpoint                                   :
 20.1: Read Only Watchpoint                       : Ok
 20.2: Write Only Watchpoint                      : Ok
 20.3: Read / Write Watchpoint                    : Ok
 20.4: Modify Watchpoint                          : Ok

=== Test Summary ===
Passed main tests : 3
Passed subtests   : 5
Skipped tests     : 1
Failed tests      : 0

Himanshu Chauhan (8):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv
  riscv: add ptrace requests for hardware breakpoints
  riscv: add regset access for hardware breakpoints
  selftests/breakpoints: extend riscv test for ptrace hw
    break/watchpoints
  riscv: Add shared instruction fetch and decode helpers
  riscv: Add software supported single stepping with mc/mc6 triggers
  perf tests: keep bp_signal memory accesses visible

 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/hw_breakpoint.h        |   78 ++
 arch/riscv/include/asm/insn.h                 |   16 +
 arch/riscv/include/asm/kdebug.h               |    3 +-
 arch/riscv/include/asm/processor.h            |   15 +
 arch/riscv/include/uapi/asm/ptrace.h          |   50 +
 arch/riscv/kernel/Makefile                    |    1 +
 arch/riscv/kernel/hw_breakpoint.c             | 1182 +++++++++++++++++
 arch/riscv/kernel/process.c                   |    2 +
 arch/riscv/kernel/ptrace.c                    |  661 +++++++++
 arch/riscv/kernel/traps.c                     |    6 +
 arch/riscv/kernel/traps_misaligned.c          |   52 +-
 arch/riscv/lib/Makefile                       |    1 +
 arch/riscv/lib/insn.c                         |  279 ++++
 include/uapi/linux/elf.h                      |    4 +
 tools/include/uapi/linux/elf.h                |    2 +
 tools/perf/tests/bp_signal.c                  |   14 +-
 tools/testing/selftests/breakpoints/Makefile  |    8 +
 .../breakpoints/breakpoint_test_riscv.c       |  867 ++++++++++++
 20 files changed, 3197 insertions(+), 58 deletions(-)
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
