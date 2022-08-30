Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C13BECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XiBO+eqOy5NpaSYkEb6MgEizmo4b13JMF15oHqZAUY=; b=KFxeB8pJcpxqoM
	VfIDiW06YaU8j8piA/WHN4+mUTO7bTsR7DmeRJb/gJZq5iyzYRna8sDNy8Gp+I2EvFodaiugeKcoi
	c6R/PZUozWYnW5P2P50vIlXbkKlCrliYewFn+Qcuilio4dtIuMRa4qQGZVYdf3NxDHpURYwxfAPRK
	+RcRE3yQiwt2gNr0ukAuSD5w9+oYxOEyPYW8B6pUi8ekrM5JCnK0+XUPRZlyGeWsYJINZnPzkVtip
	5vhrX1qmmtr5EgVsAKnaI0vNhrGj/FVLUeb3V7Y/Z+dkMM2tsMx9ecHIYHFmRuQY1t+YO7pdqh0OT
	hXOjiEHScevt1jZswVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1vA-00HVrr-EX; Tue, 30 Aug 2022 14:08:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1v7-00HVr0-Fv
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:08:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04B17B81C16;
	Tue, 30 Aug 2022 14:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C147C433C1;
	Tue, 30 Aug 2022 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661868526;
	bh=m/u8XyF+U/qV44PkAv5tgc86ePYtwDWmP547g4BF5ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THhOWVfhqu7k9+uWQ3/WwmgdvA6rsqI7C9Ha5p76pC1c0YUwr84gcNNu7VCQaUaS6
	 eSb8tp0bzNc4rEqn54RSKGjUsXZkvn/sUF4T+DjFCGjoJosFmWbSY5/sWQCKvfmFyI
	 nS0a9QcMfocrWVCEMER6OEW+dHqqjkf0CKYNuQyG/EdEjFZhLfIFF9BOMUyVcO3n3i
	 /fq5qh2xrNPu0T5dUNvkXmjxsUgqX3V30Rks5rto1rk+yABEHAoUzIy8JprFlpGTVz
	 bsqM80r9rgxXCNZDsSLEoaYCNStmKNzY1aTOclPFX0ll0yWMXF2HZpSxnW5xElTB4j
	 NpbZE+K/gjgtg==
Date: Tue, 30 Aug 2022 21:59:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Message-ID: <Yw4XwsVQBB1HRw04@xhacker>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
 <YwzI7VmfFnOvYWgf@xhacker>
 <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_070849_833368_D4322215 
X-CRM114-Status: GOOD (  21.54  )
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

On Mon, Aug 29, 2022 at 05:27:48PM +0000, Conor.Dooley@microchip.com wrote:
> On 29/08/2022 15:10, Jisheng Zhang wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
> >> Hey Jisheng,
> > 
> > Hi Conor,
> > 
> >> On 27/08/2022 10:58, Jisheng Zhang wrote:
> >>> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> >>> memory optimizations such as swap on zram are helpful. As is seen
> >>> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> >>> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> >>> swapped out"), THP_SWAP can improve the swap throughput significantly.
> >>>
> >>> Enable THP_SWAP for RV64, testing the micro-benchmark which is
> >>> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> >>> shows below numbers on the Lichee RV dock board:
> >>>
> >>> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> >>> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
> >>
> >> I know the original commit message contains this, but it's a little
> >> odd. If the patch /enables/ THP then how would there be THP swap
> >> prior to the patch?
> > 
> > hmm, it's swap I'll send a v3 to correct the description.
> > 
> >>
> >>>
> >>> Improved by 382%!
> >>
> >> I could not replicate the after numbers on my nezha, so I suspect
> >> I am missing something in my config/setup. zswap is enabled and is
> > 
> > swap on zram rather than zswap ;)
> 
> I think I tried about 30 different config variations, initially not
> using zswap and later using it.
> My zramctl looks like so (although I did try zstd too) after running
> the demo application from that commit:
> 
> NAME       ALGORITHM DISKSIZE DATA COMPR TOTAL STREAMS MOUNTPOINT
> /dev/zram0 lzo-rle       241M  22M  8.4M  9.1M       1 [SWAP]
> 
> I am using the default riscv defconfig + the following:
> CONFIG_ZRAM=y
> CONFIG_CRYPTO_DEFLATE=y
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_ZSTD=y
> CONFIG_ZRAM_MEMORY_TRACKING=y
> CONFIG_TRANSPARENT_HUGEPAGE=y
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> CONFIG_THP_SWAP=y
> 
> Am I just missing something obvious here?

similar config options here. what's your rootfs? Is your board busy
with something? I used a minimal rootfs built from buildroot.
can you plz show your numbers w/ and w/o the patch?

I also tried the simple benchmark on qemu(just for reference, since
I have no other riscv boards except the lichee RV dock board):
swp out w/o patch: 30066 bytes/ms (mean of 10 tests)
swp out w/ patch: 130055 bytes/ms (mean of 10 tests)
so improved by 332.7% 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
