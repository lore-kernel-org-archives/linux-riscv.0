Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71129C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 01:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33573217D8
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 01:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qu2Jv5aM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eCvmhP3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33573217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ER9O/WF8EUb3LKJq8N2eJmC38zwKTWeFo30/OGLUiSc=; b=qu2Jv5aMJnUHYe
	0ROgYihqm2VOqh6aKL+shjVe4aTcd2Thk3BsENupm2wPtmuP/e+EpKBE+xZJHamlbBdEPT6MW4n15
	wXTZlNr9R1vGopAn8V4pMVjBNyIqJvJPjfiPzwl/2IbBr1a9OrZ9ONct93BNxMAvBwvk8Ze/OXlCY
	pSkxrh6l2kKowyC3tKc4W4OwRtMP16BozawzhZdeKyhey8InntA4eZA1xOT+KFhNag6uas5FfMpEK
	P+VdFVkwlcDPccxQQCU41jTbgpeA3ZlQTyicEpolUm32D/wcRIAZ2RR4xfXcP0UMHpcbvTW8+M1En
	59K0CIifY3XJr3b17Jjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7sNF-0007WU-KG; Sun, 24 Mar 2019 01:56:33 +0000
Received: from mail-eopbgr110108.outbound.protection.outlook.com
 ([40.107.11.108] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7sNC-0007A0-3o
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 01:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnUlfd7WTnUwIb1maHoI9++svK+nnTQWl1tQkk6Pqpk=;
 b=eCvmhP3IZmXjKMkMEYAe77ictVdluEWpaAOoAFz8HV9p7ohTpTOMVUtvgMPvgWActFGoiS/IGkkjh4yCKVm7tQhNf6KWoE+rwFQ0LGmJQfY/SCcZ2ppTc/niEYgT0HJ3XDZgyPNsGocemQIo5mX+6WQF4ek/jJlN9OaLPcX2fyA=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1199.GBRP265.PROD.OUTLOOK.COM (20.176.143.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Sun, 24 Mar 2019 01:56:22 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.013; Sun, 24 Mar 2019
 01:56:22 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <anup@brainfault.org>
Subject: RE: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Thread-Topic: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Thread-Index: AQHU4HbU+74/6HQDM02nH2np32BRgKYXduAAgAAtwQCAAAM6gIAAAOiAgAABXoCAAc7CgIAAi8OAgAACYoA=
Date: Sun, 24 Mar 2019 01:56:22 +0000
Message-ID: <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
 <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
In-Reply-To: <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:907c:ecf2:1d98:a5d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de3ae7fc-2d00-4665-de24-08d6affbea93
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1199; 
x-ms-traffictypediagnostic: LO2P265MB1199:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <LO2P265MB1199039E10B805B42D5A97ACD65D0@LO2P265MB1199.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 09860C2161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39830400003)(376002)(136003)(366004)(189003)(199004)(13464003)(256004)(105586002)(54906003)(2906002)(93886005)(316002)(5660300002)(8936002)(11346002)(486006)(446003)(476003)(186003)(68736007)(8676002)(6916009)(81166006)(81156014)(46003)(71200400001)(71190400001)(7736002)(14444005)(97736004)(106356001)(4326008)(102836004)(33656002)(25786009)(53546011)(55016002)(9686003)(99286004)(6436002)(6246003)(6306002)(305945005)(53936002)(6506007)(76176011)(74316002)(229853002)(7696005)(508600001)(86362001)(966005)(14454004)(52536014)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1199;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nTiXMcdE7zLd8t0pcc5Dq8feFmTcoU42nnzFNo2AWzlje6C81htcFYL8O6tzDTj69dNZSeNDb7zg+1fOnSUN6buUmfLDQ8VDKVR3DePGaqkPaLm8WUcdHxjzJD12brLUzOMx1aro6nZ7SudpkEWoQcTo2T+aRD9UJI2PqJi2pM1zKIsmdHPSsHR2LQcVhq3JIQ3H0RBhuoVzoc4YzsePvRGqzVdSW7W12ZkHEv/spcrkVgQqWCQmnLXpfmfsB2+z/j9uwEINVeZ5OibCF+UKClDadJsTdA3e/e9TQPspQsaxE7Hb0yCBM3qSLHAWhW1fEvzzZ/shfG8EJOWLcWzRpSmANufJvoNbsgDrOUjHjl3C5+FhCon305qi8b1h5oHI1zWn3O6/Rle8VRqu0zmzjQWM0WiO81yARjBL1Y/MrQQ=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: de3ae7fc-2d00-4665-de24-08d6affbea93
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2019 01:56:22.5804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_185630_252562_64F6C1A1 
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I think what he means is to force the file containing setup_vm to be compiled using medany, even if cmodel is configured to be medlow.

Regards,
Gary

> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Anup
> Patel
> Sent: Sunday, March 24, 2019 01:42
> To: Christoph Hellwig <hch@infradead.org>
> Cc: Damien Le Moal <Damien.LeMoal@wdc.com>; Palmer Dabbelt
> <palmer@sifive.com>; Anup Patel <anup.patel@wdc.com>; Mike Rapoport
> <rppt@linux.ibm.com>; Atish Patra <atish.patra@wdc.com>; linux-
> riscv@lists.infradead.org
> Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
> 
> On Sat, Mar 23, 2019 at 10:51 PM Christoph Hellwig <hch@infradead.org>
> wrote:
> >
> > On Fri, Mar 22, 2019 at 07:15:37PM +0530, Anup Patel wrote:
> > > >
> > > > I am not saying the revert is the final solution.  I'm just saying
> > > > that 5.1-rc is not the place we should be doing the major surgery.
> > > > Revert fox 5.1, fix for real for 5.2+.
> > >
> > > If we revert for time being then even fixmap support has to be
> > > reverted.
> > >
> > > The patch only updates access to kernel symbols via __load_pa() and
> > > __load_va(). There is no functional change as such. The patch is
> > > tested on QEMU/virt 64bit, QEMU/virt 32bit, and SiFive Unleashed.
> >
> > Just curios - if you just move setup_vm and dependencies into a new
> > file that is compiled with -mcmodel=medany, just like setup.c, what
> > issues would we still have that require explicitly passing the load
> > address?
> 
> There are four cases here:
> 1. 64bit with cmodel=medany (default for 64bit system) 2. 64bit with
> cmodel=medlow 3. 32bit with cmodel=medany 4. 32bit with cmodel=medlow
> (default for 32bit system)
> 
> I had tried using cmodel=medany as default for both 64bit and 32bit system and
> it works fine because there is no issue with cmodel=medany but it is a very crude
> fix and things break again if someone explicitly selects cmodel=medlow using
> kconfig.
> 
> The patch for using __load_va()/__load_pa() accessor in setup_vm() solves the
> problem for all four cases above.
> 
> If you still think the patch is too big as rcX fix then alternate approach is:
> 1. For Linux-5.1-rcX, we use cmodel=medany by default for both 32bit and 64bit
> RISC-V (I can send a patch for this immediately) 2. Consider
> __load_va()/__load_pa() patch for Linux-5.2
> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
