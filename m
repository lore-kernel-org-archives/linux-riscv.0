Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6778C54788
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vyEcjikirHFu38eOoXLHXEwQVpzFEtoUlk7nm9tKGUA=; b=S0n4vuQzlWYUjv
	Q1iRO9DOl3g/bSplRlT46AlYN685599UfKC+VGZOKZoethSE4i0cj5k+A6FPridwlhNojmwqwpsCd
	DGqGUGYBxQrtbiSFqMfET/o1PpqUyhoXF0CXGY1lkPgatfwuwY9L6cFVh6e2mdyYKAoXR4mWHU3G/
	Kygv8SodqWIJXnIKhWFRAcG/YCM1QU+fxTIF51DfdxY/a9LI0EkmBpOt6DdDvWeFMjVdBi13Daun6
	eYi/Qxy10mcMd4RTORFkFr5/IU+dzK6aTLN4tHK4VKtRQnnh+/ZWe1OXV2x+Gs6KuinUcmGEDb2Ni
	EB27iCIpz9PKjsbKxBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8Xc-00000004tlg-3q2S;
	Thu, 22 Feb 2024 12:51:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8XZ-00000004tkc-3Jb7
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 12:51:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-58962bf3f89so2325961a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 04:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708606263; x=1709211063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dGL6re92CbNNHJMPdFIuyeYfruvRTt7XkXoiR2obBU=;
        b=RU+F79/tInVRmHp73D3kQAeq4Dg9bzXzO2Q1MbZUmCDqdDXqTYylHo2PKgroF6xssH
         6MdNS/uvNzcX2uGPgHgZs3jGFtbHJxhiRoFc2nCjHXzq4So9YzYsMCGxL9D5kXxrvFiO
         8Snguw18pYr8XihKsbBesQsyGjGO7yBzUIS6z+BevUQ9ml6uNQLAQVaGFT+a8GGWrP0t
         1ifOJeT2gwXwL0dNXM2hO0uv4PqtA09t21puhl5bIcB2JUtKluS4Cl4Eg3G8UyTlvWaE
         VyAmUNFR6nseFHnr1vOV4zDOxdKEwxvX0kSxTMn8LIYd/gCMK0XZEpmrAU8Pk2agyhqO
         m+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606263; x=1709211063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dGL6re92CbNNHJMPdFIuyeYfruvRTt7XkXoiR2obBU=;
        b=wbuhntURrozHPGNtsxP58Vb9/JsC8LLAUiZ72AMTMOA/NjJ+FuZVHMeAmWqkF4x4F1
         SD902gHmPnlMETNAfYdwxfHBm4yCW7WE/7FKYnc/UWyHCy2Huwp0idp7rbLhADMGR6P/
         jyLI1MmQ1axhertilHywp9QW0BKfqy6QLvEgRSq3JUL/IE3R4DLDb5mriy/AVsa6yEPd
         LwOH5m8lTeTm/3mUbXHTPRo1xAYC53b8+FK3nCZm0cRqkD/7viQ1itCjJpZIhfmbSFZw
         mwTh2ZXiiuWZ6fTkFJkZPSE12cw4qjD1/t0n1exDYUAIVPVJcE3EFclqdSWN1yVsKWmK
         gg+w==
X-Gm-Message-State: AOJu0Yx6bFKmB1whASFyco1LwOhJsSWmwebuFnUJPoH45gfg5kz/BQMA
	jDqfDJ2uDsZKj2ioQqMfAkwz9NGsVECjL+iFjzKfv6y3U1O+DqxC683waOigLh7RL6CG7tAfnT0
	V
X-Google-Smtp-Source: AGHT+IGzq1UgKqcEc6MKfHFEbuy/83jvLzb8ZV8t+axyKqng12tbOej5W7pSGAiRksWjBSdw2xzwUw==
X-Received: by 2002:a17:903:50b:b0:1db:4b1b:d726 with SMTP id jn11-20020a170903050b00b001db4b1bd726mr19709333plb.1.1708606263443;
        Thu, 22 Feb 2024 04:51:03 -0800 (PST)
Received: from aryabhatta.. ([49.37.248.155])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902e90500b001db7599aba0sm9898438pld.24.2024.02.22.04.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 04:51:03 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 0/2] Introduce support for hardware break/watchpoints
Date: Thu, 22 Feb 2024 18:20:57 +0530
Message-Id: <20240222125059.13331-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_045105_902231_346340ED 
X-CRM114-Status: UNSURE (   8.97  )
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

This patchset adds support of hardware breakpoints and watchpoints
in RISC-V architecture. The framework is built on top of perf subsystem and
SBI debug trigger extension.

Currently following features are not supported and are in works:
 - Ptrace support
 - Single stepping
 - Virtualization of debug triggers

The SBI debug trigger extension proposal (Draft v6) can be found at:
https://lists.riscv.org/g/sig-hypervisors/message/361

The Sdtrig ISA is part of RISC-V debug specification which can be
found at:
https://github.com/riscv/riscv-debug-spec

Himanshu Chauhan (2):
  riscv: Add SBI debug trigger extension and function ids
  riscv: Introduce support for hardware break/watchpoints

 arch/riscv/Kconfig                     |   1 +
 arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/include/asm/sbi.h           |  31 ++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 7 files changed, 1027 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
