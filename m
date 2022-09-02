Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66091ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApgJGyjbgqke9X2kfqCsS4dHdWSUMOtRzT7WiraB0p8=; b=lXjwjtHWGexhBD
	oPS81/Q75WXrMeT8otkcNYoxRO5Uz8ZREa8dsj2JLX+T6UfnAww+Q3POiaI4Efb+D9bf5ER+EVXGq
	j/aP4+2UTcusk3csGmd1RSXlJ7iJxuG9En4ynEPIJ27yhLx+QOS6CT4KcWpXhBEMUlVQg6nO93eIF
	du/2p00n30jwaPLZjlRQeri3js3QX54eEH3UtvZmIfhnyNEEVQEwZGFIDEWdFiCku/EvRKsOUcoLr
	rmUawxvwWw7d8Gc05EfKb7p17rXEmPyHohOAwbGMS68jzA6gGNqM1worUR+I+G7bo8b11YQ1mUiUx
	uiwPYJiH01uySCpBZi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8LF-0060Vk-5I; Fri, 02 Sep 2022 15:12:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8LC-0060TS-8X
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 15:12:19 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oU8L0-0004mX-U0; Fri, 02 Sep 2022 17:12:06 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, guoren@kernel.org, apatel@ventanamicro.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Date: Fri, 02 Sep 2022 17:12:06 +0200
Message-ID: <2910587.GUh0CODmnK@diego>
In-Reply-To: <20220902094939.wvzovl6ytujtjbtm@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de> <20220902094939.wvzovl6ytujtjbtm@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_081218_326981_4DFEA7CF 
X-CRM114-Status: GOOD (  27.57  )
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

Am Freitag, 2. September 2022, 11:49:39 CEST schrieb Andrew Jones:
> Hi Heiko,
> 
> Please use a cover-letter for a patch series. They allow the series to be
> threaded better and people can reply to the cover-letter with series-wide
> comments. For example, I'd like to reply to a cover-letter now with
> 
> For the series
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> but now it looks like I need to go back and reply to each patch
> separately.

I'm not sure if tooling like b4 can handle Reviewed-by's in cover-letters.
At least some time back it couldn't, so am not sure if that was added
meanwhile. So tags added to cover-letters might even get lost.

But I'll add a cover-letter nevertheless - need a place for the v2 changelog
anyway :-)

Heiko


> 
> Thanks,
> drew
> 
> On Fri, Sep 02, 2022 at 12:27:41AM +0200, Heiko Stuebner wrote:
> > This can also do without the ifdef and use IS_ENABLED instead and
> > for better readability, getting rid of that switch also seems
> > waranted.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 553d755483ed..764ea220161f 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -253,16 +253,13 @@ void __init riscv_fill_hwcap(void)
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> >  static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
> >  {
> > -#ifdef CONFIG_RISCV_ISA_SVPBMT
> > -	switch (stage) {
> > -	case RISCV_ALTERNATIVES_EARLY_BOOT:
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
> >  		return false;
> > -	default:
> > -		return riscv_isa_extension_available(NULL, SVPBMT);
> > -	}
> > -#endif
> >  
> > -	return false;
> > +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return false;
> > +
> > +	return riscv_isa_extension_available(NULL, SVPBMT);
> >  }
> >  
> >  static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
