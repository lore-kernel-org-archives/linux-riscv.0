Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B893C282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 17:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4912A2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 17:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZWDq/00H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="a5OALG2z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4912A2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ihx8wYGt/IZHaa4IMhMGW/YTGlqCKdG5uJYACMcBwjY=; b=ZWDq/00HrDEN0n
	I1q33yFcq8EvZtwDmFE3lBI5DLff3AUa0HOMRNsOQOkRuokHEKozK+z4IpMQKTtiN+hI2cSBPn9Q3
	bm/PmMB5iiL8hp23E4jGUXjgjmATY3KGECrtcLhw5G+STqBAvVAhLqQ1Pbj2vSWs/SZYCG54sfqu7
	cUx+PgBV9Wubx0PLzszeVz/RPiTQwBEXtJTe7U0bRRB4HZl8mb0F6VL0ZabGW7jauhvX+UFJ5f13s
	qYaO281Rn8c5FOs1eoOU4woBfkpXCKNnwKqYm6RZcoWEJsTbJLKqfErDO5KU/TJUHbOhZEKWPUwx1
	9Qah/820egO16F+W3QBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gou2n-0005tB-2w; Wed, 30 Jan 2019 17:53:01 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gou2l-0005sq-8S
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 17:53:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id 101so155797pld.6
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jan 2019 09:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=eA6w2DJkuoLkX3yICHnRN/pQE/wdeda+obKOC24tPDs=;
 b=a5OALG2zavnWDeC7xn+T8vRcfa0XgLre7kC5AkbtPRG+/PPorC+O+iQas6OGt19ID4
 tcmIONBLR3ghcxnfcKpnV4EqhPEIL3HjCmVnJwXTiISu9iBVVlyP7Xs1n0RyZWXUnbq/
 tUYT4a2jhObabSKPQBN1OzDsQK7cms0863ePqKSpcM6gZkqEGDTvLyZ7/BcgCKwayh/1
 ECKfX2kAFAXHnPNc8ol9smvLsfHyxAqkTpGIPlYrwVoesbiMopS/JY50G4/mAIcG4OFJ
 SwcR5tqN1z407DD3MK4qJBgtciv7azEBxm4hWsmV3IGiP1duSeKca6TSNNMT+PNr69Lk
 WrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=eA6w2DJkuoLkX3yICHnRN/pQE/wdeda+obKOC24tPDs=;
 b=KVb0Zvf/nzafJvZulbEjCyqTszHbnWhkflxYm2ARcBS5kCw5P2rz71KAGcQKB0FQF0
 SOonYPLd0uTtOvTz4njqS1TDCLuZKKR/BJCHLCk5UqZBtxgFpZohse3Sx9ON0xcY6x3E
 WKNKPRfa4H/9y9TnWDDIhezIDtMuAg+/8laMPqOro18DVhrJVM3LvrwEwYD24eTI9psq
 bsmKD2Wjiy4RkxPkAJcU2HIz/oGCBZQUw8Mk0EWQpLHYxylvj93jx/OUeauOM6CV5R2Q
 5h4ERoHVMPmOn8CDh9/MXr10MuntfONKdwbInBZIk8TmlwVTYVbZb/w8Vzb6Lt43VTnC
 bClQ==
X-Gm-Message-State: AJcUukdfBbmlNTwEU0qzh4X9yw0xrUIXW7fOP2xTgi0db1VaOK2+kNYD
 XGOAlnowrMprbS28Ngwjr7KRvRIp+LY=
X-Google-Smtp-Source: ALg8bN4tagx0X0rjT6cipp7+Sd5ZGJD/A2I4xHn3t1DFvf1u0SEll7GgtiBF4DWLXzL5JTSPjx+obQ==
X-Received: by 2002:a17:902:29ab:: with SMTP id
 h40mr31131168plb.238.1548870777864; 
 Wed, 30 Jan 2019 09:52:57 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a10sm2713164pfi.138.2019.01.30.09.52.56
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jan 2019 09:52:57 -0800 (PST)
Date: Wed, 30 Jan 2019 09:52:57 -0800 (PST)
X-Google-Original-Date: Wed, 30 Jan 2019 09:52:55 PST (-0800)
Subject: [PULL RFC] RISC-V Fixes for 5.0-rc5
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-643a7b93-4b7b-48cc-ac3b-618137fc32d4@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_095259_301744_FB6067FC 
X-CRM114-Status: GOOD (  11.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 49a57857aeea06ca831043acbb0fa5e0f50602fd:

  Linux 5.0-rc3 (2019-01-21 13:14:44 +1300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.0-rc5

for you to fetch changes up to ae662eec8a515ab550524e04c793b5ddf1aae3a1:

  riscv: Adjust mmap base address at a third of task size (2019-01-25 10:50:53 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.0-rc5

This patch set contains a handful of mostly-independent patches:

* A patch that causes our port to respect TIF_NEED_RESCHED, which fixes
  CONFIG_PREEMPT=y kernels.
* A fix to avoid double-put on OF nodes.
* Fix a misspelling of target in our Kconfig.
* Generic PCIe is enabled in our defconfig.
* A fix to our SBI early console to properly handle line endings.
* A fix such that max_low_pfn is counted in PFNs.
* A change to TASK_UNMAPPED_BASE to match what other arches do.

This has passed by standard "boot Fedora" flow.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Adjust mmap base address at a third of task size

Alistair Francis (1):
      RISC-V: defconfig: Enable Generic PCIE by default

Andreas Schwab (2):
      RISC-V: fix bad use of of_node_put
      tty/serial: use uart_console_write in the RISC-V SBL early console

Antony Pavlov (2):
      RISC-V: asm/page.h: fix spelling mistake "CONFIG_64BITS" -> "CONFIG_64BIT"
      RISC-V: Kconfig: fix spelling mistake "traget" -> "target"

Guo Ren (1):
      riscv: fixup max_low_pfn with PFN_DOWN.

Palmer Dabbelt (2):
      RISC-V: defconfig: Move CONFIG_PCI{,E_XILINX}
      RISC-V: defconfig: Add CRYPTO_DEV_VIRTIO=y

Vincent Chen (1):
      RISC-V: Add _TIF_NEED_RESCHED check for kernel thread when CONFIG_PREEMPT=y

 arch/riscv/Kconfig                      |  2 +-
 arch/riscv/configs/defconfig            |  8 +++++---
 arch/riscv/include/asm/page.h           |  2 +-
 arch/riscv/include/asm/processor.h      |  2 +-
 arch/riscv/kernel/asm-offsets.c         |  1 +
 arch/riscv/kernel/entry.S               | 18 +++++++++++++++++-
 arch/riscv/kernel/setup.c               |  2 +-
 arch/riscv/kernel/smpboot.c             |  6 +-----
 arch/riscv/mm/init.c                    |  3 ++-
 drivers/tty/serial/earlycon-riscv-sbi.c | 13 ++++++++-----
 10 files changed, 38 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
