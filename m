Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF672C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dutL/M2GlDtRf7TW/Acq7QvEG/c6cKIAqUBE8kCVAk8=; b=GX0uAUa33G8qPw
	rzsXeae44Ig2ccgPNdzoOAcP2gx+W72wJ+mut3bWIpyGvi7GNFtPZOmpRFAnBM9MLd6f72MV2CX7o
	W63c+dw+lWsJwRqUe5MtcEGZ7JuIERk57DLhZGGCMnKEEzpjkIRl4INvEXWuqE/edM0L5xdC5TZlF
	Q4S6wnkbQ9ZBx/HZoSElQKK2kU+eIvyuX+Z37bJP6ppgETNsHxDsXNRdHrfiaEo8HEsy9Gx3JR8DS
	p/eN1ZQluzT+UvNN0KuMS+XJxC9N3jPaMBomcodhTEckZf88gvST2pnvOdEZ7fxgpzQZcacFdPSR+
	gZMtV/yPF8y992jlmCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Gk6-009ddy-2R;
	Thu, 08 Jun 2023 14:36:02 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Gk3-009dcX-19
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:36:01 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-267-NXZg-_eNOaO8RckaE_lZ0g-1; Thu, 08 Jun 2023 15:35:52 +0100
X-MC-Unique: NXZg-_eNOaO8RckaE_lZ0g-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 8 Jun
 2023 15:35:49 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 8 Jun 2023 15:35:49 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Zhangjin Wu' <falcon@tinylab.org>, "thomas@t-8ch.de" <thomas@t-8ch.de>,
	"w@1wt.eu" <w@1wt.eu>
CC: "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>
Subject: RE: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and
 __sysret() helpers
Thread-Topic: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and
 __sysret() helpers
Thread-Index: AQHZmE5QSUsfyUxi2UiZnouHjWtcta+A+37Q
Date: Thu, 8 Jun 2023 14:35:49 +0000
Message-ID: <94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com>
References: <cover.1686036862.git.falcon@tinylab.org>
 <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
In-Reply-To: <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
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
X-CRM114-CacheID: sfid-20230608_073559_698456_0E3988AC 
X-CRM114-Status: GOOD (  10.04  )
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
> Sent: 06 June 2023 09:10
> 
> most of the library routines share the same code model, let's add two
> helpers to simplify the coding and shrink the code lines too.
> 
...
> +/* Syscall return helper, set errno as -ret when ret < 0 */
> +static inline __attribute__((always_inline)) long __sysret(long ret)
> +{
> +	if (ret < 0) {
> +		SET_ERRNO(-ret);
> +		ret = -1;
> +	}
> +	return ret;
> +}

If that right?
I thought that that only the first few (1024?) negative values
got used as errno values.

Do all Linux architectures even use negatives for error?
I thought at least some used the carry flag.
(It is the historic method of indicating a system call failure.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
