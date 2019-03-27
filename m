Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1102EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE982087C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUNn3AVr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EVEKGlYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE982087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wuqmd32KPUoFP2BC7Fql6qGuAp4puqbMxl23FZys1E4=; b=NUNn3AVrwOyAPE
	wFy/NXYOp5SOmpQB5B3FdT17jM5/YLpBH1rFbepn+ZZtBwNFiouI8qkvEqGf9r1vZB9nDEFUQnHdr
	W/mFkf/zOBWP0Y8ENHWuvn9Lv5Xrx9LStQ9nm0WEOCEoT8mr8hmayizf6KrQFtoS9ds/yhmU8eINl
	yHBLyD8Zhbjt8uogRmqFiawnlMr6pLcJ6CUsHH5Q7A9VvGcmvdce6uPHNtLDEP/w+JX0ldvay5jms
	cuuYhQDhzQ6mV32shJQCCrneSV7k00NQ1XJKzu0sAWjrX8RG5V+avovuKgRvmfDyevrUnqX0p/6I9
	NoKdrST7FpJMlCGKUbSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h99F8-0001vm-CS; Wed, 27 Mar 2019 14:09:26 +0000
Received: from mail-lo2gbr01on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe15::710]
 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h99F4-0001ub-Hr
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 14:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kirQD1cMLxzYrd2uSvz4bOtNA/RwlGSqtMTM0BCn2a4=;
 b=EVEKGlYdDFI0mnP03eVLn4Wj72lZXsRM7HSDzLIKV3peg+A//LiQYCgpbIvF/ph/l2GBnMpUR19koQ0bzFz8Rk+6+s9trO2iVRw67f6aFHu2MLLVX+kLiMcGoJjL6Nugb4ilk6ItcmNVJ2SctvSovJDcjDYyP7MwEmsl0aVxgbc=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1549.GBRP265.PROD.OUTLOOK.COM (20.176.143.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Wed, 27 Mar 2019 14:09:15 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1730.019; Wed, 27 Mar 2019
 14:09:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH] RISC-V: Implement ASID allocator
Thread-Index: AQHU5IQth95RRmVyw0y1O3lxWJG/36YfVxgAgAAEHICAACGYgIAABZuAgAAB4QA=
Date: Wed, 27 Mar 2019 14:09:15 +0000
Message-ID: <4dca2cfe-069f-f458-b1a7-f87aa6718ef7@garyguo.net>
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
 <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
 <74227a1d-3928-3e92-c7a9-5c3e093b29ab@garyguo.net>
 <CAAhSdy1K6OiZ2nDGcERi7J1z-i6hDC2eWubYDnSqPGCxQKkn5g@mail.gmail.com>
In-Reply-To: <CAAhSdy1K6OiZ2nDGcERi7J1z-i6hDC2eWubYDnSqPGCxQKkn5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1a26928-2542-4208-4019-08d6b2bdcb63
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB1549; 
x-ms-traffictypediagnostic: LO2P265MB1549:
x-microsoft-antispam-prvs: <LO2P265MB154944EFD1CA7680DAC77B10D6580@LO2P265MB1549.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39830400003)(396003)(346002)(376002)(189003)(199004)(53936002)(6246003)(229853002)(6486002)(316002)(36756003)(6916009)(6436002)(81166006)(6512007)(97736004)(25786009)(8676002)(54906003)(8936002)(7736002)(2906002)(81156014)(99286004)(93886005)(31686004)(305945005)(256004)(31696002)(7416002)(4744005)(5660300002)(486006)(86362001)(102836004)(476003)(4326008)(508600001)(46003)(106356001)(11346002)(186003)(105586002)(2616005)(6506007)(446003)(386003)(71200400001)(14454004)(76176011)(6116002)(52116002)(53546011)(71190400001)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1549;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i+5tI2ckZMjMN79J+XLqvBpf1n4phyCWEqThZkNpqyE5RS3beU9f/B3DOD/SUSnEn1+Br64D3RvbpJs1TtjhhPT9pXrqGLnOPHf65vIUYd+7Tk03pQSWbiIdWs90UMPjjsj3atzE49BZBXEVoxJHUe89GAKMK13U+FIIx6TFM8ur72c3dKwQ3AaZ8nfybCVTU3dZYr4uRAPiHetSIPxTFz2O2pMQHzpT9t3bmW7JRC6e+/XKQ45F8NT4jXTOQet43GRjf0Vd7eR+bOsd7QeYt1N9wD88J26gV7w3CU/uuLQ/Z9kFSowDKyah2gGgzHzTCanTqDAR/e/ZZLj+UQpPJ8jQ/hvYYZ0QZHe29+2EwKN8KgqUfe2vnqC60OxVBPdBMlYcYV7aL7LR5M2cxjzznLMyalJU6ZdhC0bjA2Hs1fI=
Content-ID: <FFA84DDD477AD4478D3FA072E01E0B17@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a26928-2542-4208-4019-08d6b2bdcb63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 14:09:15.2647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_070922_866702_6AD8DAC8 
X-CRM114-Status: UNSURE (   9.72  )
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

I think my code already get all the caveats cases covered. The only 
thing my code is missing is handling the case when ASID is not 
supported. Maybe it is better to work based on that instead?

On 27/03/2019 14:02, Anup Patel wrote:
> On Wed, Mar 27, 2019 at 7:12 PM Gary Guo <gary@garyguo.net> wrote:
>>
>> I would also like to mention that your code assumes 64-bit atomics
>> support which we don't have on 32-bit systems. Using 32-bit to track
>> ASID generations isn't sufficient and will cause overflows. That's why I
>> have asid_generation_overflow to handle the case (this is super
>> error-prone as well).
> 
> Thanks for catching. I will fix issues with 32bit systems and send v2
> soon.
> 
> Regards,
> Anup
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
