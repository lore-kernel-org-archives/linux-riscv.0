Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD3C982E1
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cEKiF0IaZXugWWIA2c+Yr00fNoMvK/bCfAKek+zjp2c=; b=2BIpVfB9Q+9XGc
	MU92wyY9np7Mg3IR+HAKhQPxzidGVawWSS7FI/itS7VEFjMq/cdIBngqDjkJp906DZdmsYSf2yTp5
	0q0fw3g62dKuAhd05vcoZj9MnOq34wPClzwG7yUyJ8a0fyO9zIA874fiiUYmr0K3dlwfcq07Fg6Sh
	DLf4P5o7yslqs09Nsqph3SkVmSL7csCtkTkQZJVexPfXUusenHv9mzsd6cN2MRetLkiFkeOldLlGd
	6ZNURLfqsH2KTbY7B2J3laV7pBt0DjiKVLzwIAsM8HrW3oHjYBBwnKD6uIod1IIfUydGLR5aY1rVU
	cmNEegoRcC3olt3mZBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWU-0000000FaXu-0GGb;
	Fri, 18 Sep 2026 21:53:34 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWP-0000000FaUD-36gM
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:31 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66fded6b087so1308665d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768401; x=1790373201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCeNBo6gA5Vwt91BvnJjd9zbeD5TG84V0uDwV5N2aYk=;
        b=U9xXwXnOaNqckT6WMSCbWg2ezBUb3IY9NrXUhDyLtMUh3K7mb8bHVpC1F4TRmYgLiN
         cBlZNgO6OUPegLxtf+FWk7dvrIlTbhF6fmjY458alfbKGD9HNONjsImoun9csiUwyK1E
         o8HahpBbvcigBQHxQtscLHI7Wm2cKeDC6Bdj3X2GT0sDtloBLEZk0FnOeM81hJrHReh+
         uTvUdor5h0e08HEpSNTKEe+ExIa5n3M3HNgGT0bm+2TMYEGdCeK59QGWW21rDaN2NDrr
         0AhFuMLq4Itvk/zk3K55QSuXo1l4nt/115xaZ8t9R0ZEBN/PDHV5vghXJaWh7/THiaou
         P6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768401; x=1790373201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCeNBo6gA5Vwt91BvnJjd9zbeD5TG84V0uDwV5N2aYk=;
        b=Qcn0XRLwU4EbjnD7wgH9Wmk9dhDhRDght/IGSLUw/DkASDllCrWRE3HheddzFTLMVR
         E7crHZ3dxpnyyKmiSAK1Rb6wpxD/i0vR+a2DRucY2LB/5abqi51hWfK2FgoMjLz2JHyr
         Bac1V8DPcy+Zf0sT6mUSeG6IbfsM7yVcyfCyMxEu3iF8FBaeAZH6h7ELyFSxJ79mlzcl
         IEOm3rSolQtnmTmwVMralJoOOvZB0lhdOEchPCOahGA7KQOGtGEvPKjwHYCLw6hio/dr
         eGhG1pd7rO8AlsgdD9I+1FgyFqf0DrdbK3Q4pRTPVs4PIN5SPWBpzrNuscsN5wLSw+NY
         M5Xw==
X-Forwarded-Encrypted: i=1; AKwUvBx/PH5kllUVVEfzmcj+qzM8vPPU1Dgduy6szzNQJRMa8SKS3b6FIdxj1LQ+8SjCGx1qQO7TQ/351E3eMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nT/PLpqCBg7GG1Q4cLGHZUbccZuDucjtWlRpvxqQQH8s7hguq4
	g5jvmEJqn4Cc/fVDUlos9Y22uWCPJQePFrupyNo37Xcnn8dvs2GVy8Sx+WAHX8UhH3U=
X-Gm-Gg: AYBFou2b0ki6vc1yY26EH2YVqdGTmRTPCJqE9whTqGUCiWT65HMfLDp80d6ryVnnJHY
	C+Oh1euF/TGBvZ6kMJnZMCTdKfgrq3e2R9WnG6oXRoLluiMFqo1X4xi08rSPX6tjk2lgnYZZ/+M
	R64Wv2LJIlx4XQdGJAb77JXK1EEcuM/1PxTNM0JH8FA4Y98d463XzdaRKRdpFqPh3xXxkDWi8El
	vOJbPUtSIZPVWsNogg5rfw15Q4DVJIkr3k3UxiIoo3rGfRSbjNnX8b57VeOXVmuKjkhZppx9aX0
	DdzVS9pHxc1zrNIwvI5FqV9ymG56lTC3Za55zWeN9JntXxGOZYqmoOHLTXCeEiivUAgzVnM6kDR
	fPCyvwvwCdtDqKCW14ntChPTBJVc3aib1a/ouh1oSokq91pRKmhiLvCAoTjgamrvAnd32tAXfbo
	xsc+WEyPIU37C2gUNYUc0x/EvAnpPgvHrIhUmaaPR6t5pMSACzItQqP01zXjgzjAh3Cajq6dTgm
	N9InVkMgCAWxOFgtxUYOo+wON8sX3KsDPS32Q==
X-Received: by 2002:a05:690c:e0c2:20b0:88c:b280:5434 with SMTP id 00721157ae682-89732475485mr9362117b3.30.1789768400926;
        Fri, 18 Sep 2026 14:53:20 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:20 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
Date: Fri, 18 Sep 2026 16:51:14 -0500
Message-ID: <20260918215154.2481482-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145329_792732_FE2B5EBB 
X-CRM114-Status: GOOD (  17.04  )
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

This series provide several optimizations targeting system call latency
regarding vector context management. Before the series, the kernel
handled user's vector context in an conservative way, where registers
were null out and VS is tracked as DIRTY. This introduce excess context
saving and restoring when there is a context swicth.  Also, the kernel
turned off Vector at the exception entry, making all in-kernel vector
usecase take the serialization cost, which includes context switch and
user copies. The cost is not easy to hide as vector code are usually sit
right after enabling V.

Since vector register are set to a known state at syscall exit, the
series set VS to INIT at syscall entry and null out the vector register
at the exit, skipping unnecessary saves and restores. The series also
introduce riscv_novstateopt, when unset, enables vector in the kernel
mode, and do not perform register nulling on the syscall fast path,
where there is no context switch or kernel-mode vector during the
syscall.

With the whole series, nginx request throughput vs base on a four-core
Ascalon-S, by served page size (* = statistically distinct):

       86B     1KB     2KB     4KB     8KB     16KB    32KB
  v5   +0.79%* +1.36%* +2.33%* +2.02%* +0.14%  +0.93%  +2.42%*
  v6   +0.33%* -0.23%  +2.88%* +2.19%* +1.02%  +1.14%  +1.40%*

This series depends on [1], which is now queued in the KVM RISC-V tree
[2]. For those who prefer git, the series is also available at [3].

Patch summary:
 - New patches: 2
 - Modified patches: 7, 8
 - Unchanged patches: 1, 3, 4, 5, 6

Changelog v6:
 - Refactor the context switch of preemptible kernel-mode vector (2)
 - Address checkpatch warnings by reformatting patch 7
 - Drive the optimization with an alternative instead of
   CONFIG_RISCV_VSTATE_OPT, enable it by default (8)
 - Link to v5: https://lore.kernel.org/all/20260810172255.1532787-1-tchiu@tenstorrent.com/

Changelog v5:
 - Rebase on top of the kvm fix
 - Do not read sstatus in vector context swicth (1)
 - Add a test for vectorized user copy (2)
 - Enable vector in the kernel-mode and skip nulling at syscall fast
   path, gurad the optimization in a new config (7)
 - Link to v4: https://patchwork.kernel.org/project/linux-riscv/cover/20260528190927.886558-1-tchiu@tenstorrent.com/

Changelog v4:
 - Fix a build warning (1)
 - Prevent setting INIT when it is already and provide performance
   meassurements (2)
 - Address comments from sashiko (4)
 - Link to v3: https://lore.kernel.org/all/20260521162521.188629-1-tchiu@tenstorrent.com/

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)
 - Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/

Changelog v2: rebase on top of for-next

[1] [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
    https://lore.kernel.org/all/20260803215250.824417-1-tchiu@tenstorrent.com/
[2] https://github.com/kvm-riscv/linux/tree/riscv_kvm_next
[3] https://github.com/tchiu-TT/linux/commits/vctxopt/v6/

Andy Chiu (7):
  riscv: do not read csr in vector context switch
  riscv: vector: refactor context switch for kernel-mode vector
  selftest: riscv: test vectorized user copy
  riscv: vector: refactor vector context operations
  riscv: vector: adjust ptrace and signal behavior for INITIAL state
  selftests: riscv: Extend vector tests for sigreturn and ptrace
  riscv: vector: optimize vstate operations

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/riscv/include/asm/alternative-macros.h   |   6 +
 arch/riscv/include/asm/alternative.h          |   3 -
 arch/riscv/include/asm/cpufeature-macros.h    |  12 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h      |   8 +-
 arch/riscv/include/asm/vector.h               |  78 ++++---
 arch/riscv/kernel/cpufeature.c                |  19 ++
 arch/riscv/kernel/entry.S                     |  15 +-
 arch/riscv/kernel/kernel_mode_vector.c        |  13 +-
 arch/riscv/kernel/process.c                   |   3 +
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  56 ++++-
 arch/riscv/kvm/vcpu.c                         |   2 +-
 arch/riscv/kvm/vcpu_vector.c                  |   6 +-
 .../selftests/riscv/sigreturn/sigreturn.c     |  69 ++++++
 tools/testing/selftests/riscv/vector/Makefile |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c | 221 ++++++++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 ++++++++-
 19 files changed, 598 insertions(+), 67 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c


base-commit: c93809c637bd1fb1e0d0f0168b53cfe1c4767d21
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
