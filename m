Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wFVzxzSFi9AGK7rVAg9fS8bt+eLmpRot4lvP3U3S1zc=; b=PhzKBhCDHAeJbL
	c9r0Osw+l3bWiT01yOMPUvowMWsg2UHnr6Ls7tqzLiOT/S17Q+4hNsVpyhuY4/PMAq5kNtfaABREC
	J1mlbzrlQpNbe5LVUY9xBDkHeEAA8sApBMIn6Dac46mm/Nt1ZGkAWeGsVwS18wF9Q0F9TeMnR8HZJ
	DcDYh6WvzoCTB2BHYfChXzKAdloxdEsjAta4ABQvCiRVnlqfn/S9PnMl2PGtVloKJp/SFxGYaqUvX
	mmL3ttOPI8Q0QBjrlIVjZcz1JV5Hbk0f9DmyPVAZIJRbZom/NydmGEN6WLEe9mMhhw9JHN3oyvbzw
	od8AbAKosXpPI7cYyKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSiu8-00HTgH-G2; Fri, 11 Mar 2022 17:18:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSiu5-00HTfl-Je
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 17:18:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id s42so8421167pfg.0
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=/vAMVQ4S4rG50aDrpEZgzM1DrWkgQMPidGWj+MF7bA4=;
 b=ldXEpgleUADdcyKGiAURlNlkwwL/8MDZLJ8RxYVwdoB3ipWBEYxgGC+oDApYJe1giz
 WhptnF633qvGSRwsPogNwQcfvNiLz77Ba7ImzxEb9Qz/t6e5+3aPfMrcWOpxXKD0pzp5
 jwPMY0qWYb8e4M/+AkQCGU6/CG8XBAHZ1OtqDGm8Mg8MryqAyTyaWtBa+FYzJED+J9q5
 1pzY8SC/NGSfNY1GhXhubWfqUi3fpqVj1rx80FT2xOPglEZdjeVeLzEmkhAzYYK938Qv
 acuy8/WuUB4NV2v10hZG1EpW+p6Ss1dsc24xvlbimnDq8lr7BSYtrwpU0xxdDJWuS33q
 nhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=/vAMVQ4S4rG50aDrpEZgzM1DrWkgQMPidGWj+MF7bA4=;
 b=0BVw9Lq/MzHm+WmRNC3SIUeb955roJNWepynVCM3531MePh2GZiXy3EgNHTvEj1aJb
 OeAS6O6WsNrTl602lHOEMh1EtdOllUWi2ZAqpXvCyW5BEoujOv2Ad8leSokCi2jvkUXd
 CkwCYTlsJUE4dyXJ0zfjI7aB3+zDW6/TvvSxQtPzE/6Wmrpauj8j3wjj9mBv8414Qb/U
 zr/0/RbcJXvJ960zYA8b8Fkhd0ksGzRb5pqoDI+f6Q1ogmh2oFu1u9FABiiwpVkEVYCU
 hskVqsRYo5M8IawGt8sFvaFEiMvlrUdebdwP+4MzwrYmYXEEI4YXo1LQWY9xKrnodi64
 z4Vg==
X-Gm-Message-State: AOAM5313YPWMYBHsdPb15+BTDWyw7IUYogHnQLAFg3m0+6BjvT1bsYIe
 ZlPifMineeUZuReUghpC+/aUjuopj//QCA==
X-Google-Smtp-Source: ABdhPJyU9YbKB8/oleGqNbhXYfvTE58OeXWtoh7DpJIPNpXHhCOBSo5+IZAgxcuSScJzJw0Yy+o+eA==
X-Received: by 2002:aa7:88d5:0:b0:4f7:1b6a:8673 with SMTP id
 k21-20020aa788d5000000b004f71b6a8673mr11236281pff.5.1647019092209; 
 Fri, 11 Mar 2022 09:18:12 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm11202260pfu.62.2022.03.11.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:18:12 -0800 (PST)
Date: Fri, 11 Mar 2022 09:18:12 -0800 (PST)
X-Google-Original-Date: Fri, 11 Mar 2022 08:59:17 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.17-rc8
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-1484f557-fd58-4fe3-afce-a630fac5c8b3@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_091813_715413_9F5AE6C0 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 74583f1b92cb3bbba1a3741cea237545c56f506c:

  riscv: dts: k210: fix broken IRQs on hart1 (2022-03-03 20:04:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc8

for you to fetch changes up to 0966d385830de3470b7131db8e86c0c5bc9c52dc:

  riscv: Fix auipc+jalr relocation range checks (2022-03-10 20:37:44 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.17-rc8

* A fix to prevent users from enabling the alternatives framework (and
  thus errata handling) on XIP kernels, where runtime code patching does
  not function correctly.
* A fix to properly detect offset overflow for AUIPC-based relocations
  in modules.  This may manifest as modules calling arbitrary invalid
  addresses, depending on the address allocated when a module is loaded.

----------------------------------------------------------------
I know it's pretty late, so no big deal if these don't make it for 5.17.

The module issue is particularly ugly: itcould manifest for the majority of
users, and depends on a bunch of long-term runtime behavior so won't get caught
by simple tests.  The bug has been around forever, though, and it'll likely get
backported either way -- figured there's no reason to wait, though.

----------------------------------------------------------------
Emil Renner Berthing (1):
      riscv: Fix auipc+jalr relocation range checks

Jisheng Zhang (1):
      riscv: alternative only works on !XIP_KERNEL

 arch/riscv/Kconfig.erratas |  1 +
 arch/riscv/Kconfig.socs    |  4 ++--
 arch/riscv/kernel/module.c | 21 ++++++++++++++++-----
 3 files changed, 19 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
