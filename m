Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F7BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8EQ0T9WDZpo9KWkAyKKEvpzY5SGY/DLoE/BfNi6oq0=; b=FDhfDLmAP7MYwm
	N/6IBJGf4ulvtPj8a/F6CAtRtC8O+PaxPJm2J1ICwVygGTdeGyVCcL+5JaV9H45Fmqq0dFEbSthi9
	MSi7Or0ec8268AK9hJ6pBWEKLgzO1RDKW43TecSu9Tn16WNwhWr1AFZU12tj6mYqkPKf4lmzDzL0q
	NnuUAQ96YnPptCg4IfSwBMPpt4PpqmcqJt5I7zb9bskPGjp10YxY9deI1t97KGoVffei1TWXbffuW
	GL+Lomh2/Xzk9TvT5W8cDi/iHyWKwBhE1PCeAmD79Kp4qQH6Tdg48JolH4s0l2f6ZU/Ke/9LZC7wU
	fp5Q1eo4tm+ZKpqXL0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHilU-00Gkyf-SI; Wed, 09 Feb 2022 08:55:52 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHiju-00Gk7j-T7
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 08:54:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:54c7:c522:3859:290])
 by baptiste.telenet-ops.be with bizsmtp
 id swu4260014VQqf501wu4K1; Wed, 09 Feb 2022 09:54:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHijj-000DIg-CE; Wed, 09 Feb 2022 09:54:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHiji-00DkLg-LU; Wed, 09 Feb 2022 09:54:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/3] RISC-V: Fix cpumask rework fall-out
Date: Wed,  9 Feb 2022 09:53:58 +0100
Message-Id: <cover.1644396407.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_005415_140543_5189789F 
X-CRM114-Status: GOOD (  16.23  )
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

	Hi all,

This patch series fixes the fall-out from commit 26fb751ca37846c9
("RISC-V: Do not use cpumask data structure for hartid bitmap"), cfr.
the discussion in thread[1].  Most important, it fixes userspace crashes
on systems where the first CPU does not have the lowest Hart ID.

Changes compared to v1[2]:
  - Add Reviewed-by, Tested-by.

Thanks for applying!

[1] "[PATCH v3 6/6] RISC-V: Do not use cpumask data structure for hartid
     bitmap"
    https://lore.kernel.org/r/20220120090918.2646626-7-atishp@rivosinc.com/
[2] "[PATCH 0/3] RISC-V: Fix cpumask rework falloout"
    https://lore.kernel.org/all/cover.1643635156.git.geert@linux-m68k.org/

Geert Uytterhoeven (3):
  RISC-V: Fix hartid mask handling for hartid 31 and up
  RISC-V: Fix handling of empty cpu masks
  RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid ordering

 arch/riscv/kernel/sbi.c | 72 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 25 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
