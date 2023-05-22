Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6C4C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 01:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjLqMxP4JA+MZDxlBryoqvTHE5J4KozL0zDZdXERxAI=; b=HUvn1V0u64lX98
	T3Fmuc074R8hShv6tdNuzm8D4V38dwjTx429oqEwdhdB+y1WEqiQy3H6DwKJnNmq4k9as1iUXKTUx
	axFgrhaojYghsHrmkyDkMv8hBHDI8XjmN24NWV63ZrMJTOtD4i/UbkVgajXxnEzVmPgeFENDOyPtX
	wQ3gYDDPkIrW5PFtAbEHvYxvt/LotSRS0LgeV3C61MBhQB9GzRiXmK573/T6i1RjwuHXAqrsnB4pc
	JWv0NZ5W7laTmvVi1d5sSFT2U9vlHZm7D5J44BytuSU74ssbSKZIFUrizxymlG+7ZLXhgKU1CRtYf
	s4argVatZIYrDYFhTsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0u5n-004zDp-2Y;
	Mon, 22 May 2023 01:12:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0u5j-004zA9-0z
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 01:12:05 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 163AF24DDB2;
	Mon, 22 May 2023 09:11:10 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 22 May
 2023 09:11:10 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 22 May
 2023 09:11:09 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 22 May 2023 09:11:09 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
CC: Song Shuai <suagrfillet@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Song Shuai
	<songshuaishuai@tinylab.org>
Subject: RE: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Thread-Topic: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Thread-Index: AQHZij0JnSRR82RN7UivChxgOm4HvK9hcVtQ//9+BoCAAJELgIAD/mKg
Date: Mon, 22 May 2023 01:11:09 +0000
Message-ID: <dc21929555a3422d883047a3e652b15d@EXMBX066.cuchost.com>
References: <20230519102908.253458-1-suagrfillet@gmail.com>
 <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com>
 <20230519-clarinet-collar-ba2c0fa37e11@wendy>
 <20230519-roundup-legwarmer-e26b31db3123@spud>
In-Reply-To: <20230519-roundup-legwarmer-e26b31db3123@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_181203_663525_C8248A14 
X-CRM114-Status: GOOD (  26.27  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, May 20, 2023 4:07 AM
> To: Conor Dooley <conor.dooley@microchip.com>
> Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Song Shuai <suagrfillet@gmail.com>; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu; Mason Huo <mason.huo@starfivetech.com>; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; ajones@ventanamicro.com; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Song
> Shuai <songshuaishuai@tinylab.org>
> Subject: Re: [PATCH] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
> 
> On Fri, May 19, 2023 at 12:28:07PM +0100, Conor Dooley wrote:
> > Hey,
> >
> > On Fri, May 19, 2023 at 11:14:27AM +0000, JeeHeng Sia wrote:
> >
> > > > The suspend_restore_csrs is called in both __hibernate_cpu_resume
> > > > and the `else` of subsequent swsusp_arch_suspend.
> > > >
> > > > Removing the first call makes both suspend_{save,restore}_csrs
> > > > left in swsusp_arch_suspend for clean code.
> 
> It took me embarrassingly long to wrap my head around the control flow
> here again. I'm not sure that I agree with you that splitting the calls
> between asm & c is cleaner, but whatever:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > > >
> > > > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > > > Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> >
> > BTW, why the two email addresses? The tinylab one here seems entirely
> > redundant - unless it is your employer, in which case should it be the
> > only SoB address & also in the author field?
> 
> Deja vu with my questioning your email address, but does your
> tinylab address actually repeat "shuai"?
> 
> > Also, Fixes tag?
> >
> > > > ---
> > > >  arch/riscv/kernel/hibernate-asm.S | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
> > > > index 5c76671c7e15..d698dd7df637 100644
> > > > --- a/arch/riscv/kernel/hibernate-asm.S
> > > > +++ b/arch/riscv/kernel/hibernate-asm.S
> > > > @@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
> > > >
> > > >  	REG_L	a0, hibernate_cpu_context
> > > >
> > > > -	suspend_restore_csrs
> > > >  	suspend_restore_regs
> >
> > > Good catch. This function is invoked twice to restore the CSRs.
> > > I am good with removing this function from here.
> >
> > If that's a review, then please either give an R-b or A-b tag :)
Reviewed-by: JeeHeng Sia <jeeheng.sia@starfivetech.com >
> >
> > Thanks,
> > Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
