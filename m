Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13197C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cstoG6AFVC/cVvr7Efg035nQ/sG5DyKmMrMnY6onAY4=; b=I5YIBuSJjCU5dz
	mzI2lNYzqWAV/ydsyrmwWW3JtRnkn0gQsAxwhrH1C1YaQWDZJL+p7F1MTIJYXL2SgcPaAtRMmzlNK
	WwZAa/wc/ziZeSXrxM24UZVnSsesnX4+Gc4lhN+/o5iYgkSUdRlx54qdsrjiGJlbJ+vwdfKMSUYLZ
	MbyGNuzOkmIo/Ph3TL2gTQy4VuAV4qfcJHkCDQyVnckTk1NVIyFeRbnGJWtJa57mOP3TaTP4gWov0
	lwTrrWdH3T6VLzpUM0qsMP9QvbvV9EDUHyXeuZMWij34vLflHeoOl55mttvi/p0EjZRJt2Mzg8pF2
	CliaDExhPrAZFLz50GnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCUJk-009dZ3-88; Tue, 25 Jan 2022 22:29:36 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCUJg-009dYF-QG
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 22:29:34 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-312-9uUIQKOKPQeq0Z4xvNcZPA-1; Tue, 25 Jan 2022 22:29:28 +0000
X-MC-Unique: 9uUIQKOKPQeq0Z4xvNcZPA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 25 Jan 2022 22:29:26 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 25 Jan 2022 22:29:26 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jessica Clarke' <jrtc27@jrtc27.com>, Atish Patra <atishp@rivosinc.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anup Patel
 <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, devicetree
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
Thread-Topic: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
Thread-Index: AQHYEjqOgNf2MUyCekGjzXIezYRolax0US8A
Date: Tue, 25 Jan 2022 22:29:26 +0000
Message-ID: <63b1a64fc25d44dabab777bf1f247863@AcuMS.aculab.com>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
In-Reply-To: <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
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
X-CRM114-CacheID: sfid-20220125_142933_162529_18CD7B46 
X-CRM114-Status: GOOD (  11.23  )
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

> On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Currently, SBI APIs accept a hartmask that is generated from struct
> > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > is not the correct data structure for hartids as it can be higher
> > than NR_CPUs for platforms with sparse or discontguous hartids.
> >
> > Remove all association between hartid mask and struct cpumask.
....
> > -static int __sbi_rfence_v01(int fid, const unsigned long *hart_mask,
> > +static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
> > 			    unsigned long start, unsigned long size,
> > 			    unsigned long arg4, unsigned long arg5)
> > {
> > 	int result = 0;
> > +	unsigned long hart_mask;
> > +
> > +	if (!cpu_mask)
> > +		cpu_mask = cpu_online_mask;
> > +	hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
> >
> > 	/* v0.2 function IDs are equivalent to v0.1 extension IDs */
> > 	switch (fid) {
> > 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> > 		sbi_ecall(SBI_EXT_0_1_REMOTE_FENCE_I, 0,
> > -			  (unsigned long)hart_mask, 0, 0, 0, 0, 0);
> > +			  (unsigned long)&hart_mask, 0, 0, 0, 0, 0);

You don't need the cast.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
