Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062C9C4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 11:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD918610C7
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 11:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD918610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0IFBhdl71SVWRvc8hEHb9BN4sRx3NXTWeS7ODj1FQo=; b=rM4dHKx5yPzCOs
	u2+Fd3XBmxBASqFTf4V3Gxzii7QMUuuVUvGYayUOhkyHJhBKErNuj/1Ub/G1OvaAmtSBZK5EgB8kd
	AsSzJBpX7rCvFHxSSJpAtHijqoGId4B4v8AYnqRN3vyjik50afqMO75I6zZTiUrzzx4BIBxxhkyox
	m8F2xzcSEEtyyYQ9OeE3py+rlxMZY4vvPjgTwBozOSXN2D5yaLMB/Gw+Jt0U3xKiKuJThRZq/AwQ5
	VZrSYwCJc3qi3azi/zTo1kbJrWFmk4z9fJXMD6q9jdVJfq/9S6g2W32LFYnYb4Mw8Sun73Db2NzJI
	e3CupVASIBP07v7DzupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvIWo-003Oyy-5t; Mon, 21 Jun 2021 11:55:46 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvIWk-003OxQ-Kg
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 11:55:44 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-11-6_goVtNKMYqCsuMD0i38gA-1; Mon, 21 Jun 2021 12:55:38 +0100
X-MC-Unique: 6_goVtNKMYqCsuMD0i38gA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 21 Jun
 2021 12:55:37 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Mon, 21 Jun 2021 12:55:37 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Akira Tsukamoto' <akira.tsukamoto@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 5/5] riscv: __asm_to/copy_from_user: Bulk copy when both
 src, dst are aligned
Thread-Topic: [PATCH 5/5] riscv: __asm_to/copy_from_user: Bulk copy when both
 src, dst are aligned
Thread-Index: AQHXZQBMzI5fByhdl0uLY1idpEeJFqseXBJw
Date: Mon, 21 Jun 2021 11:55:37 +0000
Message-ID: <4a847070ad494e839de1d3fc5b39ba57@AcuMS.aculab.com>
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <4637f0f2-2da9-1056-37bf-17c0861b6bff@gmail.com>
In-Reply-To: <4637f0f2-2da9-1056-37bf-17c0861b6bff@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_045542_993560_2B799168 
X-CRM114-Status: GOOD (  14.96  )
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

From: Akira Tsukamoto
> Sent: 19 June 2021 12:43
> 
> In the lucky situation that the both source and destination address are on
> the aligned boundary, perform load and store with register size to copy the
> data.
> 
> Without the unrolling, it will reduce the speed since the next store
> instruction for the same register using from the load will stall the
> pipeline.
...
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index e2e57551fc76..bceb0629e440 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -67,6 +67,39 @@ ENTRY(__asm_copy_from_user)
>  	bnez	a3, .Lshift_copy
> 
>  .Lword_copy:
> +        /*
> +	 * Both src and dst are aligned, unrolled word copy
> +	 *
> +	 * a0 - start of aligned dst
> +	 * a1 - start of aligned src
> +	 * a3 - a1 & mask:(SZREG-1)
> +	 * t0 - end of aligned dst
> +	 */
> +	addi	t0, t0, -(8*SZREG-1) /* not to over run */
> +2:
> +	fixup REG_L   a4,        0(a1), 10f
> +	fixup REG_L   a5,    SZREG(a1), 10f
> +	fixup REG_L   a6,  2*SZREG(a1), 10f
> +	fixup REG_L   a7,  3*SZREG(a1), 10f
> +	fixup REG_L   t1,  4*SZREG(a1), 10f
> +	fixup REG_L   t2,  5*SZREG(a1), 10f
> +	fixup REG_L   t3,  6*SZREG(a1), 10f
> +	fixup REG_L   t4,  7*SZREG(a1), 10f
> +	fixup REG_S   a4,        0(a0), 10f
> +	fixup REG_S   a5,    SZREG(a0), 10f
> +	fixup REG_S   a6,  2*SZREG(a0), 10f
> +	fixup REG_S   a7,  3*SZREG(a0), 10f
> +	fixup REG_S   t1,  4*SZREG(a0), 10f
> +	fixup REG_S   t2,  5*SZREG(a0), 10f
> +	fixup REG_S   t3,  6*SZREG(a0), 10f
> +	fixup REG_S   t4,  7*SZREG(a0), 10f
> +	addi	a0, a0, 8*SZREG
> +	addi	a1, a1, 8*SZREG
> +	bltu	a0, t0, 2b
> +
> +	addi	t0, t0, 8*SZREG-1 /* revert to original value */
> +	j	.Lbyte_copy_tail
> +

Are there any riscv chips than can do a memory read and a
memory write int the same cycle but don't have significant
'out of order' execution?

Such chips will execute that code very badly.
Or, rather, there are loops that allow concurrent read+write
that will be a lot faster.

Also on a cpu that can execute a memory read/write
at the same time as an add (probably anything supercaler)
you want to move the two 'addi' further up so they get
executed 'for free'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
