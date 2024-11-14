Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E813D68B34
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dx06Q72weQvVi0E1A+Z03mP90Z65QGbO75Z6QrBRH88=; b=HoJWPdEURbBngg
	I/XFbMpolaWiSYCvqua+6ASgTJ1XJa0/kpz+QKpYhvVOozGn2YGbS+o01kmH3IK3zcIcZfoJUcgEk
	ZDjzZln2ucKRo/Vd0JPiKc0RVtfZ1wpfvUFLjDKidB17F7a284zpoE6JBD8V7p10QT04xyVheAUSx
	TsPfZTMrgv1JdM6ncWXkCeN+FngYA9m2w2cMKE7nruou0z2jYjwLZ7rY9KhL4IV56wXhER9CrE0eC
	en4NYs70QBZ37FeOY92RHPEj7aL5GeikxBvmZr7wGZYhzIC57BtP+a5JQLq4uMgAMqTW7nJ6U31tc
	umf0o6fCoxUgoAMOIMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYW-000000004pJ-03GM;
	Thu, 14 Nov 2024 16:18:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYS-000000004m3-3yuq
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so7298275e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601127; x=1732205927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7BJqdeVq7UVKuF/HMX90zKjA2XSvBJJooO0qYOgVYo=;
        b=nl1oDLz3AGYdKPVZBY0hOsTgVXAoBdv68swmiP5swBKLBhv9rdlBlThSe2s2qByW4j
         QYGwho4RXVdlYyrVoxudDQDF0JvtdOz3UolCqDkpoXmEGv3dAgTYakGijqcRlDb+3reh
         AbNL6vf4Z4H0iN7JeP/uQRRkxGa5f370d3inpfWP+x3kWK7dyjRi1SqUBDggo24aSTNw
         hvYMTWwFXL0D5IwXhJE+y1aB+NDhXW/U2JVE0QcR9hJteq2I68jbjo72kWCCJEoInGSD
         vrsP7ZoQmNFqNo5xW14DIyRU/W4fSvsP3ekEAc0FsgGAz7oNKEyRAKEU35REnDxgniV7
         OFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601127; x=1732205927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7BJqdeVq7UVKuF/HMX90zKjA2XSvBJJooO0qYOgVYo=;
        b=bfOjcYP4BQTVrmJPL+NyhWqks+XABHgy1fvycMBd1wDQyK2izph16GKZDtbFnL6YiM
         t0Qha17ZQoy08nwQ1uPxjnKqyTPDQoFbTVfo88AvdzuSRi4EjXZ4jXflJT4pvuGmEMGz
         esS5hz3ej3Y3hiKbpuU9BQYd7Qt2Kqfoptorq0eI/4JlVzGCTBpRq8aHTkKxwHOtmHRO
         /YDppJR2UYKqsMNvj0k/ltNyccBEs5RD71T1lFodJmq9982lres7ARjxJwtte4Z4l0f2
         EYidZV4NwCGC7/54M85G9EvMvOp7gWo5p8qSI+yOcJAtjFe5q37MHtELNza3pkMEjJh1
         J8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61gLQGGPqA4QzHC//dpDw6N0WPbV+wVfZXA3P7tGkDujl2vf/MVhBl4NSuUQfxKjcBfuyOew3soHJPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIsVRI6xlyzut/E1NXXhWeCxc/eRTS8uOrCTzT1X81xPMPz5JM
	TYih2bRlvIrHlXd149MmepIgfMl5zO24pWtesAqmhb6G7fRVojhjdyTg7usWFoA=
X-Google-Smtp-Source: AGHT+IGmsJWy6Z+mGpYkwKc89nKAhzRkstEPPTX+iWcGxi/SAriHdno919nTAwdEP/fS42LcKsW+QA==
X-Received: by 2002:a05:600c:1d88:b0:431:5a27:839c with SMTP id 5b1f17b1804b1-432d4a98364mr70171705e9.5.1731601126807;
        Thu, 14 Nov 2024 08:18:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265f28sm28998355e9.17.2024.11.14.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:46 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 00/15] iommu/riscv: Add irqbypass support
Date: Thu, 14 Nov 2024 17:18:45 +0100
Message-ID: <20241114161845.502027-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081848_996261_ED0673AC 
X-CRM114-Status: GOOD (  12.84  )
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

Platforms with implementations of the RISC-V IOMMU and AIA support
directly delivering MSIs of devices assigned to guests to the VCPUs.
VFIO and KVM have a framework to enable such support, which is called
irqbypass. This series enables irqbypass for devices assigned to KVM
guests when all VCPUs are allocated guest interrupt files. The RISC-V
IOMMU and AIA also support MRIFs (memory-resident interrupt files),
but support for those will be posted as a follow-on to this series.

The patches are organized as follows:
  1-3:  Prepare to create an MSI remapping irqdomain parented by the IMSIC
  4-6:  Prepare the IOMMU driver for VFIO domains which will use a single
        stage of translation, but G-stage instead of the first stage
  7-8:  Add support to the IOMMU driver for creating irqdomains
  9-10: Prepare KVM to enable irqbypass
 11-13: Add irqbypass support to the IOMMU driver and KVM
 14-15: Enable VFIO by default

This series is also available here [1] and may be tested with QEMU recent
enough to have the IOMMU model.

Based on linux-next commit 28955f4fa282 ("Add linux-next specific files for 20241112")

[1] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v1/

Thanks,
drew


Andrew Jones (10):
  irqchip/riscv-imsic: Use hierarchy to reach irq_set_affinity
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  irqchip/riscv-imsic: Add support for DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Move definitions to iommu.h
  iommu/riscv: Add IRQ domain for interrupt remapping
  RISC-V: KVM: Add irqbypass skeleton
  RISC-V: Define irqbypass vcpu_info
  iommu/riscv: Add guest file irqbypass support
  RISC-V: KVM: Add guest file irqbypass support
  RISC-V: defconfig: Add VFIO modules

Tomasz Jeznach (3):
  iommu/riscv: report iommu capabilities
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
  vfio: enable IOMMU_TYPE1 for RISC-V

Zong Li (2):
  iommu/riscv: use data structure instead of individual values
  iommu/riscv: support GSCID and GVMA invalidation command

 arch/riscv/configs/defconfig               |   2 +
 arch/riscv/include/asm/irq.h               |   9 +
 arch/riscv/include/asm/kvm_host.h          |   3 +
 arch/riscv/kvm/Kconfig                     |   3 +
 arch/riscv/kvm/aia_imsic.c                 | 136 +++++++-
 arch/riscv/kvm/vm.c                        |  60 ++++
 drivers/iommu/riscv/Makefile               |   2 +-
 drivers/iommu/riscv/iommu-bits.h           |  11 +
 drivers/iommu/riscv/iommu-ir.c             | 360 +++++++++++++++++++++
 drivers/iommu/riscv/iommu.c                | 183 ++++++-----
 drivers/iommu/riscv/iommu.h                |  78 +++++
 drivers/irqchip/irq-riscv-imsic-platform.c |  18 +-
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/irqdomain_defs.h             |   1 +
 14 files changed, 776 insertions(+), 92 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
