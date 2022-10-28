Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA2ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPs2Ha46bjp/jU75wxcP4QBNMb3Py/bnLT3ndWdhq0A=; b=VmgChmvjRdQZwn
	DZhQwDOcoSo5n90hgMY+4ZO3Gx8gI/xf25IXGCgTH79hhpophYM7jqYahjBLYX/pRjMPQXmFJRLdg
	yc+3SIqoS77tjbOwj+p/IRz48GxqpUnHRXMH6X4C6z2k5gkJXPRZ/v58Yxg8jIj5iKZTACGOg7c+j
	pAlIWfh51GuEitzHDkM0UcknUpQHJwFEym1euLvs8G7ZxSwfUYw/5hlIYTZIFa5LXoXD3pK0kuQxa
	J8iR5r1YdWF33AaFvvkJEhHDCRBtB0Xtr1q8G/vxrzPVMQ578pLheC2DnbJz1S+4rTshLsyjlwhx1
	PPxRgz5mjILVvPTPDIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooUIT-001gLE-Q1; Fri, 28 Oct 2022 18:41:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooUIQ-001gIG-Es
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 18:41:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so5311619pji.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsTgJLrX7K95YgJ1S9Ds5IL+IAplewL1J/fAJJQXyII=;
        b=v1GtW7utyd3bbfbep3QDuKfccWB/JumKSM+Da2BFIUewslryZyGSUex4kW+pJ/iY6X
         1sTL8J5JIExK72UTnSAduVDWOSECQw97mWtJRn/sqYkTfsa42mWyo23+0DInr+6of7vS
         qkFrfX6LQPa/C2CuM4EKqd3raapwl9akdvaBQEro0Ll8niHHvEe05e09hz4d8WBJ49Vh
         FvGTwj8vdlev5ceutoi40hrHmbw+Deb17Nz58y+3ASkFkSWruVyX0euEkMoDkbNKfUV5
         yJMGLhFqEzKOG9qrxPj1KhcVys/CTkdNZONn7V+ZU5d02j3aeiumxnSK7GnaKnnxKVhW
         vN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsTgJLrX7K95YgJ1S9Ds5IL+IAplewL1J/fAJJQXyII=;
        b=WcLOIzpCkianw5Y1vQXPZUYLTA5kKPd6ykJQlXJfDWsGiJ+jZJnUfOQaQA1mX7R9fo
         xr8V+ZDIfT9/vXmQWIEsRPpsoMMOIjUi3tUwd6HCSFSO7JVgvVMRw/zAMR6/c+wQuZ6s
         ZOxNtvVjp5lAx6tK1MUXDIZxF+CwEVuOpb2+HHowAUatbUp+17zr0lY8RYZ2VN7R8cM/
         uuBRQ8ggOEiKMQ6lpnyBcgdfhNByjD79yjuuAcXFFieOaaySN4dOVItHq7tG3dSPMzB7
         ggZNrJ6IyBY1aypygpnJslPUbhH7b8Z7TulkB29/MtlPTbDZHW/hrnR55+1FeQO0tmaz
         SBgw==
X-Gm-Message-State: ACrzQf2Up9tupg7raLJaScS0+i9EABL+WjwOHGLwBuhEbd5MgZx8zwAy
	UNNBDTtZl7E5wOuZKOX6lnS7j7nLqBOZIw==
X-Google-Smtp-Source: AMsMyM7ngFOvsflzJJ6T6B59IVAH05aw8a7lUB0rCzg/ELkFfJ3WwJ7TdOYNHQcozfCBEtU3RyWwZg==
X-Received: by 2002:a17:902:d486:b0:186:cf83:4ba8 with SMTP id c6-20020a170902d48600b00186cf834ba8mr361510plg.154.1666982492564;
        Fri, 28 Oct 2022 11:41:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b001780a528540sm3449760plg.93.2022.10.28.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 11:41:32 -0700 (PDT)
Date: Fri, 28 Oct 2022 11:41:32 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Oct 2022 11:41:01 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.1-rc3
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d47a53b0-2125-467d-a9ff-c17fd41d646b@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_114134_742831_4829FED0 
X-CRM114-Status: UNSURE (   8.59  )
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc3

for you to fetch changes up to d14e99bf95510fa2d6affc371ad68161afc1dc8e:

  RISC-V: Fix /proc/cpuinfo cpumask warning (2022-10-27 15:23:19 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.1-rc3

* A fix for a build warning in the jump_label code.
* One of the git://github -> https://github cleanups, for the SiFive
  drivers.
* A fix for the kasan initialization code, this still likely warrants
  some cleanups but that's a bigger problem and at least this fixes the
  crashes in the short term.
* A pair of fixes for extension support detection on mixed LLVM/GNU
  toolchains.
* A fix for a runtime warning in the /proc/cpuinfo code.

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: Fix /proc/cpuinfo cpumask warning

Conor Dooley (2):
      riscv: fix detection of toolchain Zicbom support
      riscv: fix detection of toolchain Zihintpause support

Jisheng Zhang (1):
      riscv: jump_label: mark arguments as const to satisfy asm constraints

Palmer Dabbelt (2):
      MAINTAINERS: git://github.com -> https://github.com for sifive
      Merge patch series "Fix RISC-V toolchain extension support detection"

Qinglin Pan (1):
      riscv: mm: add missing memcpy in kasan_init

 MAINTAINERS                             |  2 +-
 arch/riscv/Kconfig                      | 17 +++++++++++++----
 arch/riscv/Makefile                     |  6 ++----
 arch/riscv/include/asm/jump_label.h     |  8 ++++----
 arch/riscv/include/asm/vdso/processor.h |  2 +-
 arch/riscv/kernel/cpu.c                 |  3 +++
 arch/riscv/mm/kasan_init.c              |  7 ++++++-
 7 files changed, 30 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
