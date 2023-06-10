Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB3BC7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jljXmIyyeEakpi8Xtiaq0gXrrr7v2m48VUcUGiDRvUs=; b=ro1udzPM7/nQdk
	i4RyibboryyHDJZUvAcuc+/E4Jxp5be8cHO3z71i6JOcChU4j79mCSNOgsGBWYiSdsE3kEKIwtEPm
	VrcVvgto380tb6QplgevFZplH2c7wlxP3mVDNVIE63xfEnPjauYYF5EKcL/oPHI0EVTSHNG7PQvV3
	TV1sIjS2WqIiPXqPkwOvhn5YQ+qCCsc1LEuJ727iRF3wtOHu7cEXfwGsawh1z2gtWHqQiH4GiERVu
	RGAMIbWg9lFxsP0ONCFsgFmxiPVQ3gkoBu6PTgPpi7niwasmeo5b8xWU/vz93G2hmOssQr5V3sVqv
	S4ZA2s0mf/oSlNm3MzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81Xq-00GZJs-32;
	Sat, 10 Jun 2023 16:34:30 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81Xo-00GZIS-0p
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 16:34:30 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-257-vjr2SVtyMI2O7ZtR7E3aMA-1; Sat, 10 Jun 2023 17:34:20 +0100
X-MC-Unique: vjr2SVtyMI2O7ZtR7E3aMA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 10 Jun
 2023 17:34:16 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 10 Jun 2023 17:34:16 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Zhangjin Wu' <falcon@tinylab.org>, "w@1wt.eu" <w@1wt.eu>
CC: "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "thomas@t-8ch.de" <thomas@t-8ch.de>
Subject: RE: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Thread-Topic: [PATCH v2 4/4] tools/nolibc: sys.h: apply __syscall() helper
Thread-Index: AQHZmQJ1YTdtMnXhOkqSBnIhvL9uWq+EPW+g
Date: Sat, 10 Jun 2023 16:34:16 +0000
Message-ID: <0295105fe0744200bf2ef99e5bf7bc09@AcuMS.aculab.com>
References: <ZIAB7bFYegCuXT9g@1wt.eu>
 <20230607053920.667272-1-falcon@tinylab.org>
In-Reply-To: <20230607053920.667272-1-falcon@tinylab.org>
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
X-CRM114-CacheID: sfid-20230610_093428_574259_3522A08F 
X-CRM114-Status: UNSURE (   6.96  )
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

From: Zhangjin Wu
> Sent: 07 June 2023 06:39
...
> As a summary, will use 'sysret()' and something like:
> 
>    static __attribute__((unused))
>    int chdir(const char *path)
>    {
>    	return sysret(chdir(path));
>    }
> 
> to renew the syscall helper patchset, Thanks you very much.

While I'm all for using 'cpp-magic' to abstract and (hopefully)
simplify things. Token-pasting the sys_ here doesn't seem to gain
anything.
Anyone grepping the code for 'sys_chdir' is also going to
wonder where it is used.

There might be scope for something like:
#define syscall_wrapper(func, type) \
	static __attribute__((unused)) \
	int func(type *arg) \
	{ \
		return sysret(sys_#func(arg)); \
	}
and then:
syscall_wrapper(chdir, const char *)
would expand to the code above.

I think you'd need separate defines for each number of arguments.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
