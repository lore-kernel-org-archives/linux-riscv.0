Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C99DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF252082F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="juFn6Rx6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ofV7kGpD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF252082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aq2IClvdm24d08ij3dA+MLtV/TNSUuKe/4tLPw3MvY8=; b=juFn6Rx66q7FlE
	2v4bOU7lR+BsJz/BWA6iB8JS36Cb6bGIirPelbvph6kvwHGii3mLb+cPactAQ81B7emN/76VMhvCz
	aXb0OG4s4OTGD6ZLMwlNrnVZWkA0SxfY0O5nbwxWvQQpL9awI/B4Ekl5RV+78AMqh15lPhakEEnmB
	Fa50s0zhevNy0EKH/CLht2MKa9GCAgGBBY2bO4CBi4xJtXNszZaq+RwRGf/46AnVQ3z0+jGjp0FT5
	SBdWC8+H0F9VGug1XPcpvinQ4A3c/v2+crXzXkPxuqwsJOOO8EJxnShqRTlEOorumWYgCJ6CyG5ez
	xLaY3EYiraDN4wNavSFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9YBp-0008Qo-Kv; Thu, 28 Mar 2019 16:47:41 +0000
Received: from mail-eopbgr100124.outbound.protection.outlook.com
 ([40.107.10.124] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9YBn-0008Pv-EL
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 16:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mllgGDSde4d4oNFKJzGkSXHbSyP55NnJdWSxcCRVuc=;
 b=ofV7kGpDFNwU3Sd2d/j4xPere7DZpT5KlM6EaHylG8ONWwf9pKSQaWr/i4zTkmkWyw1I3dMswqNudKZuUENg89xEu64QgmyiVKVx2vlHOP+IFwu3o1phjYoD20rn9wK/EyEL/dltOuneyPwpUdzg0qrEKFG2HN2e9DBtl47kPXg=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1261.GBRP265.PROD.OUTLOOK.COM (20.176.142.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Thu, 28 Mar 2019 16:47:36 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1750.017; Thu, 28 Mar 2019
 16:47:36 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Topic: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Index: AQHU5DXRggKhRQnKDU+ZIEb8FqarG6YfFcaAgABtlwCAAb0WgIAAAwMA
Date: Thu, 28 Mar 2019 16:47:36 +0000
Message-ID: <bf1771ca-6bb9-0740-87e4-3ef91e680bf4@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
 <20190327073131.GA4519@infradead.org>
 <be4911ab-9234-132d-1421-f0a06c2038d4@garyguo.net>
 <20190328163647.GA6577@infradead.org>
In-Reply-To: <20190328163647.GA6577@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::15) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bea307c-3f3d-4390-4e52-08d6b39d14c5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1261; 
x-ms-traffictypediagnostic: LO2P265MB1261:
x-microsoft-antispam-prvs: <LO2P265MB1261442BF52135E40508224CD6590@LO2P265MB1261.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39830400003)(136003)(376002)(189003)(199004)(256004)(36756003)(2906002)(71190400001)(71200400001)(6116002)(5660300002)(229853002)(8676002)(81156014)(81166006)(14454004)(508600001)(8936002)(6916009)(86362001)(31696002)(97736004)(68736007)(6486002)(31686004)(52116002)(93886005)(6436002)(106356001)(486006)(11346002)(105586002)(476003)(2616005)(99286004)(446003)(316002)(6512007)(54906003)(186003)(53936002)(102836004)(46003)(7736002)(6246003)(4326008)(76176011)(25786009)(53546011)(6506007)(386003)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1261;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iEWJhxxk1bo19AQJp93OFMdYiqLCx+3CrIyGooY3q76iPKrQw2btjNbBNbfJcAwq+jTLcNDfP/y6hNkx23uPMSBLYllMJOwMoLu/p5ngNwKBIblf1R9E9z/NBjns4JgCTmVzCFiPyBExubgHuvEJpeQ/K2wihPh7SxPz0gwv9qy55gqhzUeEVPgwWQBIVvtI0yajMBdsUg590wl3e1nzgsvnmnd2fusiV+WzCFCyIgJP5gPQXWyo5ak9gGtL8ertNMbPpi6s9/Dm5IiUUK70FiXF+e8R5JjTRNv2YlJ7hx1VTJI/w13bRr+buhKSuo/Nl+yEQiuuRQqX4XZjXjF0Q1rwfdMxRj1NxlwuUUfjiVu1Ar8s8aNLupJTmuHd8NnmMI1zsb7oXDIIi+XmllSUlTlA8t2pigcxz1h0mBni26M=
Content-ID: <D9830844FC6CD942BBFF53F73B59A6B0@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bea307c-3f3d-4390-4e52-08d6b39d14c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 16:47:36.1317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_094739_501691_E82B00DE 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 28/03/2019 16:36, Christoph Hellwig wrote:
>>>
>>> I think Anup now fixes OpenSBI.  Do you have benchmarks vs BBL,
>>> old OpenSBI and new OpenSBI?
>>>
>> See the cover letter. OpenSBI's code hasn't been made into stable, and
>> it has race conditions now.
> 
> Well, I'd still like to know numbers.  That is how people generally
> justify more complex code that claims to be more optimal :)
> 
No visible difference on QEMU, as all SFENCE.VMAs are global so we 
doesn't save anything, and the added cost of doing IPI is barely visible.

Don't have a board so can't test it out.

The main gain is to allow hardware devs to test their TLB implementation 
with Linux. If OpenSBI implements this properly we don't probably need 
the IPI code I guess.

>>> local_flush_tlb_range?
>>>
>> We don't have the VMA structures now so no. This is related to future
>> ASID patch as well.
> 
> Well, sprinkling inline assembly all over is generally not a good idea,
> so I'd like to have some helper.  And as pointed out before, IFF we pass
> an asid instead of the vma to local_flush_tlb_page once ASID support
> is added local_flush_tlb_page would nicely do that job.  If we really
> want another indirection it could be local_flush_tlb_page_asid instead,
> but I don't really see the point.
> 
Caller of local_flush_tlb_page (and the non-local) version shouldn't 
care about ASID. They only care about a particular MM. flush_tlb_page 
always takes a MM as argument and I see no point about why we shouldn't 
in the local version.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
