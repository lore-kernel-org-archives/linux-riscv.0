Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD0C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iOnUuUsQuiJrbJBX8xGg3VKHW65visZ3DaF5PCRDyXs=; b=UFowTFOR7tsbrA
	1FFftJY13aDo/HbmEMcDoNGrWjacVvbit0JEcR5pX5i1Zwu5pzIMbEgYE+FcyrmvYaPRzbIM4pSuv
	9AdtlWUIFFnRXg+hcQ3tn/HI8qmdxWzVnRl+YGw8YIBqDXeicyh+wNzLBtwkejw8s0vYX8Uyg9c9Q
	+eT2CS5Cdqke/VTar9Q/b5SzZsNxs23gp0ez7Wsk3g4JLM9GIXkRdGUGWLeOL3uPJsPje0RtjR9CR
	LTqv9qjeTaGn1+Sj4mFwOfpKQBoJezAtQrm2/yHL/xYkh3/A8tZ05ctZVmpv2hUF9xiFDEKZCB4Fn
	N7vYPq3HMjRRwC5lxAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pafuy-00FNUs-4Q; Fri, 10 Mar 2023 16:48:32 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paftE-00FMN6-Pu
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 16:46:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id i5so6229248pla.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678466802;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35SjvhjPtwHw5aEHQu1svgOUWOsHT5bfGA8ICnLpgS0=;
        b=zcdY0Nbj0AJ9UdeIQReFskHQI7bg46DdKpRB8sPggT48hTNg88rnjZsYmIDcGJAnKc
         9z+xET/bx7NkkvSiFaGBD8Y6ETPwSf3tG8jLkkQhLQJ6Tqc1OxL/SHPw2pZwY42c66JP
         qVuZ7Z4Yz0Of0xItPMzAAPCMLQH0DAxf2AhUezos//ta7iJeycGbg7Kw0vmGo53FGfc9
         20fKVoklJga4anp3JSXYZMeaNi87+BBkf1fQnJyJkqtFKshxmcNSr04Lz8zOmGoHx1YW
         SQ599UmwKOzeD/Tm7GCeBf8p03aVWjkG6FCCG5g6g3/xOCnUQVIevwNapChkxkYvD7mX
         Cr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678466802;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35SjvhjPtwHw5aEHQu1svgOUWOsHT5bfGA8ICnLpgS0=;
        b=Es04Za6KrMupu9sFq9BDROHU3FACSdlWknllZvaXfBokq05KiQrbuPwY9OBkRwGwbM
         RFX0hssYTy+CumcTeNZnp9AaFryxeKoqmKMmEjudJiD+StS3ROMC8N/KblOOPWxPpLTD
         75thmaVrRaL5AMcTNs4OvH854PcJVjnTy16nxh5Y57g+brdr4yLyPQ0e75E7ZYJ/upJO
         1nqG6n2rpWy9I23dKzW2flX47NunZUXOwDCj3EnLOYtlFdISTqLAw1E3PuJS0tA1/cUO
         p+OEBywUesDob3pZfGJENj7jou2E2VVB6iTfrmo4woJL6gg9ikn4tNHW2VOSHdxNo6jy
         v8BA==
X-Gm-Message-State: AO0yUKWwQpWckd8jYqYjk/DKh5t/7iAZf/rQXQ5px596sYZ/7MAaGb/i
	UanOPhrinETqZ/KevEog2XmpD2hMCV6t3CiKFHY=
X-Google-Smtp-Source: AK7set8I5RJlEXzf+OxgwsivP9v9gXmqOhyDr2jbVSvTQKe6bfEMoR9t4LXVe4wkaeYLmse+voku7Q==
X-Received: by 2002:a17:90b:1a8f:b0:22c:59c3:8694 with SMTP id ng15-20020a17090b1a8f00b0022c59c38694mr26601678pjb.44.1678466802012;
        Fri, 10 Mar 2023 08:46:42 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a2f8300b0023b29b464f9sm59399pjd.27.2023.03.10.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 08:46:41 -0800 (PST)
Date: Fri, 10 Mar 2023 08:46:41 -0800 (PST)
X-Google-Original-Date: Fri, 10 Mar 2023 08:45:18 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.3-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-6fd4abee-eb36-4748-9b07-d310908f08bb@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_084645_063495_DE05477B 
X-CRM114-Status: GOOD (  10.11  )
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

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc2

for you to fetch changes up to 2a8db5ec4a28a0fce822d10224db9471a44b6925:

  RISC-V: Don't check text_mutex during stop_machine (2023-03-09 14:58:51 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.3-rc2

* RISC-V architecture-specific ELF attributes have been disabled in the
  kernel builds.
* A fix for a locking failure while during errata patching that
  manifests on SiFive-based systems.
* A fix for a KASAN failure during stack unwinding.
* A fix for some lockdep failures during text patching.

----------------------------------------------------------------
There's a handful of failures with this alone, but they're all merge window
regressions from other trees and have been fixed in master already.  I figured
it would be saner to just keep this on rc1 rather than try and pull anything
else in.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Use READ_ONCE_NOCHECK in imprecise unwinding stack mode

Conor Dooley (2):
      RISC-V: fix taking the text_mutex twice during sifive errata patching
      RISC-V: Don't check text_mutex during stop_machine

Palmer Dabbelt (1):
      RISC-V: Stop emitting attributes

 arch/riscv/Makefile                    |  7 +++++++
 arch/riscv/errata/sifive/errata.c      |  2 +-
 arch/riscv/include/asm/ftrace.h        |  2 +-
 arch/riscv/include/asm/patch.h         |  2 ++
 arch/riscv/kernel/compat_vdso/Makefile |  4 ++++
 arch/riscv/kernel/ftrace.c             | 13 +++++++++++--
 arch/riscv/kernel/patch.c              | 28 +++++++++++++++++++++++++---
 arch/riscv/kernel/stacktrace.c         |  2 +-
 8 files changed, 52 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
