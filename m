Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A61C4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8izuF4HmzUlVYEQuqnIELNB/6TBD5jEm0WMQLM3bM6Y=; b=OlUmKuDDEU6icK
	FscmzmGvywcZ/pDfO/lGU7R24kC7pkSLAlaIjI4qqj4arkUhThrsomPoNDFhXHGqS/2qF/FFjJsF6
	4yNQ87l1dZXWB3dBsdLW7uZAoTEEAJxZgs9nRKTFcBPtgTzIXU88Rem1e429ZGPtJxpCOk07ZXvWa
	lfbUhmx+ajgMWxwfokFowCCOOzRKIBk8rBWcLK2Wb5opchX5SQc3QG1IaJ8mKNzms2ZzM8Tix1jV7
	dVTmRm4CHdMIWhK+rdFO4cpxzq+oeaETnGnjO3YV7nb0PMQ4v+L5Shd5RfGDmDTwXbdf6jMyfCuqN
	2zF7tyOLGjQeFjOOSkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6uir-009QKH-0S;
	Sat, 25 Nov 2023 15:37:33 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6uio-009QIz-0j
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 15:37:31 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-323-ACZXAgEhNOSnwO7T2ON0-A-1; Sat, 25 Nov 2023 15:37:22 +0000
X-MC-Unique: ACZXAgEhNOSnwO7T2ON0-A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 25 Nov
 2023 15:37:39 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 25 Nov 2023 15:37:39 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Nsw6ltZW50IEzDqWdlcic=?= <cleger@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Christoph Hellwig <hch@infradead.org>, Ben Dooks
	<ben.dooks@codethink.co.uk>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH v2] riscv: fix incorrect use of __user pointer
Thread-Topic: [PATCH v2] riscv: fix incorrect use of __user pointer
Thread-Index: AQHaHsrcAiRrTVkzkEi8HCpEAmrYerCLK9Cg
Date: Sat, 25 Nov 2023 15:37:39 +0000
Message-ID: <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
In-Reply-To: <20231124113803.165431-1-cleger@rivosinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_073730_546459_0BA945C6 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

...
> @@ -491,7 +486,7 @@ int handle_misaligned_load(struct pt_regs *regs)
> 
>  	val.data_u64 = 0;
>  	for (i = 0; i < len; i++) {
> -		if (load_u8(regs, (void *)(addr + i), &val.data_bytes[i]))
> +		if (load_u8(regs, addr + i, &val.data_bytes[i]))
>  			return -1;
>  	}

I'd really have thought that you'd want to pull the kernel/user
check way outside the loop?
In any case, for a misaligned read why not just read (addr & ~7)[0]
and (if needed) (addr & ~7)[1] and then ahift and or together?

clang will do it for misaligned structure members with known
misalignment, but it is almost certainly also better for reads
with unknown misalignment.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
