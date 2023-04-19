Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824DBC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5kHeGROlgQ5SuA7JsytcSyt+z1MDvbMlMRhjlD9Q7U=; b=AsB0hGP8iaWHym
	YM6fM88KhXaFCoKBNToIGY588YjghNA0qN7ZryryOXC6DvoWEVzba5tkx8vrJalSrkvitIyfQHWSf
	ua8vhvlPmub6htzXePzuYYsoSKhS6sLlSkLMScPYbJAY3H35mtl769+9O7PdPw6e9NU0e/bn3zEWD
	Jur1YGWKhC5wOChKU+jDcYJxlz8iAnojwJ3LjLnCLNoVKJtBaFc2MkZeyIXO9a085q54P+A596FlR
	vr2a0omi0VtFbcbQN5gvJ26My35a+IVTwMPpRt7CkFUeQrqHxSvpdglw0jgMlqmpri+IhqRymA5FB
	1vdI1IK9QOD8YHAP5acQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDh-006Uej-0L;
	Wed, 19 Apr 2023 22:24:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDd-006Ua1-3B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a6762fd23cso4520455ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943042; x=1684535042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TyRM4nmtqohXFcwttydo/M979fjFpXSQwmt1QhEq7M=;
        b=o6BPf3mJiKmzHDTQduMjlUPZ224ynCQVPjqAxFiYl/xtjQhTUbKlM14FTeWvmNMg/L
         l0DrouIryk3u/EqI3byzcjbrgz+G8kwOXpTd0QZK3d3sEG9AOlbIPNTOq+DH6PD+Epo3
         zKe9QwsowdLs42oiVJKkIvYtT/MItZZgmSKR5C8Ea2x67PbxuR6leIH+i/b17jseR8bM
         VBwwA8Z195NKwe50pkO3mLwwTJ4OtkL6UCepduj0leLb4C5T7elpUTzmBMMBASJjF094
         bjxf9OSnAjUqLeAmsOa6EGQ0N3vUcmm6xctjwRZKzfkPZSzkZvKP3toboLwrlJYiGk9k
         5odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943042; x=1684535042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TyRM4nmtqohXFcwttydo/M979fjFpXSQwmt1QhEq7M=;
        b=Q4BmPpsizoqCawAi71JzUAlsJ+dhinkYkIFiNi5YltsbUO+NUk+LIeiwvG7D7G75fg
         fO1KnaTEQ2BEBBSdAQTNJ2hYGlCNIKYlEOQUm38DA4vcN4jPP1ESrW3cbdbjE3cHnJCF
         isfmyhJRivQo2LnjcvCNVRs9zvdrt6iEyOusA+/+JDmvC723UTqMmLFzT02HQtAiiAXs
         ambgj79zPHR9MHP/VOReD34bSgnOAPlgn5gWr34wYTzTfN/NVDHZT0mGr9S6DrUU8DAj
         aKIxIBFQYIEMnxWT4QFZAHw+1zw/LLPPWbX9Uvf8TVMG+13rCkubcDYXYQWLJybS01gw
         bkZg==
X-Gm-Message-State: AAQBX9f8LGwaxx0FsHz9pSkZXDHT+/ULV3944l+Ozahe67G56DiC9TYk
	vkuHPJi8PrL7IPsZdBPepD3n92YExaalVzoBpzo=
X-Google-Smtp-Source: AKy350Zx1dYLas0QCJpvJzHJgHFaFLbK94X4eX2SqTOZj0B0MjJMPmSVHt7a/giQTdAZWOuX7bdQng==
X-Received: by 2002:a17:902:7244:b0:1a2:37fc:b5e2 with SMTP id c4-20020a170902724400b001a237fcb5e2mr5966265pll.7.1681943042538;
        Wed, 19 Apr 2023 15:24:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 00/10] RISC-V CoVE support
Date: Wed, 19 Apr 2023 15:23:40 -0700
Message-Id: <20230419222350.3604274-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152406_023341_D88DE07A 
X-CRM114-Status: GOOD (  14.94  )
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

This series is an initial version of the support for running confidential VMs on
riscv architecture. This is to get feedback on the proposed COVH, COVI and COVG
extensions for running Confidential VMs on riscv. The specification is available
here [0]. Make sure to build it to get the latest changes as it gets updated
from time to time.

We have added a new option, `--cove-vm` to the `run` command to mark the VM as
a confidential VM.

The host including the kernel and kvmtool, must not access any memory allocated
to the confidential VM. The TSM is responsible for providing all the required
information to handle faults and emulate devices.

The series adds support to manage CoVE VMs, which includes:
   * Configuration
   * Creation of CoVE VM and VCPUs.
   * Load initial memory images using measurement ioctls.
   * Virtio support for CoVE VMs.

We don't yet support APLIC and thus no line based interrupts. So we use pci
transport for all the virtio devices. As serial and rtc devices are only mmio
based so we don't yet support those as well.

virtio for the CoVE enforces VIRTIO_F_ACCESS_PLATFORM flag to force SWIOTLB
bounce buffers in confidential linux guest. The SWIOTLB buffers are shared
with the host using share/unshare calls in COVG extension. Thus host can
directly write to those buffers without TSM involvement.

This series depends on few RISC-V series which are not yet upstream.

* AIA support[1]
* SBI DBCN extension[2] 

It also reuses the arch specific virtio host flag hook from CCA series[4].

The patches are also available here:

	https://github.com/rivosinc/kvmtool/commits/cove-integration-03072023

The corresponding linux patches are also available here:
https://github.com/rivosinc/linux/tree/cove-integration

Running a CoVE VM
------------------

Extra options needed:
--cove-vm: Launches a confidential VM.
--virtio-transport: We don't yet support MMIO devices so we need to
                    force virtio device to use pci transport.


 $ lkvm run						\
	 --cove-vm					\
	 --virtio-transport=pci                         \
	 <normal-VM options>

The details instructions can be found at [5]

Links
============
[0] CoVE architecture Specification.
    https://github.com/riscv-non-isa/riscv-ap-tee/blob/main/specification/riscv-aptee-spec.pdf
[1] https://github.com/avpatel/kvmtool/tree/riscv_aia_v1
[2] https://github.com/avpatel/kvmtool/tree/riscv_sbi_dbcn_v1
[4] https://lore.kernel.org/lkml/20230127113932.166089-28-suzuki.poulose@arm.com/
[5] https://github.com/rivosinc/cove/wiki/CoVE-KVM-RISCV64-on-QEMU

Atish Patra (7):
riscv: Add a CoVE VM type.
riscv: Define a command line option for CoVE VM
riscv: Define a measure region IOCTL
riscv: Invoke measure region for VM images
riscv: Do not create APLIC for TVMs
riscv: Change initrd alignment to a page size
riscv: Define riscv specific vm_type function

Rajnesh Kanwal (3):
riscv: virtio: Enforce VIRTIO_F_ACCESS_PLATFORM feature flag.
riscv: Don't emit MMIO devices for CoVE VM.
riscv: cove: Don't emit interrupt_map for pci devices in fdt.

include/linux/kvm.h                 |  4 ++
riscv/aia.c                         | 31 +++++++----
riscv/fdt.c                         | 38 +++++++------
riscv/include/asm/kvm.h             |  6 +++
riscv/include/kvm/kvm-arch.h        |  4 +-
riscv/include/kvm/kvm-config-arch.h |  4 +-
riscv/kvm.c                         | 51 +++++++++++++++++-
riscv/pci.c                         | 83 +++++++++++++++--------------
8 files changed, 152 insertions(+), 69 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
