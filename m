Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF39EC53209
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hPgBoMOj0OZ6MeFJbLO1pCvDcaLwkr/7RrdUZklb5A=; b=y7y1vZST0nhXR2
	5sedmqRLjVxYoDRUVcCCr/78I8zOVtt6TE09DZug6d35zGiV+24Y73NlW5pksO8Fg/PeQmagdteP3
	reUCB3QNZtNNhUPjKEt0XRMWYDj4FRuoXV48AwZnkhqmmuVpRSWJJ6vJZYqjeWmdB0Wz9LuU3fUe1
	OeYMY8LKuvr9wGuHaGRePuWciC8evls0lDB9EVRqIIqieFbAM1tn42jbpte4cj8LPIFm9MJgGUpdB
	x9ot5TQmy1ps+smCLmH2k+JKR9uGP0dxopwMcxTpc+Ms/ESsX5Pu/809xZnwpJc81LI0w5sOuiof4
	lzvLUC1OhM9+4a3AYMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMqH-000000037ET-021p;
	Mon, 27 Jul 2026 15:02:09 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMqE-000000037Cf-1lIv
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 15:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=93gQyKs/Loc50T0J0Ycz+Bfql8No0r2Sptp8WTz9pkU=; b=ddq2pVYQC9FeOWffCFBQ5sGKJX
	T5kZnOZDOP04yCpIfBjoYeGAV1f9C6QYWwdonbdvcds1Q6ADdHgABKrbJ+S+trTG8Tp+vhkTo1ErT
	TPLx9Gn95sBGPJYc5z5rxeE8W7CkAo1VMt56BH3/kBqkvWthkdnHW6kJI5QmiaZgnsS6cLsnP4eAO
	UcU3GLz1GxaC1WlxaJxdrnx0IedePVJIXr2qxbcF5QZP77rYwIGB7Vn7Ybdi2FWpEdTR/erJ5ADhd
	Xh+RyDt1lTpCqZK5Q/vmFLlxUoTMilOvNoeTNYHrpgtu+w+12/RyCa8rUiOFb/TV+Ui1XyWcWHsgP
	9flGjf0Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1woMpm-0000000HTK4-3XKG;
	Mon, 27 Jul 2026 17:01:38 +0200
Date: Mon, 27 Jul 2026 17:01:34 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <amdyzkFplQqJvMl1@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_080206_464667_8E9B351A 
X-CRM114-Status: GOOD (  19.21  )
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

On 2026-07-25 10:37, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> 
> Please note, in order to test this driver, the UFS clock driver[2] here
> should be applied first as a prerequisite patch.
> 
> One known issue is that the device will occasionally raise BKOPS interrupt
> when doing some high load test, log from dmesg shows
> 
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
> 
> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v2:
> - fix missing interrupts property
> - move ufs node to k3-com260.dtsi
> - convert freq-table-hz to operating-points-v2
> - rework reset_control, fix header and drop global variable
> - drop dump_host_regs() debug interface
> - converge and refactor dme_set() operations
> - massive reduce of busy delay() loops
> - drop vendor specific hce_enable_notify(), fallback to default
> - drop unused member from struct ufs_spacemit_host
> - add COMPILE_TEST support to Kconfig
> - comment style fix
> - Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org
> 
> ---
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
> 
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  27 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 686 +++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  79 +++
>  8 files changed, 869 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2

Thanks for this new version. Patches 2 and 3 are:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
