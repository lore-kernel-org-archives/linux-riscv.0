Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E88CD98CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNw7EwMWVpYyRu27z3hPgpgH3G7Qwi/ZVdf/San1C6w=; b=LLWIyxxRMcUjEV
	+UEI7+yoMWBRAQCo8l7SePxgJQ1mXTuSWEFxJrSGudBXYPHKCgzB9bfWr9+bNw2Ml5gkV0L1n97+0
	7VXi0ux8HKWTABNTIIEZ699Lc3AlbyCZ9p4rkQ/7Cee/RbE3k5KZH5kogT0VAtnj3Zg2QW9nF5XIQ
	J9b1QCHJNoQQYqwmSqvWh5H5hHMpRfM/6R13S28HOwQ9CxczEiZkQzwwf5DKXFQWwUa5Gs7tE5MLw
	Gq9OoOPv+hg5FYlUHofQG6enpMIR7rWJAOL0q3JYkvGbaP018U6HG5WpEERn0EZtA3dUgL9vUvkKN
	1YnT4xDDslT2mbufNNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe97-00000009MdE-0xdR;
	Thu, 11 Jun 2026 12:04:29 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe93-00000009MbP-2s3p
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 12:04:27 +0000
Date: Thu, 11 Jun 2026 20:03:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781179452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/j69pXYfj34ZmqA6bJCKc0nePFg+h49mJ8/N7zh1iA=;
	b=C7VD/ntPHBl4YIG9Watr5T2GZLCvEmAzup5tfdjNbozip65PyigVCCrPseQbQKMgC2+M7G
	fYJkNSWFsX/dRktAsP7CNtY62sQ3fk1oEHQwJa+H4KpymFRmYbGmZ4jTCJo6jBN0nw2upe
	Z54mPkCYOx99N+izHFLdL+L2Fx6cijE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun <chenwandun1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	iommu@lists.linux.dev, zhaomeijing@lixiang.com,
	Rob Herring <robh@kernel.org>, saravanak@kernel.org, bhe@redhat.com,
	rppt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, chenhuacai@kernel.org, kernel@xen0n.name,
	catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
	akpm@linux-foundation.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev,
	m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: Re: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
Message-ID: <aiqkKe1gXPZ5LZ7t@MiWiFi-R3L-srv>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
 <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_050425_859285_98F52E7B 
X-CRM114-Status: GOOD (  31.75  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/11/26 at 11:09am, Wandun wrote:
> =

> =

> On 6/11/26 10:09, Wandun wrote:
> > =

> > =

> > On 5/27/26 11:29, Wandun Chen wrote:
> >> From: Wandun Chen <chenwandun@lixiang.com>
> >>
> >> On SoCs that carve out large firmware-owned reserved memory (GPU
> >> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
> >> those carveouts as part of system RAM even though their contents are
> >> firmware state that is not useful for kernel crash analysis.
> >>
> >> This series introduces an opt-in 'dumpable' flag [1] on struct
> >> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
> >> DT-based architectures (arm64, riscv, loongarch). By default reserved
> >> regions are treated as non-dumpable; CMA regions are explicitly opted
> >> in because their pages are returned to the buddy allocator and may
> >> carry key crash-analysis data.
> >>
> >> The series is organized as follows:
> >> Patches 1-3: Pre-existing fixes and a small prep change.
> >> Patches 4-5: Restructure to allow appending /memreserve/ entries.
> >> Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
> >> Patch 8: Add generic kdump helpers.
> >> Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elfcorehdr preparation.
> > Hi,
> > =

> > Gentle ping on this series.
> > =

> > Status summary:
> > -patch 03: respun separately per Rob's suggestion, picked up for 7.2
> > -patch 06: Acked-by: Marek Szyprowski -patch 09: Acked-by: Will Deacon
> > The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
> > awaiting review. your feedback would be greately appreciated. I know we
> > are at the end of 7.1 -rc cycle, I don't want to rush this series, just
> > collecting more feedback, and will send next version based on 7.2-rc1.
> > If spliting the series into smaller logical group would make review
> > easier, please let me know. Best regards, Wandun
> =

> Apologies for the formatting issue in my previous email.
> Here is the properly formatted version.
> =

> Gentle ping on this series.

Thanks for the effort, the overral looks good to me at 1st glance. I will
check if there's concern on generic part. And meanwhile, I am wondering
if there's any chance x86 or other ARCH-es w/o OF/FDT can also choose to
not dump some areas, e.g GPU stolen memory. Surely, that's another story.

> =

> Status summary:
> - patch 03: respun separately per Rob's suggestion, picked up for 7.2
> - patch 06: Acked-by: Marek Szyprowski
> - patch 09: Acked-by: Will Deacon
> =

> The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
> awaiting review. Your feedback would be greatly appreciated.
> =

> I know we are at the end of 7.1-rc cycle, I don't want to rush this
> series, just collecting more feedback, and will send next version based
> on 7.2-rc1.
> =

> If splitting the series into smaller logical groups would make review
> easier, please let me know.
> =

> Best regards,
> Wandun
> =

> =

> >>
> >> v2 --> v3:
> >> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.=
[2]
> >> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
> >> 3. Add some prepare patches.
> >>
> >> v1 --> v2:
> >> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
> >> =A0=A0=A0 feedback [1], v2 drop that property and exclude reserve memo=
ry
> >> =A0=A0=A0 by default.
> >> 2. Split some prepared patches from the original patches.
> >> 3. Address coding-style comments on patch 5 from Rob.
> >>
> >> [1] https://lore.kernel.org/lkml/20260506144542.GA2072596-
> >> robh@kernel.org/
> >> [2] https://sashiko.dev/#/patchset/20260520091844.592753-1-
> >> chenwandun%40lixiang.com?part=3D4
> >>
> >> Wandun Chen (11):
> >> =A0=A0 of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
> >> =A0=A0 kexec/crash: provide crash_exclude_mem_range() stub when
> >> =A0=A0=A0=A0 CONFIG_CRASH_DUMP=3Dn
> >> =A0=A0 of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_a=
rray()
> >> =A0=A0=A0=A0 fails
> >> =A0=A0 of: reserved_mem: zero total_reserved_mem_cnt if no valid
> >> =A0=A0=A0=A0 /reserved-memory entry
> >> =A0=A0 of: reserved_mem: split alloc_reserved_mem_array() from
> >> =A0=A0=A0=A0 fdt_scan_reserved_mem_late()
> >> =A0=A0 of: reserved_mem: add dumpable flag to opt-in vmcore
> >> =A0=A0 of: reserved_mem: save /memreserve/ entries into the reserved_m=
em
> >> =A0=A0=A0=A0 array
> >> =A0=A0 of: reserved_mem: add kdump helpers to exclude non-dumpable reg=
ions
> >> =A0=A0 arm64: kdump: exclude non-dumpable reserved memory regions from=
 vmcore
> >> =A0=A0 riscv: kdump: exclude non-dumpable reserved memory regions from=
 vmcore
> >> =A0=A0 loongarch: kdump: exclude non-dumpable reserved memory regions =
from
> >> =A0=A0=A0=A0 vmcore
> >>
> >> =A0 arch/arm64/kernel/machine_kexec_file.c=A0=A0=A0=A0 |=A0=A0 6 ++
> >> =A0 arch/loongarch/kernel/machine_kexec_file.c |=A0=A0 6 ++
> >> =A0 arch/riscv/kernel/machine_kexec_file.c=A0=A0=A0=A0 |=A0=A0 4 +
> >> =A0 drivers/of/fdt.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 11 +-
> >> =A0 drivers/of/of_private.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 3 +
> >> =A0 drivers/of/of_reserved_mem.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 | 117 +++++++++++++++++++--
> >> =A0 include/linux/crash_core.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 6 ++
> >> =A0 include/linux/of_reserved_mem.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 15 +++
> >> =A0 kernel/dma/contiguous.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 1 +
> >> =A0 9 files changed, 157 insertions(+), 12 deletions(-)
> >>
> > =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
