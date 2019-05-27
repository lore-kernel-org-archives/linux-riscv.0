Return-Path: <SRS0=3PCL=T3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4FBC07542
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 May 2019 13:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431752075E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 May 2019 13:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cekdPhlo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BbvtYWZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 431752075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4dkZFHkvWUMbtZri/JMx5qh9ftkgFYHVD5uvtxTRQo=; b=cekdPhlokB41bY
	/mhpmIRVpiPVesCwllDqLXIsXCZq2iAblZk1kjTtL60Qt3LavQNc5wnhq1Fu1IZVhb4yNdVNQkkgs
	dFbrfsSzCsrKxIEIg5zl3DQOQ9PxLO1SMIZgZvTwlJC/e7Lz0sQi8nwa6dlTw/Fxr8TOeUrH7AhbU
	r2VZxT1GjIK+UMW+FgPJ0zIgYifmzB6rBo8LsQ4FG0ZViPXgFw1xiVwuBscbhL85qDyG89zjtv/2c
	UUxM7YACtzenNwt+udKL4/ep7WgdKmJ1jvxxYkN9iqyiwVfuk460YpX/YtYs/FDLwDecYM18M2mxW
	t8njVBbqzy/0eFCoFa6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFdU-0006nm-Sg; Mon, 27 May 2019 13:25:56 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFdR-0006ms-NU
 for linux-riscv@lists.infradead.org; Mon, 27 May 2019 13:25:55 +0000
Received: by mail-vs1-xe42.google.com with SMTP id k187so10506544vsk.12
 for <linux-riscv@lists.infradead.org>; Mon, 27 May 2019 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TnqAkKZ/K76fAJWhEEPhgphkdIHfqKGIyyQzSf7jGME=;
 b=BbvtYWZg5ZkOTgXuU5uOKiPR9P+u1cNbjMcHQ0bPb8azbm/FfT4yBlauUVp3em1+1j
 WZu5L2UC9NKmnUmn7T7BTBAkJkeohU1meVLncwtcXjZrLZoknxGGqRxPxtBjRmJLoFoP
 i3PW+wuEJ4ShMtK0rWFE0ub1VEasVVK0DhewCXLc3hefACh3/1FYsoXBXrva2Azu8hRm
 63DpSp63Q2YukGWqGo/GUAUWjYsFjdj0kbxyGZ1jOfCgwHmbAbV9s4XNQJQLVRBKGMUS
 BpJqJsQk397yx+u6FjnmkEcDWJpZPd2qe7q/l06gW94TTsb9RmCOS5IFXIpZpnE2Sd2F
 RNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TnqAkKZ/K76fAJWhEEPhgphkdIHfqKGIyyQzSf7jGME=;
 b=ZZvYmWPGgsfFvpknDQ0fHkvoAhWH/D1OnftT2kLZfN1n55iN/jFRYxDQHKvLrnitcO
 UwS1VPYWeM+m42QAQeTVjvFjUEw9O11Z63J2Y9W6JR4QMds/lzHNx5QWJJBgios14UGV
 UQW9YizFXdQIauiASmRmqNZOttojsk7iFDjsuAQgL9ooRg/21vZYLNvlTAOYC2tPVdrf
 GZP8dJXHhx87cvd2CsUqznsWK/eZ0bxIs2876k3hDsypI76bBzy7y9ntzshxdbkwapo9
 7tj2rXjvBj7Gw9X3/iB/rIs+reeUO/+VDzqLBaxJW2xiq6SNW7RTYnan44ccLfd/7PIZ
 5f3w==
X-Gm-Message-State: APjAAAWNDiD2cGuKfEFUud6ckl770BQiHC0PxMyPbTUFK7dKw47sR2pf
 INBMPtU3JtflW9l/PmntXnHe1KmyA/VeUSNA2H3TUQ==
X-Google-Smtp-Source: APXvYqy4tUwxlDxM4P+E2AZD0QtkW0gxj57YCASYDfSgwOAeG101rQ0S+ov4VOwe/SZeF71qMCMhrXm9O39FqYVPGhM=
X-Received: by 2002:a67:f057:: with SMTP id q23mr57437576vsm.116.1558963552162; 
 Mon, 27 May 2019 06:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-2-git-send-email-sagar.kadam@sifive.com>
 <20190524204012.GA2580@bogus>
In-Reply-To: <20190524204012.GA2580@bogus>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 27 May 2019 18:55:41 +0530
Message-ID: <CAARK3H=qGkKodSdMe+e9N6A-t1cZoiJLatZfcv+A1G1Zuw5VVQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062553_790587_BCF071DF 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 peter@korsgaard.com, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Sat, May 25, 2019 at 2:10 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 22, 2019 at 02:29:32PM +0530, Sagar Shrikant Kadam wrote:
> > Reformatted compatibility strings to one valid combination on
> > each line.
> > Add FU540-C000 specific device tree bindings to already available
> > i2-ocores file. This device is available on
> > HiFive Unleashed Rev A00 board. Move interrupt under optional
> > property list as this can be optional.
> >
> > The FU540-C000 SoC from sifive, has an Opencore's I2C block
> > reimplementation.
> >
> > The DT compatibility string for this IP is present in HDL and available at.
> > https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > index 17bef9a..db96951 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -1,9 +1,13 @@
> >  Device tree configuration for i2c-ocores
> >
> >  Required properties:
> > -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +- compatible      : "opencores,i2c-ocores",
> > +                    "aeroflexgaisler,i2cmst",
> > +                    "sifive,fu540-c000-i2c","sifive,i2c0".
>
> space needed                                   ^
>
> And drop the end of line commas and period.
>
>
> > +                    For Opencore based I2C IP block reimplemented in
> > +                    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
>
> And here too.
>
> And 'refer to'
I will incorporate the changes you have suggested.

Thanks,
Sagar Kadam
>
> > +                    for additional details.
> >  - reg             : bus address start and address range size of device
> > -- interrupts      : interrupt number
> >  - clocks          : handle to the controller clock; see the note below.
> >                      Mutually exclusive with opencores,ip-clock-frequency
> >  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> > @@ -12,6 +16,7 @@ Required properties:
> >  - #size-cells     : should be <0>
> >
> >  Optional properties:
> > +- interrupts      : interrupt number.
> >  - clock-frequency : frequency of bus clock in Hz; see the note below.
> >                      Defaults to 100 KHz when the property is not specified
> >  - reg-shift       : device register offsets are shifted by this value
> > --
> > 1.9.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
