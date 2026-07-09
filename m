Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF7C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h/bRHQHDGOH8kUGPgkC580p5kQp1wJGxarD+/+XRRY8=; b=Vqx6H5CJQneZYN
	UE6F9cLeWcBDHsJ67iLUeXGKTVRgW2nnLTv8FchdzC1oevkXZnsVJXYsnZ+nCH95oTk9wCqTCHHUj
	6O3Z2Mo+A+XyQpBzBZnTc9kue5IIukg6kOUoIpTkuF8w2KjGwadnOv26jc00OFbn+AknP2Ul21oN+
	dUIzbszAvTdlGpB40DYikV1fGoWpyZrlNi850on3GZOhTbTKbf9ZXbsbTg/tP2o/b9PG+NM7DkxXZ
	mpDHwGKGqljBygCGwyereuKA+n8Dekk4MYuwU1erdRGqBz/sTqLsbKwM4FxMp7+8TRmNvRFHQDYHi
	MiYwaMPcqRVcxurhx5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMy-00000002UQj-2sQl;
	Thu, 09 Jul 2026 13:00:48 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMw-00000002UOs-0FMv
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 13:00:47 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c95bd574471so711359a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602045; x=1784206845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg4645HSiS5JZdY+bW3DgGTrgEGwdoGfmFw6PnvB3Go=;
        b=SthabmedeHyG8rFGBsory//B1eOpDL3eqTgQcloQQLn95jk90/4UBGpgbcbN9gH5Us
         4yl+m4rPSbEpp5f1yIIitJFwZPV4gMUcpWVLX8X6T77CP1OnACduEQpXi0l573rKth7+
         nwDOR1E6yssH7vAZK7O047nIfb6oU2rXGD8nrhl9WVhnqW6GY+teG09QMVpSn0udLp84
         fcLnYSHyN/IgX1L2Amwfh4diAp9rWUYD7sDxG84HqtDoZ+Dkf52tjJusupzKpJ5WaO9b
         ILRGhZ9X4VohwinrtREuDh+d+4fc37zrok+ZzBBtu3Ii1NhIjijXMX/+kvuzZojSnYX+
         yBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602045; x=1784206845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lg4645HSiS5JZdY+bW3DgGTrgEGwdoGfmFw6PnvB3Go=;
        b=WZO1YYcWHXMkilJmFMGJoxMvUpHuiit6A7zO1wmqo3ef9FQhvSa6ezWGOOCusQlROr
         9V3aHxyP34Vpys17uV9xPQZ96t6OgtWY4vOgBme8SQ4apqXFYlZBEz+ruIs4gZ76Zh1e
         gUUE9ZocIgMzM6zaOP479yzpTqiQ+HC0xXiZ22ylY82niF4QNSLTBUY5qnm0BlDq1tOB
         FrzKXKwVJprkADhm/4uoKzecD+fNruOTbtCQTQZUvKQk91cxFtVeQjlVzwUJzryNY2Rm
         5VFVlWqqAgUDiytL49mpAH43+xFCoxJ/xMTR4PhDszNfhNTTk0NlcXXNorWAlrqaVTig
         hNBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLalYY2B5Ok0q1x1aT2bYIyPdGevwMnyXjKug3uWREAqcnbZCBuYXdA/zlv+iY0L/huG7JOTORzC74gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt/tpygtJYwwgFlNVFFVIeukhtOR/z+X0saciSQ1hqsdbndqGe
	Z1mcNf5tNO8sWDb+S6uRQmMSH2mJa3Ympk9tBW10T/SGQol5Nf+Kkk6B
X-Gm-Gg: AfdE7cl7+wrlT6SPMlMrE0NdiZ2cxGaoOcGcI6k8CSGT7G/WigmGgH4G6niM+wPuWfq
	wTvBX485F31IWH8WVG/L+2eVaBIryYUGKBsIA5+XfZwNGyC1svQHb5Buq1iR0ceuLvAy87C9QOM
	5afIs3j0vXz4njERuVGuoIQe4fW1iqM8AxqmSxleYOZTXr8WzNG6J4/mVuqKZRU0uQ6AsE4LHuO
	jOg9DxV4JDk7DEBVuS6FwvisAvHnfPHF9PvR7sw+yOx5p1OgSThexrvDM7z4D8hcRfowjmzQTk/
	sdEmOm+SqHc+2TrI9GDBR8LTrKX1BvHa5rrXe9+IPVPhsO9iPQQvHqmDiVrzWZPnzOzBJ2vKxbg
	CSG/D1aSOpJSMVxLwMB7c3vdQ85sGNbVMlMBBABkcqGodizdKEgUss6DtlleGWwaGGenCpxuUu9
	Kf7qR7ntned099PuIoMmwQb1GZOFA=
X-Received: by 2002:a05:6a00:859f:b0:848:5935:2e11 with SMTP id d2e1a72fcca58-8485935322amr2775708b3a.48.1783602044433;
        Thu, 09 Jul 2026 06:00:44 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm8752976b3a.14.2026.07.09.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:00:44 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	"Bingyu.Xian" <Shanbeeyoo@gmail.com>
Subject: [PATCH RFC 0/1] KVM: riscv: G-stage PMD block mappings for VM_PFNMAP
Date: Thu,  9 Jul 2026 21:00:35 +0800
Message-ID: <20260709130036.1708586-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_060046_099967_68812381 
X-CRM114-Status: GOOD (  10.99  )
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

From: "Bingyu.Xian" <Shanbeeyoo@gmail.com>

This RFC adapts the arm64 "stage-2 block mapping for host device MMIO"
idea (commit 2aa53d68cee6) to RISC-V KVM, allowing VM_PFNMAP regions
such as VFIO-assigned PCI BARs to use 2 MB G-stage PMD block mappings
instead of being forced to 4 KB PTEs.

=== Why this matters for RISC-V ===

1. RISC-V virtualization is maturing rapidly.  The H-extension was
   ratified in 2021 and KVM/riscv has been upstream since v5.15, but
   many performance optimizations that exist on arm64 and x86 are still
   missing.  This patch closes one of those gaps.

2. Server-class RISC-V platforms are on the roadmap.  Device passthrough
   (VFIO) for GPUs, NPUs, and high-speed NICs is essential for
   data-center workloads.  These devices have BARs ranging from tens of
   MB to multiple GB.  Without this patch, a single 256 MB GPU BAR
   requires 65 536 G-stage PTEs (512 KB of page-table memory and 65 536
   G-stage faults), compared to 128 PMD blocks with this optimization.

3. RISC-V IOMMU specification was ratified in March 2023 and Linux
   driver support is under active development.  Once RISC-V IOMMU
   hardware becomes available, VFIO passthrough will be a first-class
   use case.  This KVM G-stage optimization is a prerequisite for
   acceptable passthrough performance.

4. RISC-V has a natural advantage over arm64 here: the memory type is
   determined by the physical address' PMA (Physical Memory Attribute),
   not by the G-stage PTE attributes.  So promoting 4 KB -> 2 MB does
   not alter memory-type semantics, unlike arm64 where the stage-2 PTE
   MemAttr field requires careful handling.

=== Design choices ===

Unlike arm64's original implementation which derives the host physical
address from vma->vm_pgoff, this patch walks the host page tables via
get_hva_mapping_size().  This is more conservative but safer: if the
host mm itself has not installed a PMD leaf, KVM falls back to 4 KB
exactly as before.  The vm_pgoff approach is unreliable since the VFIO
unmap_mapping_range() changes discussed on the RISC-V list in 2025.

The first version is deliberately conservative:
  - Only PMD (2 MB) blocks, not PUD (1 GB)
  - dirty logging still forces PAGE_SIZE
  - falls back to PAGE_SIZE whenever contiguity/alignment cannot be
    proven

=== Testing ===

Verified on QEMU (rv64, h=true, sstc=true) with a custom kernel module
(pfnmap-huge-test.ko) that installs a PMD leaf in the host page table
for a VM_PFNMAP VMA, simulating a VFIO BAR with a 2 MB host mapping.

Tracepoint kvm_mmu_map confirms all three scenarios:
  - anonymous memory:      size=4KB    pfnmap=0  (control group)
  - /dev/mem (4KB host):   size=4KB    pfnmap=1  (safe fallback works)
  - PMD leaf module:       size=2048KB pfnmap=1  (block mapping works!)

I welcome feedback on:
  - Whether the host-page-table-walk approach is preferred over the
    arm64 vm_pgoff approach
  - Whether PUD (1 GB) block support should be added now or deferred
  - Whether the tracepoint should be kept or removed before non-RFC
    submission

Bingyu.Xian (1):
  KVM: riscv: Allow safe G-stage PMD block mappings for VM_PFNMAP

 arch/riscv/kvm/mmu.c   | 45 ++++++++++++++++++++++++++++++++++++------
 arch/riscv/kvm/trace.h | 29 +++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 6 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
