Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B44BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Dec 2021 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj2pNhGFNBcxBXtDQDLNCIGlHjMyo0cKWAYZxk/k8d0=; b=2JzzplGJf0cCqv
	DPoCDldJlOhK1rX8waO3uAhZjzBZxON0hBMwhfz4ga8I16FgWKcxpoNVS9IzU3TFdM+qQHcoiiWry
	HXO6ZDQSfCriP+/UaU41guBZ1uZclMUdB9VuVUJ19z+vxkaLlBUrPltvYiwIHQltl3K5sBTnndkkT
	GsPaFhGExz25AVnoEchRqcPpY9MbjiOXfs9wDW8/3GS9rUiayRvGzf8+FiDSVhR2lFgi1qAKmqJqU
	rHfZVMItI+e8nPasCjNkPlQxHciFq24ItGGjEOWeHGLb0hQrCgz0KUV1qvfk5V5EA+KWt+OdLAvfb
	vRgBYNaGD+DCkIHV0KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw6ZI-005KVT-Dt; Sat, 11 Dec 2021 17:53:56 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw6ZC-005KU0-UY
 for linux-riscv@lists.infradead.org; Sat, 11 Dec 2021 17:53:52 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-14-gpculCQTMuGutzfqbGQ0WA-1; Sat, 11 Dec 2021 17:53:47 +0000
X-MC-Unique: gpculCQTMuGutzfqbGQ0WA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Sat, 11 Dec 2021 17:53:46 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Sat, 11 Dec 2021 17:53:46 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Tiezhu Yang' <yangtiezhu@loongson.cn>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xuefeng Li
 <lixuefeng@loongson.cn>
Subject: RE: [PATCH v2 0/2] kdump: simplify code
Thread-Topic: [PATCH v2 0/2] kdump: simplify code
Thread-Index: AQHX7j/jzYqw5kMpA0qY43nH0kUm2Kwtku5w
Date: Sat, 11 Dec 2021 17:53:46 +0000
Message-ID: <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
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
X-CRM114-CacheID: sfid-20211211_095351_326983_8D8F4010 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Tiezhu Yang
> Sent: 11 December 2021 03:33
> 
> v2:
>   -- add copy_to_user_or_kernel() in lib/usercopy.c
>   -- define userbuf as bool type

Instead of having a flag to indicate whether the buffer is user or kernel,
would it be better to have two separate buffer pointers.
One for a user space buffer, the other for a kernel space buffer.
Exactly one of the buffers should always be NULL.

That way the flag is never incorrectly set.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
