Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 07:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42r0ktLouC/mRWxZz++xPYMjiAYdi7XRFYWYjQHk6FQ=; b=itylBxjeuVpnDE
	EbyutzXP/AuXuGDKF9NTC/1H31Phly+RLFaKGNGkkVJlStJNf9ypDaxYokCa9ZBA22NcuWL3/sdWO
	bASEKjMYdNWXU3AB/MPz3x7+TCKMyNhdiZv1Tz3Mi8baOz37q426RaxtT8MjQaoG4HBHlIW0GxzaN
	j4+YShMdkPwdWfw2Fb/0+KjMeU+0dElmSxcmAhycKm7/NXYVYfhxVYZ6u+pAqmsxtZE0j1qkEyHal
	Yo9pjR/nohEoqMbMSx85E2PvfovuVaZhmlnEB/4xTrz3vkClUcyuM2kFhnT/jipWDqoBqF3TnsHUg
	3juJCqk+ZIjn+mRV/01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq7vs-008aWV-FU; Wed, 02 Nov 2022 07:13:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq7vp-008aV7-Ii
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 07:13:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 534F8B820D3;
	Wed,  2 Nov 2022 07:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94D3C433D6;
	Wed,  2 Nov 2022 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667373178;
	bh=8YSLrlTKEH/zZIjxkCCQNXWTZJ2rwxcYE+d26YpyZhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCHRTvzu2C+o/dTeJ1w2KnygFUzicLKPEmKXP8E6REFdfiHlRdHFNcSVW38NntkAe
	 Yf2g0IIWpTQrIVg+Y3E4GePvAmVfVWOwc02ANBuInOB4m/rOY6u1e6oZirNQJWOelb
	 Z6aUE5lXtjdRy1QOJWiS5GZhSXlYf7PWXyN0UOJQ=
Date: Wed, 2 Nov 2022 08:09:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 0/6] RISC-V: stop selecting device drivers in Kconfig.socs
Message-ID: <Y2IXrD4FpXNmDDPk@kroah.com>
References: <20221005171348.167476-1-conor@kernel.org>
 <Y15nwXmn7rToJkH2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y15nwXmn7rToJkH2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_001301_880857_B7D18D87 
X-CRM114-Status: GOOD (  19.86  )
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

On Sun, Oct 30, 2022 at 12:02:09PM +0000, Conor Dooley wrote:
> On Wed, Oct 05, 2022 at 06:13:43PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > As my RFC [0] series doing the symbol name changes has not yet reached
> > consensus, I've split out the removal of device driver selects into a
> > new series. I kept the plic as a direct select - although given how Maz
> > is treating the SiFive plic driver as the RISC-V plic driver, maybe that
> > should just be selected by default at an arch level...
> > 
> > I assume the individual patches can go via their subsystems & I'll
> > resubmit the arch/riscv patches a cycle later? I'm not in any rush.
> 
> Hey,
> 
> What's the story here with the two serial patches, they just waiting for
> an Ack? I think these are archived on the riscv patchwork, so if that is
> the case I'll unarchive them and mark as needing one.

Sorry for the delay, I'll take both of them through the tty/serial tree.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
