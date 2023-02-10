Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D31C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9dxX6u7wdZa5aeUWzFElDgGr9FLEGfcFnBh45BcRYGg=; b=iV/iTtp5AWIUoq
	ngU1EvcvGlcpsScSLdJ5nxM0EhwbRomY9lk58P06+S/NMEJ0ZFdMixJtZsFCUKt7pHy719X0qDrh6
	B4By9TbTtGNwn/v/g2SFI+ffYcr6LHTCtbHM1uVgsEX9mg/wJtZj8+/I1LUN/JYVTTpNQxUbj6XvC
	veHbaMIyyDCHNkqG4cARY7aoylqPW/b49yORXP7/CgPv6LM0iHNdgMkYubIQNy5V8zxgVJc7K85LQ
	1CcTuivFyOmF/nfAlfbD1sgppBZ1Jv6VTISiQi1QI5E5mXWK5RSQ/yY4qC6mNKVHfxlgwZDVcJLSm
	/hDNtDJVMXkgv9V1mVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVrT-006T3c-Sq; Fri, 10 Feb 2023 16:02:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVrQ-006T2G-5d
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 16:02:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d8so5708130plr.10
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaqwXRPrI5sbbJVNLmvBI0AeZg1+M73dtQ44DcOiCqc=;
        b=NMgbXVBNwme30CwDvGpeFtT+IZ4it29HuIxNc1pA0xqt0WNs2b2T73wC1gQPue2rdK
         5K0hFwCjXnaRIxqUaZN7NmmxIbSxExvljFCwmeLmBYffiyOE4OpCdjx2kAq4htd/8GrL
         x3HKCiazNefW3PzpmYQsOiaDF6a7mFRgFQT2sNBTIuQTuKy/Y7vA2l5r0Qa6eZoiMClT
         +OvNCEb5j/2M0yMd4YQJwSxaLcQQkplc4sg5j4Zgr5YCr3IRzL4ZNoIPHd2/GojMW815
         slIEwbXD0AHMYBH3uJ7ia5iH+CD5rImrjp/jz+UT4m0kGB5FujJ369R7EY1BZEuWkmXz
         3j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaqwXRPrI5sbbJVNLmvBI0AeZg1+M73dtQ44DcOiCqc=;
        b=s9+cAf+cgACxnBXCgwJ4LOMwH8x9CTZyuA3ehElwzO9TF0s/xC4U2cbeAfaplLGAxv
         zefNKNX3XckSS8mwlrcVhRuG9zxRXtLtTyZZ9YjyPborZaqS2TG/8WOim2wXDk21T6id
         JdRvZwXnUrtqCfVsfXqPD0iBA1deXAnHYMie0CR/SPEeEvBWBn2oFwLjnrTHIgEakPAP
         qiQ7Ndg5TE4/UbwIy3ZiFJ38mpFD+yybFVZajYnxpl8fd0XuYrpAU9FDAaPRga+v23F3
         Ig+URvYaR2m3qs+L3dKXkYuSqUgoMSHSMm5M84yi3nhBgxy8hXAfK+TN2Ye+jBKfFbK/
         ngew==
X-Gm-Message-State: AO0yUKVcXi65Z4gPuvN2LBp9xNGdWySt9PtNfLU5w2PSRNhcBhLaBga3
	L+//BNx/SZxClY3rQr+rMpm7i4KZXdwdLaBx
X-Google-Smtp-Source: AK7set9DTBJu0iGl1ax1QOru1P3DEdmdcW52K66jaMAbjtlN2tKkBngFnFNYStGBb26Vn177DLsqpQ==
X-Received: by 2002:a17:903:120b:b0:194:58c7:ab79 with SMTP id l11-20020a170903120b00b0019458c7ab79mr19241650plh.63.1676044967850;
        Fri, 10 Feb 2023 08:02:47 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ji11-20020a170903324b00b0019682e27995sm2902975plb.223.2023.02.10.08.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 08:02:47 -0800 (PST)
Date: Fri, 10 Feb 2023 08:02:47 -0800 (PST)
X-Google-Original-Date: Fri, 10 Feb 2023 08:02:04 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.2-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-6912c0cd-33ec-4209-8a38-3da4be55fd88@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_080252_456842_93EEA1A8 
X-CRM114-Status: UNSURE (   9.74  )
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

The following changes since commit 2f394c0e7d1129a35156e492bc8f445fb20f43ac:

  riscv: disable generation of unwind tables (2023-02-01 20:51:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc8

for you to fetch changes up to 950b879b7f0251317d26bae0687e72592d607532:

  riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte (2023-02-09 11:40:32 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.2-rc8

* A fix to avoid partial TLB fences for huge pages, which are disallowed
  by the ISA.
* A fix to to avoid missing a frame when dumping stacks.
* A fix to avoid misaligned accesses (and possibly overflows) in
  kprobes.
* A fix for a race condition in tracking page dirtiness.

----------------------------------------------------------------
This is a little bigger that I'd hope for this late in the cycle, but they're
all pretty concrete fixes and the only one that's bigger than a few lines is
pmdp_collapse_flush() (which is almost all boilerplate/comment).  It's also all
bug fixes for issues that have been around for a while.

So I think it's not all that scary, just bad timing.

----------------------------------------------------------------
Guo Ren (2):
      riscv: kprobe: Fixup misaligned load text
      riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte

Liu Shixin (1):
      riscv: stacktrace: Fix missing the first frame

Mayuresh Chitale (1):
      riscv: mm: Implement pmdp_collapse_flush for THP

 arch/riscv/include/asm/pgtable.h   |  4 ++++
 arch/riscv/kernel/probes/kprobes.c |  8 +++++---
 arch/riscv/kernel/stacktrace.c     |  3 ++-
 arch/riscv/mm/cacheflush.c         |  4 +++-
 arch/riscv/mm/pgtable.c            | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
