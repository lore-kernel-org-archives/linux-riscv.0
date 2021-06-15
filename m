Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29AEC48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFCC6128B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFCC6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeLStYGQJHAMlVCUIaxSRS35br9zEUhjhnGpouo/fVo=; b=CRDoVuZyJbHk8p
	F6SsncyygxQOehLyqPI4lzdrGFmNwYk3DmYzpnT5FViu2R8cjL/4kCzI0pvc7y3ryDxFl95SlVLUo
	Wbqx0aFGcFBZgNH+efk82KwMhSSxHhU1OUTvJoqDhQDYMx1qZxsk9ET6Hp5cbnafzQY6V/2SNxunK
	yYmBO010l6SE7kFYTsf6Rq+C1lbqWUlBfgav215GX0xEynt/x7cXmHigcbSPvDYx5YDgISuvIEVfb
	Oc43dPKjJEf9hCCPYb8zoYVCfbcfORL5VucSg++cdYuBzV9CwE4Ekfw84QpdZWjjQcnXvYeRiqXj9
	sK8IuD8BwEi/rUte+McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEDg-002Gji-1K; Tue, 15 Jun 2021 18:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Id-000DwX-Cz
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=63E0WGF1W71bT+txX/BrGuTvklCPZW79mhg7eAywVjk=; b=Gn+WVIU247WsMJCPN0bYZr3cXj
 yH4JB6qXIwyKAm5IE97XQJQLHKZhE4xqVjn84270+ULG99g5IOLukNZwkuboj+xzv4Hx3bEFIss+Y
 0WOifiH7BG3noP6KWw9CSiZgWW6r21MLjVE+3nR/ec3B0vxC9OJ8kkkGYxkzA4kNmiYB2szEFJW4w
 vFlXpH/DROaN4GHsoCEhjYDOe4d0qUc7ZKuz0moVpov+MxZR7/qZQAVZYSgp5xwQo6QS+6iQKoeI9
 LkQegZnn1E+1Yixnv26Q4jNyHNWlqPkfa4JwacooLSRyVwKc/PBdseuGxq1Jmrz9loRXV5Atzg1CZ
 npA039pA==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt4sd-007XK5-KM
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 08:57:16 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-68-ED9ugU7XN0-kOTjofplO1Q-1; Tue, 15 Jun 2021 09:57:08 +0100
X-MC-Unique: ED9ugU7XN0-kOTjofplO1Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 15 Jun
 2021 09:57:07 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 15 Jun 2021 09:57:07 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH 1/3] riscv: optimized memcpy
Thread-Topic: [PATCH 1/3] riscv: optimized memcpy
Thread-Index: AQHXYY/3XkdMIImxVUmoQbZ37iIZIqsUw3ig
Date: Tue, 15 Jun 2021 08:57:07 +0000
Message-ID: <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
In-Reply-To: <20210615023812.50885-2-mcroce@linux.microsoft.com>
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
X-CRM114-CacheID: sfid-20210615_095714_553404_30348FD9 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Matteo Croce
> Sent: 15 June 2021 03:38
> 
> Write a C version of memcpy() which uses the biggest data size allowed,
> without generating unaligned accesses.

I'm surprised that the C loop:

> +		for (; count >= bytes_long; count -= bytes_long)
> +			*d.ulong++ = *s.ulong++;

ends up being faster than the ASM 'read lots' - 'write lots' loop.

Especially since there was an earlier patch to convert
copy_to/from_user() to use the ASM 'read lots' - 'write lots' loop
instead of a tight single register copy loop.

I'd also guess that the performance needs to be measured on
different classes of riscv cpu.

A simple cpu will behave differently to one that can execute
multiple instructions per clock.
Any form of 'out of order' execution also changes things.
The other big change is whether the cpu can to a memory
read and write in the same clock.

I'd guess that riscv exist with some/all of those features.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
