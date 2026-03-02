Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29BDEB3633
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyglTkCAT5C1U66MEpeX9/QGrOTPTrKQmzlBPlaSrpw=; b=OZl3ceZXrdrXL0
	9JouQe6b7FPY5E52n5qHmlW7kvh3ub4yqt4KJTVHtoO3K6lwSZSv2LsQKqLpq+F01nASgUO8WY6Km
	u7ecK7aQj1UeOQqck13aC1Wq31yxva8SEZRV+SKpCszu1A0tZv6Ug+0w8BzhF1kqmpbJsyek4KLWz
	zRZtPpggtNEEerLZgg70Yojzry9tiKhE/lLNs2ri/JmmTmAYrdR9vXaZTTFD/yK535ODTtQQPYWOZ
	BdErwgUENjm+ti3Gi5Kd3uptZO2N5t/cDIiz/sbWFHpZNNf2Pak+S8ebDDVu4j6v2w4sFOeKqql0u
	Z8O4/eULOExW5Ld4ZwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9yS-0000000DrMR-3Sw0;
	Mon, 02 Mar 2026 20:34:40 +0000
Received: from mail.bix.bg ([193.105.196.21])
	by bombadil.infradead.org with smtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9yP-0000000DrJi-0117
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 20:34:39 +0000
Received: (qmail 19022 invoked from network); 2 Mar 2026 20:34:33 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 2 Mar 2026 20:34:33 -0000
Message-ID: <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
From: Yanko Kaneti <yaneti@declera.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Lee
 Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Troy Mitchell	
 <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "open list:RISC-V
 ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"	
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"	
 <linux-pm@vger.kernel.org>
Date: Mon, 02 Mar 2026 22:34:33 +0200
In-Reply-To: <aaXuWwyA5NzBZzlW@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
	 <20251102230352.914421-3-aurelien@aurel32.net>
	 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
	 <aaC78FTN31QYaVg0@aurel32.net>
	 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
	 <aaS6xeKFZz06fb1_@aurel32.net> <aaXuWwyA5NzBZzlW@aurel32.net>
User-Agent: Evolution 3.59.3 (3.59.3-1.fc45) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_123437_376548_8A5AD0A9 
X-CRM114-Status: GOOD (  30.38  )
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

Hello,

On Mon, 2026-03-02 at 21:08 +0100, Aurelien Jarno wrote:
> On 2026-03-01 23:16, Aurelien Jarno wrote:
> > On 2026-02-27 13:29, Yanko Kaneti wrote:
> > > On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
> > > > Hi,
> > > > 
> > > > On 2026-02-26 16:32, Yanko Kaneti wrote:
> > > > > Hello,
> > > > > 
> > > > > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> > > > > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> > > > > > 
> > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > ---
> > > > > > v5: no changes
> > > > > > 
> > > > > >  drivers/mfd/simple-mfd-i2c.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > > 
> > > > > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > > > > index 0a607a1e3ca1d..542d378cdcd1f 100644
> > > > > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > > > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > > > > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
> > > > > >  };
> > > > > >  
> > > > > >  static const struct mfd_cell spacemit_p1_cells[] = {
> > > > > > +	{ .name = "spacemit-p1-reboot", },
> > > > > >  	{ .name = "spacemit-p1-regulator", },
> > > > > >  	{ .name = "spacemit-p1-rtc", },
> > > > > >  };
> > > > > 
> > > > > Perhaps its safe to merge this one now that everything P1 and I2C is
> > > > > already in linus tip ?
> > > > 
> > > > Unfortunately, this patchset is still missing:
> > > > https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/
> > > > 
> > > > This means the reboots work most of the time, but are not 100% reliable, 
> > > > and that's the reason why this patch got blocked from merging.
> > > 
> > > I see. Thanks. Sounds to me like sometimes working compared to never
> > > working is better , but anyway..
> > 
> > I agree with that, but the decision was to hold on this patch until the 
> > I2C PIO part got merged.
> > 
> > > FWIW  with this patch and the pio patcheset I get this rcu splat on
> > > reboot (which is still working). Similar splat is there without the pio
> > > patcheset.
> > 
> > I haven't been able to reproduce the issue here after 10+ reboots on a 
> > BPI-F3 board, but I tried the patch on top of 6.19. I'll try to build a 
> > 7.0.0-rc2 kernel and report back.
> 
> I have tried that, and I am still unable to reproduce the issue with a 
> 7.0.0-rc2 kernel and a BPI-F3 board.

I can still see it on every reboot (with the patches that allow reboot
to work). Do you have CONFIG_PREEMPT_RCU in your config ? its default on
when anything PREEMPT is selected. In Fedora its CONFIG_PREEMPT_DYNAMIC
that flips it.

Regards
Yanko


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
