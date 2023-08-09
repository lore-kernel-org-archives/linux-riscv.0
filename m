Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F11EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZsZONGI9uK/tBn4tcxkyaKzt/6DAYY8/WrOrA67qD8=; b=NsAua3UhJlRiUZ
	BRJdVY07YTC+Yx61G5yLZuauHY6TThr1DzTTmXzZh/l+Mye8N4l8kWhQ+2JsTwcKxp87KYAAS3yP9
	q30YFCs8jQ6uLN40+KnMd6TQyMD9Nf0vdIQsuCvKynEnc24zovhjMly2qahiMZHAnKM03Qp2f74UZ
	M3fTIFSAJjy1GRYRAT7rO24ioSF5Luho8C65YWKJmLhyxJTXDC1wtZTbXQHm9hT7li97ZQ0OSmW8T
	Vc251nrecb1gfAad3kPRS98FdA9zEO1HqT6Hz3ucfJnpBOJvQFCrmPLIyizKuhJ4EWxO6dmKTFbS+
	Za9ubb9V4qAUmhrcghxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTgOC-004X4t-0b;
	Wed, 09 Aug 2023 10:26:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTgO7-004X2F-31
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 10:26:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1CD4D8016;
	Wed,  9 Aug 2023 18:24:58 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 9 Aug
 2023 18:24:58 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 9 Aug
 2023 18:24:57 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 9 Aug 2023 18:24:57 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
	<atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, Petr Tesarik
	<petrtesarik@huaweicloud.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Thread-Topic: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Thread-Index: AQHZxTKPVELaCqW/WUK93+UXGxBdOK/eAqwggAHhD4CAAed1gA==
Date: Wed, 9 Aug 2023 10:24:57 +0000
Message-ID: <3931cc7932e644bd88f9baf2beddd00d@EXMBX066.cuchost.com>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
 <3e066032031e4552b4b7903755deb669@EXMBX066.cuchost.com>
 <20230808-humility-rut-e1e46cf75708@spud>
In-Reply-To: <20230808-humility-rut-e1e46cf75708@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [210.186.215.22]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_032600_363919_0BFA7EC7 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, August 8, 2023 9:13 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>; palmer@dabbelt.com; Paul W=
almsley <paul.walmsley@sifive.com>; Atish Patra
> <atishp@rivosinc.com>; Anup Patel <apatel@ventanamicro.com>; Alexandre Gh=
iti <alexghiti@rivosinc.com>; Bj=F6rn T=F6pel
> <bjorn@rivosinc.com>; Song Shuai <suagrfillet@gmail.com>; Petr Tesarik <p=
etrtesarik@huaweicloud.com>; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; stable@vger.kern=
el.org
> Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for Ope=
nSBI's PMP protected regions
> =

> On Mon, Aug 07, 2023 at 12:44:07AM +0000, JeeHeng Sia wrote:
> =

> > > +/* SBI implementation IDs */
> > > +#define SBI_IMP_OPENSBI	1
> > I would suggest to create an enum struct for the SBI Imp ID in
> > the sbi.h file. What do you think?
> =

> I'm not really sure what the advantage of doing so is.
The macro SBI_IMP_OPENSBI seems weird (I would read it as "SBI Implementati=
on OpenSBI"). However, if we implement an enum struct for SBI_IMP_ID (There=
 are numerous IDs available), the macro can be abbreviated to OpenSBI. By d=
oing this, the conditional checking of the implementation ID would be more =
readable, as shown below:
if (sbi_firmware_id !=3D OPENSBI)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
