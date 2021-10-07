Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E11FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 07:53:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15ED6112D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 07:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D15ED6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zijPWaofMDLN/R3RBd7SiPFCLpoTgRikKuvSsHw+iw=; b=wd8oHA4V9wLNwT
	EJbVF+laSBzsr0y1yW+l2kcS5Z8z7hTWx0bgZl8u0XKPo/OKAyOXqxU75ACApl/KJZ20N77E3aZ6S
	6XFkV9mpeYfyv3OaM3INwIKFxXpicWo+K3UKgUAAUr8A9kiQR2HH3PYyQP87Vwn7ok3d8T5ZGc4Tp
	ghVrjp1RifzyG3Ux4CRgmytnCHUWPjWGe4QCMjmMuJCCuRIG8TpZF28Njw/rMAluzbVm8ahvASN5t
	3MnzIWt04x9eeyOk3i38xYOqghkeNXMStIKbASFHQ/gTpolkRe3/DscVGlzkflHCZFMXV/DBgnEF7
	VSjZluWR0e7BpLys5yMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYODI-00GTRb-On; Thu, 07 Oct 2021 07:53:12 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYODF-00GTQ3-Np
 for linux-riscv@lists.infradead.org; Thu, 07 Oct 2021 07:53:11 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-38-fz1CuUWYNx6QMVBcOLTHFg-1; Thu, 07 Oct 2021 08:53:02 +0100
X-MC-Unique: fz1CuUWYNx6QMVBcOLTHFg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 7 Oct 2021 08:53:01 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 7 Oct 2021 08:53:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Stafford Horne
 <shorne@gmail.com>
CC: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "x86@kernel.org" <x86@kernel.org>, 
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Will
 Deacon" <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, Rob Herring
 <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand
 <frowand.list@gmail.com>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Ingo Molnar
 <mingo@redhat.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, James Morse <james.morse@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Ray Jui <rjui@broadcom.com>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, "openrisc@lists.librecores.org"
 <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden
 <sbranden@broadcom.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Paul
 Mackerras" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Thread-Topic: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Thread-Index: AQHXuvrQ2rKkD2ly1kazB6yB6/HdHavHKFTA
Date: Thu, 7 Oct 2021 07:53:01 +0000
Message-ID: <c81b9c01650e487785b02f6562791556@AcuMS.aculab.com>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
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
X-CRM114-CacheID: sfid-20211007_005310_052934_5EF4FD81 
X-CRM114-Status: GOOD (  15.91  )
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

From: Segher Boessenkool
> Sent: 06 October 2021 22:27
> 
> On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> > You have defined of_get_cpu_hwid to return u64, will this create compiler
> > warnings when since we are storing a u64 into a u32?
> >
> > It seems only if we make with W=3.
> 
> Yes.  This is done by -Wconversion, "Warn for implicit conversions that
> may alter a value."
> 
> > I thought we usually warned on this.

The microsoft compiler does - best to turn all those warnings off.

> This warning is not in -Wall or -Wextra either, it suffers too much from
> false positives.  It is very natural to just ignore the high bits of
> modulo types (which is what "unsigned" types *are*).  Or the bits that
> "fall off" on a conversion.  The C standard makes this required
> behaviour, it is useful, and it is the only convenient way of getting
> this!

I've also seen a compiler convert:
	struct->char_member = (char)(int_val & 0xff);
into:
	reg = int_val;
	reg &= 0xff; // for the & 0xff
	reg &= 0xff; // for the cast
	struct->char_member = low_8bits(reg);

You really don't want the extra noise.

I'll bet that (char)int_val is actually an arithmetic expression.
So its type will be 'int'.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
