Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C479C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vG+NGTiHjNJtM4MBriTD9gCs2umTuoBUz3B4IUx19G4=; b=bNnB/X9FHhmO0y
	WU2Khg/uAp63Tx9jlHmtAz0f1giU8gtGDNqG0TTCH/wzFGhHxh1jpuPLm9bklS2/rXc0mJUI2sCmx
	fwXO8oiEqO8yZ2NSXvQXYVfNM7QJuqvUj5mmukUfveRwbtlpa+YTLEEfpc4JlJfcQ/GX/i34qIFKm
	Xiil6lorf6rLiMDWeqshqTn27SVu4LQpONXFSFX3ow9ZyPc+3y4efKo84J+I2bdITwTp2tRS30pKy
	Ko/ZtodKkznzZjxfkTqhhzg/XpWLFhF1mVSi3ZOsHX8bHGh/YxCCSwgSWKOwMwn+uWB/WzNi6gbrO
	faEOIGbSc82+gs2yfZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOH-00DsVz-2f;
	Wed, 30 Aug 2023 16:50:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOE-00DsUZ-0i
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:49:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fee8af9cb9so55015775e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414196; x=1694018996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDcve8WpWouY0SnV3R/bbuzOsHZG7xEPcnn12ok2Ayw=;
        b=coJWrLtemnt6V7VUOGwuvkKf500pWgWe/KvdIAZ80qTfpE36T1sItoiNFHCDpXdDA7
         lIYnTrOWgJFl3Pn18ce0x+QS777Z5AgMgbVFDynGvINlj+5xVqg4OqgBTuUDCKtDOxtG
         FlVy7WFog0qds7yI5eGThVyIw3C1hCVMTmguQvmCRIbW13gzeDRhtuciiCXVtmIrAWnQ
         q2Bf5N7SBIIcpJxndI1Ge7HYvBh/OBXabucj3b2RrAHAcHj+xXQMpasUoVCOzplL7LH5
         ZPsRbltqwTk0DuExq97qr2c30LugmlF21E2AE+nTQpWejW5ab/GZ3CjDbLTusaQec7y2
         ooyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414196; x=1694018996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDcve8WpWouY0SnV3R/bbuzOsHZG7xEPcnn12ok2Ayw=;
        b=LIx3G9CN5znLxsBboMzhxO/sFX4OgUZ+4fPGl0b0a17/khmtv++vdcqFGjGnvvXfn7
         5oK0LRrjWoHiN3n+orO1qZK+exz+qD1Yc7DDqYczQS0SLgMNY2lD4FkeYc947zy+VVG7
         e7sRPhiIx5FCS34YzbZ/cfg0LGp130n1QHG3qtZZ1o52UnRP2TUtfkvcLa5dhBb5UB0F
         uJoODmAPw+XaKin++jDsO3arwXuniW5I1ClC7zleY8gICG7eeNxfn16C2d1e8lk0cRjF
         ww0xXrYJz7aZkQXOrH1e+5OFjFDIyv7smzHKNTdqHhARTYYMa2D7ZPXLWdvsj5XiOcJR
         DH2g==
X-Gm-Message-State: AOJu0YxS1btLyDSI7hAF3vgIr+dv3/YCePbVK9c2PY8jT7F5Rnk3Y1/B
	C2mwkETgDkr6xFk2abvxPa6tcPR/O0C+78HShTET0w==
X-Google-Smtp-Source: AGHT+IFlPl8Eby2HJntmRXWAZJFErD+Sq4oouXyarFpKSC/0SRX8YToq2U/cYGgxGQ1bcSMY8wZ+4Q==
X-Received: by 2002:a05:600c:234a:b0:401:23fc:1f92 with SMTP id 10-20020a05600c234a00b0040123fc1f92mr2477430wmq.25.1693414196071;
        Wed, 30 Aug 2023 09:49:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c22d900b00401e32b25adsm2804745wmg.4.2023.08.30.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:49:55 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 0/6] RISC-V: Enable cbo.zero in usermode
Date: Wed, 30 Aug 2023 18:49:55 +0200
Message-ID: <20230830164954.91987-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_094958_264707_9B69272C 
X-CRM114-Status: GOOD (  11.41  )
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
 arch/riscv/include/asm/cpufeature.h           |   2 +
 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/hwcap.h                |  16 ++
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/cpufeature.c                |  10 +-
 arch/riscv/kernel/setup.c                     |   4 +
 arch/riscv/kernel/smpboot.c                   |   4 +
 arch/riscv/kernel/sys_riscv.c                 |  46 +++--
 .../testing/selftests/riscv/hwprobe/Makefile  |   9 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 14 files changed, 280 insertions(+), 63 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
