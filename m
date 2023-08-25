Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DF8C71133
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yUeIi8JTUkZUmha6AuWhBTioHCy5HHi/pFdqQ0927KU=; b=vL0UmFT/h76Ef+
	K1NsjyJIfaqzmQKMNd7n//oEwH96+r37eLT6EP7qClvUiEFVncmA1gRJOiMj/rPi52a29bnznnn8s
	XKCv5pWFLWNsPXkF6FxVpbTJrZ6NYeYRLULsAgiNLNkBV0TLV4/aBcfpjgS79pcAzbbHZyENSYIEW
	Zc2UwbeTCWmL6vAs9YjNJ5ba/p1CLIEy8nWZdOpVHyt6e1pxFhiXOk+Frc2JS74jjvATptj/gD8uH
	G8+n1wbYaXjmFqwIP7nSxJikkfU7bz+munDhEhCbMPZpnvloZ+tCXjOUM6yrAjBFG3FWtB6R8NXL8
	jl223u8ZCjimL6uQ4gTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWgC-005S78-0Q;
	Fri, 25 Aug 2023 13:16:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWg8-005S6D-20
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 13:16:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf48546ccfso6741235ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692969402; x=1693574202;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rO/T+VQAJjKyFqYU/q8vdJEmTES2395aidBJOFqlkc=;
        b=ugf4EtqYq2JVD/vAGeFD6EbdjYI93k0jVrPkERBv58xTOuFkDnt9ifB5NSChYQDi7j
         1nu+WjzYtK6ir/P1OAY35X2HYj/LXQlTFazawP8dLBfAjemXkSd0YHgPIs2Tzf25XgAB
         M9BeSQCkaBJnc7cs6GGm4J58Ouhr+PCow9dG7mSLHReSKTD/2ipaLDsY7cGIIwYIBQKR
         szjf022J0YCd40+BetUEY7pIctRCrFuFG3cgGCxZk9ekJWxl/vboVfQ9mq4CA8mqONO2
         80sp6lQRGRMYGJmKwvxhp6tMhUtbl+v/SpKIyXcyMiUj22gPdmBwddmb1nxt78Vtvpzn
         6H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692969402; x=1693574202;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rO/T+VQAJjKyFqYU/q8vdJEmTES2395aidBJOFqlkc=;
        b=Snn6RS2Qpbys8BLg0cE0oJuQiLRGEA+dPsuUw1m6RcxCUBDn0ojdFZL2RIK6bucfNU
         F2IgG1DliALONEancMzDMJ5X2RzeldCxZ44ART2l0W79ga5Z+7BZPWKs3iNHXjeSUMzX
         F3laHEma/jTEyaG+V3srXs+y25uujK6whNWhw3bVKd7O+OxTWsYVWKapyCmK3kGSEDiq
         9VPSC17e4KxDj6OrYfH8y41cOJi6ellpHKGFN2EBuAtwOASIJQJONDkNKr9ylY7b4Lda
         0/flg7X9yr21AsSgFhcSQbqbRnXaJtDwSG2gvApifaGWaC4KUFmlmF7dEItaSYEu9h4V
         b0SQ==
X-Gm-Message-State: AOJu0Yzd6g8lW9MYeerrzYCw59f+3jxlFHYLXSnw9mPzt1yHDD1ssf7C
	vrmbmPUdiZ1WAaH2ZGbQ1+dZ4XmOnzIOPKO2mys=
X-Google-Smtp-Source: AGHT+IHBevM73Kvye69jaRbhoCXokaiiVy88IwWofacgNFMm10yHyulUw6HZsXBBoWq194yqe8RtUA==
X-Received: by 2002:a17:903:4cd:b0:1bb:b855:db3c with SMTP id jm13-20020a17090304cd00b001bbb855db3cmr14119522plb.41.1692969401992;
        Fri, 25 Aug 2023 06:16:41 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902ed1300b001bb99ea5d02sm1661383pld.4.2023.08.25.06.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:16:41 -0700 (PDT)
Date: Fri, 25 Aug 2023 06:16:41 -0700 (PDT)
X-Google-Original-Date: Fri, 25 Aug 2023 06:15:01 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.5-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f80b6a8e-79e3-486b-95e4-18c04a1be0dd@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_061644_853246_1BF08933 
X-CRM114-Status: GOOD (  12.80  )
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

The following changes since commit ca09f772cccaeec4cd05a21528c37a260aa2dd2c:

  riscv: Handle zicsr/zifencei issue between gcc and binutils (2023-08-16 07:39:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc8

for you to fetch changes up to ef21fa7c198e04f3d3053b1c5b5f2b4b225c3350:

  riscv: Fix build errors using binutils2.37 toolchains (2023-08-24 12:35:20 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.5-rc8

* The vector ucontext extension has been extended with vlenb.
* The vector registers ELF core dump note type has been changed to avoid
  aliasing with the CSR type used in embedded systems.
* Support for accessing vector registers via ptrace() has been reverted.
* Another build fix for the ISA spec changes around Zifencei/Zicsr that
  manifests on some systems built with binutils-2.37 and gcc-11.2.

----------------------------------------------------------------
This is obviously not ideal, particularly for something this late in the cycle.
Unfortunately we found some uABI issues in the vector support while reviewing
the GDB port, which has triggered a revert -- probably a good sign we should
have reviewed GDB before merging this, I guess I just dropped the ball because
I was so worried about the context extension and libc suff I forgot.  Hence the
late revert.

There's some risk here as we're still exposing the vector context for signal
handlers, but changing that would have meant reverting all of the vector
support.  The issues we've found so far have been fixed already and they
weren't absolute showstoppers, so we're essentially just playing it safe by
holding ptrace support for another release (or until we get through a proper
userspace code review).

So sorry for the churn, I'll try to be more careful next time.

----------------------------------------------------------------
Andy Chiu (1):
      RISC-V: vector: export VLENB csr in __sc_riscv_v_state

Mingzheng Xing (1):
      riscv: Fix build errors using binutils2.37 toolchains

Palmer Dabbelt (2):
      RISC-V: Remove ptrace support for vectors
      Merge patch series "riscv: fix ptrace and export VLENB"

 arch/riscv/Kconfig                   |  8 ++---
 arch/riscv/include/asm/vector.h      |  3 +-
 arch/riscv/include/uapi/asm/ptrace.h |  1 +
 arch/riscv/kernel/ptrace.c           | 69 ------------------------------------
 include/uapi/linux/elf.h             |  1 -
 5 files changed, 7 insertions(+), 75 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
