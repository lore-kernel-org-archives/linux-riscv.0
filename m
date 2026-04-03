Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9ED6AB1B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 00:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f642x++n4FtlL1/inb8vU+43m2MYdnAngp3m4cxLbFY=; b=riCVASLh0XEx07
	Ud8cwUG/B4y+cDgtNe+zwCjVyiHl2e+eNK3pmrfzFH8xavaBG/tQujJ7SgwE5atRtNBAdUZZvgPFP
	ynqOxBjujNwyWnIBONWr2bJFa0M+Q5qameHVvizUektS1p07a9rYxnZAOt9oUsz5BKYoc3GAlntFD
	TMD48JPwLSLvKnqDuzKGRE5ibUl/IXNakkut0E1YRfCokhJrwupXxQjLHwworqeS5NY1MWCR/snTT
	2MD/04VLmO6DmiXGTMm0J6dDGbVwONRDohczvRzGxPixrAqsxjyevveQbXULCUPEQiJzcAWKckeRO
	griyapDjmGtd9AM85b8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Sl7-00000000zWS-3aPR;
	Fri, 03 Apr 2026 00:51:37 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Sl4-00000000zUs-1ZXy
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 00:51:36 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1742759eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 17:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177493; x=1775782293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb2HYWEQxB/om4yhyjxjNip9666HK8Fi8TGkiu9j7VQ=;
        b=oHNCK3X3NXcRdRT90zJbmmAOIbRSJx8f2GkiQ5GC2gRsiH1PL/hm50qs+ovcYvHJhM
         MATzgp4Wh386VIttySCsCMV+ZmrRt2qOGwiShAGU1XwCad2g8RE3zo+diEv0cpQXHZY7
         WVXd4shBiv1KnACvXoGhqWoHhUoAsYOf49GyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177493; x=1775782293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb2HYWEQxB/om4yhyjxjNip9666HK8Fi8TGkiu9j7VQ=;
        b=e6D+ccLq3O+pYXGKGEGjwiHv/ntXqnuS4KM5PwHAOgRCLGC6+qyG76SLiSErGx7Emv
         +B9mWSUEBKNowOw70B1lSvzZJ+XEyvxaaL6hXCU4bizBR954bLb/UwXk1UToam9HJIlf
         Hjz9KCQYU1poDE+Pv7fEsMW+4AKYnSOtlFafXL9kG0DILiAfm9GCAaTMr/HdisdtHMD/
         HV2CHV+yo5upeUSMd/tDloesDe8SZxAnpChmWGtcvt2VsvIbTSD3dNy4ymVXtQALMp75
         DMV+KRdNUQG/R1S8oaDH6cVUTcx3hWvw3wK1EDXFUM9PFsNs5C+QCqy7hk8V6rqdtokK
         FjPg==
X-Forwarded-Encrypted: i=1; AJvYcCWQtfdANgQpBC2nAEMqyJXUF5df5Qy6WsQgroXbhOC7pJ3hMzToMkRhL2+cTIfLtgl7+scbp124T0qqVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/gRpMKxS9LdglrTquvsxA78d1nqZzopuRW4sN5k/PLO7JZqAl
	/BBulrEIvl5TU/qWB7enQAv+xgQxAeeOWV7pPuRZEbQTkOL73nGjc5YR7FmlcuNxLQ==
X-Gm-Gg: AeBDiesv0UeN9rm9tcC6TN6nXhhymDBFkmpfEiF3mjIVcfvGtO4TOsTUiAnMLj7stNv
	8YKU9YY1RBRv+SGNDrVvKHqe9xM009E7y+Pwq4SP7dyW/FuNr44RyxvBovkcUI2tJbyEQcQIExk
	0gP74/ukq/ZAXwn5n1YgE9P6asBvJB8F8M3qZb6wgMcOoHFsPDcqOUWaO5qfR+kPH2wD/0k0Wxz
	i/idJ7ZDr6W+pyOBXn/agWu69jt+cTP16CCb2ym4mutakfIE4W8TmvG6YOcEHAGB7bo8P+VxLuG
	7svelSOYRfvI5j8b55BqpSbBBkrU8/+XsioQrcU9Fr8flPKLxF3yLiAx/tIw3uOGaeMYsBektYW
	pHVNExuka4AjUqQ4xPfF76l11QnJ05Nx/FDS0jaV6bRAnu82twuIKWqO+KBCmCMEKyV+e3wR0Hf
	RgqmfWrzUO2fhP8rFGftLEofMTHwgm9VYYWJveO03OS4poicSjZwTTYUobUOUKsAniAxm1uLpj5
	NrmKaSDZ/atXfqpV23QeQ==
X-Received: by 2002:a05:693c:3009:b0:2c1:558c:16f7 with SMTP id 5a478bee46e88-2cbf950392cmr655589eec.6.1775177492780;
        Thu, 02 Apr 2026 17:51:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frank.Li@kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	alex@ghiti.fr,
	alexander.stein@ew.tq-group.com,
	andre.przywara@arm.com,
	andrew@codeconstruct.com.au,
	andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	astewart@tektelic.com,
	bhelgaas@google.com,
	brgl@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	chleroy@kernel.org,
	davem@davemloft.net,
	david@kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	driver-core@lists.linux.dev,
	gbatra@linux.ibm.com,
	gregory.clement@bootlin.com,
	hkallweit1@gmail.com,
	iommu@lists.linux.dev,
	jirislaby@kernel.org,
	joel@jms.id.au,
	joro@8bytes.org,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kuba@kernel.org,
	lenb@kernel.org,
	lgirdwood@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	m.szyprowski@samsung.com,
	maddy@linux.ibm.com,
	mani@kernel.org,
	maz@kernel.org,
	miko.lenczewski@arm.com,
	mpe@ellerman.id.au,
	netdev@vger.kernel.org,
	npiggin@gmail.com,
	osalvador@suse.de,
	oupton@kernel.org,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	peter.ujfalusi@gmail.com,
	peterz@infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	sebastian.hesselbarth@gmail.com,
	tglx@kernel.org,
	tsbogend@alpha.franken.de,
	vgupta@kernel.org,
	vkoul@kernel.org,
	will@kernel.org,
	willy@infradead.org,
	yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: [PATCH v3 0/9] driver core: Fix some race conditions
Date: Thu,  2 Apr 2026 17:49:46 -0700
Message-ID: <20260403005005.30424-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_175134_467365_35100283 
X-CRM114-Status: GOOD (  22.25  )
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

The main goal of this series is to fix the observed bug talked about
in the first patch ("driver core: Don't let a device probe until it's
ready"). That patch fixes a problem that has been observed in the real
world and could land even if the rest of the patches are found
unacceptable or need to be spun.

That said, during patch review Danilo correctly pointed out that many
of the bitfield accesses in "struct device" are unsafe. I added a
bunch of patches in the series to address each one.

Danilo said he's most worried about "can_match", so I put that one
first. After that, I tried to transition bitfields to flags in reverse
order to when the bitfield was added.

Even if transitioning from bitfields to flags isn't truly needed for
correctness, it seems silly (and wasteful of space in struct device)
to have some in bitfields and some as flags. Thus I didn't spend time
for each bitfield showing that it's truly needed for correctness.

Transition was done semi manually. Presumably someone skilled at
coccinelle could do a better job, but I just used sed in a heavy-
handed manner and then reviewed/fixed the results, undoing anything my
script got wrong. My terrible/ugly script was:

var=can_match
caps="${var^^}"
for f in $(git grep -l "[>\.]${var}[^1-9_a-zA-Z\[]"); do
  echo $f
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = true/set_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = true/set_bit(DEV_FLAG_${caps}, \&\\1.flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = false/clear_bit(DEV_FLAG_${caps}, \&\\1->flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = false/clear_bit(DEV_FLAG_${caps}, \&\\1.flags)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var} = \([^;]*\)/assign_bit(DEV_FLAG_${caps}, \&\\1->flags, \\2)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var} = \([^;]*\)/assign_bit(DEV_FLAG_${caps}, \&\\1.flags, \\2)/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)->${var}\([^1-9_a-zA-Z\[]\)/test_bit(DEV_FLAG_${caps}, \&\\1->flags)\\2/" "$f"
  sed -i~ -e "s/\([a-zA-Z_0-9\.>()-][a-zA-Z_0-9\.>()-]*\)\.${var}\([^1-9_a-zA-Z\[]\)/test_bit(DEV_FLAG_${caps}, \&\\1.flags)\\2/" "$f"
done

NOTE: one potentially "controversial" choice I made in some patches
was to always reserve a flag ID even if a flag is only used under
certain CONFIG_ settings. This is a change from how things were
before. Keeping the numbering consistent and allowing easy
compile-testing of both CONFIG settings seemed worth it, especially
since it won't take up any extra space until we've added a lot more
flags.

I only marked the first patch as a "Fix" since it is the only one
fixing observed problems. Other patches could be considered fixes too
if folks want.

I tested the first patch in the series backported to kernel 6.6 on the
Pixel phone that was experiencing the race. I added extra printouts to
make sure that the problem was hitting / addressed. The rest of the
patches are tested with allmodconfig with arm32, arm64, ppc, and
x86. I boot tested on an arm64 Chromebook running mainline.

Changes in v3:
- Use a new "flags" bitfield
- Add missing \n in probe error message

Changes in v2:
- Instead of adjusting the ordering, use "ready_to_probe" flag

Douglas Anderson (9):
  driver core: Don't let a device probe until it's ready
  driver core: Replace dev->can_match with DEV_FLAG_CAN_MATCH
  driver core: Replace dev->dma_iommu with DEV_FLAG_DMA_IOMMU
  driver core: Replace dev->dma_skip_sync with DEV_FLAG_DMA_SKIP_SYNC
  driver core: Replace dev->dma_ops_bypass with DEV_FLAG_DMA_OPS_BYPASS
  driver core: Replace dev->state_synced with DEV_FLAG_STATE_SYNCED
  driver core: Replace dev->dma_coherent with DEV_FLAG_DMA_COHERENT
  driver core: Replace dev->of_node_reused with DEV_FLAG_OF_NODE_REUSED
  driver core: Replace dev->offline + ->offline_disabled with DEV_FLAGs

 arch/arc/mm/dma.c                             |  4 +-
 arch/arm/mach-highbank/highbank.c             |  2 +-
 arch/arm/mach-mvebu/coherency.c               |  2 +-
 arch/arm/mm/dma-mapping-nommu.c               |  4 +-
 arch/arm/mm/dma-mapping.c                     | 30 +++----
 arch/arm64/kernel/cpufeature.c                |  2 +-
 arch/arm64/mm/dma-mapping.c                   |  2 +-
 arch/mips/mm/dma-noncoherent.c                |  2 +-
 arch/powerpc/kernel/dma-iommu.c               |  8 +-
 .../platforms/pseries/hotplug-memory.c        |  4 +-
 arch/riscv/mm/dma-noncoherent.c               |  2 +-
 drivers/acpi/scan.c                           |  3 +-
 drivers/base/core.c                           | 55 +++++++-----
 drivers/base/cpu.c                            |  4 +-
 drivers/base/dd.c                             | 28 +++++--
 drivers/base/memory.c                         |  2 +-
 drivers/base/pinctrl.c                        |  2 +-
 drivers/base/platform.c                       |  2 +-
 drivers/dma/ti/k3-udma-glue.c                 |  6 +-
 drivers/dma/ti/k3-udma.c                      |  6 +-
 drivers/iommu/dma-iommu.c                     |  9 +-
 drivers/iommu/iommu.c                         |  5 +-
 drivers/net/pcs/pcs-xpcs-plat.c               |  2 +-
 drivers/of/device.c                           |  6 +-
 drivers/pci/of.c                              |  2 +-
 drivers/pci/pwrctrl/core.c                    |  2 +-
 drivers/regulator/bq257xx-regulator.c         |  2 +-
 drivers/regulator/rk808-regulator.c           |  2 +-
 drivers/tty/serial/serial_base_bus.c          |  2 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      |  2 +-
 include/linux/device.h                        | 83 ++++++++++---------
 include/linux/dma-map-ops.h                   |  6 +-
 include/linux/dma-mapping.h                   |  2 +-
 include/linux/iommu-dma.h                     |  4 +-
 kernel/cpu.c                                  |  4 +-
 kernel/dma/mapping.c                          | 16 ++--
 mm/hmm.c                                      |  2 +-
 37 files changed, 178 insertions(+), 143 deletions(-)

-- 
2.53.0.1213.gd9a14994de-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
