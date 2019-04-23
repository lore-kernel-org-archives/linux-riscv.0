Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02376C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 15:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C94206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 15:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cqt/QEC/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sjUTAoUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3C94206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBsVlr+ptems6s0Nkb4jvjajMLg0Q1lhUe6GYvj58Gc=; b=cqt/QEC/YHFIyj
	MXSlL3dDHF2MGgRZxo9gmJqvVaMNapkgaQ+J6DVPvX7Pd4iS0qSOZXHBUyUSnvlFTPXhjBzV3MEtV
	br0ciZnsO65SPFOd7URKLDS2lJDPpWewPUUIDYOFMVCDnQqCyGh/VOjTv8Kd2+n1VhB3IuO7q2GTM
	IvU95I9qO1rQPFwCj6o0UjQGNyMl6xeXcIqA4g+zTKNMGCF3TDBavlTLRxs/+9ejHE3BMTA0VRLqO
	OfH5jev8ipSzfts7xhmkQ/HgSSOsFO/TClqprufw/Sq75HM0hMs4Ud+KfKZEQKpx5OOPx7+F5ZEbZ
	IpM60Bvr2DcYoTOaxkig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIxnf-0007uH-1L; Tue, 23 Apr 2019 15:57:39 +0000
Received: from mail-eopbgr100113.outbound.protection.outlook.com
 ([40.107.10.113] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIxnb-0007tP-Fd
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 15:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfWaB807/cb9crWYbXB+rmDX3y4xWG6DfIfBsL2KBps=;
 b=sjUTAoUQsZX8KHH+myidi6mo5LLCrrMc+wX4wZxqhK+dPuD+kvgmMaU5YfxppdI5jRoqmKZVppr2OpkTo5EZFmCk7TMNFQPRBRvgOj1FTkwh8UpiS8p5HMHD2iXxygiA/ZXoxTPiyqqQw2Sa1KTim0OaVOosp8ytC6JmT2pfkPU=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0654.GBRP265.PROD.OUTLOOK.COM (10.166.105.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Tue, 23 Apr 2019 15:57:30 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19%4]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 15:57:30 +0000
From: Gary Guo <gary@garyguo.net>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Thread-Topic: [PATCH] riscv: Support non-coherency memory model
Thread-Index: AQHU+SJqOw/bzOFv7E6YG/Ezkj/376ZIW7QAgACE3wCAAF+NAIAApRkAgAAC+wA=
Date: Tue, 23 Apr 2019 15:57:30 +0000
Message-ID: <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de> <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de> <20190423154642.GA16001@guoren-Inspiron-7460>
In-Reply-To: <20190423154642.GA16001@guoren-Inspiron-7460>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::20) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06794d87-611c-45f5-7de1-08d6c80463e7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:LO2P265MB0654; 
x-ms-traffictypediagnostic: LO2P265MB0654:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <LO2P265MB0654ADFE84DE2C0D3404C115D6230@LO2P265MB0654.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(396003)(39830400003)(346002)(199004)(189003)(99286004)(81156014)(81166006)(6436002)(8936002)(53936002)(14444005)(256004)(6246003)(5660300002)(186003)(52116002)(561944003)(66446008)(76176011)(102836004)(53546011)(6506007)(386003)(66476007)(64756008)(66556008)(73956011)(486006)(66946007)(2616005)(446003)(476003)(4326008)(11346002)(8676002)(25786009)(2906002)(46003)(71190400001)(71200400001)(97736004)(7736002)(6116002)(6306002)(305945005)(6916009)(31686004)(7416002)(86362001)(54906003)(14454004)(229853002)(508600001)(966005)(31696002)(36756003)(316002)(93886005)(68736007)(6486002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0654;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ebR+13b/0le0144jb9kLHJl1hCkE+TgYfNma3W7ar8zrE8JKY5s1b/mnkTq/4wDCWzcebvNS0oUPWwFDYfp5dX8KBDxeB7BaO4RhFBGe0HSlFwmT0254KglmZzLV0PybS3hzyQeL5XXEMz7StTWuSU1dTq/X4PbYlaCH6MM0a8FukK1exDMSCcJ8eloLSdHZjH3odWPycwH0a/l+VwaM2f+YWj9OmPKQZ0fbxEyd37v0qo9Cg3BXDyYt+oI6oiFFKK83FXUgNpDhVgeR6ylZxeVh2s2gD+RaKJ2+dYqzdsmgdveaYJumPlNsf5Btai2xd6EJ9rvAeeBcd/0CAeRa625jd5Xzre4LkT51/x0S56uhX2xsyPBBC7kpdazFU64dA+Os7rIhv9t7SpQw+vBmNFniqFv0rLPtz1riK7Lrlbo=
Content-ID: <17B373646E5003478C80CDE18E54E795@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 06794d87-611c-45f5-7de1-08d6c80463e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 15:57:30.3575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_085735_625161_DB798260 
X-CRM114-Status: GOOD (  23.36  )
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



On 23/04/2019 16:46, Guo Ren wrote:
> On Tue, Apr 23, 2019 at 07:55:48AM +0200, Christoph Hellwig wrote:
>> On Tue, Apr 23, 2019 at 08:13:48AM +0800, Guo Ren wrote:
>>>> We should probably start a working group for this ASAP unless we can
>>>> get another working group to help taking care of it.
>>> Good news, I prefer to use instructions directly instead of SBI_CALL.
>>>
>>> Our instruction is "dcache.c/iva %0" (one cache line) and the parameter is
>>> virtual address in S-state. When get into M-state by SBI_CALL, we could
>>> let dcache.c/iva use physical addres directly and it needn't kmap page
>>> for RV32 with highmem (Of cause highmem is not ready in RV32 now).
>>
>> So you only have one instruction variant?  Normally we'd have two or
>> three to implement the non-coherent DMA (or pmem) semantics:
> dcache.c/iva means three instructions:
>   - dcache.cva %0  : writeback     by virtual address cacheline
>   - dcache.iva %0  : invalid       by virtual address cacheline
>   - dcache.civa %0 : writeback+inv by virtual address cacheline
> 
> We also have memory barrier instructions, ref:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/csky/include/asm/barrier.h
> 
>>
>> cache writeback, cache invalidate and potentially cache writeback +
>> invalidate to optimize that case.  Here is the table how Linux
>> uses them for DMA:
>>
>>            |   map          ==  for_device     |   unmap     ==  for_cpu
>>            |----------------------------------------------------------------
>>   TO_DEV   |   writeback        writeback      |   none          none
>>   FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
>>   BIDI     |   writeback+inv    writeback+inv  |   invalidate    invalidate
>>
>>       [*] needed for CPU speculative prefetches
>>
>>
>> We already have a discussion on isa-dev on something like these
>> instructions:
>>
>> https://groups.google.com/a/groups.riscv.org/forum/#!msg/isa-dev/qXbzqaQbDXU/4ThcEAeCCAAJ
>>
>> It got a little side tracked, both due to the usual noise on isa-dev
>> and due to the proposal including a lot more instructions that might be
>> a little more contentious, but it might be a good start to bring this
>> into a working group.
> I think using sbi_call as a temporary solution is a good choice before
> the instruction is determined.
> 
>>
>>>> Also is this really a coherent flag, or an 'uncached' flag like in
>>>> many other architectures?
>>> There are a lot of features about coherency attributes, eg: cacheable,
>>> bufferable, strong order ..., and coherency is a more abstract name to
>>> contain all of these. In our hardware, coherence = uncached +
>>> unbufferable + (stong order).
>>>
>>> But I'm not very care about the name is, uncached is also ok. My key
>>> point is the bits of page attributes is very precious and this patch
>>> will use the last unused attribute bit in PTE.
>>
>> I don't care about the name actually, more about having defined semantics.
>> Totally uncached should include unbuffered.  I don't think we need the
>> strong ordering for DMA memory either.
> Yes, memory don't need strong order and strong order in PMA also implies
> uncached, unbuffered for IO address. If the entry of PMA is strong
> order, the page mapping must be uncached + unbuffered + strong-order
> without _PAGE_COHENCY in PTE.
> 
>>
>>> Another point is we could get more attribute bits by modify the riscv
>>> spec:
>>>   - Remove Global bit, I think it's duplicate with the User bit in linux.
>>
>> It is in Linux, but it is conceptually very different.
> Yes, but hardware could ignore one of them and in riscv linux
> _PAGE_GLOBAL is no use at all, see:
> grep _PAGE_GLOBAL arch/riscv -r
> 
> In fact, the _PAGE_KERNEL for pte doesn't contain _PAGE_GLOBAL and it
> works on FU540 and qemu. As I've mentioned page attribute bits is very
> precious, define a useless bit make people confused.
 >

The fact that it isn't used yet doesn't imply it is not useful. We don't 
use ASIDs at the moment, and without using ASIDs the "global" bit is 
indeed not useful. However with ASIDs the bit will be vital for saving 
TLB spaces. Without the global bit, the kernel pages become synonyms to 
themselves (i.e. they have different tags in TLB but refer to the same 
physical page).

The global bit also exists in many other ISAs as well. It's definitely 
not a "useless" bits.

Moreover, this bit is already implemented in both Rocket and Ariane. It 
is also in the spec for quite a while. The fact that Linux doesn't use 
it at the moment is not a reason for removing it.

> 
>>
>>>   - Change _PAGE_PFN_SHIFT from 10 to 12, because the huge pfn in RV32 is
>>>     very useless and current RV32 linux doesn't even implement highmem.
>>
>> This would seem sensible to me, but I'm not sure everyone agrees.  Even
>> then we are very late in the game for changes like that.
> Agree.
> 
> Best Regards
>   Guo Ren
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
