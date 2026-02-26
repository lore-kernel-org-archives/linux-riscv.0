Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BF1FD9E0A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3RUiRY17pLQtijyzBnBPtUxEqHCV1JblU0PIbGQeZI=; b=TZkcjjboJshDg6
	vHzQc/OAE0/LPBZY+34Dw4Ut0E6llpmC2L7UpPeTZzeBQGWbn3087t5CfIgbfta5hGuqmdP1RES/i
	k15n94l/k0gLIDz9yMR19dyBX9hMsLEz8s2XHcj94ElDD9vpW12yKE4nvCejtTiDVr9vSPnNKmkrH
	EZX4XvyN7soX+dOn811WRwYs+Cc0YCLYINvOMTBHocKgoicQXhw/5g4QyMPBjschCRYU/rqloiRQ8
	EkAAyEfoUJi1DnEWYBQoDJuDRrvnOyo87mOgFWAM+A9Viymd+HKGVq+gW1aER/IubSt2XGq7iq1xX
	JFpBQ2iYFyU9B4FBj4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviya-00000007Fok-2QYk;
	Thu, 26 Feb 2026 21:32:52 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviyY-00000007Fns-1xv0
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 21:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=pEo3m7B3INBJlM8bhz6ltlUxFqOUPxhSBYLsN/1EwlM=; b=lSamVMAuYYH3idjj5lTpd2a7jX
	+wBZ66r2CZ9iHUnEdPN7RXBNxrJKEGQt8LWSMdOP+iI8sPGErj6lmKfM31meZM3huWa7C1v5XYoi1
	F3shYzQAMI2d8mwwG3L3ZqTCrxskky9Bq+fQo+Aq/zhWKX/w0ozGPN3j4cvXOXTa/SC2FCsaAV1jt
	Q2300RVGUdE+ZOL8w6p68qJrWK9aJkRxM1cOtyWtxitFiZBmLFrkPtKFp4UsyFYh3pT2rIWo4mJo9
	9q78BhF0wp/swRuh2ewaZj8wOtuge85Ezj3t/vgsWTbg4XL14G60eqB5WLQ2C/RFd6e8ssd6eaC2R
	KqeF+Tlg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vviyH-00000008Bi9-1YrI;
	Thu, 26 Feb 2026 22:32:33 +0100
Date: Thu, 26 Feb 2026 22:32:32 +0100
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
Message-ID: <aaC78FTN31QYaVg0@aurel32.net>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_133250_513315_98C53920 
X-CRM114-Status: GOOD (  17.00  )
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

On 2026-02-26 16:32, Yanko Kaneti wrote:
> Hello,
> 
> On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> > v5: no changes
> > 
> >  drivers/mfd/simple-mfd-i2c.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> > index 0a607a1e3ca1d..542d378cdcd1f 100644
> > --- a/drivers/mfd/simple-mfd-i2c.c
> > +++ b/drivers/mfd/simple-mfd-i2c.c
> > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
> >  };
> >  
> >  static const struct mfd_cell spacemit_p1_cells[] = {
> > +	{ .name = "spacemit-p1-reboot", },
> >  	{ .name = "spacemit-p1-regulator", },
> >  	{ .name = "spacemit-p1-rtc", },
> >  };
> 
> Perhaps its safe to merge this one now that everything P1 and I2C is
> already in linus tip ?

Unfortunately, this patchset is still missing:
https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/

This means the reboots work most of the time, but are not 100% reliable, 
and that's the reason why this patch got blocked from merging.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
