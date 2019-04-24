Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7E4C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 12:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3CC218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 12:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZjHSrex8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WRYBWXcL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C3CC218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDOnrUubTvR0xItuyojvyVRVWM/sUJwPoJRYTv/d5No=; b=ZjHSrex8yupSOL
	HFJsxahT/CN1BB4tcTnveZUdST80pRbLUNd4PUpe9vTtCYc7XM+JNvfKdeASegJSkG/YlEp+bG1QG
	+EiuB6sXxPgp5sCbQSkonJ23j8uILavMZ2Oz0vzrqcGJlV9jP/JHpDrX61zjXaBg9wG0hjjN3UgbR
	WDiThtcagtk2RfhtBTAR+ZNM45zCrZkX9bkc18fyWfwk4Vy1qNU4To7oIbCEJ5KFxRnVkM5Qv/v5U
	6YSjByW4DZoYT4UkQxnrVlT6s8Ldg0oF/NAOGm/cxZILv5gxEEU23Jwlp5hv1JIkeT4XydMAAhRNl
	VLf/hZAa6FyfTJRN2o+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJHHm-00067N-Pw; Wed, 24 Apr 2019 12:46:02 +0000
Received: from mail-cwlgbr01on0716.outbound.protection.outlook.com
 ([2a01:111:f400:fe14::716]
 helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJHHk-00066s-AM
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 12:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHlkzz3rmH4owxkjeJpTab7AuT0ByAEbSaKHUBaB4y4=;
 b=WRYBWXcLVuUUS+Vztmy5aNfEXZC9wWSbsyPwHd09ltkJso1NEjE44tRYrt8kQDzNmUSOZy+vteSiStLv2YeWrrGfeIJXLER9ZYsa2+Y6EBtXEjK/WB1zEkCn6TGu4AlqSOGCyrf8tkY26TpXVMvMqCmVQQ5F5QHKP/HUuoxPzz4=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB1615.GBRP265.PROD.OUTLOOK.COM (20.176.145.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.19; Wed, 24 Apr 2019 12:45:56 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d5c0:cf6f:4b60:ae19%4]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 12:45:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Thread-Topic: [PATCH] riscv: Support non-coherency memory model
Thread-Index: AQHU+SJqOw/bzOFv7E6YG/Ezkj/376ZIW7QAgACE3wCAAF+NAIAApRkAgAATvgCAAJneAIAAEuQggAAtFoCAAHI8gA==
Date: Wed, 24 Apr 2019 12:45:56 +0000
Message-ID: <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de> <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de> <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190424055703.GA3417@guoren-Inspiron-7460>
In-Reply-To: <20190424055703.GA3417@guoren-Inspiron-7460>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::14) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c780389-5b05-4da5-a139-08d6c8b2cb54
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600141)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
 SRVR:LO2P265MB1615; 
x-ms-traffictypediagnostic: LO2P265MB1615:
x-microsoft-antispam-prvs: <LO2P265MB1615507BF1770FD72D3989CCD63C0@LO2P265MB1615.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39830400003)(396003)(346002)(376002)(366004)(189003)(199004)(6506007)(7416002)(508600001)(53546011)(386003)(31696002)(25786009)(6246003)(102836004)(86362001)(6916009)(99286004)(8676002)(4326008)(7736002)(14454004)(81166006)(229853002)(2906002)(305945005)(81156014)(6486002)(97736004)(68736007)(52116002)(71200400001)(71190400001)(93886005)(476003)(53936002)(66946007)(73956011)(76176011)(6116002)(446003)(6512007)(11346002)(66476007)(8936002)(2616005)(36756003)(64756008)(66446008)(46003)(256004)(486006)(186003)(5660300002)(66556008)(54906003)(31686004)(6436002)(316002)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1615;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ge//13D2PSS4WQ2QG4ap+Wv/KsdnX7YJ/h2mYOCRJS++FcVp8xuzpBmxzRSoKDHxAeazzNdnZoivV944w57JOJhLFrtOMI32Lhvd5Fdh+RquhjweL0x8YtlV5FuwwN5IySrw0eJgtXNKVvQcsioci0JWWFkR+4SVQjyP28NE3bPJyNTcI2YZAPFQLFSHQkRd9tATgNJn1ZD7/iZQgm46uG+7h4/NnPClSql1TGrQ7iru7cueg1iuSIjuCkJP+aJ4rlNE+cH8EKMNhHv8/kNr3WiLo689dmm69oL5aEv7wd9fs7/pNX9yg6KwgKB1hrO8BRqMGU6NvDfRKduVQlFR5sHuG1kWiTFs51gHajh1DvLKvrlAzRRn6kVV1HUzP9G5bsB9vmGmLnYDiRjHLv4653u6gIsgtm1Rf9tKXADF7o8=
Content-ID: <3CB84A4D67FB29409C60DE8990A6CA97@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c780389-5b05-4da5-a139-08d6c8b2cb54
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 12:45:56.3481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_054600_435995_F79071DF 
X-CRM114-Status: GOOD (  18.62  )
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



On 24/04/2019 06:57, Guo Ren wrote:
> Hi Gary,
> 
> On Wed, Apr 24, 2019 at 03:21:14AM +0000, Gary Guo wrote:
>>> Look:
>>> linux-next git:(riscv_asid_allocator_v2)$ grep GLOBAL arch/riscv -r
>>> arch/riscv/include/asm/pgtable-bits.h:#define _PAGE_GLOBAL    (1 << 5)    /*
>>> Global */
>>> arch/riscv/include/asm/pgtable-bits.h:                                    _PAGE_USER |
>>> _PAGE_GLOBAL))
>>>
>>> Your patch tell us _PAGE_USER and _PAGE_GLOBAL are duplicate and why we
>>> couldn't make _PAGE_USER implies _PAGE_GLOBAL? Can you give an example
>>> of a real scene in PTE about:
>>>    _PAGE_USER:0 + _PAGE_GLOBAL:1
>>> or
>>>    _PAGE_USER:1 + _PAGE_GLOBAL:0
>>>
>>> Of cause I know USER & GLOBAL are conceptually very different, but
>>> there are only 10 attribute-bits for riscv (In fact we've wasted two bits
>>> to support huge RV32-pfn :P). So I think it is time to merge these two bits
>>> before hardware supports GLOBAL. Reserve them for future!
>>
>> Two cases I can think of:
>> * vdso like things. They're user pages that can really be shared across address spaces (i.e. global). Kernels like L4 implement most systems calls similar to VDSO, so USER + GLOBAL is useful.
> Vdso is a user space mapping in linux, See: fs/binfmt_elf.c
> 
> static int load_elf_binary(struct linux_binprm *bprm) {
> ...
> #ifdef ARCH_HAS_SETUP_ADDITIONAL_PAGES
> 	retval = arch_setup_additional_pages(bprm, !!elf_interpreter);
> 	if (retval < 0)
> 		goto out;
> #endif /* ARCH_HAS_SETUP_ADDITIONAL_PAGES */
> 
> All linux archs use arch_setup_additional_pages for vdso mapping and
> every process has its own vdso mapping to the same pages.

But we shouldn't prevent a kernel from mapping a USER page globally. As 
I said, the fact that Linux doesn't do it isn't a valid reason for 
omitting the possibility.

> 
> I don't think vdso is a real scene for GLOBAL in PTE.
> 
>> * hypervisor without H-extension: This requires shadow page tables. Supervisor
>> pages are mapped to supervisor shadow pages. However these shadow pages cannot
>> be GLOBAL because they can't be shared between VMs. So  !USER + !GLOBAL is useful.
> Hypervisor use 2-stages TLB translation in hardware and shadow page
> tables is for stage 2 translation. Shadow page tables care vmid not
> asid.

When H-extension is present, stage 2 translation uses VMID and is 
performed by hardware. When H-extension is not present, there's no such 
thing called VMID. When H-extension is not present, both hypervisor and 
guest supervisor will run in supervisor mode, and hypervisor uses 
MSTATUS.TVM to trap guest supervisor virtual memory operations. The 
shadow page table is populated by doing 2-stage page walk in software. 
In this case, the hypervisor likely needs to use some bits of ASID to 
emulate the VMID feature. In this case GLOBAL page cannot be used as it 
means that the page exists in all physical ASIDs (which contains both 
emulated VMID and ASID). Having supervisor pages being GLOBAL makes the 
semantics incorrect!

> If hardware don't support H-extension (MMU 2-stages translation), it's
> hard to accept for virtualization performance.

The RISC-V privileged spec is explicitly designed to allow the 
techniques described above (this is the sole purpose of MSTATUS.TVM). It 
might be as high performance as a hardware with H-extension, but is 
definitely a legit use case. In fact, it is vital for use cases like 
recursive virtualization.

Also, I believe the PTE format of RISC-V is already frozen -- therefore 
it is impossible now to merge GLOBAL and USER bit, nor to replace RSW 
bit with another bit.

> 
> I don't think hypervisor is a real scene for GLOBAL in PTE.
> 
> Are there other scene for GLOBAL in PTE?
> 
> Best Regards
>   Guo Ren
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
