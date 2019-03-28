Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1076C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:40:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913762082F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+gRzSvQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="itpmetG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913762082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIhc8iIbs8rr9cLU6zgI68F0MRO9esvqmIf2w7j3t8I=; b=h+gRzSvQQFevG5
	wz11QmQY0bLBKieg9BxNXwo8QCJkcjDphTsEU5MLBtUjVbLSnNGJ5G3xgrdpYjNZmh9boKQBTT+GB
	DaAAqIgPPfblJXwWhZBA6/H3JK9xrx5CwlVCMlXgFaomrsEP/iSXgT2LkeNrpzpaN+Z4LvxS1KCTb
	sy6LjfRHS6uzE8mywa4SNuX++KD/lh/IoUIjKDqAL9Cr+slredHBS9geskdGeGpoO60LPY5o7orj5
	jOOY27UaLa5ut07jXRpfOcuf8rfoOcxwdK5/HA8ObT8QBoQ3906B13+LijTZREXGrAYQ3SUkQSp+P
	rEofxF7jOT9g4As5ZFxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Y4P-0003Ny-3H; Thu, 28 Mar 2019 16:40:01 +0000
Received: from mail-eopbgr100119.outbound.protection.outlook.com
 ([40.107.10.119] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Y4L-0003NN-8k
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 16:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38Z6xS3b1+wCUGrIF9aL76W+30XOoPWnXiuv2BGzg6Q=;
 b=itpmetG5+jkkH+RSR85c+BDAUOH36abScFutQWw1tfOA/aBWHq321Pm0zxFINQSOkKSEjR6PHXRgHBKHuVSbevlUdOzNxN8KrGe6N/gKSD5Npjc/eaw6X4Aif+dofwrMuNHhxv1aPSZ04SkmK5yv2zCVfnwnhQ8BxuKGtUxGJKk=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0605.GBRP265.PROD.OUTLOOK.COM (10.166.100.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Thu, 28 Mar 2019 16:39:54 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1750.017; Thu, 28 Mar 2019
 16:39:54 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Index: AQHU5DXRjrrgflObmkuyRMH0IAemlaYfFDeAgABtG4CAAbnegIAABh8A
Date: Thu, 28 Mar 2019 16:39:53 +0000
Message-ID: <ad35a3db-cfe2-f37f-b520-fc67091e8e9e@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
 <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
 <20190327072557.GE3210@infradead.org>
 <3bef1053-34b5-08f5-6a90-f9270445129e@garyguo.net>
 <20190328161757.GB27879@infradead.org>
In-Reply-To: <20190328161757.GB27879@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eba746b0-ff79-4035-9590-08d6b39c0149
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0605; 
x-ms-traffictypediagnostic: LO2P265MB0605:
x-microsoft-antispam-prvs: <LO2P265MB060553AD2E175B5DE71D71F2D6590@LO2P265MB0605.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(396003)(39830400003)(199004)(189003)(54094003)(6486002)(256004)(14444005)(86362001)(6246003)(11346002)(99286004)(46003)(14454004)(52116002)(508600001)(31696002)(36756003)(186003)(7736002)(53936002)(71190400001)(305945005)(316002)(4326008)(102836004)(486006)(53546011)(71200400001)(105586002)(8676002)(2616005)(81156014)(6512007)(476003)(25786009)(106356001)(6436002)(8936002)(93886005)(6916009)(68736007)(31686004)(229853002)(6116002)(97736004)(2906002)(446003)(386003)(81166006)(76176011)(6506007)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0605;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YJUyQLUzcemx/gx8EiEUZVIfxG45+A2qbCJDpZ382xmER3B+HbDDWGNe2A9E3Rpjolw5xPk1cXsLKLecwPT3GJF3kzvFuLCqXvPeOWxbYvy5sj86IJVNkqhlI7k6z1Q/oxr3EMYc6YeWcdRXXkFDVPrqLtuCGSXc6mMlMQuVSALN45EBmJbUbQRzWxXuaQcSU0B6UQ+LorlELfFnYUqBRhT23QVqVtr/fIZNkEQ6U3tVbOcUX4ubhP4fSgQZEM8kCkry+qiZarUkvTYS24nKixiDZjEVj7RFbVB1NaLFg758LUidOAz/xNMVlHS8LEgOpS/nCxppvrypOZI/3uvW0Mqi6IdCf1Pl6VhKqt7LTxuFb3KDSrETZepxIfbwF07YXshpXoCrPRGfzlw1omVQtyO/n05PuKushLf8PPNyCWY=
Content-ID: <45EE6D27108FDB488057AB976406C863@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eba746b0-ff79-4035-9590-08d6b39c0149
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 16:39:53.9375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_093957_384048_062A11B3 
X-CRM114-Status: GOOD (  29.32  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 28/03/2019 16:17, Christoph Hellwig wrote:
> On Wed, Mar 27, 2019 at 01:56:28PM +0000, Gary Guo wrote:
>>>> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>>>> +	unsigned long addr)
>>>> +{
>>>> +	__asm__ __volatile__ ("sfence.vma %0, %1"
>>>> +			      : : "r" (addr), "r" (0)
>>>> +			      : "memory");
>>>> +}
>>>
>>> Why do we pass the vma argument here even if it is never used?  That
>>> just seems to create some rather pointless churn.  Also I'd add
>>> local_flush_tlb_mm below local_flush_tlb_page to avoid churn as well,
>>> nevermind that it seems the more logical order to me >
>> This isn't used now, but we need that for ASID support. It also more
>> consistent with the non-SMP flush signature, and more consistent with
>> code of other architectures.
> 
> I'd rather keep it simple for now.  For ASID support I suspect you'll
> only need it to get the asid from the mm_struct pointer to by the
> vma, right?  I'd rather pass the asid directly in that case.
> 

Yes, just takes it from mm_struct. But the key point is to keep it 
similar to the local_flush_tlb_page.

>>>> +static unsigned long tlbi_range_threshold = PAGE_SIZE;
>>>
>>> I really hate having this is a tunable in the kernel code.  I think
>>> the right answer is to have a device tree entry to carry this number
>>> so that the platform can supply it.  Btw, what are examples of
>>> platforms that flush globalls vs per-page at the moment?  What is a good
>>> larger value for the latter based on your testing?
>>>
>> This is discussed in previous versions of this patch, and we arrived at
>> the conclusion that a boot parameter is the best way to do it now, as at
>> the moment we have no other ways to get this information. The actual
>> value really depends on the actual implementation. If the implementation
>> has a super large TLB where full invalidation would be super expensive,
>> they might even want the value to be 511.
> 
> Sorry, I might not have been clear above - the tunable is ok for
> playing around and benchmarking, but it is not the kind of interface we
> should have regular users to poke at for good performance.  So I don't
> mind keeping the paramter in, but we also really need to define a way
> how the value could be passed through the device tree so that we get
> a good default.
> 
> And I'd still like an answer for my sectond question above - what
> were the good values for say the sifive u54 and qemu in your tests?
> 
QEMU currently treats all SFENCE.VMA as global. Technically the QEMU's 
implementation can be modified to do page-level flush instead but the 
performance will not differ, as the dominating factor is resetting jump 
cache.

I don't have a SiFive board so I can't tell what's a good value for that.

On a hypothetical platform that I am working at (simulation only) we can 
benefit even when setting it to 511 (max allowed, as if value >=512 we 
don't know if a non-leaf entry is changed, in which case spec mandates a 
full flush).

So this really depends on the platform.

>>> Also I wonder if we should also split this tunable and the optional
>>> global flush into a separate patch.  This is in this first patch
>>> just make use of the asid,  and then another patch to add the threshold
>>> for doing the full flush.
>> I don't think we should. This patch is more like a rewrite to old logic
>> rather than patching things up incrementally.
> 
> Well, we have two pretty distinct changes - one is to use a threshold
> to do a global(-ish) flush instead of a per-page one, and the other is
> to use AISD 0 explicitly.  In Linux we generally try to keep things at
> the smallest logical change.  I'm not going to push hard for this, but
> that is just how we normally do it.
> 
> 
>>>> +	while (start < end) {
>>>> +		__asm__ __volatile__ ("sfence.vma %0, %1"
>>>> +				      : : "r" (start), "r" (0)
>>>> +				      : "memory");
>>>
>>> I think this should just call local_flush_tlb_page.
>>>
>> I do this to minimise changes we need if we want to add ASID (in which
>> case we want to avoid retrieving ASID from atomic variable multiple times).
> 
> We can take vare of that later, preferably with a nice helper that gets
> the ASID as an argument (see my local_flush_tlb_page comment above).
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
