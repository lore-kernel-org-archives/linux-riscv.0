Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17037C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z7Fj/VzpnRNkWMWSTXHG1+dYezLNc8UzNhajxSkaMgQ=; b=rGuLH7XeoMvtYr
	4IJAXthB3M+VyvN5E/ycF4vf2scpZM7Dv5nlgsEBFsz1Xnol80RsDPZd0850g0EzkGPmFEm0gPJvn
	haLL4NFiojl71FIFVoJR/5PNY0fHfP3bFPAebGv20ckSSlUyw1EcPVtjP6bWgxUHzskRsR9sZNbCc
	WPB4wFvpAe2nrsfzt07gzSj8MKUYkXcH9kIYuj1bjcvyftBE4O/8d/Ti2cxAOJyJUWSt86Vmf0hRK
	Yx7tGT5e5DYUx1NdLpPAnCkJruY/Cd2OiS2g6c33R8KxsP4/uIKj4rZKXWX8F2fBaQluaHh/wEXcf
	vodNLjAT7TYURecw8wWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNEV-0019DW-0A; Fri, 28 Jan 2022 09:07:51 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNEN-00199m-GL
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 09:07:46 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3999:e79d:cb59:f2ec])
 by albert.telenet-ops.be with bizsmtp
 id o97e2600a04fKGS0697eYP; Fri, 28 Jan 2022 10:07:41 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nDNEI-00BjuU-Gc; Fri, 28 Jan 2022 10:07:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nDNEH-005psA-Ur; Fri, 28 Jan 2022 10:07:37 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 0/2] dt-bindings: timer: sifive,
 clint: Miscellaneous improvements
Date: Fri, 28 Jan 2022 10:07:34 +0100
Message-Id: <cover.1643360652.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_010743_768722_1DDAEB70 
X-CRM114-Status: GOOD (  16.32  )
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

This patch series contains two improvements for the SiFive CLINT DT
bindings.

Changes compared to v3[1]:
  - Use architectural maximum instead of practical maximum of 10,
  - Add Reviewed-by (this time for real ;-).

Changes compared to v2[2]:
  - Add Acked-by, Reviewed-by.

Changes compared to v1[3]:
  - Split in two patches,
  - Improve patch description and document limit rationale.

Thanks!

[1] https://lore.kernel.org/r/cover.1639744468.git.geert@linux-m68k.org/
[2] https://lore.kernel.org/r/cover.1639662093.git.geert@linux-m68k.org
[3] https://lore.kernel.org/r/20211125152317.162958-1-geert@linux-m68k.org

Geert Uytterhoeven (2):
  dt-bindings: timer: sifive,clint: Fix number of interrupts
  dt-bindings: timer: sifive,clint: Group interrupt tuples

 .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

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
