Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A50C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I8onT+XoRaOS1MmElctbFz30KUNR3XdDEsF2aA4FSU8=; b=LgeE3E2s7FuqvDpIrG8l8YfD4g
	JBKvA27s94gqXbiaX97H+8ELtmvmX31P4MMqzFK7VnT7B+AiDk+rwRI4SLbJIOMbBtUPQqzK1g02T
	pgFMafl0XrIPbMcwHuRRdyXPi+XF9av8sgCZgM1jIxILqWzX4lZEKxxV8gK9ECFEkoUyEdV3eZT3F
	1y17dLkBaRGrt6tQkTQtp4VQaShzyBNXt+jyiwXBm546DLuaIn23NlQeFCZzfrSR/LUps7+54Pio8
	uhErv2QnedIIHRXWulvLoECeTZmuQvXu0JGLGpo+5xuuCK4SJIMhPbdeuunoKcENY867H+MxB8oob
	GUbgoq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZhz-00000000u9S-0wt3;
	Thu, 15 May 2025 14:37:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZVI-00000000sLT-44gH
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 14:24:10 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 925743F37D
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747319044;
	bh=xlwQ+aA+muSzpaYiE0SvHYS1AnyEjU4h0g/olbACMZ4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=VS+BT1qklvjmbZoYginr9JGhwH1v/JeFE+etjPy+OxXOPZP3To8fi7MOaCIkt6iEp
	 tKqEH1COkpFtt0lzGVEmp873IbAsUQN9ISgNZS6J1r6EerFg7kW1LqdVxVfwXiTK3R
	 lD2mlK00A2jKSkdOVh8H82wVIwYq51pxP6CkyVVxXxk7CKF9VYsEqI/QntkUDu5TZv
	 obmpTFtTIfllYui+qw4ZE3bC0QXaNQuqERd+cSIxLvGcNG4GXQnXgSyVI9PJG2fq2p
	 pa7iP6kXjNmjDiFeYFVRpPhjwKboqIIrxZ9YS2PYqWI4Ne7tLdzd4f9EcTfL3OSwkm
	 /B8Frl8EUs2dw==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-606729fa876so1923593eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319042; x=1747923842;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlwQ+aA+muSzpaYiE0SvHYS1AnyEjU4h0g/olbACMZ4=;
        b=TeSGBc2NxqxrgqQb3pg4UlvwRJ0i76qQyuYabbwnP7uuXk3/0Nmwe4e5OAl1xIDx1C
         +GenTR8PkU4eciTD2P7xPJit8GxQzgkj147CrH++LY6isdpclzw5gq36In+E3wwjWlAF
         c7wBZGbkQ9l5Zr50aEefYV4aNFYbXCbFZksio9ZZRInTcz4+Ku05gadVVK8qnmguGjym
         V82zMnsqmnRcdR0wWcLoPTL1R8ekcx/S1I3l6L2/JkC/laxolspWrDChyzp4yVr4cz+5
         rSgRc+lsyazZF8vqdxJYkL1HEwDiQKg4BxOrith6fM2I4CKBFgIZBC+DZ1sjBQznz0T6
         k4bA==
X-Forwarded-Encrypted: i=1; AJvYcCW0BmUMoRNR81WBoyjd7sWspK1PGfQHedbHLkrn0d237UqiSF1V27Vj11WCdQ9BeAyI66m3twHbzbMaag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3zm0QA2f72is72maLfwg2sExyRx1ODz8OcK0GT5w/Qkj6mUFj
	D1gE+ysO4fgNcmqWowY/20q8CBF4OpgFCxOFpGB0Hq1kkv25OKXkkymZvXGCvJLcc0OECsCGaBI
	j477kF7PBAZBcPSiysLtO0l8N1udrAZNJXA7LA4GVrV1XoEdpEfuu0P0zzavHEFHtLL6it4SHEp
	rgbYBu69azZEMTrkOX54CHk6hKBPQVMxmkYbefA6zQ+7wBPcjlVZhZNyrG
X-Gm-Gg: ASbGnctNiB4rmWzDG7AU6OrDOr4Jc0PJenJdqkJqVaBN7o0I820V2sahEb1SSLb3r2x
	pqb/5ttJGqPa11rrjE2f58HXdWQcVp932FFH88G7Ol27JY/U7WNsZfuEk+eXChcuA9ry/AQ==
X-Received: by 2002:a05:6870:e994:b0:2d6:246:dbe0 with SMTP id 586e51a60fabf-2e32b05a78bmr4002230fac.1.1747319042106;
        Thu, 15 May 2025 07:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH68dbr1tbLB515+jsbfah2xc7Zu3SzKVdWkjm3J29LlL6eUYcwXlX8tIrhIm/6dFYUiLHb9w4URfADfddYLgE=
X-Received: by 2002:a05:6870:e994:b0:2d6:246:dbe0 with SMTP id
 586e51a60fabf-2e32b05a78bmr4002200fac.1.1747319041629; Thu, 15 May 2025
 07:24:01 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 07:24:00 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 07:24:00 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io> <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
Mime-Version: 1.0
Date: Thu, 15 May 2025 07:24:00 -0700
X-Gm-Features: AX0GCFsniAbL8_iKhnPgXtKsmiLymV-zKuO-sYpzDWWvy82kMaCJo5ZnWZlRl1A
Message-ID: <CAJM55Z8J49VBr0WWcwBJvDnxnfX2UjGcC5egqjNu-oqqAjHcnA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0 port
To: Conor Dooley <conor@kernel.org>, Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_072409_326651_E154AD20 
X-CRM114-Status: GOOD (  13.89  )
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
> On Mon, Mar 24, 2025 at 10:09:58AM +0800, Sandie Cao wrote:
> > Add usb_cdns3 and usb0_pins configuration to support super speed USB
> > device on the FML13V01 board.
> >
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>
> Emil, can I grab this one?

Yes, please do.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> > ---
> >
> > Changes in v2:
> > - Remove space to pass checkpatch.pl.
> > - Add usb0_pins and pass test on board.
> >
> >  .../jh7110-deepcomputing-fml13v01.dts         | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > index 8d9ce8b69a71..f2857d021d68 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > @@ -43,9 +43,28 @@ GPOEN_DISABLE,
> >  			slew-rate = <0>;
> >  		};
> >  	};
> > +
> > +	usb0_pins: usb0-0 {
> > +		vbus-pins {
> > +			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> > +					       GPOEN_ENABLE,
> > +					       GPI_NONE)>;
> > +			bias-disable;
> > +			input-disable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +	};
> >  };
> >
> >  &usb0 {
> >  	dr_mode = "host";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&usb0_pins>;
> >  	status = "okay";
> >  };
> > +
> > +&usb_cdns3 {
> > +	phys = <&usbphy0>, <&pciephy0>;
> > +	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
> > +};
> >
> > base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
> > --
> > 2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
