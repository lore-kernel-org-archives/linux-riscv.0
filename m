Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D7DECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKp1FAp9wT/8JPk24aK3+5jc4WD/iLoIb/302YKgWpw=; b=UX4WHWwXOwC8S8
	ka+pYmZKLAqHTPk26rzN9YNzr1BRoDJqsliVwGtxp0ryrqhi0BlDZeT1CjnBKYz1xKnhC+vfVSP28
	53kNHmPiJYQnQxaTrxoeG2uFwRuz9I4UTMZldkJMJ6WeC/h1KBod80Wen2TsM+naYRXiQEMFYq3vE
	LCrGEPqkY9nhoz8rJDM1bRttEEI7uq2oSe+narEe0j6Fet2QYMRW7zg2Vs4WvCr1EpSSD822jzyH4
	mvttKad1hmG/IcYKR/ML3famkg0/nAiJYwiQt8m9CJ9GL1Ob6Eku4yjdTaYtAy9/z/Hpe0L/FhMQe
	y0v6638SKy1GR/nluToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8Pz-0063cg-SJ; Fri, 02 Sep 2022 15:17:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8Pv-0063Xb-9L
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 15:17:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oU8Pm-0004oN-52; Fri, 02 Sep 2022 17:17:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: guoren@kernel.org, Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: check for kernel config option in t-head memory types errata
Date: Fri, 02 Sep 2022 17:17:01 +0200
Message-ID: <10808758.0AQdONaE2F@diego>
In-Reply-To: <6865a605-2428-e6c2-09dc-aa2a66e48c55@microchip.com>
References: <20220901222744.2210215-1-heiko@sntech.de> <CAJF2gTQsXMB+igwMiya-sqyku+3iQPop1JJuHwXtTToj163h-A@mail.gmail.com> <6865a605-2428-e6c2-09dc-aa2a66e48c55@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_081711_398257_37A128F2 
X-CRM114-Status: GOOD (  23.99  )
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

Am Freitag, 2. September 2022, 11:33:27 CEST schrieb Conor.Dooley@microchip.com:
> On 02/09/2022 02:06, Guo Ren wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Is it a Fixes?
> 
> Looks like one to me, seems a fixes tag would be good to
> have here... Either way:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

The alternative itself also is protected by the kconfig-option,
so even if probe says "yes", nothing will be patched when
CONFIG_ERRATA_THEAD_PBMT is not enabled.

So for the memory-types it's more a change to keep it consistent
with the other extensions. But I guess we can add the fixes-tag
anyway, as it makes sure that doesn't get copy-pasted somewhere
else :-)


Heiko



> > 
> > On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >>
> >> The t-head variant of page-based memory types should also check first
> >> for the enabled kernel config option.
> >>
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>   arch/riscv/errata/thead/errata.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> >> index a6f4bd8ccf3f..902e12452821 100644
> >> --- a/arch/riscv/errata/thead/errata.c
> >> +++ b/arch/riscv/errata/thead/errata.c
> >> @@ -17,6 +17,9 @@
> >>   static bool errata_probe_pbmt(unsigned int stage,
> >>                                unsigned long arch_id, unsigned long impid)
> >>   {
> >> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
> >> +               return false;
> >> +
> >>          if (arch_id != 0 || impid != 0)
> >>                  return false;
> >>
> >> --
> >> 2.35.1
> >>
> > 
> > 
> > --
> > Best Regards
> >   Guo Ren
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
