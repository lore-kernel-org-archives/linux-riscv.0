Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC85C10DC3
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bta1Itnl574re6BCv3uvOr3OyazMocfgKXp8XEFr+uk=; b=Antj8ESQipNIfx
	bh1R6qWyXZLooHR8zQRkyjrlQscLIyydDx3O9AfqtedHPRnG7sqmtALX4CrKCIpEaQENTOgtdZA/y
	QaSpFZby0ta8ASVifoAcCoCtZQUzBVbDcUC79pVTQFDduS5hFrzdHhT5E/9eHfEj39IeKt9gEWMJw
	61oiZ36j4cLXhiTmKb82jBI6yW5HJ/iqVzF8VTW8Zh1wmL1FW6ToUcrU1HaC4BfYxbejtP8TGhijf
	IfG+cz8772EGurgoQCExclRpXnixXU7X53jnmz+la3X9HnbovjZWbBoGVIB6IykRWzKDBbMwH92V3
	J2Fj2kq+5QW9TfwtdPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq0-004VGv-2t;
	Mon, 11 Dec 2023 09:44:32 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcpy-004VG1-1d
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:44:32 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso53703491fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 01:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702287866; x=1702892666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkVX/kO8wR8tFky0mjPSXH+PwnVI8mpjAOkFM1M+MLk=;
        b=RxPdtYXI6dM9j5qguy47Jy6X/kC4V3fSf/sm0SyWMRIS4QeplRz/nbpe2lL/iqHIoA
         PcrrB8NqRd2rWqBIBSe+ntkALMQaFFA/di3G8raI2kapMcwdA2aog/aYz3PxXVR1m5cl
         weyvMZQpel2u1a/63jSEWIEI7hfTSAxUUDSasWdPjEemANrIX1+hKZbeoCBKV7hX3RJP
         gxpCQ+Zs5G3se7/pMSwRXShez3xrf4UlgO+Wt6+sQ1cn6FA/UIp9Go2KTVIybSAqusI0
         bcJy+YvP3txOe54/w5iatldlyxvcQ3os86EPBagbfmm+3LK68YK8yaBK+CnzzsI7WmqI
         syJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287866; x=1702892666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkVX/kO8wR8tFky0mjPSXH+PwnVI8mpjAOkFM1M+MLk=;
        b=TX1cI7yHecyI1hVC81fMubFh7f9B6OO1lpMp+uxzxOCrbT8+lhcDrh2CQsM+5AiuyJ
         UTP6A6aJ/riopZiMvlPlCTwvDJoZecPTq6+4PYBSznz59HFbuHuLlCz9zotM9lvAsKuo
         9BfTjRBhpF7Th0g/T1qZk8QFryw73Mi3j3yRsMuNI0nGLcj3j6DqehMb3vHKN6cu8qFV
         XpIXg2lyeaiwW79+FSUR/B3gKfqLEJGBPrQ4apy0I/wpoAKgAU1nqN6qPdC+BjNsJNp1
         aQgKr4MAsBK2zX2slp2RnvZlo8SPuoctunBOqDpQtIpoUPDhHDkk7Ah195OhlvG2NOiC
         mENw==
X-Gm-Message-State: AOJu0Ywb8DzoXPuZnIvaMKXbFpyJk7Fc69ShCMFyyfvBPcmgGQa9AP4z
	lGU5V8w7LL1HVKZL7ybJFOY=
X-Google-Smtp-Source: AGHT+IGkmBPY0oFteEOVZTgnLWZi6LGWx8KFEsiUe0UcFe5nXf/4TL7OaXO96YMN4A8p2N2hd46r7g==
X-Received: by 2002:a05:651c:b09:b0:2ca:68:acf6 with SMTP id b9-20020a05651c0b0900b002ca0068acf6mr1588150ljr.88.1702287865734;
        Mon, 11 Dec 2023 01:44:25 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm3463505edb.59.2023.12.11.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:44:25 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v2 0/4] membarrier: riscv: Core serializing command
Date: Mon, 11 Dec 2023 10:44:10 +0100
Message-Id: <20231211094414.8078-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_014430_674783_7F03477A 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

Changes since v1 ([1]):

Add patch 1/4 to resolve the "sync core" scenario reported by Mathieu
in [1] and meet the requirement of the membarrier "private expedited"
command.

Miscellaneous improvements/additions to documentation and MAINTAINERS
files.  Follow up on Mathieu's suggestion in [1] to introduce a Kconfig
/feature for the latter command (patch 4/4).

N.B.  Patch 4/4 is in RFC-mode, the plan being to submit this patch to
the various archs/doc lists (more likely, as a stand-alone patch) once
I've got some ack/positive feedback from the MEMBARRIER maintainers.

  Andrea

[1] https://lore.kernel.org/all/20231127103235.28442-1-parri.andrea@gmail.com/

Andrea Parri (4):
  membarrier: riscv: Add full memory barrier in switch_mm()
  locking: Introduce prepare_sync_core_cmd()
  membarrier: riscv: Provide core serializing command
  membarrier: Introduce Kconfig ARCH_HAS_MEMBARRIER

 .../membarrier-sync-core/arch-support.txt     | 18 ++++++-
 .../sched/membarrier/arch-support.txt         | 50 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 arch/alpha/Kconfig                            |  1 +
 arch/arc/Kconfig                              |  1 +
 arch/arm/Kconfig                              |  1 +
 arch/arm64/Kconfig                            |  1 +
 arch/hexagon/Kconfig                          |  1 +
 arch/mips/Kconfig                             |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/riscv/Kconfig                            |  5 ++
 arch/riscv/include/asm/membarrier.h           | 48 ++++++++++++++++++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++
 arch/riscv/mm/context.c                       |  2 +
 arch/s390/Kconfig                             |  1 +
 arch/sparc/Kconfig                            |  1 +
 arch/x86/Kconfig                              |  1 +
 include/linux/sync_core.h                     | 16 +++++-
 init/Kconfig                                  |  6 +++
 kernel/sched/core.c                           |  9 ++--
 kernel/sched/membarrier.c                     | 16 +++++-
 21 files changed, 204 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/features/sched/membarrier/arch-support.txt
 create mode 100644 arch/riscv/include/asm/membarrier.h
 create mode 100644 arch/riscv/include/asm/sync_core.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
