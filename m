Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74267C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO0z9sBOgczWdXshTT2mD+E63v5CWWOpNS7gKgNXSRE=; b=SyBNJmU/BYeHD+
	Tk0tyzq6UWU0MnWCsfoeLuwyeuzR34f4cIJv2qheyGHAq18IFsvGI2WSpOQefNmorLiw/b3IDRDdl
	lDsiTQezi8iVAzelrYoB6iFb9LOEKxOlPwCkv2XMaaIA1Nst2kRQXE12uMxlTZ4CoUmcjP2xaILn3
	cs4LN+eqJ5HzHKArmATPC92n8jsVb38P8bC8fZTTJfoxj1bXm+Kd7Bm1DLdeSbx1qg+olnHX/CEmf
	Pd56ZwhPis4eusSGKLWDDFCJdC6KUWVEit1o/YQ39q0AN9pQ8Dh9SLY4DmnrEd2XmYIoNXOmTWcYE
	KBqss+ITDHoeBVES76Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4pX-007mx7-9g; Wed, 20 Apr 2022 07:32:51 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4os-007mcM-Gc
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 07:32:12 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-165-jcx-0iaIPGatONrL5yGJ_Q-1; Wed, 20 Apr 2022 08:32:04 +0100
X-MC-Unique: jcx-0iaIPGatONrL5yGJ_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 08:32:02 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 20 Apr 2022 08:32:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'He Zhe' <zhe.he@windriver.com>, Kees Cook <keescook@chromium.org>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org"
 <namhyung@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
 "paulus@samba.org" <paulus@samba.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
 <linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Thread-Topic: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Thread-Index: AQHYU/YpuaYuTiSSXEqj2VkDLnuG5qz4aD5A
Date: Wed, 20 Apr 2022 07:32:01 +0000
Message-ID: <9e5c394e82ec44e1887ebebe777a97f2@AcuMS.aculab.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
 <202204181457.9DE190CE@keescook>
 <b328bed3-ebb9-6fba-9585-79946262c40f@windriver.com>
In-Reply-To: <b328bed3-ebb9-6fba-9585-79946262c40f@windriver.com>
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
X-CRM114-CacheID: sfid-20220420_003210_861284_D318D572 
X-CRM114-Status: UNSURE (   8.11  )
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

> > Thanks for doing this implementation! One reason usercopy hardening
> > didn't persue doing a "full" stacktrace was because it seemed relatively
> > expensive. Did you do any usercopy-heavily workload testing to see if
> > there was a noticeable performance impact?

Look at anything that uses sendmsg().
It is noticeably more expensive than sendto().
All the extra copy_from_user() cause measurable slow slowdowns.
Using __copy_from_user()(to avoid 'hardending') in the socket code
and when reading the iov[] gives a measurable improvement.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
