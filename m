Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B66BC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3mrX2+Kwy6iiiHWuV33i1ujQNcvrh4mLPndtV46Iv5k=; b=nvutGQURNKZXyK
	WvFu6j1ykto/Ab0eQeI+oYXKX+jRg1VLdFTKxh6LJaSIqYlluXMbsf8KtWNPi6m6t8ty5mP2EhgnQ
	o/1Vw3aP9t35KpExDYIeOl25+WP66aGiduFBKxFRS92tuDXbHBfjySbiAaeNHEkhuMJwLB880pIs+
	cODVLsJ8kqmjTENicQaVIqNdxAhY45O7pO0E4nkZEp6Ykz0p3wyJ8KLZZiukCc0js3OMZd1wJezfR
	vHhVVc9Hig/3TNUO+db1YEAERB7nXVcRny9+52Syzjq598l2Cy9uiE7QEGJLJA8Kb6n5Nn6/GLREt
	6xcAZ3B1BGqlaagoMXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglS-008zaJ-0C;
	Sat, 15 Jul 2023 15:00:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglH-008zWY-05
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:00:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6686a05bc66so2205466b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433240; x=1692025240;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/PmxR06SnQlXKTp9VF3mD07lpLuN72eWrt3Ps51eXY=;
        b=RLBjcnt7gL+T1EoDd1yKdvy4gzjn5ckFcXNvmJXBB/JeRlIG1KXsiye4ce4R18t8B8
         j5VWxs9NesSwQamZsHm3xcTafgjwlX966pJzJJsyOxmSm6sShdnvuL0EuKqEWc0jtLFm
         7DfTnlBerKFpY5YK9IBha8otQjs0ivHyyCXR/IyW4rYc6VKDGCdg4cMKotPv4RJTq/Iu
         lvdUU3LoV2kPiim413o9rUzAS2wI8X6bXV1cWBXHg4/OgtFny/G9ka8NJlq6GXUHq7fU
         Udwx3AJsCk54AMgqIPRhvR5honCPIkd/uJF3V8QKk2tPxA/QB2EDmKGTByc1hrV7LVDW
         D27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433240; x=1692025240;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/PmxR06SnQlXKTp9VF3mD07lpLuN72eWrt3Ps51eXY=;
        b=YioFa5DRsAAkGBF8nhdnI2zzRiid/+ln1dwfd1hDW5QEdWFaVuXm6ianweZKIDjnf7
         3GzWsrlHgpQ3BA7Qd/X4/lavLVSk03ZflooMdWUoh5TVZmIm/Zy8MS3iCHQ9kv/2+i/F
         fqm6UwMv6+LyMcr8lD33XoED3L0/u9PePQsXZTsEKm7YH+lt0Gc4pp2cCVBxYyxRD0HS
         9lG5QMsl6iSKA8zOaVC2ZTA1vJdfyD0+mUUTsGavHQNV+ZPYqnJrkOMYwB/e0/ng0MPi
         bd/ulZuNGKGnyJ+KCUezUtnSU0I3GQ3bjOekgceuy+9VFHSQ4GyEcD9hTq31xXBCZ7P1
         Q/vQ==
X-Gm-Message-State: ABy/qLapGT4toM6Ys3g1G4bfpJx6TuBH7+UrOG5PDRoKyRXuzQnNiID9
	g/obqc76wFm4eQ9LHdpE19qFytjN3UfA+YQ/y7AItKanAhn7s3BFG7TCc2/56R5jeJhj6DAvmgs
	AzTYeOyfK3ALvm/uenKv2R/QAEikTLe43hxQTSoEwk43heOyaDFo7oV2+pu42OSAFAF+vd2VRQj
	YcdXqBmG11tj74
X-Google-Smtp-Source: APBJJlEVROzCBtT5riIiH446MQawjr6HVFx+/CQ5g06T/W9vpw2pulMIaXWTYmzArkXPFbb4HueC9w==
X-Received: by 2002:a05:6a00:2e10:b0:66f:7076:a5b8 with SMTP id fc16-20020a056a002e1000b0066f7076a5b8mr9560337pfb.29.1689433239591;
        Sat, 15 Jul 2023 08:00:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:00:38 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v1, 0/6] riscv: support kernel-mode Vector
Date: Sat, 15 Jul 2023 15:00:26 +0000
Message-Id: <20230715150032.6917-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080043_132069_30D7D6CE 
X-CRM114-Status: GOOD (  16.39  )
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

This series provides support for running Vector code in kernel mode. The
implementation is based on the v12 series of the Vector series, but with
some additions. First, we introduce a mechanism to defer restoring
Vector context for userspace programs (patch 1). This is similar to
arm64 and x86's approaches when dealing with extra userspace register
context. And it is benefitial to both Vector in user and kernel-mode.
Then, patch 2, 3 add the kernel-mode Vector patch from v12 with minor
modifications. At the end of the series, patch 4, 5, 6 add supports for
making kernel-mode Vector code preemptible. We do this by adding
kernel-mode Vector context, and keeping track of the frame where V
context is last valid. We believe that enabling preemption of running V
is a critical path for getting V more generally available in the
kernel-mode. Besides, with status.VS, we can easily tell if
saving/restoring V is required. This reduce the level of cost when
running SIMD in kernel mode as compared to other arches. Other arches
usually do not have a way to tell if extra context is dirty. Thus, if
they also want to support running preemptible code with extra registers,
then they must save/restore extra context at each context switch even if
registers are not dirty.

The series is tested by loading a kernel module on a preemptive kernel.
The module launches multiple kworkers which run Vector operations and
verifies with scalar code. Also, the module provides userspace intefaces
via fops to verify if we can run Vector code on syscall path.

Changes from the vector v12 series (for patch 2, 3):
 - return a failure code when kernel_rvv_begin() fails.
 - Do not immediately restore user's V context.


Andy Chiu (4):
  riscv: sched: defer restoring Vector context for user
  riscv: vector: do not pass task_struct into
    riscv_v_vstate_{save,restore}()
  riscv: vector: allow kernel-mode Vector with preemption
  riscv: vector: enable preemptive kernel-mode Vector to be built

Greentime Hu (2):
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation

 arch/riscv/Kconfig                     |  10 ++
 arch/riscv/include/asm/entry-common.h  |  13 ++
 arch/riscv/include/asm/processor.h     |   2 +
 arch/riscv/include/asm/thread_info.h   |   6 +
 arch/riscv/include/asm/vector.h        |  50 +++++--
 arch/riscv/include/asm/xor.h           |  82 +++++++++++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/asm-offsets.c        |   2 +
 arch/riscv/kernel/entry.S              |  41 ++++++
 arch/riscv/kernel/kernel_mode_vector.c | 180 +++++++++++++++++++++++++
 arch/riscv/kernel/process.c            |  10 +-
 arch/riscv/kernel/ptrace.c             |   2 +-
 arch/riscv/kernel/signal.c             |   4 +-
 arch/riscv/kernel/vector.c             |   5 +-
 arch/riscv/lib/Makefile                |   1 +
 arch/riscv/lib/xor.S                   |  81 +++++++++++
 16 files changed, 473 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
