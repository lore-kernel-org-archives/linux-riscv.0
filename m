Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF7C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsiEMGQWKE1jlsnixuEZZZO2frkAM9aQc1yRzz9YX7I=; b=SShCCZWsI04yxq
	t0u9VOhsd6fSPxC8zXLEJ/cdCgVfbbwPYZKN6XUeCxSJRMNtc+3NBYTibVPZWTzGn2REJt+89vNSc
	pRKF5dDf/GgxZbZb7YGLlqhp9vM91TYRedcFlhJjzW8wIebel2EEme173aM1Nn49dhrmzEI5ZC/Jf
	aOdlT7rcBAUv24yeAo5cUcCUKSR+HHeW/ZtmD/tstEOpjciPU+nSA6SMYvA1IM4h5Do/4ayePyNb7
	IZmEfmH1/FUQi/bTnjdoJgymzd65W2GipVEi9HBzuUMBqvvUNMqULLlFK3MI7B4bQ2rcMrMyG4YaJ
	V9MFbXMbWFSP346UN9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lDB-001WZp-2g;
	Wed, 22 Nov 2023 11:16:05 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lD8-001WYj-1h
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:16:04 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-72-nmAAUN1cNVK2s83WvssOog-1; Wed, 22 Nov 2023 11:15:53 +0000
X-MC-Unique: nmAAUN1cNVK2s83WvssOog-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 22 Nov
 2023 11:16:23 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 22 Nov 2023 11:16:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: select ARCH_HAS_FAST_MULTIPLIER
Thread-Topic: [PATCH] riscv: select ARCH_HAS_FAST_MULTIPLIER
Thread-Index: AQHaHIr3F/LmUcOCEUqs//JJARgdtrCGLu+Q
Date: Wed, 22 Nov 2023 11:16:23 +0000
Message-ID: <47995b4daafb43348fc839ffb486f56b@AcuMS.aculab.com>
References: <20231121144340.3492-1-jszhang@kernel.org>
In-Reply-To: <20231121144340.3492-1-jszhang@kernel.org>
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
X-CRM114-CacheID: sfid-20231122_031602_851843_12F76B71 
X-CRM114-Status: UNSURE (   4.51  )
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
> However, the
> situation exists on x86 too, for example, P4 doesn't have fast
> integer multiplies ...

P4 doesn't have fast anything :-)

More interestingly does anything modern not have fast multiplies?
(that you'd consider running Linux on).

The silicon required isn't that big.
IIRC an 'n' bit multiplier requires n^2 full adders and has
the latency of 2n adders.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
