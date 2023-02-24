Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B123C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 01:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38MhmsBJvOwdL7UX6fYP5Vna0HydjHVkgDwWP8mBTlk=; b=VVXSS+JdeKkP08
	Hce6MVTZDsEKdaOPN18+GKIF7y2HC8QklYiNZ6y48FQFn4n6sU16EGK6ENH/i82qQEaOjy6h+Vdcb
	3g4EUjzcwYuum8fP675QqC2NW9GnfVNTD5PUcrypfcAuEB0E9nwvR0fPPWnQS3MD4SWYHBKiwH/Km
	LiuCQSHwXakp1Kr4ES5yBbMI434RLoDJo7mXr1pHl97B7FzBvphoJib94dDfe4Jq3alY0kBifH1NZ
	5os6061z6kIjze2N4PMMFLt2tFJaEnZ0gInOBw6iNXhdXh/KqBXL6y1Giu2qjTkSnhC9eKGDIFIWZ
	Lb/8o2UByY5pMx061lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyb-000sn0-Lb; Fri, 24 Feb 2023 01:34:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyZ-000sln-4M
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 01:34:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2849624E240;
	Fri, 24 Feb 2023 09:33:59 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:59 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX063.cuchost.com
 (172.16.7.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:58 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 24 Feb 2023 09:33:58 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v4 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Thread-Topic: [PATCH v4 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Thread-Index: AQHZRZ0wRsS1rJlvBEisTE2RNJ10DK7blsuAgAG+CwA=
Date: Fri, 24 Feb 2023 01:33:58 +0000
Message-ID: <4c2190ee0e1f4995b1c2cfa87f67661a@EXMBX066.cuchost.com>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-4-jeeheng.sia@starfivetech.com>
 <20230223065717.zmlf2gxmtsgqperw@orel>
In-Reply-To: <20230223065717.zmlf2gxmtsgqperw@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.50.196.81]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_173419_456698_B33384AF 
X-CRM114-Status: GOOD (  18.21  )
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
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Thursday, 23 February, 2023 2:57 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v4 3/4] RISC-V: mm: Enable huge page support to kernel_page_present() function
> 
> On Tue, Feb 21, 2023 at 10:35:22AM +0800, Sia Jee Heng wrote:
> > Currently kernel_page_present() function doesn't support huge page
> > detection causes the function to mistakenly return false to the
> > hibernation core.
> >
> > Add huge page detection to the function to solve the problem.
> >
> > Fixes tag: commit 9e953cda5cdf ("riscv:
> > Introduce huge page support for 32/64bit kernel")
> 
> This should be formatted as below (no line wrap and no 'tag' in the tag)
> 
> Fixes: 9e953cda5cdf ("riscv: Introduce huge page support for 32/64bit kernel")
> 
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > ---
> >  arch/riscv/mm/pageattr.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > index 86c56616e5de..ea3d61de065b 100644
> > --- a/arch/riscv/mm/pageattr.c
> > +++ b/arch/riscv/mm/pageattr.c
> > @@ -217,18 +217,26 @@ bool kernel_page_present(struct page *page)
> >  	pgd = pgd_offset_k(addr);
> >  	if (!pgd_present(*pgd))
> >  		return false;
> > +	if (pgd_leaf(*pgd))
> > +		return true;
> >
> >  	p4d = p4d_offset(pgd, addr);
> >  	if (!p4d_present(*p4d))
> >  		return false;
> > +	if (p4d_leaf(*p4d))
> > +		return true;
> >
> >  	pud = pud_offset(p4d, addr);
> >  	if (!pud_present(*pud))
> >  		return false;
> > +	if (pud_leaf(*pud))
> > +		return true;
> >
> >  	pmd = pmd_offset(pud, addr);
> >  	if (!pmd_present(*pmd))
> >  		return false;
> > +	if (pmd_leaf(*pmd))
> > +		return true;
> >
> >  	pte = pte_offset_kernel(pmd, addr);
> >  	return pte_present(*pte);
> > --
> > 2.34.1
> >
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
noted with thanks
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
