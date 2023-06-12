Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD2CC7EE25
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QfkyDepfsELq4q3TyAxcYPfuT2dosQduHlaA0+zgVKU=; b=dDPcjs09r8dfEk
	9XtQJpU1VMj1wFYLT9TshH0Zbhs8C1MxqdaWyb560ZQvglJzcaLiYP6Qzt54of5lejnmOFckevWgJ
	Ba7vdYvGRq0MCQN85aYesdg2UhSVpMNgQkC0S4mJ6pctZdoRwSHOZ8958FW674cg8YBG0ao2bDpiN
	chvVC1Er105P7PkV+CNOc0C3hGvH5OylyTy2YgGsWOohH5nnNqAP68vLrr40moH1s42DVw8/c0ZOc
	VjImhdXufB9q0l4x0Ml6A+dgBBLoWNH6hoSBHtL8mPYuHAZYrrrilDO4thkLPAMp6IsRlvQzka+Yh
	a0aiThQh8R5t6YM15YnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHM-002fci-2Z;
	Mon, 12 Jun 2023 05:39:48 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHI-002fbE-15
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:39:46 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1a49716e9c5so1842500fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548383; x=1689140383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWYCGAosK0SUS0+dkv9itjjrp/dSQPeY98ZsDkT2lhs=;
        b=RGIjU88MGvlPicR5dhW//WR7XWLFopn2hQUTjPMK2Lo7t0uqFoMXVJaTy/7khu+J5X
         EueKw+1U72mIxX52AhIrOEiVi70grwPry1iRrUsgrCSidPaTqbCtHj1Ne0gxuAtYnTrZ
         0eh1efmuB7TDJLFlP1a5ByM3wDNYk/VV3/RjBJZcVQsaHbrP3M+YGeemDTFbSx8uAtis
         ifnRUc1qLFCFWSmPP2t07rPV38bE4zqF9by9X4nJSSyqW5I1+Ek6T7tYFBpHXXCV0PiG
         zY1gDb6eNPMxoTyV/Enj0Xds+QOwJm5Puym2867C8LzuJStEKkfkONpj6Mo7k7pIvCY+
         FnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548383; x=1689140383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWYCGAosK0SUS0+dkv9itjjrp/dSQPeY98ZsDkT2lhs=;
        b=K+bIjvNWjqZ8ikLAPyXEMEeTKAwEZm0Y0vnNMDYPqGoFpqfvJcFgHYVPFEuLNhehR7
         SAgz+i0HVPBeCrP+2ad9zzBM0Au78YDjDASiybX4wwRqrHks0sGrEg8s7yL6HWTsX5zo
         jZD2NFkOmwlaaabpE6IBNhZqHwQbxC3nNE9w5IIu67YizSipIB0oEbiw9cyH+fEdSrvm
         IHrc76ALp110VmB3oqfgywwp81cewzoftre//H/m/v0O+7O9tdcWjfcQD5C6dIcogzmG
         vxUrIT+I+tUIsg2ybddeIkWzVgdXXPiYzwAqJpK3fPEuBWeOs8prFf4ZS2gIX3/LFqBt
         +pTg==
X-Gm-Message-State: AC+VfDxCeJGQgn7ronRyIvCV5y9CIIYUlqgP5LYtIMB+6aLQ/D379JhU
	5Qd3sUNyabCt53JsNiSZxeH4Zg==
X-Google-Smtp-Source: ACHHUZ52I4IvfvRlN6/6kmIgeszsaLBTwQtl0lyDvHGyiOATjHj1bO776c0nh8dssARkY++M/1PwzQ==
X-Received: by 2002:a05:6870:772d:b0:184:39e3:9c85 with SMTP id dw45-20020a056870772d00b0018439e39c85mr5356831oab.29.1686548382777;
        Sun, 11 Jun 2023 22:39:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:42 -0700 (PDT)
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
Subject: [PATCH v2 00/10] RISC-V KVM in-kernel AIA irqchip
Date: Mon, 12 Jun 2023 11:09:22 +0530
Message-Id: <20230612053932.58604-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_223944_385522_22C27052 
X-CRM114-Status: GOOD (  11.96  )
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

This series adds in-kernel AIA irqchip to KVM RISC-V which trap-n-emulate
IMSIC and APLIC MSI-mode for Guest. The APLIC MSI-mode trap-n-emulate is
optional so KVM user space can emulate APLIC entirely in user space.

The use of IMSIC HW guest files to accelerate IMSIC virtualization will be
done as separate series since this depends on AIA irqchip drivers to be
upstreamed. This series has no dependency on the AIA irqchip drivers.

There is also a KVM AIA irq-bypass (or device MSI virtualization) series
under development which depends on this series and upcoming IOMMU driver
series.

These patches (or this series) can also be found in the
riscv_kvm_aia_irqchip_v2 branch at: https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased on Linux-6.4-rc6
 - Addressed Atish's comment in PATCH6
 - Added comments in arch/riscv/include/uapi/asm/kvm.h about APLIC and
   IMSIC device attribute type

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
 arch/riscv/include/uapi/asm/kvm.h      |   72 ++
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
 15 files changed, 3021 insertions(+), 33 deletions(-)
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
