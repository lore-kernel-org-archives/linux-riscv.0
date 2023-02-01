Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268E1C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRwivXjDj0CVXgbhSHlNyg1Sz5Rxh9SIFZSNSBG72zY=; b=lIYQu74tZqtgeM
	NKL0mJc8jyXKvZQ2kRhrr4LTSAY42/hkszbp0gOnb4EXcjUuTa7SgN42y9lFheLjl7eaH+GMN9aA9
	M0Mf64+4Q9y9lukIH7VSPz6FjyjB1EDzq+iwzfKFzN3re4HMxEw5eHRuHj0EXOurAXDIVAxEBRN7x
	0Lbu7sld4JGRTPNS3TyXQ3IOfrKLA1v/RxNZLCkjX1ey4YWCt013FQLXBBMtAwQIZjRgIauzL1yv2
	9SEoFXEzoh+JT+UCdcPP1nR8c6Pa6Ka6nYyOzHXozTyrl7q+T5/tabZyRcoLSMG/Yots9UGlrLFNp
	C0+j9JQfDb3n4tMUScYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5zh-00AKNR-2s; Wed, 01 Feb 2023 05:49:17 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5zc-00AKDu-Nk
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 05:49:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 17DB324E203;
	Wed,  1 Feb 2023 13:48:05 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 13:48:04 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 13:48:04 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 1 Feb 2023 13:48:04 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Conor Dooley <conor@kernel.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v3 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Thread-Topic: [PATCH v3 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Thread-Index: AQHZMi9WxT1gIxNRXUer5+u3a86Dx663AUwAgACtmgCAAe0oYA==
Date: Wed, 1 Feb 2023 05:48:04 +0000
Message-ID: <27844cccf1894529a75106edeb7026bb@EXMBX066.cuchost.com>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-4-jeeheng.sia@starfivetech.com>
 <Y9g9XGzF/X3OwXdP@spud>
 <CAHVXubh2P5TxdMsbW2TY7NxemSFX81UuvgO9schnTEBvzuAn2Q@mail.gmail.com>
In-Reply-To: <CAHVXubh2P5TxdMsbW2TY7NxemSFX81UuvgO9schnTEBvzuAn2Q@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_214913_100589_DF229DCB 
X-CRM114-Status: GOOD (  25.19  )
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
> From: Alexandre Ghiti <alexghiti@rivosinc.com>
> Sent: Tuesday, 31 January, 2023 4:19 PM
> To: Conor Dooley <conor@kernel.org>
> Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo
> <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v3 3/4] RISC-V: mm: Enable huge page support to kernel_page_present() function
> 
> Hi,
> 
> On Mon, Jan 30, 2023 at 10:57 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > +CC Alex
> >
> > On Fri, Jan 27, 2023 at 05:10:50PM +0800, Sia Jee Heng wrote:
> > > Currently kernel_page_present() function doesn't support huge page
> > > detection causes the function to mistakenly return false to the
> > > hibernation core.
> >
> > This sounds like a bug & should have a fixes tag, no? I assume for
> > whatever commit enabled huge page support...
> > We don't support set_memory, which by the looks of things is the other
> > usecase for this function, so probably doesn't need backporting.
> 
> Maybe add this patch in the Fixes tag: commit 9e953cda5cdf ("riscv:
> Introduce huge page support for 32/64bit kernel").
Sure, will add the fixes tag.
> 
> >
> > Alex, does this change look good to you?
> 
> Yes, just one thing though: what about a pgd_leaf() test? Even if very
> unlikely (I see x86 does not even test it), the privileged spec states
> it is possible to have a 256TB page.
I can add it in. But as you are probably aware that x86 and ARM don't even tested it. Thanks.
> 
> Thanks,
> 
> Alex
> 
> >
> > > Add huge page detection to the function to solve the problem.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > > ---
> > >  arch/riscv/mm/pageattr.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > > index 86c56616e5de..792b8d10cdfc 100644
> > > --- a/arch/riscv/mm/pageattr.c
> > > +++ b/arch/riscv/mm/pageattr.c
> > > @@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
> > >       p4d = p4d_offset(pgd, addr);
> > >       if (!p4d_present(*p4d))
> > >               return false;
> > > +     if (p4d_leaf(*p4d))
> > > +             return true;
> > >
> > >       pud = pud_offset(p4d, addr);
> > >       if (!pud_present(*pud))
> > >               return false;
> > > +     if (pud_leaf(*pud))
> > > +             return true;
> > >
> > >       pmd = pmd_offset(pud, addr);
> > >       if (!pmd_present(*pmd))
> > >               return false;
> > > +     if (pmd_leaf(*pmd))
> > > +             return true;
> > >
> > >       pte = pte_offset_kernel(pmd, addr);
> > >       return pte_present(*pte);
> > > --
> > > 2.34.1
> > >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
