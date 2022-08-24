Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F624C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 07:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xknIT3aCpjsrzO6t+Ziovp/COsH5rHwW0rc7xEtq7R8=; b=hKgxAPwlb+nT12
	B6Dgxuxi0m+QVusp6GX/BDX62W0HSMflb17SyRKqeHZF0WmiWZKsEeBXiaVSn641A7eu2lwEliVfK
	Nd26lzvvNVUmMGEX4seWcE9J77gJKkUT4IsX6Qy8FFd6KSnFId7nZCIzK5ezLSyQ/Q24KBlBEnySZ
	aO/FDyyQc3BfYphrrqyhFFomXMOV5WQhwXlmKenjd/+jGGO/DWczgscojxRvc2J8nqzD+HZr2hT58
	TW4erMpNExsqKHAtiChkaLlsG8Rx+SLHEisyeX2w97g/f9M5QcygxfyoOzCeHSC1wM6ib660ziwCj
	joe9BMk4XF7KA9kN6Ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQl4N-00BF40-3x; Wed, 24 Aug 2022 07:44:59 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQl4B-00BExf-3I; Wed, 24 Aug 2022 07:44:48 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D443922534;
	Wed, 24 Aug 2022 07:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1661327083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CVLEu5X5W558Mdwud6PEFNhZNUWDtayqH7r9TTDZuA=;
	b=Lz/ACUxILC+R3yz2Ui0SJh6CaW4tttXbYGqKExsC2hkoEsZCegFXYFc22ajQzGRvdjEryQ
	3CotfVecb7dxD8/WETOSvYRosDVKGJM3RkXu2/Cz96AiSW7ON9ujL0feO/uL9jEDd7Zl+h
	Ba3bmdinRxLW6ofOfbyC0I3KWkqj9FE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1661327083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CVLEu5X5W558Mdwud6PEFNhZNUWDtayqH7r9TTDZuA=;
	b=tl3Xm9YZ2vhlGUbXJNfule+zMvT2R4ylbRHH+Q3QSBJF/vfQm60/mcW6ZWE/UtUCRMNmGt
	ZBO5wTmc8lAY3PBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B707713AC0;
	Wed, 24 Aug 2022 07:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id elupLOvWBWPhUgAAMHmgww
	(envelope-from <iivanov@suse.de>); Wed, 24 Aug 2022 07:44:43 +0000
Date: Wed, 24 Aug 2022 10:44:43 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Phil Elwell <phil@raspberrypi.org>,
	kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] clk: bcm2835: Round UART input clock up
Message-ID: <20220824074443.nvrnqhpvqrtn72p4@suse>
References: <20220527102900.144894-1-iivanov@suse.de>
 <20220823230842.AB8BAC433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823230842.AB8BAC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_004447_307474_041DE935 
X-CRM114-Status: GOOD (  20.76  )
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

On 08-23 16:08, Stephen Boyd wrote:
> Date: Tue, 23 Aug 2022 16:08:40 -0700
> From: Stephen Boyd <sboyd@kernel.org>
> To: Albert Ou <aou@eecs.berkeley.edu>, Broadcom internal kernel review list
>  <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
>  <f.fainelli@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>, Michael
>  Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne
>  <nsaenz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
>  <paul.walmsley@sifive.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
>  <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>
> Cc: "Ivan T. Ivanov" <iivanov@suse.de>, Phil Elwell <phil@raspberrypi.org>,
>  kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
>  linux-rpi-kernel@lists.infradead.org,
>  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
>  linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v3] clk: bcm2835: Round UART input clock up
> Message-Id: <20220823230842.AB8BAC433C1@smtp.kernel.org>
> 
> Quoting Ivan T. Ivanov (2022-05-27 03:29:00)
> > It was reported that RPi3[1] and RPi Zero 2W boards have issues with
> > the Bluetooth. It turns out that when switching from initial to
> > operation speed host and device no longer can talk each other because
> > host uses incorrect UART baud rate.
> > 
> > The UART driver used in this case is amba-pl011. Original fix, see
> > below Github link[2], was inside pl011 module, but somehow it didn't
> > look as the right place to fix. Beside that this original rounding
> > function is not exactly perfect for all possible clock values. So I
> > deiced to move the hack to the platform which actually need it.
> > 
> > The UART clock is initialised to be as close to the requested
> > frequency as possible without exceeding it. Now that there is a
> > clock manager that returns the actual frequencies, an expected
> > 48MHz clock is reported as 47999625. If the requested baud rate
> > == requested clock/16, there is no headroom and the slight
> > reduction in actual clock rate results in failure.
> > 
> > If increasing a clock by less than 0.1% changes it from ..999..
> > to ..000.., round it up.
> > 
> > [1] https://bugzilla.suse.com/show_bug.cgi?id=1188238
> > [2] https://github.com/raspberrypi/linux/commit/ab3f1b39537f6d3825b8873006fbe2fc5ff057b7
> > 
> > Cc: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > ---
> 
> This is waiting for someone like Stefan to review. It's customary to
> include previous reviewers on new versions of patches.

Thanks for fixing me mistake.

Regards,
Ivan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
