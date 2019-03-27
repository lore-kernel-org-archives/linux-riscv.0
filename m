Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A064C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 13:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 266262082F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 13:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udo9sbMP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qJCqNx3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 266262082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lHcSYPTJSMztXg1U1z4CiPX75/sFfVAAo2Tiq/zK0o=; b=udo9sbMPgSKN0v
	g5aQ1A7M9PhJb4M1Rw37J7woa91UHMEYlHqjWJcwge7FHp+zcXEOEeZWbszE3EekDdRueiGcw6o6H
	yWzBxcoPDYzzt6zw27w2hy/jo+FjqqWUV55HYFDm9kkBEFFonXJGNmJN0Ev7V+nmNSCFwXBx3n5N+
	x75kfB3Kx6nr7NhXyCOuF6PVn3QQpsJ1TdUza70mbUvZ6OYS1aQccop6W/1zo9KRvPfEmdj7xe+f7
	yIvmvgRApGwxWE7m+roJm32m6C8M22i4rUh0w8AKOxrVwiBnn0zYGvY4+bmlbWqnG4j8m6pDuf0nJ
	vAU2IVUCuyU/daZqu6jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h98lE-0003Qi-1U; Wed, 27 Mar 2019 13:38:32 +0000
Received: from mail-lo2gbr01on070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe15::70d]
 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h98lB-0003QG-6w
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 13:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi+JXVDJxT883aEjkbt6YKCMeNdGqv0trCpR/udwwFk=;
 b=qJCqNx3vb3C5LoUxV7akM2Pyn21w8kwwBFxHVymARQs4oHQorEO6LnVDoTpcbIA8hdomYQY/tvS7qmPgl/nGvkc0fNvJVSN58K33qvhIjkpcyGCNtqqG6JuXkna3qatX6fzL/NqfS/tvwWtsHvdHA1d6n+DkmsTiS77Qg/CzLis=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1295.GBRP265.PROD.OUTLOOK.COM (20.176.144.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 13:38:25 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 13:38:24 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH] RISC-V: Implement ASID allocator
Thread-Index: AQHU5IQth95RRmVyw0y1O3lxWJG/36YfVxgAgAAEHICAACB1gA==
Date: Wed, 27 Mar 2019 13:38:24 +0000
Message-ID: <49628dc9-c56d-6b60-9520-e4eb0e3b3424@garyguo.net>
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
 <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
In-Reply-To: <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16bfaf41-2a6a-4180-94f9-08d6b2b97c4f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1295; 
x-ms-traffictypediagnostic: LO2P265MB1295:
x-ms-exchange-purlcount: 1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-microsoft-antispam-prvs: <LO2P265MB129509F303F3D010CBB789A7D6580@LO2P265MB1295.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(39830400003)(396003)(136003)(199004)(189003)(97736004)(4326008)(316002)(71190400001)(54906003)(2906002)(14454004)(5660300002)(25786009)(7736002)(966005)(86362001)(6916009)(8936002)(508600001)(14444005)(71200400001)(256004)(7416002)(68736007)(31696002)(31686004)(186003)(446003)(6436002)(52116002)(6512007)(6306002)(486006)(2616005)(105586002)(6506007)(53546011)(229853002)(53936002)(386003)(476003)(99286004)(6116002)(6486002)(46003)(76176011)(305945005)(8676002)(36756003)(11346002)(102836004)(106356001)(6246003)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1295;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3E0s3cnfBVH2FLmIIG04JFM6TK1sbzbIy1bG4+PPhwjXIdy+iAgs7WdlDTjgedp99N/6UsBB9uzZApHdqNPF+91FLGBBkILRb4lu+FGn6ChM2mFjh/GJuJrpSHpVtqS0hGQCduPGULrsXMXZCJNeqATVikHmYuz9EXUUsRSceN3HlQO+n0bD3jvMwi9L9FBHw6Eai7+rdTvJnr8PjREf+QIiIOD5S1UC3iZYY2rPoc8sjBFPz9L0YUgnVQVIlvdCpEsyiJUCMhxjc6TtsZJyyOt2aZdZ0FG/iX/ZD+C825e2h7VNg0Yk6qBJRRNsVpdUpw7VwXBOwh+SYIZxc59kgtq+18qXgWIzQicxqS/QdnlnfUGqmE1UNPvpXpuVnXrpjONg/xq45Bb1Xl3DRzsxXW0cfEGrwePsMrtXCfcLQWo=
Content-ID: <79B6C6F9D82FFD43AE28F57D76E58B59@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bfaf41-2a6a-4180-94f9-08d6b2b97c4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 13:38:24.7810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_063829_328354_6AC1624E 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/03/2019 11:42, Anup Patel wrote:
> On Wed, Mar 27, 2019 at 4:57 PM Gary Guo <gary@garyguo.net> wrote:
>>
>> Hi Anup,
>>
>> This won't work in an actual hardware with ASID support. There're more
> 
> Can you elaborate why >
> 
> This implementation is based on Linux ARM64 ASID allocator which is
> tested for large number of CPUs on real HW.
> 
>> interactions with TLB flushes that need to be considered. You won't see
> 
> Yap, already considered. Please point me to unhandled case.
> 
When memory mapping is changed, you need to flush it from all cores that 
previously have that process executed, etc. Our patches both take 
inspiration from ARM's code, but the major difference between my code is 
handling of cache invalidations, see my code's cache_mask, etc. This is 
actually the most error-prone part, and I spent more time trying to find 
an optimal solution for this than porting the ASID allocator. The major 
difference is that ARM has a much more expressive sets of TLB flush 
instructions compared to RISC-V.
 >
>> this on both QEMU and SiFive board, as QEMU does not have ASID, so it
>> pretends that ASID is supported by just flushing its TLB everytime you
> 
> Nope, it does not. It detects whether ASID is supported or not. If supported
> it will also figure-out number of ASID bits supported by HW.
> 
Except that you can detect that QEMU supports ASID, but actually it does 
not. However QEMU is still correct because it always flush TLB when you 
set SATP/SPTBR. You won't be able to find out bugs in your code by just 
testing on QEMU.

> SiFive board does not have ASID bits so this implementation successfully
> detects that number of ASID bits are 0 and fallbacks to original way of
> local TLB flushes. >
>> change sptbr. I suspect the performance gain you see is just due to
>> saved TLB flush as TLB flush is super expensive in QEMU (all translation
>> block jumps need to be cleared).
> 
> Yes, performance gain is due to saved TLB flushes.
> 
> On HW which supports ASID bits, we will see more performance
> improvements. >
A hardware TLB flush is cheaper than QEMU' TLB flush. As no hardware 
supports ASID at the moment the performance gain is minimal.
>>
>> I have my version here https://github.com/nbdd0121/linux/tree/asid. I
>> haven't done code cleanups yet, but this version has correctness of its
>> ASID code tested on our TLB simulator tool (which unfortunately I can't
>> share right now as it involves with unpublished works).
> 
> Except few minor differences. You version of ASID allocator is same as
> mine. In fact there are lot of similar code framgements in your version
> compared to Linux ARM64 as well. I am sure this patch will work for you.
> >>
>> In fact my submit my previous patch series exactly as the basis of this
>> patch.
> 
> This patch is based your patch series so I suggest you take this patch
> and try it on your simulator.
> 
I've tested, and it does not boot.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
