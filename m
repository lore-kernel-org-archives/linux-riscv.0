Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D2C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mRRcnBHTetsxNRhsG2FgLP5hLlqRert2kLr32PcyIo=; b=0reMtITfX1NIOD
	MQP/P15MIGoEBB4gA4EcYaqLFA15lJIqK18w1hJuMWm8J6BJhjqo9cr/vjQatfbHZOWziS2ouOnfx
	YsQh2H+BY5nuuaoIt1a4xutpUNHr5XEWLo1iTld176Qd2u2mTVp/wwEgf7wk7w4hTSgIRXmK0UlmF
	LF0tUd8H0SAUd/jt2AdGMH+eY6GYaXdRW93aO97T2Y0ZacVdkXcSUhZKk/YY3tOY8ja5migRWc+Bs
	ySkjRjfmQ3Riw9TLPUAVY3hhpovU3yLlFl4gEnJqgk3JA+2yk9nN0Bh4UMl9iOOQuTVcxa0gTP8X/
	CP/0kwOue0u4nCFE3Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFvA-00000009DMA-1DuV;
	Mon, 13 Jul 2026 12:38:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFv9-00000009DLz-2KLF
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:38:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5147D4034E;
	Mon, 13 Jul 2026 12:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75D81F000E9;
	Mon, 13 Jul 2026 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783946283;
	bh=zZxDNhRLltG4YTlq4WnJRUzpRD8ef1hSBbexfSAmotg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXbLMSYM5ZBiiygAxE55G8L1OBxwgglhq93YUiwA7kmPPEf9IVIXKqQLZdSk/44K1
	 633KMNkVsAdZ2p7IfqSV2zJEkkYn2TIWyqN0dtsMHzuz5PWwH4wdRH+XkZU8q40yiJ
	 xsuj4Hn0+I6mvZn8p5dYkD5flFNbWqHQvXkoSCt69PvIwYGcDcgoi08WbBgyYFonZV
	 Vk2OZ2PeCDhfv1d9kauP4vIVvKO4wNt0sq2wpthpGH2BzGngkv8mKDUKlTx4DwOfe3
	 5WW7KfYUGGhDuv6Jggw+UtnW6sub7Q60jIGK8N+PTA5KkGxJYMHVlGBOUpmN8pY0MX
	 PhKZf7LI0PpHA==
Date: Mon, 13 Jul 2026 12:37:59 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
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
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <20260713123759-GKD106000@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wjbz5tp7vjrsjwjaiu3n7du5ksbrlsduuxhwg2wriyxshkrqd5@t3sdxr6ua2sg>
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

Hi Anirudh,

On 22:40 Sun 12 Jul     , Anirudh Srinivasan wrote:
> Hi Yixun,
> 
> On Thu, Jul 02, 2026 at 02:31:34AM +0000, Yixun Lan wrote:
> > This series try to add UFS support for SpacemiT K3 SoC, the controller
> > components consists of System Bus Interface Unit, UFS Host Controller
> > Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> > Management Entity (DME), Transport Layer, Network Layer, Data Link
> > Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> > block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
> > 
> > Please note, in order to test this driver, the UFS clock driver[2] here
> > should be applied first as a prerequisite patch.
> > 
> > One known issue is that the device will occasionally raise BKOPS interrupt
> > when doing some high load test, log from dmesg shows
> > 
> > [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
> > 
> > Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> > Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> 
> I see this during probe on a k3-pico-itx. Does the UFS chip on board
> have an RPMB block on it? Is this error of any concern.
> 
It's probably true of having a RPMB block, but not used in K3 platform, so can ignore

> [    5.957864] ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found
> [    5.963319] bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
> [    5.971155] ufshcd-spacemit c0e00000.ufshc: Failed to register UFS RPMB device 0
> 
Maybe disable CONFIG_RPMB to silent this? I've not tested this option locally

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
