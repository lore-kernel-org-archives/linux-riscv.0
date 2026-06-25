Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92278CDB47F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oE+uKoNivGF2ofdVvGDCWBugaLplULCbRlZ+5iRtJJE=; b=Hr0BHF2K1pJ2dt
	TMLkkvc5+Zjy5q2dZ+fFIhBZ7yEiPKf3vdAQUzU+8eKW5SxpsPJPHqS53d/t9l2pqktgEfQcsdsWs
	peNJM6JuQL25uFwO9l9bh7chya5YjMmB1W6zoGCGoVIgpN7RswVuXPi+kM+Is61xmOtk4/OhkS7Uz
	VwivEdDclRDQb6Eflf/FN/zl05btwz2YtD8g8NH1GyAvq03W+0rDD8RLXTCtzdX0vGOPwabDFJbgy
	gv6WBNSGe0ilHmmFTCnChzYjNrXGhUDf1PhU5wA1Kz7Q3yAnPkqAdTkfVm/DCvJ8JoqkJJCkC0V8U
	/GwWG5K207S/0IvSi/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgTY-00000008um9-0TNl;
	Thu, 25 Jun 2026 09:34:24 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgTV-00000008ulU-2kDM
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 09:34:22 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-37df416c44bso448253a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380060; x=1782984860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYRSLIfYHpPR04npLSTCU2YxfW3gt1pEjbz27KF6mlY=;
        b=aRhNOvzTYSZl9OzAPW5DeB9nESIXtOs0T+3OS1IGsc3vOIIV+veF7FfYI/sunwtFYc
         LAa418SrdBWrpL3ihuniyqR5tG36a1jmeKpbXNUEUfNK5XsGIDGSOLyVi1na/pKpiHLX
         8wDJLWaaaTuq2n+/QgZ6TqCGJrmi42C8v8P/pWzArfmjim8rhuNxxeh6l0NHJ7iLoZbu
         pmKIMtAVN/Mo/u+XjkC3HA00eUHYmi1pSRSqwZ0sDkGas/updTzbH/01fjIwZAfeKtsD
         gZVGyGiTmckPCt9GcbS4OoboMCNOPfhZRHtxhU0SdmFMRecjBZOF0a+LY/HnWzn9oxjE
         /NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380060; x=1782984860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYRSLIfYHpPR04npLSTCU2YxfW3gt1pEjbz27KF6mlY=;
        b=tVrJAw4PgHkOx4Pi7EHBrQIDa7TtzQwXCA6W7O/4zkQxv6FlWZeeLtRAqWtKxeFaPm
         4Ii0d5+eXQr1C3Gm1yZs76a1tvz3V6a/FDUuqYNXm1672WlsaqPJZ5WfhgYDCbvepRlq
         vLhYj2wNAK943n1BaHhARxhSvGaCxZPfpodj5ywfsNLPp91IGZewGZS3f0+Ks+mpaPUp
         UdnsXP55/TbjSXPtkDyF/kexMmqdIWZ581LnFjdLieEfbGW5paCuABY32dww5WjI9jZ+
         tNmr9Op24ei7RdpNju7opbARP0uRb0RoRIsJmYMX4KB7n4doV+3EfD87+rWDqvTNF9dB
         kAHg==
X-Forwarded-Encrypted: i=1; AHgh+RqU7TNGhSKOUVllUxbEE7lx9uHB3+xbChqPwIV2eKJVWro3TAzPN2Pf2EZxbm9dGqxoiIoPmuBVnyPjhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqVIBOEx/b1wxbCT4DkOdOTUxwBrCDmCcPrkOqCOk1CZvtLnTU
	evjn/HWQrsmJksXhldmx5qGSrCAKmi4Sp0M79PN4CbP6Wt2Co1hUN9TK
X-Gm-Gg: AfdE7cklNk7mLxrP6Ify5nV8wrAgUaG/zzdpYAZ/SKCFMk/emJQjWAsXJBTNYptwo05
	yuYa/JA53V78/9Jc5pJGpouoIc0c6T1OfbzpK9MKOcOpysyEuqJGfIYXPa8OTeGtzHZTH1JzFhb
	N1dZ20jjv0qy6wIz7kDMQ2ZqcBfKu9qb1IPzzNOmonD6kFLilKJH9wS/+ceO7soxUZVG2bjyy2Y
	5VfR3WWi8GsKHx2inkX26UCpaU+IxJ+vjql581lC/+uiHyiv4ReRR+WSp/IDDGMmcKlm/Z/p9K7
	8oNYXEDijc1JBcUlhA72ZAf1MzzIYzDcJiTvQdXmA0vHo1WvAgpIomK0ZikIYT5kgvBFUU+z9Rk
	rxYLan5s5HWsy+LtyedjdJGMbLHAi9YGXi7cpDAE4kYPpvCed9Q+IAsRqU9hFMwyLp2f5bW3VrF
	1SKsC3GNdMvLpBWKCxT1U2EM8DDcs=
X-Received: by 2002:a17:90b:3c4e:b0:37d:ac3a:2f4f with SMTP id 98e67ed59e1d1-37dfa25153fmr1879870a91.13.1782380060178;
        Thu, 25 Jun 2026 02:34:20 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df400b68esm1473863a91.13.2026.06.25.02.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:34:19 -0700 (PDT)
From: "bingyu.xian" <shanbeeyoo@gmail.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bingyu Shan <shanbeeyoo@gmail.com>
Subject: [RFC PATCH 0/1] iommu/riscv: mark endpoint ATS-broken on ATS invalidation timeout
Date: Thu, 25 Jun 2026 17:34:15 +0800
Message-ID: <20260625093416.4023451-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_023421_725597_F3DF8F3A 
X-CRM114-Status: GOOD (  15.48  )
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

From: Bingyu Shan <shanbeeyoo@gmail.com>

This RFC proposes handling ATS invalidation timeout in the RISC-V IOMMU
driver, following the class of problem ARM SMMUv3 recently addressed as
"ATC invalidation timeout / quarantine": a PCIe endpoint that fails to
complete an ATS invalidation keeps stale ATC entries and can keep DMA-ing
through them.

The RISC-V IOMMU driver currently has no such handling.
riscv_iommu_cmd_sync() only logs "Hardware error: command execution
timeout" once and discards the failure, with no attribution to a device
and no policy response.

Patch 1 adds the first, conservative milestone:

  * On a command-queue timeout, read CQH to find the offending command; if
    it is an ATS.INVAL, extract its device-id (the RISC-V analog of ARM
    SMMUv3 CERROR_ATC_INV_IDX) and schedule deferred marking.

  * The marking worker sets a per-device ats_broken flag, increments a
    counter, calls pci_disable_ats(), and logs. Deferred to a work item
    because cmd_sync() may run with only RCU held while the device lookup
    takes a sleeping mutex.

  * riscv_iommu_enable_pdev() refuses pci_enable_ats() for an ats_broken
    device, so a broken endpoint is not put back on the ATS path.

  * Device tracking (the DID-keyed rbtree) is moved from the PRI-only path
    to probe_device/release_device, so ATS-only devices are tracked and can
    be attributed. This also fixes dev_to_iommu() not being usable inside
    probe_device() (the iommu core only links dev->iommu after probe
    returns), and a latent duplicate-devid double-unlock in the rbtree
    insert.

  * Debugfs fault injection (inject_ats_inval_timeout) and a state table
    (ats_devices) so the marking path can be exercised. Real RISC-V IOMMU
    hardware and unmodified QEMU complete ATS.INVAL synchronously, so a
    native timeout cannot be reproduced against a real endpoint; the knob
    schedules the same worker the real cmd_sync() timeout path would.

Full quarantine and PCI reset recovery are intentionally left out of this
step; this RFC is to discuss the timeout-handling policy.

Base / dependency
-----------------

This RFC is based on Tomasz Jeznach's riscv_iommu.next branch, because the
RISC-V IOMMU ATS support series (ATS / PRI / SVA) is not yet in the IOMMU
tree. It is intended to discuss design, not for immediate merge.

  Base:  tjeznach/riscv_iommu.next  (Linux 6.15 + RISC-V ATS/PRI/SVA)
  Not based on: iommu/linux.git next (no RISC-V ATS support yet)

Open question for the list: should the ATS invalidation timeout handling
be folded into the ATS support series itself, since an ATS implementation
that does not handle timeouts is arguably incomplete?

Validation environment
----------------------

  QEMU:             qemu-system-riscv64 10.0.0 (hw/riscv unmodified, stock)
  Kernel base:      tjeznach/riscv_iommu.next + this patch
  Cross compiler:   riscv64-linux-gnu-gcc 11.4.0
  Kconfig:          RISCV_IOMMU=y, RISCV_IOMMU_PCI=y, PCI_ATS/PASID/PRI=y,
                    VIRTIO_NET=y, VIRTIO_PCI=y, DEBUG_FS=y
  Endpoint:         stock -device virtio-net-pci,ats=on (BDF 0000:00:03.0,
                    IOMMU device-id 0x18 = PCI requester id dev<<3|func)
  Boot cmdline:     root=/dev/ram rw console=ttyS0 earlycon=sbi \
                    iommu.strict=1 fw_devlink=off

  fw_devlink=off works around a platform-IOMMU deferred-probe on this QEMU
  setup ("deferred probe pending: ... /cpus/cpu@0"). No QEMU patches are
  used; the ATS endpoint and the IOMMU are stock.

Validation log
--------------

Boot is clean (no panic). The IOMMU probes and manages the endpoint:

  [    0.442968] riscv,iommu 3010000.iommu: using wire-signaled interrupts
  [    0.448530] pci 0000:00:00.0: Adding to iommu group 0
  [    0.448908] pci 0000:00:03.0: Adding to iommu group 1
  [    0.538245] virtio-pci 0000:00:03.0: enabling device (0000 -> 0003)

ats_devices before the trigger (both RC and virtio tracked via the rbtree
populated at probe):

  devid device ats_broken ats_inval_timeouts
  0x0  0000:00:00.0  0  0
  0x18 0000:00:03.0  0  0

Inject an ATS.INVAL timeout for the virtio endpoint (DID 0x18) via the
debugfs knob, which schedules the same worker the real cmd_sync() timeout
path would:

  Injecting ATS.INVAL timeout for devid 0x18 (24) (BDF 0000:00:03.0)
  [    6.910242] virtio-pci 0000:00:03.0: marked ATS-broken after ATS.INVAL timeout

ats_devices after the trigger:

  devid device ats_broken ats_inval_timeouts
  0x0  0000:00:00.0  0  0
  0x18 0000:00:03.0  1  1

This confirms, on the real ATS path and with unmodified QEMU:

  ATS.INVAL timeout -> DID 0x18 -> 0000:00:03.0 marked ATS-broken
  (ats_broken=1, ats_inval_timeouts=1)

Caveats
-------

  * The real cmd_sync() CQH->DID path is implemented but cannot be
    triggered on unmodified QEMU (synchronous ATS.INVAL completion); the
    debugfs knob schedules the same worker to validate the marking logic.
    It would fire on real hardware or on a QEMU modelled to stall ATS.INVAL.

  * pci_disable_ats() inside the worker was a no-op in this run: ATS was
    not auto-enabled at boot (no "ats" sysfs attribute), so
    info->ats_enabled was false. The disable and the ATS-enable guard are
    correct by inspection but not dynamically triggered here.

  * Stale-ATC data corruption (device keeps an old IOVA->PA mapping and
    DMAs through it after a missed invalidation) is out of scope; that
    needs an endpoint with a real device-side ATC, which stock virtio-pci
    does not model.

Todo / open questions
---------------------

  * Should this be split (rbtree tracking / timeout marking / debugfs) for
    a non-RFC version?
  * Quarantine vs. just "mark and refuse re-enable": what policy does the
    list want?
  * PCI reset recovery semantics.
  * Re-base onto iommu/linux.git next once the ATS support series lands.

Bingyu Shan (1):
  iommu/riscv: RFC: mark endpoint ATS-broken on ATS invalidation timeout

 drivers/iommu/riscv/iommu.c | 210 ++++++++++++++++++++++++++++++++++--
 drivers/iommu/riscv/iommu.h |   9 ++
 2 files changed, 210 insertions(+), 9 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
