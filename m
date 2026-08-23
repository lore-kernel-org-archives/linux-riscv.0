Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC380C5DF8C
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3h4zO7x2kkBDylCIhmPm1h/Ms2gIIWZOmUduxwKJ8BY=; b=sh9LVOqJeBi2za
	BkJeiDAn0d2C7WFOeIdlPeleAPNUW6q0cgQrzt0KFSX1XgxNwv/9C4vQGQOzEUB4F+4SZVJ46445Y
	N6vD7DqOGEOHklqWzOdB1RHvgK1GGGtUfDJsZ1Fd/siDjfzcQvRVEnwaaOvVXtNcfAhttUrZIqUfg
	S66jObtOPdC48Hjn1bmZGEP4Bb9dhw+1MY59n8N6gBijj41Gp5BfhtJafDpALGZgEX5hLSQh4ae84
	xqvuWA6on8fn2ikzd1oo2ah5urn5NntlpZxU7Efow0JB0rAoS6prlb3PIUtGJzFhQx0wrPfsduhIS
	Vz/inJUVEZs0P3zXYwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyDTC-0000000FXrT-0Rrh;
	Sun, 23 Aug 2026 19:03:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyDT9-0000000FXr9-3jxT
	for linux-riscv@lists.infradead.org;
	Sun, 23 Aug 2026 19:03:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38CA1601E0;
	Sun, 23 Aug 2026 19:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926021F000E9;
	Sun, 23 Aug 2026 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787511777;
	bh=+MWPs2kA1onXfLcmEnNyBINtH0GKMep20TQq7xPn2Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CbxzWPHfiwOS3E+vU56nE0z4h5ZrHq6R5rNtsZmhtlOhNz8iBji5vzQlfQ7ZR6jsL
	 zzfuoJTth0oxILV6kY3Yh6Jp6eokHLymF7RFtdxUrbW34GX7/llO7FMMYd61JHaWmB
	 l8JGN34ifeHk058vvknKxhnSqVdXrMaER1SgqkEPZNcex/1GW0ciSZmnDprzwDgdgU
	 snxGk7HHdP/caCUudYmeb2Dg4pynf7iko2nouBDBYIFAWfmzbmsf+vXOIHSP4FrcsD
	 VRuUdb2jX9qdXGWRiO98uV63xsjLSX0wul0vjwEhXio5BhPseHMbCARl22k9KFJysW
	 uQVcu+pH4gn9A==
Date: Sun, 23 Aug 2026 12:02:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net,
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support for resctrl
 device assignment
Message-ID: <aotD4FrUcw+7zK/e@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
> This RFC extends RISC-V CBQRI/resctrl support to external requesters
> behind a RISC-V IOMMU.
> 
> The RISC-V IOMMU QoS ID extension associates a resource-control ID
> (RCID) and monitoring ID (MCID) with IOMMU-related memory requests [2].
> For a translated device request, the IOMMU obtains the IDs from the
> device context translation attributes (DC.ta) and supplies them to the
> I/O bridge after a successful translation. The bridge and downstream
> CBQRI-controlled resources can then apply their existing allocation and
> monitoring policy to the request.
> 
> The series is based directly on Drew Fustini's v4 RISC-V Ssqosid and
> CBQRI resctrl series [1]. That dependency provides CPU-side QoS ID
> plumbing and CBQRI-backed resctrl support. This series extends the same
> resctrl identity to device requests translated by a RISC-V IOMMU.
> 
> The RISC-V names map to the existing resctrl identifiers as follows:
> 
>     resctrl CLOSID  ->  RISC-V RCID
>     resctrl RMID    ->  RISC-V MCID
> 
> Userspace first creates a resctrl resource group. The new "devices"
> file then assigns an external requester to that group:
> 
>     userspace
>        |
>        | mkdir /sys/fs/resctrl/<group>
>        |
>        | echo "iommu_group:<id>" > /sys/fs/resctrl/<group>/devices
>        v
>     generic resctrl devices file
>        |
>        | (closid, rmid)
>        v
>     RISC-V CBQRI IOMMU binding backend
>        |
>        | (rcid, mcid)
>        v
>     RISC-V IOMMU DC.ta.{RCID,MCID}
> 
> The "devices" file is an assignment and membership interface only. It
> does not describe a new resctrl resource, schema, or monitoring domain;
> resource policy remains in the existing schemata and info files.
> 
> Common IOMMU helpers:
> 
> The userspace ABI names an IOMMU group by the numeric ID already used by
> /sys/kernel/iommu_groups. Patch 1 adds iommu_group_get_by_id() as a
> narrow, reference-counted lookup for that existing identifier.
> 
> Updating a group also needs stronger iteration semantics than separate
> iommu_group_for_each_dev() calls can provide. All devices must be
> validated before any device context is changed, and group membership
> must not change between validation and update. Patch 2 therefore adds
> iommu_group_update_devices():
> 
>     lock group->mutex
>       for each device: check()          /* may fail, no state changed */
>       for each device: update()         /* non-failing callback */
>     unlock group->mutex
> 
> The helper contains no resctrl or QoS policy. It only provides an
> all-or-none validation boundary for a group-wide update while keeping
> IOMMU group internals private. The RISC-V IOMMU QoS code is its first
> caller.
> 
> RISC-V IOMMU programming:
> 
> For translated device requests, the per-device-context QoS IDs are
> programmed in DC.ta. Active contexts are invalidated after an update so
> cached translations do not retain stale IDs. BARE mode cannot safely
> represent per-IOMMU-group assignment because only the per-IOMMU
> iommu_qosid global default is available, so group assignment rejects
> BARE mode.
> 
> The RISC-V IOMMU also has a per-IOMMU iommu_qosid register. The series
> exposes it as:
> 
>     /sys/class/iommu/<iommu>/qosid
> 
> This sysfs attribute programs the global RCID and MCID used for
> IOMMU-originated DDT, CQ, FQ, PQ, and MSI accesses. In BARE mode,
> device-originated requests also use these IDs. It is not a resctrl group
> assignment interface.
> 
> Open questions for this RFC:
> 
>   * whether a common resctrl "devices" file is the right ABI for
>     associating external requesters with a resource group;
>   * whether iommu_group_get_by_id() is an acceptable narrow common
>     helper for resolving the numeric IOMMU group ID passed through that
>     ABI; and
>   * whether iommu_group_update_devices() provides the right common
>     contract for checked group-wide updates.
> 
> [1] Drew Fustini's CBQRI v4 series:
> https://lore.kernel.org/linux-riscv/20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org/

FYI - the 3 Ssqosid patches from my v6 series have been merged into
mainline:

3ec6f50a91bd ("dt-bindings: riscv: Add Ssqosid extension description")
5a17eb5f1c4c ("riscv: Detect the Ssqosid extension")
326ba66db949 ("riscv: Add support for srmcfg CSR from Ssqosid extension")

I'll send a rebased series once v7.3-rc1 is tagged.

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
