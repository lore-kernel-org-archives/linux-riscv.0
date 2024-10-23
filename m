Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E716DCFA455
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1QJOuFWwKfGBm9CS/V1qVIrhh7KTWpnakS4IfW4Ecbc=; b=OoJlHyRjPAC8EWDZBiKthMyMar
	NeeBh9woTSdYi2FDkC9CHecCXI52sXIT5Hyc7WiMe/59SgsuTHzsqCDAUTxEEJBNz1h8DRY9frH5l
	xPBptg+oSRl170grumEbiB9HrdKGj6yebzLbufsqdqkOfrblAS2cVl+pR26MSfDjceyg9qCZKYMNs
	bZs7n9SwUDTtcnxaumIfmnChTATGIpgIgtOeTp8KNBR/8XINlrUA7B49KQMSvuwSRPpzeW08VzzPo
	9GNx4vHQyKtuVio5uj2Wr0kdIv4EDW82tEAbSSp3Gxrf6OPv4eU94BVGnSRXvwsBe7byR3Zk9IewF
	Q+xVpprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f7o-0000000FMsq-3fAN;
	Wed, 23 Oct 2024 17:26:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eY9-0000000FD5v-4Bdm
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 16:49:35 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6A764120F
	for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729702171;
	bh=w2QaCC8q/9wFycITOyNXbtjclLYtA/uPr5wOP7wkZg4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lajEjjnaOld7ZLmATWTgV0F65cRG4Fil+kWozfLhUYUkFhBACuCacIz3/s3aMNCli
	 invc05LX5t/39eT29jpNULVpfR0pOiudhP9q7wxoIuE8DSwXkbsBFkfdjKeVyq1Hj2
	 juPWnz5wYPYoTr65QIEFWD1BmuS8b87h033ppOtt+pdOyQ4OLvEgkm/pEIhU2yKOZh
	 9L0OY+nCR/LhhjVZ4MBwgyt1c6+DAe3aK87IYruFU8jMdMFr+rgjMMxFY4GK5B+J4f
	 FhuEh/z2gJfGsw22bF1GsBZwMxrYFvLMdH4yD+e2dz2xzouqM7rn5P907XP3DAx2Ib
	 7D8jPSL3TpUIA==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-288b904d3d3so67285fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 09:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702169; x=1730306969;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2QaCC8q/9wFycITOyNXbtjclLYtA/uPr5wOP7wkZg4=;
        b=Sj5VadJnmdGtLopygnc0Er/rKpherbxVaWTnNu8XSSon+OtFXxOMpa/fFTcHEOtkB1
         tshlD11u+bmbIkGBbAWkvDVxgDS8laVUND6Jed9dBaBHJi+9A5ZzPTrgK+nqFkFImpyI
         KAHcYSohjfzaDynX2vbYdjXn8GhVeCLdh+Y+jFxGx9XthBWs3h073K2AKldWZhTNPue2
         AHny7FdJjfjvw4s0c62eiSsOK+rAhPb7N7wuR+Yz6LrHH0cGK1Xfq3MjplX//iWRqvtT
         gglFOn/FVTbNUttIZneL0awWWddrExjHWv3IAXbZsMjkMntkJ6pMx9/nO4ruzWsuIlTJ
         RRJA==
X-Forwarded-Encrypted: i=1; AJvYcCVc1ay7pp+TChCIf2C4YuQLCl0VheJgzQ7UzWkYroNXiIWDIlv+7bnh5wmQZRL2RArxdi1lmhdrcdp0kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdk8IbquH/Fp3isMP2B/Ve6myjR0n2RQIbMU+1P494ELQQ86AG
	hofr6vuoQjoj4HrNXWrPDhZ62JuqalFg7JQLuXmEDX8W74VJ1VOPzNNbcQXlr/gy/8mMlxBfIwp
	bzZogUQUrp5JzYRq3DDdQOobdHbkV9qwxLvuI/lzt3CEZDIoYgXfmcDIhU3xT1qKSBwQKX9xaB1
	UTapJ1srmc6XEHo/uY2ZcQ07l7sFkBwUj2Pwgr0DPBeJpM8msp7E+YvFKG
X-Received: by 2002:a05:6870:a905:b0:260:eae3:5ec2 with SMTP id 586e51a60fabf-28ccb4a44e1mr3290256fac.26.1729702169194;
        Wed, 23 Oct 2024 09:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAONy/ra7wiBLGnnWDTFW/U6U7FnGggdnF7DYXmB3kSGSkFwOtZGKVkkKys9wyfe40jfUT0o4lf5kU/ZKjmnA=
X-Received: by 2002:a05:6870:a905:b0:260:eae3:5ec2 with SMTP id
 586e51a60fabf-28ccb4a44e1mr3290232fac.26.1729702168925; Wed, 23 Oct 2024
 09:49:28 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Oct 2024 12:49:28 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241021-crimson-translate-291eaba4e640@spud>
References: <20241020134959.519462-1-guodong@riscstar.com> <20241020134959.519462-4-guodong@riscstar.com>
 <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
 <20241021-unroll-empower-3ab903615d6d@spud> <c048d270-7a07-4807-b816-0f4e0aeb67f7@kernel.org>
 <2b449955-6596-4c9a-9799-f15d186e260f@riscstar.com> <20241021-crimson-translate-291eaba4e640@spud>
Mime-Version: 1.0
Date: Wed, 23 Oct 2024 12:49:28 -0400
Message-ID: <CAJM55Z_jp7ZGUcV=4Ciq0ZMPbrf_YARpSDwWgxBa9OjbYzhiFw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
To: Conor Dooley <conor@kernel.org>, Alex Elder <elder@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, 
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, linux@frame.work, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_094934_321516_AB7B3CDD 
X-CRM114-Status: GOOD (  29.38  )
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

Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 08:44:16AM -0500, Alex Elder wrote:
> > On 10/21/24 7:47 AM, Krzysztof Kozlowski wrote:
> > > On 21/10/2024 13:16, Conor Dooley wrote:
> > > > On Mon, Oct 21, 2024 at 09:17:59AM +0200, Krzysztof Kozlowski wrote:
> > > > > On Sun, Oct 20, 2024 at 09:49:59PM +0800, Guodong Xu wrote:
> > > > > > From: Sandie Cao <sandie.cao@deepcomputing.io>
> > > > > > +&camss {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&csi2rx {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > >
> > > > You can drop these two, I marked them disabled in the common file
> > > > earlier this week.
> > > > 1
> > > > > > +
> > > > > > +&gmac0 {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&i2c0 {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&pwm {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&pwmdac {
> > > > > > +	status = "disabled";
> > > > > > +};
> > > > > > +
> > > > > > +&spi0 {
> > > > > > +	status = "disabled";
> > > > >
> > > > > If your board has to disable all these, then they should not have been
> > > > > enabled in DTSI in the first place. Only blocks present and working in
> > > > > the SoC (without amny external needs) should be enabled.
> > > > >
> > > > > I suggest to fix that aspect first.
> > > >
> > > > Eh, I don't think I agree. Having 5 disables here is a lesser evil than
> > > > reproducing 90% of jh7110-common.dtsi or shunting a bunch of stuff
> > > > around. Emil?
> > >
> > > Why reproducing 90%? Only enable would be here, no? Or you want to say
> > > the common DTSI has things which do not exist?
> >
> > For what it's worth, I agree with Krzysztof.  In the (long) cover
> > page we pointed this out, and offered to do it in a followup patch.
> > But if requested we can do it now.
> >
> > So in v6, a new patch would be inserted before the other three,
> > and it would:
> > - Remove the status = "okay" lines for those nodes that are not enabled
> >   in this new platform, in "jh7110-common.dtsi"
> > - Add nodes where appropriate in:
> >     jh7110-milkv-mars.dts
> >     jh7110-pine64-star64.dts
> >     jh7110-starfive-visionfive-2.dtsi
> >   They'll look like this, to enable the ones disabled above, e.g.:
> >     &gmac0 {
> >         status = "okay";
> >     };
> >
> >     &i2c0 {
> >         status = "okay";
> >     };
> >
> > You guys should come to agreement, but I do think what Krzysztof says
> > is the right approach.  And unless convinced otherwise, this will be
> > what shows up in the next version of this series.
>
> Ultimately, it is up to Emil how he wants these laid out.

Thanks, but I agree. Please begin with a patch moving the nodes that are no
longer common out of jh7110-common.dtsi and into the vf2, mars and pine64
consumers. You should probably do the same with the &usb0 node instead
of overriding the dr_mode property.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
