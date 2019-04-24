Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE8C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 03:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02112218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 03:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b453+RCe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RCaRR8Fo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02112218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMfUtPz4Xnnc1Ecln+KwEfSVBl67tPuhwPb5+iIm6qY=; b=b453+RCexv3kuP
	/+Ws8LdWlmNsDvCyYCziRU9PWfHL2u4GM2Mv4eF3qC60273GiXJ8AygPMqz+MLMVH8SwGCaBvsOzo
	6XDncc5+ZReCpYOfKclPtHDfe3s01yIVRw4FY3rCW8R5Bs5VDtAfCfzM/CVLODwz0S6wdaYPWixhn
	87RB00DVgKiOQBKV88aFDt8F0paH6p4gl4JqQGPv4AO8Dx1fhIPzOnSIpiLLBv80qCUP08ynImBkd
	fx8F+m8GYvHaHADYGeH1W20O3/M/BtIDRqF1RJesjKmYaTUS2olOOpa6/6ADwnC9ddXjS+NAWyZZa
	FnN9PKjEOMQgjPPP7VWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ8TL-0006wB-S4; Wed, 24 Apr 2019 03:21:23 +0000
Received: from mail-eopbgr100109.outbound.protection.outlook.com
 ([40.107.10.109] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ8TI-0006vJ-ES
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 03:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pw1kLDKjRuzETwyY1smN/1eMiKoBiv61VQQKls+hmiU=;
 b=RCaRR8FoVgGKyEDOrMRODpTyf7Z8B7zF8dZkMLlkYczCbXMAwm1o2wpmdBlnHcXLs9X9P5yPZPgxCZ7+DfqiCwDZrQphlJS6CqxjyV1Szns4QLmDaVy2oNnGYESUN+EBAb/QK03KcwS2Y8IWJRukaDCj5hFy/RcniMv9rBx9Afs=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0157.GBRP265.PROD.OUTLOOK.COM (10.166.105.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 24 Apr 2019 03:21:15 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19%4]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 03:21:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Guo Ren <guoren@kernel.org>
Subject: RE: [PATCH] riscv: Support non-coherency memory model
Thread-Topic: [PATCH] riscv: Support non-coherency memory model
Thread-Index: AQHU+SJqOw/bzOFv7E6YG/Ezkj/376ZIW7QAgACE3wCAAF+NAIAApRkAgAATvgCAAJneAIAAEuQg
Date: Wed, 24 Apr 2019 03:21:14 +0000
Message-ID: <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de> <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de> <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
In-Reply-To: <20190424020803.GA27332@guoren-Inspiron-7460>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:c85b:986:e8f6:9b53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4255b0f9-9f1e-4b17-0f35-08d6c863e8b8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:LO2P265MB0157; 
x-ms-traffictypediagnostic: LO2P265MB0157:
x-microsoft-antispam-prvs: <LO2P265MB0157BBAC5AAB65D54216C080D63C0@LO2P265MB0157.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39830400003)(366004)(376002)(346002)(199004)(189003)(13464003)(6436002)(508600001)(33656002)(305945005)(74316002)(14454004)(86362001)(71190400001)(71200400001)(5660300002)(99286004)(52536014)(7416002)(7736002)(25786009)(6916009)(54906003)(229853002)(316002)(6116002)(93886005)(66446008)(446003)(64756008)(46003)(68736007)(11346002)(73956011)(76116006)(81166006)(66946007)(66476007)(476003)(2906002)(66556008)(6246003)(97736004)(256004)(8676002)(4326008)(7696005)(55016002)(53936002)(102836004)(6506007)(53546011)(8936002)(186003)(76176011)(81156014)(486006)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0157;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: puKGsbHkRRB6oGuSPbECyRT356zY3Uht2uhASlVpRvR6hazKUBHKShshuQkNr0VfUwY68yWOQJnOP31AjpjIS3T/RELnuVfrqII4XX78DE6mkYYjp2Bl9m0fMhDZLd0fBWr91bR4720jsYK2VubvWoUioZn5wyGVEBCf3uie9D3ItMR9rYDhXZCZsmOoY9sSXVWTKormCttXuHSR+dwGYCs45gVlpHaOZ4E4AJ/mezjG8JIZYwOd5PpmfDmnTmLZ+WaS4ZvDdxUXxa8aa2YTu6lNpIjjvtVRE1HgYDxFcMSyLGbcWn0y3ed5Ont899Q4/MPNNBVrkaTIZY/xZzkKU+YVPPY2SHbKvF51VnuJMGd5szWm6K2RrRpIGpQup/fycz2B1Q9vjPOhHaq3qdFEysuBpRdAjBFz82jrH9VbAyQ=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4255b0f9-9f1e-4b17-0f35-08d6c863e8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 03:21:15.0187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_202120_564509_033AA016 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup.patel@wdc.com>,
 Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, "ren_guo@c-sky.com" <ren_guo@c-sky.com>,
 Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Guo Ren <guoren@kernel.org>
> Sent: Wednesday, April 24, 2019 03:08
> To: Gary Guo <gary@garyguo.net>
> Cc: Christoph Hellwig <hch@lst.de>; linux-arch@vger.kernel.org; Palmer
> Dabbelt <palmer@sifive.com>; Andrew Waterman <andrew@sifive.com>; Arnd
> Bergmann <arnd@arndb.de>; Anup Patel <anup.patel@wdc.com>; Xiang
> Xiaoyan <xiaoyan_xiang@c-sky.com>; linux-kernel@vger.kernel.org; Mike
> Rapoport <rppt@linux.ibm.com>; Vincent Chen <vincentc@andestech.com>;
> Greentime Hu <green.hu@gmail.com>; ren_guo@c-sky.com; linux-
> riscv@lists.infradead.org; Marek Szyprowski <m.szyprowski@samsung.com>;
> Robin Murphy <robin.murphy@arm.com>; Scott Wood <swood@redhat.com>;
> tech-privileged@lists.riscv.org
> Subject: Re: [PATCH] riscv: Support non-coherency memory model
> 
> Hi Gary,
> 
> On Tue, Apr 23, 2019 at 03:57:30PM +0000, Gary Guo wrote:
> > >>> Another point is we could get more attribute bits by modify the riscv
> > >>> spec:
> > >>>   - Remove Global bit, I think it's duplicate with the User bit in linux.
> > >>
> > >> It is in Linux, but it is conceptually very different.
> > > Yes, but hardware could ignore one of them and in riscv linux
> > > _PAGE_GLOBAL is no use at all, see:
> > > grep _PAGE_GLOBAL arch/riscv -r
> > >
> > > In fact, the _PAGE_KERNEL for pte doesn't contain _PAGE_GLOBAL and it
> > > works on FU540 and qemu. As I've mentioned page attribute bits is very
> > > precious, define a useless bit make people confused.
> >  >
> >
> > The fact that it isn't used yet doesn't imply it is not useful. We don't
> > use ASIDs at the moment, and without using ASIDs the "global" bit is
> > indeed not useful. However with ASIDs the bit will be vital for saving
> > TLB spaces. Without the global bit, the kernel pages become synonyms to
> > themselves (i.e. they have different tags in TLB but refer to the same
> > physical page).
> >
> > The global bit also exists in many other ISAs as well. It's definitely
> > not a "useless" bits.
> >
> > Moreover, this bit is already implemented in both Rocket and Ariane. It
> > is also in the spec for quite a while. The fact that Linux doesn't use
> > it at the moment is not a reason for removing it.
> >
> 
> Look:
> linux-next git:(riscv_asid_allocator_v2)$ grep GLOBAL arch/riscv -r
> arch/riscv/include/asm/pgtable-bits.h:#define _PAGE_GLOBAL    (1 << 5)    /*
> Global */
> arch/riscv/include/asm/pgtable-bits.h:                                    _PAGE_USER |
> _PAGE_GLOBAL))
> 
> Your patch tell us _PAGE_USER and _PAGE_GLOBAL are duplicate and why we
> couldn't make _PAGE_USER implies _PAGE_GLOBAL? Can you give an example
> of a real scene in PTE about:
>   _PAGE_USER:0 + _PAGE_GLOBAL:1
> or
>   _PAGE_USER:1 + _PAGE_GLOBAL:0
> 
> Of cause I know USER & GLOBAL are conceptually very different, but
> there are only 10 attribute-bits for riscv (In fact we've wasted two bits
> to support huge RV32-pfn :P). So I think it is time to merge these two bits
> before hardware supports GLOBAL. Reserve them for future!

Two cases I can think of:
* vdso like things. They're user pages that can really be shared across address spaces (i.e. global). Kernels like L4 implement most systems calls similar to VDSO, so USER + GLOBAL is useful.
* hypervisor without H-extension: This requires shadow page tables. Supervisor pages are mapped to supervisor shadow pages. However these shadow pages cannot be GLOBAL because they can't be shared between VMs. So  !USER + !GLOBAL is useful.

Remember Linux isn't the only supervisor software that RISC-V cares! 

> 
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
