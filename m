Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8628CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeonK6v7CAGZR2KZWpim5a2juZxoB0eO4D4cIynv7UI=; b=czD7sWI39UKm+P
	0zukx5FsoTilYPirnuxBT/zQpEYnk1WDcptBT/b480Juj2pFELSm4sU35cRus4+aOx6beSLtoEV21
	wPM/U5z7kLkZs+Za0yOd3UvPBjQorspiEO9CfEod9FnJcJMSUbV3EZU7PkAjwGnaqtb0Adzu2OfUJ
	vI+M9wpBLhlNTFhTBEzNP39lOU/04d+cwrJbHLKoaCSfbIeYySnPZAuLb9Fhki0eyD1fTdSOaarHq
	LGLzXaueu7VEuPCicGg2OiW8v2qr6V5S2vhTx4tc4pmjFgKF9fZUftqj9fbv8YQwOIpd6shAUqmYk
	rQfnXDIhY3dzKBTTp9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFn2-00000005sdi-1uOb;
	Fri, 08 May 2026 07:38:28 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFmy-00000005saH-3U25
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 07:38:26 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so3441580a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 00:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225902; cv=none;
        d=google.com; s=arc-20240605;
        b=JSqR0Bwn0odHNw8CPWq6iPf7x1KglQNkoox3Pj2ZhMePk4hf23XytiVuJ13OyqSmer
         GXueW4GkQq+KlbBel/L2aUhMZHTUoAhUn76O4UWbFScCgHBTvtMKZXoxLJm83ySiKdto
         CWgxwnVoll2EHtAwtUjc3Sdt8ohqarOzlJzcz3rgJOKAwJpHdKgk8lJmyfQpLk0iqFV5
         9YB8gAnI6iVbOHQD7/5eYxV1hNMdPpnDDfVUhWSswgf2WGw86q10YGZWlS2m1zqzavru
         0CULfjIf8EsbnnDvB++zGmg7l5OI93i++2kEIJZWvD386v2sXjBnjKzRuLmq8db9LAMM
         X+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        fh=KdYhm9CrslAROIl9kwzEON92COyUl/gXLFYVSB6dDWU=;
        b=RaadAoBNYCL75+J2z0XVuRaBKqs3184H4vZsG8FofbJJYSxAf0bOYTs4ONgoC9ruFc
         M7pbavLWPMkD1AO7swQynKDwWP/Y4D/nmfob6ej8OI4KJn0b1iaOW/6lsi871yKzh3+P
         55nXU+yGhu4A8k6jKqO5crUi4ri3HkGbJGbgRdaVMlB/duJlyJ9R92KnZAtkpKBMUbaW
         edCg6ipi5Skw77ffAlTN5qzB00S+AN7FeK5cVCcIxrObCLsF0y71mXowd7xZ42aie5kW
         iJLD/bGPppnxhiVjdDI0WsGVHoGNx9rwz06Q3P7Y45R2AW4p8MnObq1lPa++cUtXk+PX
         L7BA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225902; x=1778830702; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=PLim39ykg+tw1yC7VC6sGI2Bnjg1/Idswt3x0eUfdbtL1fwCBwROawRkevShJddsam
         MMCAD5iz2w+rHLLYZ98ecPlx8HpZz5wppu+D7eFR0/jkz+H2FV4Z/x8kxpxEG9Ri0Ktr
         tRm22eQonN9oJ+A+RP7Dxj5snPAnTZjMJ3XzeZJ6XfkOE/1MLw4lETm9xH6Tg3CLPfEm
         K7LYAuJ44SVC9e7x8t4wjQM+x1Sfkpvvpa5U14PKZ1oh2n6FOTDBuARJhJnQW0sZn6qF
         seR4Kwy1b2rRSp7fXyb/uCRQ5HBHEeGN2ZoUuBlyn00t0+4alHvV5h6Th2EEqWYiV6Zl
         dZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225902; x=1778830702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=UvmMN6+XAVNmuw8KTWWom1jlpftEvYx+yAu2BvaIU/FRHheuwt9Cx7m9gwGNFn2pA6
         IzG35oy0FvSAYjrrWaaEaqmK3Crr+DISzIlHmsRu6lvvqMpu5sD/IgYZ/vb8iH8tAGC9
         4Z0p0kC8St+/H0kb+0SXSnld4e15qQG2gmesJY7KmB6vFqEgEmB6Mz6bt5P+Yp0OMd+g
         6gV507aRxby7VwQ32pkiHSl7/bZWIcbz5N6+ZiWKGvnb57mrHytOmZnTwkzK2Si7DQoB
         FVsVWOen1RU2rCjrpNypiIF7HxOJc3RQHzvy7Gv5QEWll0N0qy55zmZXph6x4PXFQsiQ
         CVJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aADFgj6QD/JGGjy79q/0+awv60F04+yx9QVFty52yhefrqr27lZeZXA2ZZfvadGbHPwIdan5rU12t8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyImjL5FsfSqZhkSdWkZOsQyW5bH5WeoYjCcQJGWywKug9juXH3
	GMVHxtfoBH3RRuCVAssqxbvME9AvQscU8TsS8lk0PDHA/4nG9sYZ70Z9NkIIJpFa8QTEGe8JkRG
	bdNuEhtbMg6cmWBO6oZKEzkNsN2KEjdc=
X-Gm-Gg: Acq92OGEWGI7u/2PAtTO2mTPy510R6AfsLL7o6tqq0zmfxbfzN04LpBoN2zzaGE+ZAu
	VGzYtGFf/CmggODsOYUplkQEgcXOfoCaFw8gY4ngXOZrVfrX9Al3WuPqDXiEnpeBeCetIE6h1Ye
	jICnfAQpEiff2Qrwd8IKamHR/BPZUYEReTrhdQ6a0twnKw3C472bR66CglYq8hXn4DpRtsFmp6E
	Dx1iDUUrEz8ZVI0udMjAy3LYbYN8B1x8bnt/1SH+nnHyWdqLx9/3gVs1iyYyqI0LZq3PeGhzwdw
	QMsk
X-Received: by 2002:a05:6402:4506:b0:676:5872:c686 with SMTP id
 4fb4d7f45d1cf-67e0dbfa7cfmr2991549a12.2.1778225901513; Fri, 08 May 2026
 00:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-4-linux.amoon@gmail.com> <20260507065002.1883127-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:08:02 +0530
X-Gm-Features: AVHnY4Kd-iqq5DoAuuzBN_ypRWIrf5NA0GuLPJKYH14dL74okotkJ850fDUYxoU
Message-ID: <CANAwSgTyGjGOMaEbwYeu7TX51OtSE0E2T0-ftsvr513J6ANbvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB
 hub power hierarchy
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_003824_885613_9EB4C1E0 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Chukun,

Thanks for your  review comments.

On Thu, 7 May 2026 at 12:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> >       usb3_hub_5v: regulator-usb3-hub-5v {
> >               compatible = "regulator-fixed";
> > -             regulator-name = "USB30_HUB";
> > +             regulator-name = "VCC5V0_HUB";
>
> Suggested changes:
>         vcc5v0_hub: regulator-vcc5v0-hub {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vcc5v0_hub";
>
Ok will update this if there is a positive response.
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
>
> Why always on?
The driver side does not manage enabling / disabling this regulator.
>
> > @@ -361,6 +362,7 @@ &usb_dwc3 {
> >       dr_mode = "host";
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> > +     vbus-supply = <&usb3_hub_5v>;
> >       status = "okay";
>
> This is incorrect. See the previous reply.

I replied in the previous email.

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
