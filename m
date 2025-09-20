Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A245CAC5AC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFnaslHtLjRV97I79vFcSUL7F3+PeBQKGtr2lUC6eHw=; b=4OzOtohl6pxFL/
	XdRhK3YE2LYWgsy+5Rt9jx9nNrJw6xa6f59L4RPrTe8XDqneyQNXsU+SSVNcCfwqESLFigjmd+9Gg
	YeC+tpHLTZPsZz4kdp/fFXaP5T8nm2wTupO+0ZkduMJrNZKAMeGhh0Bo8wG9hJOkWHnnpmvBn5fCd
	OFfwmhWtylh02GnPsZAIZGHLnwVXAzeTnrMqW4qrbHPriZnoFrhPmhT5+mfoe8eVCqD7P8OJ6wXOk
	e5zOhmAuFAQHVACu72qd3RCngu85dHl3GL2H/qZNoyxqQvIINYXkVAkOkNQgr4nJUA04+xd2dG6wH
	qXXADoDH438IJEmjTnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MC-00000005tGD-1vRc;
	Sat, 20 Sep 2025 20:38:56 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MA-00000005tEt-1UVQ
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:55 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-4247d991161so13735005ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400733; x=1759005533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhhBAyqrQkktxGVEvf+eNDaA1KtGAPXA3DGbaEzOigo=;
        b=nR8crLzAuYWMKFIhItF90HhbAYlHeILKKkpqcHUkkqQBmRxz03KTZTblUm9nbJoRo7
         EgGGhXJxw59a00OyWJ+cNpB7M2aLautOsrrtuanS3w3e+Tx93soHsnbKRzbQ/NGz/BEQ
         UQgM8XIpALClECaGMS4M9b8HJ91DLu2/4XJlRqxvDV8qhsCosxff7h1v8qMdwYefip8N
         9gH4gt51h4FSk2gSCkWOg80Yff9xya/uFzSGjqacYnGyLXhZ4N1+iWkdrr+3KL1DSABg
         Vt/Yrx5GVBMTHp5Js6XjPzFyN8r4hGKcWDTZiPWT98EWVet8eEUHrAefTnPeMQB5Vz7l
         YSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400733; x=1759005533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhhBAyqrQkktxGVEvf+eNDaA1KtGAPXA3DGbaEzOigo=;
        b=iqdy6eePNyTs72U9LqtFKjA2oixUylhZsfmE2wUrfj0dgBCId6zepP2/mPyiAVAaCt
         sdZG8SNSkUR/pChArCrKGshxPs3m9LSivS/GgOmjwtWHucxTfuvpSSLG5uXd5XqrlEa8
         PQALAbYWEnxulPUKP/ZnjL/EAKDyv0O3c3hANkHdWqy0RAr6N2kNtM208X0VXHx0tB4c
         eXGClst8IM7wQyFPJij32K5eu2OR6r4oxYFKeJip5+NsRwZbD304RY4EyPquaqS+7qOZ
         j5ivu7ue4BpPrmkTELjR6h9WRdFomRO7oRr4yup6lL3UT5MKqVS30AMC63+KheVZzxKV
         iSaw==
X-Forwarded-Encrypted: i=1; AJvYcCVwEogPkZpOY8yi6GLj8eF3ThhpdFqCoicxXl7HQWR28uOG9vv6EbUkg3/VDfsRZRDPx/LK73GgkF1cbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PWlTYD4Nj4XBBoKg2VdDd/eab5FUE+p+ZG4YKv+yjntcPQI/
	O7aYVuJIRKZafO7zEBoTzDkzv7CaiQeJEm0FcFRaWjCSl/SsZ3sIXArzrGtZ+IS1j1Q=
X-Gm-Gg: ASbGncuf4EE9NOjjGwY8kOC9KaizpRUhPoHzEgRbYtkDXFLQYmfaRcZ3HN5CVCMGcS6
	CGWBRy/jdgDGIl+rTbCMEOPVfXfBmAfaLjLgi8z+o7agbroD7hUWyITroyOfyk1RcLNG9RJGvzz
	80KCusSpucuNGhcUgd419GF0f6E/ahAdA2MW1G1q8tr2gF4npedKa3+wL+YCUBfsvpifKQgr/YL
	N+5gW3mSkQ5L5i12F3blO88oC3MLyG5It+VuCjbXRthx28zreiMMf9O2wroIi7mfXMHdyFRwmSG
	Puf8bFzQWOtmfSJl1uOH+H1UAPfnpHjCIxKJOrYepj5Vuv1F3iTJSjVjLVvhZcNTqmHqMRFpvFM
	+47HzVx+21Mbpl505jvk2ddSq
X-Google-Smtp-Source: AGHT+IGwK4PrAd7CyoBUGRZ3PUQqWIF5Zj/5N9zpz7O49heeJaggKCpHt+afTDzWqXDEvIoleQehPQ==
X-Received: by 2002:a05:6e02:12e9:b0:424:bec:4a01 with SMTP id e9e14a558f8ab-424819743bbmr104189845ab.16.1758400733061;
        Sat, 20 Sep 2025 13:38:53 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9fbfsm39814525ab.26.2025.09.20.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:52 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 00/18] iommu/riscv: Add irqbypass support
Date: Sat, 20 Sep 2025 15:38:50 -0500
Message-ID: <20250920203851.2205115-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133854_404903_6E399240 
X-CRM114-Status: GOOD (  18.06  )
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

Changelog
---------
This is v2 of the RFC for adding interrupt remapping support to the
RISC-V IOMMU driver along with support for KVM in order to apply it
to irqbypass. v1 of the series was discussed here[1] where a couple
large design flaws were pointed out. Those, along with a v1 TODO of
referencing counting MSI PTEs in order to track when they may be
unmapped, have been addressed in v2. Additionally, v2 is based on
msi-lib, which didn't exist at the time of the v1 posting, and on
the recent KVM irqbypass rework.

Description
-----------
Platforms with MSI support (IMSICs) and implementations of the RISC-V
IOMMU with an MSI table can control device MSI delivery, including
directly delivering MSIs of devices assigned to guests to VCPUs. This
series enables that control and enables IOMMU_DMA in order to use
paging IOMMU domains by default. When the IOMMU doesn't support an MSI
table (it's an optional IOMMU capability) then paging domains are still
used, but the system does not have isolated MSIs. For direct delivery
to VCPUs an MSI table is required and thanks to KVM+VFIO it's possible
to determine when and how to map guest IMSIC addresses to host guest
interrupt files. The RISC-V IOMMU and AIA also support MRIFs (memory-
resident interrupt files), but support for those will be posted as a
follow-on to this series. Also, additional work will be done in order
to take advantage of the RISC-V IOMMU's second stage of paging. At
this time, the series just uses the first stage which allows testing
with unmodified KVM userspace and VFIO.

The patches are organized as follows:
  1-4:  Create an irq domain and some function stubs for an initial
        interrupt remapping support skeleton
  5-9:  Add MSI table management to enable host interrupt remapping
        and enable IOMMU_DMA
 10-13: Add IOMMU driver support for directly delivering MSIs to VCPUs
 14-17: Add KVM support for directly delivering MSIs to VCPUs

The last patch is a workaround for a KVM bug not introduced by this series
which is needed to enable testing of the series -- I still need to debug
and fix that properly.

There series is also available here[2].

Based on commit 39879e3a4106.

[1] https://lore.kernel.org/all/20241114161845.502027-17-ajones@ventanamicro.com/
[2] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v2/


Andrew Jones (13):
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Prepare to use MSI table
  iommu/riscv: Implement MSI table management functions
  iommu/riscv: Export phys_to_ppn and ppn_to_phys
  iommu/riscv: Use MSI table to enable IMSIC access
  RISC-V: Define irqbypass vcpu_info
  iommu/riscv: Maintain each irq msitbl index with chip data
  iommu/riscv: Add guest file irqbypass support
  RISC-V: KVM: Add guest file irqbypass support
  RISC-V: defconfig: Add VFIO modules
  DO NOT UPSTREAM: RISC-V: KVM: Workaround kvm_riscv_gstage_ioremap()
    bug

Tomasz Jeznach (4):
  iommu/dma: enable IOMMU_DMA for RISC-V
  iommu/riscv: report iommu capabilities
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
  vfio: enable IOMMU_TYPE1 for RISC-V

Zong Li (1):
  iommu/riscv: Use data structure instead of individual values

 arch/riscv/configs/defconfig     |   2 +
 arch/riscv/include/asm/irq.h     |   9 +
 arch/riscv/kvm/Kconfig           |   3 +
 arch/riscv/kvm/aia_imsic.c       | 143 ++++++-
 arch/riscv/kvm/mmu.c             |   2 +-
 arch/riscv/kvm/vm.c              |  31 ++
 drivers/iommu/Kconfig            |   2 +-
 drivers/iommu/riscv/Makefile     |   2 +-
 drivers/iommu/riscv/iommu-bits.h |  11 +
 drivers/iommu/riscv/iommu-ir.c   | 698 +++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      | 158 +++----
 drivers/iommu/riscv/iommu.h      |  75 ++++
 drivers/irqchip/irq-msi-lib.c    |   8 +-
 drivers/vfio/Kconfig             |   2 +-
 include/linux/irqdomain_defs.h   |   1 +
 15 files changed, 1063 insertions(+), 84 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
