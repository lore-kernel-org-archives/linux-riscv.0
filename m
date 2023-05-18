Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E2C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ySnCNI7N/zbCKdcFiL8UUzg77hl2SKu/AEE5zNNtl8=; b=tCWRJ0yKryab/q
	ZX/J2csAk/Av6LfsgwOzNhud/PbzOxkIQg94IqJ05332xbnnWE8xPLm2lQPZcWuijz8dFY+VL6UuB
	znDb2+2ggO3RLWiIXbqW/IO2TZWV4HRhYMDZAUOp3Y6bphYcMk89WlUXJZajf2W6O/XhYDYHqdrnx
	aebcFMgGIytfRc07fXnUv+0cCwoJdzMbosURgJKJlPgHXT0D2gvM3DgnVLtxTFXByYIbDzqYIYbVe
	f86g75isil5kfLRMGPRe6IAdRJJCs8kvFzLvvRB1gZSCAbh8KCbJh4M2ukBwyi1HmKMEoI/LNfsfb
	rmltCHasJPi77ek/1Wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI3-00ENLt-2F;
	Thu, 18 May 2023 22:40:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmHz-00ENL9-1V
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 312106524B;
	Thu, 18 May 2023 22:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604C8C433EF;
	Thu, 18 May 2023 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449600;
	bh=40rniBgDFLyqNu4Dhv8Ljpmnqu/Tz/kUpOSMx/oDGvg=;
	h=From:To:Cc:Subject:Date:From;
	b=k5/0xL+ouaefGqOceBeE8pwklRZgmDS06D74yH9OncVfgl0F3bDJSJLUvtynZbSbS
	 l8bAz9sLWghQc1jj8c+3xVHJloEiYO73M9iYTJS6cdHvN3xamk7Cw0l22VudyIQwM3
	 6h0IcWEa6aHT0EDHPDb+sJlq92zeWEsEKnbV6Lfraj1N/kXyJROtZ6v0qIBaXqKOVI
	 e16iDLk0xGoC2IknzSOlsWzROeYqoC1EL9Geao6cEszhKSEL37iNHcK5lZeILV39dG
	 SV2AZ6wVryRiY6Ob6ufbiaD3vqUVomL/uDtmrfOAuc1kr/im4sjgGmyuuA4N7AfZug
	 2oxKEmYR0WmVg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 0/8] ISA string parser cleanups++
Date: Thu, 18 May 2023 23:39:01 +0100
Message-Id: <20230518-moneybags-rebalance-1484db493d6a@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=PiQajagbPjXRCWBNu8UO62DsQBOR2SQ0ai1pNznUEdo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpK9kNvMtvvFbbriub/WKm1w1vfQeu9FfSvwyZe+683 x3ssPlLRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZSlsjIMEfys+v63JP1M5kn OP9Sm8o0wS7O/jzHyUn9Cybocn6p+srwVz5k/TnPhkLjB2HHXUtUA/JCDk85Gmh46rbjW3PGnm1 q/AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154003_588237_C73DBA68 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

This stuff goes on top of riscv/for-next plus this series from Yangyu
that made me go looking at the ISA string parser again:
https://lore.kernel.org/all/tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com/

With that out of the way, here are some cleanups for our riscv,isa
handling.
One of these patches is yoinked from Sunil's ACPI series & tweaked
slightly since this needs to apply independently of that, that runs the
isa string parsing loop only over _possible_ cpus.

Other than that, there are some bits that were discussed with Drew on
the "should we allow caps" threads that I have now created patches for:
- splitting of riscv_of_processor_hartid() into two distinct functions,
  one for use purely during early boot, prior to the establishment of
  the possible-cpus mask & another to fit the other current use-cases.
- this allows us to then completely skip some validation of the hartid
  in the parser.
- the biggest diff in the series is a rework of the comments in the
  parser, as I have mostly found the existing (sparse) ones to not be
  all that helpful whenever I have to go back and look at it.
- from writing the comments, I found a conditional doing a bit of a
  dance that I found counter-intuitive, so I've had a go at making that
  match what I would expect a little better.
- `i` implies 4 other extensions, so add them as extensions and set
  them for the craic. Sure why not like.

Clearly this material will conflict with the addition of ACPI support,
which I figure is likely to land first. I expect to rebase if it does.
There's a far more trivial numbering conflict with Evan's Zb* additions.

Cheers,
Conor.

Changes in v2:
- Pick up tags on most patches
- Drop some dt specifics from a parser comment
- Add Zicntr and Zihpm to the "always report" patch
- Note the Zicntr and Zihpm bits in the binding in a new patch

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Yangyu Chen <cyy@cyyself.name>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (7):
  RISC-V: simplify register width check in ISA string parsing
  RISC-V: split early & late of_node to hartid mapping
  RISC-V: validate riscv,isa at boot, not during ISA string parsing
  RISC-V: rework comments in ISA string parser
  RISC-V: remove decrement/increment dance in ISA string parser
  dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm
    support
  RISC-V: always report presence of extenstions formerly part of the
    base ISA

Sunil V L (1):
  RISC-V: only iterate over possible CPUs in ISA string parser

 .../devicetree/bindings/riscv/cpus.yaml       |   4 +-
 arch/riscv/include/asm/hwcap.h                |   4 +
 arch/riscv/include/asm/processor.h            |   1 +
 arch/riscv/kernel/cpu.c                       |  34 ++++-
 arch/riscv/kernel/cpufeature.c                | 116 +++++++++++++-----
 arch/riscv/kernel/smpboot.c                   |   2 +-
 6 files changed, 126 insertions(+), 35 deletions(-)


base-commit: c2d3c8441e3ddbfe41fea9282ddc6ee372e154cd
prerequisite-patch-id: 50cc6c119a7f8f60b06829b2fafc90c9817f532c
prerequisite-patch-id: 4e2f66d8590db938d2e1a4e9bfaad58ee0ab3525

Dependencies:
https://lore.kernel.org/all/tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com/
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
