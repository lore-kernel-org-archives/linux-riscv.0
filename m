Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145FDC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 03:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE52921479
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 03:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtGp8w8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Tip/FqOi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE52921479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KauXALcO7EVj4TmpWhwmjCu3fFFajEhsyld1dGdDUg=; b=qtGp8w8SIn2I49
	R7zhYmPP4sKD6unr2lheXlFlDPIVl7yvmIXSb0IBzhtnYLzGJ5x45egdDVo7ijdsmmA0vKx3K6i4k
	RenHpy9mZxLoNI3aN68wOPTU6UaUd5RCO359Gg7jOL6PJ9eqPjePcED+xQaqQOUvEp3bf5GNxKYDm
	05jKAkxLs/EbkMrGKj+PX7D4QBdwDhI8aZbfvm9mNtHpxIxK0QyJNI0r1WfZV4wVQo4eHYu/nlTeS
	VapgXLEYn1ELtMLa2DlW8us1UjkGrgWkINALzW04Y1xhVzj9PkX2kv98X8P/g2g8AE0Knlq6D/Xup
	2ZCVIZrk/Bf2w5W8qudA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSvm1-0000hs-VB; Tue, 21 May 2019 03:49:09 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSvly-0000hB-UU
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 03:49:08 +0000
Received: by mail-vk1-xa44.google.com with SMTP id v140so4442002vkd.7
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 20:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1VJfytKtR9301TV4yIigfBHhzzdmP/kCJaWly5NeECw=;
 b=Tip/FqOiERotBvWP2/5JdfK5MKgkhbOetw5IpnGG6GB1rCsnDF4eLROn4GeoYTMCSg
 dEugoOTBsKD2q3zQZ3GPRZMxCRNPWm7AA811r/wN7dy3L+ZGu04kVRLLfu3zStBqr+EV
 HSiqCWR2bmAQpBSUDlTc/RiYF+ctH2wm1aFsi5c3JJ5XrpNTgyjQHbYDOF9r6Va9z6YM
 N94YjJOiv2urqeIs7ORU0FStujqPeKkLb/QcVTJZgoPj7Z4I8GExrb25Ba0XaA1A0KiE
 uztqjl3nwthDFJ0BseEzxoCQ7073q0I1Mi7pPu3O6lAb5EdhVPGK+jC/nitcmkHtsqdr
 j2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1VJfytKtR9301TV4yIigfBHhzzdmP/kCJaWly5NeECw=;
 b=RZzgF5iD/9+AXQnArj8NlsI5XyF2EvuPvlJdr1saFbOB1ALw4jonJ1kfhc30RzIowv
 v9RswRkXqdlIDjOawbhIqepgmDWVm7R2PsBc9pY6vRDgRf96U09VI56dl999Vjn4G0gh
 f8swMEIfO3iTpW3Zl5Nt9kbXsQTWrDhaT13McT4yTU94Vb00sBXwb1COk/+Z224eYwAv
 90VFlgkZH52fMYl0UUw/b15iA5JndtZNE9w09dHZWK5h9Ra9oiTMV66gbG+sBBjV/ASv
 177sWT6oArqP6ZsRqrlFYbf3nLg4IkpCJqCkb2+YdiL1INP3N65+Qovz19GOWmsmOgPk
 /bLQ==
X-Gm-Message-State: APjAAAXcwZCreR7oORW8Hcf3RSlcVOe/MzkQGJavK4D3niiC763Ix8tI
 b53qwpOeEfr14Y5Lp0U/Ne4xijmPZSeXm8GeCS5neA==
X-Google-Smtp-Source: APXvYqwQ65FRNGritwePEx9wWUtaVGZcdGrhdKHmI16kPdoGImAc/AQd+++yJLNFjIZklQ1Umq8LWsXocXHX7KpUscE=
X-Received: by 2002:a1f:ae4b:: with SMTP id x72mr9339745vke.10.1558410545214; 
 Mon, 20 May 2019 20:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
 <1558361478-4381-2-git-send-email-sagar.kadam@sifive.com>
 <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Tue, 21 May 2019 09:18:53 +0530
Message-ID: <CAARK3HkkjOzubSQzHc5aMy8yyZaBwn6AuFJ-yMLdQDK6Vh7vdw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_204907_045814_C50CEDED 
X-CRM114-Status: GOOD (  19.17  )
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
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob,


On Mon, May 20, 2019 at 8:07 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, May 20, 2019 at 9:12 AM Sagar Shrikant Kadam
> <sagar.kadam@sifive.com> wrote:
> >
> > Add FU540-C000 specific device tree bindings to already
> > available i2-ocores file. This device is available on
> > HiFive Unleashed Rev A00 board. Move interrupt and interrupt
> > parents under optional property list as these can be optional.
> >
> > The FU540-C000 SoC from sifive, has an Opencore's I2C block
> > reimplementation.
> >
> > The DT compatibility string for this IP is present in HDL and available at.
> > https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > index 17bef9a..b73960e 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -2,8 +2,11 @@ Device tree configuration for i2c-ocores
> >
> >  Required properties:
> >  - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +                    "sifive,fu540-c000-i2c" or "sifive,i2c0".
>
> It's not an OR because both are required. Please reformat to 1 valid
> combination per line.
Yes, will rectify it in V6.

> > +                   for Opencore based I2C IP block reimplemented in
> > +                   FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
> > +                   for additional details.
> >  - reg             : bus address start and address range size of device
> > -- interrupts      : interrupt number
> >  - clocks          : handle to the controller clock; see the note below.
> >                      Mutually exclusive with opencores,ip-clock-frequency
> >  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> > @@ -12,6 +15,8 @@ Required properties:
> >  - #size-cells     : should be <0>
> >
> >  Optional properties:
> > +- interrupt-parent: handle to interrupt controller.
>
> Drop this. interrupt-parent is implied.
>
Sure, will exclude it in v6.

> > +- interrupts      : interrupt number.
> >  - clock-frequency : frequency of bus clock in Hz; see the note below.
> >                      Defaults to 100 KHz when the property is not specified
> >  - reg-shift       : device register offsets are shifted by this value
> > --
> > 1.9.1
> >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks,
Sagar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
