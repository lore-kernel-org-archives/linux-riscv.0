Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB6FD10F58
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oU6jSUQyRH2Hz+OhFZRhd1uizDtn19agqjWFxLZ0AFo=; b=riG4m89mx/GRxf
	HH3TbcVSdCdVtBvDySuUekAnijn1X5/mfr8O2gIiPMSYs/6rbZiLKVoq6ZLRL+JKrUxHKFGlmC8jt
	8AihWw8mNMpt3R9VC8dnCUTzsazblDc5hcRSUgJMrd3ve7vqkw2faVxoyxeP+kC7ErS45nsUYG7dz
	Z0IpiFLYrzqsE25Ag67/pDhezCYK5eFi1yD5ZiDFIn7+spcaad5Qo5/1UZFVfxhG40Z0591FU4Qqs
	8FLfGdycu22RHsfdNO9w/qfhx7GA/63bDYjg9hYYM39viU0BKDalgRmYV2zoGCm1Ys9mILPEu7LcH
	wEJ+gz5N+AcRjDAkBbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHMw-0000000FB3Q-32Eg;
	Wed, 26 Nov 2025 15:23:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHMu-0000000FB3E-2aDI
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Nov 2025 15:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2ddLJKCOVjMves+hceaAGT2oX1d++yYZEwkbtCO1NHs=; b=DLEPa0WHbW945F8Pn4JyofKa2F
	fbTxEpXMXo0kHd3zdBkZavOM1yovxUQEHVOEtda6GdJkWc7i9v3MKqr5pLpGhAhWFcTAzz/0HGpDD
	xUJL2bPRyrYROVbk51sqb5IVUREv+MZORU0VjlDcHm2YNEVqnxMpyATOGH5SIxKbGD//FjybM5Wno
	Y2vy2U6O9O+HTonwOxmQIFVFKl63uWoC87wCvmZxyp6QWRCxMrT9oqHdHNDIKKyQwKCsP5ULR5sJq
	PjU/hKLbyCK3MyPw2J2cAm1uBlnoOCZxxpNyb3/V7RH7fpC2W8jrou32V1pduC4KuenJaDFYiZs7E
	SS6P0uTg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGVG-00000008FYZ-39aM
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 14:28:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B2FF626210;
	Wed, 26 Nov 2025 16:17:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0w9pV8YloJCn; Wed, 26 Nov 2025 16:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764170234; bh=rwOxc3oM6BiT9ujdBuYbjPw1NSEhJg/9U/iunCF2lgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=McZ1pI6Qebpwzpvg/bcPvoKciUG+VWJyW18cOueEY7LIAyRtWjr3tUcYH8wQHQ4Iy
	 PzVSmbawRoc/Hhd+b7Axs/TLF1ZK8ZMK9TM0+iM71gRMmiMsTtPL4+eQcBIBKapOHI
	 L0lvOd/XjojtlLNdIFVLIpK6N+/F2HyoXD4AMEZujYrx2W+di6WU+Zy2F9+KOCNKSu
	 qJ8bCiXjh7lMkd0ZitXPZ0t8V/4lWodGZ/IbU7WyF4hcT4b8tDLGAeuqx6E0wGfB5x
	 5J8C8968PzHWrRZ7dk0c/V9uTZlB1TaDJC/2aR1jUGo2y4ACgU6CnimX466MZkZbUr
	 fRmihdBURkGjQ==
Date: Wed, 26 Nov 2025 15:16:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aScZ5mwesY3wQTQl@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aScUELnY-TC8kVzV@gen8>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aScUELnY-TC8kVzV@gen8>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_142818_909200_24F3DE2B 
X-CRM114-Status: GOOD (  27.84  )
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

On Wed, Nov 26, 2025 at 08:52:00AM -0600, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> > All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> > lock status is indicated by register PLL_STS (offset 0x80 inside AP
> > clock controller). We should poll the register to ensure the PLL
> > actually locks after enabling it.
> > 
> > Furthermore, a 30us delay is added after enabling the PLL, after which
> > the PLL could be considered stable as stated by vendor clock code.
> > 
> > Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> [...]
> > +/*
> > + * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
> > + * for safety.
> > + */
> > +#define TH1520_PLL_LOCK_TIMEOUT_US	44
> > +#define TH1520_PLL_STABLE_DELAY_US	30
> 
> I'm taking a second look at this and I think it might be best to add a
> define for the polling loop delay of 5. It could be helpful when other
> people read the code later.
> 
> [...]
> > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > +					      reg, reg & pll->lock_sts_mask,
> > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> 
> The loop delay is only used here but I think using a #define would make
> it more readable.

There are TH1520_PLL_LOCK_TIMEOUT_US and TH1520_PLL_STABLE_DELAY_US
defined because they're meaningful constants, either specified by TRM or
implied by vendor code, however the 5us delay is only a randomly-picked
value, as what I've mentioned before.

Anyway, I'm fine with a separate definition. So please go ahead if it
looks better to you.

> Other than that:
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> If no other changes are needed I could fix this up on apply. Let's see
> what other comments there may be. It's too late for me to send a 6.19
> clk pull request so this will have to target the next merge window. I
> can put it into linux-next once 6.19-rc1 is released.

Many thanks for it.

> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
