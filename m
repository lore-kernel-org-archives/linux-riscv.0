Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA12EB3632
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZNWZ7Tq4j5tdrjM1R5INLCunA/tRDeplNUo52jiEkw=; b=BEFwh63Kx/HaH4
	VW6UnodrtomRnfsIiQE8o3+Rb4eXAGvIBMZ9x+uT+pmlaeTcevBjqMUUh4NNtCyBkhAIJz38AS7Ef
	BC5MopS7ThrE1dDUPUhn7KvhKudKq90UO05XTH07xcah1T3m+j+Qb99RhzBNfsFwiuG+GTxW9Afv3
	mcWlSafk3PMCdDiIV7vKpI2vJBK/DfbEq1euqOWo5MeZDypriStNDnjf/ed9O9TjpotZHOBnXY9PI
	HFRtH7Jbj1dOT8DuL9cS5McMMNJ3qbBEkSgdB0jlfO406n3oihfRyFinQEK2HWF7AYBFi6xXVvh6r
	ILVCHkq0fIfRQS1FJkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9Zp-0000000DmY6-0tRI;
	Mon, 02 Mar 2026 20:09:13 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9Zm-0000000DmXb-03tX
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 20:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=3+zY78mylit5/fdujgN7gsluGF7Jzq9S48A1C8Ytv1M=; b=L8Gn3ObhH/saBw+CuqV4l5WOTv
	RJOPtfC780LFjQ0NDKj5DaYMeEoZBqtwKXedJvfPk67SOUvAYDwE+M0NpBPMnDRFbQ69S4wdkMK1H
	515agvtqnisdhWJ9YObmpXe8WrayHDWjx7nqXjfCJnFQ+Tl/llmfIC0Q9qal/CklI60OmhH8W62Qw
	i2EvXN7Ywk1QBtRMdhrfBabXy/EImPO56+Jt4JTRn/7+anYguBCevoKp57iWuaiwZFgN3/msDwZju
	wqV96uvnU/j4vh2XX5I9sF0GMaHVZpAzFCZmp3c7d39RJFSVlf1VMnTvq0K0Sr7Da3Py2hIUXHPTR
	dKl/WWNg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vx9Zc-0000000DNAz-0LDs;
	Mon, 02 Mar 2026 21:09:00 +0100
Date: Mon, 2 Mar 2026 21:08:59 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yanko Kaneti <yaneti@declera.com>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
Message-ID: <aaXuWwyA5NzBZzlW@aurel32.net>
Mail-Followup-To: Yanko Kaneti <yaneti@declera.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <20251102230352.914421-3-aurelien@aurel32.net>
 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
 <aaC78FTN31QYaVg0@aurel32.net>
 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
 <aaS6xeKFZz06fb1_@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaS6xeKFZz06fb1_@aurel32.net>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_120910_062122_085DD314 
X-CRM114-Status: GOOD (  30.57  )
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

Hi,

On 2026-03-01 23:16, Aurelien Jarno wrote:
> On 2026-02-27 13:29, Yanko Kaneti wrote:
> > On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
> > > Hi,
> > > 
> > > On 2026-02-26 16:32, Yanko Kaneti wrote:
> > > > Hello,
> > > > 
> > > > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> > > > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> > > > > 
> > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > > ---
> > > > > v5: no changes
> > > > > 
> > > > >  drivers/mfd/simple-mfd-i2c.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > > > index 0a607a1e3ca1d..542d378cdcd1f 100644
> > > > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > > > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
> > > > >  };
> > > > >  
> > > > >  static const struct mfd_cell spacemit_p1_cells[] = {
> > > > > +	{ .name = "spacemit-p1-reboot", },
> > > > >  	{ .name = "spacemit-p1-regulator", },
> > > > >  	{ .name = "spacemit-p1-rtc", },
> > > > >  };
> > > > 
> > > > Perhaps its safe to merge this one now that everything P1 and I2C is
> > > > already in linus tip ?
> > > 
> > > Unfortunately, this patchset is still missing:
> > > https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/
> > > 
> > > This means the reboots work most of the time, but are not 100% reliable, 
> > > and that's the reason why this patch got blocked from merging.
> > 
> > I see. Thanks. Sounds to me like sometimes working compared to never
> > working is better , but anyway..
> 
> I agree with that, but the decision was to hold on this patch until the 
> I2C PIO part got merged.
> 
> > FWIW  with this patch and the pio patcheset I get this rcu splat on
> > reboot (which is still working). Similar splat is there without the pio
> > patcheset.
> 
> I haven't been able to reproduce the issue here after 10+ reboots on a 
> BPI-F3 board, but I tried the patch on top of 6.19. I'll try to build a 
> 7.0.0-rc2 kernel and report back.

I have tried that, and I am still unable to reproduce the issue with a 
7.0.0-rc2 kernel and a BPI-F3 board.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
