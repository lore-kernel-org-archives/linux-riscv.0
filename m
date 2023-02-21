Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE9FC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8D+dnO8SQ18apa60zA18TQjbp2Op4ghpaFga2H6Tz8=; b=SOJZdy19iEbGcO
	LqDBHfjg6AwfKa40TmII+lYN/aHxVFEiOSCkVGNnmj2r04HaIDq0rrn6aO3xhHSIhbDivVM5VMdcR
	N6q4USDtoQMLO9vFAWSu0ijbn5amoPRldvJ/VQxjmW+eGHaYLgs2cHxxhgqo6jwJBDnCAm3NT96Od
	6TTbzIBeBsO/NA40EO1L7mJNHsrF4awcMUnQyuJBKegCf40t2uc9WhH61Io6x0TSqhPByn0GkVnH2
	ah7clNjWWWwPpryFonZq74wSTt5evBZ+B5MnE8B/3kCR7v5t8JZ309Of3kql90AcebxvVCyAqGe72
	boPvi8BSIKEd/G0SKaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJ9Y-006Py2-HF; Tue, 21 Feb 2023 03:17:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJ9U-006Pwp-WA
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 03:17:15 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6CF6924DC13;
	Tue, 21 Feb 2023 11:16:49 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 11:16:49 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX163.cuchost.com
 (172.16.7.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 11:16:49 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 21 Feb 2023 11:16:49 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Pavel Machek <pavel@ucw.cz>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZIZTz+V7+Gz83+Eel+CLGjWDN767UeZmAgAMGpQCAAYIHUA==
Date: Tue, 21 Feb 2023 03:16:48 +0000
Message-ID: <ed6ebf0e6cc146e8b01c543a2fbc6e76@EXMBX066.cuchost.com>
References: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
 <20230106060535.104321-4-jeeheng.sia@starfivetech.com>
 <Y/DaH0vjMsln4Ghr@duo.ucw.cz>
 <be39247014cd4e12b871ef0e40f09f12@EXMBX066.cuchost.com>
In-Reply-To: <be39247014cd4e12b871ef0e40f09f12@EXMBX066.cuchost.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_191713_340402_BA5FBF76 
X-CRM114-Status: GOOD (  27.43  )
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

In case if you are not aware, the latest series (v4) can be found at: https://patchwork.kernel.org/project/linux-riscv/list/?series=723586

Thanks
Regards
Jee Heng

> -----Original Message-----
> From: JeeHeng Sia
> Sent: Monday, 20 February, 2023 12:22 PM
> To: 'Pavel Machek' <pavel@ucw.cz>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: RE: [PATCH 3/3] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> Hi,
> 
> This is the old series, could you review the latest series at: https://patchwork.kernel.org/project/linux-riscv/list/?series=716143 ?
> 
> > -----Original Message-----
> > From: Pavel Machek <pavel@ucw.cz>
> > Sent: Saturday, 18 February, 2023 10:01 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH 3/3] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> >
> > Hi!
> >
> > > @@ -21,6 +21,11 @@ struct suspend_context {
> > >  #endif
> > >  };
> > >
> > > +/* This parameter will be assigned to 0 during resume and will be used by
> > > + * hibernation core for the subsequent resume sequence
> > > + */
> > > +extern int in_suspend;
> >
> > "/*" should be on separate line. (This occurs multiple times.)
> already resolved in v3 series.
> >
> > > +ENTRY(core_restore_code)
> > > +	/* switch to temp page table */
> > > +	csrw satp, s1
> > > +	sfence.vma
> > > +	beqz	s4, done
> > > +loop:
> > > +	/* The below code will restore the hibernated image. */
> > > +	ld	a1, HIBERN_PBE_ADDR(s4)
> > > +	ld	a0, HIBERN_PBE_ORIG(s4)
> > > +
> > > +	lui     a4, 0x1
> > > +	add     a4, a4, a0
> >
> > Do you have enough registers to move a4 = 0x1 assignment before the
> > loop:?
> I am sorry but I don't understand the question. Could you elaborate please?
> >
> > > +static int __init riscv_hibernate__init(void)
> > > +{
> > > +	hibernate_cpu_context = kcalloc(1, sizeof(struct suspend_context), GFP_KERNEL);
> > > +
> >
> > kzalloc?
> sure, will change it.
> >
> > > +	if (WARN_ON(!hibernate_cpu_context))
> > > +		return -ENOMEM;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +early_initcall(riscv_hibernate__init);
> >
> > Does this really need to be done early?
> yes. To make sure it is initialized before next resume.
> >
> > Best regards,
> > 								Pavel
> > --
> > People of Russia, stop Putin before his war on Ukraine escalates.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
