Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E67C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xjT++3HL4aizGzrnUYnkePm4ur3ZvmF0AOiDtcUxshE=; b=cJ7P3DQdwx5TY4
	n+oxTNG7aQn1LcX61kJR05pCCW3GyKjE41QmB7TJnJRopIzsm5qI242WXXFKvenHnvntmgjV24SKr
	gMNd0l23dAw8LYY/y+dvdwDmKQiCuDd+kyiQasQoiwemS0X14K5ob+pIngNrmdCaFQ5d37eQAEqWe
	Nm+nKJScu2dUZqvF6Ja8MLX58SXz1TsxK7izqgSsZwOjdmdBYhLe0Rk3EV/q3PJMHOFzIZDD6NRq+
	3GqHhlv2I3TO/cU2x/SxtTaXcNCaHDkcTnOHQQqrDXkpkhKgH1O18+aC0Wiy2+bS86gny0RvOOjlb
	y4r+reHP2BP0kUIZoajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otXMl-00H3FS-Dt; Fri, 11 Nov 2022 16:58:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otXMg-00H3DH-Vb
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 16:58:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k7so4675120pll.6
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 08:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYSSEXPwNN5u2j3n4bUYzsFQHmcrk65kX58qhVbQYMY=;
        b=W4BhOVK2/noP8zzUmqFmtsrMiWmVnlZve2pz/mntzK8k9IoiTI5kCSGXiBzsY1z1gi
         0BdYW/y8Ir8RCx6zAS8zqPlSZokMJU7ZeNiM5Suv4noYBKulUwfKWGpZR/iz0jf/ykiG
         ASEDiFjRqDpHR0XNf8idDq2789NbuGvMqOtIFAgcO4SfBA/4MCsdVZBjMw5U0z+kwEM6
         eyuTHE3+SsX/9GLSxieqAkzFFc1aGMx5n+DPjECceOtUFE66HnPMSNYrHoN3xjeHJ4lv
         a0mr+XadDI4gBOP6CPhYe/1AF6VhVho+XTo3WZ93ruh3zePJJcQGlFS1oEizJ4bMnSbO
         vIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYSSEXPwNN5u2j3n4bUYzsFQHmcrk65kX58qhVbQYMY=;
        b=4HRVGT/u8qaP2kBksCYHI0YLzLS9/MjfT5MR29QgfVYN9NoYn32+3USACIiHyxHMTm
         k0vNUJZOd8MQyU4baZEzN64jApPt73P8kJawhAwimGbLV9KY5U/IW3cdMWP3E49fAEGx
         rKK6TMkHEDEa40PNfNjH1tYLm9dNrbPqe+WXXHilhkgAKuoSUa1hjhEEOuJJYsBcO7cU
         GbmYhaHL04+OvfRWThszt+flxu1sod0i5VvW7gMFJ9jWnXb6ua5TqqTlbRKBUFuibdpE
         Yhgfgzsc42QeWUAtEUGZppIr11dYVxUQ1W76PquFl35I+uBKQdbdJeCztHeNWDw/I8yW
         qk4A==
X-Gm-Message-State: ANoB5pm5FxSgVjmR0qN8FtAiGhqFsuQhs9TU/PpWTDQtrIUlQchXXRpB
	0nvk9wzy69PONjm2zVukpq8LWLALc4ilQw==
X-Google-Smtp-Source: AA0mqf46tMhNW+0g1fP7XCrL/EIuUsTpa3qmBUZ7KgocDJoJzAlT8yeqDtKQfdrDKz0vQIM1/xaKtg==
X-Received: by 2002:a17:903:2113:b0:186:b063:339 with SMTP id o19-20020a170903211300b00186b0630339mr3388647ple.70.1668185926815;
        Fri, 11 Nov 2022 08:58:46 -0800 (PST)
Received: from localhost ([135.180.227.92])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b00178143a728esm1916305pll.275.2022.11.11.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:58:46 -0800 (PST)
Date: Fri, 11 Nov 2022 08:58:46 -0800 (PST)
X-Google-Original-Date: Fri, 11 Nov 2022 08:48:38 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.1-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-a9c9d14d-1da7-4c8d-b117-b207616f77a4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_085851_034366_FC1E82D1 
X-CRM114-Status: UNSURE (   9.94  )
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

The following changes since commit d14e99bf95510fa2d6affc371ad68161afc1dc8e:

  RISC-V: Fix /proc/cpuinfo cpumask warning (2022-10-27 15:23:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc5

for you to fetch changes up to fcae44fd36d052e956e69a64642fc03820968d78:

  RISC-V: vdso: Do not add missing symbols to version section in linker script (2022-11-10 15:06:14 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.1-rc5

* A fix to add the missing PWM LEDs into the  SiFive HiFive Unleashed
  device tree.
* A fix to fully clear a task's registers on creation, as they end up in
  userspace and thus leak kernel memory.
* A pair of VDSO-related build fixes that manifest on recent LLVM-based
  toolchains.
* A fix to our early init to ensure the DT is adequately processed
  before reserved memory nodes are processed.

----------------------------------------------------------------
I did get one soft lockup earlier this week, but it doesn't seem to reliably
reproduce and happens without these patches.

----------------------------------------------------------------
Conor Dooley (1):
      riscv: fix reserved memory setup

Emil Renner Berthing (1):
      riscv: dts: sifive unleashed: Add PWM controlled LEDs

Jisheng Zhang (2):
      riscv: process: fix kernel info leakage
      riscv: vdso: fix build with llvm

Nathan Chancellor (1):
      RISC-V: vdso: Do not add missing symbols to version section in linker script

 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 38 ++++++++++++++++++++++
 arch/riscv/kernel/process.c                        |  2 ++
 arch/riscv/kernel/setup.c                          |  1 +
 arch/riscv/kernel/vdso/Makefile                    |  5 ++-
 arch/riscv/kernel/vdso/vdso.lds.S                  |  2 ++
 arch/riscv/mm/init.c                               |  1 -
 6 files changed, 47 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
