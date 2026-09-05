Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC445C624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmLRwnUZTy+OsWe3+L4wUxdpYK2knzm4xETfpk1619s=; b=1xUoFYi8QtjQDc
	f0m87QCIbBYRi9t3XH/i5vYGGxFRfOL3b1V0yhTaeKXDvrA9AO7+28sAM3zL/q2Mpa4bQNxbOe4qh
	S5M3ZiBD+3UXI6eF1KUFLQRVz6+c8gtorbPIB/jmWneRvFyVmPJPSFcNQfip4uB2jOh+NR01IcBYw
	jxZS5pXFoKL92qzAkVXtKWhL5z1lxdSJ27Ucsym6RpPCIrRUskF4re/euVXIV7Hj/isLe8RZc7TZ0
	EWLrObiEBz4qza7wTMu7KGhbThrrVwn1upX3q3lklBf1TOr5FVZXJiH6xDRew4kzHKXNsU/xTsGd6
	qm2qCM/Pc8Y3VIDoTMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2yhr-00000004RsP-13iI;
	Sat, 05 Sep 2026 22:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2yhq-00000004RsJ-0AUP
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 22:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8579560514;
	Sat,  5 Sep 2026 22:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD1D1F00A3A;
	Sat,  5 Sep 2026 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788646668;
	bh=A3eZZ8TfJYlcw34wez1Kdovv/0mAJhnU0+7MF4+bJt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hpBXobmfFLzOBMwLPse7sAFp5zbwefy5aTtb/vORaTrjkt/P9uTxdANRvLZVrpmLt
	 +zEPvzOp2Yu0GvURsinUtEJDbNmdboecSYEG6bYv6uMO+Ff7BT0GDy2EQyAPzfaUio
	 R/EISh/y5qsxPgx4wFvxB02mhMSxEpoAzMbZcuaD8s8NR/GGQE67+aygvuvDWl4ow2
	 GUs7olSmjsr4S9pxATVt/+B38ASZ7BVIWBqgcSWpWNVPaeJtSQIWpbJdY4pZAh9Xbs
	 SygLvRQBUVrfmHj6wBTDw/5/LVNyf/sVmg7hLKG8c/GaWX/HF3tx828FdEUsb/BDtd
	 q+GW9WGUIUK+g==
Date: Sat, 5 Sep 2026 22:17:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <20260905221746-GKD53903@kernel.org>
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
 <uyl23bmb7dtvkneu7wbpmq24gkmrpmr5n5xkanjrnjf27xsp6g@gcjezv6xwolx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uyl23bmb7dtvkneu7wbpmq24gkmrpmr5n5xkanjrnjf27xsp6g@gcjezv6xwolx>
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

On 11:41 Sat 05 Sep     , Anirudh Srinivasan wrote:
> Hi Troy,
> 
..
> >  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >
> 
> On a recently new K3 board (shipped with OpenSBI/U-boot dated
> end of July), I was seeing upstream kernel boot hang after IMSIC
> initialization. Some logging indicated that it was hanging around the
> clock controller initializations (k3_ccu_driver_init).
> 
> On a board running older U-boot/OpenSBI from May, I originally didn't
> observe this hang, but doing multiple repeated boots showed a rare
> instance of this hang happening. Some changes were added to OpenSBI in 
> this period (end of June) that trap clock controller registers to M 
> Mode and handle reads/writes there.
> 
> Yixun pointed me to this patch, and it seems to fix the boot hang on 
> the board runner newer OpenSBI. I think this avoids some kind of a 
> race condition with disabling/re-enabling a PLL that the clock driver
> does. I'm finding it a bit hard to explain/understand what exactly it
> the reason though.
> 
..
> Yixun, could this patch get added in soon?
> 
Let's wait a bit, the patch itself do solve the problem, but Aurelien
and me still have some minor concern, see other post in this thread

Although the problem is a combination of vendor firmware + upstream kernel,
but it will affect quite widely and probably last for quite long time, so I
think it would warrant a Fix tag and back port to old stable versions..

> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> 
Thanks for the testing

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
