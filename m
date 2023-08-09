Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F52C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8jY8zQ/mXy8LFhPsbou5UmNcYF+QdzJq18zeh/c7b/E=; b=jmPzInayWyCess
	p4QvBOh9pvjelkHS9KHdkd1GRbMPd/B0nETFEpkhY3NNeJ9FXXtdf6n9RTd7Bp6kqIR/56L+q8qzF
	sik5AukFIIwJw7Hiro2wfSbYRrlnvIWDzW6xUJC3ETNyv+CAYO2zPER+QrM8tnX0/fdZtSdjrp8AY
	nJLMKr7mq3Bh4J2fDc9Cxv/Sqf2k1SoRmm85VVq6rR5KY6Gv6eXLwKczEGgFn7Xr6EMeft36fQ73t
	xKNnJ6Y2SMCnRmgHuWi46Ul8L9TOIWIhZn0Sgdrnhmea5c2QwCjK5vQZrnjfkThIGAn2l+vOmMMkn
	1i4DRgfTAF/T6lFmS5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThme-004paE-1f;
	Wed, 09 Aug 2023 11:55:24 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmb-004pYB-0r
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:22 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b962c226ceso106821811fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582118; x=1692186918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFCO8rRVW0eo1X2MXfcemMFxxGXbniYC365Pku+GYYA=;
        b=ki3mJlRpT4/xDkByyM4hgAbzvRDHPsfzbIiQLF8u4QnAa+cpnuYx6q1w9K48MswlT+
         562ChP/JkV9KS9Lo3JfadQy8QBr/lNfB3h9BLJOQCdaGUcYZrQFt0DqdvWE/iUXzoWTZ
         5zCA03BQ9q+xWffSjsRLjhZd2wxvCazYcFP0BtFrInSBzN9lxFWJQaz7vzXGqUdQeHJI
         G3n9ZOynGiexwVJWRx5VCD4/S0sKN/4tGXctmpOTXHstJI3Vx0DqkR8GkjFQWrM4QJ3Z
         IgtJYf859Wbf6z7Ht4LG7oF9OfJ6yswwaCfaCeZJ8XQSoN9X4krzg52cY5dvb1JgdpCe
         bXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582118; x=1692186918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFCO8rRVW0eo1X2MXfcemMFxxGXbniYC365Pku+GYYA=;
        b=FJICgmX3w5SlY1VAQ7jUSdVsUH1/ygkUc7wjTLhJjIVbxJiJnaJILJoon25yJJX+95
         5bxji7jonOlVBVop+VUEG7/HN2OYl0CbNBQ7P9Obzz1YiWWD98Ri27ZbIUII1edwnZOq
         RcS1Cs+DSG+ta2FXRqCQTaceN4IgvKXyQMfr3IZu8K80DXxcu4DKzWuR7OEUnpWJ5vk7
         6scm2T71d6/Dze0iDK7k5ZCtSNFA8EqFhcgxaqN3+XKNTgJEjXIiVyIxUjaBM/OmMWfW
         42YfAQk3uAEQrxINIySu6v+0Zp7/40oSVgwTzAdFcXyWJyDgWQ1IQD0cNAejEEZkpGFy
         Z2kw==
X-Gm-Message-State: AOJu0Yxi887gFZo1MzrdUdswFGx4sjQga3AdJfMYdVANFppcCn2F+pUg
	eSoQ6QiijL758zcS8AQki3viDcEaGAdQt/gFn7IdX+ZP
X-Google-Smtp-Source: AGHT+IGWzQn7T/1R1LDx3VkUCDdwqFmFgp2L5CcKLxhs3Y2V3KU58gT2pxgn8oh0TMwc1gadVEkR5w==
X-Received: by 2002:a2e:b6c6:0:b0:2b7:364e:91ec with SMTP id m6-20020a2eb6c6000000b002b7364e91ecmr1621518ljo.13.1691582117845;
        Wed, 09 Aug 2023 04:55:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d11-20020a170906c20b00b00992d70f8078sm7954741ejz.106.2023.08.09.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:17 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 0/6] RISC-V: Enable cbo.zero in usermode
Date: Wed,  9 Aug 2023 13:55:17 +0200
Message-ID: <20230809115516.214537-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045521_332000_54BFF359 
X-CRM114-Status: GOOD (  10.72  )
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
 arch/riscv/kernel/sys_riscv.c                 |  41 +++--
 tools/testing/selftests/riscv/Makefile        |   2 +-
 .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 160 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +++----
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 15 files changed, 272 insertions(+), 64 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
