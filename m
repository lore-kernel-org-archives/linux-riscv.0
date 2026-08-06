Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63715C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nAWFi3XEjurSc56M2cPwVSTKW1n1YLPhhkQXjBNFlkc=; b=BA3
	KRiQCzA9XC0Cdp/b+EmR50Wu7tQDHEfRqWW+gb419UypIdJWyJWralSKTkeDx7M2fFVIUcFW/ZwIs
	N4pVazfawVMOt00LBd6UICyEVnphfTEeBap2UZUtSSGHLWkDmmt1LBpmPk4XlL+9cBUADaRsusSqh
	LqqxdEspJOaK+EGaKuAa4R4tmfOiZTh2WCTrwu7fS9Zj2LXA2D4Ujw8f9i1cTaIRksVMUDk8jJ3zY
	xslGNaWhBnjIIIHH52OSlnQn3GJwZ27gh6mENIqtqm8ZkYU4vXz7NqQwskJfC+8I21w6t8Qn1s2pZ
	/+MR/44sH7HLsXJQ4V50Z+WsoSENSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFF-000000050Gu-0HvA;
	Thu, 06 Aug 2026 06:06:21 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrFD-000000050Gc-0QQ7
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 06:06:20 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2587422a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785996377; x=1786601177; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGSbRQn1bcdcN1bAJAOaPOYrt3Xt96tuuRrOCkSdcq4=;
        b=D3/YYpprpoKC5hEc8OAlWFGEsxlC2zNrfftkZfzaUUx93hEEqesRNq497LzaTpoet7
         6D1XCL+lCTYIa0G5AA+JRlkgTTusIeU45bBYccOFZaOyEhiS8jQX/ggBtCE6gUVBnNkH
         vySsJuIgFbpw05Wyfo2KBeQKSKmGba1Rm1lZ1pTCruGwiml8kttsyZ8tC/G1knJrKzrm
         IEQNK9p8rD53d8QicWp3kbBubVkxRkY4qaEWorDm77b7CVlzdu1+Gg63BGRooVWiSXpe
         EKBC1sdkKEpwiapmLe2swJZ/kA+7KKT/sR35iJWxH56ARg2aXaxEFss7oocIDuXCKvPm
         Ck2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996377; x=1786601177;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGSbRQn1bcdcN1bAJAOaPOYrt3Xt96tuuRrOCkSdcq4=;
        b=d/zjJXhH2pr8HEGO7AcpGSPNtXueTfgPkBJytYNJS/jMaWHtZNIxL1tzZl/E5cl1hZ
         eezRFTuQdzsCo0YLmhIVsYewfCJPG+AbjNuFn/VXmXyeabQmilt3aYXrYcM4Zb1WyTdJ
         3MvTEp6mFBpND9DAZkG3AY+iUx4dYbltxjAf0rOh6oci6GJbRsw8hlASHgPm/1mSr15U
         j16punnM0J4ZrPJZvAp592X6ZenmwKeuVvoJ+ed38grx1s7vqn5/oSEDaQjTGedRk6gW
         lfyLmItPfe6pRq+IaGpgIx9D1lHk6KdSDF38ikHPnoV2fsnfzmffhU/HEHwDHONiOC8A
         HOzg==
X-Forwarded-Encrypted: i=1; AHgh+RqTyrzvWCbZraCEWuH2N/2Ez3dB3gXS02kpaOeOaByWTEJe6CaypEeDYkX0/v7Kzk/Aswyp+F27oMTIGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDqQEBrYGQ+lGtj+fva5NMtJ3M1wABD9dXFsQoo/GoyuV0woj8
	1cTBc7tITiLQMI5dq9QDZfAO30x/HY96L4/u7dZRRqzALgMccfYYiXX2Kf3ox/PMaiU5vWvK/TY
	U0hetnMTJRw==
X-Received: from pjlk1.prod.google.com ([2002:a17:90a:7f01:b0:381:705:64e1])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dca:b0:38c:e9e9:e7ce
 with SMTP id 98e67ed59e1d1-3903c559283mr13844627a91.3.1785996376654; Wed, 05
 Aug 2026 23:06:16 -0700 (PDT)
Date: Thu,  6 Aug 2026 06:05:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260806060556.451370-1-wfelipe@google.com>
Subject: [PATCH 0/3] init/Kconfig: generalize config COMMAND_LINE_SIZE
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Wilson Felipe Pereira <wfelipe@google.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_230619_137995_42ADB98C 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series promotes COMMAND_LINE_SIZE from arch/s390/Kconfig to
init/Kconfig to be generally available to other architectures.

In some use cases, such as netboot kernels, rootfs configurations, larger
initramfs setups, require larger sizes. While for embedded workloads, it
can be reduced to save memory.

Since COMMAND_LINE_SIZE can be larger, it also makes sense to allow
INIT_ENV_ARG_LIMIT to be configured.

Wilson Felipe Pereira (3):
  init/Kconfig: generalize config COMMAND_LINE_SIZE to all architectures
  arch: use CONFIG_COMMAND_LINE_SIZE across all architectures
  init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable

 arch/alpha/include/uapi/asm/setup.h      |  4 ++++
 arch/arc/include/asm/setup.h             |  2 +-
 arch/arm/include/uapi/asm/setup.h        |  6 +++++-
 arch/arm64/include/uapi/asm/setup.h      |  4 ++++
 arch/loongarch/include/uapi/asm/setup.h  |  4 ++++
 arch/m68k/include/uapi/asm/setup.h       |  6 +++++-
 arch/microblaze/include/uapi/asm/setup.h |  4 ++++
 arch/mips/include/uapi/asm/setup.h       |  4 ++++
 arch/parisc/include/uapi/asm/setup.h     |  4 ++++
 arch/powerpc/include/uapi/asm/setup.h    |  4 ++++
 arch/riscv/include/uapi/asm/setup.h      |  4 ++++
 arch/s390/Kconfig                        |  8 --------
 arch/sparc/include/uapi/asm/setup.h      | 10 +++++++---
 arch/um/include/asm/setup.h              |  2 +-
 arch/x86/include/asm/setup.h             |  2 +-
 arch/xtensa/include/uapi/asm/setup.h     |  4 ++++
 include/uapi/asm-generic/setup.h         |  4 ++++
 init/Kconfig                             | 15 ++++++++++++++-
 18 files changed, 74 insertions(+), 17 deletions(-)

--
2.55.0.654.g21b8a5bc05-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
