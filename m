Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C09ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQn5GxqF81YrooeLr47EUaTwIPwAuwKyJYmM6ZnZMXA=; b=TuTxZWzVYdMEWf
	5iKj5glENg+qTEo1z5qEVARLwaVO93uHOigKrey8LC12BvSZPY61S0xmdwJuEYgK1ejlK1rKLs+CX
	66oK5rjPyzVb77Glx0ShGYvb3hfecue22eqEPmsUXkOYc2GqC898ei4wZ92DTSGyt/nRCjKfuLefc
	+RLHOh2KQGiF+1C6GJxp9DisXIeE7hPBjT9ImMHBK3v14X+2PmEx55sHVRvNiwwW/Ho+E4/AOcrNK
	JtgTJTUyz6yus4ZpC0fOavTRn/UxYHSFacYfBje+z7dvPxIHAQYW7wPe2EtneS8gDBPKLtYIojUX4
	UXJ8F403fm17AcOjADWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2Pv-0003Pu-2E; Tue, 30 Aug 2022 14:40:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2Ps-0003P8-Nk
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:40:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 689F161538;
	Tue, 30 Aug 2022 14:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8B0C433C1;
	Tue, 30 Aug 2022 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661870434;
	bh=/3OQPzQeZByYa7GYP7YBcP1lmtBiXFL2ZTsz2biZiMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SU6LkW2gWKLtQ2bdjJbMq9unFMwkSW5i2oGhdrR7tO4HHRFH0MOYX2/pNxUyvQj5l
	 Qn22IxSF5P7xPR6c7IBtGlQ2sM/fmzaQJPIwdAnTpPACmhciLhaoM9d7vFmaKNMSek
	 1NggdkYRXC3FvqIHI3RjEODHfHjnV3SLEzMXpzVckeYNGYNiUdIDQoLdf7RsblEH/d
	 KRTCFLDeFPGBg0Yq8x0bCa7N1TXxbQNcUSTdg9XyP/X9xKideuC6s2v2gJ3di/E4BK
	 c2MwQUEOwMwyQd9+zVn5XVwtWqsTcZ/TBhQCBatkoWDAte8IwHU/HKF3n9lEeKIJHr
	 vilyXuSpAHu8Q==
Date: Tue, 30 Aug 2022 22:31:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Message-ID: <Yw4fN/9L2yAsCgXk@xhacker>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
 <YwzI7VmfFnOvYWgf@xhacker>
 <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
 <Yw4XwsVQBB1HRw04@xhacker>
 <d9331af0-58bc-ed3b-10f5-8509795e3198@microchip.com>
 <22c254ae-2b84-1342-4b2d-f532f34e2c94@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22c254ae-2b84-1342-4b2d-f532f34e2c94@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_074036_894538_D5F91549 
X-CRM114-Status: GOOD (  29.12  )
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

On Tue, Aug 30, 2022 at 02:26:38PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 15:15, Conor Dooley - M52691 wrote:
> > On 30/08/2022 14:59, Jisheng Zhang wrote:
> >> On Mon, Aug 29, 2022 at 05:27:48PM +0000, Conor.Dooley@microchip.com wrote:
> >>> On 29/08/2022 15:10, Jisheng Zhang wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>
> >>>> On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
> >>>>> Hey Jisheng,
> >>>>
> >>>> Hi Conor,
> >>>>
> >>>>> On 27/08/2022 10:58, Jisheng Zhang wrote:
> >>>>>> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> >>>>>> memory optimizations such as swap on zram are helpful. As is seen
> >>>>>> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> >>>>>> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> >>>>>> swapped out"), THP_SWAP can improve the swap throughput significantly.
> >>>>>>
> >>>>>> Enable THP_SWAP for RV64, testing the micro-benchmark which is
> >>>>>> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> >>>>>> shows below numbers on the Lichee RV dock board:
> >>>>>>
> >>>>>> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> >>>>>> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
> >>>>>
> >>>>> I know the original commit message contains this, but it's a little
> >>>>> odd. If the patch /enables/ THP then how would there be THP swap
> >>>>> prior to the patch?
> >>>>
> >>>> hmm, it's swap I'll send a v3 to correct the description.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Improved by 382%!
> >>>>>
> >>>>> I could not replicate the after numbers on my nezha, so I suspect
> >>>>> I am missing something in my config/setup. zswap is enabled and is
> >>>>
> >>>> swap on zram rather than zswap ;)
> >>>
> >>> I think I tried about 30 different config variations, initially not
> >>> using zswap and later using it.
> >>> My zramctl looks like so (although I did try zstd too) after running
> >>> the demo application from that commit:
> >>>
> >>> NAME       ALGORITHM DISKSIZE DATA COMPR TOTAL STREAMS MOUNTPOINT
> >>> /dev/zram0 lzo-rle       241M  22M  8.4M  9.1M       1 [SWAP]
> >>>
> >>> I am using the default riscv defconfig + the following:
> >>> CONFIG_ZRAM=y
> >>> CONFIG_CRYPTO_DEFLATE=y
> >>> CONFIG_CRYPTO_LZO=y
> >>> CONFIG_CRYPTO_ZSTD=y
> >>> CONFIG_ZRAM_MEMORY_TRACKING=y
> >>> CONFIG_TRANSPARENT_HUGEPAGE=y
> >>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> >>> CONFIG_THP_SWAP=y
> >>>
> >>> Am I just missing something obvious here?
> >>
> >> similar config options here. what's your rootfs? Is your board busy
> >> with something? I used a minimal rootfs built from buildroot.
> >> can you plz show your numbers w/ and w/o the patch?
> > 
> > I was using fedora for the testing, downloaded directly from
> > koji. My before/after numbers varied, but were around 80,000
> > bytes/ms most of the time.
> > 
> > If I increased the size to 500 * 1024 * 1024 I got around 130k.
> 
> 130k before & after.**
> 
> > 
> > Before/after the patch, the numbers did not really change, but
> > things did fluctuate quite wildly - from about 50k to 90k using
> > the 400 size.
> 
> What I mean is: before/after the patch had visible performance
> difference because it was always flucuating in the same range.

I see the difference -- w/ minial buildroot rootfs, the numbers isn't
kept the same but the difference is trivial, I even got two or three
the same numbers during 10 times of testing. But your numbers were
always flucuating, so I guess your system maybe busy with with
something in a shore period, I.E the os env is full of noise. 

I guess you may get similar improvement percentage when trying buildroot
> 
> > 
> >>
> >> I also tried the simple benchmark on qemu(just for reference, since
> >> I have no other riscv boards except the lichee RV dock board):
> >> swp out w/o patch: 30066 bytes/ms (mean of 10 tests)
> >> swp out w/ patch: 130055 bytes/ms (mean of 10 tests)
> >> so improved by 332.7% 
> > 
> > I'll give QEMU a go so :)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
