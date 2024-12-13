Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24CEE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fqSNFEQJTpGyZ7NaMMevCY0YKRlqA3EqDPbrrwo2Mzw=; b=SB0
	QUcr/+7UMBE+aDIu8bcm0Fgiit5OeestUBH2OcXoLrGJ5dxELOx5XbhYovMKpicKS/+61hQB16BBS
	m68PAr+260GLH93Y0sjCyQjFuzZxKg54RUFek7tEMUDJgaqXxkog1Hamt2sCIOTn+BZet5Pcu/x3x
	S24zXwz7egDJKqWsnu23fyn1RW5SqlRL5y9q2CFGLoQZeYHhVNJKl6QEuD8LYZD0S/ZTnTSX6IU+8
	mvs3bSnQZJUyf182n0+A6VsKixM8NdEvGI0tLGDvNRHe30kkR/TdJk2kNiyVpbnBte1s6jmLJj+vK
	/DYIm3QeNA6HxmPP13ute2EozCqkIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8eR-00000004QaH-00iA;
	Fri, 13 Dec 2024 16:36:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8eO-00000004QZv-2ANH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 16:36:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cf3e36a76so19581305ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 08:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734107783; x=1734712583; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVTI6igU8T6dL4skxylHch7ZipanOhb4/E7t8iY1Njw=;
        b=Hdsz/vhmHUYSKUMpg58wgr/NV+qL5pAz8oV/bFhaImykKi1jCMoEA8+kIui2wQzyto
         tNCQkKMC3OSyy0zKrQHgqOH0OQEVxIrp+8UazU6tfbU/UuAfeMQY7XDStIUeygofAJ7K
         8k6Z8t7pLfSGZa0FgYqwkXufr4/NdT1XhB3b/S6aABCo75Pm0pesNG3O8NrtykmUEC5F
         TpIKZU7joZRJkB1SqyGHLAGE93EXcNikFaaMQkC05YM9Z4/khTIL/qmYtm7KPNeLZnWt
         bcKLyWnTjRZxe/2jOJEXLjo6q/ro5iNHegWO0t9IqGw0KjJ1is4SoQZfO6le95YIW2Ow
         b6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107783; x=1734712583;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVTI6igU8T6dL4skxylHch7ZipanOhb4/E7t8iY1Njw=;
        b=sJZDQ/2AAKrnxZxseKbhkbxAchxI1AeT/zBUR1jttZHIEEMgj//JZxRLnfaSCgm8gW
         g4st0lR+Azcc7OXmGRplM4+Ufty0zfLigZ41i+KwhHpbQADu8S1PWf6roJYSsjVwDBck
         /sVoH+YBz8O8OAeTc+Z4y0ThDHsAKy1l/S4/76h5+eJ2WA5JF5kRow82xg4fnGx2+kRj
         VI3QJWruSJ9y5DVzunFtMtgRSIwe3yFJ6SH4XtvPI3M4cJMKpTRAmxcEVAxhw2eWJ5+T
         SI46WAXwdkAk0AlJXhcPM6kgyw5MjuTVvRhfa5SQcOey24M04lrGW+54heiZRyXbwuMp
         6Vtg==
X-Gm-Message-State: AOJu0YwUzvpSDuVa6mos1RVOWmi1pnBrJBLcBuv7pAJKqPqaEYJFetYv
	yqmZnrwtHxHJzzLJVSBH/eh4d2HeUOc+8bu6/PecfltH3hCXruHbo35aB/0Q0gB/MmTBdkMLZmr
	4
X-Gm-Gg: ASbGncsMjPLxczG1JBQflsrroAM6gcAn/qacHqhnqFKzNbZ2ao6hW55hhw+uUEOUkCf
	ITne5yLobPEmb8XP7MdLEVLv1mWiWt3thCHosEUMRtjl41IUjGXnmEXeGSqZABcovdeBO9yCmmn
	l7r7g53+IvDcizlxA6Bqnt/wGXhGSKcw7WRecv7WON/rEtjln4WDhOUe7KJS7Of6odqyq/8GbPS
	5SQV2JZAK+ZYKNCJS4ZFlyqh0i5PhjsCD19fLw+QKle3tsb7qrFu0I=
X-Google-Smtp-Source: AGHT+IHgrhZcyZQ6XsrxmSLV9cBdFXpMwXfCONCTz19YmGg/T3D8dGAPOzolX4aFTm6Bcmc0raKirA==
X-Received: by 2002:a17:902:d4c8:b0:211:8404:a957 with SMTP id d9443c01a7336-21892a3fc7fmr48954265ad.41.1734107782899;
        Fri, 13 Dec 2024 08:36:22 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21634f24f78sm103353275ad.32.2024.12.13.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:36:22 -0800 (PST)
Date: Fri, 13 Dec 2024 08:36:22 -0800 (PST)
X-Google-Original-Date: Fri, 13 Dec 2024 08:36:04 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.13-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d041d4cd-3e9f-4533-ac26-e0d67be93496@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_083624_757747_719B0020 
X-CRM114-Status: UNSURE (   8.20  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554091383158310526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0554091383158310526==
Content-Type: text/plain

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc3

for you to fetch changes up to 21f1b85c8912262adf51707e63614a114425eb10:

  riscv: mm: Do not call pmd dtor on vmemmap page table teardown (2024-12-11 11:44:21 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.13-rc3

* A fix to avoid taking a mutex while resolving jump_labels in the mutex
  implementation.
* A fix to avoid trying to resolve the early boot DT pointer via the
  linear map.
* A fix to avoid trying to IPI kfence TLB flushes, as kfence might flush
  with IRQs disabled.
* A fix to avoid calling PMD destructors on PMDs that were never
  constructed.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Fix wrong usage of __pa() on a fixmap address
      riscv: Fix IPIs usage in kfence_protect_page()

Björn Töpel (1):
      riscv: mm: Do not call pmd dtor on vmemmap page table teardown

Guo Ren (1):
      riscv: Fixup boot failure when CONFIG_DEBUG_RT_MUTEXES=y

 arch/riscv/include/asm/kfence.h |  4 +++-
 arch/riscv/kernel/jump_label.c  | 12 +++++++++---
 arch/riscv/kernel/setup.c       |  2 +-
 arch/riscv/mm/init.c            |  7 ++++---
 4 files changed, 17 insertions(+), 8 deletions(-)


--===============0554091383158310526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0554091383158310526==--
