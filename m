Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EFAC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0xoU0hWk7XRaFBAjbnydF5a08xWkmunW1sboAA7uT4=; b=joWPAODfcjQrQX
	wNja8OFNeHiyWwhaT91TlrL7MTlFOghPu77OkFUZT/l/al6UDdaEY9CG7QaScBxHD3aHwimFGlq2x
	64MTeGqjKyrFvN0Pt5JpLgmW60HPRKPkI6KuZMwY+PnX5TAvzdmNXQkexd9rzstZ2nVRymfAI3nv8
	DNfGqw9C9RZ6Brxs3RpaaPYePLo60a24HOp36sGkr+SMtTTQLEH0V/M4bKRChGiu133CiM4GwmGff
	1IAhczIzEHMjIUGp65PgE59Dl0o2XCHmusximgxrbhghTsBTaDl+uxUTzx1J2Gk3joGh0MRg0wjPe
	FOWCKnaTEPJ8FNXe+3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwo0-000Ocx-1V; Thu, 29 Dec 2022 17:35:00 +0000
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3] helo=hetzy.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwnw-000OW9-VE
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 17:34:59 +0000
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
	(envelope-from <ben@fluff.org>)
	id 1pAwnn-0008Me-Uh; Thu, 29 Dec 2022 17:34:48 +0000
Date: Thu, 29 Dec 2022 17:34:47 +0000
From: Ben Dooks <ben@fluff.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ben-linux@fluff.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: uaccess: fix type of 0 variable on error in
 get_user()
Message-ID: <20221229173447.qhcaamchxv5jkbpo@hetzy.fluff.org>
References: <20221229170545.718264-1-ben-linux@fluff.org>
 <mhng-33b9aafc-448a-4400-9a06-cb222724363a@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-33b9aafc-448a-4400-9a06-cb222724363a@palmer-ri-x1c9>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_093457_201986_BCBFC76E 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, Dec 29, 2022 at 09:31:27AM -0800, Palmer Dabbelt wrote:
> On Thu, 29 Dec 2022 09:05:45 PST (-0800), ben-linux@fluff.org wrote:
> > If the get_user(x, ptr) has x as a pointer, then the setting
> > of (x) = 0 is going to produce the following sparse warning,
> > so fix this by forcing the type of 'x' when access_ok() fails.
> > 
> > fs/aio.c:2073:21: warning: Using plain integer as NULL pointer
> > 
> > Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> > ---
> >  arch/riscv/include/asm/uaccess.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> > index 855450bed9f5..ec0cab9fbddd 100644
> > --- a/arch/riscv/include/asm/uaccess.h
> > +++ b/arch/riscv/include/asm/uaccess.h
> > @@ -165,7 +165,7 @@ do {								\
> >  	might_fault();						\
> >  	access_ok(__p, sizeof(*__p)) ?		\
> >  		__get_user((x), __p) :				\
> > -		((x) = 0, -EFAULT);				\
> > +		((x) = (__force __typeof__(x))0, -EFAULT);	\
> >  })
> > 
> >  #define __put_user_asm(insn, x, ptr, err)			\
> 
> Looks like arm64 has a pretty similar pattern.  They've got the __force
> __typeof__ already, but given the similarity it might be worth refactoring
> these to share the error checking code.

I looked there for an idea on how to fix.

> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I'll give this a bit of time like usual, unless anyone's opposed I'll put it
> on fixes.  I wasn't planning on sending a PR this week anyway due to the
> holidays.

Ok, it's a warning which would be nice to be fixed.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
