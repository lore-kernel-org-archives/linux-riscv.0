Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9267C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBvqKzJd1H8gIoNsxHqO1FboTo5lg+hBVcouL1sCWf0=; b=X6g9xr0IGqXMVQ
	ARLcvhadUUwUXXKjgYfh0VX6FcNgFk5NzRcfduePtytzxvpH9adApt6CJ/6bFLeZ2HB4Cor3xfd4d
	wFnsFOvULq0R3adwxHgT6PnQYRawjZw5kGGQkGiJOmPdkgZ5NtS7fQw7+lkJjumXDwZokr5sEhvNr
	qLmj4G/shiLv33jyNWYLbIA3POo8/hK9wQsuWE9UmOIaf7IpqgtinIKG9yCv4AQqkBuHVYShVZJ5P
	IOV5Sza983UqWFn6nalm9O3kXgt42MkcLlUyvsKO5Fj2rrYviZB95dE5Ynm0jVzGf7dSu5l2sG23l
	ztrPFuVQoEmW4ceMA/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogDTy-00GS12-GN; Wed, 05 Oct 2022 23:07:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogDTw-00GRyB-2K
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 23:07:17 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogDTh-0004KW-IX; Thu, 06 Oct 2022 01:07:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, cmuellner@linux.com, samuel@sholland.org
Subject: Re: [PATCH 1/2] RISC-V: Cache SBI vendor values
Date: Thu, 06 Oct 2022 01:07:00 +0200
Message-ID: <2071831.8hzESeGDPO@phil>
In-Reply-To: <20221005170702.bsvjssvau6yv47ku@kamzik>
References: <20221004203724.1459763-1-heiko@sntech.de> <20221004203724.1459763-2-heiko@sntech.de> <20221005170702.bsvjssvau6yv47ku@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_160716_134427_AE629924 
X-CRM114-Status: GOOD (  25.05  )
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

Hi Drew,

Am Mittwoch, 5. Oktober 2022, 19:07:02 CEST schrieb Andrew Jones:
> On Tue, Oct 04, 2022 at 10:37:23PM +0200, Heiko Stuebner wrote:
> > sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
> > called multiple times, though the values of these CSRs should not change
> > during the runtime of a specific machine.
> > 
> > So cache the values in the functions and prevent multiple ecalls
> > to read these values.
> > 
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/kernel/sbi.c | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 775d3322b422..5be8f90f325e 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -625,17 +625,32 @@ static inline long sbi_get_firmware_version(void)
> >  
> >  long sbi_get_mvendorid(void)
> >  {
> > -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > +	static long id = -1;
> > +
> > +	if (id < 0)
> > +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > +
> > +	return id;
> >  }
> >  
> >  long sbi_get_marchid(void)
> >  {
> > -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> > +	static long id = -1;
> > +
> > +	if (id < 0)
> > +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> 
> The marchid register will be negative for commercial architecture ids
> because the MSB must be set.
> 
> > +
> > +	return id;
> >  }
> >  
> >  long sbi_get_mimpid(void)
> >  {
> > -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> > +	static long id = -1;
> > +
> > +	if (id < 0)
> > +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> 
> The spec says this register is "left to the provider" and may be
> left-justified. I don't think we can be sure the MSB will not be set.
> 
> For both cases I guess we need an extra bit to determine if we've cached
> or not
> 
>   static bool cached;
>   static long id;
> 
>   if (!cached) {
>      id = ecall();
>      cached = true;
>   }
> 
>   return id;
> 

thanks for noticing this issue. I did look into the mvendor
csr definition, but then wrongly assumed the other 2 being
similar.

I think for consistency it makes sense to have that extra bit
in all 3 functions too.


Thanks
Heiko

> > +
> > +	return id;
> >  }
> >  
> >  static void sbi_send_cpumask_ipi(const struct cpumask *target)
> 
> Thanks,
> drew
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
