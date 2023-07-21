Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9E5EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6cAjabMNuq8f6B4gXbRH82yKVYZSOLpNap8xlqIJXf4=; b=Qw6QGhdRzY79ev
	XgwPRBHJcOyOC7CRPZ2X4tFeOcbTGrsb4Jbei/eGfzeHhuAnc12LPh0cR7O2X4xAgcbd9lUAjP20q
	B5NfO/MuNC4b8Xh6Qc9opbjJzjSuytSZTOzRVYUjc8LtXwv4Yj4DPhI1UmW9Hke/Wgnin8QqhDd8F
	4pr2uZ31k+AELBiYqpRQ9CFceKtwoLylZZ561A335Q6zreF6XBcEzymGnSLGcZmYoEri/AamhPzEJ
	BZ+STsKBqI3P394vT37B2gQtKJ3QxhGH0dNYWSm8fNIXo7HzzPqdxYwNkii/MW9ntCg6m7xQ/jATD
	DP4u5wwPJ5p4Sq7C4swA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoJo-00DvaR-2K;
	Fri, 21 Jul 2023 11:29:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoJl-00DvZy-08
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:29:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26586e824e7so941165a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689938943; x=1690543743;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRvchJcKBT7rWCNZJqvc7IJFWKpiqU9X5OFzfWSjx/c=;
        b=Qj7QEUxjp+4exajoBkKmsFYl0ih23Rz7S7AWAl4rUfSb6w6tuGP0lpyioWxMzv/tSm
         ZyUdtjE6FrLGsB+MtChN11TnemA0CLcNGAf5nePkZVHKNLSXynu4MxlxKEWD60POwidw
         MPsTlFpv3zFMnTPTR35pXEv+Nkrhbmey1Pc21vOY9SuLVSQ6T3oImaYnI0DjjF8a8149
         mvdAQH3s+XDhBZalFnKRKZJ3v7TaHmRUzVnZM0hYRwwyGD4qQ6mxkV0DIrqBOYELH8ae
         YIAWTb8Q0LrDBFWz7KLGcus3+twG7cf9vWCw3AheEiSeJXOKNW5v4Xxts70k7rdJnvP9
         NdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689938943; x=1690543743;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRvchJcKBT7rWCNZJqvc7IJFWKpiqU9X5OFzfWSjx/c=;
        b=iIoWtId0gxVn35F/WdE70ReCd9Hu8mjXJWARuOFDi+wR3ExWAr0JlKrampUMRcusKR
         fuAv+N0bjLRdpQHl0W6fYbEiDRTAPivihyivqjQlnx1hUj7Dn4dd/yyHj7KA4NiZHkLw
         z5spBDPUkFDZhh7ZGi1NgfMuYdyFqJZ2TE9pVWG6fT7EqtkIjEEMpAIOoabxKQliLKqq
         Tf1eImQoL18I66CJB3qLLPtwkVEHWbqIMPkdPA51W32SpF49QjJZauZWC8AcwK+OCuKB
         5mQr6lycD8JEeqCH6L6vr+gtqLjJLHH5KJBewQpRgQK81CPPXAr9wb2wwAvbjniammsy
         XzPg==
X-Gm-Message-State: ABy/qLZBkzQyT1qXKvYzZ5gJyb5evoZ6HN4qKoyytE9j4m2+FvOp/KZH
	1mAaBDw6fWieE7sUo508LhxFYTIcTBStmdtahX0UzKDBqqHFumNwEwloyZMPHsOelsw9QTuOuLv
	utnny3qUzRM3lypKbfJcwb9G+5OdcRuYYQILXpDwi1dZBC/HG031I7tZExdog8C+YMN1n8ykXSw
	9+6wvT0MoRyv4/
X-Google-Smtp-Source: APBJJlGEg5M44Nw1H4K/bYZbIDpZM5hfUzjaNoRKui9ccMtafXopbeA6o00vdOzr6CFCfFIg8tLOUg==
X-Received: by 2002:a17:90a:138f:b0:265:7719:b849 with SMTP id i15-20020a17090a138f00b002657719b849mr1040284pja.41.1689938942491;
        Fri, 21 Jul 2023 04:29:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8953365aesm3243121plh.22.2023.07.21.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:29:01 -0700 (PDT)
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
Subject: [v2, 0/5] riscv: support kernel-mode Vector
Date: Fri, 21 Jul 2023 11:28:50 +0000
Message-Id: <20230721112855.1006-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_042905_145578_004A0294 
X-CRM114-Status: GOOD (  17.00  )
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
modifications. At the end of the series, patch 4, 5 add supports for
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

Updated patches: 1, 2, 3, 4, 5
New patches: -
Unchanged patches: -
Deleted patches: 6 (moved to 5)

Changelog v2:
 - fix build issues
 - Follow arm's way of starting kernel-mode simd code:
   - add include/asm/simd.h and rename may_use_vector() ->
     may_use_simd()
   - return void in kernel_vector_begin(), and BUG_ON if may_use_simd()
     fails
 - Change naming scheme for functions/macros (Conor):
   - remove KMV
   - 's/rvv/vector/'
   - 's/RISCV_ISA_V_PREEMPTIVE_KMV/RISCV_ISA_V_PREEMPTIVE/'
   - 's/TIF_RISCV_V_KMV/TIF_RISCV_V_KERNEL_MODE/'

Changes from the vector v12 series (for patch 2, 3):
 - return a failure code when kernel_vector_begin() fails.
 - Do not immediately restore user's V context.

Andy Chiu (3):
  riscv: sched: defer restoring Vector context for user
  riscv: vector: do not pass task_struct into
    riscv_v_vstate_{save,restore}()
  riscv: vector: allow kernel-mode Vector with preemption

Greentime Hu (2):
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation

 arch/riscv/Kconfig                     |  10 ++
 arch/riscv/include/asm/entry-common.h  |  13 +++
 arch/riscv/include/asm/processor.h     |   2 +
 arch/riscv/include/asm/simd.h          |  52 +++++++++
 arch/riscv/include/asm/thread_info.h   |   6 +
 arch/riscv/include/asm/vector.h        |  50 +++++++--
 arch/riscv/include/asm/xor.h           |  82 ++++++++++++++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/asm-offsets.c        |   2 +
 arch/riscv/kernel/entry.S              |  45 ++++++++
 arch/riscv/kernel/kernel_mode_vector.c | 146 +++++++++++++++++++++++++
 arch/riscv/kernel/process.c            |  10 +-
 arch/riscv/kernel/ptrace.c             |   2 +-
 arch/riscv/kernel/signal.c             |   4 +-
 arch/riscv/kernel/vector.c             |   5 +-
 arch/riscv/lib/Makefile                |   1 +
 arch/riscv/lib/xor.S                   |  81 ++++++++++++++
 17 files changed, 495 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/include/asm/simd.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
