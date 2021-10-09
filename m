Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6D1C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 04:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CDC60FD7
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 04:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0CDC60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NnrNaLEmb+q2i98cTfLHwaxwNuOBqcKASXYD7NmFydA=; b=o5AwfiQUzp38bg
	1BQi0unlIkoTxbUDMhSme61ssqPns63qQ0ups7vgoZvTWegVxcW+A76dHxlAFJWaw7ox6NqBzInlk
	zgcqkO3Z8ljnKS+21XBHJws5uDz+QMOR3WaqqkJ/36HksVrFALcz3FAHasxaW+f+BUoRGccQ9HqGC
	oiUaV7D8iP3gqhIJI2L/UMuj3K25LsCbdJYEjJPB01xKQIoJh16dKHdFYbHanBKYdiFOMyFrKHXzL
	xlb+vBCzUG9lIgZW0Cf9XU+9m1x0lyjxeUTq+w+rInEgLa1vydgLWYZSs8Xvq6fkjvbrViCo7s9wN
	1l6c95YOvoRNFvZa37gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ47o-0057oh-7N; Sat, 09 Oct 2021 04:38:20 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ47l-0057n7-5t
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 04:38:18 +0000
Received: by mail-pg1-x532.google.com with SMTP id e7so5058736pgk.2
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=GLtUQay0Jz5XCFvG0wpPVlDUiFUuJN9wSLCgiMgA340=;
 b=IPJFaLK9fIGBZhDErrqZ6xMv5p/0wEAtlK+WmoAKM631dJUaqdpCwke1JPuCa2tc+q
 vwjdoHCJdqjMC1EctnOtR/jAtYEAeofm7p4Di6ZICdSAQ+KYZtrUxNeP/Ajzy06vqSOO
 UNbaSV4tFFqNt4ZdAChyNOgc10P5U3LL6yMUx+SqcaPKWLPZY7DqdNn01f16WQXLFm2X
 iNuA86jKPLLrCyLEuZoC6QLmkffXR1YQpPAavXGwqc0QBUkX0oPeWk22E3LR0PIVMmAD
 SQ+8aZ6oZ6jerIMCA9h+bDuDGDuXV9t7sb2bFuHakDxM9c24nsaO2U3xPk66tNqNOZQI
 1JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=GLtUQay0Jz5XCFvG0wpPVlDUiFUuJN9wSLCgiMgA340=;
 b=KBxbOQVktA/ZqALNMXdc5xBcxU4QMoXbj+c1mVv/oQ//eJz4yvo6lndkdDDqJHIPB3
 25GerrXa0usluOGCOE0z+euE8Id8cBud4jjZCHijnrYrbe5k5mePInB2FgwzLVu19M5c
 S7B7QB4iGcmMrV6Wzxl73hTScZPBQggGbGGbVHrCs/NR6+SrtEfmrMKkTflkju+TGg/A
 JDCMd2qAAfX6aY7akaiP9lQBWfl8gfWkB3TpRLuUkM8YkkYVHjU6UYb1U9PhtELEJ65I
 /6+soS3I64ESLYYYwisElqvchki01zyLJk50wA7ccV67O8gNYFpgPdWxWZkcaIFaNiIH
 dRHg==
X-Gm-Message-State: AOAM531PdMTiTl/620YidgWLc0Kh6kGxnPEnCZg0VAlJEfOOYDIM5FLc
 U4ida7zbYCiKa1mmi+ocdhcREgepkyPHlg==
X-Google-Smtp-Source: ABdhPJyXKpgNDYBHDZJYzeiQInmpo4RkTS3uQ4V5pukFx+04eSE2fphlDz2zyunAKOAULp0oBXYmDw==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr7989017pgk.322.1633754295243; 
 Fri, 08 Oct 2021 21:38:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e14sm914125pga.23.2021.10.08.21.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 21:38:14 -0700 (PDT)
Date: Fri, 08 Oct 2021 21:38:14 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Oct 2021 21:37:58 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.15-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-26107d68-d2af-46eb-a8a4-43c1496a9ef4@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_213817_310442_ECE03BE0 
X-CRM114-Status: UNSURE (   8.53  )
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

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-rc5

for you to fetch changes up to 3ef6ca4f354c53abf263cbeb51e7272523c294d8:

  checksyscalls: Unconditionally ignore fstat{,at}64 (2021-10-07 17:16:28 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.15-rc5

* A pair of fixes (along with the necessary cleanup) to our VDSO, to
  avoid
* A fix to checksyscalls to teach it about our rv32 UABI.
* A fix to add clone3() to the rv32 UABI, which was pointed out by
  checksyscalls.
* A fix to properly flush the icache on the local CPU in addition to the
  remote CPUs.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Flush current cpu icache before other cpus

Palmer Dabbelt (4):
      Merge remote-tracking branch 'palmer/riscv-vdso-cleanup' into fixes
      RISC-V: Include clone3() on rv32
      Merge remote-tracking branch 'palmer/riscv-clone3' into fixes
      checksyscalls: Unconditionally ignore fstat{,at}64

Tong Tiangen (3):
      riscv/vdso: Refactor asm/vdso.h
      riscv/vdso: Move vdso data page up front
      riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for write killable

 arch/riscv/include/asm/syscall.h     |  1 +
 arch/riscv/include/asm/vdso.h        | 18 ++++++++----
 arch/riscv/include/uapi/asm/unistd.h |  3 +-
 arch/riscv/kernel/syscall_table.c    |  1 -
 arch/riscv/kernel/vdso.c             | 53 ++++++++++++++++++++++--------------
 arch/riscv/kernel/vdso/vdso.lds.S    |  3 +-
 arch/riscv/mm/cacheflush.c           |  2 ++
 scripts/checksyscalls.sh             |  6 ++--
 8 files changed, 56 insertions(+), 31 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
