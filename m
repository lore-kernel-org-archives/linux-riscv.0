Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE44CC636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 04:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKxd5wtKVPsq9gmTWfjqHRVSBfV3ZzNTsjQCF+laHm0=; b=rrTzrdqB85H1Z+
	PuXD8FVGrDUvTd2bh3+XUxxZgLjRsu14ffGWj/9qMqQNmYlxMF7HeG8m3XsmVQ+Vn6tWre8DNhxBr
	YRW5OkULhLH+QcKxBucWx+Vl0JzlnVHa4twCcgg7PxEN5IzSsiqfeSBk3jBZ/UXyP5qY02PlRsqAQ
	S4AL4jNOHUxrTsiVCMnvZp0ys76MdhD5y37Hp41io47Zl9sw+qO25IOupoD5kzxRMGoIW58Ibd+cW
	a9Sl4QSpk9UuWIKYif+pMCjlBSi+g5wST8TOzL06B9jmaxKibwBldN14doze/Gjo7hzmKlpn6XUaQ
	bjqrB/PzRXelrQbATfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTxhI-002xiA-9t; Mon, 20 Feb 2023 04:22:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTxhD-002xg2-24
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 04:22:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E17AC24DBCE;
	Mon, 20 Feb 2023 12:21:35 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 12:21:35 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX063.cuchost.com
 (172.16.7.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 12:21:35 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 20 Feb 2023 12:21:35 +0800
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
Thread-Index: AQHZIZTz+V7+Gz83+Eel+CLGjWDN767UeZmAgAMGpQA=
Date: Mon, 20 Feb 2023 04:21:35 +0000
Message-ID: <be39247014cd4e12b871ef0e40f09f12@EXMBX066.cuchost.com>
References: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
 <20230106060535.104321-4-jeeheng.sia@starfivetech.com>
 <Y/DaH0vjMsln4Ghr@duo.ucw.cz>
In-Reply-To: <Y/DaH0vjMsln4Ghr@duo.ucw.cz>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_202235_410099_68661572 
X-CRM114-Status: GOOD (  21.56  )
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

This is the old series, could you review the latest series at: https://patchwork.kernel.org/project/linux-riscv/list/?series=716143 ?

> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Saturday, 18 February, 2023 10:01 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH 3/3] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> Hi!
> 
> > @@ -21,6 +21,11 @@ struct suspend_context {
> >  #endif
> >  };
> >
> > +/* This parameter will be assigned to 0 during resume and will be used by
> > + * hibernation core for the subsequent resume sequence
> > + */
> > +extern int in_suspend;
> 
> "/*" should be on separate line. (This occurs multiple times.)
already resolved in v3 series.
> 
> > +ENTRY(core_restore_code)
> > +	/* switch to temp page table */
> > +	csrw satp, s1
> > +	sfence.vma
> > +	beqz	s4, done
> > +loop:
> > +	/* The below code will restore the hibernated image. */
> > +	ld	a1, HIBERN_PBE_ADDR(s4)
> > +	ld	a0, HIBERN_PBE_ORIG(s4)
> > +
> > +	lui     a4, 0x1
> > +	add     a4, a4, a0
> 
> Do you have enough registers to move a4 = 0x1 assignment before the
> loop:?
I am sorry but I don't understand the question. Could you elaborate please?
> 
> > +static int __init riscv_hibernate__init(void)
> > +{
> > +	hibernate_cpu_context = kcalloc(1, sizeof(struct suspend_context), GFP_KERNEL);
> > +
> 
> kzalloc?
sure, will change it.
> 
> > +	if (WARN_ON(!hibernate_cpu_context))
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> > +early_initcall(riscv_hibernate__init);
> 
> Does this really need to be done early?
yes. To make sure it is initialized before next resume.
> 
> Best regards,
> 								Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
