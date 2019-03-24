Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1D6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 19:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD5820823
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 19:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mORTjhNS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HZ/jpryK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD5820823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQ60fSWKLUuZ2O9H4MxOrJMTWcEm9QCZC1xFmRuzAi8=; b=mORTjhNSa0Yabp
	zHVlik9iA77v/f2j9QHjdHnsU+6FyWcrZHzEd5yIYdjfiwLvdWONcn3I279BD/0w0cQcF7KFsOOLs
	fMSH5SnGxUuHymqvZDsCbE0W9lTYO6fIhvYBxCK2gPECQNP3XHcPFdKnHHR6SxMqpbYK6PiF0XJ9I
	RsXqVfBdiMAPajxc2xpU+DLs49dkTOY1N96JuuBRnjEvYud8dZcNHahFhI2RJvHCTQwFXx+0KrkEO
	Y+u4n1HJap913Uh2d6J3SUzUFA/bNECWqMnd8KjjHlPMXN/ZF8M6fJeiUeTBISRPMbJPGd6UbMxt9
	n0Q6a9WGSjR2ICGxcU9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h88a4-0005IY-MI; Sun, 24 Mar 2019 19:14:52 +0000
Received: from mail-eopbgr100136.outbound.protection.outlook.com
 ([40.107.10.136] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h88a1-0005HL-5X
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 19:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixctylaAjKIf8DjKb9Dh0bD+cKnaYTSosDf/QunznZE=;
 b=HZ/jpryK0HcDomT0jJtTMnSWOjpTXfoEOXDgBgXH4Sh4GTBBkGFMv09LVSmEXbF1rref8ltx4EKWVz1heeB57A513D0fTmll30WJO5mQNjWrrAWfyJGx2XGXgMNiRiOcRIMv7RZ0+G4k+li2T/YmTnYxgDBo3Jf9a30LJqu/AeM=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0207.GBRP265.PROD.OUTLOOK.COM (10.166.98.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Sun, 24 Mar 2019 19:14:43 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Sun, 24 Mar 2019
 19:14:42 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: RE: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Topic: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Index: AQHU4jHpL1gWnGWPrEKT6h8SWH7WMKYbJa+A
Date: Sun, 24 Mar 2019 19:14:42 +0000
Message-ID: <LO2P265MB08478847A45E7617FD906F8CD65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
References: <20190324110804.68555-1-anup.patel@wdc.com>
In-Reply-To: <20190324110804.68555-1-anup.patel@wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [2001:470:6972:501:7c02:aeab:5cad:5284]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91ce442b-9607-45a7-23e6-08d6b08cf877
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0207; 
x-ms-traffictypediagnostic: LO2P265MB0207:
x-microsoft-antispam-prvs: <LO2P265MB0207C0037A718BD8384FE736D65D0@LO2P265MB0207.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 09860C2161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39830400003)(396003)(346002)(366004)(189003)(199004)(13464003)(68736007)(6246003)(53546011)(33656002)(476003)(99286004)(86362001)(229853002)(446003)(97736004)(71190400001)(2906002)(6916009)(46003)(9686003)(106356001)(102836004)(186003)(11346002)(71200400001)(486006)(508600001)(6436002)(14454004)(76176011)(105586002)(53936002)(256004)(5660300002)(6506007)(7696005)(55016002)(25786009)(4744005)(52536014)(54906003)(316002)(7416002)(81156014)(81166006)(6116002)(8676002)(305945005)(8936002)(74316002)(7736002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0207;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /hHo4jVJF4rc51EOKThJb4OxnK210wqh7FJJySkJ6urwmciIBebi9/ZwwAVPY+7idS1T77Sp71DjTXzCABkjfxkrAQmrZFxz2PG0QkGgIoBnqipIczByIn4C7PQm50BRDcOe7VJLi+nLnbvceSx232RMHLVjwJfNesp80iMIk/algvZV37g+bQAAmAKRYWjmbZTkZX/AcunDd7EHs8OPKh4hBMyne5Gp0wHVhhVv9FwOoBiLeJ8drfD3piTcO9eiQgKy7dLMGLImnm4Ivm4wTuPPwRQFM4Ufb57cAPeGXfG9vBmfwGo4gJbbRUTxe6FJZagSDseZXciUx1jVv2/ldD2TSpzH0BfeN8qFH31Q0qrYw7oZxjUk2dvLR7jF2cM2aJcIzxrLaF0Fi8xnZWDUdmd8OYGsanhXbZrQtx/hdT8=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ce442b-9607-45a7-23e6-08d6b08cf877
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2019 19:14:42.8890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_121449_211290_467193AD 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Anup
> Patel
> Sent: Sunday, March 24, 2019 11:08
> To: Palmer Dabbelt <palmer@sifive.com>; Albert Ou <aou@eecs.berkeley.edu>
> Cc: Anup Patel <Anup.Patel@wdc.com>; linux-kernel@vger.kernel.org; Mike
> Rapoport <rppt@linux.ibm.com>; Christoph Hellwig <hch@infradead.org>; Atish
> Patra <Atish.Patra@wdc.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> linux-riscv@lists.infradead.org; Christoph Hellwig <hch@lst.de>
> Subject: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
> 
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index eb22ab49b3e0..7307609d405b 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -3,3 +3,5 @@ obj-y += fault.o
>  obj-y += extable.o
>  obj-y += ioremap.o
>  obj-y += cacheflush.o
> +
> +CFLAGS_init.o := -mcmodel=medany

I think you should also remove CFLAGS_setup.o from kernel/Makefile, as I think it was there solely for the correctness of setup_vm. As setup_vm is now in mm/init.o, the old CFLAGS probably isn't needed and should be removed in the same patch. Disclaimer: I haven't tested it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
