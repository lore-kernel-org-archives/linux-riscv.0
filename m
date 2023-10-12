Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B3CCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwePD2jrZUri41DmzH2johg3L1oKWVuSa6KwBSyY5eM=; b=5Eec9pPsp2nYlw
	b43KjVHkWjmerOFRP6vR9h7LEVh7zPD4fRDdZUJgRYgyDUCATUCa+73VmxbkNSQU6pUNrDFzcHo4J
	K7xYe8P57m8vwms+XYEGe/9CMrhwWMmHRQ8Gmcq5A7wznmOJCNtqOUgntLk8J/Oho6BTq00ywrmwX
	/tNxFw9nNa/Dt87YC79tcOOwiicsjA2fQO+/aVe9xeQCdBAa90a6ZUGlrOs1xmQxTXHdrcPXajSEr
	R1Ejky4RC0keiP0FyBi9pzBxe2e3bFi4743iSQhq+3bs1ruUHG+cxdDJlBILzIT4vDA7fr1dfQulQ
	tHe9UFDYBia9pqALThbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2e-00HR6L-1l;
	Thu, 12 Oct 2023 05:15:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2b-00HR5G-2K
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bdf4752c3cso4309965ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087719; x=1697692519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYp5d01yjoieOqk/RkEsuV4xU8mIT2wOo0WVBK9XVOw=;
        b=ma3J7EPIvkuCg+93Eyo21JquKre9RpqDbhLF0x6E3+pdpydcmFPKykKNZajvljJ95D
         3QidaC/sfPDN4EhTHWS77nsXzv0TGJSO/JCU0x05fVGdecWBu25eSw57KF4+wFXIyVgB
         q5sRhWc7TMW6Jp/cYBgeG0CQ3W4c5JC7mVNf1xdv1lzgzeEc49MJ4Ju0EywYPrfNTiYr
         VkX3QtguXXqB9caQPemmqUGuXwUkXJbssPimyNnO21V/+9zcw2p4d5BUHm6AFOMmmtiy
         PQOr4/CXLtDysvVB3lvxDPxmQyQjoWcvUJ0bAvlUML0ZOdo4/qRxtcR96qQwdJWC6g+i
         PNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087719; x=1697692519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYp5d01yjoieOqk/RkEsuV4xU8mIT2wOo0WVBK9XVOw=;
        b=H36phSTGc+QhDOtrG0siKscH/QbRo9otoEw651ehn0Zn9/QvWzfpgw1gSZ4rkTgr3y
         3ZhSh/n2euxqmmYihZVoUCSzt8eHdKBu0jbQTftajmi6uzZwUPEbcERd6JLisxLHaJwl
         l7Ws5x5gZo1Qbpkmsukvf7MPJSy9ZsaxvksyKllgnxd2M6pvllEuatEjLioak8ly1G7X
         0E5pQ0DJjoHCw7uJv5Q08Xv7LBid0DVfaXGJv2JZkPP0ayDZsJ3md5QpKs6FAn4Qbf7o
         NyZTj85pCkAw6LVde3q80cjJl8n+vTY7sQzOtZT/C8UclNXaSeW23Kc4fVyji2hLvN6h
         pYEQ==
X-Gm-Message-State: AOJu0YwmRBEqorOa2GJpsju/HiwUfrbP7t0UusxhvIb6oH+WblIJL/YG
	NoN2qq9ibOBPkIuY4XR6JrXejA==
X-Google-Smtp-Source: AGHT+IHEPFFUqt3pliIbieg/aaMtAbi3pZkt/8nzFWa9PAcsbNguDQ6TUJOXLaRnVEd017jWXQ44gg==
X-Received: by 2002:a17:902:e888:b0:1c7:37e2:13fe with SMTP id w8-20020a170902e88800b001c737e213femr22891127plg.2.1697087719126;
        Wed, 11 Oct 2023 22:15:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:18 -0700 (PDT)
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
Subject: [PATCH v2 0/8] RISC-V SBI debug console extension support
Date: Thu, 12 Oct 2023 10:45:01 +0530
Message-Id: <20231012051509.738750-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221521_761459_8065D915 
X-CRM114-Status: GOOD (  11.09  )
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

These patches can also be found in the riscv_sbi_dbcn_v2 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (7):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Allow some SBI extensions to be disabled by default
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  RISC-V: Add inline version of sbi_console_putchar/getchar() functions
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h   |  7 ++-
 arch/riscv/include/asm/sbi.h            | 12 ++++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/vcpu.c                   |  6 ++
 arch/riscv/kvm/vcpu_sbi.c               | 49 +++++++++-------
 arch/riscv/kvm/vcpu_sbi_replace.c       | 32 +++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 76 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++--
 12 files changed, 188 insertions(+), 33 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
