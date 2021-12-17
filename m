Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E66C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iqJBy8v9w9q4KZX29eFQvsyc+rSdBae8IYNkJINlfxk=; b=k+KnRPuUrvW8pY
	VSvENX4znNcrppGQ1Ddes/D4aV7LbCS+vZZiThPnyc+gwoV5HsuZMyAY/0U5Nub8fhqqi6UOKeql2
	g+SRVJ0U/3qhW5vETYmjS1IsdzJfSIY590Wa3vZ4ugCCoAThvhneEB/sq1ZPU/qS21IJ65y6gSozb
	5lbAz5XcaFNrJGbotFH4ytdgFPJM+DYQHZYXBoQdTRvK5uoK4Z0uihfkKWFh+RDsP7NXICBJ7Y9Q9
	/WbDSiX1k6FyDPopcNWK2g8rbRnFyQvDp0OaLmP09ekVPeGMUbyAfaWxAS5+oN+ZO1od7Wiz3EVLW
	VoGp62weRLKIkAtwIsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCVC-00ABEN-BZ; Fri, 17 Dec 2021 12:38:22 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCV2-00AB75-No
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:38:14 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by baptiste.telenet-ops.be with bizsmtp
 id XQe82600Q250X3001Qe8YF; Fri, 17 Dec 2021 13:38:11 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCUy-005Yqi-AC; Fri, 17 Dec 2021 13:38:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCUx-00ASTI-U6; Fri, 17 Dec 2021 13:38:07 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 0/2] dt-bindings: timer: sifive,
 clint: Miscellaneous improvements
Date: Fri, 17 Dec 2021 13:38:02 +0100
Message-Id: <cover.1639744468.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043812_950652_0F1A3F16 
X-CRM114-Status: UNSURE (   7.81  )
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

	Hi all,

This patch series contains two improvements for the SiFive CLINT DT
bindings.

Changes compared to v2[1]:
  - Add Acked-by, Reviewed-by.

Changes compared to v1[2]:
  - Split in two patches,
  - Improve patch description and document limit rationale.

Thanks!

[1] https://lore.kernel.org/r/cover.1639662093.git.geert@linux-m68k.org
[2] https://lore.kernel.org/r/20211125152317.162958-1-geert@linux-m68k.org


Geert Uytterhoeven (2):
  dt-bindings: timer: sifive,clint: Fix number of interrupts
  dt-bindings: timer: sifive,clint: Group interrupt tuples

 .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
