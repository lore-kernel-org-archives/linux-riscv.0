Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A2EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RPfQ8Bhkb1iOzizbASK3k3ddNMlxAHvuhSNswOaS3pk=; b=OCbZbq2CCsNeG9
	i47Trtjip2pr23PmSg7ELlfpf7zbGTBH2Q+eOoY8sKbQN827aoyFZgamXqWakN0I1B1os1yJCwalr
	QDQS++bmtcJMGbapHfZwdAgHt/WbDq4OHqqQ57Z+teQDpYlqSlO/rDeOCYmO6mMu5Fr/p+U/p6Drj
	+VMHQJ8k3fECVCViulOvEL1fW07ZQQ73M0lgMA4EVA/oga9bNSf78W8MCJCFM8xEXxHioF+qANFtj
	JE2CV3e3W+tEujS64KlqKTctPCix67b6ZmZXK5mcZ45P3QNMjZuTBKdyNLtIvrMiuV+NqTEaoZOVT
	itGWt/Hlz8CG5jnlz1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJK4-006Kpy-36;
	Fri, 14 Jul 2023 13:59:04 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJK1-006KlB-0d
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 13:59:02 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bb119be881so8129635ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689343139; x=1691935139;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n+At+8xi69gBbD6TfRysRNivcXiaDRsl+xovEf19KU=;
        b=jo5k+NLAbC/ndaJ1oHqHaiBNHxfJ607vhJ4LfTdmfny/4ckLBwprejctuwuS0VNzMK
         +jJ+dI5QCMPBSX0JY5JvL4rtTII2EyRE/kvaaTCOAzBnolGPwkQ3+pe0AAHv8RTbvvqZ
         QvbTqIaPuSprIoMffFy+BEaG0UDjdPSAqVj0sLhISM7Ax9hgut3PP0v4XlKqiQS7JDq6
         +u6NjjKeXYCl8mL6nytd/6YcXBNF57O3tCS5md3/I090wtCkJryXTDqbFDky5KPHy9JF
         dRbfRdutxwfss87WHUmGjy0+MMt2slwqGTEi+dvTyC9sKIERHepsuaCjA4VU871rnU7p
         t2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343139; x=1691935139;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n+At+8xi69gBbD6TfRysRNivcXiaDRsl+xovEf19KU=;
        b=RcNPwAXTwzoaaFHvZPe623ZJb908ceW03+OlkL8ZgTY2CbAQPyegYdIaftj8P4fSjM
         c/Z5DWrkwmnxFd/S8cK3QOir8VW/IXdCkuF1g2EqaRvpdYfdrMTE3sAVG/CMzl8c7OJB
         ObC1vQJzGKeAVoPOvpqo0GLCVI0q9XFSm4nGC1pXKswLpW7lGYtL9Y7kZsgkiIKsGGIf
         pJwBOXQibKeR3UMPt5Yv2QmTiXI0DZ0fjqPEkDGlxzRQX2DDDoETOP6kYu88wMW9WUUx
         Z134HJLbVrdOtAbtSaL/02DrrVK+LaGPwC+bCVSGFSjTwdylvpV/toH4IduHt1o8Zb4e
         gJWA==
X-Gm-Message-State: ABy/qLZCWNGKAEuIpe/7dTnRMWjmkUNvdIUwN/7d8FFKPQhgyKoYNhnF
	e9UZ2yHT0tqSSB+pY8d4rYjuRnAWW+CqS6Nv5bc=
X-Google-Smtp-Source: APBJJlGBde31pPNZ6ICzy2zL2r0ulqrihLJzktzlepVmoM6plKTmCCyZATGupOaAIEyGfD+moxNK4A==
X-Received: by 2002:a17:902:d382:b0:1b9:cb8b:3bd3 with SMTP id e2-20020a170902d38200b001b9cb8b3bd3mr4656013pld.31.1689343139306;
        Fri, 14 Jul 2023 06:58:59 -0700 (PDT)
Received: from localhost ([50.173.2.66])
        by smtp.gmail.com with ESMTPSA id o2-20020a170902d4c200b001ab39cd875csm5645732plg.133.2023.07.14.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:58:58 -0700 (PDT)
Date: Fri, 14 Jul 2023 06:58:58 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jul 2023 06:57:36 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.5-rc2
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c0a9115b-10ec-4bf0-8c4f-af009c34423f@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_065901_449836_1F9F85E0 
X-CRM114-Status: UNSURE (   6.70  )
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

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc2

for you to fetch changes up to ab2dbc7accedc2e98eb7d8b8878d337e3b36c95d:

  RISC-V: Don't include Zicsr or Zifencei in I from ACPI (2023-07-12 10:04:40 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.5-rc2

* A fix for a formatting error in the hwprobe documentation.
* A fix for a spurious warning in the RISC-V PMU driver.
* A fix for memory detection on rv32, which does not manifest on any
  known system.
* A fix to avoid parsing legacy parsing of I in ACPI ISA strings.

----------------------------------------------------------------
Eric Lin (1):
      perf: RISC-V: Remove PERF_HES_STOPPED flag checking in riscv_pmu_start()

Jisheng Zhang (1):
      riscv: mm: fix truncation warning on RV32

Palmer Dabbelt (2):
      Documentation: RISC-V: hwprobe: Fix a formatting error
      RISC-V: Don't include Zicsr or Zifencei in I from ACPI

 Documentation/riscv/hwprobe.rst | 2 +-
 arch/riscv/kernel/cpufeature.c  | 9 ++-------
 arch/riscv/mm/init.c            | 2 +-
 drivers/perf/riscv_pmu.c        | 3 ---
 4 files changed, 4 insertions(+), 12 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
