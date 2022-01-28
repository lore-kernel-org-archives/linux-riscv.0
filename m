Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD00BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IiE8LFELX8wQYFbdLvFYHuc4WKs1MGhCO80fB/Mx5A4=; b=2vvt+KiHQKTSAZ
	O5xH7+ebmJusG1ZQPZIrXm8TtavqgudedNgHLqA6ob462yOiitHFof1pN8STyZFCS3+YQxRLaQMqi
	7jJMvUe7uaFMRlwzqFno3k/HcFvE7ibWmM46tDgldj49Vme6DCYxt6jorH++CCbU4thRsnWvg73TE
	ZOpEBDPSxv7O9tbY4q6AQhCd/eORsN9aCui53SbdhGu7foQNJsf7yxFQJ7jd5wNt0B89j1GHYC+nD
	1YiXZXBYUq2lgsTywv41KB2lL8z9SOvk+v8h5mnhSiRdwVkqxRgO0jcsSIbmmKShgVIPwOUufhDYS
	edeIlejyG0QB5WHv1PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNBK-00182L-QO; Fri, 28 Jan 2022 09:04:34 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNAs-0017nr-MC
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 09:04:09 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3999:e79d:cb59:f2ec])
 by michel.telenet-ops.be with bizsmtp
 id o9402600S04fKGS06940hR; Fri, 28 Jan 2022 10:04:00 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nDNAm-00Bjt9-4B; Fri, 28 Jan 2022 10:04:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nDNAl-005pod-GP; Fri, 28 Jan 2022 10:03:59 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 0/2] dt-bindings: interrupt-controller: sifive,
 plic: Miscellaneous improvements
Date: Fri, 28 Jan 2022 10:03:56 +0100
Message-Id: <cover.1643360419.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_010406_925572_FC6E432C 
X-CRM114-Status: GOOD (  16.30  )
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

This patch series contains two improvements for the SiFive PLIC DT
bindings.

Changes compared to v3[1]:
  - Use architectural maximum instead of practical maximum of 9,

Changes compared to v2[2]:
  - Add Acked-by, Reviewed-by.

Changes compared to v1[3]:
  - Split in two patches,
  - Improve patch description and document limit rationale.

Thanks!

[1] https://lore.kernel.org/r/cover.1639744106.git.geert@linux-m68k.org/
[2] https://lore.kernel.org/r/cover.1639661878.git.geert@linux-m68k.org
[3] https://lore.kernel.org/r/20211125152233.162868-1-geert@linux-m68k.org

Geert Uytterhoeven (2):
  dt-bindings: interrupt-controller: sifive,plic: Fix number of
    interrupts
  dt-bindings: interrupt-controller: sifive,plic: Group interrupt tuples

 .../interrupt-controller/sifive,plic-1.0.0.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

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
