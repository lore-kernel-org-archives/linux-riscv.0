Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E72C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhnYV+7+hQCv294efWsc6pbsdxF0tVpK/7JEtN5xS2I=; b=WZrZD4kF/bs5Mk
	CoEsmAOc89LU6aPuCVZtZTb1QkjWh805+lCv4L8LvqvyFk8Hh+DaAEuKXwOs4dfQQcN63Gu09LGM2
	p+T5bB7+wIaqQSiCldS9dtISLeIqEJ3DYJDWbmF3w0o10chedgJbAmM/CJoDEXq0rWJ264Md3JRRA
	JHMGeXLDcEiuoreFO9LyLMUuu9sHkIc7Bhn8KQkGbzDr1v4jgSB/7CvWFRKn3toMy8jYXpw12LEJy
	YeiVtdEux82c6F6CB/Pbu1A7y/40ZZh8ZbRkH8b2ZE0Umx98Pg14E6HW74mG7uhqtmYYXSqvW9kPE
	h+mr1HB0ntyJptXqX8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZxb-0000000EziU-1Zyd;
	Mon, 27 May 2024 13:00:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZxU-0000000Ezer-1tt3
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 May 2024 13:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rMFfpqCc+bc4O8mDHjvAEFD1eHUpLSCJjFslGtJ4svo=; b=LeCSlTR6I1+anG9wTjhD+HiohV
	7t5tRtRJ1mnzOUa1KCORpsPhyc6CgIW+ZJJKUVZ5xrPqMlLS+bZ3ysv3Eq9OetxkBwJpH7P/OJRHX
	9dnHG3gZn3/XleKbtAT+UVvCFKWx+IinbMB4Rmmwj1rh9kepUZxMQEsciBUmfxNHRKdnaju18yGiP
	0x93WCbfte4LQXojT3fkAtN9CvdnUVn8GIq5Y8JgtaM1tmCU3skuj68eCAGyUi4mPaoKexry2YsCJ
	Tk0GiuBqRqrHSjWDdC08eUyLf4Scw/vnaFF7FCdCfaL2Q2UdWzkF8RA0CT7NUU8PFDgzC3FUWLI/2
	ICwzoEig==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZxQ-0000000BIha-1epp
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 13:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rMFfpqCc+bc4O8mDHjvAEFD1eHUpLSCJjFslGtJ4svo=; b=BYiyBB3X8G1QiZKbh5RNNixyhN
	/txB0NYAWfPSURQCARY+CvzFQfrT9NuzVsc6O7U0HqVcm7UzH5eeQa7BX0hQknfK1GBb//KsRn9Fl
	I9q7M2N2KzZq/dv9EwvUhztgslecsFMmh69szcGzBA6ttSYVdu/OUF+hj/uHYrH5cvWhwKs7TYLke
	3ztvLiZZVLuW8GeZfFpX7xYGM0faF2NtfNL/6U4Pr3Ncib88OQC7uA86dF8Om4ZBHGvhFcUxtqMRL
	lWMyKoi5fgnxHG4p2Mf6qtHUsw1ksvbHxm1CrbiFAxIpsnEMzU0AmZCPEU/SVtk7kAiK70l0PPZkb
	w66XC4Bw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37854)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sBZuz-0003Wh-1b;
	Mon, 27 May 2024 13:57:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sBZv0-0002Kk-8F; Mon, 27 May 2024 13:57:38 +0100
Date: Mon, 27 May 2024 13:57:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Ron Economos <re@w6rz.net>, Guenter Roeck <linux@roeck-us.net>,
	regressions@lists.linux.dev, linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev
Message-ID: <ZlSDQssA9I4LRjwM@shell.armlinux.org.uk>
References: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
 <d7f0c16a-0d83-4060-8d95-95b293d95dfd@leemhuis.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7f0c16a-0d83-4060-8d95-95b293d95dfd@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_140008_689455_DB73CF70 
X-CRM114-Status: GOOD (  22.70  )
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

On Mon, May 27, 2024 at 01:16:06PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 27.05.24 12:45, Ron Economos wrote:
> > On Fri, May 17, 2024 at 03:09:14PM -0700, Guenter Roeck wrote:
> >>
> >> On Fri, Mar 15, 2024 at 11:47:55AM +0000, Russell King (Oracle) wrote:
> >> > Report an error when an attempt to register a clkdev entry results in a
> >> > truncated string so the problem can be easily spotted.
> >> >
> >> > Reported by: Duanqiang Wen <duanqiangwen@net-swift.com>
> >> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> >>
> >> With this patch in the mainline kernel, I get
> >> [...]
> >> when trying to boot sifive_u in qemu.
> >>
> >> Apparently, "10000000.clock-controller" is too long. Any suggestion on
> >> how to solve the problem ? I guess using dev_name(dev) as dev_id
> > parameter
> >> for clk_hw_register_clkdev() is not or no longer a good idea.
> >> What else should be used instead ?
> > 
> > This issue causes a complete boot failure on real hardware (SiFive
> > Unmatched).
> 
> Hmmm. That and because nobody afaics has time/motivation to fix this
> anytime soon (or am I mistaken there?) makes me wonder if we should
> revert this change for now (and remerge it later once the problem this
> change exposed was fixed). Or is another solution in sight somewhere?

I'm sorry, but clearly I should tell my employer that I can't do work
for them because there's been a mainline kernel regression, and of
course I should be working on this bank holiday Monday...

No, please wait a bit longer.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
