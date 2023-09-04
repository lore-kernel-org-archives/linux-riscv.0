Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A54C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xVQClke/wEZtK7QXREHEFFWLt4+7e2P6ha/IOPM51MU=; b=jNh54RBhSQfmbG
	P5tch50Ccsn9wNZma1ieHcrYJjbQZWYKT6RFTHsrP+5vBuTx8+C1NomXorpB1R6tkR+ABjo0tIR4P
	VirQHiITCb0qhx7kRqgx1vUtAfvJPCPc/idJt7e+6paRGy+MleW62xDn8ezeyuMCRaLgjo9VqjI21
	t6n8wO2GzXZbgi5rVGjCucrCGpslZzLDQp9t1ia6J/GfQXNipyxb8TuHMF1P8xKsd22q5KJ8YUAL7
	R19sQDo9jZ/nHpaWewujOn2E1sR5J7wu0TicGghe5v7kbXKnHvE2I48pw0LmZ4eOTN4YeU5GUWl/U
	IwUXZramza1IQofTRVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy4-004UUD-31;
	Mon, 04 Sep 2023 17:02:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy2-004UTG-10
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bed101b70so255635766b.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846942; x=1694451742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvtj0cnF4/7q6apN5xchuP0lboqdPBkE4KC2QfSBqEI=;
        b=aO7b6BrdAjIpAPxy9QOYlJnsOuyyCpswqtLgq1EXEOeFUz6P0YqAQW4aat0PgPC3Vu
         pkot+gn4hFAf3h3FBVVoUfr7a78yMtSpIZ8VnxYWgVGDGklJr/E/5qoQycJTUFL+A39t
         H6AxpYBDBh6uQPfLpknKxWiAd4ljBHqLy23uJMq9IpF+mmAzx3r47h6NyY6yar/3bI3w
         B/MP4XFLqMEDK7nUrEumx3HekNsnGJXzUvN4DY4V+gLqlD+YhW0NTqrkWc/iG44rfXSc
         gqFelGpmiD/mnFyj4dZJLFRpeXk9Vyjdu9+l6W6kjjINuxZNOHVUAuUidlGihY5gZET9
         2rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846942; x=1694451742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvtj0cnF4/7q6apN5xchuP0lboqdPBkE4KC2QfSBqEI=;
        b=AfhEjWjSmU2YGMIKTlYKKejwP2/7NW59814+AxN/Hze6F9mQYUIQzW6zyRi9KFHhGJ
         cYWV1DlYBMRVj93JgLjeJKxqoHY/Klw2ctehtRwvpjacHcF3sSLraBvIbUAQGeRuIRR+
         ZuYXSKgNpz1AKdPyZWd1RM9Z06Sehak71nf9HWHSAaYfvkvqunF66lShOcLCSRXhDufU
         nuCfuqLmLSJjMKf0pr/0kD1x8iA+LUNLAMUvJqk2iCQCOQv2npejCXQsayjw+XjrPAJm
         pG4XcwgmirGiYbjhciofOgOHSOM5fAtPEqB+aiJNJx6w2WKpqP1Fl6b148QvKNJGmJ0m
         IpGQ==
X-Gm-Message-State: AOJu0YxcGgRjQwl0RLWcbrGxoycWZhVOYsQM7nu7O6VvAUdNmt1g/5zp
	bwtP50rFfqcQnZ5D8glVQtWksm6KorflW1lFxO+pZw==
X-Google-Smtp-Source: AGHT+IGn5JAZANlPtoxz68KQbgzYwU1SQfZRlryW9+DX0NsyUiTwdv6Ux7vYaGMUynmciDLUpiAFRQ==
X-Received: by 2002:a17:907:d690:b0:9a2:2635:dab6 with SMTP id wf16-20020a170907d69000b009a22635dab6mr8269988ejc.47.1693846942206;
        Mon, 04 Sep 2023 10:02:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060e9a00b0099cfd0b2437sm6447189ejf.99.2023.09.04.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:21 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 0/6] RISC-V: Enable cbo.zero in usermode
Date: Mon,  4 Sep 2023 19:02:21 +0200
Message-ID: <20230904170220.167816-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100226_351237_F3080F29 
X-CRM114-Status: GOOD (  14.39  )
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
 arch/riscv/kernel/sys_riscv.c                 |  46 +++--
 .../testing/selftests/riscv/hwprobe/Makefile  |   9 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 170 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 14 files changed, 287 insertions(+), 63 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
