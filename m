Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436DFC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6BWXD/a4pJOdcba3XD1JdLQPJxcHefKSmmqGcXCbg8=; b=RkrFzhEyvZv9yh
	KEMxqrQ4NnrDlc4W5SfaQ2RyFA9q3LTWi1KrhCGfpnr4IYcRkfM4E6LKQsdWd+iCxq6PDmTInGdrp
	aQkiPzTXfI8LDVmGhIAdAHu+sbqGkUgENko+Eu4jH55sy26XV86PaJMUygLv3GQXob+5B2ztQdtJe
	rmPbW0qPQ9Iu5NAYMd1dtVnRtr4j61NS3yaT1pWUPOlayrifI+aHINUR9MK+qVjVnmmvnjUcUv+tP
	/wM2CjFZWBDbYrtAx1EHlIpjKbbbJcvUVxD+SJNnkqoC6Xjyb1ifx137SJbz/2XpJCy1NUooouL63
	nO5HJAqPQuwhJYgNcUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEwI-000pJz-MH; Thu, 09 Jun 2022 09:58:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEwG-000pIg-5G
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 09:58:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nzEw8-0004ug-HR; Thu, 09 Jun 2022 11:58:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, Ron Economos <re@w6rz.net>
Subject: Re: [PATCH] riscv: don't warn for sifive erratas in modules
Date: Thu, 09 Jun 2022 11:58:40 +0200
Message-ID: <7523610.lvqk35OSZv@diego>
In-Reply-To: <CAJF2gTT_xihu58V43bQ0X-WS0STCT5RNjiEHdwPBaoXmrnX2OA@mail.gmail.com>
References: <20220608120849.1695191-1-heiko@sntech.de> <CAJF2gTT_xihu58V43bQ0X-WS0STCT5RNjiEHdwPBaoXmrnX2OA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_025852_267933_AD0B6F49 
X-CRM114-Status: GOOD (  31.07  )
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

Hi Guo,

Am Donnerstag, 9. Juni 2022, 03:39:24 CEST schrieb Guo Ren:
> On Wed, Jun 8, 2022 at 8:09 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > The SiFive errata code contains code checking applicable erratas
> > vs. actually applied erratas to suggest missing erratas to the
> > user when their Kconfig options are not enabled.
> >
> > In the main kernel image one can be quite sure that all available
> > erratas appear at least once, so that check will succeed.
> > On the other hand modules can very well not use any errata-relevant
> > code, so the newly added module-alternative support may also patch
> > the module code, but not touch SiFive-specific erratas at all.
> >
> > So to restore the original behaviour don't warn when patching
> > modules. This will keep the warning if necessary for the main kernel
> > image but prevent spurious warnings for modules.
> >
> > Of course having such a vendor-specific warning may not be needed at
> > all, as CONFIG_ERRATA_SIFIVE is selected by CONFIG_SOC_SIFIVE and the
> > individual erratas are default-y so disabling them requires
> > deliberate action anyway. But for now just restore the old behaviour.
> >
> > Fixes: a8e910168bba ("riscv: implement module alternatives")
> > Reported-by: Ron Economos <re@w6rz.net>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/errata/sifive/errata.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > index 672f02b21ce0..1031038423e7 100644
> > --- a/arch/riscv/errata/sifive/errata.c
> > +++ b/arch/riscv/errata/sifive/errata.c
> > @@ -111,6 +111,7 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
> >                         cpu_apply_errata |= tmp;
> >                 }
> >         }
> > -       if (cpu_apply_errata != cpu_req_errata)
> > +       if (stage != RISCV_ALTERNATIVES_MODULE &&
> > +           cpu_apply_errata != cpu_req_errata)
> if (cpu_apply_errata &= ~cpu_req_errata)

Hmm, I don't see what that changes?


> Shall we still guarantee the module's must be a subset of the main kernel.'s?

The warning generated there is mainly to warn about some Kconfig options
not being enabled and in individual modules even no errata usage may be
required.


The intent for the patch is to restore how things behaved before
module-alternatives were introduced, so I don't really want to
introduce functional changes ;-) .

But also in the future we could debate if that warning is helpful at all,
as the erratas are enabled automatically by CONFIG_SOC_SIFIVE and
thus disabling individual erratas requires someone to turn them off
manually in their .config .


Heiko

> >                 warn_miss_errata(cpu_req_errata - cpu_apply_errata);
> >  }
> > --
> > 2.35.1
> >
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
