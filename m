Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84AFC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WzpU5QE2pUbrcfg9xviwgxWTCTTQQ/vitgr99mDCDZU=; b=hWlP9yoXEQyff8
	lNsjZd1IEEl4mnFbKr54TK3WMP8qfQ41AvHJyVXjwYuKRDx8la2CXVDgVSkWaxklSUqejCHrwTixq
	Dhp7H+hv1NRI1xP6rmyqU8p7JIoyHceHqlAYWmlaXWPxn/CwFxKgayb8/PZ6k4GegpXd3Ox//ugUt
	kyxLdtWhwcb6c5dt3hto5OWLlUOOvzsq4wXviBOJELBPRAbMmwwWsqDQPXjAavamx3wDnTbhcjkJu
	YdvVv/6rQlHCQNv2Xp2s1LXlm5zM9vVQpqocr+w6pYMuThapAB43H7yUkPNRcZtK4DrlvSlMliegs
	VFUb/7P2RrB1MZpFv8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpT-001Q2j-0M;
	Fri, 20 Oct 2023 07:21:55 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpP-001Q1W-23
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:21:53 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6ce2cc39d12so339068a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786510; x=1698391310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbaUx5tgc13C+fDPGJz++EpIqc5R/EjgaTQRdQ/gzH0=;
        b=aenXXKi8yn5XtHqpGt8PFMD0QrOQNp6CslwvFuzDS06zrGoePo3F+NjauiTM7uVYBu
         WxyrxM9mzroYmT0VjfFepxiy8kOCbEpNTnjCIfnhd+pLh1i/k3TS/FJm5O/8lC9Ytqx8
         ZZrV8FpjAO2v4k1xDsyRza3UKxX5NAoo9Pj4uMv+5yBN895jSPyCd+0GhjomcMrekl/E
         MMHx2mo6PqsraYOGVKTqAvXx6iZ0nbTH9dayzgABpyNCzQ5yt9jXFkCwIXiExu9Wyhfv
         FQ4tlrfBnoVysKS6P53Wz8NnCqsZYlB5ByiSPxgIkFJGtot93JcQfachELy5CQO0NXF3
         67Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786510; x=1698391310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbaUx5tgc13C+fDPGJz++EpIqc5R/EjgaTQRdQ/gzH0=;
        b=LIpQ72ACg6zrhfCR1yhEp8bR6il3g4pgrW30G0cpZ6hxNAGZtZCimapafNKEAeNNZU
         W+0C+a3MzPsf6OBx6VvigPRif801NxMpfNmqmCUAbfZdt75axD1E9chTrlvyo99kCKys
         wLjWWc1jpIDWP0QYamHXnq/Ws0rwCt3qVlThLtQW2JsvNirk3qzB/YM8WDc79Y2G3zF0
         NKKckcAahT82T/gEw7NERahqbv4Sjiz6hdPYPmSqVnoCNDCOrV3ZdJMOLlujXHUZrfVr
         PVPff6+zuGjAQD2wUEdqDWQ+vlsdYLhtFWg8JMO8sj9DHL8EuqgbR9RSDO2C+T18Zyeo
         v9jQ==
X-Gm-Message-State: AOJu0YzLHAnqlwRVhHMkvJFpQqDqGEC2dZhjC6y88cTQsboD+7tmg/w4
	U3igjaFbVqwMToOm9/m8HKBhUw==
X-Google-Smtp-Source: AGHT+IGd8XOYNX5Cl6NNnHjukDwjUbSrOdVya8xac9O1HehPftFC2/Zt55vtSezxHy+OiVL/3DWrYQ==
X-Received: by 2002:a05:6358:5927:b0:168:a3b2:945a with SMTP id g39-20020a056358592700b00168a3b2945amr1087904rwf.0.1697786509722;
        Fri, 20 Oct 2023 00:21:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/9] RISC-V SBI debug console extension support
Date: Fri, 20 Oct 2023 12:51:31 +0530
Message-Id: <20231020072140.900967-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002151_679544_CB8B7FBB 
X-CRM114-Status: GOOD (  12.89  )
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

The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
functions sbi_console_putchar() and sbi_console_getchar().
(Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)

This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased on Linux-6.6-rc5
 - Handled page-crossing in PATCH7 of v2 series
 - Addressed Drew's comment in PATCH3 of v2 series
 - Added new PATCH5 to make get-reg-list test aware of SBI DBCN extension

Changes since v1:
 - Remove use of #ifdef from PATCH4 and PATCH5 of the v1 series
 - Improved commit description of PATCH3 in v1 series
 - Introduced new PATCH3 in this series to allow some SBI extensions
   (such as SBI DBCN) do to disabled by default so that older KVM user space
   work fine and newer KVM user space have to explicitly opt-in for emulating
   SBI DBCN.
 - Introduced new PATCH5 in this series which adds inline version of
   sbi_console_getchar() and sbi_console_putchar() for the case where
   CONFIG_RISCV_SBI_V01 is disabled.

Anup Patel (8):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Allow some SBI extensions to be disabled by default
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
  RISC-V: Add stubs for sbi_console_putchar/getchar()
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig                  |  1 +
 arch/riscv/configs/rv32_defconfig             |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  7 +-
 arch/riscv/include/asm/sbi.h                  | 12 +++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/vcpu.c                         |  6 ++
 arch/riscv/kvm/vcpu_sbi.c                     | 61 +++++++-------
 arch/riscv/kvm/vcpu_sbi_replace.c             | 32 ++++++++
 drivers/tty/hvc/Kconfig                       |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c               | 82 +++++++++++++++++--
 drivers/tty/serial/Kconfig                    |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c       | 32 +++++++-
 .../selftests/kvm/riscv/get-reg-list.c        |  2 +
 13 files changed, 198 insertions(+), 43 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
