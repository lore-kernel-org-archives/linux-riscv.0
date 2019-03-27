Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676C4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:03:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32ED72087C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T98n/IUQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GyvDBQIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32ED72087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc/d6AoqdYs0653NfElMuskbm/RHsetGpmsEQ2RMFtI=; b=T98n/IUQHFc6Nl
	CLvCcwwWyG2yfut0QxQ8J5wNybz3z4CTdDL13ycnJEq6pHtsQ6I6DR5b9RnRMoUG+KnIlwOrTwjo5
	KjeI8uXXZh+FpDF4zxt49ldSGxj42q9veGp8kbtROnAZ6Cbrujbs98L0TvhCMnbaFIq9nxF5zTHYp
	EaIjhgEE0YuAvcE9HeNh+PkCU2dMWHw6spgCvExcWCotrlX/Gk/6Cba+XzWdUzaxyMj9lbQT7yB9u
	2p11cWhNAFRvry3tkyUwWTYFNQi3Oss5ZPE/ii0OWpwJIurG07JQJ7qx46DIgwuTIWtwlWiIw4NtV
	ZbF+aKN+mhlLCEBB0bYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h999o-0008Ra-FW; Wed, 27 Mar 2019 14:03:56 +0000
Received: from mail-eopbgr100097.outbound.protection.outlook.com
 ([40.107.10.97] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h999k-0008Qn-Fi
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 14:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG/rDqDHKkRw9JYrbUxpgFFBoHhUObKHLigyqZ/XW0c=;
 b=GyvDBQIP+ofa+ZabkjDXc2KisK3+gFS/GfG+CSPoUnZmRwPj1VUBsMmKm31m4bdej29lQnZllfMHG/oQ9txsalQwehSh5agnRP5L5Gc2iDZ+SrVX6fWhAtpHvWTqgNuOaHB9z7cWKKMSZMx6WxFRQ32jaFVnj7pKpD1UZv7OAhE=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1053.GBRP265.PROD.OUTLOOK.COM (20.176.140.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.19; Wed, 27 Mar 2019 14:03:48 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 14:03:48 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Topic: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Thread-Index: AQHU5DXRggKhRQnKDU+ZIEb8FqarG6YfFcaAgABtlwA=
Date: Wed, 27 Mar 2019 14:03:48 +0000
Message-ID: <be4911ab-9234-132d-1421-f0a06c2038d4@garyguo.net>
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
 <20190327073131.GA4519@infradead.org>
In-Reply-To: <20190327073131.GA4519@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::20) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61de3709-26a5-4085-c059-08d6b2bd087e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1053; 
x-ms-traffictypediagnostic: LO2P265MB1053:
x-microsoft-antispam-prvs: <LO2P265MB1053DB67CBD7664A10D8278FD6580@LO2P265MB1053.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(136003)(396003)(39830400003)(189003)(199004)(476003)(7736002)(229853002)(46003)(31686004)(11346002)(446003)(305945005)(186003)(86362001)(508600001)(71190400001)(71200400001)(316002)(2616005)(486006)(8676002)(5660300002)(6916009)(36756003)(14454004)(25786009)(102836004)(256004)(6512007)(99286004)(6436002)(97736004)(105586002)(53546011)(106356001)(8936002)(2906002)(81156014)(4326008)(6506007)(76176011)(386003)(6246003)(6486002)(53936002)(31696002)(52116002)(54906003)(81166006)(68736007)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1053;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fcd8h9vuU0rY/bHP0HV7Te0X2npJ/wY1z0ovNLrpzjIMvw5mG3i3UhnIEe29eEFgvLP0JJ7Xa9h//SwUfok8pIdrpa+UiT7fdoyEFtG759D35GFGtpGIKx6CDzwSJMiQN0DGyAwZjYjH8/qsKXi9fibAdOIWS1QZNPXUkeYAz6AomM3gK5Nl+NSr23gRdRmQ2CYjOyM5VvDR8hiACAm8fAOlXTcCcykBZhsMLWh0Cc1/Xd+OzAhEiqUGlhvFG3ZWqeHRs3RMCuD1olXZk9McX6VpWCtjzPZYDLlHp/GiNHNYKMcUkxC8ONGrNIr/0ISn6LeWxkFirJD3eU28yRZWHgnbmB3Ex+5c80lLBWmLLPQmEqdyvd+wnZbtBBEw43VDlA6TQ3e3003QCeFg8/cQxlVZM0IgLN8xwYIPPPuugro=
Content-ID: <E438E26E342D1C4EB76F4ABCA17CABF8@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61de3709-26a5-4085-c059-08d6b2bd087e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 14:03:48.2572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_070352_522142_25C565D2 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 27/03/2019 07:31, Christoph Hellwig wrote:
> On Wed, Mar 27, 2019 at 12:41:30AM +0000, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> This patch implements IPI-based remote TLB shootdown, which is useful
>> at this stage for testing because BBL/OpenSBI ignores operands of
>> sbi_remote_sfence_vma_asid and always perform a global TLB flush.
>> The SBI-based remote TLB shootdown can still be opt-in using boot
>> cmdline "tlbi_method=sbi".
> 
> I think Anup now fixes OpenSBI.  Do you have benchmarks vs BBL,
> old OpenSBI and new OpenSBI?
> 
See the cover letter. OpenSBI's code hasn't been made into stable, and 
it has race conditions now.
>> +static void ipi_remote_sfence_vma(void *info)
>> +{
>> +	struct tlbi *data = info;
>> +	unsigned long start = data->start;
>> +	unsigned long size = data->size;
>> +	unsigned long i;
>> +
>> +	if (size == SFENCE_VMA_FLUSH_ALL) {
>> +		local_flush_tlb_all();
>> +	}
> 
> Doesn't this need a return to skip the latter code?  Also it might
> we worth to just split the all case into entirely separate helpers,
> that way the on_each_cpu calls don't need to pass a private data
> argument at all.
I managed to get the return missing when doing rebasing... My fault. I 
don't think it is necessary to make it into a separate helpers, as the 
private data argument isn't expensive at all.
> 
>> +
>> +	for (i = 0; i < size; i += PAGE_SIZE) {
>> +		__asm__ __volatile__ ("sfence.vma %0"
>> +				      : : "r" (start + i)
>> +				      : "memory");
>> +	}
> 
> local_flush_tlb_kernel_page?
Good catch
> 
>> +static void ipi_remote_sfence_vma_asid(void *info)
>> +{
>> +	struct tlbi *data = info;
>> +	unsigned long asid = data->asid;
>> +	unsigned long start = data->start;
>> +	unsigned long size = data->size;
>> +	unsigned long i;
>> +
>> +	if (size == SFENCE_VMA_FLUSH_ALL) {
>> +		__asm__ __volatile__ ("sfence.vma x0, %0"
>> +				      : : "r" (asid)
>> +				      : "memory");
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < size; i += PAGE_SIZE) {
>> +		__asm__ __volatile__ ("sfence.vma %0, %1"
>> +				      : : "r" (start + i), "r" (asid)
>> +				      : "memory");
>> +	}
> 
> local_flush_tlb_range?
> 
We don't have the VMA structures now so no. This is related to future 
ASID patch as well.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
