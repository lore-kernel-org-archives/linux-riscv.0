Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9FEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WKhF5QODIwvG14vdI46Ws7wQ/KBOXsAUVvS9d6ggWk=; b=mqmXtxLQmWH+sV
	pN6SiTirTIp6PMoyXQpCSnJj0PHwwt5TzDddCzd3hmS9+HNxhsbqU1XHWzfW6TkYbDenxDccIosGF
	t/GBU08p9QzSwb0a5J9wLZS0sobj6O3SeHVJAR0MVRY8J6iSufMZDJzUcre81ATOJG5q4J0IcJzHy
	pVP5ydKs2g7yJf/J05ds5BqdSm9mBzJO2Tz7eneARs9Jxnc5shj/q5NMOf6rm3wFhDlwNR5FfBohg
	S4kzCz1Bm4S0kWidLmc9V0Cdu4R4ahflAREVUJCG6X5uOdw9ibxGNb+URfPggv0JxvGoWNGoPF0UN
	o76sfkq+l0caFDJD6MZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWhb-009Tpq-7a; Mon, 31 Jan 2022 13:26:39 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWhW-009TnQ-CE
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:26:36 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:58b3:216b:d287:833])
 by michel.telenet-ops.be with bizsmtp
 id pRSU2600b2lsq0X06RSUsG; Mon, 31 Jan 2022 14:26:29 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhQ-00CaW7-Kc; Mon, 31 Jan 2022 14:26:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhP-00H7GS-To; Mon, 31 Jan 2022 14:26:27 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] RISC-V: Fix cpumask rework falloout
Date: Mon, 31 Jan 2022 14:26:19 +0100
Message-Id: <cover.1643635156.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_052634_594926_5A23B5D7 
X-CRM114-Status: GOOD (  15.33  )
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

This patch series intends to fix the fall-out from commit
26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid
bitmap"), cfr. the discussion in thread[1].

Thanks for your comments!

[1] "[PATCH v3 6/6] RISC-V: Do not use cpumask data structure for hartid
     bitmap"
    https://lore.kernel.org/r/20220120090918.2646626-7-atishp@rivosinc.com/

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
