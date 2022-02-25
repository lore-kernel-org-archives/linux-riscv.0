Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAA3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2E9rZ6QNbd+ewHvEXbiRtmQB3nGwV70nqJstHs8QNAQ=; b=vfViMKRsqVAWvY
	jiT4zgHl5nyTerDGBMngx6qUgu0IeZCqs4yEXW+V4b4TcxvGFQ0DTjyyb2hQO4MVczyEfmoi/aIps
	hT3qMiYWmjB23jr0dPugr5aK4SSYoygaaFpkWT27yqc1JM1rSERLXC5keWjaMQTvui4P4BIX2I1YW
	yxRD3VFEpFskgzLPlf87q7awWHZi+pebKuVDwDaiwZAwdXzS42cexjvTxzs0V715RY4mJv5Jp2mnM
	QJ4gZFV9+SYVPG93edpRR4UrGM4IpqMaaUuNhNseW+1DYAy00sRjFQrD1l3sQnq09PHPMCDk/0n8z
	N/OjZQr5LBwtyGGLFDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNfwS-006k2i-Ah; Fri, 25 Feb 2022 19:07:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNfwP-006k1l-EE
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 19:07:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id l9so5148899pls.6
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=zpMabozdXcRokZfdlJzt+ws6ExMNsrdAdHkkZUquN1w=;
 b=VRLzrXR32w6gT3MUs9irseczDlJWURgLmHvrMkOITutuSwWerF9SJmRkCpeA5pbW0n
 TOyo2grAI1ji5iAXM0kTHr0d0fy7gRpkjkuMWgZkwN6lVNjOBMKnIsxvO51Ejgj+2mpF
 mpNnItqN0xinJ6RvcaDAPYaZVBClhdr3JFlATqXN7lE5cx7q0p6jU9sRx9uNB9MLPqoC
 QUun37HOMOaKIS/pmNwxw72OxUY+F0yPLdasDEoNBmdIESYVNdXkLQWpu3rMTtbbGpog
 qKNYFWvbQxBuTZGOsZBsO7U/H+zjtct/T0a4qleYvtcej3/ZcztnuUrt/NwL8ciOQQUC
 7tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=zpMabozdXcRokZfdlJzt+ws6ExMNsrdAdHkkZUquN1w=;
 b=Vuq+WVE84Yy3ZTY3htvUUQJV/QzPMsBsfIMt9+0mY1KSWSMcaaEFZK0hV2L+vxdgYw
 1bMiOVhz1Sb0E+aja5Tnkf2vBgtiPTf55hqN3BUc2pwbrvDaqMPmCdZDCJG41neLk5Eg
 VeqEqkTYPT6HhT7+5M4LhM/7FRfaxGOkMHUqGivP+/inKZwJvbqSoJl6go1/GK7Siv5y
 Ax7UTMeH48XLVIM/sGxBizcLPIWB75cG5YYa8sgxdkGGj/BxApvQW95lp90qBSshYehD
 fCl+fIC4XTsq8GuViUccCTB3fSLDTrZo82bQPwITzaPDTtiWCgzIucaNVeyIFdcnf47w
 dhRQ==
X-Gm-Message-State: AOAM533vZPHlCW7enFgMjQIKCMPyvFNJyg9V/f9fLLbYMIw7DAsSkYgC
 v23SFRBMhkZb+nMhWwRyb05FdKPr87VLAw==
X-Google-Smtp-Source: ABdhPJwby3wVdcaCbcaIUzrzguXTNnOLQykwmZ+ciJKkvT7LpNhT5ch915A+NG0cvJNsJpw2UdHqHA==
X-Received: by 2002:a17:902:ee42:b0:14f:c36e:6558 with SMTP id
 2-20020a170902ee4200b0014fc36e6558mr9089122plo.118.1645816064184; 
 Fri, 25 Feb 2022 11:07:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm3203024pgn.72.2022.02.25.11.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:07:43 -0800 (PST)
Date: Fri, 25 Feb 2022 11:07:43 -0800 (PST)
X-Google-Original-Date: Fri, 25 Feb 2022 11:07:39 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.17-rc6
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-673458fa-1596-4318-ae4b-b0275abc5d23@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_110745_584016_B8E8127E 
X-CRM114-Status: GOOD (  10.13  )
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

The following changes since commit 5feef64f4c67068c49f5409d43c67cabf2327f66:

  RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid ordering (2022-02-14 12:27:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc6

for you to fetch changes up to 22e2100b1b07d6f5acc71cc1acb53f680c677d77:

  riscv: fix oops caused by irqsoff latency tracer (2022-02-24 20:30:30 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.17-rc6

* A fix for the K210 sdcard defconfig, to avoid using a fixed delay for
  the root FS.
* A fix to make sure there's a proper call frame for
  trace_hardirqs_{on,off}().

---

There are a handful of additional fixes in flight, but not for this
week.

----------------------------------------------------------------
Changbin Du (1):
      riscv: fix oops caused by irqsoff latency tracer

Damien Le Moal (1):
      riscv: fix nommu_k210_sdcard_defconfig

 arch/riscv/configs/nommu_k210_sdcard_defconfig |  2 +-
 arch/riscv/kernel/Makefile                     |  2 ++
 arch/riscv/kernel/entry.S                      | 10 +++++-----
 arch/riscv/kernel/trace_irq.c                  | 27 ++++++++++++++++++++++++++
 arch/riscv/kernel/trace_irq.h                  | 11 +++++++++++
 5 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/kernel/trace_irq.c
 create mode 100644 arch/riscv/kernel/trace_irq.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
