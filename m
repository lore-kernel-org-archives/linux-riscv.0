Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53460C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d0OhrT1KvYvJHkjjyZfVOOj2LMh0qOZTJ0s0JULqQ10=; b=GgkQTRQMvCMraq
	QyIa9NOCbVW2Q27fFUSBsG2Mc83ATpRZpf1B8g1qGzkcgafAh5Yurg7iFVlSw4+T8YkE5CdINWgpI
	VfnA9gwLF4YgCdqbo+cHFgPoZZQgYifULIRalbyNPctWs2m1gBxRWFwOtC+OZv11BInHFLuxnJVwx
	G1QS6DzLeXdbLrxhi94DmrNFI8lw/iotM91P79nyOFtcntIGMTYNSIv7/4fHVaKwUV0pwWuSD6+iE
	12oHYIjn2XsgdasU5qREKnJK8Xf9T9YbIpIqj+YwCGyvbq543wJlD3T0gOOqnWTAFyZqrmAeMxzxI
	5lBiQA84lNOP6DF+A8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nou5H-008p2Y-9b; Wed, 11 May 2022 21:41:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nou5E-008p1N-3p
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 21:41:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nou58-0005N8-MH; Wed, 11 May 2022 23:41:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Date: Wed, 11 May 2022 23:40:35 +0200
Message-Id: <20220511214038.2281398-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_144124_194077_C9E5D469 
X-CRM114-Status: GOOD (  14.12  )
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

This series is based on the alternatives changes done in my svpbmt series
and thus also depends on Atish's isa-extension parsing series.

It implements using the cache-management instructions from the  Zicbom-
extension to handle cache flush, etc actions on platforms needing them.

SoCs using cpu cores from T-Head like the Allwinne D1 implement a
different set of cache instructions. But while they are different,
instructions they provide the same functionality, so a variant can
easly hook into the existing alternatives mechanism on those.


As Palmer suggested, merging might have to wait until the cache
instructions have landed in compilers, but I wanted to put the
block-size changes out there for people to look at already and
also update the series to match the current svpbmt state.


changes in v2:
- cbom-block-size is hardware-specific and comes from firmware
- update Kconfig name to use the ISA extension name
- select the ALTERNATIVES symbol when enabled
- shorten the line lengths of the errata-assembly

Heiko Stuebner (3):
  dt-bindings: riscv: document cbom-block-size
  riscv: Implement Zicbom-based cache management operations
  riscv: implement cache-management errata for T-Head SoCs

 .../devicetree/bindings/riscv/cpus.yaml       |  7 ++
 arch/riscv/Kconfig                            | 15 +++
 arch/riscv/Kconfig.erratas                    | 10 ++
 arch/riscv/errata/thead/errata.c              |  5 +
 arch/riscv/include/asm/cacheflush.h           |  6 ++
 arch/riscv/include/asm/errata_list.h          | 80 +++++++++++++++-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                | 17 ++++
 arch/riscv/kernel/setup.c                     |  2 +
 arch/riscv/mm/Makefile                        |  1 +
 arch/riscv/mm/dma-noncoherent.c               | 92 +++++++++++++++++++
 12 files changed, 235 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
