Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3C0C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0m+4mefEAQI/46YzjpBcPMRP3TL72DwEsRjDg6vC1d4=; b=0rcDrhjeuC1Qj0
	1wZB1RNX7Y1CWM7OI97gPbV+iQqac0LGd7bgEy+pZ7iQQfL3Nc6eRqPpUZ8c2K6dIkrMKUBf5rcCM
	A+OyXW/k1DBr3rAwMdoDKGMC6yGAfXyYqv1qRQY9oBy/tFwN8VtLKBFrQeXKrqKiiM1SsHDCvxtzw
	wwE0QRcHjLeksRTpsjOUI4DRARLs+36RpnTkggSd4IvHeo45ErBR8cm9jqkc8BIEG0VNGbWFvGCrl
	pgLuLfseEAXw3NQkmfLfCI109Ab6x9gkPxuJN0LARy1DCNcIF50eo18IuYhSXnmw5MHkZElGx5GFc
	avhJSbxKLu2MVxB7MKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzSkG-004rMJ-Lr; Fri, 10 Jun 2022 00:43:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzSkC-004rGe-1a
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 00:43:21 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nzSk6-0001oS-NK; Fri, 10 Jun 2022 02:43:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	samuel@sholland.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	drew@beagleboard.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 0/3] riscv: implement Zicbom-based CMO instructions + the t-head variant
Date: Fri, 10 Jun 2022 02:43:05 +0200
Message-Id: <20220610004308.1903626-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_174320_133764_AB44DB74 
X-CRM114-Status: GOOD (  18.79  )
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


An ongoing discussion is about the currently used pre-coded
instructions. Palmer's current thinking is that we should wait
until the relevant instructions have landed in binutils.

On the other hand this would result in massive waiting times
for all new instructions in the future as well, as it isn't only
the time till a binutils patch is accepted but also then the
wait for the next release and _after_ that the wait until these
new releases are available in regular distributions.

So ideally it would be nice to find some sort of compromise
in the middle somewhere.


The series sits on top of my svpbmt fixup series, which
for example includes the conversion away from function pointers
for the check-functions. And also uses my nops-series.


changes in v3:
- rebase onto 5.19-rc1 + svpbmt-fixup-series
- adapt wording for block-size binding
- include asm/cacheflush.h into dma-noncoherent to fix the
  no-prototype error clang seems to generate
- use __nops macro for readability
- add some received tags
- add a0 to the clobber list

changes in v2:
- cbom-block-size is hardware-specific and comes from firmware
- update Kconfig name to use the ISA extension name
- select the ALTERNATIVES symbol when enabled
- shorten the line lengths of the errata-assembly

Heiko Stuebner (3):
  dt-bindings: riscv: document cbom-block-size
  riscv: Implement Zicbom-based cache management operations
  riscv: implement cache-management errata for T-Head SoCs

 .../devicetree/bindings/riscv/cpus.yaml       |  5 +
 arch/riscv/Kconfig                            | 15 +++
 arch/riscv/Kconfig.erratas                    | 10 ++
 arch/riscv/errata/thead/errata.c              | 15 +++
 arch/riscv/include/asm/cacheflush.h           |  6 ++
 arch/riscv/include/asm/errata_list.h          | 76 ++++++++++++++-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                | 18 ++++
 arch/riscv/kernel/setup.c                     |  2 +
 arch/riscv/mm/Makefile                        |  1 +
 arch/riscv/mm/dma-noncoherent.c               | 93 +++++++++++++++++++
 12 files changed, 241 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
