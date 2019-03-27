Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF951C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 13:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8B22075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 13:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CMEnco0n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nx7UexCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8B22075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTDwHjgMJOO85nfnSfuB2e7yb3QU7xNyRlVrgYBcMeY=; b=CMEnco0nq0KweU
	Oo33okNOZZn531RIiFT1QCx8LVKOoaq1qi5/fLXOPPqYPHubrV79YJqKQLR6zJg4rtXdagXx9icRi
	ZByiDKVJwxVnSi87kAW9eeGt8F9GDBGbj21v1Xq/XyIK7W+QWq3II2Rz/mPPzGZtx6JmkZp1fAXVe
	CtKZntbcQggLczqKdMoYo0CaN2JM2KGS7fxomA8Z8Pk8PCSpNaMSVa6LJZuVnC3rWttgFads7wYG6
	Gj3xBuAPcgrkDclJINZQCSpqciWgAa54PkzvDEHrv2ouUk4/jpsSuxY3Y/u+p1Qb6n1ir6nQGaiFj
	S51jd/vYbo+Cvj8nRtFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h992h-00060y-BS; Wed, 27 Mar 2019 13:56:35 +0000
Received: from mail-eopbgr110115.outbound.protection.outlook.com
 ([40.107.11.115] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h992e-00060L-5C
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 13:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssNIs2Q/GfaJ7a/4dLZDi5VksjpqMJaJkpjQf5GzFcg=;
 b=nx7UexCfpdzixmvxmGenUN0t/Khm1THgGhjM4NjYm+wGap/C9Y0mUyyUlKA4hXPOKbXNmCaOvBAWX/M2bUhLaqH05pYeis/g24asDxBFC21FdaISJU+Vy6h0Yt9adAzKMuHjVJcX9sgXU/mT/pkOzihZG7bj+m+tKRe9OVbyEhM=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0816.GBRP265.PROD.OUTLOOK.COM (10.166.103.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Wed, 27 Mar 2019 13:56:28 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 13:56:28 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Thread-Index: AQHU5DXRjrrgflObmkuyRMH0IAemlaYfFDeAgABtG4A=
Date: Wed, 27 Mar 2019 13:56:28 +0000
Message-ID: <3bef1053-34b5-08f5-6a90-f9270445129e@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
 <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
 <20190327072557.GE3210@infradead.org>
In-Reply-To: <20190327072557.GE3210@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d950a6e7-b530-4727-2489-08d6b2bc028a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0816; 
x-ms-traffictypediagnostic: LO2P265MB0816:
x-microsoft-antispam-prvs: <LO2P265MB081688E0C9B60897F45BCA35D6580@LO2P265MB0816.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(39830400003)(376002)(396003)(199004)(189003)(54094003)(105586002)(86362001)(6486002)(476003)(446003)(14444005)(14454004)(6116002)(6506007)(256004)(508600001)(229853002)(6512007)(4326008)(6436002)(46003)(186003)(81156014)(8676002)(305945005)(25786009)(81166006)(6916009)(7736002)(53936002)(316002)(8936002)(36756003)(97736004)(68736007)(6246003)(31686004)(71200400001)(486006)(5660300002)(386003)(99286004)(53546011)(71190400001)(76176011)(2616005)(52116002)(31696002)(11346002)(2906002)(106356001)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0816;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gEbwMFvC3/d58n/Znxc/E2gPWuImKeX/FF/Biil3NIzToRcdLOB/4jAUMFcYjF+hnGWxUW/PexxlOFE5GHPZqCuoHBI+/vQ2KQyB7ij3voRAGIp73BRaCe18p+ucIg5UD3ApuN/AT0L1TxsvMWnq/CS9bkiZe1f2rYi/3g8jT/ZmWgoNalhkUC4HkmoWEMXZtwanZynDdcaFi3iGhHF6KLn6s5SnS4KRgSt6WJj3ZkGjM5WYyAgL1Qy+2GxYnSf3px/VSLX672Kmp7FooRqCQaabsQ0fSk6kDz7T+BjD6fCoewPB+5H/6n3U8UrrH/19l9R1mwhe9DoYiJ1lb7ENnmLW9XEqIrvvN1SWlU92eOraNkZIyGV5+rFGTXanVTka/qklmId/P+d2/lp4sWp/g2UI0jFtDEzYbM7gJ8vvH88=
Content-ID: <B1FF3B0F303E7D458C40BD7AEAB63DB7@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d950a6e7-b530-4727-2489-08d6b2bc028a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 13:56:28.8289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_065632_199279_0113E226 
X-CRM114-Status: GOOD (  24.50  )
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



On 27/03/2019 07:25, Christoph Hellwig wrote:
>> @@ -27,53 +19,47 @@ static inline void local_flush_tlb_all(void)
>>   	__asm__ __volatile__ ("sfence.vma" : : : "memory");
>>   }
>>   
>> -/* Flush one page from local TLB */
>> -static inline void local_flush_tlb_page(unsigned long addr)
>> +static inline void local_flush_tlb_mm(struct mm_struct *mm)
>>   {
>> -	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>> +	/* Flush ASID 0 so that global mappings are not affected */
>> +	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
>>   }
>>   
>> -#ifndef CONFIG_SMP
>> -
>> -#define flush_tlb_all() local_flush_tlb_all()
>> -#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
>> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>> +	unsigned long addr)
>> +{
>> +	__asm__ __volatile__ ("sfence.vma %0, %1"
>> +			      : : "r" (addr), "r" (0)
>> +			      : "memory");
>> +}
> 
> Why do we pass the vma argument here even if it is never used?  That
> just seems to create some rather pointless churn.  Also I'd add
> local_flush_tlb_mm below local_flush_tlb_page to avoid churn as well,
> nevermind that it seems the more logical order to me >
This isn't used now, but we need that for ASID support. It also more 
consistent with the non-SMP flush signature, and more consistent with 
code of other architectures.
> 
>> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>> +	unsigned long end);
>> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
> 
> As far as I can tell these are only used for the !SMP case and only
> to implement the non-local prefixed versions.  In that case we should
> just drop the local_prefix and implement those APIs directly, and only
> for !SMP builds.
> 
Ok, in that case I'll also move it to tlbflush.c.
>> +
>> +#include <linux/mm.h>
>> +#include <asm/sbi.h>
>> +
>> +#define SFENCE_VMA_FLUSH_ALL ((unsigned long) -1)
>> +
>> +/*
>> + * This controls the maximum amount of page-level sfence.vma that the kernel
>> + * can issue when the kernel needs to flush a range from the TLB.  If the size
>> + * of range goes beyond this threshold, a full sfence.vma is issued.
>> + *
>> + * Increase this number can negatively impact performance on implementations
>> + * where sfence.vma's address operand is ignored and always perform a global
>> + * TLB flush.  On the other hand, implementations with page-level TLB flush
>> + * support can benefit from a larger number.
>> + */
>> +static unsigned long tlbi_range_threshold = PAGE_SIZE;
> 
> I really hate having this is a tunable in the kernel code.  I think
> the right answer is to have a device tree entry to carry this number
> so that the platform can supply it.  Btw, what are examples of
> platforms that flush globalls vs per-page at the moment?  What is a good
> larger value for the latter based on your testing?
> 
This is discussed in previous versions of this patch, and we arrived at 
the conclusion that a boot parameter is the best way to do it now, as at 
the moment we have no other ways to get this information. The actual 
value really depends on the actual implementation. If the implementation 
has a super large TLB where full invalidation would be super expensive, 
they might even want the value to be 511.

> Also I wonder if we should also split this tunable and the optional
> global flush into a separate patch.  This is in this first patch
> just make use of the asid,  and then another patch to add the threshold
> for doing the full flush.
I don't think we should. This patch is more like a rewrite to old logic 
rather than patching things up incrementally.
> 
>> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>> +			   unsigned long end)
>> +{
>> +	if (end - start > tlbi_range_threshold) {
>> +		local_flush_tlb_mm(vma->vm_mm);
>> +		return;
>> +	}
>> +
>> +	while (start < end) {
>> +		__asm__ __volatile__ ("sfence.vma %0, %1"
>> +				      : : "r" (start), "r" (0)
>> +				      : "memory");
> 
> I think this should just call local_flush_tlb_page.
> 
I do this to minimise changes we need if we want to add ASID (in which 
case we want to avoid retrieving ASID from atomic variable multiple times).
>> +		start += PAGE_SIZE;
>> +	}
> 
> And maybe use a for loop to short cut it a bit:
> 
> 	for (; start < end; start += PAGE_SIZE)
> 		local_flush_tlb_page(start);
> 
Ok
>> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>> +{
>> +	if (end - start > tlbi_range_threshold) {
>> +		local_flush_tlb_all();
>> +		return;
>> +	}
>> +
>> +	while (start < end) {
>> +		__asm__ __volatile__ ("sfence.vma %0"
>> +				      : : "r" (start)
>> +				      : "memory");
>> +		start += PAGE_SIZE;
> 
> Same here, just with local_flush_tlb_kernel_page.
> 
Ok
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
