Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C4AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIOK0GGUGwZ/lAnbgeknAyPrVAr/8jS0EcII0BjuqP4=; b=L6QybkqaHqmmAe
	Jc/UvYNlPTWNrCUMFwH8oQrY0IfqZ2W2FlzEwrOFYp/0tG0oX/f+tkTUq8Rb+bPhEcevF0GThSqV0
	lnMaMQqJ65Vd95aY76cNki2E9+P42qq67eBciAqPXQ24XWuGaPDYLlkD7mG/aZMee2Ic7+1hC7Y+c
	p0C3cN67NsgbpWTjWOSXP4hNfHRqUznHsfSn22XJ1Bw+WYINeta8OXpeRWcjVCeiF5joFC0xqaA2t
	wDfDuv9y1VfFOxLcSWMHNkWekQeqMIZK4iAhs0tCcWBoq1db+da1i1RKC1XGRpFHwXmGx09RqY7/q
	hsR7qT5v8MvJHNbMn4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXna-000Rk0-Jm; Mon, 14 Nov 2022 11:38:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXnY-000Rhq-2Y
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 11:38:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ouXnU-0007xt-AD; Mon, 14 Nov 2022 12:38:40 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Mon, 14 Nov 2022 12:38:39 +0100
Message-ID: <2234530.yKVeVyVuyW@diego>
In-Reply-To: <20221114113553.3dxrumhk72jouzek@kamzik>
References: <20221110164924.529386-1-heiko@sntech.de> <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com> <20221114113553.3dxrumhk72jouzek@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_033844_145424_CECB144C 
X-CRM114-Status: GOOD (  20.18  )
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

Am Montag, 14. November 2022, 12:35:53 CET schrieb Andrew Jones:
> On Mon, Nov 14, 2022 at 11:57:29AM +0100, Emil Renner Berthing wrote:
> > On Thu, 10 Nov 2022 at 17:50, Heiko Stuebner <heiko@sntech.de> wrote:
> ...
> > > @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > >                 }
> > >
> > >                 tmp = (1U << alt->errata_id);
> > > -               if (cpu_req_feature & tmp)
> > > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > +               if (cpu_req_feature & tmp) {
> > > +                       /* do the basic patching */
> > > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> > > +                                         alt->alt_len);
> > > +
> > > +                       riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > > +                                                        alt->alt_len,
> > > +                                                        alt->old_ptr - alt->alt_ptr);
> > 
> > Here you're casting a void pointer to an instruction to an unsigned
> > int pointer, but since we enable compressed instructions this may
> > result in an unaligned pointer. Using this pointer will work, but may
> > be slow. Eg. fault to m-mode to be patched up. We already do that in
> > other places in the arch/riscv, but I'd prefer not to add new
> > instances of this.
> 
> Alternative instruction sequences (old and new) have compression disabled.

That was my first thought as well, but I think Emil was talking more about the
placement of the alternative block inside the running kernel.

i.e. I guess the starting point of an alternative sequence could also be unaligned.

Though I don't _yet_ see how an improvement could look like.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
