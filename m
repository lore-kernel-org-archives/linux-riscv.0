Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD28CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Dan7FSk73FDZNegzX896pTOv/VYzxduCTst7/u/bF4=; b=HEjdw3KtlmBxT+
	6BqCv1Iv4AjYjuZ8T2C99uavy/DMmbn/vVEmK+zexOU36BimITutwC7aJVdYVN64tK09ApbyGFLHA
	dnEkvosqAHslnsuIHuSTdqZQ62WXk+WwlhkhW5oweNL/v18mZfakWJIWf5xxLsNbxUI2yvsmEJQpW
	5zpgqv3jRCk9ioESYLNHvp392i4xCDf/8HjpTd7fsByCAhpBK7cPTCN5tprm/bLOm+aQu+BzxBLaq
	ntxjHQWeZwor0dAZfrJ1mnS8RpGc6gDhrk1cIngRKlJEevr92dc6CBaVaDWVGA+L3sAmvrw+Scsrn
	zG5r4JHb/V0OjQqo0UPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE61-00FVjN-0k;
	Mon, 18 Sep 2023 13:15:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE5x-00FViF-2t
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99de884ad25so599671466b.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042920; x=1695647720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IoM8SL5bVMogPVEWihROgBfXHzD3pCXHhk7dlrYyvg=;
        b=GREbzwcoVUoAeVf+AoUgGjUmsVVCDHMEwbtDahtO89tu+9qISuSXJiFsKdz37Y4rKV
         fasT9DC12kxdkSiTdHe3w1sVqdpNLz+UcYO4fHnptNL3l+Nfm+cDNb3HaXpweYfvyXkF
         xari5f1YB7bfPvF20IR+uMYt/GiyhKcHK4FP2cSnfzztiLh5L9Ktr3TgvdCIyUdDCTZ9
         H+pLq1HNAK0MLHJ/aNHcGx61KrCQ3JaTDbpavUs5hLRs9kEdaZjPf/HnOPuFgNP89uv9
         V8nlPBHMN0JIgi3wMTR3aJW6MD5P57w+F5cEf7hdMzwHYIyCmi+TMKswcYebPGZdmAEu
         GQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042920; x=1695647720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IoM8SL5bVMogPVEWihROgBfXHzD3pCXHhk7dlrYyvg=;
        b=HatZVAaaCMepLbvtY5U19hyG4p6c61IxFD25cQKM1o+dz7KWV12cVO2sYxwT4Pgeah
         WmhpSepF2v6cLzuCcqdh0Ork3ffWiYKP/TJBHtI5kjVd7dhTOTqCOYk3S6DelKe+vAM9
         vUfLLOHPld7OCNWtMzGcp793nXfbbDMTn5u738kpzgsCbOWCjEl0qcSiLkqV25AABepZ
         gDxERyeWqrlJXYbFYVFUfxJ4Jrwp1qfbBALgHMrJibAtGIRj7VUkTo3sTbC7+szlUEI9
         jcOHj+i1rO3xVippWr8UOYgrbRsyxlC2GV5557kPnlSHgb6oiJNLRDCo64fu3vcfVPdA
         ytLw==
X-Gm-Message-State: AOJu0YyGEwYhnxDxpnPy+SxgkBTTXf0y68Iz7/WJ7J5SlMgEqtriVhid
	PkSDGjT894GyOwNQObd5R977XblDzeXixq3P/WA=
X-Google-Smtp-Source: AGHT+IFH0TT8kGJk4J4F00oTxKwS1KTFXmv57CWpEbYe0E1VcArjViUWpbs/b0AML74ZTwtZtu+vtA==
X-Received: by 2002:a17:906:150:b0:9a5:cab0:b061 with SMTP id 16-20020a170906015000b009a5cab0b061mr7861647ejh.51.1695042919812;
        Mon, 18 Sep 2023 06:15:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0099bd453357esm6423273ejb.41.2023.09.18.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 0/6] RISC-V: Enable cbo.zero in usermode
Date: Mon, 18 Sep 2023 15:15:19 +0200
Message-ID: <20230918131518.56803-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061521_931995_DD36EF89 
X-CRM114-Status: GOOD (  14.93  )
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

In order for usermode to issue cbo.zero, it needs privilege granted to
issue the extension instruction (patch 2) and to know that the extension
is available and its block size (patch 3). Patch 1 could be separate from
this series (it just fixes up some error messages), patches 4-5 convert
the hwprobe selftest to a statically-linked, TAP test and patch 6 adds a
new hwprobe test for the new information as well as testing CBO
instructions can or cannot be issued as appropriate.

Thanks,
drew

v4:
  - All changes are in the last patch, the CBO selftest.
    - Ensure instruction encoding is LE [Xiao]
    - When Zicboz is reported not present, make sure none of the harts
      report it present [Xiao]
    - Only test for SIGILL when '--sigill' is given on the command line
      since not all platforms will issue sigill [Palmer]
    - Use hwprobe's 3rd argument, "cpu_count", properly. It's not
      CPU_COUNT, it's "cpusetsize"
    - Code organization changes

v3:
  - rebased on for-next
  - Explained the use of CONFIG_RISCV_ALTERNATIVE in the commit message
    for patch 2
  - fixed a copy+paste error in the cbo selftest [Xiao]
  - while touching the cbo selftest improved its readability with a
    MK_CBO() macro and now skip the cbo.zero test if we see the first
    try is an illegal instruction
  - picked up a few r-b's

v2:
  - fixed build of the vector selftest
  - changed this-cpu wrappers to just cpu wrappers and then pass
    smp_processor_id() at the callsite
  - added comment to EXT_KEY macro
  - picked up a couple r-b's


Andrew Jones (6):
  RISC-V: Make zicbom/zicboz errors consistent
  RISC-V: Enable cbo.zero in usermode
  RISC-V: hwprobe: Expose Zicboz extension and its block size
  RISC-V: selftests: Statically link hwprobe test
  RISC-V: selftests: Convert hwprobe test to kselftest API
  RISC-V: selftests: Add CBO tests

 Documentation/riscv/hwprobe.rst               |   6 +
 arch/riscv/include/asm/cpufeature.h           |   1 +
 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/hwcap.h                |  16 ++
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/cpufeature.c                |  10 +-
 arch/riscv/kernel/setup.c                     |   4 +
 arch/riscv/kernel/smpboot.c                   |   4 +
 arch/riscv/kernel/sys_riscv.c                 |  46 ++--
 .../testing/selftests/riscv/hwprobe/Makefile  |   9 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 228 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 ++---
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 14 files changed, 345 insertions(+), 63 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
