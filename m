Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351DAC4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 16:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD57C61042
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 16:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD57C61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwCV9f2qtmDAl7KWF9vxi1SvjxcYu/bKkSXaaigmqgw=; b=tXqQ5S3RtmIiJF
	eS28CABTulu4Nd6MrJOG98PY2XgnKIwWZLZfYOwT3jnExQ5padBoF1WQJja+5jvCc0Q77XJnaZ2u/
	YnTqV/B3x7JDTG0rYfIVZdN4c851f0UQW7nPrFwcMlUWmbk8kYsk3SGa/CSwkSN46z9S6uQaQ2GwC
	MkvHfn3se1eyDlrokZA8qmcfF6EgNo/rNAufsxNKz/Z4K8StwwsTIJYb33+qYhfwRoF4qcsW0UlF9
	viE2Kz+D0cZNLqFTuozlVeU7+bJSLdd17NBYnNRMzLL0NmUHBmPRBwQpkRFtfTKzi3AytiNT8CcMr
	B0lEy51zK7eFZ4N91Jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCPMb-00EyOC-21; Sat, 07 Aug 2021 16:39:57 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCPMY-00EyNU-9d
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 16:39:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so15135823pjn.1
 for <linux-riscv@lists.infradead.org>; Sat, 07 Aug 2021 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=grhFZWxTWMmC2nk3rV2w/FHZSjI97u/vyUnDNsG5W9M=;
 b=XrkliiU5S+vfR/+wxmgI/3TIBaZ6HY2Fsy/6/i+FMVC5WUr5HeFYXlD2AAdJQVl3tJ
 E+2EOamHW9BPOWUk7yCfIrf7jDeOAxGa0doHnl9m94NzYhkKypiSd3HEe+RgvIapvKEg
 FQbpKqTm5gr2zim5i/olvJdo7leV21sdYSeyDaiG/a7AvYhLLPrjn4gCCAr1mBp6/oHf
 ibbTFTbi9iQE+BD54rm14U2AwN/2VT53ZPSPJZ/tUCDQv+4Ksiy0bw/zGkirbk2n2+my
 9yjmHgyGrWGgypbokB53SPxsB2eq935GRM+yByOcVd9NjGue9RpyKCnelfT/yDn4KLJY
 J3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=grhFZWxTWMmC2nk3rV2w/FHZSjI97u/vyUnDNsG5W9M=;
 b=FlAXk67pbWVfrEf2lzYc0WqnVDhxHpY1BulF+SZvBLirH1V0Fdx2o0b0SIqwnCMebA
 yFGIIbRNXcyVPZ1a95dDHUN/O07bD4mr3dFX+TzHUNplEUL5Y6gT37sOCwCFE+aiI1R+
 rKCCtY82SirCcXRlguKIH7LtMZCrpHVg4nZbJs9kzzShCfa6R4a9dDm58pxr2DNTrczp
 6Nt9YF+q8XSr++PXIe0W1hqlEz02GUaOCkdNqH6vD3yIuWwUVPfk+yBnk6zDzoc2A/ZY
 T3OGEYjSPzVudaDw7nRkX+c0/mj1ygdG3H9zSjHvYa1bclMmYk/q4wL/G1CYE08vUkrR
 gTHg==
X-Gm-Message-State: AOAM5336XWoBXmWfSWv5EknGnSiufXgZSFD6g66gyWulnJkDkUxjmRBS
 cL0Q2bbCWs4xhvA3pu0iXcdR2wDpocdPYA==
X-Google-Smtp-Source: ABdhPJxD/zozsaYYd4McHQ1wf+eJJ1Tb0yRRbC4NRCqa6TfwodEcUeE1yuhQyMZx1m80QSml4bvebQ==
X-Received: by 2002:a63:f145:: with SMTP id o5mr138042pgk.273.1628354390553;
 Sat, 07 Aug 2021 09:39:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j22sm16340647pgb.62.2021.08.07.09.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:39:50 -0700 (PDT)
Date: Sat, 07 Aug 2021 09:39:50 -0700 (PDT)
X-Google-Original-Date: Sat, 07 Aug 2021 09:39:47 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.14-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-bafc6421-186d-4f3b-b5bd-7c7f15bf94fe@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_093954_384576_B1DC1BA5 
X-CRM114-Status: UNSURE (   8.73  )
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

The following changes since commit ea196c548c0ac407afd31d142712b6da8bd00244:

  riscv: __asm_copy_to-from_user: Fix: Typos in comments (2021-07-23 17:49:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc5

for you to fetch changes up to 867432bec1c6e7df21a361d7f12022a8c5f54022:

  Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED" (2021-08-06 22:41:39 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.14-rc5

* A fix to avoid dereferencing a null task pointer while walking the
  stack.
* A fix to the memory size in the HiFive Unleashed device tree.
* A fix to disable stack protectors when randstruct is enabled, which
  results in non-deterministic offsets during module builds.
* A pair of fixes to avoid relying on a constant physical memory base
  for the non-XIP builds.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address conversion
      Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED"

Guenter Roeck (1):
      riscv: Disable STACKPROTECTOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled

Jisheng Zhang (1):
      riscv: stacktrace: Fix NULL pointer dereference

Qiu Wenbo (1):
      riscv: dts: fix memory size for the SiFive HiFive Unmatched

 arch/riscv/Kconfig                                  |  7 +++++++
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  2 +-
 arch/riscv/include/asm/page.h                       |  7 ++++---
 arch/riscv/kernel/stacktrace.c                      |  2 +-
 arch/riscv/mm/init.c                                | 17 ++++++++++++-----
 5 files changed, 25 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
