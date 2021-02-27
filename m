Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAD7C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 20:29:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3B264E34
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 20:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3B264E34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRlA1wIui0k7WkztvhWp8b3byiTeQ5ZWVFrbNdWw0Zg=; b=BAr88W+xwQOUxgueMqVibs1Uic
	8U7HiVgw+VIpPXk7/WLXJdWE/x1UtnRtDwzriTiLiwmnzCaB11htAtZuvhTM+/4K4Fm9ZVwzYnX05
	FnlzN/cUFCT9cAnuUtx3zu4l9BkkGv69XnZDl2ZrIhyu1StY2vBsMUzXL5pPsHCr4y+I4Qi0NHxpL
	p7MnOY6CMM3Bb3y5UAnIm8uxJis89f6OKFJPWnRNJfgoU5DvgE9Pas7/ZfL3GQJowUcwW9dZXSDb7
	eVIyD5eoCKcC/td5UJxGpEkVK06J+wUEf2d4jCYDVMMFZdsOTMNpbkM5vjVvN0QnYajQxDLMKlGS/
	u6VrRPrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lG6Ck-0005WA-K0; Sat, 27 Feb 2021 20:28:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lG6Ci-0005Vk-I2
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 20:28:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id q20so8554617pfu.8
 for <linux-riscv@lists.infradead.org>; Sat, 27 Feb 2021 12:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=6/MfqjLb24HQitH0CWHO5yYdg1Z2JdjddfODgAO/Qns=;
 b=W4Hs0OEKPFwC6I5a9SYR81jRXoebfOXWbwz6yl3eZ+0kDD7TnlJS3KLPJEPtoAwUam
 tZC+PpFVanESW75Ij1tf1bstjzdGnvc7xlF52pCHy/xWcIEecu1YPV9m3q45/t7K9n6a
 pAG0+wFIJWDnBssTU1IxHDOj4riwt06f2gPZP3LRtN6VF3axgdLajWRc31TkrR3QNdzF
 DvO5vRi6ilJ8JGPjJ+b+4uZEHcmOp2Q7gzjk2snCeNMjJOWO/TtliZ9bjj9FxPo+S+i8
 iZ4FW2sOqXSLtyiROhdT0kLgGIJ27O9ne/WU5zq2SD20M9GoPiBeaIFhRxyOfHiU9y2c
 AUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=6/MfqjLb24HQitH0CWHO5yYdg1Z2JdjddfODgAO/Qns=;
 b=at2ue9K/wV4WOX3xTmS8V4YI2CnDBiQPmf+5SBPaODWWO7WUhYeF+TvDPTSeaZG9wD
 Ho3GFQY9dDfchw2kZXQmIyM0WWvoFNBn+n8MG7AMeLs4TOIXo+7F0xXesjH5RfVYxqHO
 txzq+6BSqtHFBQX3UmE0y1VblZudKSLemi6oGoeTrVMvJYAqzebfqV7b+QzlQ4zKN3/d
 QZ4QpsNhWt+Tx5je3f55O2vVIfSFfcsK4if2XYuSn7A5CsZwQ/DFe02RdTSovc3KAytr
 TURcbmmlT8j5TowFSt7Zd/G7VpnoVhTgpKUfChK3Ct/TvaUpe/3HlPQxL7v+/Xqqt+0B
 4MdQ==
X-Gm-Message-State: AOAM532WikHMMeWow05XZVvPX8PqCT5okQrJtSZyrgWuGXHcQe/FZivQ
 HOpwsfOhoEmiNFcd4mcG7jDngJaBLI/Zl3AA
X-Google-Smtp-Source: ABdhPJyq3hRaBF4lM+CWWtVGJs8ZJFhYR0nb0FbNk0ijhTb9sf/+YQZmAMD3MhMuXyxlGfIJku2GTg==
X-Received: by 2002:a65:4203:: with SMTP id c3mr7789175pgq.65.1614457720098;
 Sat, 27 Feb 2021 12:28:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k69sm13228495pfd.4.2021.02.27.12.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 12:28:39 -0800 (PST)
Date: Sat, 27 Feb 2021 12:28:39 -0800 (PST)
X-Google-Original-Date: Sat, 27 Feb 2021 12:28:35 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.12 Merge Window, Part 2
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-bd8c36a3-301b-4412-b3cd-a6eebd336f6c@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_152844_724627_2B620613 
X-CRM114-Status: GOOD (  10.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-5.12-mw0'
The following changes since commit 8b83369ddcb3fb9cab5c1088987ce477565bb630:

  Merge tag 'riscv-for-linus-5.12-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2021-02-26 10:28:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-mw1

for you to fetch changes up to dd2d082b57602156e0c587ddb5ba04d0d624a6df:

  riscv: Cleanup setup_bootmem() (2021-02-26 21:25:17 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.12 Merge Window, Part 2

I have a pair of patches that slipped through the cracks:

* CPU hotplug has been enabled in the defconfigs
* Some cleanups to setup_bootmem.

There's also a single fix

* Force NUMA to depend on SMP.  This fixes some randconfig build
  failures.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Enable CPU Hotplug in defconfigs

Kefeng Wang (1):
      riscv: Cleanup setup_bootmem()

Palmer Dabbelt (1):
      RISC-V: Make NUMA depend on SMP

 arch/riscv/Kconfig                |  1 +
 arch/riscv/configs/defconfig      |  1 +
 arch/riscv/configs/rv32_defconfig |  1 +
 arch/riscv/mm/init.c              | 21 ++-------------------
 4 files changed, 5 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
