Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D925EDEBF0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKEOAWPa9qJPavczKjl+XTxZA+uUI6Z5WlGllPIXc/Q=; b=HswCWK3WeMs+G4
	i4EZcGMmE5d7tHg+1iNMkrDcLSpzz4F8g/DvTF4lmOseimySXwo2RuUece+pJyzfV/hcOORCDrYU9
	c7wAzRYq6/W8gotYCWXfRV5t5HeU7OA0jbFGpej3iUC2VT0OA+70iwC+Rkjt/SwCfEdtHDJ4uWJCj
	SK5nPhC41xodiQxtkNKdMNRFY23tmrBKdqcgxtXnlW+rUKmQpymfnQyqYlXL2B8N78eqA7ByH7gm6
	DQPMVMUesd6iruWqlR+mjT3EJqUH75oNChc8PYQwPksmNlVZMvJHAw/Oq5d2cnB5oPZQi0ynbzi+m
	AtUCfshG4W+XiQmrE+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWVz-0000000FvBt-1UqE;
	Tue, 03 Mar 2026 20:38:47 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWVw-0000000FvBK-3TZd
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 20:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ZN9YjA7A/E5P7KV/eCgsd8bu8xvdRjvgUVEuCuL5dSI=; b=kF5mi4y4bri056BNgYXfAyhKzE
	SLZLqP74NX0rq7RrkYwmymPIZ5Vvl1XuDfCR7Ua3Ba0ntlotelICnOhisN57V4qyfT6mGODYpUwZ6
	o/cIpbd7nuZxP/TOEoSWjY+mE/K7qMOnHo+IJUrA7/vMxUJ+R7rR+nFH73VMVK+kluEwN/FYNOU97
	rA5pA0P/IVs+eXXCwoJg/bacFLbB/WSmY1pnA13Lf8XuOVyuUhrOX3thTmu1/iH3HVHIKxVQ0tqnX
	45pnL5MYzw7X51YFEXGzONYfvQLpF1rHdnjlEwUGDRHyMEnxwwqMneDqOWXiOu9BXoY4SCnQCFHEV
	O0ZC14QQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vxWVf-0000000EkpA-3dfF;
	Tue, 03 Mar 2026 21:38:27 +0100
Date: Tue, 3 Mar 2026 21:38:27 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yanko Kaneti <yaneti@declera.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
Message-ID: <aadGw1fIlJyNNoum@aurel32.net>
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
 <aaXuWwyA5NzBZzlW@aurel32.net>
 <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_123844_894320_40788B96 
X-CRM114-Status: GOOD (  35.69  )
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

On 2026-03-02 22:34, Yanko Kaneti wrote:
> Hello,
> 
> On Mon, 2026-03-02 at 21:08 +0100, Aurelien Jarno wrote:
> > On 2026-03-01 23:16, Aurelien Jarno wrote:
> > > On 2026-02-27 13:29, Yanko Kaneti wrote:
> > > > On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2026-02-26 16:32, Yanko Kaneti wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> > > > > > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> > > > > > > 
> > > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > > ---
> > > > > > > v5: no changes
> > > > > > > 
> > > > > > >  drivers/mfd/simple-mfd-i2c.c | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > > > > > > index 0a607a1e3ca1d..542d378cdcd1f 100644
> > > > > > > --- a/drivers/mfd/simple-mfd-i2c.c
> > > > > > > +++ b/drivers/mfd/simple-mfd-i2c.c
> > > > > > > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
> > > > > > >  };
> > > > > > >  
> > > > > > >  static const struct mfd_cell spacemit_p1_cells[] = {
> > > > > > > +	{ .name = "spacemit-p1-reboot", },
> > > > > > >  	{ .name = "spacemit-p1-regulator", },
> > > > > > >  	{ .name = "spacemit-p1-rtc", },
> > > > > > >  };
> > > > > > 
> > > > > > Perhaps its safe to merge this one now that everything P1 and I2C is
> > > > > > already in linus tip ?
> > > > > 
> > > > > Unfortunately, this patchset is still missing:
> > > > > https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/
> > > > > 
> > > > > This means the reboots work most of the time, but are not 100% reliable, 
> > > > > and that's the reason why this patch got blocked from merging.
> > > > 
> > > > I see. Thanks. Sounds to me like sometimes working compared to never
> > > > working is better , but anyway..
> > > 
> > > I agree with that, but the decision was to hold on this patch until the 
> > > I2C PIO part got merged.
> > > 
> > > > FWIW  with this patch and the pio patcheset I get this rcu splat on
> > > > reboot (which is still working). Similar splat is there without the pio
> > > > patcheset.
> > > 
> > > I haven't been able to reproduce the issue here after 10+ reboots on a 
> > > BPI-F3 board, but I tried the patch on top of 6.19. I'll try to build a 
> > > 7.0.0-rc2 kernel and report back.
> > 
> > I have tried that, and I am still unable to reproduce the issue with a 
> > 7.0.0-rc2 kernel and a BPI-F3 board.
> 
> I can still see it on every reboot (with the patches that allow reboot
> to work). Do you have CONFIG_PREEMPT_RCU in your config ? its default on
> when anything PREEMPT is selected. In Fedora its CONFIG_PREEMPT_DYNAMIC
> that flips it.

Thanks for the hint, that option was not activated here, it's not the 
riscv64 defconfig. With it I am also able to reproduce the issue. I'll 
try to debug that and report back.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
