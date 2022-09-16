Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5BECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ttShEAD3jAycjHxbo8oen1FjBzQ7wHRG9x0ClzGV+A=; b=uvw1WPCH7QhrCV
	8KQKTSTdw3/JF5OAN6MGa9JKdDPgt52C4MNJXFCuO8sBkdd7+ZlObpJFfMLfJxZ41Fdvkzfwx+iUT
	aK+jnXw5d2kbZa9q+CO4KgDKq/2Vn9EbD93N4EZyMeZWD80DtsqiNRbgorxE5kUB5YD7fXjoqoEKD
	MIlJWIr2sZe4nGE9yRk+sIpxK4P8ZtWDg76APqpdCNyduo/Scvb1urbu9iiStRiX6wVQvb1yfq/od
	9+qfhlKHBWvFWn3BfB/KurCmmjetSswsMwr9Nw1HzBUnJiMprIutgT2N7aX7P14e/1ncWq7Lt/Koq
	KouEUYpWVtPxbArb5NbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDJh-00EcAo-LD; Fri, 16 Sep 2022 15:31:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDJQ-00Ec4B-Vd
	for linux-riscv@bombadil.infradead.org; Fri, 16 Sep 2022 15:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:To:From:CC:Subject:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=J3xtITp+FBk+leJje4oS/ahkcyhlokVvO9Au9VXbS3o=; b=k6EszBRCcx26dGBnt6jG7Q6iRd
	xvd2MkdAQ9TyEp27PJOjCtNytvQDq3uhKKBF/GPCHGb5nUpFsDvcyLkNoEju3cPQFKex/i/q+d0xV
	ryc2TGsYr9owh6fYG/oLcF6HrlSFvcE5T6F6n4466/BvMSu2wqHJYYcVogLxO80Kisz60IFQL36yh
	aWKfn9cNc/aSW6W2Fe8Sdy1nJBrNmVw0QhMBBQrLLO/E3LXoBGkzldzFQkLolJ6ujU1QfCU+3kFX6
	3/DdbsfmmTx+1Rb3WSFfGAjTlCPfu1Uasr7wcgxbZGh6mPNb45SFgGHscpNN4A2rF0G+PbkZHY/FH
	4bUKJoWw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDJL-00D7ZG-7W
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 15:31:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p18so21763272plr.8
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date;
        bh=J3xtITp+FBk+leJje4oS/ahkcyhlokVvO9Au9VXbS3o=;
        b=APflXrQEeSAodR3aW/lHhrwTb0mv3QkoUrwkaCnf/Ud/yluQnz5uHcshFadb2HNBE/
         djbfv95JFohSBTsE5jxKqvazVEkKwRv2XIdt6vCzrywIdfttazkSDbngEQa5xp6FhPpL
         wyl3kCEqZ4tI+ztRYolMLRr9Idle/BtYCpfN0tB8U0VjXuqyl8GAt4PBTyZVOOfMT/6k
         A5V+K4jHZMWwAtpoBPriW9iuKaHcDcTszC9IlQhaSv8YbXOLtif8xW5FQ8161MCR22aZ
         i5Zz7WiI6zyVH6AJzrwRHgCF47s/6hKMa79Jx03cU98aAyZ47bqk8Qd6zWigc/OoAyjV
         Zvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=J3xtITp+FBk+leJje4oS/ahkcyhlokVvO9Au9VXbS3o=;
        b=uqeYbHxWgDCoCzScN/k/pmk4iKIqeq0kF+4QrLrAlPkiUx07ptb6hW0ZnEV7smnleH
         ccmPpc9+AtZAYU+lIueB/FlWS101ALMdoOCvJDY6fEToqTJ8n7lSUduIBmhQzUvqsGMb
         jMIfpgg48Tf8t0uXs4PBfGbED+IPXjJDWn5rls7Qdr40U5brJuhnKMp4B5Rk0hAaGj3n
         FLQKehEhi2Yjhk3+kI39QtpRTpq408pATpul3zSZmC7pvyGTlXzwm2oPu1k0NQrlr4oM
         EDoI2fp2RCeelPXy0wTlCKLNnSsSTuNIDdZehdtZVB5zkPNtUhn07itvrI8765TfJmwM
         bNdQ==
X-Gm-Message-State: ACrzQf0lNdYa7hi1BS/E41bFUL4OpZprqNqb6GeDXiV4SGRLgFunIWG3
	bONPOQ+OaYrdFUQQ43dzmgeIDQ==
X-Google-Smtp-Source: AMsMyM4Ns3o4TFKs5G1Mi+Ut5fApuqBRUPOUPJZktW5nwF6kbMgiaWfy2K/4RD98XhshOQ5nyfY+hQ==
X-Received: by 2002:a17:902:b194:b0:176:d229:83bd with SMTP id s20-20020a170902b19400b00176d22983bdmr380983plr.174.1663342279425;
        Fri, 16 Sep 2022 08:31:19 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b00174d4fabe76sm14979760plh.214.2022.09.16.08.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:31:19 -0700 (PDT)
Date: Fri, 16 Sep 2022 08:31:19 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 08:31:08 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.0-rc6
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f5d21762-1321-4d35-927c-d47e0749abc0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_163124_816169_244E9359 
X-CRM114-Status: UNSURE (   9.69  )
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

The following changes since commit 20e0fbab16003ae23a9e86a64bcb93e3121587ca:

  perf: RISC-V: fix access beyond allocated array (2022-09-08 13:50:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc6

for you to fetch changes up to 5b5f6556027ccb04c731988923c051fd2b2bad18:

  RISC-V: Avoid coupling the T-Head CMOs and Zicbom (2022-09-16 02:59:06 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.0-rc6

* A handful of build fixes for the T-Head errata, including some
  functional issues the compilers found.
* A fix to avoid bad page permission initialization, which manifests on
  systems that may load modules early.
* A fix for a nasty sigreturn bug.

----------------------------------------------------------------
I have one merge conflict as a result of a treewide fix, I'm getting some odd
output from just showing the merge (it's showing some of the fix too), but I
think the merge itself is OK.  My fix is to keep the write lock

-       mmap_read_lock(mm);
++      mmap_write_lock(mm);
 +      ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
 +                                  &masks);
-       mmap_read_unlock(mm);
++      mmap_write_unlock(mm);

----------------------------------------------------------------
Al Viro (1):
      riscv: fix a nasty sigreturn bug...

Heiko Stuebner (1):
      riscv: make t-head erratas depend on MMU

Palmer Dabbelt (2):
      RISC-V: Clean up the Zicbom block size probing
      RISC-V: Avoid coupling the T-Head CMOs and Zicbom

Randy Dunlap (1):
      riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning

Vladimir Isaev (1):
      riscv: Fix permissions for all mm's during mm init

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Kconfig.erratas          |  4 +--
 arch/riscv/errata/thead/errata.c    |  1 +
 arch/riscv/include/asm/cacheflush.h |  5 +++
 arch/riscv/include/asm/set_memory.h | 20 +++---------
 arch/riscv/kernel/setup.c           | 13 +-------
 arch/riscv/kernel/signal.c          |  2 ++
 arch/riscv/mm/dma-noncoherent.c     | 23 ++++++++------
 arch/riscv/mm/init.c                | 29 ++++++++++++++---
 arch/riscv/mm/pageattr.c            | 62 ++++++++++++++++++++++++++++++++-----
 10 files changed, 107 insertions(+), 53 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
