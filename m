Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51218C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T91SMeMgipNNsn/TwRRDppcELaUEDori/4IToKnuMt8=; b=qAddizJ8cfTcaL
	pmlnBfv/W81eNcziSgWKMLrs02kRIALaHKURsv2Ami91H7PuEZvmh7ZpLljsYcHLsTDAqOog2bs48
	u5tXsN4OTok1PClCbqvuDAu3EyGCPRgd8ohaRcKm69Zkb3TaghaMsCKs+GTCAv4sfr+523Ah9qOOG
	c4f2TEXDwyThBL82fcaINKYHh4sPPOFfinv4bPU/uwI/mVAN5edCtg2Rs+XnHUr7NVgeNl/cXLA3h
	lU1PwLKa2m0Ohp3CsvaBqTxlZSPR+wlPddYBZS6isq0f4wNt/nWnhpWTDi9W1Sn2z6+ea3sZh5uSm
	SnJbVuZwxTXWBqgH/ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEl8-009UDn-1J;
	Wed, 17 May 2023 10:51:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEl4-009UA3-2b
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:51:52 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ab0967093dso492192a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320708; x=1686912708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4I98XV0IFrv57OJbenqpT7CSPupqW0VvAVAytajn+E=;
        b=MnXwJ4jlP/FxQK46VKChHKbe5osYVecKrDXfcEWJMBw31u3l+N+mngaWfgB3dSsiD7
         phrMOBQjy1hsE4gPFUMTrfbr6vfQ+ZPuzklXSc64v1qEiedouMK6G7ZlRL+zjBqLNf9W
         o3WmY2nlRHmoOtTb0VwAFquEZKVzyEUZT1cDxUtu2OSV8vDSot9JucS0YWJxZR+8rPJp
         2Qer5IoHHI0BnOzkHaX7SOIYmsu55Esp51gLJScmnaucmEaYeLdMRiCYgrm1ip974UL2
         OO3TZQ8NHmkvUXnBeHL2oGwtcIJl3qtQ83SYmhGqRkCMZXMIbK95r24nk9aTMIae5oRf
         fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320708; x=1686912708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4I98XV0IFrv57OJbenqpT7CSPupqW0VvAVAytajn+E=;
        b=U7bL52C+CF9zcUf6BQ7HlPRj38SEllwqoWOPySq5SNX9bzW6SRaYAFb6dNIATryQqn
         b1y6zk6s2slZA/P5ijntT9BePN+pZ5l9oXBH7nPe12lICTQnZGuvTFnGA5mMEzI4OxYe
         K420eZGiSWtUzij/AFqMT0lI4VqgtVxL100yyxmAd7NE0ZmloaLLBYCAOmb9/v2C8O+r
         Wk8xYPnsI9cCgNNClicP8MKHcxn8qJoSL9w9Oi0sn6iF+rv2EqJXiZyvCJKDO1vxVf62
         4qwEl5ThftozF3UJsyP0mt3QcheD0R2JF5mif/QHfgBlwPQnsRR2Q+BN11NPnqlYfWyX
         4XGA==
X-Gm-Message-State: AC+VfDyUzvhwFAe3pa3jpueDNq249pvyu+D84kC+mOM/ty0Y70iHVbYw
	jacXT9U0K5eL+ho2t5WmAul/Ma5sQ+DFXyNXjGvIpA==
X-Google-Smtp-Source: ACHHUZ4euu8r9FiWVjCzf0OJMrz1fFmqTpnJBq5ZV+ulaHRPe7SJHyf6p4luiN3EhsbNsOA4ekwWjw==
X-Received: by 2002:a9d:7acb:0:b0:6ab:604:1eed with SMTP id m11-20020a9d7acb000000b006ab06041eedmr14252339otn.22.1684320708366;
        Wed, 17 May 2023 03:51:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:51:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 00/10] RISC-V KVM in-kernel AIA irqchip
Date: Wed, 17 May 2023 16:21:25 +0530
Message-Id: <20230517105135.1871868-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035150_842060_41147206 
X-CRM114-Status: GOOD (  10.72  )
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

This series adds in-kernel AIA irqchip which only trap-n-emulate IMSIC and
APLIC MSI-mode for Guest. The APLIC MSI-mode trap-n-emulate is optional so
KVM user space can emulate APLIC entirely in user space.

The use of IMSIC HW guest files to accelerate IMSIC virtualization will be
done as separate series since this depends on AIA irqchip drivers to be
upstreamed. This series has no dependency on the AIA irqchip drivers.

There is also a KVM AIA irq-bypass (or device MSI virtualization) series
under development which depends on this series and upcoming IOMMU driver
series.

These patches (or this series) can also be found in the
riscv_kvm_aia_irqchip_v1 branch at: https://github.com/avpatel/linux.git

Anup Patel (10):
  RISC-V: KVM: Implement guest external interrupt line management
  RISC-V: KVM: Add IMSIC related defines
  RISC-V: KVM: Add APLIC related defines
  RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
  RISC-V: KVM: Skeletal in-kernel AIA irqchip support
  RISC-V: KVM: Implement device interface for AIA irqchip
  RISC-V: KVM: Add in-kernel emulation of AIA APLIC
  RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
  RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
  RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip

 arch/riscv/include/asm/kvm_aia.h       |  107 ++-
 arch/riscv/include/asm/kvm_aia_aplic.h |   58 ++
 arch/riscv/include/asm/kvm_aia_imsic.h |   38 +
 arch/riscv/include/asm/kvm_host.h      |    4 +
 arch/riscv/include/uapi/asm/kvm.h      |   54 ++
 arch/riscv/kvm/Kconfig                 |    4 +
 arch/riscv/kvm/Makefile                |    3 +
 arch/riscv/kvm/aia.c                   |  274 +++++-
 arch/riscv/kvm/aia_aplic.c             |  617 ++++++++++++++
 arch/riscv/kvm/aia_device.c            |  672 +++++++++++++++
 arch/riscv/kvm/aia_imsic.c             | 1083 ++++++++++++++++++++++++
 arch/riscv/kvm/main.c                  |    3 +-
 arch/riscv/kvm/vcpu.c                  |    2 +
 arch/riscv/kvm/vm.c                    |  115 +++
 include/uapi/linux/kvm.h               |    2 +
 15 files changed, 3003 insertions(+), 33 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
 create mode 100644 arch/riscv/kvm/aia_aplic.c
 create mode 100644 arch/riscv/kvm/aia_device.c
 create mode 100644 arch/riscv/kvm/aia_imsic.c

-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
