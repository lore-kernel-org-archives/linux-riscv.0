Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A651C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PurIV7OG0ANPK1JY5gFeexUzUHbSa47c5qH9Mvmgvhw=; b=BJSk31zr8xkDCP
	1GLf6L96a0/f0M+357VGFwKm4ipDKf2VbFI7vAgWH1IoJwdbqnNsE0/3UWUj7AjnHmH+H6TmklCt6
	WHofPbJ1jJDXcfoYwmB7QyiXgJ8SLC/xrhd6q/siwn7AgkEJCW8oEdMtb9Bza0YdqDoEP4lpSy3ty
	D9hf8oI9XZRZz+sZwHc/HImAC10dKdVEtVLiO7iTsPh+wxYmgp+r7wJDTrQQ1pJPGvgNRQfNTDum4
	ynntVq+kphEEMmUXlc0H/G/7TttF+l6bPX+weslmialixRJwobjQ8A0x2pErh3so5dyaSMSdM05jU
	YLvguEHPFrhXCy0qYmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvmG-001J7y-Uh; Fri, 22 Apr 2022 16:05:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvjP-001Hsx-7O
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 16:02:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id h12so8112245plf.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=GrML/tBTGNY7cLGJx8CIKpBVBkMLPsIgHNXEWz+KIqE=;
 b=1a6APHrULGYP1dJsN53TaDp7jPPW+CvobVkYof/ar3uvqU0QP32czYFG+RBQOq4dlQ
 O0+6zuixtrKn96NNzM3PZLT5lij7UR7C9RYTM8s2TiEBSEDfxXp1j09V0S4+abUZmFtr
 7wZbAs5kYLrSbkYpf3uua/gMd09Hj14WyRCsOXzvrGe7iEZ8hfTNQafxfnDkHYd8kTZU
 QAGGCt8Cj9Z9kj2JW8SNf5b0a21klhiyklivDgh+0t+2Y1+9dcEikpsdTKshrAUO3/N2
 E+F0XYWVsdn54IAtrXKStea6tqUewniEH2JZ4Bj/A1tDuI7d6CzlAKDCEQc+yxvUH7Ar
 FJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=GrML/tBTGNY7cLGJx8CIKpBVBkMLPsIgHNXEWz+KIqE=;
 b=hi++Ie7yufv08ylwT5j8oGi5jhSqgwOMtnSLPtON1sNpl/WIUF1wdkVaiQTlQxsgmg
 cDCcILmEv8BPkrqojlj38ALClD7T79MdlwxKhnvO3rL4WP/xbcinKyUdQt9EBwMCj+J3
 zQMjb/YDNTLUacUwO3L1G6uaXYFL+vTKAv1NUgbAKjpS/lVg8CYR/gf50X9flue0dP7D
 FHQPnMadvU/OhI0HMNDhy8WHP9siT+jCbF5qcL9UTuMnyC1KZrdI3vFbDOuSVBMUmOSx
 cuQi4gyjiMkF3jifjKVIEOJwov4xwSHJjgufhzsOIqg4WTCfnV6e97VfevFInvc4u8Ch
 ACLw==
X-Gm-Message-State: AOAM532cAeEDBon+8pD5jCM7cJ+nBvWv7UwlrCF/ObsgbrX8xQZ/0t1A
 GUNQP3NBQ8X9438j5hyZIkvEiUKG8zWzAQ==
X-Google-Smtp-Source: ABdhPJxkiEuskTJie+8vnx3wqlos6BbFtB2ZyVeeKujutXEW9fftctoqJTMU84FgXXrH0NC3z1gypA==
X-Received: by 2002:a17:902:8f94:b0:151:64c5:7759 with SMTP id
 z20-20020a1709028f9400b0015164c57759mr5312483plo.4.1650643322202; 
 Fri, 22 Apr 2022 09:02:02 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa7991b000000b0050a4e43d3ffsm3122813pff.65.2022.04.22.09.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:02:01 -0700 (PDT)
Date: Fri, 22 Apr 2022 09:02:01 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 08:59:01 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.18-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-650d0eb6-fc62-4859-b713-2a4e6ccd7465@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_090203_310933_EA8AA811 
X-CRM114-Status: UNSURE (   9.32  )
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc4

for you to fetch changes up to bf9bac40b7635e2ce43ba0051a64c3fd44312405:

  RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE (2022-04-21 15:10:47 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.18-rc4

* A pair of build fixes for the recent cpuidle driver.
* A fix for systems without sv57 that manifests as a crash early in
  boot.

----------------------------------------------------------------
I'm not sure if that boot bug was just so bad nobody's found anything else, I'm
farther behind than usual, or the stricter merge window resulted in less
fallout.  Maybe just a bit of everything, but I always get worried when things
aren't broken...

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: mm: Fix set_satp_mode() for platform not having Sv57

Randy Dunlap (2):
      cpuidle: riscv: support non-SMP config
      RISC-V: cpuidle: fix Kconfig select for RISCV_SBI_CPUIDLE

 arch/riscv/Kconfig.socs             | 2 +-
 arch/riscv/mm/init.c                | 1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
